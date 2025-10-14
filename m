Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CA8CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1i7iqUxmgg/DXwXQpNr1KmCqr3Rj4mhCflPyxgc9Us=; b=F6JHA7SJ+3ek5rL/OfFqCJuvDO
	w0SmfpWtxyAjBO0lvEf968NhE+/mNg3BJ2iPnlrM8vZV2b446VeN45oDiYpln6qkHc806nV7UfGtz
	Nnvx493TkxvHkQt7BAF+0giJUQnO6zxOTD4gcPtOleDI7w1Onr1Qy8TmHkaVtg/A4RLxd7J0UGi3S
	z5RU6WVLScxqOfjp/kazlLWg7Dz2LkN7c6ssEmNx0ysXf/91DRsCC57GtH6YloWbg07GmCbtZSCVH
	oedGMxB27BiXTIxc8oOa+DF/KwRqY3vdUR1ka7spfullsXs9eiw5h+HRnE6y+7J4xS3G3BK11HEFR
	Sbl00ESA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gaZ-0000000GjM9-36sq;
	Tue, 14 Oct 2025 15:05:23 +0000
Received: from mail-pj1-f46.google.com ([209.85.216.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gaW-0000000GjHR-2yad
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:05:21 +0000
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so4240026a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 08:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454319; x=1761059119; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1i7iqUxmgg/DXwXQpNr1KmCqr3Rj4mhCflPyxgc9Us=;
        b=B8IbNdC3mcvUd2bQdHCczw8cb+D1hnqeSCXtSW/IfpX/ayer/aXsT8RCs3l0MFItsM
         OHV/DTrr9YxCpOCpBiV1IXF7xiyiOFscGa4Nk/YBgOsGf+tOyhdcrgwj+rDA0kMZWrhE
         i98Bh//j/RaOc+LFzJCdoHLt/6brQj8+cM77qk9VaX3KK5aUpcx+h64SbVTo9NlAeSly
         OE9y/222I+68/10k81Kgw2bzKYU5kvJrNNUcLWmwS2/+VjlFMYS2v7IT1chI96tEv+r2
         wW5h955A8FC5EjsGxj3aI0HSAH8lBE7gD7CbYFEg8X9G7D7d+EXLKWqUYFhg1/EfQE3c
         5Otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454319; x=1761059119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1i7iqUxmgg/DXwXQpNr1KmCqr3Rj4mhCflPyxgc9Us=;
        b=smJnsTdQHW/02VyD6iZcWsCEu/G4eC0rVM4SIro9gctz6PsvHOq7AhMyL8s81RFUlE
         t7JuzzDFdQn6FEgHcMANqM+qzdwXZnD9/Nre2iSg5YUL9jTKtZWf1bpieU+Q/0FhquFL
         Zz0CSDgataDarCknJDkPiSNFIlM4lSNL3nGmpf9d4RTW9nN77pXb5jHaVdQYE3dTX2VD
         YN54bSh8qUozidFUWVsdk/eFv8BYLQ+4i7lbWhDnVHJWh3RdbPpJiJQGLRTiSAVq1vd6
         +2VN6cOtVDmX4sEU5v9uievFJpp+omt9ojmHtW+lY1FhdueyoEvjLfEino5cmDfl+Cow
         lAXA==
X-Forwarded-Encrypted: i=1; AJvYcCXwgeO+K81Ky7mU2L099fX2e/TmYAShjULRncPFAqyvekr78VGZfx08w34BhVIZP/zQWD35DXQVSy/lpCYZunOe@lists.infradead.org
X-Gm-Message-State: AOJu0YzFIJP+4ILaLSGEA9mWC5zlUfQOcPmNwtkOpEJpKY1G1Eyz2efG
	9eqD4jw97tSgD6yaorrN+IIR7QA5nuyPBIbrYda5fwoocd0QbM+1dWIO
X-Gm-Gg: ASbGnctD06jVBWHZIi7crqjd7+r0LWQeyVLHQtefdUJrhnvq0kUURJRk2odNBAaz9Dd
	6609b3Ysqc0YzkzAD1IRg3foNCNsyLK8uWwSHx7zsclph4G1SWsJ9GUgWGXak2SFLkTw4yFACgp
	1xi85oR0FIZLeUvjOelWm/b95juMkiQntBSWIvkjne0LhnLIZ7KJlyW6rxiJd2ARh+HaqyxqylI
	L9H6UqT2ryPcXiknCbwuKCNo9w4CnvPd74yc8wBIozgDKoO8vPLjg7FOzKcYJ+ReAlFd0uEOkxI
	RI5GKNeR/2uXFN0frYCIs+pM8h9sHUMVn3mW5oaMcEy+swcbrJSuZ9jWhlGHWzCDox+/vmCmRpu
	ibxYlR1pwwGskpvHIdiMRZZAAv+7NTGfMyEqXeYiiJ9Dw8tOTGE1TDQ==
X-Google-Smtp-Source: AGHT+IGxU1aUYANixpQW6+RfJwrDQsy0lpaNBp+StZI5SmcT71Y9IkZbC/eBjms/hpV0Ia1TiVCOIQ==
X-Received: by 2002:a17:90b:1c81:b0:330:7a11:f111 with SMTP id 98e67ed59e1d1-33b513be2c9mr33511721a91.35.1760454319490;
        Tue, 14 Oct 2025 08:05:19 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:05:19 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:50 +0800
Subject: [PATCH RESEND v8 17/21] arm64: dts: apple: s8001: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-17-3f94d4a2a285@gmail.com>
References: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
In-Reply-To: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=q41LAG04mQN+h/yjsDMGUnk4+iW5c6zrOTH+jcEbjrs=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZuq26ljD+z+Y6MIqkOiTRV6L4Hn+JOROQ9G
 KHaTtZDhTiJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbgAKCRABygi3psUI
 JAyjD/wPsIPDTqdU23/DJv1noYw4bjYDPRNP+6mTAR6BfTFdSrVMb87GTXJiFVLJA/BdtCdKYUE
 G7yhhrNCrXaschGxzuQ8ryViFpkYgEEZvKlUWMpqBfhaoK0OO66J+qne8ZNvAShnVwoXXLZauBx
 rajcv0TGz6krDyTimriCyB4cbKzvB4Q7pgyz0MdtaH0JTRWxODkrZh//gPjVdYy4TNPmnlSGsEf
 WVYVHhLdKOQZAXRDXqRwIJWugYgYKodtn7P+0aEYAUBv8sTQ8MqprSnglNZBfnNHhxp2hTE5id2
 PeuQQ+nV2v05y5J3A20srKU1MBsNZzXCq3zKuSUzlPQADPsNJXSdLOmfBF7qhDKJjaDRMpu7VMc
 cHZJnplzhOz4tRc3u39wPE4Uby3q8ks/mDy4s1HzaGwkFt0IQeXIdWe/pwuK3s0gnEtFkkGZboI
 ZPRpXp3D27UByUNRylPxQ6mcnqFIKExaekyf+oL30EpcEruYJif8e0jpYzxWVg5kg4je0eMs/Ms
 EcMDV2RTzujgVfyFjFZkL8uFEEdwNaLEFB7semPfrdcEUKE71Un8A+qjevZfDxfV3Xpw/XVQL9S
 IJRRkb1FohBVPqW0Hz0odA6o7Owk8RluXHygcYYAr3Wnxq3Z7dlrHRP/vBjweGnxtwBWToOGDm9
 R0So6USZLiD2QLQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_080520_832018_74E67CB2 
X-CRM114-Status: GOOD (  10.26  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add CPU PMU nodes for Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index fee3507658948a9b4db6a185665fdff9f5acc446..ee2702fc807b678023915f72b5276cc5a31e1222 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -222,6 +222,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s8001-pmgr.dtsi"

-- 
2.51.0



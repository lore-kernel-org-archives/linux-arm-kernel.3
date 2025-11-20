Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D141CF64BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 05:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHVbT19SoV5m4YcosKHhTcv+qnuVQe5xO2ZctZWhciE=; b=lY2gXGQ0k5RjFBLmEkcpWbEUSy
	/ORozGHhUsPFRbVryo15+LPVmcyCDqs93JinjOqkWlrbF98CUm9HQvrUbh2V5qhAMbTBVEneyDNoK
	N8zOa3ANxclDmHGK8NVCLXajFnNhO0VGrIdgO+VaKkbEMcUkuZJSjnMstbb/DQPHon9pxkJEdWVLY
	WLkasWf7JBvPjIWMsGWXxi+/CmT2uZixbgPfgy43wY3pIwXV0JeCBemOm2XFcoSVd0HvBA0DS/UTV
	d7jPKBLUsTHGp/5uunOZP8S0Gtpjhdgh0aVFZIlsgNNiilLmfzYlg9ZdxbdgKKW3XGCXEPfoKm2tH
	Sz75lJww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLxBS-00000006B6x-03cb;
	Thu, 20 Nov 2025 05:26:18 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLxBN-00000006B4S-33bV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 05:26:16 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3436d6ca17bso456645a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 21:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763616373; x=1764221173; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHVbT19SoV5m4YcosKHhTcv+qnuVQe5xO2ZctZWhciE=;
        b=Oxj+FjCBJkq9X3zLN5AM6RYRoh2Z572AYv/tcV6PjrM5plkgjtPO6+nWTp+/k8tt1l
         N4sM4hfPLWBEyP37J/nYlje8ottrmxRuutTRKAwHnRMxpqwTM3Id9ZDbZixJxo97HrNg
         iwnmWusCxL/EwsQnrYjJWbIjvSxYIRJ92NyzT1FLzgX76K+z+z43ZU2fCCIEPgoMraU1
         oMAvXQjrSmKOz4SFa+/cE/x6ObIHlQoHKEWQXdBYrEI8MM+ccwrrWPSMfwmBEetE/RxG
         yf6cHvfG7TGkK+c3ee6K1LE3k5P0nnD078JE1fk7hCog9doWFUT8IpWpU5MBu90BHs5Y
         SXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763616373; x=1764221173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CHVbT19SoV5m4YcosKHhTcv+qnuVQe5xO2ZctZWhciE=;
        b=jUsaEGC2bw1VnIy88TsYposLKxcB0FPyNpmAwWUOB3+sZV1DH3dMyghOOy2wiafAHc
         M/DCTB/XNcvC0D1bC2Wyz6vn1gNS3r8+nW2Sc1Q2cpPcYbhlr4zVSiaAA57wpxVQ0UTp
         G84KyCk6b35VH7wVpxnHxnJ4sYB2rk1soSK+Ui4bTGqHn59Ue9zxldhhmswIfIDfvMbb
         z90oe8FGbv25FNAbN69dvG1jGa0me+wylcw34OFacz3PD1chO54FM+1Pg0nCQwCEDbqd
         FLjfK0kdA/ByI8zGXiNh7l3w993hW/Fhcblq+ByHirSH+aj/+GdlNuaify2IsuutsW4R
         kjCw==
X-Forwarded-Encrypted: i=1; AJvYcCUFeHYCSEqRwP9kZG8uTfB3WThTASr0cQIOVonH7ujGFNfdt6jKVsG1PJLcHM2Fx95lKk5rcXoTaf4ZZpmu+Uf+@lists.infradead.org
X-Gm-Message-State: AOJu0YwG3WojoGXEZVkgR8wJhyFZtgceQmVmcnE9CX6nustKh55ZTGmw
	/ECBGCqM4dBVTr+S9rYQsFyLl1kX5AjPJRuMfDzV4Ush4nWCqLu82FvV
X-Gm-Gg: ASbGncvozTtp+0/s4IL3UHzzioHJFEqY0O05S0VZqFouTcca4mgn+j5LHP19MGb+d1X
	StahA5ul2PhWxUvKNHDpfKINk6VtC+y2KbI74/W56IkLDH6U368NA+lsy6rJf5m0JUyyN6sFVmC
	31zGNz8nefS3ruzgME4Vx7Ca0P21SLBGzAt3DUedY+tAKpI0efmpdIeElo7RuRO3rcXrjPhVCd0
	CoYfnSXU7JRe3BZuoqtHP46INAG+i0ypRbhUnN8B5sfyx5pbjvR73xe05gy+mOMgccHIgI1cNzF
	96NQzF4S/o9jOcZ/+JX8IUXXXU3kK+1PSZZsXkUNqCjZp1l9XykvBYfv/6wkJba3nBc2o5ssLaR
	o0iD+w0ZCbHN359FoUL8pJ8EMCpLuajvnuHJpUcjhztAGaX6byfWmCVXWwpEOkvaIR79O1EUzuJ
	GfUavKd5Kz+S0IEnngSo3iUOdyr9WOPoQRyNBXJiPQVpQApR4Yn2Ibrb5WEVdpy3XwnkGqIMUo3
	UKCPktatwjOM5MDwpL8AKhW1JaQbJSP2Z25KBwpB+UUcrxkxCWAsVLdmk5rjxtKMUwUZMn/LBPR
	aLHlE1mNqe0=
X-Google-Smtp-Source: AGHT+IFTkKnaXX3mEE8uWZI9hhFIJprQn8F9I4uiRfBPyyrkdGyhKEiuIVDjxchbmW3f3duBD7XsUQ==
X-Received: by 2002:a17:90b:4f8a:b0:340:a1a8:eb87 with SMTP id 98e67ed59e1d1-3472854a5acmr2109339a91.35.1763616372885;
        Wed, 19 Nov 2025 21:26:12 -0800 (PST)
Received: from 2001-b400-e301-38bf-be0d-b72c-6bec-2812.emome-ip6.hinet.net (2001-b400-e301-38bf-be0d-b72c-6bec-2812.emome-ip6.hinet.net. [2001:b400:e301:38bf:be0d:b72c:6bec:2812])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472692e5d3sm1221342a91.9.2025.11.19.21.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 21:26:12 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Thu, 20 Nov 2025 13:26:00 +0800
Subject: [PATCH v2 3/4] ARM: dts: aspeed: yosemite5: Rename sgpio
 P0_I3C_APML_ALERT_L
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-yv5_revise_dts-v2-3-4d7de701c5be@gmail.com>
References: <20251120-yv5_revise_dts-v2-0-4d7de701c5be@gmail.com>
In-Reply-To: <20251120-yv5_revise_dts-v2-0-4d7de701c5be@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763616361; l=877;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=OEoDPVAl+S0COKkIlbVNnqQ2XcG7pPYJZgZLJdWqaeM=;
 b=56mR5NirN88VhKgfYg3lzZkIzSyH9L9LfFR/zNUitmcf5rWmUKJgB1m3nxBAw5A7o2smU0F9m
 hrteVwE3trXDBrWcdgKSskOrCSevxTUYmFLubHkec6KGguhR9tf1gAj
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_212614_931133_8F5CBFE2 
X-CRM114-Status: GOOD (  11.49  )
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

Rename P0_I3C_APML_ALERT_L to FM_APML_CPU_ALERT_N for clarity.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 45b8ac2e8c65a4f672e64571631b7f6944f26213..060757b7211a6da777c51d9f0c886796cf2450a4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -964,7 +964,7 @@ &sgpiom0 {
 	"FAULT_P3V3_NIC_N","",
 	"FAULT_P12V_NIC_N","",
 	"FAULT_P12V_SCM_N","",
-	"P0_I3C_APML_ALERT_L","",
+	"FM_APML_CPU_ALERT_N","",
 	"ALERT_INLET_TEMP_N","",
 	"FM_CPU_PROCHOT_R_N","",
 	"FM_CPU_THERMTRIP_N","",

-- 
2.51.2



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED21C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 15:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=; b=n4MYzEmamSZftMfwn2AknwhpYw
	k9vVOPsFIMwtyXsX1pod+imqOiexqNRdXLd32BA4C65wmVJPKxFUjqkYhPMk+nTPOWVvrQBhkwWYJ
	zOXs0bk41mDetIL8AfIpYx/q6hCefGETzsyaPigF6QmLM0eiTAr/TXFkRwaxt8ES08d788+gi/Gr8
	I4m4YYd6GhHnOByvEce5cnxwrYCCalehAa6WvmbNhKY06bciHeUNyCIjB1paWkFBzYY8zX+SyBui4
	EiITikuDQk5uZOrYfJURt0u7FCsm9bDjeyVPsLiVc4A9j9tyd0dVH51u59AxJFLsYN0dQghkBkY4Q
	xHVNalzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDmYU-000000067x4-1LDk;
	Sat, 10 May 2025 15:56:02 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlsS-000000064Ij-2BLo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 15:12:40 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so3202662b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 08:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889956; x=1747494756; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=;
        b=YhaSx3YhYfj97C+jwMfrUpgrbmVVaHMdcX0wSW7OQUwP3kowpCR1JfJh3Ckmb+qG9t
         t1eGumKEnAb8+tFGrK+Y/XkEWYnZns6+mHz3T691yO3oGDst3YMbI5ksQ2y+GcmzlBK/
         in77M24WA7dg1OzilXxMXJsWEF+foF/bgaccDkpu+MIP4szBxz9oVOkkkwF+/bJdJvFU
         2Vj1Y5rm4XexkyXsjbema90vcWfjc34kQf/MNwoljIAmPzJYTfj0psTTTKeqblxj7Gml
         vZiMtqmoKnNh7ixlHv6HwmpIw2K7SFPunofBh5FbzjufqOa3QBhrcxuUIRrwraPQvFay
         rWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889956; x=1747494756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=;
        b=BR7pG4Y0MJWYDL/HP7XyA8PZFIE0PLnvRyCCkJnDfHW/n3iZ288lCFUO0+qJPnoz6s
         pSQTeaJELuiX9hRVMy3xxrF6O3RNAJtsOStMxZSF3luMiaUs9mxsSUODLeXC7TJzYj+I
         m2PmhAOf/csc1StRNZlVFeO0uNcScepfutsvyyAj/bqFROMgdwNWrF5sCZM85kYKQP1J
         ZEJEU5Jq4m/Iz3UnZg6khddam7vdySZL3w7MDbI8sLvWT29sItIkJRUql624H1t0k/wC
         4R8FncHoOoJSiGkaBjrRYIDv+f9QtSJ2faniZmyWy4uZ7+Q84miR41J17mQs663YdFE+
         Of1A==
X-Forwarded-Encrypted: i=1; AJvYcCV9bn+OhUJ6QdZRbM2leDptLA/3BdoWaOXSzT2KT4rrlAkplE4evYo2EeDMzbNNJNaqOSJDTVsbamyObZt+MIjR@lists.infradead.org
X-Gm-Message-State: AOJu0Yys+QtBWZtaT0oBj0auTOCz7M6eQRLyOLWXzYRBEtkK6FBZsz52
	7jGCpe7/fhc8OI5CfYTyahwp3XmnbLE8B2aeq0vgLRv87FTpDVxD
X-Gm-Gg: ASbGncvZWsjAecFsxUF0iit88w7hTJ/kNGwuzKb90lYyS6dr4bWMtwiIW/wVrF3PhIi
	rUlXXt6hU8Et2WaeMGT1LA0+Yn4XYWtgjv4ZJ+JQSEH8i/djtIFSWw5+uurG2Q08pKy0JiFKUfm
	Oc0zK9BY/2wOguCGtsx8OEKbFtp8kpjoQvMfJZutkLOi2gut8cK+T64r6PYE5hNh5HnSVZe9s8a
	ECrVeNFF7A88wIwqRVb/BJ6tFcrjolbaeYw3xXkj/VnrJfYTze92jDv+tQ3f+oQoGjwcD0Ezr2P
	R71C1BpOvaIXxFw9hdzQ+obu8SN877dEdKR8g8aAwj8EVereGHS61g==
X-Google-Smtp-Source: AGHT+IFtT46gV79vplSRnTNjRcV6VyD0gjugvAu28DSlS5zdUyZuWrk5PiENyazvHXLpdDQYOK/V2w==
X-Received: by 2002:a05:6a00:802:b0:736:4110:5579 with SMTP id d2e1a72fcca58-7423bc02f2cmr9779057b3a.2.1746889955645;
        Sat, 10 May 2025 08:12:35 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:12:35 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:11:01 +0800
Subject: [PATCH v7 20/21] arm64: dts: apple: t8012: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-20-bd505cb6c520@gmail.com>
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=iSgQuvf9kmSTE4D2ckw53TzjQOR5RrwNb5r5c6wUTAU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2ycJM0T+aDWIJbJWermJ+AjpVyqLgXvTkY+T
 fMhQWkGt7WJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9snAAKCRABygi3psUI
 JLiMD/45EuS0n/6yTHNsSOa6lVCy/KV6z2Zk4JNxPI37jcvxmnSjlKGwTx7Hrg+1Vg6dzj+YAWq
 1cKhgtT+3dA9YU5NQinJIFf1S/KtAM7uIygOfyT1DaztAxcHNrjlPl32Qsjpz68fUnCWEXRtSb6
 Xb+hX5d77aj5RtYYS5nLzEz/XTmD3Lwm7KpEUrDnSTYtODpTW37DvwZGj47MIkJT1VPM0F2R5kj
 Mh2eLLpScv+GCSU8ONXP7qwbM5/0V1Y2cYHe6gxM21Yhr4cnM00p8VMqjWBDL+cv76tWAD9iFjh
 DiU9NXXHf4vm/ctnYJtOZFuiLTPPkj5qDuFLv0nhwmxGDODZMdnj4fc11E3xjhiNgbH1Thr+QNt
 6qACz4PEEqYYzYX6CynTRmvCsUi2vg/+3DZgXX6q6GMz/zaKqDFNcSpxj8hrp21eF87LuRv8GVt
 /vCqLCT07xCO7GQ1PkC2Buvp0vpIEeLcAz6ohIDaFZhfG5zWBh0xf89GQdHn7OyODh8wIFLsVlc
 Qud81zVKqlZhHuBgJGiE7yG4N19+IF/4ILaQsW76If4YzekV25qOi+QdEDu977V9i8VViPKExdq
 hSU1bXY5WhjXdK7qAq56cVx1sHioZXEa2JeYdEmcQPgbTyi94Ncx+tDGCkzDH0WRf4EzgtTnobv
 2e7IwMvoblab9WA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_081236_564200_0E9560C2 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

Add CPU PMU nodes for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index 42df2f51ad7be4c4533e76d18e49a9a747b6b7a8..d79ed754c68dd89fc8c52887e6dcbbce04fe126b 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -276,6 +276,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8012-pmgr.dtsi"

-- 
2.49.0



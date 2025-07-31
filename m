Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A33C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 14:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLgS03msUmp+vuGwcZngE+sO5Zm7YcN21p+x25WXrLM=; b=Pj+wFc90pCKvpWSm3FXWilOfls
	uZ9m9Sbs9jo0dT3dRKNg4uZE815T3BxOMXNmcXx4VPHcnYBRad3HvGO0K5BIrbAFQtX8sEtkx1DrR
	5IQmW9v8mPkBalEJh/YzjLE3e9FWhwM3U49dyw8uPCl8IKSpXWQ12qaEq3cN+Rig+eNyMtow2UILJ
	PcT776FUOZuUboD1bRnJ/9M99DrnebFkEhRVPSufhIFgqFD8Al4JzHg5MNcmR+TG8segD8YBVxQ+1
	S58a+RoE721Q9mDchdwy8OMppj0Em90MfE2MG81c1v5k8+qfJk4pVliRS2b/6HmyA1HM3KaBZpvJU
	R6eCus/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUTW-00000003sMu-10op;
	Thu, 31 Jul 2025 14:41:42 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTrA-00000003ljU-0cNy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 14:02:05 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b78315ff04so374645f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 07:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753970522; x=1754575322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLgS03msUmp+vuGwcZngE+sO5Zm7YcN21p+x25WXrLM=;
        b=nEYS+OzOl+TghT9m/vqqi++QeDWVgpVgcMF3SNm9aO167E1Mn96AUTJQLV8Zm+QRvC
         z/74hYbIzlQpEFwnt8iSuxLGphrF4OootrjtqcxGNT/UXl502UjeJovkCFXT4MAFujDk
         +sPseZzNldD83k4+7CLu6vOCNcF+2fjN2CAEdAuVn2/UwVeYo4Yt8k80SOA98pjDFNlu
         1GeP0FrgPVx/60D3+0nydVa2Z0oJrF80hT69rF18XygIxcNUYpLJMMkUkOKTg8Acd7H8
         vEYYYx+LzKUq1pAUdhJ8KzCkVWzAr/mYBUPfxne+T/wI9I0in1IcCLzk0CSVLCO2mxhb
         g7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753970522; x=1754575322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLgS03msUmp+vuGwcZngE+sO5Zm7YcN21p+x25WXrLM=;
        b=s24ERkU2+GgaTGwRoZlV1Ny6VMR6dfyoZuLW0ydn0iG+ex7lND08keNpNSWiy2NkkR
         j8/ib1cE4wRhn1j2PogjGr2tbkGL9eUtbwYC7t76yEYnnK9q14j2tdqxfL1e1eArNlan
         A8tzVC6ghvQQJKET+pGDKHN5ODXJeQlCIIWI4C+ccIhtLRPtzDF8PaQtFaW58SqF+dyA
         SD619JCOD99HwfXn9XP+2fgh8jRf4DYdraxdnlEd4uIESO7rrw2zz4+M2Pwvs/I0IjUB
         Lxh4cjIYNDA6nD64zVfBvcW2awGST8CBEsdVmE4RWD1ebjSNXZYfuR2jMoh0aWYZHaDR
         8I+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlVsOLJB+uRcZmhE+Zmrx2EU1r4RGxSGW3ptN1VtFLuwGcZvCqGU2zt2woam6SswrwrxC8ZO2OxJqAg9YA1Hgc@lists.infradead.org
X-Gm-Message-State: AOJu0YxuOaW32Ai4RNn9nx3Xv2qXBBMkxDkAgjM6JdXN433PnulK/jpW
	n+Ft3MK1+KV/qM0Hl4zMdVeGp8WIn2RVqsH7SqO9/SDoUowsizEQ/w+rSK6aJxxYmTA=
X-Gm-Gg: ASbGncse2mCkKrWOBd5eKdzh1+FqH3Yu083VCTK3C1MfVEM7mXRLJPEQZh99Fp+oGSY
	PLQHk2T1soTuxtTVS6xDa7FUW0tlsUfAxdZ3w9wRR5pWwFm2UCtCbrzgyWxr0v47z3qMlzJO7M9
	2SIuH6iZqN+Uu6TvQdyNcLyiUvWSbf+eOG/73nv9uUrqqI2IIssa8slEA3nHYok90AfV1V1YCWB
	VJ8jtPiBXhJThrbrCF9zo3Car6fl7djz1rteZAMIxOUQj/erm87aGKRgl3ZgmW+DolKB78WuLR1
	z4MixwS7SHJ7MOeUPQNsLLbqSQflelR+MJbwppuqZmYZeUwJ9J65UOtZYhofldh+KwYqwH1l687
	TtcmvVH+n7ijhn7gB1bCi+sx1MlPZQrNCf6eyu+hcbTZa22Uv
X-Google-Smtp-Source: AGHT+IHKeZczvelpwGjx/EOADUEZKpoKSKEfhOoz3VFDbeZbEjT91pFxldnpybLu9UgLDOG6DAcA7w==
X-Received: by 2002:a05:6000:401f:b0:3b5:e2ca:1c2 with SMTP id ffacd0b85a97d-3b794fe50b7mr6057814f8f.2.1753970522308;
        Thu, 31 Jul 2025 07:02:02 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57c18sm28121285e9.28.2025.07.31.07.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:02:01 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] arm64: dts: s32g2: Add the Software Timer Watchdog (SWT) nodes
Date: Thu, 31 Jul 2025 16:01:38 +0200
Message-ID: <20250731140146.62960-6-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731140146.62960-1-daniel.lezcano@linaro.org>
References: <20250731140146.62960-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_070204_187172_628C5556 
X-CRM114-Status: GOOD (  11.02  )
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

Referred in the documentation as the Software Timer Watchdog (SWT),
the s32g2 has 7 watchdogs. The number of watchdogs is designed to
allow dedicating one watchdog per Cortex-M7/A53 present on the SoC.

Add the SWT nodes in the device tree.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 56 ++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 1783edb81350..478899d4dd06 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -317,6 +317,38 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		swt0: watchdog@40100000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40100000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt1: watchdog@40104000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40104000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt2: watchdog@40108000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40108000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt3: watchdog@4010c000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x4010c000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
 		stm0: timer@4011c000 {
 			compatible = "nxp,s32g2-stm";
 			reg = <0x4011c000 0x3000>;
@@ -445,6 +477,30 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		swt4: watchdog@40200000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40200000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt5: watchdog@40204000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40204000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt6: watchdog@40208000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40208000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
 		stm4: timer@4021c000 {
 			compatible = "nxp,s32g2-stm";
 			reg = <0x4021c000 0x3000>;
-- 
2.43.0



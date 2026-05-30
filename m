Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D55CD6E54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 16:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5lAYdQwlZ0T0Ie+aG3ceFs/5DSYUa18LTgq9dN2ugk=; b=Xfn7wfASyjnrp6uAH/ooU2t76C
	HJOElKulwiB63bYyrGYD/SDKW+loXTyJyg7P1QfTJEnK0p9icCVBTfOUjD358azGKgR5mHbnK8uYX
	mdFO88ldEgFZX+jVfPj0bVxuvEX3DHiC7mQaf8xlnP/Paq4uwee/RumaQT/mXpKRx4GJzB+ZXQfi/
	zT57INAlQRZvnf3Mpgqz/RkKiHNTBhYGhNX0xZ8iGPc9PE3+qjmBF205FNOD9qpuf6WWcTar1yryG
	bR1KPyFadXphYHOks/h2/hGdOcAGsBHKJaftq3KoRw5YOLQO2lsK+Bi3OYIuMZ1gjWN3Fp2nd4EuE
	0SBKtrkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMDj-00000008uJL-2f4k;
	Sat, 30 May 2026 16:07:31 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMDb-00000008uBw-1Wds
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 16:07:24 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45ef5146b56so837673f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 09:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157242; x=1780762042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5lAYdQwlZ0T0Ie+aG3ceFs/5DSYUa18LTgq9dN2ugk=;
        b=cypWlQ/W1B5kqflMmteJVXq6g9NCJWVk/ZKBmcDURIeIriSwEea7Zli2ZyDZu/M1fz
         wU76+fXeeSUIxOFpS00lKMTiIEK97KYsdyhiMCYhcvad4DHptDJbl0CM3/m3SaWWHj6S
         x+d3ZAF7ri/DnxMNgxSIl4lWEFku+V9OHuajh6Gp0s62g4bk9FiYsqCQH1S2SbUxavsc
         BjjBuRGLIi1uJvFXoPagO3JeT4CWJD2lL+FEUBzAJO89B88uNAHYO6nkOddN+yTHMLq+
         6ZFk1tjclfL5pIwAcQOoLy6hQIWdpYjzWnjxIT/N9A6sfJ16lUk6Y9hyCRAphrdj13fq
         MQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157242; x=1780762042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G5lAYdQwlZ0T0Ie+aG3ceFs/5DSYUa18LTgq9dN2ugk=;
        b=BIJymmYaAbAmX2uaXra4I7DAM/oEaKgJL9qpn2roQUGPpog8N25TEQA54KJ+/VsDnk
         KgJeFHinniV41VD/QteFuyx7JO/Jwam+FEO4dRazDAKwyiA/pK9Fi9zmXteecSSMqYSL
         5/nc5QDFwIiNhRZyNOT6iST+Km8HSO22Fs9npDG8aE/hwVzSndmOUZbd2wGMxodLIJtt
         tR33/yNbnqkySFheANVUHdjhouA6Yp+Bt/VSJiRjNHKYtsUgR9nUpTlzF8C9SCYplDOU
         Cggp0om0pxEFQglrFH8s/OhkGnlOUzxKU2wqExZpa+gUqRVfOBsCPnZsB5v+8vRIyT9n
         0thg==
X-Forwarded-Encrypted: i=1; AFNElJ9UJKU1qpRnQWsBQE3vSdmfAqEp7PCVrFCuvJXLnE6yIel7dxl5nhWyDGCV0lhXAyiVLcmuC9hG3bUzOkHVeuEJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3abqnMNRK90O1cZNCpJdyug2bt07V8axJvPsxQb6Fy35N2DmE
	jbGPJZ7/QMT3XH4KYFl+ApxtsHXE+JKjkA7x2BUm50hTcR9RcmaKkWFq
X-Gm-Gg: Acq92OHn2QvC7J57Yd+6QZAuOnsjLnGHBp9mURQBcDWIOtR3qtwHSS4+b3yMVs1o0Oi
	CIMtmvQmOJI2KQcPgHavkREZnAItYw2ZI1OvkJu1K8QJo01td2rC4aPxO9LKyqCewwTQ3/LWr8n
	K950Gn23r4WgldWf3SYDO/6dQnMP+1MxNjp7sO7qcADiDxFpBysmaa3YEY9S8TBK97wDxclA3DJ
	PRP2mowEct2hfT3YDrHbe1gCtFjl577yfx2erkMQd3yWvr5Lg+dJ39BGYNcm+WdiA2lNcR2XIGV
	e+tqHG89rcVmhL1FcQ/vySjgjfT2YtVww+N1Ayfdd8KL2eKGBdyzgRQC2gNlKdsCiHbepIEgNqy
	fk02UhsnQu9DqMRLZeDZDYomwpagkK5U/eRxcjkcZDc3dt1FvzV2NzIUDlP33tpWS3jM1bBwa5C
	0eM6LLIb32ycw28/V+mqezHkIum8Q=
X-Received: by 2002:a05:6000:4b1a:b0:45e:8526:7dcb with SMTP id ffacd0b85a97d-45ef6e6cca5mr5660776f8f.7.1780157241724;
        Sat, 30 May 2026 09:07:21 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:ea3:3f01:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef32fabcasm11667339f8f.0.2026.05.30.09.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:07:21 -0700 (PDT)
From: Dawid Olesinski <dawidro@gmail.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	heiko@sntech.de
Cc: linux-crypto@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	clabbe@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Dawid Olesinski <dawidro@gmail.com>
Subject: [PATCH 4/4] arm64: dts: rockchip: Add crypto node to rk3588-base
Date: Sat, 30 May 2026 17:06:45 +0100
Message-ID: <20260530160704.3453555-5-dawidro@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260530160704.3453555-1-dawidro@gmail.com>
References: <20260530160704.3453555-1-dawidro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_090723_420210_CA51D85F 
X-CRM114-Status: GOOD (  13.01  )
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

Add the device tree node for the V2 cryptographic hardware accelerator
on RK3588.

On RK3588 the crypto IP sits inside the secure domain controlled by
SECURECRU, a register bank that is exclusively accessible to the
TrustZone firmware (TF-A). Linux must therefore obtain its clocks and
reset line through the ARM SCMI interface provided by the firmware
rather than mapping the CRU registers directly. Attempting direct MMIO
access to SECURECRU from the non-secure world triggers an asynchronous
bus fault.

The interrupt uses the four-cell GICv3 format as required by the RK3588
GIC node definition (the fourth cell is the CPU affinity/partition
specifier; 0 means no affinity constraint).

The node is disabled by default; board files that wish to use hardware
crypto offload must enable it.

Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 4fb8888c281c..4f336741d11f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -2257,6 +2257,18 @@ rng@fe378000 {
 		resets = <&scmi_reset SCMI_SRST_H_TRNG_NS>;
 	};
 
+	crypto: crypto@fe370000 {
+		compatible = "rockchip,rk3588-crypto";
+		reg = <0x0 0xfe370000 0x0 0x2000>;
+		interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&scmi_clk SCMI_CRYPTO_CORE>, <&scmi_clk SCMI_ACLK_SECURE_NS>,
+			 <&scmi_clk SCMI_HCLK_SECURE_NS>;
+		clock-names = "core", "aclk", "hclk";
+		resets = <&scmi_reset SCMI_SRST_CRYPTO_CORE>;
+		reset-names = "core";
+		status = "disabled";
+	};
+
 	i2s0_8ch: i2s@fe470000 {
 		compatible = "rockchip,rk3588-i2s-tdm";
 		reg = <0x0 0xfe470000 0x0 0x1000>;
-- 
2.47.3



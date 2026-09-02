Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3403C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iIzXwSsGWdM/2DswVIkQqllThw6W06XdbG4kX5z46ho=; b=gw86Sug9e1rEP0xqVZrN2crwot
	REJHxPApCV0w+Nekk2LviuOhLiiNnROIZ7fzNEj0PyHmbBOQoA8IY5ayU3ia9H+ul7AvWJQkUU9gz
	On4h+SyZDbpv5tpdp44rekxuDM4rPzEzTLlMrbnY/TF+uKwtoU6YmkldTnn3PDKb5fYRO6utCqGb+
	906juxwahnTkI8Lq7LbQ61oD8nT73m/3CmQpxsQpIhP3Q8SknHbwt0NNLulLuLi3b14C79sp2Fpk5
	Z0utXxBbxtYcyCMZaJKu4wAOddZJoYsZPD24DHUhwuGkkrw3iXcPyLK4nk8SM1tSziI1woC5JiUEy
	sWzrSfBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o3m-0000000FHlH-2x1r;
	Wed, 02 Sep 2026 16:43:38 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o3h-0000000FHhR-22dp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:43:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso9155025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788367411; x=1788972211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iIzXwSsGWdM/2DswVIkQqllThw6W06XdbG4kX5z46ho=;
        b=c6kufDJdnId4ik3Lh6ka+6B7uwqUurz0HwqUKiVOHQYA8tBRYRUO1FS4Bp9P8icXBT
         QjjDMfQALlEUAS4xYcAcRGy2blNanoTW8x5GZ4kCkVwiSeC6SwWM7I8Uj4I9TCx2Kjfy
         0CxUV0moRV5+S1bq9hhC1R9eCSjgsg9MJB4Zp/WngYEcHp69usOOoycxNIZF12xWIKBa
         gw5IL6psyniuTNGdNgDeV1zZoVvWDMzM2WXr3f1uJliCu/yOa170txjC7LQ8EShzg//a
         ZCMTIOsau+Wv4S7+eU1hqMV+Vqbq+b7pHke1RImk1NhAnGWAa19IHTWtfN6dvj5CbL7Z
         ohXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367411; x=1788972211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIzXwSsGWdM/2DswVIkQqllThw6W06XdbG4kX5z46ho=;
        b=fTee+Uejv6MN+WM3JwWJoBghda1ypoirQ81IFSX/0wsbFCsYfm0DroLW+8MJ56bUqc
         Xk6CZdbV0+2JymZ6jg2wdCSoOmUMdQ1Ievfd0K8a1kwujAo/KJ99uqc90cqyoji7JBao
         lHUb+Vig41ZYzyJHy+d8PN/xASpjrbmNcW6WQzOb3ts51i0AWNBeZII8kYy/1GnoZGEb
         Ys78/mfGtQUj3Kz5wZV7Xnube9Y2+4DJrY8ggZbivKDGSEGCVAZyYXU0voNBhD20/lyG
         nv3BUpT0skWQcgBwmuidfzv61Xz+K6+tP3kW9EALSI6wn90XhS3UE9uYnodZSKCHr+R3
         3xfg==
X-Forwarded-Encrypted: i=1; AHgh+RrKUl1WOsCpd+Oz6fo0fZdJyN/bf+B0pgcyCDPK22P1a/dzKFVwC9eJICYW9jGHauVeAnLQcBV1XaqQs/kA7+/2@lists.infradead.org
X-Gm-Message-State: AFuF++mCuX94rJEaYOqQ4ET06+TA8y7+MSOxMOwhAAvpq5T3OGUMxjkY
	WRGkCJd0SHa+7oKQTm2ek53LUZ/0NrxZop5w+21LiO7Xtj9x+WkxXRRf
X-Gm-Gg: AR+sD129Y9ZMHFm4ZmaYRw1xOM+03V+9IR4uqdAWud++lrVWsWD9jvcvoDyy0s3wbtu
	PCU+SloU7ihZjA2ufWqItPGgnSXxLQ4VwhIFwtB8k/XOs0E1bNDQWT2Yc7gb2Ur0Uo5zj6SVhFU
	WwzTfL8Lr3cGEy0mzc4+SRKYYfIgqIW3bibc3tq1Zg7ezRtbbN3u+TsbkAt0ktqBlzzW/JFxdkz
	qcHQU2M2cOf46Np+DqKPmSbi9Q4mF+B54eEkqE7T8h+LTbqdqsWotPwhEtReYYwtYHT1UcR3Rr7
	R4V1AikJo/KGXBEugC+sSD/HNLNHzblgOg7DhGGVH3eQxLavGXkBya4il3QsMkBi9LEJNhN946V
	bPJpbxJTOOwnv3KtJ9YXZadDiW/7jbRbd62zmkMg9imH4UGGY4XjEISipEAMuKRm1OdnGH7BdDp
	bd5vTxlTup/1Q7w30qBXz2YWmFpdRK2A/1hApI1kbexGXBK6ctGoBa0nRnvUogzEs4Q2gMDlUQA
	uZZGgSAFOXunMAIk0CnCvJDaVpjO8GlHX6sug==
X-Received: by 2002:a05:600c:c16d:b0:499:db6d:bc97 with SMTP id 5b1f17b1804b1-49ce55cb47cmr139584865e9.0.1788367410945;
        Wed, 02 Sep 2026 09:43:30 -0700 (PDT)
Received: from GLaDOS.station ([187.13.216.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dead1sm3844745e9.11.2026.09.02.09.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:43:30 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8mp-var-dart-sonata: Fix Sonata SD I/O supply
Date: Wed,  2 Sep 2026 18:43:17 +0200
Message-ID: <20260902164317.45925-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_094333_557703_9E827EC1 
X-CRM114-Status: GOOD (  11.16  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

LDO5 powers the USDHC2 I/O rail on DART-MX8M-PLUS.
Without a regulator consumer, the kernel disables LDO5 during late init,
which removes the SD card and causes filesystem I/O errors.

Reference LDO5 as the Sonata USDHC2 VQMMC supply, so the regulator
remains enabled while the SD interface is active.

Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
index 983d67a0c1de..7f78026e70ff 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
@@ -511,6 +511,7 @@ &usdhc2 {
 	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
 	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
+	vqmmc-supply = <&ldo5>;
 	bus-width = <4>;
 	status = "okay";
 };
-- 
2.47.3



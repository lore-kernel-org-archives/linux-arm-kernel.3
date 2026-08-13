Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7CBC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 16:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=; b=iU00WDLk4Ky6pcok9cvJ1dGmhZ
	u6p768C41EUmr9Gm2dLPD6qSd0JRsbQy7NmwuRcG2Y7hZafBZvY7cRNZDElx5N4YPXZJaqYEEe88s
	Z/cF1wySzad69FLTK8SV2jc3qVJn7OUqeOdYP5Ln/ssvy9vav+YPKhQwOhc//IrBVJPTLaPMqLsY9
	L0DyuntlUEKcNII3uKovOh/e3n4f8rROxPww9v/i59rloaAhCefpbKSq3LndxE8N8liEYSaukV6rC
	4TwTYoM7nRlIfkhK8fcMts1TvvEGE7VNJezqzYJsdJEdVAkkQBworfTNQgbyvNJhpIQ5wVnP4Ot7y
	zduzXvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuY1O-000000017Zv-23OZ;
	Thu, 13 Aug 2026 16:11:10 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuY1K-000000017XP-0LqY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 16:11:07 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49800c6a846so886615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 09:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786637464; x=1787242264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=;
        b=hTig56AC4cgh/ST+iQWOcBmXvaFpuJwUS81yd+DPZhZAJiFT1sOQc1y1AcJWQNWKpm
         KUmrc33o9mCneuk7hbt/YschVwlS3w7pJoJ3zDB5QeR/i5A0o3hXkDXhk3hzvpEME2WP
         oPoo/N+q+I+VGkCdRbyJchW94uBGW5Sugt1P+VPuhZydrfkNm6MTg28mfybh2qJT8sbA
         S1i3fsxiCljTl4ahQ9opuR04hHJ6N/XDg+WRUq6DfM9DxWTukpzYxtZqEK8R9Jlzla3p
         E25ifYnRajL5iaKd6h0l80g4SIWNLJKMoHGsanggp4n5Vf+ZmwvzhDouUqwCiLBBilHV
         cI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637464; x=1787242264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=;
        b=JnAA1cj5PSSCf1Xu/N+G51Z6nGcInRSiLAAiLH6ZtDCWfUklypuvLjZrt2Mu4MTSa2
         R2CJmCHLffJwhFn5IiJSgNgk+S22gQhyzbwMqQWljVB7nAGfb/MJKm/F3t56mCwLdtwF
         vDsBdWyqTl0Nv1QJOTsp6/ovop+ofOUQBpPx6c2lHcXJ2hNMoB56XHDDKg3XMpuFr80j
         EVLxMGDbAzc3AmhZ5VJ0dYhsLavxLvnUe6Nax2KjornPYt/Ys+NElFfvZSLcDL7EKR6O
         /06DxxgsIZGO/w8/xN6EWRR8hzrj8kCxjZOXD3pf8FdYw7HyFoyYj/jLXsFaEw39CTfH
         ojfQ==
X-Forwarded-Encrypted: i=1; AHgh+RovyPI+OLoYOCuHDyDrafpxh6JUUpgR3wPuB1mAhZRJmOskF/PEvjgZXVmf8I9etJSgiY+4GynmNFtnHieN7ZVI@lists.infradead.org
X-Gm-Message-State: AOJu0YzoBOass6H/uXTO2VyU+POOjVvqqYQ5E1pFZ/eoNem41hCTlcyc
	UuHdqEDSeY8bBUFCwI3tgs+V8b1hkSNHmW7Y8oMv5h9N9Nn+NF/+24jY
X-Gm-Gg: AR+sD12RawKmaK0MM21MsdmlvRDrH47LI88TOWXK3AySAUtNDFtYw7p26w0dwPQUFh0
	ETRhspADm15H/E20R+j3inIfB8iLjKK3MOSVnpPZUHnZ5hQ9yHIvbXWVgMe1Kn0KwVBWpyJ6P2C
	HX2S/HAsh5uMJo0FE6onsYnvaxn3DoU2om0h8iZyeV14X6Hq1JM5RAFN80aV0M9Ch+58pCeq8OQ
	moK5TcRg3l4Onk56azInR4w+Ub1YL16G4Ph6wxaPVFPQq3yxSdo50IgFhOiTsRIphErMQJQ11AV
	34DOOlJiMKa9OXDZNS1NE28TTRzdznFLMK7tmzn4kL+qLVN/S4Z2y0+Nuy0/yq3SqxZD8KxvJqF
	2fwFWGZp4g4NDR9ud7Oa2P2pxpFLYzGqxim8EBtVfL2mWOxbOAgluFF2gEfu3rrMu71bo10p9Lz
	1WDwvO403HJhBSAR5iLldfmQBI9M9LrAHldmXJgyQDtG37SohPjNYmPV6pOt/jLYdlFg==
X-Received: by 2002:a05:600c:3b88:b0:499:7aa8:bd09 with SMTP id 5b1f17b1804b1-499821880edmr89033725e9.4.1786637464204;
        Thu, 13 Aug 2026 09:11:04 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a24esm449409f8f.11.2026.08.13.09.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:11:03 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v4 1/4] ARM: dts: vf-colibri: apply the EXT_IO pin group
Date: Thu, 13 Aug 2026 18:10:58 +0200
Message-ID: <20260813161101.2274327-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813161101.2274327-1-mehmet.fide@gmail.com>
References: <20260813161101.2274327-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_091106_129964_5D06B141 
X-CRM114-Status: GOOD (  11.60  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

pinctrl_gpio_ext describes the three Colibri EXT_IO pins, but no node
references it, so the pin controller never applies it and the pads keep
whatever mux and bias they came up with. It is the only pin group in the
Vybrid Colibri device trees that is defined and never used.

The three pins are GPIOs on gpio2 and belong to no device, so hog the
group on that controller. Referencing it from &iomuxc would work too, but
the pin controller would then depend on one of its own children, which
fw_devlink reports as a dependency cycle.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
index 98f9ee1b0030..74afc7b0d74b 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -170,6 +170,15 @@ &usbphy1 {
 	status = "okay";
 };
 
+&gpio2 {
+	/*
+	 * EXT_IO_0..2 belong to no device, so hog the pin group here rather
+	 * than on the pin controller, which would depend on its own child.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_ext>;
+};
+
 &iomuxc {
 	pinctrl_flexcan0: can0grp {
 		fsl,pins = <
-- 
2.54.0



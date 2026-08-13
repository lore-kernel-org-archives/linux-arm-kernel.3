Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57769C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 14:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=; b=pGkTHifGZmkfnJZS4FBvRQ/jyS
	HXOzlCuAUqneFCA72BZcUnfJXAMjqz671gtGeVzKw0gl0RJut0hiV2MEvPK3Kl1xLW5U5WlL4b/ew
	PFdzS0+xKD0/eP6EA+a5KQ7vyNYjT79cGLvOFWIA3VZkKLrue8SkfsGhfGWqXMYAlOSPghkZYBa/i
	U8KCHLxYps2ddBz6NQOnT7iRW8HrnjY0RPWZH3d6xj5CH+CvSViAXJGJaU1L+bl3yFLb7Op1FxeEv
	GjRsaqCGBaCSDD0zaaYVKwiVntOFwTTMaDB1PcIloDVo5kBLF2aLXlOs0djEXTYQsZCB7LVq1VaHT
	Yq+Kk4PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuW4N-00000000o0j-0uiU;
	Thu, 13 Aug 2026 14:06:07 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuW4K-00000000nzP-44IU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 14:06:06 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so693004f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 07:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786629963; x=1787234763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=;
        b=ZK4NiN2Ko9NnyPG68ZGve5fXsPFhsPaK59Xw6GZGGiVSVLwPRAr6c9KpE1TETMQtS5
         8AL51t1qJa3BegXvHzbul3Jr5LMFTdM36phbjzWpJWz/DZdJGUk/FftlfRCADSi7/Wa6
         BQPmKs+nVCEf2mW1QoAnczgp2CxM1pXKZN0O1CBcXljgWaRfNM9hmWULGuU8Dt6lcNls
         a9NVx7tB3tFXLUsCfh26C2vBIjvObBFwKPivq3b9zGiKwrDYIIwHJ0XhtDjyyax2en5z
         i8r+UY8A6oK0hpoUiPsZhxhuk7y0C5f297ktkIeINzGqfBJaSmrlfQ6p0qOvkH6IIMvF
         7tfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629963; x=1787234763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=;
        b=dbWjGpy08AKx2zyk0yMOLkthRiQ6rSQSIf5iPCqbW6mvH/aJRrguPB3kae1FmQzov0
         6I6vrNfWQsGFklTtLWai0BJODshuvwRDdzyMLk2WOHKWqnkhttxBKQ9xPdEwMqYP6f77
         LS3O1G23BJf/6Phab/pPVf8GF5Hct+PXzEmbtKsUvpa4F1am/LyLOzcHfVEKd9EnLWiS
         LNE6HuuGIwpH3ik+4hs47+PzYDna588nz9fuIfq6tj8DjVmB2tiQSv/z2Z6uCG/jGNxq
         L8ydV5cBH6Fkv2do0ITupqDfPKJVK9EJKK3eDOoMebrden1ZY3nremRycHpSg4DhCn7l
         85dA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2oocW1uxDby4O62byvNWTY5azsJcSjj19S08UotTga2FTg3BIhYTVijQY6gWk+WYoCBOaLkTXDTe6YFtMIEGx@lists.infradead.org
X-Gm-Message-State: AOJu0YyuL4FTVHqpKAh/tPZ72rcTx/3nkSS/AsQn2QCpuq0+Rutwyzcm
	qUlH7BC+QgPd700za18gNCi7zWLe+Rtv4I9aMTuFjZDlSJgpzeSFAp0d
X-Gm-Gg: AR+sD12f+DkspsXkNpOFOmff4pFRK4K+YQKE3+sEXJCiXPFnN+eCbBqpfizpY0ZCtFg
	FCh+R/86EYWZiS0qR3M/ra8IKYDaRKtAgapkSbexJlea+WO3KIF1T4+3e6FwxyZInJk7DMNskR+
	H/MkucJbxPyO1bc1sKf63itr3BipufW0lvPP195hSoRqO1TtEirQATqIHmOFo55gzBE8rMFvxoZ
	v7b2mrRxbCIj1qG6GW6qY3949/r5JnwZZyLiWOWxZkN+/+wKV0O+gTU/+4NwSFg4DB9qwTkbi15
	WdLKilrBGB7VizPx7fy6jwB3jjqgmAuvCVASiDrxvis0HDDpM2i1jH+VtbG4Tl+HFhAJRXpjAgO
	RS6f0nqhl6vj46zJyIhJ7in0HLh5GjdehXzttD2fMJFrQrz/QXw/F9VUZCAd3JzXW6npKDCGyQQ
	2gOb8dx8VvjBMQA6DFdnXGC1f8FqR1inRl5Eei2aELR0fHtF8RGRlJCMijnzqHZhPExAqtLmvqd
	2Ezag5bFCchRM9L
X-Received: by 2002:a05:6000:1844:b0:47f:e8b9:8b60 with SMTP id ffacd0b85a97d-48159ccd2damr8227155f8f.6.1786629962866;
        Thu, 13 Aug 2026 07:06:02 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5af191sm6690190f8f.19.2026.08.13.07.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:06:02 -0700 (PDT)
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
Subject: [PATCH v3 1/4] ARM: dts: vf-colibri: apply the EXT_IO pin group
Date: Thu, 13 Aug 2026 16:05:57 +0200
Message-ID: <20260813140600.1824949-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813140600.1824949-1-mehmet.fide@gmail.com>
References: <20260813140600.1824949-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_070605_024055_D17FFEC8 
X-CRM114-Status: GOOD (  11.79  )
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



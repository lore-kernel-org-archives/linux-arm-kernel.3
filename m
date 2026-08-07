Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D91C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 15:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sjuSgcUeDYQSzOzvUe0SB7wYb8MCH/XbF2bJMu2eZlY=; b=vouWlXPLzY2dPxU2Qr+dHalMG7
	D6txnAZ7MsXTHvv0JvUs2qaSSYqp5YzKBL/u+2HWmFrokJfCd2EqFGPrISzMkzQ+ECmYZE1QkiqHS
	1VDV4chqTQESs0jyfaJPOnR8Rw5aLzNZC2xq2vjiowiOZuWPKAQaCnt2XomBopvTreUO336k2E96P
	iKILlDF+eKaX4RXkslB6cF+5c72FgjGxS+PaFIrbWeQpeNR30ElpmHJm+/Os1Ln2gpwH6TacqiFgw
	iF9ckxvswGLXMBsvaC+ToBR+v58xpq1Z/kTjFDSmKIy1nbWE4OnD+wJpivIB86X5QesqQ/sFL9dug
	aITY1Haw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMXl-00000008LIG-0ZA6;
	Fri, 07 Aug 2026 15:31:33 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMXj-00000008LHs-0bCw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 15:31:32 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso1877692f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 08:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786116689; x=1786721489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sjuSgcUeDYQSzOzvUe0SB7wYb8MCH/XbF2bJMu2eZlY=;
        b=DLPDL9zmqRu/pbunv3poxp1+g6R2jxWOmVSA+kYNEWEfUlKS1daTkV9Dmg8KPmD9fb
         x/S/FqzxBe6nioPC3HKa48H1lgLDGJV8yl7oyZfC/cITteB+lkgtSyHpbcDXBkdGT0NS
         wZuxX6rLZQr9L3EaCGie5U1sDvAgzvah0uoV0Zbw8UWp/k1dlwpFY/lYKgUKnrb/G+j6
         f8Ug3QdvdUTiFClbJy6bPIpMKWJ3CjtMMeZHn4SGOLO7gvUHs7vXgecOHj21APG7z6rj
         XAeUiA74VPeogD47DkVf019lPcldLo/oYTPZ1/FCEV8oxz7GxZU+O4E4vTsUBLYkejUT
         JSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786116689; x=1786721489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjuSgcUeDYQSzOzvUe0SB7wYb8MCH/XbF2bJMu2eZlY=;
        b=aGtyPl/ErKB9i2lfYA+aS7loegDru78QJOGoe1AX1uLIQCAkhecdJf3R85DcBmaYB4
         JCwPaR/6NkbZxVx8/XhszFsYHKaw2LLjNwLK8V9SGIZGvBN1ABuWSzyuDE5GwRHJd0b0
         SLD3uh/u2yy+4E7tExjV2Gr6N8DywJ9MpmXNw9Wl0NWm/kS3wzEC5RMu64MIdEVPZ3Y9
         rUrLXvJEzLRpzW5nKqIVLtd0MtcGtaA+S7Z8EVlaPyoE48m5ohV7sLCCCcbMe6M9hKa5
         gSCWgPbBFtqnaY0KhflTbgynEy+Fya72JHI3iP7NFPySkupoNsbMFFx2cJ/H45OaP5PB
         v1uQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpmie4Q+0tvhAT0UI/xlq9dxFOG0LYBj0BFlRhuNHAgghQtN25JbmCQXPJlgjV9ip/YCXMEZSMz+yN/DNY8zS5h@lists.infradead.org
X-Gm-Message-State: AOJu0Yxiy9w4e8PioGRm4iaaWX4NSGB9sWyhXpdZiytd9SCUgtG1rNm0
	0FMsjYj1LaGRnhhmFqXu0hapX4Q1b18Nk5ubb0VfstgCnZvd5XbR50p8
X-Gm-Gg: AR+sD13WVxkLr6GtahJLU+1GKetNBijVKsWFXJBVa+emTiB65/D5Uj+BV7K+rbuMPkl
	OVeYpHoXxFaDhQ4KrVL2np3LAbP86afu+MCf+wSJVbsZ7rIMmqWiOkCJqsvGbJMnJKI8UCEt2gv
	zsQCWDiZ1yxilgyS2fCwTLs89Mw9GdvCnpaH1AV/4T1Ov4sZB5XJdr9T515Mv5e4lqDfnoHo0q+
	uuysCp9syfzxNAUkmMoqa79RvH7XkL6xwpo/9D7U4qrucgKydCywff4SmxOhphAXXnBQQAc8DOz
	1dI+08Azlm2tVfgNBOPnGJNLci8jEtOOYSP1Bxs3+b5RacIKYGBVFznW6dzX8eNmA95TpfTfJlx
	DvwKMi3udiua5rZq4VkbEoH7plP41Ii+ETYA6+dXQ7DWyeGv/ji+G2myXDEHVyT1eOfiuCIjXUI
	CSwNls90oJeXMeKyekYS1jI90qItPZ5onCukt2yRAZ7g4Md5cLPEhYudRHLMAGHLCdOwE=
X-Received: by 2002:a05:6000:982:b0:481:98d:b24 with SMTP id ffacd0b85a97d-481098d0e88mr4142874f8f.19.1786116688655;
        Fri, 07 Aug 2026 08:31:28 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8c5asm7393269f8f.18.2026.08.07.08.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 08:31:27 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: vf-colibri: apply the EXT_IO pin group
Date: Fri,  7 Aug 2026 17:31:27 +0200
Message-ID: <20260807153127.3087388-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_083131_183436_9FF4F4AB 
X-CRM114-Status: GOOD (  10.43  )
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

Hog it on the pin controller, which is the usual home for pins no device
owns, so EXT_IO_0..2 are muxed as GPIO with the drive settings the group
already spells out.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
index 1111111..2222222 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -171,6 +171,9 @@
 };

 &iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_ext>;
+
 	pinctrl_flexcan0: can0grp {
 		fsl,pins = <
 			VF610_PAD_PTB14__CAN0_RX	0x31F1


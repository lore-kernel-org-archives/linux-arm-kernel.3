Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D36CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUVpVy5XUta9JdZvVzQyX6tIcChkXtYHbn7XRIvfDZE=; b=eX1MZ7Iev0M51uVuvhkmUs3u36
	UiocrMo87Efe/92tNyOkmXxO6EX7aSDysiix7Th9uV1fisOU5wNRJ0X2qSAyK0ZBf6iqMXTd+go6k
	itrSliknOHEg1O6gt4P30ekoGhYqAZJCxR2A/7TZiI5HrRG0injxJwWA1807DHKVpJBJdU+MuboJB
	wRqXJiDNLq88rm3w5d/kVGsrFenrehiN4YJtx4Pe6UCmzzfsI0QDcRG78pD+up813ktPR72II0kLR
	uJdpXGw8Mr3OjQh15zw4D1IkJLdy1IFdUbPA8mhgIo51nm4re3jtAXmijFAFBn5gWR9Nvk5J+fVbj
	QycQGPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvl-00000003I7C-2GZO;
	Mon, 08 Jun 2026 10:10:05 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvY-00000003HjA-334t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:09:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso27222325e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913391; x=1781518191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUVpVy5XUta9JdZvVzQyX6tIcChkXtYHbn7XRIvfDZE=;
        b=ieg7V+qcn6hrMSs5ImRKGLptWJnudwg0ZZfbifXCenThKWhd/7qp7vyT1PEBvRcJMP
         rCe43zgn+j9rB5L/Q5Sl5XyHFNGhjAZt8EoQPKv11i/c3yHU9PcGMjBljM7OxsL0raez
         wEqIBk+cMxG9zDjp/EQCYU82lF9aOgjQkaNp8EG0Tdo1L7o56n7Z7gIdBQkk93xaLhze
         dAViktlFGUadm9pNl6HSO/nq3Qhov/twtuzepYNoiNkyshUoBZEvSMNF8yx60npj1Oiu
         QeLACupNAROVAUmp2aFDkidkTbQ46rwyxk8bgytiiHU3GWstSy7usevcQeVP3ETz49vU
         EsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913391; x=1781518191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TUVpVy5XUta9JdZvVzQyX6tIcChkXtYHbn7XRIvfDZE=;
        b=qs4BAEUwsoRjQLoK+xWlFGbNK5WalbScovKb8K+43VHsjnScoLPVDv7nUkyqt9jQ+J
         jjdjJf4MdgTQ8Jta2Q7C6cEf1fIWmdFYa6SdXUkOWoya3iWde0nx1THh06+aUySWu/QU
         riBCzHCElytDRyKbrj3UmdvbfLnmlqPblt6OqlG5pjXyZZQCR3Np3BR4bnf2Pz5KDHfQ
         PcNIGazu3FtitU52YBNaHK7X0xOYnsWIUo9OqS+BbOY7iFlH3QHb3p0xoc+dNRYQHgqp
         7/naxDwhBvr1lpVP82AXFGaFqVVXClSmgBQrwPZ3hApJ0nCjwS7eCV7tacBbeg4oZUTY
         1V4g==
X-Forwarded-Encrypted: i=1; AFNElJ/DoypxKTgcDjZTYHuPU+odUMQeD8PI5t59d1DIuL3Funx6vLzLRa7do0/EDcbLl0ftLlrjSmopIs6NUQVOeFZO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3J7jKZOtYxFQej9HWDeugJxQxsj56iqx/bnuTM74l1XL81wYx
	IV+UPqMQYvEKCpVkTUG7WvLhl54MQuui1zitvlGtXHM4TORUkJFZnoVE
X-Gm-Gg: Acq92OGhUwFERoG9kWaVr9QwtFdxiw2COjVuk8c5neRepsrZliV0wQ0jFj/Dl7imLRz
	PhCTk66kTNp2gLnhbnXwvAt1pKG6sNaOB0rF+SNQ2HcH8FMTlVFRUciDMwphjs85T19VfqxCbbW
	bIxEPZ8I2HWgy2X9Omu7hAsocryzGA8iVMXyS0sz8neehzX03/t+NwvyoLEY9jnd1urr2kdYkuw
	b4mTCe7gYwgmcdA6I9mHoyUtbKbIt0Wv8xtWgTMn/GV7nlfY5tMT8SgLH7bXC1vC3iFjez/+7qR
	blaFTjTyndbyuaIyo7Eg/EIqsIWfpJnHYGaXhLMzw/qU/DCJx16LEVkkkX1aknGbOI115i5LGKS
	Vcmie2amThiVKmQRoxaq25+p7T10hqBzmT6k8UhpJx1wBgUM7pLy4N45Sm/yXyhYHyFB8kD7L1d
	+rT7HSqwLLdSehERP+IOpfq8ocZMAR+GXGzXLhkT3o44neNissgRfTZ5GKsgY9PUhKSqrkKiMq3
	Hb4X5AT0RsEZFOzlJ7eSnRRNjp+8ah3zsX8Ay0BbxgKqO8f
X-Received: by 2002:a05:600c:8b68:b0:490:bad7:3634 with SMTP id 5b1f17b1804b1-490c25e1104mr257657185e9.19.1780913390925;
        Mon, 08 Jun 2026 03:09:50 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:50 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 12/14] arm64: dts: imx8mp-var-som-symphony: enable CAN
Date: Mon,  8 Jun 2026 12:09:30 +0200
Message-ID: <1a5c91460de799f89a4f18547b044e0257035fd1.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_030952_899198_F2F624E8 
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the FlexCAN2 controller on the Symphony carrier board and add the
corresponding pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - Add FlexCAN2 controller support

v1->v2:
 - 

 .../boot/dts/freescale/imx8mp-var-som-symphony.dts  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index e1b78ed167b4..7ad57caa0f1c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -106,6 +106,12 @@ &ecspi2 {
 	status = "okay";
 };
 
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	status = "okay";
+};
+
 &hdmi_pai {
 	status = "okay";
 };
@@ -357,6 +363,13 @@ MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
 		>;
 	};
 
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART3_RXD__CAN2_TX					0x154
+			MX8MP_IOMUXC_UART3_TXD__CAN2_RX					0x154
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3



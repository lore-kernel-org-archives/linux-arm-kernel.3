Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE922E92FD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 18:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2nPBwlmLC+wGQo+kGghgS2CarqCL9CUUT5DieeAoVE=; b=w7vz/2t3uvpYYn/FyrDq/++kT9
	C+Bsz9mQcaqOuxGUNQq+yVzomENlqhgjp7v7H47Nz6QlIkv5YH2XRVr7J1PK3rCbPnKM4FRQb78t4
	/u3okg5m6JHUH5nregaysYxsH5Itk+nyG5bB2R1QaGdDfm1QESgBcbgzHWDnrXzwexBFX1HRysVR2
	Lfxx3OB+PeJo8O4NXm7ymqg9aFO5P2+RiLRtVfbvRh3u7nH+YnKhUfxgV1kw4gN3UBNwtTWeoND0B
	IrnGUQVFLwBk4OmOH7dyYdyNVYuZb1fq6JM61U8o2hdn7hY9NOAXEAX7OQ6RT8nl8SYynsokPr3R2
	QHan8G0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAy-00000003y2U-0LzT;
	Mon, 29 Dec 2025 18:41:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAY-00000003xbk-0y4l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 18:40:40 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so56967325e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 10:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033636; x=1767638436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2nPBwlmLC+wGQo+kGghgS2CarqCL9CUUT5DieeAoVE=;
        b=c2fNdfIFEwBtWL5mOTVose5PMWZQTyuZWbFp8TzpM6U5CJECpVwlZMYYs953EoI0Uw
         6/c+R1H1fxnD1c2XqZ/qRxj5wjcCcK4EVegfgUvKlnzMjBZKNhqAQJV0iIm8jtkWQ4xp
         iYedU28tsK6p67QmhTtGqw92X+gGK3PSd2lAQ9Goz85uKay4EzTC2/E27xWU7rvbS4y/
         8d2NJR36lTgLNFJ7o10kpYLgYN0erUHdQWhW0BgXT1MNHfI7iJeSsRg3hCbBm9kNdQg+
         kIphrrKYu2rHwYw4sqNEhEHbC2AFRf8EMF6boFKCjoK0o6LETXJF4h3QFxxqIZjO1AEo
         PGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033636; x=1767638436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H2nPBwlmLC+wGQo+kGghgS2CarqCL9CUUT5DieeAoVE=;
        b=OKE7BEXWUjXKd+CYNXCkl4Ep+xqseJKV7kuIoycjwLpD+ckRZeFT3d3D0qdNL0bnNK
         DQm4OMMQv3u2ZLuGpRiwdQfHgrYFme3LUaUdLcC7Wr6uTgnVavhwAATxz/eKlDp6mNqZ
         MbGQCLsB1QbkjVsGNB88wtejUXgMaO2prfbsho0fLPiVf19jGxYbYQcSh7P1ccQXkTHZ
         EFq78qTGCK+2dHTPqeJdQM47uGzo1cl5S1fPFIDFAwnRBK31l3F84qfmoLBDw20J5/1T
         w0SvlkSyP9nIFSHvpKXg0mbwDecBMpKex70qvfclc+b+Xw8qZz+vrwvMu+h4vzDSfytj
         agPw==
X-Forwarded-Encrypted: i=1; AJvYcCWXdjkElWzyLEIkbCUhu7cTnShAon7DbjqyoNVrTXJsPtnHfbDa/HV/TI2tiMUSATi1+V14CZ0bCZsd8I8w/dxo@lists.infradead.org
X-Gm-Message-State: AOJu0YyBqUYKigN4uB7IwY26AX8e/iq/BG7nqBSDCM624bve5ockz+ig
	A6iFOLC7gE6OImcdUZNG/xcYe45ZpjGpDbnjLMCtPR7k5gSMVNYd+tyKWGs+AD5hVFI=
X-Gm-Gg: AY/fxX4wXaFYPb3IRsleUqhzVzH9jnQlnOEXsgSeiLRIJEN+e7JMnzueh/lUeOjXDC5
	efmhMNXx7aNTPpc2Lw7Q0XUzHgZhpov8q0ihj1pcrliDyCtCSHox70toFDbePYnEpGARcMsxYly
	9TlidLEJfuNKDUN9GpXrI97rlwyaaMAZgqjBFJGix1xBoQt4IylhzTmO11pUmcF94AbkitiaDW3
	ueVLDdt6daOucuk1NehZgOGjdDxFGIkQLfOtr5+etnW8PVdIlM5bIxq3lq/hQ+yEAr2pcjqq3UP
	LACkS68EAsfy1RNQr1f78Ej4n3ClSGpqfdfHD96bnAN8THniX1KSw9JYSYG71k2ysoJVNCWVfNg
	4wRATZzycStGRUHU/dJI7TqGB8BqpqACBjDOJdopC8i1M/PPFLbJPZAe39suBFXx07OGjzr+pKp
	E7fMDHW/cVYhOM4rOsZ+WJCHqWE5OZSqlMOhpbZSOS7jDECKiQVa8nbwj+VyknOMC4edJMS399V
	l1MlxqL2z3qORqAq1+NuNTK9YSMjiWAsF3ntuA=
X-Google-Smtp-Source: AGHT+IGJqflA/fWcbFGlt7I8QSG/W3Ym/AA8gFbH72KL6IAeQS+P/elQOb7uOHAEgNrEusVQwY5q5w==
X-Received: by 2002:a05:600c:3b87:b0:477:aed0:f3fd with SMTP id 5b1f17b1804b1-47d1953b7b0mr395881215e9.8.1767033636235;
        Mon, 29 Dec 2025 10:40:36 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:35 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v4 12/15] arm64: dts: microchip: add LAN969x clock header file
Date: Mon, 29 Dec 2025 19:37:53 +0100
Message-ID: <20251229184004.571837-13-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_104038_938891_2D7C7CE7 
X-CRM114-Status: GOOD (  11.76  )
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

LAN969x uses hardware clock indexes, so document theses in a header to make
them humanly readable.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v4:
* Move clock indexes from dt-bindings to a DTS header

Changes in v2:
* Rename file to microchip,lan9691.h

 arch/arm64/boot/dts/microchip/clk-lan9691.h | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 arch/arm64/boot/dts/microchip/clk-lan9691.h

diff --git a/arch/arm64/boot/dts/microchip/clk-lan9691.h b/arch/arm64/boot/dts/microchip/clk-lan9691.h
new file mode 100644
index 000000000000..f0006a603747
--- /dev/null
+++ b/arch/arm64/boot/dts/microchip/clk-lan9691.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DTS_CLK_LAN9691_H
+#define _DTS_CLK_LAN9691_H
+
+#define GCK_ID_QSPI0		0
+#define GCK_ID_QSPI2		1
+#define GCK_ID_SDMMC0		2
+#define GCK_ID_SDMMC1		3
+#define GCK_ID_MCAN0		4
+#define GCK_ID_MCAN1		5
+#define GCK_ID_FLEXCOM0		6
+#define GCK_ID_FLEXCOM1		7
+#define GCK_ID_FLEXCOM2		8
+#define GCK_ID_FLEXCOM3		9
+#define GCK_ID_TIMER		10
+#define GCK_ID_USB_REFCLK	11
+
+/* Gate clocks */
+#define GCK_GATE_USB_DRD	12
+#define GCK_GATE_MCRAMC		13
+#define GCK_GATE_HMATRIX	14
+
+#endif
-- 
2.52.0



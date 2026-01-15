Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F23FD41174
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6Hh4x4yU6+a4AjWH4xSBmP3UWp5wIhlMj96VEo5V8g=; b=TLgms/Ulhewi6yV7nUNhlhPMgS
	6xy9++VR/HQl+hwBs8hMp7IxcqXRMBfvkffQidbh4InwRenM9mFmcgdRsKe2hQzY/ycRiHnU/xJRG
	9niXgOAFihBzP2XcNgWwQ8bAuNSU3Fz/JcZLy1BvvcRik82ks5znVYPcrw+J+L2OMdPQsjUORk8wd
	qWRMmvv6/nZBH7w7hrZAZ8GkKmf1VB5mj32JFrPn4wRTQuVr8DjRHRWkm888CzyQCSf1ps9iTvd3L
	eGDorLls0dD76fjss5JIXR9ZYef28tyTVcXZVln4MRFW9gvfBIAT3f+Ol+9KfoWWVKW9ugEMp72a6
	t7/UXYMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLjN-0000000CFRb-13Q5;
	Thu, 15 Jan 2026 11:41:37 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLjK-0000000CFQE-4B0g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 11:41:36 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1233b172f02so964732c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 03:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768477294; x=1769082094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6Hh4x4yU6+a4AjWH4xSBmP3UWp5wIhlMj96VEo5V8g=;
        b=KlCWQDxiFCOnorA8AI3a09zRpMVOm+1WufGDfq5pzjd+4FXKI2+7PJijTpqUdKnLYe
         03tinWs149Sq+4ApdUKKw7qjNyG/UJz+2Wms1O30qNaRnUwXnUM9xUFjb6yY7/OqhnkZ
         yGktBDAvzhQnjyRKBMqA7G5n5jELwutPsZp4PPoKdTPEZbUlzI9vWO1ny/2IIP7jwyLV
         iB2h/kxp//cl1tDYSSbPkAbdNKC4RsCNynWmWXfD1hEEEwB3YO+LqzKtDixGhuE8/jqu
         NJ4qEK7xaS36uTdHZWKcCi/DQhvuiYYGbtZRcQhFuORHMwJN++lqcg/EbQhLHw9G8dE0
         aZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477294; x=1769082094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A6Hh4x4yU6+a4AjWH4xSBmP3UWp5wIhlMj96VEo5V8g=;
        b=qC7S/WHIhwQ3pipzxThDGMhHidD44U9Fjkq90k6A0z5PnkuEW8TwmFs0aV1aYC1dke
         gspUJl65svayl7tFEsDc2m+GB38BSgszuGpUYslm8R9ma/IPIFrPBoZkvgpkIdVZsS54
         TnAQ4PgP4gxI/82MwN1eYPVko/sXIR3f8shbtVrhspmIfXBUOUKxv39EO+qM2OB0cLQs
         kRPZRPzNvrpqRXHa9+vpnhw7rcW2IYJJP6XuS6U0LQ0tKtLfHlDI38VySmXqN65UtriT
         +hc2ZhZ2xqSA3FH0+jzbUD/a7FnJr8aLe2Thi11pD+8mLLno8Bf5IDA354ohQcsJTiPJ
         4b/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMN/CHYFYhLMPMpEy0daJABNOdWTaeNS37zSdUP0RV3ljMItpDAM7ECuBluFjtvFmjYBWDj0l2zSkLUE5yZmrM@lists.infradead.org
X-Gm-Message-State: AOJu0YxGvhn7DJ+Vr+7JDnnpl5HfSahKmPTpx34BtTmdb08JFRhPPQaN
	3iZFCITzHBZsvzhC6co1tl9J3s28GHnUWUez1UWNukBQtr99jMq3Vd1d7jJvhxUAYlg=
X-Gm-Gg: AY/fxX7//YjuG0fxVFekaQYrGasJS94Pa0Ok/vuhaNG8QOje6FS7OXpG4uNvIqBot3K
	8sON92qqbJWvUU8y9S34wO/VaAR5G6sYQWjxho8esGWenW14hlVTBzHlR+c7xfYBLMPVWQ/UrZu
	3jAOyJfOkz5PRam0+TZW4drrfWpnSAbSWOVmtC6/RHH9Ne97uilJy1FLUkCRn2YlBAbcjN98Ded
	2Mb60OEszkzRUmHab0ndwJy3WmDO4UDV4q9wWfK5nKk3ktEC3f+XB5MgamnFK0L/KXOD0w/RObb
	rMYvXTxf5whKbcBKOnJSnT1aBUPbF4xNZCPBmvRue29ofXkc2df0w3wKwRNT438kWFj2jp2vOPG
	/pRXunvMewp+JVo3yQaZIdvzR4gL3Vv0NZFj/wDpU5IDOIOlLuT8uUz/fas0w8VpcGFtMxdQycl
	eXp2R6nX336/qLpoOC08ucub5wXk4zzLBIsOXebMRV8X9ZJveo4CRQvDH6vD466Hu/Q8C7qGK6l
	++Bd3/0
X-Received: by 2002:a05:701b:220b:b0:119:e56b:98bf with SMTP id a92af1059eb24-12336a82526mr5837069c88.38.1768477294058;
        Thu, 15 Jan 2026 03:41:34 -0800 (PST)
Received: from fedora (dh207-14-52.xnet.hr. [88.207.14.52])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-123370a051esm4875347c88.15.2026.01.15.03.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:41:33 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	linusw@kernel.org,
	olivia@selenic.com,
	richard.genoud@bootlin.com,
	radu_nicolae.pirea@upb.ro,
	gregkh@linuxfoundation.org,
	richardcochran@gmail.com,
	horatiu.vultur@microchip.com,
	Ryan.Wanner@microchip.com,
	tudor.ambarus@linaro.org,
	kavyasree.kotagiri@microchip.com,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v5 07/11] arm64: dts: microchip: add LAN969x clock header file
Date: Thu, 15 Jan 2026 12:37:32 +0100
Message-ID: <20260115114021.111324-8-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115114021.111324-1-robert.marko@sartura.hr>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_034135_040495_D6E2D2D2 
X-CRM114-Status: GOOD (  11.35  )
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
Changes in v5:
* Relicense to GPL-2.0-or-later OR MIT to match DTSI

 arch/arm64/boot/dts/microchip/clk-lan9691.h | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 arch/arm64/boot/dts/microchip/clk-lan9691.h

diff --git a/arch/arm64/boot/dts/microchip/clk-lan9691.h b/arch/arm64/boot/dts/microchip/clk-lan9691.h
new file mode 100644
index 000000000000..0f2d7a0f881e
--- /dev/null
+++ b/arch/arm64/boot/dts/microchip/clk-lan9691.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR MIT) */
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



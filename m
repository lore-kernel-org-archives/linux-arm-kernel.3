Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3513EC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+M5rdkwGZu/VDL8llLe2S9tCSCM0PahPEImRhTBfwfY=; b=I1NZuV6fZukR2NR8kEeNPTpBv1
	iaUzF6Pv/Y6kkXz63Ilrm61UU7bwQXPi6UlwTIhC+0fI+RWQGr1tSiOQsTDJ6lecO+zD2428Rsj/7
	5jIj/TypQC14RkvptWsoh1KWVIhx1x/Ki8nTR7gZ9v3R8b/PSfDFkA6QJWgMnwEn2oO1eZbYtPUmA
	039T/B95oTr04AgDM7c7l8DrQOrIsPxVeiEql4JOLLQ20YBIQs5HPDpZx192Ran0KgKeCEPs5FA7f
	wjnbNUuDoNH0A1xwz7qFPUd3dbFVwM+ev0/25u8zZ7pN5+YS//T3VwbFkOi5I9v/fNgg1uLPmokTZ
	iGUY5wvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8N1L-00000000PwD-00Z8;
	Fri, 25 Apr 2025 17:39:27 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KpD-0000000013f-35he
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 15:18:49 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so446568566b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 08:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1745594326; x=1746199126; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+M5rdkwGZu/VDL8llLe2S9tCSCM0PahPEImRhTBfwfY=;
        b=I2IdT5/vrf+jStCAnxN7YfhuhUf1XBPfHiQ98IZenDYJYoczvBu5h9By6uZQIsBB36
         MmfBF0OpNp4KJYx3oQn7WxfrUvTHgSS/ajJFcgvEjEZXiaN9YWuvt5d5p8W1OPal/y+4
         gIrXsA3HCuBZ2dE3YzelxoINpiQsIslO2gmOVLK21RaraYEm9hOVVbp36ICSkHMZn6a4
         zcOWtcx+BAzbo1u7xez8PP4EAtEBoXo29y5Gd5LJMxuri/IUn5rddhH3VVnp9WlKWnnz
         vZidDBOPvwIJ2YcCvcX2wiSUsookfxaHxqDX1bl3LNh5e1AsPCGxUI4H85Uc1qE2MjNa
         +xqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594326; x=1746199126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+M5rdkwGZu/VDL8llLe2S9tCSCM0PahPEImRhTBfwfY=;
        b=RXH1nu15UuWXcKBs1sP0hwPDog61uAwYI9UcSqozdwjw6ldSgYqf4aeVAbKGK57ayb
         xEC1f6OPvaWtwDeRStOo9EaeKxLVRphMVECZxkrJVTDPXst5PkkTYVp0x7Wczy3YhTTW
         Vs5FYG7VrZs4II+DPBOLMd4+2GSbwjstkU5DHAMhi39zxkoL0od21WMtDglY1qQAo42N
         k5DBiKElH3TSFsZ9pdeV1RQxpkyUb7t55cCMbfG1W6i2JascQ80i4Pm5vzh1gFNcp4nA
         zQ79B2muwwCcqgeLtfx81qrUjI1RN5TS3rG8vZ5nbmBhKbmTxY2qu54lt5UdY+Vun3Ou
         fA1w==
X-Forwarded-Encrypted: i=1; AJvYcCUuzgak6aJxTy1Vd0eTHdU1r4srYTyL/5LN5CCG0eeJX4iCpdAb8aSHBSFzMkC1GUTXqR8pzn5G8SUIoSUaHwEN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5fHKlZU2+Hx8qWQ4lwjBxREVBRdcqSufpsXHCxuVF3bW8ttDE
	5IhHClrbIsFZ61U5G+ra33y75MhhqgN0pU/wZZpFrOR1A0MX7mC1zxUpPRkylNg=
X-Gm-Gg: ASbGnctB2S/0bqJipkmYqWRU90TQ/WqfQOYPimI1TngbhuAU6t0PVv8iA1MxezLo/xQ
	Ndyk64aaRaFBqQEejo+cy+2u0+ovAizGvpHb8nUN9Lg3bGKqmzxLoYy/phnrEFOebCF8+1YjcBj
	adU5+f97anpbCtXh8wWmlYnxBEssWGsAGgucKGQWEjY7ZCdgl1EF/UXWLOn7yCEmZ3L6sk9HkCD
	a9m7vbFV5jy9SasQ5C854bzd+FAo6ME3QXnUxOpPfC/b6mHCsTAhEeuLDHmcZcBBaHPkEdtp6sf
	FEd7NGbrHUtw1YqK7NuhTnHyb+M8/Xxrl4AT0Po8GLvChAJNY2ykxfCYhJPL+SnPm/ND
X-Google-Smtp-Source: AGHT+IHaoG8RjUwrvQSyvJG6aKSZajj5vFrhmm1pCthBlIn1lk/zpPP3YRLIRhFmyc6BfcY/0PDTEA==
X-Received: by 2002:a17:907:1c08:b0:ac2:9ac:a062 with SMTP id a640c23a62f3a-ace73a45d0dmr248025266b.23.1745594326097;
        Fri, 25 Apr 2025 08:18:46 -0700 (PDT)
Received: from [127.0.1.1] ([185.164.142.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e59649fsm151099766b.85.2025.04.25.08.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:18:45 -0700 (PDT)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Date: Fri, 25 Apr 2025 17:18:06 +0200
Subject: [PATCH v2 1/5] usb: misc: onboard_usb_dev: fix support for Cypress
 HX3 hubs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-onboard_usb_dev-v2-1-4a76a474a010@thaumatec.com>
References: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
In-Reply-To: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
To: Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Benjamin Bara <benjamin.bara@skidata.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Klaus Goger <klaus.goger@theobroma-systems.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_081848_047541_1794AB1B 
X-CRM114-Status: GOOD (  17.09  )
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

The Cypress HX3 USB3.0 hubs use different PID values depending
on the product variant. The comment in compatibles table is
misleading, as the currently used PIDs (0x6504 and 0x6506 for
USB 3.0 and USB 2.0, respectively) are defaults for the CYUSB331x,
while CYUSB330x and CYUSB332x variants use different values.
Based on the datasheet [1], update the compatible usb devices table
to handle different types of the hub.
The change also includes vendor mode PIDs, which are used by the
hub in I2C Master boot mode, if connected EEPROM contains invalid
signature or is blank. This allows to correctly boot the hub even
if the EEPROM will have broken content.
Number of vcc supplies and timing requirements are the same for all
HX variants, so the platform driver's match table does not have to
be extended.

[1] https://www.infineon.com/dgdl/Infineon-HX3_USB_3_0_Hub_Consumer_Industrial-DataSheet-v22_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ecb53f644b8
    Table 9. PID Values

Fixes: b43cd82a1a40 ("usb: misc: onboard-hub: add support for Cypress HX3 USB 3.0 family")
Cc: stable@vger.kernel.org
Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 75ac3c6aa92d0d925bb9488d1e6295548446bf98..f5372dfa241a9cee09fea95fd14b72727a149b2e 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -569,8 +569,14 @@ static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
 }
 
 static const struct usb_device_id onboard_dev_id_table[] = {
-	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6504) }, /* CYUSB33{0,1,2}x/CYUSB230x 3.0 HUB */
-	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6506) }, /* CYUSB33{0,1,2}x/CYUSB230x 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6500) }, /* CYUSB330x 3.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6502) }, /* CYUSB330x 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6503) }, /* CYUSB33{0,1}x 2.0 HUB, Vendor Mode */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6504) }, /* CYUSB331x 3.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6506) }, /* CYUSB331x 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6507) }, /* CYUSB332x 2.0 HUB, Vendor Mode */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6508) }, /* CYUSB332x 3.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x650a) }, /* CYUSB332x 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6570) }, /* CY7C6563x 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G USB 2.0 HUB */

-- 
2.43.0



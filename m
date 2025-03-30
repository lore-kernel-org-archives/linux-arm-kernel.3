Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056F4C36011
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 09:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u6EyuDgU5nrgjs6np3Q+Arkgxw1FSBvSpF/CHI128gA=; b=2gWezvl1ueDbgE9osGIqwwL0EB
	Uonucd+qPV9Q2LcaOGEL8Bv5Xrh2b3jSHmNpBuACWALiYzXLxiei56nZOBP81myivNZW17XCJihd2
	36ViClqNyTZJNoPqtyzkQVC4pwuvX8zpLEu5uyg5rUZKFmiWQ01shE98YV8L/KnAsi+LZ2WAKyKkw
	LVbZgFs+9paX9jr/+DyiRxERlEGsMaXbE1S0HDNyHG+WIz898RcOFvObHMUERS2fy0ox/v40iD156
	Xaw12O2tArx0jfT1hSenQSoFfWhLgZawqrelZhmV4a+Ti6FasUhOKKOw7QbPMhqpVwMzqLEt4d5OX
	K3FlV+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1typ5S-0000000G1zj-3sCj;
	Sun, 30 Mar 2025 09:36:14 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1typ3h-0000000G1rX-4AJx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 09:34:27 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-301302a328bso6160963a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Mar 2025 02:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743327265; x=1743932065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u6EyuDgU5nrgjs6np3Q+Arkgxw1FSBvSpF/CHI128gA=;
        b=mduDl0D2qZMch7n2yPAQn1LsSG5EL+cfZgAB2nfSNqMjdPE8k2NYq1W5CqkjM6SHxw
         3xfEp4VbAO1UXTWfdEHOQkkGKyHE5Ycslu9aM3peFwbNaiGI36Cw7lefPbfaETR+kNta
         PB9xwV9rmUQo0e1MsccNInr8NTTyXwWZHm4jpRJUHHpxUPrhw52BNoQ/lukPYfSh7avA
         M+GX6PGk0OuJLDSnnnaFKSQFxDKVyf2gkWKLoz4GEUrGV/NenAXO5YPsjeGI+FwbpISj
         ivjLnsbsUdSjYonh75AWEjK+W5m8LUWeGg1ztSq3nOpcci0xNacXnrLOqaqDA0FbcBsb
         JpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743327265; x=1743932065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6EyuDgU5nrgjs6np3Q+Arkgxw1FSBvSpF/CHI128gA=;
        b=pKnwly+0tsC0c/lGy0NSyfrlmx8qiQzFa75JWbfFu80ZvBEnWm0nNA3zYhW8YtfGlu
         REQIwU3IhnMbjNUOv0K84h8gIJuTBDgkAjAqUWStpEm8kJrmpRLlrIubcXEv/658dSev
         XaVjLRUoEI8rZQA9/RbXJB/PYQFvL0x/zUV/GMJEYhH6RRKH1KaRcA19flSTcUC6crMm
         aoss2omlNarY7jFdEMhzlLxniolW5IZYq+ETApQO72PxTREY19G1gvhNB9Ib/HJ0hUMU
         F9XJSXllb2Wosc6kkS7RHPDfwaAOwcQTl8Eodfdw05zo9VAGmJIHFzrTDpkaL67FwHI2
         RvWA==
X-Forwarded-Encrypted: i=1; AJvYcCXNZTbTW3nnSWbOOy80yPa2ys0qA0AvAKWhGd1Z6Zd8w2imkU46hNPC97zg8coz3NR/fnymyxVhlacVRmhTLXt8@lists.infradead.org
X-Gm-Message-State: AOJu0YzSYj5T2nP+GBTvVBj4YRoy5pcyhTrTZTZm5sREeriIYh0VS7b9
	U+5Ip1iJ6ABjrgDLh2K8okyhUE6rOX99q/3Db6QX5O2UPIO3icvz
X-Gm-Gg: ASbGnctYL9xm6xp7Xf3eOg6NB2OIsP7HAeKkup7z8xtlxlnvIxBlA5awvGaW10DBpDn
	6nCupvQ0BJ2u4DagyEJc/oXRdRNYmlAa9oCMr1vmb4JAq32qi7nuXxgxhpG2lOGEPBXdZVs0QZ3
	gplcFDLxEFWNjrp31R0ryJvLGNXE2jUNq4X7N8wHGmve0Ll4ecNPqCIOtxbe9m2RH3wdD4BaIBM
	+6R8CwSf/HQSAUsl+hYWhjELQAJp/5TuHpXiI5mCsyAFNDTwsgFLMUFo8ice8qDuIE/ODDLkpBO
	Vk7dvYaT5l9aapMICPFo6ECdw0QMegWdOJVfOrRJ0trmN+04RtHYWVwJVFF1
X-Google-Smtp-Source: AGHT+IFyL1pjZCQp4GL7b6jIJcPDa4HAki2IAGE1aOItt9UReNJfeQH1Ua6anvfuTfjFTOIxtDZphA==
X-Received: by 2002:a17:90b:134d:b0:2ff:69d4:6fe2 with SMTP id 98e67ed59e1d1-305320af42fmr7635668a91.16.1743327264644;
        Sun, 30 Mar 2025 02:34:24 -0700 (PDT)
Received: from localhost.localdomain ([49.37.217.226])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2291eec6fbdsm49065855ad.16.2025.03.30.02.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 02:34:24 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: johannes@sipsolutions.net
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	erick.archer@outlook.com,
	kvalo@kernel.org,
	abdun.nihaal@gmail.com,
	miriam.rachel.korenblit@intel.com,
	emmanuel.grumbach@intel.com,
	linville@tuxdriver.com,
	khoroshilov@ispras.ru,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Fix use after free access in at76_disconnect
Date: Sun, 30 Mar 2025 15:03:20 +0530
Message-ID: <20250330093320.22293-1-abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_023426_033560_2ED13974 
X-CRM114-Status: GOOD (  13.28  )
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

The memory pointed to by priv is freed at the end of at76_delete_device
function (using ieee80211_free_hw). But the code then accesses the udev
field of the freed object to put the USB device. This may also lead to a
memory leak of the usb device. Fix this by using udev from interface.

Fixes: 29e20aa6c6af ("at76c50x-usb: fix use after free on failure path in at76_probe()")
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/net/wireless/atmel/at76c50x-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/atmel/at76c50x-usb.c b/drivers/net/wireless/atmel/at76c50x-usb.c
index 504e05ea30f2..97ea7ab0f491 100644
--- a/drivers/net/wireless/atmel/at76c50x-usb.c
+++ b/drivers/net/wireless/atmel/at76c50x-usb.c
@@ -2552,7 +2552,7 @@ static void at76_disconnect(struct usb_interface *interface)
 
 	wiphy_info(priv->hw->wiphy, "disconnecting\n");
 	at76_delete_device(priv);
-	usb_put_dev(priv->udev);
+	usb_put_dev(interface_to_usbdev(interface));
 	dev_info(&interface->dev, "disconnected\n");
 }
 
-- 
2.47.2



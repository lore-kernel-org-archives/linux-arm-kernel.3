Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544B5C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 10:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nC8MTZbIQ3cw2rW7vnWZ7qJLnzWQzFuLM6bwSWKD7+s=; b=ofkKpwc4S2GQ6WxAeW2BS/7xwo
	EsqP1NpyiE5C6NuvpUGjkfEnzFZazKPMjjeRPfN6j9mlCNofT8thgoMdPzO3Fxb9JhyWC89Zsa0M0
	6LVEEU0i6F6KhY93376oOAOB5KJhaHzA1/ztVNkQLmZo+pgKrtW3JITbE26mArch71AnzwnuAC1bT
	5ao/l8OzvehThirViOoq/P0KbHYtrrGWppyxps/jPArWUcSJ0/ojk9tPX8FDmKVWgCgXSmqQ654Zj
	5jTyiWEEXg/d8kgGe938WbP3mqjwEcRXE3c9vUUD30OvO2vIlrmq6g/AakvFUVWDLmJ7VEfqksdkt
	qfLV4d1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1typzJ-0000000G62G-3bUm;
	Sun, 30 Mar 2025 10:33:57 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1typxa-0000000G5xe-1t1j
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 10:32:11 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-224100e9a5cso67672745ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Mar 2025 03:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743330729; x=1743935529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nC8MTZbIQ3cw2rW7vnWZ7qJLnzWQzFuLM6bwSWKD7+s=;
        b=a2Is8WwBfEIPBU7foX0XBS1/Itt+o/jPOH5cnj65niKuYbFqlm2Y/YRhbUrlEz4nMh
         r9KCt99pA0mRcokwbQnpCtZtP8HxyDtQjTaCyWtJJoQEE3u3oI54boB8jVgaMYtF/ocn
         2ILCXOgKsYg55LKqcM66x9TyjDK4911VWVMSgCRyZe+OJ3hNA4yr9GHRx3R6/JTODZnd
         ydd7TxM8Rk/iblgC28aMc2ChxKMbqX35FOxDABkcgDu5DtJiC/pZX0vT/NqFhJX0igx2
         ZqkrG7rl8iVq0s3J0S2xpjqDdgoUbGmmjTk0MT6G6OMDK1sKP9YEIBPMT0jdAxzwO11n
         k5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743330729; x=1743935529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nC8MTZbIQ3cw2rW7vnWZ7qJLnzWQzFuLM6bwSWKD7+s=;
        b=ZdjOWV1hp8kTYKC8S5kn7SicnrB2eDThHvEhi9R3Wmmrr/xdKBMD4Y+3oZe7xZfFlr
         ToR+IAYqMlXZf+PurazVeDL5r9DZO/hifNBYzA83qdMwH4xroB1ZLg99mA+eg69uPERS
         8hkvP1UgZ9wP8C2hAI5+o1nYbh+K3QdtdkwvgPgR2YrXOd1YEMgCF0lrKspzrlHz1R/K
         kr9r+ABg6F4tDkgIe4uwLHqoaVTy7pEtvbgf9I+JIK+i9L0oiN5FdJAS2Wa5nYg31LgS
         rkYKr7Z7EmNtSNMlIRqxt5NPlShTvF33YmlqYzf9+kX/TL8dnIgRBsTpx+YJr2iNpimj
         u8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzLaKzyBlehBnX0Hr8Q935wNe3L3u+4IlLeF9upwphz/CVqqxirbinZSQihbDXEKSd7+8lIF6lNeyxQ5zi3g2Y@lists.infradead.org
X-Gm-Message-State: AOJu0YyYMRqNGsRrrYAcrK2r7btigum0fHIxGpIhFOGqWpjeP9LbJkUL
	LmNBXocyrUJWbGtxbhtRb3ToaWGfJYkZDDG3ibGQDG5ezZqtU7LfybAGSQHH
X-Gm-Gg: ASbGncseg+RZiON8EUHzAMW69OGK4XzzNos/Ww1szzE9dgcA/Ya7LQPXuOqIWpUSb2Q
	OwyNJC3jQs7+fiwAl4T44OD/eSzp5AqEhZhTcduEPngMs0mrGGrb/wSYCXvL7yeC+XqKfIZRNBb
	fOOXxNciJ16PlC/y5BCDhucRmkJ24EZMdW11upYiMoX75zPewtuCpmf+6csjCvtfIoYNMDAj7DK
	cOkH+j66ZFRViT6xdw+27MOiZ6cI8FqXdF5D/McE7MytnO6Q2fny5o7GeUwJccqBOAyLBXz28pA
	2SXZWD+lGDftFkOLTzSUfACNdtWcsRrH5QJomQLC9in151Yvw1goi1ov5C2bDLodR7EOclc=
X-Google-Smtp-Source: AGHT+IF2U0LzXGyGzaSSSOSuiBfH1sRfywjZs24Sy+5pYInOUAquWdNQ3Ifee87/AniJGorJuPkWbw==
X-Received: by 2002:a05:6a00:174b:b0:736:4d44:8b77 with SMTP id d2e1a72fcca58-7398035e5a0mr9197373b3a.8.1743330729403;
        Sun, 30 Mar 2025 03:32:09 -0700 (PDT)
Received: from localhost.localdomain ([49.37.217.226])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73970e29377sm5111720b3a.66.2025.03.30.03.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 03:32:08 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: johannes@sipsolutions.net
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	erick.archer@outlook.com,
	kvalo@kernel.org,
	miriam.rachel.korenblit@intel.com,
	emmanuel.grumbach@intel.com,
	abdun.nihaal@gmail.com,
	linville@tuxdriver.com,
	khoroshilov@ispras.ru,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: at76c50x: fix use after free access in at76_disconnect
Date: Sun, 30 Mar 2025 16:01:10 +0530
Message-ID: <20250330103110.44080-1-abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_033210_490453_82BC0E83 
X-CRM114-Status: GOOD (  13.44  )
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
V1 -> V2 : Add subsystem name in commit header message

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



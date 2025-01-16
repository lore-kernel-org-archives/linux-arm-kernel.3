Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92047E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 03:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EHN8VwPtCZBq9Z4WoEOrhUz545+6IZdCnpT0dOgO/wY=; b=EFgRQx4+srIymKKaMacQFRas2k
	KGbGeRg1vm22qlpCKnWiWGhAgCwTCF47R3yzDq5TM2+P+Q+zER7F6fuaYoF+nS+d+cijVFOcjN2lY
	g/nAI6QCYxXir85iXQRu9/nwaz3SlINx6LC/vXvwxBr+5p8s66xJ4syy8p5E3za/pVQJpu96FUQFg
	pN+zOL5QVkrMD5LaoOUVXwT5dHAGFKkXspyczdykJZI5EdEPt7XmTdRw+zOM738wxRc97W96bvX4g
	pp/x/Lglz18RlpmQ80dTDqJjm2O6ixfbu0gfkhPCAB5EWGhz84L1KtuUn2FDf15CNaQGXs39b3sJq
	vRLBubkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGiW-0000000DkBO-0o7x;
	Thu, 16 Jan 2025 03:38:48 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGhG-0000000Dk2r-1JOR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 03:37:31 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21661be2c2dso7040305ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 19:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736998649; x=1737603449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EHN8VwPtCZBq9Z4WoEOrhUz545+6IZdCnpT0dOgO/wY=;
        b=gfrQWm7KsIzAgFihjFzOhtFo0VbRaPKKoEeWtM2DFP/Y0LPjXB81ME0ojqUw60aGbJ
         0KgjF25RiZTtSNjMsny17ZJQ4vT6EvsowS8+MmlHl+Or+7vrIDXRFD4kI9aHE7DPhkGz
         PtsRt/NV/ZWCzNNfmEn/dBWeS+5L+w4KM3Xx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736998649; x=1737603449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHN8VwPtCZBq9Z4WoEOrhUz545+6IZdCnpT0dOgO/wY=;
        b=w4Q3gLMKNL7PL1NGDgnw/nf/LOGJFPjW1BAaiYaNHvwUrG7Ijg9JpGTNjUJpsjKvtM
         GYdgeMeqUrzIw5KVdosS9EtRro681jN7kPJ0JihDnJ2zOyOfltjdgCFA1JXkqZOQPh/K
         FyFG8xh+yNM4cFexd9fv+fSJbDagDTUa8diPTsMldF9oSFb7nkGmJ6ZJOGkTXa1JHkP+
         R0GUDCqVfAcpDN1ik24wjQcDI6T43kXHh+wu7D5HRqX255i+Hlt/+VMXQ0viBAu+I++5
         Bw52HMnCmBbZsGCEwnuz+K7KRfMkVgQauwg16bRf6eUuJSvwQCMNNrrcsuC1c+zlh/Z3
         wWEA==
X-Forwarded-Encrypted: i=1; AJvYcCWHMR4EbY+iBM2YkY7MwAMRcTMIHdLp6YUJdPJOVf52XOtOoY5IecwCDfHoytFkpwBD1H/R2cy02+RIKG9J5aX/@lists.infradead.org
X-Gm-Message-State: AOJu0YyAUUHw8bQOhuahwBaEzGLIDm0RrcACoweQd7tUQsYDfMXKI0WZ
	ope0gUfD9jxRGmH9+coEPXbtaWGKWQuxHxroZRJHLp1yU9KsP0BF0a2O6k4/XQ==
X-Gm-Gg: ASbGncu9RlsdZJ39KzGrEllLz+7K7FnyJJy71rFGQk9aLXt6SQFCk67MpwqzI/UjjXy
	DzJCupzO5JLRMP80bOtt9X1+oMRje/RbvgNC5PTxRiLggNKlSE+/bQ/ft6ChezcuLD3yk0QfFMK
	eRuVcS88f7SogxyPn/tMpIiaL6Gpj1K7yZ+iglZppnQx+i2PW9N6sZjKkGndZnxcGLkgD4RLAqE
	4k7u2eHPK0XEMs6cw9rzToU0DbqgMray8TnQtTwbWS1TR6aeXjsLTOysNsgZ7dy9swcgToBWxbC
X-Google-Smtp-Source: AGHT+IGPHIlyquGny12YcL75NXc3XgLlu5eAhXbesmptiMTKimMfUbrOU/zhdc5d6pmMnPuAyOKk6g==
X-Received: by 2002:a17:902:c951:b0:216:5b64:90f6 with SMTP id d9443c01a7336-21a83fd28e4mr487517675ad.45.1736998649039;
        Wed, 15 Jan 2025 19:37:29 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:534a:ac09:3752:7758])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f2339dasm87714485ad.177.2025.01.15.19.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 19:37:28 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chris Lu <chris.lu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] Bluetooth: btusb: mediatek: Add locks for usb_driver_claim_interface()
Date: Wed, 15 Jan 2025 19:36:36 -0800
Message-ID: <20250115193636.1.If8b655b5c6877bd9a1136ba0f1cd61cc6a4b6e9c@changeid>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_193730_344280_401DC77C 
X-CRM114-Status: GOOD (  14.53  )
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

The documentation for usb_driver_claim_interface() says that "the
device lock" is needed when the function is called from places other
than probe(). This appears to be the lock for the USB interface
device. The Mediatek btusb code gets called via this path:

  Workqueue: hci0 hci_power_on [bluetooth]
  Call trace:
   usb_driver_claim_interface
   btusb_mtk_claim_iso_intf
   btusb_mtk_setup
   hci_dev_open_sync
   hci_power_on
   process_scheduled_works
   worker_thread
   kthread

With the above call trace the device lock hasn't been claimed. Claim
it.

Without this fix, we'd sometimes see the error "Failed to claim iso
interface". Sometimes we'd even see worse errors, like a NULL pointer
dereference (where `intf->dev.driver` was NULL) with a trace like:

  Call trace:
   usb_suspend_both
   usb_runtime_suspend
   __rpm_callback
   rpm_suspend
   pm_runtime_work
   process_scheduled_works

Both errors appear to be fixed with the proper locking.

Fixes: ceac1cb0259d ("Bluetooth: btusb: mediatek: add ISO data transmission functions")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/bluetooth/btusb.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 279fe6c115fa..f69df515d668 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2638,8 +2638,15 @@ static void btusb_mtk_claim_iso_intf(struct btusb_data *data)
 	struct btmtk_data *btmtk_data = hci_get_priv(data->hdev);
 	int err;
 
+	/*
+	 * The function usb_driver_claim_interface() is documented to need
+	 * locks held if it's not called from a probe routine. The code here
+	 * is called from the hci_power_on workqueue, so grab the lock.
+	 */
+	device_lock(&btmtk_data->isopkt_intf->dev);
 	err = usb_driver_claim_interface(&btusb_driver,
 					 btmtk_data->isopkt_intf, data);
+	device_unlock(&btmtk_data->isopkt_intf->dev);
 	if (err < 0) {
 		btmtk_data->isopkt_intf = NULL;
 		bt_dev_err(data->hdev, "Failed to claim iso interface");
-- 
2.48.0.rc2.279.g1de40edade-goog



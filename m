Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD6BC43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yXNEvMizuglXOCjkp4mAG2muXyzVgQAtby1OdmgJjvw=; b=a70D0qpAwwfGQpAZIo98fo7wVS
	Ica+5WrxF8YUF0HIPZvNTF7+4WlE+0BTrZz9ZbpghVIWvk5MKqCuE/nXDmRZheeEil/SCaalIZwqa
	KhUwelpcdBCOn6adrBUSKvJnb/zFGyhDj+IPsTGy6omJ/4Of79xleEK9Ja5G50uxpux1iXy0vne4M
	I43942Nyn+n7URQREMgEMFbOwqaQBTwKwf63QhF3kDgGxjZUdWaoDUNt3ICP6rfISolX2RJduDW8/
	B3py8Sk+U9UJtaCn6wMZwN44sERERylTYbonYg2x4Lq+7iwKpgCpL4SWtF8ciGM4x4dBlLI+EOOAV
	nq55oigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgc-00000006lBM-1g6M;
	Fri, 03 Jul 2026 11:03:58 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgZ-00000006l7z-4BRz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:03:57 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c9ed0c7fc7so6005475ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 04:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076635; x=1783681435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXNEvMizuglXOCjkp4mAG2muXyzVgQAtby1OdmgJjvw=;
        b=T4AcuYf3QA8vohqbBvnx3NcyDhFO0+pPDv9qWz+8yhCBWyTUDnLRCFrl65iug+SPQ9
         3p93A0wD7ClvtUPo65skKcW8fO6qrtG/AVuYlO8r0X2ba6mXT+yUVRLorR1iSRFg32zC
         Javi7+gTdnYjLosQazIRpwKXrQDLqyTCThTdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076635; x=1783681435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yXNEvMizuglXOCjkp4mAG2muXyzVgQAtby1OdmgJjvw=;
        b=T761kiifDLg3crPK3Hn0aFtPfldXJo3e/NtwNthxN/SfD0vNj9cvpPehJxqR9iK+Y4
         MhDZdUV8QENbefradEi7Q9zu3gCzZk8lqMHcQpwrtb6YGUW68v5Cwl16To2p3rUEBd1J
         LPVU22l+8qMZnNNdOaeaRTSBVyNBzF6f3g+t4OyJnvvY0BXoLLmjgL0oCXX8uzuuOJev
         6bkOTuDvOQiAKpXbBNBG0QO6wON8rVXnxjej42rft5QZX7QhDaG3SGnN6wiaXlo2SgO/
         bfoHvfPc9VHIvD8K6/OHzrKukccRwfp4OtWzuXqHqmjMXyv+Vq1NplQ2oUV6bHsAYEnC
         E/Rw==
X-Forwarded-Encrypted: i=1; AHgh+RrDbRVymlmuAVE8Nhl7T+0MbKgq5gR06zJjc2eokKQo46h00qKy1TdnCKPGpVTx7PeBY2fHPSE3533+n2z2VDWM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3BVIdjYGQbYRlMXKhOmuAvSl8GjO3qCz50NagLQKQO+fi24QR
	kivIMG+Jg2fSwP3bBYsLVuJKnVq3BksAuHzFV9UeiIylBvi+vqbfs5nqADQ3mqmwqQ==
X-Gm-Gg: AfdE7cldh9O0hoUnlU0CMmMIM1sitH4ZriK/3gAGPHSoY4SkMEVCwOmJVDB/umw5s1t
	vxPXg4eWRfMYzVqiaF07e6CtFw6lvHrFNp1PNv4dWHuE4Jy/msffFEQCFlBBTreZJMCgCQ0sp5W
	bTOXzg3xupQxY8O+emlj7hRrCXHYiKfD4Yoq5aANZYTFQfrYaZfLxe0dokpbYKiq9HGEYAk5jXT
	wztb7obcvtgv2CDyZFfVzfyD5Kwsfu9VAfENLIHuFXJGBs8+yzqrwOqc+zgafsqMgoF41angmKM
	lQtLUC//kgyyHK6w4R7biaAcWwcikEFRnkJ+CLhWer5muJKFrxN85OgX4t4aT8Q6eLkjjL2lgU0
	WRW8T0byPifKucp2toI4oXhHZT15608yfjK/4yMc8zRA8wMzTSA1aFEEaCp5woFblc4FSmfmz+V
	1zNl/Z8v4+lXJAR2s06RJQDK3z6Aq1Ul3kZ5duygKFG94kKvCJ7auRo2iX6+x20I1anK5tpg==
X-Received: by 2002:a17:902:ce0e:b0:2c9:b01a:fbd4 with SMTP id d9443c01a7336-2ca7e6c4036mr107709695ad.16.1783076635124;
        Fri, 03 Jul 2026 04:03:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 04/13] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Fri,  3 Jul 2026 19:03:05 +0800
Message-ID: <20260703110317.1283411-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040356_048897_F0C32BCB 
X-CRM114-Status: GOOD (  16.67  )
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

The addition of power sequencing descriptor handling in the USB hub code
requires dealing with deferred probing from pwrseq_get(). The power
sequencing provider may not yet be available when the USB hub probes.

Return the actual error code from hub_configure() when it fails, so that
the driver core can notice the deferred probe request.

Also rewrite this section into the standard error handling pattern:

    if (error) {
        # handle error
        return error;
    }

    # do more work
    return 0;

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Rewrite into standard error handling pattern

Changes since v1:
- Moved "int ret" declaration in hub_configure() over here from the next
  patch
---
 drivers/usb/core/hub.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 13264e86bc6d..fe10d72ef39d 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1874,6 +1874,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2005,14 +2006,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		usb_set_interface(hdev, 0, 0);
 	}
 
-	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
-		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
-
-		return 0;
+	ret = hub_configure(hub, &desc->endpoint[0].desc);
+	if (ret < 0) {
+		hub_disconnect(intf);
+		return ret;
 	}
 
-	hub_disconnect(intf);
-	return -ENODEV;
+	onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
+
+	return 0;
 }
 
 static int
-- 
2.55.0.rc0.799.gd6f94ed593-goog



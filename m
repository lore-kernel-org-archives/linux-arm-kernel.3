Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE12C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PR/rf/FwXUFRek4b9eCK6DZXZyozjvhZuepJNtfrJR4=; b=PW6dan6E1+lQykAI6PDktVfHtk
	8PLZtf0kTXry4qi8Gs25KWizdSyrFEp8UXffC2QtkVKTCdSqIBkXhvjVyTqieIxXivm18ejNYXZu6
	7QpB+yn9GNgUeRknr5+os2gkTB3thr0mfOPRg8brKOWltNnfZzi2zr/fAZmAPWs0GACbtDWneTn4x
	ag2dRLb9yBzJCdg7aGKDeGy31AtfZEgxwj3HR0eS/gg5p2CWUwo8NgFOdNfcR5XQf6UGZodq+QvSY
	mngvD4bmRbJ4XMqeKGZWDfrUeZA4QaxDC7n9LWMhrgTzHQ1ZGAnTn3j2eGR6TEwfjIV4uBb8YSM3Q
	dg/hsucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvO9-0000000EDf7-1dfN;
	Wed, 15 Jul 2026 08:54:45 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvO5-0000000EDa0-2o8k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:54:42 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so1846553b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105681; x=1784710481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PR/rf/FwXUFRek4b9eCK6DZXZyozjvhZuepJNtfrJR4=;
        b=bes5tvMeUIs+alm3kRRupRj5w7ICp4HcGSfXMN3gjmPSIaBECmcXKHY6nJdlPU8zVD
         trf2zYF9/jD5BX865dEgNfGhRCQeb0ds1zyCI6pJcCBK2xHYjI6YxdhfGRcF0cf4b4/R
         ShXNmK4guC9X37+EhpZcHyfVOOLTjPVThNuso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105681; x=1784710481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PR/rf/FwXUFRek4b9eCK6DZXZyozjvhZuepJNtfrJR4=;
        b=H8fyiP85DHqQV9wsaDyzHymbslq4h+MW/bqjX616hZduxO/OQ3mHVCygkuJQE+htlR
         B0qllmFnQ/iAIaJCDzqKa1NbWr0K4xsPoja1mcJPQY+iagRN0Zza4p//AKK+QA9vyII8
         s/e3w+B8Pncl3+KDnfMKk6SHlmwHM5VluiRzM36YOcmqRis3d2sSazJhpcBpJGK423ss
         hDAgKGp4IkZcCIIqa9qdpm/aZ0/lUDF/rXw5VJTLmWED0SpEydd6Pm/MhQsA5jhDIBad
         1pp+Dyr3+AGI/Fl75LMqm+Qr75yIw8gjQMkgVW1VDT97aoH3Vag3X3ViSpK8xwVh2UK7
         uxaw==
X-Forwarded-Encrypted: i=1; AHgh+RqsbFxty1Oq02RwClmGmAX96r91+d0ynQHcUECqRCHfNBj5f+He26Exr1Ihp+dtK6x9hS2sZgapLoT3BLFDUMOi@lists.infradead.org
X-Gm-Message-State: AOJu0YzMaCPHAt2JU+5aOghON2Ef4mlzpm4Us7S60GUyh6JSFxBL6oK0
	BFCUmwBUNoLi0NQvBAYtYjajIBry1JVuv1iNRL+sPbOQsQ6i23BffQJTYMExA8Fipw==
X-Gm-Gg: AfdE7ckWZ5z+4KbPaXT/6Bbe5K5aNmnfkKPRlOB4vLKu6lMQf6T059jzI+T4+ogxmHc
	A+iXP9oNIAJe+74zg0pXcJsZVJWIPz4dQtdFK7PMHhbeeEp106coa7FnXOqYxNGnpyPz1nsC8AU
	QKCDmVnL6KdjDgGlPb+sFiJrNfvYtO6ywUz4ooSsVknkDoi0EkcYU8rIBrOeHlGZgCXGc0AIMwJ
	r1JG3CsOiU4jaYRHzPbpOgQiTnHVBSD91OoHge5kMCar9RMqIuvo1GCvAs05/SYJIOfhB6Z39mf
	3665YWTPgKpviogQZ7mGVLKcifUhgDwlI41GQ0tPqtP0jBUSomicyyROu05oa6el4fRPZGPkPcE
	TIEEuVU9RyDF+0RhYlI3PR2uyp08DVK0RRe9BRwd6IhiUjmS6zIqz5jkl7Vh6HjqnMPkZa9zOtf
	bzjMVm66/69jI30vuop7XnezcKre54cGLNikk7ENRnvfSpmvENyZg4HgQteOufGAF0HMCOEQ==
X-Received: by 2002:a05:6a00:2384:b0:845:3033:6cbb with SMTP id d2e1a72fcca58-8487036fc99mr19629780b3a.11.1784105680847;
        Wed, 15 Jul 2026 01:54:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:54:40 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v5 05/16] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Wed, 15 Jul 2026 16:53:35 +0800
Message-ID: <20260715085348.3457359-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015441_748582_817341E0 
X-CRM114-Status: GOOD (  16.56  )
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
index 36342c5718bb..a260148091c5 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1872,6 +1872,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2003,14 +2004,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
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
2.55.0.795.g602f6c329a-goog



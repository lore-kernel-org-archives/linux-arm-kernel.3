Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB370C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFmIb/8YvdtZL49BMQqQktnO00n+EPHrLzK7Dg1eMRc=; b=hOBto1y4rvX/7qo1vzrFb22EgN
	UFBgfryRi4qnAIUZMKtwrfqWZ+mW09Ha4mfojZvIcXG1YUETMdq1DvII5rLBrhiHib+hg+8YYJCwS
	7lsauJYosaRRTC58VWYcgdmABeHd/U4mRZvCtXg8hwKYePV2cYk9knb1CeRuvA7qzNpnPAyYBAW3m
	LmnvTtTmmaOji37ZgtbAnXf2deH0pmIyOA0JV5n0enF5ybHTNCLX58LadROAHgyyztzYyI6bONYmb
	IF0UpLtDanSmufGNg7JbtdVnhbqhVGUz0JiryCPcuBrgXAWtGREAxqgEDMr/UUvtIMxbNl0DD2n8W
	/F66eRAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PWt-00000001QJS-1g4D;
	Fri, 04 Sep 2026 08:44:11 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PWq-00000001QFl-0S8L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:44:10 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-398e9698a70so665794a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 01:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511447; x=1789116247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFmIb/8YvdtZL49BMQqQktnO00n+EPHrLzK7Dg1eMRc=;
        b=IFakvcIYdmmu3tOpr5d6ItCCCEtaI1Zh7g5BGclmN9KVrzTqQDqD4D8+Lhurde8SXq
         7kiCs9lWdNCA4qVduYUkXVN9CDHqzkhd3zvy9bf2lC05fRK2jf11cofBHJmm5EZEJvKT
         uJIyntbHrsh8tctDHb1YsqDxP5rYO9oiaf72I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511447; x=1789116247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFmIb/8YvdtZL49BMQqQktnO00n+EPHrLzK7Dg1eMRc=;
        b=sIz5LiUxqZCjKZ9DzAGu37YmrTot51cwVUFFH6o0ULym4/6SttW+VnqnIJ92saRqjc
         vn5evnM27bXFqOpaLYo5hCCtxAK+bejwqPmvnpfdeEeJjN4JOGcf0/hey6NW8GF0kcV1
         Ro1F5J9SPNf93gF249PY/C5smXzIRMV3eaudvsCGa1Sm8efOxViBL5w6o8iwIghPgKwf
         jat8uS42ZokHKHq1yxd3nPNzmqGpUBkjSXgIN6nkmNPerNIL0a8qxexs8BM4nZwLY4Ya
         llcXOCvrXYO7L6JzWHRATC9vPUd9535fqFE2ifBtixj6thYxcVyXJ779AJCdU+tI5hhD
         cbfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzA4X4M5apsdBVYC65VKcO8s5SYisq34FWevsnwxvHovRDQ29jaEYDN5+wH6NcvVmEHPfR613ntIjBpDB/qXifb@lists.infradead.org
X-Gm-Message-State: AFuF++mqIZwS2QjK8WJY3148DLs0i2E02WgV4OD44flXbvE0oE8sUHY/
	SPP7S0RZ7GpBVVwuCCieSyK6tjrV/UnaeELo70GC5hb5aAFFQH7+pT0wQpMaU4BhRg==
X-Gm-Gg: AYBFou3AJYhgxMQqN45EtiCJOnIaLX30S4xh4wNcrq4d8YqEB8dBjZ8voxoS+HIOFQU
	Y/1Nh2giVkNaWelqrkIgLu3FIF5o1GOYt2Y65TiE+Jy+RQDhUfr1aQY4e1Nm725sAQSMxn2vmqI
	hr03EEQQ14u8yHFS3LVgNV7ThBpGUx/PMPjNm0gql7uFp5SHOPzQh2WL8xBcVCQK/t1Gb5x/tMa
	GLdU0wITsiF8cxznDw0jT7Vpsbe3Yjqqm04L1KM6SWI2MAub8W+/UPCQleWUFI986fzkhu+PfEg
	OpQ7tx/K5Jjfcjb/qv3Ssj/NHwYxDEXkY0j0xW9yrBwx8EwYJfXKLlgGXWqzURvoRKIua1+A2cW
	2QQiRgMWIMgGT1E8wPS+3md/VTk5Bv1q8C7alaoZh35xAxn2wcd7aLsToOmVta0r8yOW9P0UlNP
	5oPnc5OyB3jdQs1witQ4MU8ehl78eieEv/J8ZIokB1q0IFf+ydd3Q2MxrA1TOBp2UfJMl1KFBk9
	BpD5QapBabi6Lmwtr1jmzVM8IukkXG3MEONdLBSMGSr
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr7127157a91.25.1788511447090;
        Fri, 04 Sep 2026 01:44:07 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:06 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Subject: [PATCH v8 09/16] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Fri,  4 Sep 2026 16:41:48 +0800
Message-ID: <20260904084158.1341550-10-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014408_149676_6A0E0C53 
X-CRM114-Status: GOOD (  13.43  )
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

There are still some instances in the USB hub driver where port power is
directly controlled by toggling the USB_PORT_FEAT_POWER feature flag.

Switch these instances over to usb_hub_set_port_power() so that only one
unified function to do this exists. This makes adding external power
control with the power sequencing API easier and consistently applied.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/usb/core/hub.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 1b891088a653..b7991eb53197 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -976,11 +976,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
 		dev_dbg(hub->intfdev, "trying to enable port power on "
 				"non-switchable hub\n");
 	for (port1 = 1; port1 <= hub->hdev->maxchild; port1++)
-		if (test_bit(port1, hub->power_bits))
-			set_port_feature(hub->hdev, port1, USB_PORT_FEAT_POWER);
-		else
-			usb_clear_port_feature(hub->hdev, port1,
-						USB_PORT_FEAT_POWER);
+		usb_hub_set_port_power(hub->hdev, hub, port1,
+				       test_bit(port1, hub->power_bits));
 	if (do_delay)
 		msleep(hub_power_on_good_delay(hub));
 }
@@ -5440,7 +5437,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.979.g7e5102b832-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1F2C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jC877lcIipbzPO12i6mSRmQx7EEzSrLJZiMLFWRppMI=; b=DyeVIdmkltdGpEUXxFqJjaLvx9
	PwzLawuvn2AjeinTN4zHl9SMdiR9eeKrDpw0RZoCGe2uA+aBEKjd5CT5UIVtxNKJE+XKZR/lWXMMH
	45nKNYVctesjYLAa6p3BjnsbyAGLwnOpG3EssOfIyS1bANlcUt0YjET2a0bZXk3D1ojBje2JwLdBM
	PG51iJwrmsYCZ2GIdPBTXYP+74vwPqK8kZnxTOhXJI71BkbDH6SSoYP7AtxXGL0GDOPcQ3FUMLnl4
	/ZrHq+rS4LYFxezvgrr92SnxRAlw/adv24Lc2NU3TUtCsx45tEPx/CDRnrOpb6+V4hE73QB5s5vOc
	ai0zzFqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOV-0000000EE2n-3BNk;
	Wed, 15 Jul 2026 08:55:07 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOP-0000000EDtq-05WA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:55:02 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84847482584so1438905b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105700; x=1784710500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jC877lcIipbzPO12i6mSRmQx7EEzSrLJZiMLFWRppMI=;
        b=U4DX1olSGqj+alqTbEYOR5m1672oMJSaBlCHyI9n/59dMr5Czc7XBl4e1iK+01d+zK
         uPC6JG2Tf653IlpFtwYZq1psdqWvaM4gV/X5PHgHuyypf8NBzNWAJbwuandUu5PSqAWl
         JUchWoOHCuJweFZLLo8Ley0K8PsKt/WS9xKLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105700; x=1784710500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jC877lcIipbzPO12i6mSRmQx7EEzSrLJZiMLFWRppMI=;
        b=hyBvYXpHHwnVbOz/ZyvtMfCAJ3NAFbGMCjiPyhRx9G7kaiXZXyDJsxSWt/D1GaOyBW
         1heH2q4dbeszlK0nWNTX3gGFMydGMBxkVLcxUTZeXJvwEbUndIck/neF/lCtUr9ilJvy
         tkEfK8azXCEV3NTsoxAgiEk7i341f3TnwdrSt+O1Ake9Wj5JAoLkfV2vhkOxwa62ZR7a
         DEYOmk8w1UFZQWmSnt7EsE1QdAcaFSX21HSs/ETE80jI0qy2IE1+G3QJlTl6LUGnV33P
         tunZU6GVL0DJPhoDJkh13x/Y0pbCYUQHwgkSXm5myp884fLE15lZ6Mdt4os4ra0dwFK8
         GgHg==
X-Forwarded-Encrypted: i=1; AHgh+RqQ51QRYAm81/n+mvCkzyd8+m++HlySLMakTBK3k2tSPv9J9tBKXIiwQP78aj9SRE5EehECR8G24fQajhK038h7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8i19kUxcsRyPMWwOqi11Q8nqPMQ4yIHNK5cWF+R7b6hkD+WWi
	PdjJ1ZaBcXmnajhaUxA+wAjR2SecmuhI4OBHR+5zqPgh14R/DHaKYHnRUVcO9tnK3g==
X-Gm-Gg: AfdE7ckbw3ERbPDa5GJHcRz678eP0WCB+cnwGJUrztv1X2hs8tBcde4eIgeww3n8ohM
	+6b54qCBnu3gh12sVmByxem+I1LZIFHGxN4iJqMj+ILkQv9XAl+pJBSAB5n4vAIlqaCRzutn8l2
	0cZ6V+TQA0UM1tcos0qlB3uNvLzNOhv2D+f55UE+2pwgAjpAdwIKBBHBmffhg/5rfRUeTqx1WgJ
	wSR0cYOs/L8OGehOAq8xBi4C3ww/FNQlxW7WBSW2uyT//cxMaPlR000GjNLmzxQHY5h959MwtKh
	qRrHVlIJ5ZWTvS9kAdkyA6J+k+R3N824QQ1ykvHEajMF5gTeVruOWXJRSgKLNaKvl14z9+N/lC2
	tsR68CVs9uYeAqH90gMt4OPpxs3emC+tAe4m5G71esvj7lqPp4uPGK0bUNZP8+ZBU/vJ9JBxy12
	6z9U6xP1Z339vDkU+UwsaV62uJbYFa16pVx7FA6pMj0l2WnGNT26VT/+8v0+KsY3EVv/pJyw==
X-Received: by 2002:a05:6a00:3928:b0:848:2f58:e1e9 with SMTP id d2e1a72fcca58-84870790b80mr18374319b3a.36.1784105700341;
        Wed, 15 Jul 2026 01:55:00 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:00 -0700 (PDT)
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
Subject: [PATCH v5 09/16] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Wed, 15 Jul 2026 16:53:39 +0800
Message-ID: <20260715085348.3457359-10-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015501_137506_F96EAC9D 
X-CRM114-Status: GOOD (  13.19  )
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
index 40cdb63b5333..47010090d3b6 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -973,11 +973,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
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
@@ -5434,7 +5431,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.795.g602f6c329a-goog



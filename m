Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2778C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKZMmlDJFNSMtO9huPhOVTb/TTA3LxjwLBEnHIboH44=; b=mA5vqgfpspKAOSammzuhSXTg4Y
	8tcMtjJzWjHmUrCqyJzYbUzxCqa1ClZ/ZWfL1FAEXir95/BGbUIZQZhn6YqKk/ZTivTXEMSiaJfSa
	5Mpjn7RIt1mBiSQLqntVlveCah7cVoH0hHPYYwq0MrjAe6uhCP68qIf+55Z8aLcal5Rnrgzp3NIXl
	7V0xIQipiAR/ZPsw/hYJvTTM77h+y3RWLQhDlS6z/CbnOQMav0DU7ATtjwjXBVGfLh2WknGx49JPe
	tNox2hKugAXfUpdYnyu1g1fH1BxXLoNHNmZNMbs6QqHyYw9gqCydJBPQFts9mhY0qwxf2R9VMpb9I
	yWPaouIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kYE-00000008eGt-10SH;
	Wed, 16 Sep 2026 07:59:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kXt-00000008e3E-2JNh
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 07:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JKZMmlDJFNSMtO9huPhOVTb/TTA3LxjwLBEnHIboH44=; b=p0VhloZWpjipvmI12IgAYsnH7M
	b4/qvmJT4Ie33GGvl3kcwTbvp4zvAI2EC0OTvN13woMMLiHqq2Y6c8WYNWdkhe7Ay+TKaOFJFPKqU
	92IaZPGYc0VZdVAktEGTHevO6dbsE4TkFE5A4cWU6ULc/rgRMvrhqijGCwcAG71zZKkNnKoTSTkyh
	V8LACoLduXiF8VX7j+9GIefmL7Goy8u1GzR3cCvTd84R34CxB41QnYTvaEPYyCEN4YAcZeZIJtFNG
	aTNRZNTLfxGM8DjYH0E4vB8VV1SHed8bPKHQqeFrTf2fJPjQDJqS6CxRwut+xt9xCBROmNp8ta+RV
	8P/VPeyg==;
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6kXq-00000007ba6-2Ou0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:59:08 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc1cea4c7a0so429561a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 00:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545545; x=1790150345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKZMmlDJFNSMtO9huPhOVTb/TTA3LxjwLBEnHIboH44=;
        b=mZEz8L0lPEU9rioo7FTNWiW1RihtUcm+uTeoKdESbxTdI/11r83oLaIHu6/sGdtNA5
         xHNt6RA8vy/8LhDaEKmd+1AjAPADqOojmUPfQv2IiaoOdXMl9uDBTGOBxtExdD54S3D9
         VCn11Ze8AYoF4QvrvfpmV5f1Ncl15bjNViEFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545545; x=1790150345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JKZMmlDJFNSMtO9huPhOVTb/TTA3LxjwLBEnHIboH44=;
        b=g8kG1OCAA1uB0YD8Teo5021XyYggwaaIgciTXRqGrzeljFpBlDeDhjNtxTEeOy3Rd3
         fZ3zlehmiJt/PXFLHBwNdiUP+eRWN9tKp5IuoI2nbqz41bHEnNCFUrLgrz5Eh1Z26pyW
         lMKlQUetXsTTJETfNTpoOjRtrofaJJGPCwoWfjo9I5L+81h3XEeJuTbqKEgzM0pT+dvD
         5LSRS7eiJsMp4TSgjRQXFuucd59BDGnihM3cHxNfUARugrOrArwSmbFwrQDx9dQpOoaN
         JdFFLRA2iCXKLyYbp+fhZNRaCwS6tdbC9gOSTWB8ItIKzRMnkOQrLnCawHbbc5R4N7nO
         LVWA==
X-Forwarded-Encrypted: i=1; AKwUvBzuEjfzbTC9FLZWkHbzlTKSI/xznDh9u3KIvoBL8Nfc2l7KjXoi5aDYL7VCdT8IDkhlj6eR5QTH6IRkkeXIJ3VU@lists.infradead.org
X-Gm-Message-State: AFuF++mNimhZUeD1qXYHAKf61Da4oAD+amAT7ko+7rdIgldH+vpB/pNo
	VHf4zpcsF7sm/9pgacm0VUf8BLvMQ9QgtI+Bv742bkEnjuxn9iPwPRHJdfXXdq06fQ==
X-Gm-Gg: AYBFou381DVAZOp0YWhbamil0amSCI5vzBdtOWRHynCy4Z0aDOuhRyQfWIEkzxrCH6F
	rlE3LoVuhfA9yuINzQyfBtm9tdylTH6/ibGc+3nPRcSKEP44NWs64LxM2zF+LiW+a3SnHL2k/ga
	CVTJYqXVYlkhkOQU0W9tPPXLJAS+PLcmKxbO2/kd0iQ4KJEc20+fVtB+ktHKJOWGgEFWLvmfCjY
	CvB2q7GsW93NgpJujIaWJsYL18Jpd/2ULBoA0uj8XAtoupd83xRMIuOkUeJXsZTaTh2b9v11RZd
	fqgo1zQvZq/wYfN9h6v6cefW1nJBGZ3HJTlF/fCQnnvPCLHYKhtARENiFBjoRgxlGrXYMh3aEXq
	RtEukdTJoVsIHCCQBLpqu5z4tGvcLy/s1s/twrvMgy35LVszvT1f6I6JiMLKSpMYsIbygPmvrJd
	Fqyou0AMfZLPBFK3RetwzjYwEcNHB4LeZKrZVFj5X57cdlEPewxhbipyu8MSd9xEZb+p7DNbvGE
	DlD8040JLulxaneOTJf8EDGOlwqs7CWI84lDlHstITUhRO9uxsUYcnR3Q==
X-Received: by 2002:a17:90b:440c:b0:39d:fea0:c17 with SMTP id 98e67ed59e1d1-39e1e309c21mr3793724a91.8.1789545544841;
        Wed, 16 Sep 2026 00:59:04 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:04 -0700 (PDT)
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
Subject: [PATCH v9 08/15] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Wed, 16 Sep 2026 15:57:34 +0800
Message-ID: <20260916075745.3549953-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_085906_859616_1EFBF5A5 
X-CRM114-Status: GOOD (  13.31  )
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
index 1a98ccfe2664..f309ceea1969 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -979,11 +979,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
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
@@ -5461,7 +5458,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.1032.g73a4cd73de-goog



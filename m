Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D3AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWC74RHfH35yZoE+4T5JHX8GhXugEkV5aHendXMIUrQ=; b=VkDMqVKCbGO1pllsoP+x67VKnA
	MtS/9SeYFendk4cKE9Qh/053jsa6YHwZRzAGh7R7RMGN4YZKo/pABqPGs9a8vRwautstIzNw2V+B5
	kWsYcRa5AVqcfYx5/UyM0I1CkeM+NMVfYLFJzhRm27i4QMR9n5/HmnaNbTrGTB5oyO2N5ESUvrwgu
	gsXwKnucRcTiiN+CXZgtu26fuP4SaeGpYKQ2XP+1kkWXa0Vs8oErBJKYU+18aL8JPUUeZGX533VLh
	O/xkpa49RCAnChbrdHrjiVDybADaOoqbVhZPHVrLDt6U0PHw2YL1sfJtX20k5woT4TyxJp6adCcNy
	NfOBdtZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgo-00000006lRa-10jG;
	Fri, 03 Jul 2026 11:04:10 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgl-00000006lNw-3rd9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:04:09 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c9878bbe88so10403365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 04:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076647; x=1783681447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWC74RHfH35yZoE+4T5JHX8GhXugEkV5aHendXMIUrQ=;
        b=Pvobe+X3yLhkabqckBpHIvnCPunSImpm/GKU/qdWv535JTm1usICn+zmWefpdKeLku
         MYtjFT6ysHOPjFD6NC5HhZozN2tM6beVnaGH8M4pJCnjsO6ukVUoW2SXqlWbgFOFVT31
         xxRXMmvTsh4EHzIJ47TnfjqrmleldzFQDO1kI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076647; x=1783681447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KWC74RHfH35yZoE+4T5JHX8GhXugEkV5aHendXMIUrQ=;
        b=c46zweO2KjbCzOBR+StE4WRQNByvj8E5KWDxzz4FkILA5IJEB4lUPW2AJfusaS/7DZ
         3LYR8oghJC1zgxIiz/aBkaYC/TasPpMWLV6stNDTJaS8r5hcVMko+n/aoaxkh7uZuZbQ
         ikPlBFCNdf9PkD1wh3DzfRPycX8qTXJWRUsORpMxofdSBZUfZWK50PeDb1XEKiS/K7Do
         EDLqNKr0VRTlZP2u9NtapVf+i3YuAM/E+tT4SAs0OP8RIZbbziVxZ6SuQGliHtY4ZEC9
         KvxzDyUaxt0JtJphzMMF2MGVcgN1PhmxKPjxixzv+RFC4oN6GX4VrX7kDLuyfIuyH4rm
         jhoQ==
X-Forwarded-Encrypted: i=1; AHgh+RqscPg672vdtZj83YbfrSQB/IroglOoOGQpQN2bmKXJ2E0TrHujCDqOweYx8lYwrcAaMFZf3veHBcynx53dHAGu@lists.infradead.org
X-Gm-Message-State: AOJu0YxJiAPOZrqUjRW17i8nh2YynC5UQxCpbzJx0SeSeWxawF3viPxT
	5ApI8e0NKMxQM1S9/x2I+dbZ1S/behQJEyFVPQp84XIlmnPThLhrhgDEBIDgKULcwA==
X-Gm-Gg: AfdE7cmo+iOhq3PKQR9vwjTgJQg7h9T4TcauTRcorac6Q5ds9FFiqzqPpe2cM+1mdjP
	hYfFaiEkCOib4bl1SAqd4nYmys2j7pl6yHCPf/3czKIgPCyvVDUMDKKsBdL7ZdhktFSCrkoE3Dq
	Nw3mN9MHvlpV3zzDgoGuHeFmn2I2mo+6Tdbdu8B6jrTcSFZZPpFrfkuhrsRQc51I5ssEECKnO/u
	gztEtO8W/fPCZrZGBuQqZj4wvWm2sw9w1Pk62k+Hjz6FZfcpwV5DQnhPQX9aJVNOYfNuBiX/+c2
	+Bah2hELD2NYB3G/RIpyg4l6tZ3cRM5l2/TO/NOafs658mgcyvSHvb9jnsJ125/76rhIxJOazLD
	sB6ccSKAQUnH2KNX48V/Z7nbwLNtd069A/IT/xq38lyK+za62uhqIakaq13gggqSV1tSiMr/L9v
	lBtoVYGlq4etV+42KCsHmYxwIFHgXWp1a5w7FbadWUZl4DtrUqtGfBoeHS/rzx8aVdO+2Qcg==
X-Received: by 2002:a17:903:3b88:b0:2c9:d27b:af11 with SMTP id d9443c01a7336-2cacacc3ccamr39740205ad.11.1783076647262;
        Fri, 03 Jul 2026 04:04:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:06 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 07/13] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Fri,  3 Jul 2026 19:03:08 +0800
Message-ID: <20260703110317.1283411-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040408_084151_82269BA4 
X-CRM114-Status: GOOD (  13.18  )
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/usb/core/hub.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index da0a4cc8e15a..8ae97e8c26aa 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -975,11 +975,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
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
@@ -5452,7 +5449,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.rc0.799.gd6f94ed593-goog



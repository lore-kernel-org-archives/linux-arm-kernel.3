Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FCFCCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 15:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ranMJA7nhTTLeDvlm0qxHCF2jeri90ZrthFQur/cI2M=; b=avJ4di2aVNdAOcAs0nPYm6wbQw
	BWU0Ic+HSziNBJjVCphhr/z7OGHbkapH4bH4t3UN6S1TKrIuSmZXEa/uqn4Le+3wvaG51iv5jQ3Oe
	JYh+POZ0G0UpjeVX3CKlwBZ16xAF3d6x8ZqcdzxhQgYo4ezwdIMHW43ma3TQ6LxEU756UlMEsxugI
	eGbgIprVJWmNp8Pq4zGRBMrIGL0tYtxA6DjB8PyubwgoarE1K1XQR5u54d9L+WpVLK//iSUWwGmE9
	r6dT+X67LcIRx2Vgws3cDwbgEvINp00BoTOiDUqfm65VcVZRD9HreYX1MKuEBFFNAS2aZSQydQnlx
	BEQUCQhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfJN-0000000DuqG-3Ztk;
	Wed, 05 Nov 2025 15:20:37 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfJK-0000000DupM-3EhW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 15:20:37 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-426f1574a14so4213468f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 07:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762356033; x=1762960833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ranMJA7nhTTLeDvlm0qxHCF2jeri90ZrthFQur/cI2M=;
        b=P1MQ5hcM2KFGnyw9pKxGWKWbCuFLDd14MkHV1HSp3GEibmGbjrFs16t4fsjdBtq2Ot
         yfXgV6oXKVtfSZqgMAG8PZpjLMa8RWnPuMMRMgL6oqR2sr6gItC1paAuOdVHXnjWw8Ch
         DJhZLVIkkhv1FfZvV5oqFBLMIHV40k3UKligXWMC/RN46H8X/wwr/+WGVdCyoYZib86k
         B/FBxpXmgRVRIrAfmYIvKxxihpeECKS2HnVhtBMiXfqGVrpSllI9HzlIVxuaf+ii/Yoa
         ChHh87RbD15vft1iV9jI6/yKxaELRLjBzjkZMtJ+Jb6mfrtTJawv6ek6BYzgifOMT4UN
         FV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762356033; x=1762960833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ranMJA7nhTTLeDvlm0qxHCF2jeri90ZrthFQur/cI2M=;
        b=YnQVzZGB1uLk2OjlK4UPwzN09gwH2GgwBzu1EArozDKw7WrYgk+4qLecyMhCOhFVer
         zIoYv7OvwBDcVb3AuDqgwXj5vBI70QI7uRQPYlSZF9r7jf1rvFdvXMta08Fu74bgRMxd
         5zU+29QyKByNtBImtxf+HEmW/XiV3lLko6P/yXhjcBE/t4c2vdUc175+QNnu7wLMeIgj
         ggLqlai7QebYVOvAezolgkscbf9pMmYmAxPJydYGEO21MgTXO0C61rTQyrtrnvIyaxk2
         FE6JS/7SuHKsjzNKoBKkq6QTpr2bAl/0TluSKt/+3YP9zFKH9oGOZiTiwBQCrnSvDKOh
         rtxA==
X-Forwarded-Encrypted: i=1; AJvYcCUW/LwPvpHEfwE0UZ2HPYBze2Zti3PVB8FD/qiAHsfNJupRl/QY/sUKvXMWJR7TU3sAw2YC2K0df8GEcyRAHMeA@lists.infradead.org
X-Gm-Message-State: AOJu0YwVK0Fu79g1AQCCU7CkfY7+KNXDy3K2ADksLZTyxpPZO2FJMXdM
	1c+H1GgD67lZvC3f25L+seVJuCIaIi43MPGBwA6gpzo3+ABHscX62+34CJnUrcHGre0=
X-Gm-Gg: ASbGncslgjq7G3eSogRI6EAHZasx8XuQ6axLkPREFqKQZsnkGy4Y+XFAFjepuS7D4pI
	7EXd6o/+AyK0XCQyDvwevjM9Hq+kdvpHg5J13nr25/lDgayNmiT8EB+B1TsA9qiUlvNKrud8Xl9
	4ci9lIzihIIiQr3wZRGxx5zzRPLzzyK5/ccCMheIKR/9UMI06NwuKrgjmgQiuyNRIvj4YYLk9WV
	mzkj1slov6BEIqoIdiz+QEfsTGFd4E/X0ZnhA3gIhfjLB+6XPVLpjVITNyBqQTg2qaX9MCLh8C/
	J/Obo4iXL9imdXvvRSJHPissnw3Za8eR6h/Bruln1nIluXg7XtmE8LSO3YEKRHMm0tTLmk8Agm6
	SI2wAiq5Ns3zHbv0CndwqKjRMCUb+Zm4ex36s1h1VA5g40CebII3QHgquqduVJvy54hRdqplUY5
	mm6PbB8NX9jhnUFMbP5cpQ1SY=
X-Google-Smtp-Source: AGHT+IHUa1UagvSj8MVB8CHfM78Fkv+vbGeo68mTbHX615SxRGVOlXbaT5kn8JdN3BRCGmBUMVJgvw==
X-Received: by 2002:a05:6000:22ca:b0:429:c774:dbfc with SMTP id ffacd0b85a97d-429e32c8168mr3259102f8f.12.1762356032871;
        Wed, 05 Nov 2025 07:20:32 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc200878sm11018117f8f.45.2025.11.05.07.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 07:20:32 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH] phy: sun4i-usb: replace use of system_wq with system_percpu_wq
Date: Wed,  5 Nov 2025 16:20:23 +0100
Message-ID: <20251105152023.259813-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_072034_842334_762F4330 
X-CRM114-Status: GOOD (  15.61  )
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

Currently if a user enqueues a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

This patch continues the effort to refactor worqueue APIs, which has begun
with the change introducing new workqueues and a new alloc_workqueue flag:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

Replace system_wq with system_percpu_wq, keeping the same behavior.
The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 59d38d88efb0..e2fbf8ccf99e 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -359,7 +359,7 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		/* Force ISCR and cable state updates */
 		data->id_det = -1;
 		data->vbus_det = -1;
-		queue_delayed_work(system_wq, &data->detect, 0);
+		queue_delayed_work(system_percpu_wq, &data->detect, 0);
 	}
 
 	return 0;
@@ -482,7 +482,7 @@ static int sun4i_usb_phy_power_on(struct phy *_phy)
 
 	/* We must report Vbus high within OTG_TIME_A_WAIT_VRISE msec. */
 	if (phy->index == 0 && sun4i_usb_phy0_poll(data))
-		mod_delayed_work(system_wq, &data->detect, DEBOUNCE_TIME);
+		mod_delayed_work(system_percpu_wq, &data->detect, DEBOUNCE_TIME);
 
 	return 0;
 }
@@ -503,7 +503,7 @@ static int sun4i_usb_phy_power_off(struct phy *_phy)
 	 * Vbus gpio to not trigger an edge irq on Vbus off, so force a rescan.
 	 */
 	if (phy->index == 0 && !sun4i_usb_phy0_poll(data))
-		mod_delayed_work(system_wq, &data->detect, POLL_TIME);
+		mod_delayed_work(system_percpu_wq, &data->detect, POLL_TIME);
 
 	return 0;
 }
@@ -542,7 +542,7 @@ static int sun4i_usb_phy_set_mode(struct phy *_phy,
 
 	data->id_det = -1; /* Force reprocessing of id */
 	data->force_session_end = true;
-	queue_delayed_work(system_wq, &data->detect, 0);
+	queue_delayed_work(system_percpu_wq, &data->detect, 0);
 
 	return 0;
 }
@@ -654,7 +654,7 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct work_struct *work)
 		extcon_set_state_sync(data->extcon, EXTCON_USB, vbus_det);
 
 	if (sun4i_usb_phy0_poll(data))
-		queue_delayed_work(system_wq, &data->detect, POLL_TIME);
+		queue_delayed_work(system_percpu_wq, &data->detect, POLL_TIME);
 }
 
 static irqreturn_t sun4i_usb_phy0_id_vbus_det_irq(int irq, void *dev_id)
@@ -662,7 +662,7 @@ static irqreturn_t sun4i_usb_phy0_id_vbus_det_irq(int irq, void *dev_id)
 	struct sun4i_usb_phy_data *data = dev_id;
 
 	/* vbus or id changed, let the pins settle and then scan them */
-	mod_delayed_work(system_wq, &data->detect, DEBOUNCE_TIME);
+	mod_delayed_work(system_percpu_wq, &data->detect, DEBOUNCE_TIME);
 
 	return IRQ_HANDLED;
 }
@@ -676,7 +676,7 @@ static int sun4i_usb_phy0_vbus_notify(struct notifier_block *nb,
 
 	/* Properties on the vbus_power_supply changed, scan vbus_det */
 	if (val == PSY_EVENT_PROP_CHANGED && psy == data->vbus_power_supply)
-		mod_delayed_work(system_wq, &data->detect, DEBOUNCE_TIME);
+		mod_delayed_work(system_percpu_wq, &data->detect, DEBOUNCE_TIME);
 
 	return NOTIFY_OK;
 }
-- 
2.51.1



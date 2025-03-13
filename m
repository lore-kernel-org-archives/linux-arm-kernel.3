Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE85C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 15:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xZt+mlQFBZxNvQEdnGuW9k4Ji7TcJ+Lb9gt53WNlSq0=; b=YTieMLyBgPNi7xeP9J5egXjc6c
	SkLRGfJWlf6SatWLrBUmck5+ZEkIXdG+BM71DraO3YI2gbv6oI4lFRr6kIiQNPDOnw7EYeFxiF0Ns
	YQm/3M7tr9uHE2jA5l4jG6SWP75+XiIMSeprkgM+RJJTLsP3WkC8crUpyp854tHgWQX20t7dGcZzq
	KNUefubgJ56O+GafpM8f+QDniHXoGx74Wu5s5C6tXuNCkzpFXcCzMFDay12nIc7mLXvAJkJTNYNJ9
	7DI4hxuC8seHBSMNn/+yhp7g0nrM0xJtIvvNI8AJ1L13SJ22KfCQvlBIp1IPZFnrSO/uxDh6Wwe4d
	9xGs+nGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tskP1-0000000Be2U-0QQA;
	Thu, 13 Mar 2025 15:23:19 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tskNM-0000000Bduh-0HVp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 15:21:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7BA5431EB;
	Thu, 13 Mar 2025 15:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741879294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xZt+mlQFBZxNvQEdnGuW9k4Ji7TcJ+Lb9gt53WNlSq0=;
	b=d28oktsvrAkQowL9pEDD/JzIlNrJDAZM/UTHlfLgMS4DV51FmxXs1xDvXlKV64K7q55WhQ
	FdR6xI6M0/1qAwJxwqI2KERfwK9B+O7DRAznF2+CKl64T65e9+hOMo5dDvubeY4E+/NKOe
	hYHI13TGxa+CdqMSa0nSxW+eaqN6681i4a5+z6wxxitvfL/9J9AvwDZeDBNUlmTzQIgrjs
	24Aeny2Q5wxvEOASYlYxLkVmBFIbqDxtUQcc9VQvyECusNNxxWOhAsokvZRCg4ni4FoJKB
	S7gptuM4TGUKFjYsVWPp3MAkU/6aD1K2WCF7A+aT8xAsSouGFsqzqPHM3156AQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 13 Mar 2025 16:21:25 +0100
Subject: [PATCH v2] drm/mxsfb: fix missing rollback on failure in
 mxsfb_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-mxsfb_probe-fix-rollback-on-error-v2-1-38374088e8c7@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAPT30mcC/5WNWwqDMBBFtyL57pQ8LNZ+dR9FiomTGqoZmYhYx
 L03dQf9PJfLOZtIyAGTuBWbYFxCChQz6FMhXN/GF0LoMgst9UUaZWBck7fPicki+LAC0zDY1r2
 BIiAzMRhZlbaWV+lNKbJnYszHo/FoMvchzcSfI7mo3/qPfVGgoO20t1XdYens3RLNQ4hnR6No9
 n3/Aoq4bDbUAAAA
X-Change-ID: 20250313-mxsfb_probe-fix-rollback-on-error-3074b9080f34
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdekvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfffgeekhfdtveffheeuudeltefhfeduteekleffvefgfffgkeevfeejtdekkeenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtohepmhhitghhrggvlhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_082136_240425_02548892 
X-CRM114-Status: GOOD (  14.03  )
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

When aperture_remove_all_conflicting_devices() fails, the current code
returns without going through the rollback actions at the end of the
function, thus the actions done by drm_dev_alloc() and mxsfb_load() are not
undone.

Fix by moving this call at the very beginning of the probe function, so
that no rollback is needed if it fails. Conflicting drivers need to be
kicked out before setting up DRM anyway.

Fixes: c8e7b185d45b ("drm/mxsfb: Remove generic DRM drivers in probe function")
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
The offending commit is not yet merged into master, and even less in a
released kernel, so this does not need to go through stable.

Changes in v2:
- move this call at the beginning instead of adding a goto
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index c183b1112bc4e9fe4f3b048a2b6e4c98d1d47cb3..ee64053d381448360140c419fed1dc4fe9f7c68e 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -352,14 +352,6 @@ static int mxsfb_probe(struct platform_device *pdev)
 	struct drm_device *drm;
 	int ret;
 
-	drm = drm_dev_alloc(&mxsfb_driver, &pdev->dev);
-	if (IS_ERR(drm))
-		return PTR_ERR(drm);
-
-	ret = mxsfb_load(drm, device_get_match_data(&pdev->dev));
-	if (ret)
-		goto err_free;
-
 	/*
 	 * Remove early framebuffers (ie. simplefb). The framebuffer can be
 	 * located anywhere in RAM
@@ -369,6 +361,14 @@ static int mxsfb_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "can't kick out existing framebuffers\n");
 
+	drm = drm_dev_alloc(&mxsfb_driver, &pdev->dev);
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
+
+	ret = mxsfb_load(drm, device_get_match_data(&pdev->dev));
+	if (ret)
+		goto err_free;
+
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		goto err_unload;

---
base-commit: f9f087d946266bc5da7c3a17bd8fd9d01969e3cf
change-id: 20250313-mxsfb_probe-fix-rollback-on-error-3074b9080f34

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>



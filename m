Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4559AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vrsRvrI2fVkzeaX8UjmDzn0XjDjCg6WTOhzziOVkric=; b=vJ+bKoeoP5wIbuZ93pxYtKjwQp
	a6mZU6hTB1lb1OEeTOp7ra2xddtziX7ni5nrORbPPJa5LDGKwewCWGqvT1S0q7qvCUbkzdoIShsZT
	l5OIYC2Z+gylVsr4YlL1jzyBJJknksWWtSAjPUhgAN/CV2nItSmsBuMBPKeIv9DbtV2vVrbPgXl9A
	fJ/8apu8e9mj8UKChduMsSVqcaqH6bhaxkCo2VecA218D683wG5yqO5ZQSG+/kI5IpUxTMIOT/Rly
	aLmptLkvmI+8NkDZJHt/N9fTwZJT3GT1kxNhdpN1vmdM34+ICE7Up3CjqBt7e3bKKEmInqmR5nqEf
	lHaMlj4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjWv-0000000BWve-0pLI;
	Thu, 13 Mar 2025 14:27:25 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjVF-0000000BWhi-0OXr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 14:25:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70D27444F4;
	Thu, 13 Mar 2025 14:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741875937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vrsRvrI2fVkzeaX8UjmDzn0XjDjCg6WTOhzziOVkric=;
	b=KMEKgBVls9RbWZlGt4UHN2T0cibIhnQ4oQxSR9n5eSq2UlsemvsVLgxzZtRhUHqGlZk3PO
	pBScKqn59/3RGZdiZmr2bD857dG620+Vjqk3jrEFOoAQAvFDxjDnYF470hoQVgQCmMIwcr
	LpS3qx8TOFzc5hep5vyjXHLNtwZ4piXeh6c9q/ikQeVduy0uG560Jyyj48oTJrWlx6d6aF
	0sj7fHbaojLRTtSdXXsJ8FhGdGTNl+LVZOROCcHV+tMTu2aXAcS8oGDcNx50ID/DFP/go2
	sUMJkoa/UayqKhELoKovvpUjNt7dWfSKOsxjNLterwauL1PrAy+5HeFlnkSWEQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 13 Mar 2025 15:25:17 +0100
Subject: [PATCH] drm/mxsfb: fix missing rollback on failure in
 mxsfb_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-mxsfb_probe-fix-rollback-on-error-v1-1-ad2fb79de4cb@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAMzq0mcC/x2N0QqDMAwAf0XybCBaZW6/IjKspjPMNZLCEMR/t
 /h4cNwdkNiEE7yKA4z/kkRjhqosYFrG+GGUOTPUVLfkKoe/PQX/3kw9Y5AdTdfVj9MXNSKbqaG
 jR+Of1FFwDeTOZpzF+9EP53kBBQ8OK3MAAAA=
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdekudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfffgeekhfdtveffheeuudeltefhfeduteekleffvefgfffgkeevfeejtdekkeenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtr
 giiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghv
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_072541_613814_CD562511 
X-CRM114-Status: GOOD (  12.32  )
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

Fix by using a goto statament, as done for the previous and following error
conditions.

Fixes: c8e7b185d45b ("drm/mxsfb: Remove generic DRM drivers in probe function")
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
The offending commit is not yet merged into master, and even less in a
released kernel, so this does not need to go through stable.
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index c183b1112bc4e9fe4f3b048a2b6e4c98d1d47cb3..b4273e678d26dbc3dee2014266d61470da4e8010 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -365,9 +365,10 @@ static int mxsfb_probe(struct platform_device *pdev)
 	 * located anywhere in RAM
 	 */
 	ret = aperture_remove_all_conflicting_devices(mxsfb_driver.name);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "can't kick out existing framebuffers\n");
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "can't kick out existing framebuffers\n");
+		goto err_unload;
+	}
 
 	ret = drm_dev_register(drm, 0);
 	if (ret)

---
base-commit: f9f087d946266bc5da7c3a17bd8fd9d01969e3cf
change-id: 20250313-mxsfb_probe-fix-rollback-on-error-3074b9080f34

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED7AC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sl4qlttmKIif7Xuk+0Av+jVf6HGOZu8iMGZv9Qz/Mv0=; b=2fV4Rspr2ohYNj0qcIZRiCDEy+
	wh5VkkK6iXRDvamMxhciaBbnBOxMVBx20jlqHFIEZw7jYquwpPi6Llj33EWr8QuOlrAhsBJ3U8GCq
	Xg62uk7Y40UWFw/fmOt1UVu9R9+R7V7hbDNggbV951eyiSX/bDceox3Uth208VZH2jGzvgoXHtcut
	v9nHPLP3H1fOD6SbNiB2S2UJle5DveYvblymGH1geH06LoHeF7tgFA9yXqercPiPffc5ihnxohLVC
	Il16bbmjRXcpq139Wuu/FB5gdUcvRYGvwlmkxN9mCTUVAeOMn4SY0Z+QJrTAook4gS00kuKJHIhF/
	iNP29vgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5J0-00000008hui-34dq;
	Tue, 21 Jul 2026 07:54:22 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Iq-00000008hnV-3rC8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 07:54:14 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cace91f112so112955705ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 00:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620452; x=1785225252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sl4qlttmKIif7Xuk+0Av+jVf6HGOZu8iMGZv9Qz/Mv0=;
        b=Xs0BEdJEptJh0m9WHWt0WAQlgwcLFOXAwGZY9tfdkT2p0HbFdTHHfve8YC6EM7n6Bh
         wvvXioZnMIo0lHiI68qXx+zCoB+/gTh1iEFUchONURghQOO+HpqqFVobaI8vCuWL/k/9
         nEkjCtpGSEXMTLkhMtMbKcWaQBBDvusY91pAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620452; x=1785225252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sl4qlttmKIif7Xuk+0Av+jVf6HGOZu8iMGZv9Qz/Mv0=;
        b=dwnYxQCfqpNsYhlEapHUDQp3Y/Ca/cV1Jnrlly52lNQhJ8doLL2CVhvl/7NgrWRmBh
         IAYxDBOPDK4aaDdYoEajSCjxw11tL5KpxXz5b95GqJ3V6ItHeiuGDkdZH1lwtur8w0C+
         8Y+2VxYpinhBYksLagLHAxEtaNQ25Wut2kJ8C0WC5EtGmClO2OUIWXJmd/8jbkG9RsAQ
         p3mH5QFUXQ27IkDp2tOzOQzwDWJqXpvdqudM8qBKVc6CYG5GjxHpiwCbp0pEWUuqmvfq
         eWuDsvGXar7xJ56AKzUvS+9mFDLFo5gnzcuds0bCvxIQypwBtkPC38P+7E0exikypPmn
         Psvg==
X-Forwarded-Encrypted: i=1; AHgh+RoVd+c+Hl2yASixFcwntGNoo5Wy3AuFBPtcq9fJSBG2nHJNrwmVb2EzYiO6U3U1sIkqXRMr8qMHWENG78TVIpGP@lists.infradead.org
X-Gm-Message-State: AOJu0YwIJRWnRle61AY+iiDeHDPxqfjARgTKvy965Zosajakkvpamlka
	pMYz03xVcScIeGB8Xdz1unH6ZaLQ/uqJCvHVKFyfClS8rJaSJvL3bZKW6nv2pVpBag==
X-Gm-Gg: AR+sD111cxSVugFu4XcmJNrbpSPXrZSJ7mCWIHu6L6+PKjddflKnS8wa/a6CKfCswqY
	IvJILLEWOhqHeSQGoOcsn4pVCoxt1FhVi+D09WrVQ5a3mIeDNFMqzzkRc5MjXi6R3bc4KcL9ugI
	apdW4gMAnmc6rUlI2T3H24+PjLisi3DkDrl01LdUlbvIz5U93tnn/NxstUYiJUtzF4vnXVpTejV
	zW0dz3xBrC5OhpOED7GW4UQUP9Z1VWLmj/pVPgwznLictX+KQmhgkiBcUUqkG2wX0xFeCl/FeCw
	64IRwQ8KffzqbuIQRP91ZE9sNRQbPW290QrML3usGn4AiCOLoC/hjnzyy2rAdr5GKIitezznO3a
	LqNFCh4khZhvix0JlpeCGPTob5Vgxp6uUOjYAhl7TltyIYKLfFc9XRI1GRAm1Z7SpkeBNIvpFY3
	eXVdgwSti48M72gi1sCQXM/z12xKPF0gO+r4HB7FgwYWcnRbtDtQe/eJdmrsM=
X-Received: by 2002:a17:903:1210:b0:2ce:d34a:5959 with SMTP id d9443c01a7336-2cf34a3a5eemr181108535ad.44.1784620452343;
        Tue, 21 Jul 2026 00:54:12 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/9] Input: elan_i2c - Wait for initialization after enabling regulator supply
Date: Tue, 21 Jul 2026 15:52:17 +0800
Message-ID: <20260721075226.2347933-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005412_966491_0004E08E 
X-CRM114-Status: GOOD (  17.94  )
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

Elan trackpad controllers require some delay after enabling power to
the controller for the hardware and firmware to initialize:

  - 2ms for hardware initialization
  - 100ms for firmware initialization

Until then, the hardware will not respond to I2C transfers. This was
observed on the MT8173 Chromebooks after the regulator supply for the
trackpad was changed to "not always on".

Switch to the new regulator_enable_and_wait(). This makes sure that
enough time has passed since the regulator was first enabled, satisfying
the power sequencing delay requirement. This allows the delay to be
skipped if the regulator supply was already enabled by some other part
of the kernel, such as the I2C OF component prober.

Fixes: 6696777c6506 ("Input: add driver for Elan I2C/SMbus touchpad")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_enable_and_wait() API

Changes since v1:
- Delay only if the regulator was previously disabled / turned off
- Link to v1
  https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/
---
 drivers/input/mouse/elan_i2c_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 9f024a435dbf..77885930bf9e 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -36,6 +36,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
+#include <linux/time.h>
 #include <linux/uaccess.h>
 #include <linux/unaligned.h>
 
@@ -47,6 +48,8 @@
 #define ETP_FWIDTH_REDUCE	90
 #define ETP_FINGER_WIDTH	15
 #define ETP_RETRY_COUNT		3
+/* H/W init 2 ms + F/W init 100 ms w/ round up */
+#define ETP_POWER_ON_DELAY_US	(110 * USEC_PER_MSEC)
 
 /* quirks to control the device */
 #define ETP_QUIRK_QUICK_WAKEUP	BIT(0)
@@ -1250,7 +1253,7 @@ static int elan_probe(struct i2c_client *client)
 	if (IS_ERR(data->vcc))
 		return dev_err_probe(dev, PTR_ERR(data->vcc), "Failed to get 'vcc' regulator\n");
 
-	error = regulator_enable(data->vcc);
+	error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 	if (error) {
 		dev_err(dev, "Failed to enable regulator: %d\n", error);
 		return error;
@@ -1406,7 +1409,7 @@ static int elan_resume(struct device *dev)
 	int error;
 
 	if (!device_may_wakeup(dev)) {
-		error = regulator_enable(data->vcc);
+		error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 		if (error) {
 			dev_err(dev, "error %d enabling regulator\n", error);
 			goto err;
-- 
2.55.0.229.g6434b31f56-goog



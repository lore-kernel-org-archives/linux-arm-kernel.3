Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8A9C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqIw7LcK5jQdSK0s4Y8nxBRoBvyvqxkISqwhOeUOv4I=; b=mO9qVdjnYrpzZergj8lXwtJmkh
	3jEAtYNnmVTrCKNLr/C4qOusgw7/4Vf6w8fMsh1p0eWBTFQtGbHZZasuqh8t680N3tWYYCR9TWwaK
	TDnXQn5o46h8pN/jYykp+tsUj4a2SZ+5IcWfyT5xFsiCTCvzWTKKQjH+49KugjVB5ThF2BH3RbgiG
	Tvas55kzDA0u6Ttro4gYHy11dyox6Hw9KPROLoqtqYJ9tX5Y2XMOAAOUTfra+I3/rzPQncYs6ZPd2
	5ZJbmhjciia2v3oaaS+MLFQOTHmOP2GTZN9CA+MhkupLB2+/MyR9gzd/EiM3ODrr5GkqgWqkf8P19
	lMrwnqkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89bF-0000000GsYn-3kDA;
	Sun, 20 Sep 2026 04:56:25 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89bD-0000000GsWh-2EW8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:56:24 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747f0135fso19126845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880183; x=1790484983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqIw7LcK5jQdSK0s4Y8nxBRoBvyvqxkISqwhOeUOv4I=;
        b=klXjlKm3YqXDB5nz43kS0FGT4MDLNl8uoinTtMtgckqtd84L9BtTgCjKTxfReQ7Jsl
         p8YJoB5PeHLx0VfynWVZusVcopbCOPQqRRN+C4e0eOqTjHiMMnkooH4dpQlwU5FJk7Le
         RqnZrRlCxXwKFW02dHNrTUtAbg/S/V9Dn1Xv1xaE+dE2eCFMOVismDCbxlnfl1LbyroN
         yGHFzXqh/ZoeCZiIKd8eQlcMb5BKSSQ0Hy0cmg5iWSuMv3tQVVFvWltJFSKy/iMvUD2K
         k8WC/RyjOJAFuR9C5DvHaRzuQWLoDhhFNtz+0YMBVHF/5JJJB/PjX+Dl8piETiI3eWvY
         YPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880183; x=1790484983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqIw7LcK5jQdSK0s4Y8nxBRoBvyvqxkISqwhOeUOv4I=;
        b=pPyfGpAS+kgFe5fxvvuZQLLyjtOsrmRqas3xzstizXAYs+YMthaSrsalsIvMmQ603h
         aaIuaATIfieduFkcGhIW7BSrNmeP1iJtWNQrqZ9KV04QizsNZraSb8wvOK2cHEvVHK0B
         QhAs81sGT9+IEk+OLaLvGJIMcQEdLK3yOWcCEka6lGjG68GaJa+A+S6gtSXMSY9oBkTH
         xv3444DHPf2wWDurrqOyCzLK+ZTAAczO+8k1n42oHrp52KBvR0NzOdlIOI1mcrESfoUi
         RKpdWFVt3XntGm54W+jV02ZAqEBETLTaNX27f2LuPC0B4tohS9fhdd7+Z3+9fZ2kV77S
         ktIA==
X-Forwarded-Encrypted: i=1; AKwUvByrxFfj5rd00vMNpK1E+pppUQAKi9JmEdYeD6K5+7ZiubNtywq/trf3ghKM59J4/omvAPACCY3BPOFSf/ueSsGo@lists.infradead.org
X-Gm-Message-State: AFuF++m9T+PZcCgjiJNRlImt4KY5yRL6CmdMEI/PnIznY2Cnal/r9bdZ
	BzrKv11/iNVrymwTQgcj8xoSaKZRWY7et2l4cop+1NBHege4cRwezKsG
X-Gm-Gg: AYBFou0cV3ChHixvUid0U4po/N3NdwhsYElXONlma6gMiBW6eXqVXKfDewvtUyJPx+U
	G6ZonLqn9oQw6oMus4K+DkAe2DrTXLybwExLAS0gtT7L4H+zm3LAXMKZZIquNemWYNww9elQTct
	sBUR8Ccnq5eHiwFugFX3MYB0I4cwEyt6n09x9lANcIil1CyodQ4HEEJDK7swVE8hp5QBoLQSxuv
	I4zBkIbSBZOGZAMdc3PKOA67ch8ta+PSkxNjwfRZUGoKWoP+EHD9vtH8EMqr5kyMNJ6PDpSUSq5
	krBtk1jTKpjsqML7N9V4yTnQcSrE8qs9632fvks8I27wvOrg6aYIlVPPpHu1VQIfWflRXF0SskK
	QLZ70N9i8Swqjo627L6WIpMRIBFEf1n1zQ4QGfXFvlZGmWqDP6kUGcLv6D1MA4I3P/zTn5FyTpw
	m0T/XRr8CQ27S8WpSrCZBFzvS/cmw1O3raxDe0sOIu0+ZPerSLqK/VrML1cceSTRjyHFvv20UEr
	MWJYpH7HFZTD+DpF20oth/ynfHn9r8dPdC5SGteUAL1ttgrqIGH9FJmcbu9mHIKp/cQhyfolzfq
	5PmO1UcO/mEDBh6BLJKCtBeOrJfFES4+H9c47XaxR8kUTuM=
X-Received: by 2002:a17:903:984:b0:2d9:599e:df95 with SMTP id d9443c01a7336-2ddb1ac7dc7mr124652565ad.3.1789880182788;
        Sat, 19 Sep 2026 21:56:22 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:22 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:47 +1000
Subject: [PATCH 08/28] ALSA: control: Add kcontrol callbacks for
 lock/unlock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-8-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3895;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=hq0jHTZPh6rJ3zZLKaOltAD+GhyW13KMayUHUfC4/Ik=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xWKi03e3C3nqtgRqz/pt8BfFxWmzIUJDzd0z1yyQ
 +xM8rSijoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFXzMjJ8eL7wzf8MQd22z17z9l5xy770g6Hcr9EtrWTa9LDvL//pMzL8E/n2a9W
 Jk6+Nsj5e3Tn3Oldm8T57U3k+3hWvjp+ZGVTHDQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215623_590792_A36D6F4B 
X-CRM114-Status: GOOD (  18.41  )
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

From: Hector Martin <marcan@marcan.st>

This allows drivers to implement policy around locking/unlocking
controls, such as enforcing that a group of controls may only be locked
by the same process/file, and taking actions when the controls
lock/unlock (such as granting special access on lock and resetting
values on unlock).

This is, in particular, useful to implement volume safety controls, such
that only a particular process (that locks controls and completes a
handshake) may increase volumes above a given safe limit. It also allows
the volume to be automatically lowered if that process dies (which will
trigger an implicit unlock).

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/control.h |  7 +++++++
 sound/core/control.c    | 16 ++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index 909db0d0485d..6b3ef6be5100 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -15,9 +15,12 @@
 #define snd_kcontrol_chip(kcontrol) ((kcontrol)->private_data)
 
 struct snd_kcontrol;
+struct snd_ctl_file;
 typedef int (snd_kcontrol_info_t) (struct snd_kcontrol * kcontrol, struct snd_ctl_elem_info * uinfo);
 typedef int (snd_kcontrol_get_t) (struct snd_kcontrol * kcontrol, struct snd_ctl_elem_value * ucontrol);
 typedef int (snd_kcontrol_put_t) (struct snd_kcontrol * kcontrol, struct snd_ctl_elem_value * ucontrol);
+typedef int (snd_kcontrol_lock_t) (struct snd_kcontrol * kcontrol, struct snd_ctl_file *owner);
+typedef void (snd_kcontrol_unlock_t) (struct snd_kcontrol * kcontrol);
 typedef int (snd_kcontrol_tlv_rw_t)(struct snd_kcontrol *kcontrol,
 				    int op_flag, /* SNDRV_CTL_TLV_OP_XXX */
 				    unsigned int size,
@@ -56,6 +59,8 @@ struct snd_kcontrol_new {
 	snd_kcontrol_info_t *info;
 	snd_kcontrol_get_t *get;
 	snd_kcontrol_put_t *put;
+	snd_kcontrol_lock_t *lock;
+	snd_kcontrol_unlock_t *unlock;
 	union {
 		snd_kcontrol_tlv_rw_t *c;
 		const unsigned int *p;
@@ -75,6 +80,8 @@ struct snd_kcontrol {
 	snd_kcontrol_info_t *info;
 	snd_kcontrol_get_t *get;
 	snd_kcontrol_put_t *put;
+	snd_kcontrol_lock_t *lock;
+	snd_kcontrol_unlock_t *unlock;
 	union {
 		snd_kcontrol_tlv_rw_t *c;
 		const unsigned int *p;
diff --git a/sound/core/control.c b/sound/core/control.c
index 4199342d4ffe..c8aab9abd306 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -126,10 +126,12 @@ static int snd_ctl_release(struct inode *inode, struct file *file)
 	scoped_guard(rwsem_write, &card->controls_rwsem) {
 		list_for_each_entry(control, &card->controls, list)
 			for (idx = 0; idx < control->count; idx++)
-				if (control->vd[idx].owner == ctl)
+				if (control->vd[idx].owner == ctl) {
 					control->vd[idx].owner = NULL;
+					if (control->unlock)
+						control->unlock(control);
+				}
 	}
-
 	snd_fasync_free(ctl->fasync);
 	snd_ctl_empty_read_queue(ctl);
 	put_pid(ctl->pid);
@@ -306,6 +308,8 @@ struct snd_kcontrol *snd_ctl_new1(const struct snd_kcontrol_new *ncontrol,
 	kctl->info = ncontrol->info;
 	kctl->get = ncontrol->get;
 	kctl->put = ncontrol->put;
+	kctl->lock = ncontrol->lock;
+	kctl->unlock = ncontrol->unlock;
 	kctl->tlv.p = ncontrol->tlv.p;
 
 	kctl->private_value = ncontrol->private_value;
@@ -1487,6 +1491,12 @@ static int snd_ctl_elem_lock(struct snd_ctl_file *file,
 	vd = &kctl->vd[snd_ctl_get_ioff(kctl, &id)];
 	if (vd->owner)
 		return -EBUSY;
+
+	if (kctl->lock) {
+		int err = kctl->lock(kctl, file);
+		if (err < 0)
+			return err;
+	}
 	vd->owner = file;
 	return 0;
 }
@@ -1511,6 +1521,8 @@ static int snd_ctl_elem_unlock(struct snd_ctl_file *file,
 	if (vd->owner != file)
 		return -EPERM;
 	vd->owner = NULL;
+	if (kctl->unlock)
+		kctl->unlock(kctl);
 	return 0;
 }
 

-- 
2.55.0



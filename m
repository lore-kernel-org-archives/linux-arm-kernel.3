Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA273CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 06:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XtOntM+DwPje//4QSDQTMYk+EISPO8l4FquPrYyAROI=; b=1thneLhFq82LfMesu85/VY3cl3
	57XMKPxoHO6JHUBEwvyy+hx0eXaQSvYah6WdmM0WyOXMFo0javM4qXGqrPnCQAWrN27O6PKqyuHIA
	DuDJvdMK5vsPSlaZ6sV4IjVLWR0IthK3oUWvPa7d+ntLFUhsojU5TuOggsn8n+IcXw4m8zWu6JMAh
	G/zGkCdzb+PlJANRdUl5qQP0X217pOVI30Z8seY3OP+DIbrSvfDdlhErHzMDZGwkoSivTzFA8y20b
	OJzRGxm8mE7O5KgoWgiEvy9evx82BC2p9lxZ68FRJF1iBCRgmovUlpClFByWBvvmCECIY3zBcj+Fm
	nIoWMSQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLk-0000000ENcy-0GqQ;
	Sun, 04 Oct 2026 06:05:28 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLg-0000000ENZF-2S7B
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 06:05:27 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so408961a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 23:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093923; x=1791698723; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtOntM+DwPje//4QSDQTMYk+EISPO8l4FquPrYyAROI=;
        b=sfZ+gY7OMJFo4a6r+PCI+RBLZqwEhvSwDJHmAeOYQWN3Kiu3fXqBRnJvn5buamnYlA
         gcTlwWOIrFAFe43OPh6nAeRlfUtnO44/B8lPvoPIRed5SoL3K5XGW3hgSSe4+ZIeP8gx
         rdQ0WZ5lrqF1rmr6Y0iltbrLzENLQ59Dz48JOnMFX91pTC6WDm/lxsoAR5VlGF9Xb0qT
         w8FQVKisIlRSMwxuVnZdW2k7ULNMWYzEwchh51+9GsUtN4WPr0N1judQbXNz5Mjil3e0
         NQyAnwamnF2WGUuR/RnXVk9Nk/ihfIgi8+mEXtfiHn+XpgpbipQycTmC1FfrcRKS9c62
         74LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093923; x=1791698723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtOntM+DwPje//4QSDQTMYk+EISPO8l4FquPrYyAROI=;
        b=Esh/S1dk92R8/7pKtAO0HP6GGz/WIr49gytrSAI5+0u8kXWCOd3v+MBZIlJvc/k4v0
         8mQ9fr6ck1ZFHgLeI3ANkKMDEjvFn81PEHxGB3vNhjMrFMePg2GeBZPp5QEjM062GS6u
         r5PXOrfXAW6w4+bN4T3gyfLVnSEANx8DNjqWat3fWFzPMfWHxDDFmzTc81F2NILqO8Zv
         EB1yJzvDMWi4tTCJHuPY7gecj4XAq1RuzSBfkiUO4LdjgHKapHMN7+zIZcCqiYAhaUSh
         TDa4SVSDZZ0UVq0w1w3ceOsWL8NSLLBJV7r2ySV4VMOWgfz443mF4l0c8tpP6YqDE/91
         E7Vg==
X-Forwarded-Encrypted: i=1; AKwUvBxtvR1xtyAHve6jpoCw5YZYqbZf7A7Jv8B1w2x1m4HJZ8qOI9Vsb3Gh0YUjngtNWB465l1ZMlHoys/eFShbLh6B@lists.infradead.org
X-Gm-Message-State: AFq9FYJDikPL6Wrp0Iz1VTXhe6htaHYXHT1+JJtrmzzjywh3bl17ZnWt
	LQSmRMPFYv6JUEZHQazRWk7tUc75wCIEWb9lqrB9SBZFojAlbO/pJWCj
X-Gm-Gg: AYBFou2aeE+2TZY4OcFFlpMIZyZPB3xe4t8BVJIcbydyRSO3jVKN/RtfkPv+lNQINTk
	vcPvLj4Os6jwiFnY0x8rePYp/6LMygkIS14jCHhC8snatRGDD4Wyf5NOo8ce9kAZPKxKd3L4pmu
	M4FdvzvJnkwv2rbf26PLdfp/8rN8cQiVPU6QYkOQvgsWU68OEbAJV5XPVso+qtzjnIooLhROSVF
	HaCXjdtn6Oi46D25J3YM0fQwqOvCp271KO3uWMUvMqWNVuLpqv3tbe7G4+AQkJjmJJcejlO/BDj
	3URU1ehYt4C3ZMF/4xNkQr8/jljsSWKnd61RRfQ0NhrkrwQfr/k231nbn61szYukt9eAON9nBuT
	Y7zemXffE+oFm5cL+VQYr3uOZXY8UJPZfeWbwj/en49SGVWXiuPz56iAmnnp3kwtxixUI5/WfJk
	1OXJPQE13yvqrEfnhMdlTZJKS0wfOnXNekNuBdprYj1RTH8/MxAXkp+mvRVUAx6/yTRPnZ1qoDm
	N7ZQ/VCdGQ7TBRB9mir4smG4MY4VG5g6IOl7vFvwOY6Fk9JK5UJowxCW7aPZetfiZUY2mZTE0e+
	mEiUhqJrG2x9zDjoYAiJfppGW0qtbxAhp+gwXTt0niuGdD0=
X-Received: by 2002:a17:90b:518d:b0:3a4:c725:2870 with SMTP id 98e67ed59e1d1-3a6ce6cbcb4mr6425220a91.14.1791093923604;
        Sat, 03 Oct 2026 23:05:23 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:22 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:33 +1000
Subject: [PATCH v2 06/21] ASoC: ops: Introduce 'snd_soc_deactivate_kctl'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261004-macaudio-v2-6-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=6036NmB8QUKf+p136ljkCWVR3JbqpCuGrzZEQrA339g=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Rwx8sz1m1usna3nfnR4tO0LfE+T0oVJfZP4egsK
 plgJ3GsYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNVZkQz/C9fyLi3z/nX80mIZrmcW61+ws4sHvJp/fqnszFv3Z7lMWsLI0N6iMOd
 8mnDj5ZOMB45/1g3fI2oyhUO9dY6N7qZ99/vmcAMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230524_787017_13C3868B 
X-CRM114-Status: GOOD (  15.07  )
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

From: Martin Povišer <povik+lin@cutebit.org>

The new function can be used to deactivate controls. It is something
a machine driver may call in fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 34 +++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 553bb7e2be98..973ffaf6f060 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -578,6 +578,8 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
+int snd_soc_deactivate_kctl(struct snd_soc_card *card,
+	const char *name, int active);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 142f407e3939..4d799c5e44f1 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -471,6 +471,40 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 
+/**
+ * snd_soc_deactivate_kctl - Activate/deactivate control matching a name
+ *
+ * @card: where to look for the controls
+ * @name: name
+ * @active: non-zero to activate, zero to deactivate
+ *
+ * Return 0 for success, else error.
+ */
+int snd_soc_deactivate_kctl(struct snd_soc_card *card,
+	const char *name, int active)
+{
+	struct snd_kcontrol *kctl;
+	int ret = -EINVAL;
+
+	/* Sanity check for name */
+	if (unlikely(!name))
+		return -EINVAL;
+
+	kctl = snd_soc_card_get_kcontrol(card, name);
+
+	if (kctl) {
+		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
+		if (ret < 0)
+			return ret;
+	} else {
+		dev_dbg(card->dev, "Tried to de/activate unknown control '%s'\n",
+			name);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.55.0



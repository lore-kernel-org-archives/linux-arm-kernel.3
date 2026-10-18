Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E1BCCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 05:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkL5krI5HcwcF2aMm7pBYk9h5C6V+6rm4QZatT5Wuo4=; b=ok3y05fh5Y+1cUbOPU6uodRyLH
	8kIn3HXtV3ILSEz4ofWvgl3H0rV/C52Ai0zYLFUGXaa7qC5zeJjpb4S9COkR2h+gck8nmS08KEMyw
	uoPrZFzdWY+elWw/Mn6f0y8Pv/kfjGpRGnm3gI2ycRlvT/3iNrk61v3vr/3G9qRC5s1by4/ZnWUK/
	KmCLTZ3HDQyicrKlY69OBPHKxWHxuFjpTm4NDPC8zRYRDpA7vtv8S4a0JI94qOHo9xkwKIH9j7qSO
	BJUOiDM0yPbjwHugt/Pqag3F7E3ggR1bjC5b4RoKw/Oo4abg8lq1wYSy3EcVSpZh3/1tq+qlVEeCU
	DH0K5Cgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrX-00000005ZjK-498s;
	Sun, 18 Oct 2026 05:55:15 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrS-00000005ZgM-2bLU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 05:55:12 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2e9cf928dc9so1513215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 22:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302910; x=1792907710; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TkL5krI5HcwcF2aMm7pBYk9h5C6V+6rm4QZatT5Wuo4=;
        b=V3seBbI5of/mGuYKlPlHt1hYLhUULvsIofYfJv6aQpgI8UPviV0R095uu97X0x1u05
         HjIxwzcsXO+PcsFyNoPvLDoS87sZaYNFgfTWc8Ium4PSFRsEwgFV+wLqUz4iP9hjhQQF
         QE2Zgtguxf/hRaM+riFKYKuBcElzpWMxJtz+5LyuOC1afUqB3+smd/2yLSfxlGaZsHp8
         YTbE6LnmjbNZgzHpX0UOqVAj/XAU5XUoStCO5qR5cJxBSsmLOaLKim04MLlYs8DjaVzv
         Nss+0YzMxWSFY1gsBv+videz8S0mZZ30OJglqo+yjfkwhZqxM+1PYJiz5GAXfqFDOz/g
         UpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302910; x=1792907710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TkL5krI5HcwcF2aMm7pBYk9h5C6V+6rm4QZatT5Wuo4=;
        b=aJMtBylleBJ7TLFZvLhdsftAntVonbMBKvACNl/k+Orwde8wj597wpCSYt1US2ERaj
         +Mj5FcjHoDHBQUeA4XvtE6haBuo25YQfaOgqD2OBZcAWRJjmS5qGNKmtZ0aPCQmKXDJL
         s5vsB3rIscrocdH/1WKvu1wgY4aO3Y8/iPbKxAQCULHF65GBxrwlJJOSSA5opZ+FlCWq
         g6YIPu4zVmRSM0tZOcanrJjY63irl/06TmVYUhl5nnBDphnb4KqomJHsiFqFergpcTwp
         cwnC5Qul+9BBEU43/v4MB9MtTKh3S40+4TLiX78Szxv4NJsnkGbZ2hAVnNzwvAjA7eSq
         k0WA==
X-Forwarded-Encrypted: i=1; AKwUvBxKlS10oP0ktekIKkVORemS+5u5VQtrMhxDABuGm1cQ/cdnwm2sUVB6juAsh4xSq3hGrMG1l9B87yRMfPtST9Nh@lists.infradead.org
X-Gm-Message-State: AFq9FYJM9GO3Cmup9rijIgHiLaMjKaaT6QjfFNC/fAkcqYyFzzxFkHyy
	E4X1qdVexIXfUuy0WgZNMV7DUKwuGm3oIZnB8qKfSJzsrG9IKOpzUuu4
X-Gm-Gg: AYBFou2p+DXx8fQoShIU+mnZe0bpCtAeoJH7XqnrlEPhfNHeoUbFwraG197/++2DjJY
	pmmDGcAcO8m+wvs/+WtDUx5ZbvbS1qUnFr3CFzy29nU2EYrrsa8OX/nvTvE8SraqEmDoYfpVaGA
	9Ln7N++qMqgydC5rDL3CACln1SP4pu9YV2xbocf3rjsGM9YkfdSHhq0bpTgl0UJtjqkCyb9B3Mb
	JJCajgmCM+P71EZcf1BtUxxPg5rA5zQDB4KxdokIXHkz6f409bSFtGTcyFAinglpxj7oe9CrqOd
	A9CaV9viZK9JSOdvv7PSW5WLgvg2FB3UXLv0fgGrDimOigZge+1f+JKXYdp3aROeEp29lmDzK0m
	sE8ifXYgUh7o+CnoQ3WWqQLX4wFp7UzBNxIMD1bZTHqYAFD4Fbz1cSE81kQhSC0/WNjSkQhFCCs
	sBrsGVH1QQfxTxOYVUF9A+AJF3x7X8nBNwa1L0hetDdgRBgPviUwzowWghPPoon30XTFYKvbrEO
	BJyYJgbgIDnfEjGh5XxmcR5FzmxBmPDHYLrHy+TwPolqilgAEjNLuEOemzvvqQipnT3XsPRAwpi
	bBdHZeiB6qgx2aipoFj3yIehU6N/Md0CGSoXLtLyTSrCAJQ=
X-Received: by 2002:a17:90b:580c:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3acee2768cfmr2702377a91.6.1792302909929;
        Sat, 17 Oct 2026 22:55:09 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:53:58 +1000
Subject: [PATCH v3 04/21] ASoC: ops: Introduce 'snd_soc_ctl_activate'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-macaudio-v3-4-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2214;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=eogWKeAPSgLXuvFuxBpm0mCMpQlIZe0f6Gyo195bzv4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nlMut3rN7jGTw++yar56Nujo3kPXr314b2V6G32L
 sVitc3hjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFRzMTMyHGOoaN6st3+KE4v2kjMP89/dODOtQUhfq3/H9G9JAnm/7jEyfGvpbTO
 UNf+wb7uxRIrgSp3Pjs/Nzff/XjRR/I1lsJ4LEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225510_785726_20A9CAF3 
X-CRM114-Status: GOOD (  13.23  )
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

This function mirrors wraps the sound/core 'snd_ctl_activate_id'
for ASoC. Machine drivers may call it to lock down kcontrols
during fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 32 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 553bb7e2be98..7509824a6b2e 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -578,6 +578,8 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
+int snd_soc_ctl_activate(struct snd_soc_card *card,
+	const char *name, int active);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 142f407e3939..295056bcc081 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -471,6 +471,38 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 
+/**
+ * snd_soc_ctl_activate - Activate/deactivate a control matching a name
+ *
+ * @card: where to look for the control
+ * @name: name
+ * @active: zero to deactivate, nonzero to activate
+ *
+ * Return: 0 if unchanged, 1 if changed, or a negative error code on failure.
+ */
+int snd_soc_ctl_activate(struct snd_soc_card *card,
+			 const char *name, int active)
+{
+	struct snd_kcontrol *kctl;
+	int ret = -EINVAL;
+
+	if (!name)
+		return ret;
+
+	kctl = snd_soc_card_get_kcontrol(card, name);
+
+	if (kctl) {
+		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
+		if (ret < 0)
+			return ret;
+	} else {
+		dev_dbg(card->dev, "Tried to de/activate unknown control '%s'\n", name);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_ctl_activate);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.56.0



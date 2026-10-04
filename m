Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F53BCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 06:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nB/FQkcwt3QBSTG/xH/tXn+vR6SVQzg6Sj+xR8pJscw=; b=r5qeu5A6nC9SZLwVh1zGilG5iq
	2edGv+jkYoXANQfJo0GlCr0CkaUDXxWsSPnnV2PIVCivO/wrVxNUUgN/03aPlLrn8i0bGsWSKcHUW
	BU3dswcqPGN9jr2fMPUgBm06Zm/zIfAbSbv6XLtHLT3ZaITe7V3jJW5JTAapeU8c59kjxMkbuhkzD
	vDLLb4Y2VIzTxmL6oMqoIqgiVeH/vcNGaUiX0GfMM9OBqAVXznncNMlMrKwM0G44jKPQjAtVWubuI
	RfmfpGh0ayivd2qeCS4uzov1UhPuaaDRs7z85UOnl3tyTuQS/0hlV3Qy0J97ZcXiSKwOtBvpgO8b4
	JDYcNlFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLs-0000000ENjW-1717;
	Sun, 04 Oct 2026 06:05:36 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLn-0000000ENga-1Egx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 06:05:35 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso333210a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 23:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093931; x=1791698731; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nB/FQkcwt3QBSTG/xH/tXn+vR6SVQzg6Sj+xR8pJscw=;
        b=pCs33lEG6DEv8CDj69pt3g9cCU1WsdlNOU2xXDTSsjozzXK4vwrRG/171uQDpTu54H
         jw9dOQrXzPp+pKvwgpYU3sJk0WoGmKwIn8hYCFIihL8VSFIQ7de9gwhiMfLVl/B559zr
         UMT3wpPwmFR34C8k4fK/2j2SShV1WFB5HPu50tAB9gHjPQcFZNBveKtNF6pnz1kFoRc7
         0utsN2kghbrOzihGF8xaVmHKwu21Z/uPxlFM5w/6N+04VmVhJMO6Xegy1OmyNtu0ERFv
         IWV+n7Pfg0wPsH3SJXRIMHhwXPrv0Xl/9xwzVW/+NZApP70GV3GYFuMmN5RKSjG9Eu/n
         J5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093931; x=1791698731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nB/FQkcwt3QBSTG/xH/tXn+vR6SVQzg6Sj+xR8pJscw=;
        b=I7VSCrGAZNWS9OTkrDSj4rN1vJwD64tC4AIbexJRpTnCN41y6DI+ed2w1uT/2c1ujX
         Bs23tD9nrQI6rrb1XeBEmXrHO1E110mAdQciA1n2X9gfzwOrCQniar/QGpT5ajiOXbi9
         a+ASepxL/Eu3YBcCHqnarGPww66wcb0qiupE4YFqV9N+z6bisK7u8s4c4LY/sejwN+xG
         L+UnoJx3U3fdMXv5IAaLChzm42ce6fXq3zKYvPAvJB+gs2CsZs4DfceG7MCccywQ4FJa
         5ypePowunlef/wAEYpOBJ3exFIJ9yPAohcYyg+lZYZy/vS2vK32M+gJdD1ztFiWYeDfi
         fmDA==
X-Forwarded-Encrypted: i=1; AKwUvBza1pYBBjQFyFLq9bVim2RB5kf5y7+jEIgeUt7Tw97tDyjwDgzAvDXuPQChZ5PEd63GHmci/GcG7SLVOFfp+GHy@lists.infradead.org
X-Gm-Message-State: AFq9FYKjb+1izT8iWETV7kqI3lWYYOoRomB+ZGcfVIokrxmL+aUEuRK6
	I7PpsJeo/tGsxae1X7s0GpWnpT6sqYT+QH1bG1IaXRRcxX95y2XOSDR/
X-Gm-Gg: AYBFou0yby5ybTpCtJA9PuAx6YNCh1UpkpOFotoHTPax/DcBjgMhX3ZgZFNIOflCW7/
	zNGLuLrE0Ve6cGwe+JcK0w+xpwxWa2zdRHIkEx7eoDNNQ3Zgmxg8Y3ZulF4OyGzUvk0yOU5iRvo
	QLOderz+5dsjF5E8ftaFRO+QGeyUg67VhjR37ShTxg9x2L3UvPqNvGRSovcZmHodedNyptYnqFw
	sk70ISoIApjlK27sz0/zj67bQNeXmFXFvWnpRKPBtjuExJIwZriqru8Pf458IyfhrR+rniSDYkS
	E02OUg68qAeUZ4MxhlV4n4OTaD+KE/hkhYIPO55NIcJM4G/bAc6cA8VF0/DTUTvGTUgqcC/uxcs
	74T7W9CG4GB1Aej9cYK4Lr7//qjJnP9cHcJObIK/mRIdAlGRJaLA7/N5KwRISGjsJQy+o1wnu6o
	nyD+mf/zBI6hJEoXLWd/rGXzLjTEbqVLr2zdWl2oZrXByYDcEhED2Mpv53+X364iYFQ79thO3bH
	C4mbDycJvnrw5pqWZ7j1IhmP46pJP7UE5AfR9ilxtHM7ZnYktYxtIIplpVCD61wYPmbTs/kLfEg
	ZQ5r9XAGCYiOf1gHZsYlFYeQ9jwUCB/bN2+aSHXsA++QFdA=
X-Received: by 2002:a17:90b:1c10:b0:3a0:3673:dbc0 with SMTP id 98e67ed59e1d1-3a6ced24dffmr7196757a91.49.1791093930602;
        Sat, 03 Oct 2026 23:05:30 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:30 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:34 +1000
Subject: [PATCH v2 07/21] ASoC: ops: Introduce 'soc_set_enum_kctl'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261004-macaudio-v2-7-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2980;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=V04jnN0BX/eExW8BMvJ1EKB7GQ8dS9/fHjbsufpPsJ0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+SeP9XEmjx/guFTlbP/bIJ2rTjL/WTnSfEZCmw/P
 y19vanFrmMiC4MYF4OlmCLLhiYhj9lGbDf7RSr3wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVoe8Z/vuePN21q59JkvO12slnkrwfTh72P6jFlRZ0v4Vx55PDL4wZ/grlryn
 T7nH77WnauePd1ue/z2nyi7CuluJMFOmuXr8gghsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230531_349757_72052E7C 
X-CRM114-Status: GOOD (  17.99  )
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

The new function is to be used to set enumerated controls to desired
values. It is something a machine driver may call in fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 +
 sound/soc/soc-ops.c | 69 +++++++++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 973ffaf6f060..f356b553227d 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -580,6 +580,8 @@ int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
 int snd_soc_deactivate_kctl(struct snd_soc_card *card,
 	const char *name, int active);
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *strval);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 4d799c5e44f1..b1eb74e24193 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -505,6 +505,75 @@ int snd_soc_deactivate_kctl(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
 
+static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *value)
+{
+	struct snd_ctl_elem_value evalue = { 0 };
+	struct snd_ctl_elem_info info = { 0 };
+	int sel, i, ret;
+
+	ret = kctl->info(kctl, &info);
+	if (ret < 0)
+		return ret;
+
+	if (info.type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
+		return -EINVAL;
+
+	for (sel = 0; sel < info.value.enumerated.items; sel++) {
+		info.value.enumerated.item = sel;
+		ret = kctl->info(kctl, &info);
+		if (ret < 0)
+			return ret;
+
+		if (!strcmp(value, info.value.enumerated.name))
+			break;
+	}
+
+	if (sel == info.value.enumerated.items)
+		return -EINVAL;
+
+	for (i = 0; i < info.count; i++)
+		evalue.value.enumerated.item[i] = sel;
+
+	if (kctl->put)
+		return kctl->put(kctl, &evalue);
+	else
+		return -EINVAL;
+}
+
+/**
+ * snd_soc_set_enum_kctl - Set enumerated control matching a name
+ *
+ * @card: where to look for the controls
+ * @name: name
+ * @value: string value to set the controls to
+ *
+ * Return 0 on success, else error.
+ */
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *value)
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
+		ret = soc_set_enum_kctl(kctl, value);
+		if (ret)
+			return ret;
+	} else {
+		dev_dbg(card->dev, "Tried to set unknown control '%s' to '%s'\n",
+			name, value);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.55.0



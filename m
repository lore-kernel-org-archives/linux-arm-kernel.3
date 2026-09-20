Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01229C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWumTWBsv9GByVmif5mlGmCyRKrpCmaiWOQWTcHmLkY=; b=HAowwpIQva8bNP0UXS0r14d/Ic
	jU4xyRgeBCkYLLPhb+dyUJwBkhIxIZFQt/UtUsbEox39uIhuErvzcNZBclpHBhDkmaJmUSgp/99No
	8/tISwRQ8bAt2fsM4IN3WjaDSJEuZ7ejUMJi+VbobxNASdKAJqc0Xb3NDD2IHSvnSIKNGU8AWBUme
	8aurIhR9oS8vzbbxbaNhxfUAkFrto0cB9U0/nXZB56kpb2kqOJVJESzdjcJRYWIDuv/BVFzmSHAoy
	e8Y8I6FwKlo6z14PmeNabA11js+ipKOaPlc6eAG3/TEcDJtzek5I1tD99WDAdQeBwtLJjA3XuIC9k
	abKb4Zyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89c9-0000000GtI1-0Iet;
	Sun, 20 Sep 2026 04:57:21 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89c6-0000000GtFI-07j9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:57:19 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so17345015ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880237; x=1790485037; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWumTWBsv9GByVmif5mlGmCyRKrpCmaiWOQWTcHmLkY=;
        b=cq+gPMgdyPQJn61uhIr9EwXeL2IzfhsUaxlVHxK0awjCY388Nd9CgTtJ6eIlguPqD5
         FJV874xLWhycYTp7d+fUrjS6b1MfrfB67MpE2rpGV/9THHLdblTj7jskku7UJYTOdtj9
         By/rGzq9qFPCDWgWbCmel24zn0c97LJPzgWMCV7UQMlcFqNi+soVDpcDu2Dt9Jc1QcWT
         o15wjotrfp/tK75DQ/pP2aQxuQf0EwA4G72DXuPJ05QurGKZgaL6tl32iniMiz3Sdsia
         AhMGbkm/wEfqfmwn5R2ocOat1TAeIC7MODrdmhWWcI+TgB7cAxJYPQm+JQoNUI6d9yw4
         bJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880237; x=1790485037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWumTWBsv9GByVmif5mlGmCyRKrpCmaiWOQWTcHmLkY=;
        b=ATWLQWCqCAEFzfRL+DzOO+xQz64YoAxcgdmKVQn4eu5qKWwNsUyxn6Pk2yV+lC14RB
         uFsQrgr4P5sfOCKIP68NQVUo2AFZRoZGY9QOtRsYb3Kd3xpGHHpXocMAaZZuRigaDDbH
         R6XhK/mANlmzB6BiHwmSx/6TUxG+mTkWii/r5ue69GBO9YkbS+6tqVOyOg1QuUJuysuq
         0qCUhrQ/TwToVH6N7BjJ+v4NNZkkgEoxvGRZTZvjwlehHtfekCztHU1yC0TvOk9SJbQj
         m41K1L8AaBrbx5S4x8H0I+RUgTtTPGHBZIDdh13YKPt7bBu5Gmv/Xa591jsH4uhLldhq
         pOkw==
X-Forwarded-Encrypted: i=1; AKwUvBy961Wni8jVrBROOG/TsdJNXUlKb1PGdSLXoE4CHlxH1dgqYKkGwQ+5rp5S+0rUpNMAYY1YiI5wyebS+/bFf6DO@lists.infradead.org
X-Gm-Message-State: AFuF++k/UAM8NwJfnlnGsU5kHP9kX7FIZdG9Y64PISCadtCsWdNCJAeZ
	pOEDSiyeInzgEGmfBTx+yczZXXtrg2WrQ9hR5XS9cYxTm6WDYbdEzlod
X-Gm-Gg: AYBFou0gnjrdqO7EhmF+Ou9i9wWtPfBAIKx1dvv+0Yc/+Ao966HPG+/Gvz3kcPSvJPI
	7go3ptv+svY0yhAZ3XbhfSEQVPcDqrEl3+IistUAqxiFLCK7MeRoeeHqWNVlJ29UVi/F867DjU5
	sr7XyHzOiM0OW0U0RAI0m7BaZeTEkjhsL60CRNitV0CcOooyGJ2JjjLoL5DZlKqggchOkmYmfMw
	n9j3oWuEn/VB38bsGC2nhVXMjzB1oiIprW1STOq51mm092dZJAl/ZNawaJS8YE8DW6q1p/g4CV6
	9CsK0C9EOmQ59tuTlsdkZJge5ALrfdt5ZDlYp5mbAlFLlQ6mVfh/HwyXpqCRTW+SYJZxXMPUu5U
	g6+HU99PHj7OH+9VA/00wuvS+ava5Y2yrgcVpEZoFMXjir9Uv263GAq1LrNcWhpmX3xEEP94vhM
	aZHixsOHFSP0cl03uycg6VdHy15vHoKtN5VAo4P/rCh35VWqGpAzG3/Ki1LO0pwFVj9F14hrwpd
	u+tMkMqO2chphzUQOCN4yyDIR8ZIscqF926gArMTLrFrEDRffvp8AuofJput+nUmqcZYzHyTobr
	9/za5d1FOQVzi0kStVlJ/Wu7mrZ1+aIwy4/4Cgfsb/QPjcw=
X-Received: by 2002:a17:903:2350:b0:2d8:d4d0:7932 with SMTP id d9443c01a7336-2ddb1b99472mr110221825ad.22.1789880237323;
        Sat, 19 Sep 2026 21:57:17 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:57:17 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:53 +1000
Subject: [PATCH 14/28] ASoC: ops: Export snd_soc_control_matches()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-14-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2678;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=uxLGzSeW/mzW8E6v3Cg7Wd+ZjxhCKdm9ELh/X2EAU88=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xWLO9eyfbBor06vLstcdaLicvofUeZTBl/eBvFfe
 rmvsK22YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNX9PAz/s8qDIsvmh53P8D5Tz/lWc7XhN7NFpw+lskz3vNL/72d9IMP/oKod8dP
 Mjuve2bEroJZ3o1lo9uWXh9+oOpofqjxhlufLDQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215718_081089_F93415D2 
X-CRM114-Status: GOOD (  13.28  )
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

This helper is useful for drivers that want to do their own control
lookups and matching as part of more complex logic than the existing
operations.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h | 2 ++
 sound/soc/soc-ops.c | 9 +++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index d638fc69925c..6c4689ef8973 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -576,6 +576,8 @@ int snd_soc_get_volsw_sx(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
+bool snd_soc_control_matches(struct snd_kcontrol *kcontrol,
+	const char *pattern);
 int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
 int snd_soc_deactivate_kctl(struct snd_soc_card *card,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index dc27d1c409ab..94d0514be66d 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -403,7 +403,7 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(snd_soc_put_volsw_sx);
 
-static bool soc_control_matches(struct snd_kcontrol *kctl,
+bool snd_soc_control_matches(struct snd_kcontrol *kctl,
 	const char *pattern)
 {
 	const char *name = kctl->id.name;
@@ -425,6 +425,7 @@ static bool soc_control_matches(struct snd_kcontrol *kctl,
 
 	return !strcmp(name, pattern);
 }
+EXPORT_SYMBOL_GPL(snd_soc_control_matches);
 
 static int snd_soc_clip_to_platform_max(struct snd_kcontrol *kctl)
 {
@@ -492,7 +493,7 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 		return -EINVAL;
 
 	list_for_each_entry(kctl, &card->snd_card->controls, list) {
-		if (!soc_control_matches(kctl, name))
+		if (!snd_soc_control_matches(kctl, name))
 			continue;
 
 		ret = soc_limit_volume(kctl, max);
@@ -534,7 +535,7 @@ int snd_soc_deactivate_kctl(struct snd_soc_card *card,
 		return -EINVAL;
 
 	list_for_each_entry(kctl, &card->snd_card->controls, list) {
-		if (!soc_control_matches(kctl, name))
+		if (!snd_soc_control_matches(kctl, name))
 			continue;
 
 		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
@@ -604,7 +605,7 @@ int snd_soc_set_enum_kctl(struct snd_soc_card *card,
 		return -EINVAL;
 
 	list_for_each_entry(kctl, &card->snd_card->controls, list) {
-		if (!soc_control_matches(kctl, name))
+		if (!snd_soc_control_matches(kctl, name))
 			continue;
 
 		ret = soc_set_enum_kctl(kctl, value);

-- 
2.55.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CB6C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dXNK/OowzWM58hnD1jde+T7w0Zoo6WExVjNMgQVHK8=; b=ImOD4vMzEbZ8gQ10gAVVRgMkdF
	rrWciHV4wLmVwyjYUFDK0beNPGDxM4aMxwn0sqz1ZEU2aY8jYmd/1PjZF9SMYeGy/K5k2SFocmIaQ
	SmsXIHp3zz4eyX9sV0U/n7q3l5VV26EDUy5n/FQuDQiSTdG+NWz9KIjNP8Da8VViTOXyUcNPi07vc
	Q25+y6zJmYhYiQlMOk/hGFfwGYBS1v3pDFD3ewAtLKPLp3+D5lSHmUk3IkmUPn/Momg+CFR95AlvN
	CZ7a7QEvTnVdGt4z8p1EijGQ2ph8zgbTLFaRw6Qkc/Mk30f2+dDd0h4wTIjqTyGzrTAEqCR81t06j
	79bi2Vaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89bg-0000000Gsu5-0yf7;
	Sun, 20 Sep 2026 04:56:52 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89be-0000000GssE-1xMw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:56:51 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2db1ca069c8so20272315ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880210; x=1790485010; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3dXNK/OowzWM58hnD1jde+T7w0Zoo6WExVjNMgQVHK8=;
        b=fa+klqGpaXQypXURrg2R5hkYTaKP8f3kUYC82+LwVDhrIKn5m9ZYU22mG87L9fC+An
         8+ge8D0zYGO8mZWor7uv4UPNrhiebhm+4WtkCP+FzspB3zHCSfA9s70+PRHvEi/3x22N
         dKJ8EnzAPtzN0o6xsE8lNf5NavYPrT/k8vQJj8FGiT1zvOmG6+nLlkyd7Frdz89WfYbc
         r274++49a6DyK8PpVqZoXryY4d+gZ9u6KlYuHJjQpY/r/E8Y0yHQXqjeycotqH43YIis
         kW7lMNaZxdxIVLg9UvG4/QLdHmupUzkZa/Jpu3KP0wyvOiG1F8B21o3J/IQTg/ZpdcBJ
         JLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880210; x=1790485010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3dXNK/OowzWM58hnD1jde+T7w0Zoo6WExVjNMgQVHK8=;
        b=15+rMLGqXedFJLvrQG9m28A34ILUvGw3IX2ly57DrVzrlsH8pLSM7t1f+WXv3gB6ZJ
         AVjCkXaOYkXANYaFcj7nMhQUAOZs2kftBRVu7n5r9efE+QUSKU9bMClIq0TR+QBC70kn
         pSRvRXyIwaYUoWokwVXxdxEraUAdyW6Rv9hbx+JlsBubaMGOwe9awtjQaQu7sr6xM9ro
         qwu0lDhSl/XSXyIGkOcpjM97yr8u3HOJat+vTjpse3H63bzBa6aYc3kKq4Jen6JusQ/v
         zNz90cjlopec+0hW+qePxpv1Cf3eENheAP4YcVSpQecfWzUC6ZCsp9MazfUGKgL8LRxN
         qO9Q==
X-Forwarded-Encrypted: i=1; AKwUvByygl6zBxKwGxirLOkV7PBPhaUkoE7PHOc9Vsug+B8eiBl4iaDtp14OYIkY6GzBUdo4ItTHr6fgfm6Fqo6xNrpH@lists.infradead.org
X-Gm-Message-State: AFuF++lVa+6bid2uV0qkIQPOsgDoQFlD6W8Q/DGVmxK0S09a6c2Rh6nM
	ydbJwovCtIAHCzdt4Gs2eioTJXy533Nd1gqq4r3pUQgOG/2fGGP50GwW
X-Gm-Gg: AYBFou2Q2kdC5WdvLz6FXpAn/2GBxS8AKDCHQ658M4pdaWFgalpCRa6sTDtrOYeypJQ
	eqAdcKutE3AjoZUfnhQ+71zHgqreEhOi6WczxULzNMbghUJshMVmw0QTrbfaDPKprnCJin0cdw6
	F71MxVY1of50JRXNPqk5mvMgj7LczEW67x8gD2LTu+D3pRWvJGdNGMBi4QaQik2fzjIyh/vJ/CK
	/jfdyDdxg4MUQKIi85h+jxSx3Cqa1G8fFZG+ws3d/OW9fLOEnMB/6IGw1qzV+rPDdzLfrSVgz1L
	EbDsQI2pVibQFhj+kpa+Rl2YFyjmB34Nh7PddKmtWn2aBl7pAtj6PILF5mu7u9BQyNK1pnTxIb2
	UhS8gjMe9aKYC0hV+INOUfZYdIXPYxvi2dxSkR3i3+prLT7FDHpbA3vBNjC7A8YVxoAK5+bPfcS
	BCL8cL8PrtAjuMYym2vP2lrwZETES1dO/o2E9IBvPyXRtyzHxzNmT4dz7nPkByEHrdv+tbSBnTH
	28DjWmrXgtkXBwXKs7jgQHf8JMcxwgRW9yVRVMUgl6t7Idmumq2YINBpqiOY6lAROUwMXXW9jp5
	xFKw9BB/WC5DICke2TpR0WE7Gd+3PnCbo23K//xVQyzfHVU=
X-Received: by 2002:a17:902:f645:b0:2d8:d4d0:792b with SMTP id d9443c01a7336-2ddb1b79d84mr118058735ad.15.1789880209811;
        Sat, 19 Sep 2026 21:56:49 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:49 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:50 +1000
Subject: [PATCH 11/28] ASoC: ops: Introduce 'snd_soc_deactivate_kctl'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-11-741cc20a74e5@gmail.com>
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
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=4cm5zIm3FR1CXBqv5TeTAc7DTM6jYX/PUwYOK0HZ2oU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xVeP9V2u/i9uIX1ytYqxZ/snN8836Rv+51+YvqOp
 vWx0vd8OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFMtt5rhf3hUQtvsyg7bl9YHX3CIpm9Wea/cHlYhG3Jxoc2m8Led0owMv//eL7J
 x5Duk6RhwIVNQ43zMTevZAQlyynuN2G49FnzPDQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215650_521607_CC7789AE 
X-CRM114-Status: GOOD (  16.14  )
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

The new function can be used to deactivate controls -- either a single
one or in bulk by pattern. It is something a machine driver may call in
fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 38 +++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

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
index 2f91ee7946bb..d35e24df891b 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -512,6 +512,44 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 
+/**
+ * snd_soc_deactivate_kctl - Activate/deactivate controls matching a pattern
+ *
+ * @card: where to look for the controls
+ * @name: name pattern
+ * @active: non-zero to activate, zero to deactivate
+ *
+ * Return number of matching controls on success, else error.
+ * No controls need to match.
+ */
+int snd_soc_deactivate_kctl(struct snd_soc_card *card,
+	const char *name, int active)
+{
+	struct snd_kcontrol *kctl;
+	int hits = 0;
+	int ret;
+
+	/* Sanity check for name */
+	if (unlikely(!name))
+		return -EINVAL;
+
+	list_for_each_entry(kctl, &card->snd_card->controls, list) {
+		if (!soc_control_matches(kctl, name))
+			continue;
+
+		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
+		if (ret < 0)
+			return ret;
+		hits++;
+	}
+
+	if (!hits)
+		return -EINVAL;
+
+	return hits;
+}
+EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.55.0



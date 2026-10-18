Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518DBCCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 05:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oG7xpTf+2B5oFo7T4YVD/UfNfM1JDvvTcYxZXQ4liDI=; b=YqBcA2LCJB/n1kknbjX5FcMcik
	Gfk/z/SbpbRNT76lVVBQZMyEeVQ6zxhWUngyPy6K1nnfRQBxDnrEBXjGUeO5+VgcEsXby+FTQRO8c
	8bt53duXu/GqEJSi7cK85NIqBNcGr2tuYMp/W5mFzQw69yKbeiv9eJZ0kedbrGjGiuaJUUNX495XE
	TLMhVtOSXEd+EU+VNutW8O/gN60IxuSRvppGQGj9AyUHorJ5muSDR/KxLJnF5QeYn3VpPMu/h2o9b
	XKxomB3T1S2FfvyWDvu2nTiey8d9NB8Q7OqKkmNB98pkQABNElNgSedee/Esg/eA6TlkIAObgFh1L
	AvVxdd+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJs4-00000005a2V-3yjM;
	Sun, 18 Oct 2026 05:55:48 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrw-00000005Zvy-3XYh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 05:55:42 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3ab98332238so888950a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 22:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302940; x=1792907740; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oG7xpTf+2B5oFo7T4YVD/UfNfM1JDvvTcYxZXQ4liDI=;
        b=LMUYv+/4J8vWfSbfa/54eS+VR7NGkW/TubVHGIgS9YJHvTBkTwpD0G3xxg/lvVIyKR
         YNMtdqzNT7nAXE3rgsBUQecR6gV2B5KMj07mM5pFZavt5ao1KYIIHLS1f7okrf9OcA9d
         9xhrnnOMxgFrWhlJTs4nPP+mOiQWobRQ7NmtNQforzLI47zwuCZ3RSST4dEegZk9yd6d
         OzxHMq+0CCVhRI5xMf7tTrhgCznIghSiV73mJ0UgGLLWW4hiUwyYwT2xVnn2XNLsIzst
         X5ZY+SEUDnNIfVyCPwZ8qUoHspGoXRsygcrzARwJwsxaCqjOCbKwxWnSLWFYZhA+dCG9
         Legg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302940; x=1792907740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oG7xpTf+2B5oFo7T4YVD/UfNfM1JDvvTcYxZXQ4liDI=;
        b=ILNraX1dN7SVSaOz0QZrGqMkaza/GibWoq1VXY/6iPpm5RW0+niyJAxE+nN2oA4hR8
         +Vk3Q62GDJAGhyYe9ouLT0bMU97l97UorjVwAAzSZMOPEWxkWxb28BhEZtr7H6gcABUk
         CKy0ncfeGCI54NlW9M15p5+wBTcP7NHgPXHizEyaWAPsUumLZqNWHFxcRIrXWWqZ8uLL
         pUSzrmjm0HN3yYoSO3WKEJEdfZkD/R3G9Mp2s/D7dCYe2vGjGr2MuBdcO4q7UmYxlepT
         //+wH5XmXgwofZLbIfOj+JCzPspxc4YJULjiccAm2Wt8zAOmyx5UJslhQXExT0rR0Eu3
         OK7w==
X-Forwarded-Encrypted: i=1; AKwUvBzBV072jzstW0cDKYOHpYHPBhl05GWOWXtg9ntCCdETlj82wo8AIe1mZR5vgVNEkiWhSuD/ukqtBK9t1eyvpSHl@lists.infradead.org
X-Gm-Message-State: AFq9FYLc1ilgeM6JUD7buHBRwdhV5qXi+4YzmyzZRNOVwkvrxU/g3Hip
	6GsPsKqi5NkMNbIoNKCL02DiUWJ0SxwiEZQoPIJHO9Y5JmAzpl7aOji9
X-Gm-Gg: AYBFou0tckPl3Y6LGaj7ZmuXD3BO7YVGcvXVCL7wjCtmVFxshRDNoTJmiup0RbQAXW+
	ssoKfWDvZtous/0W1FBPzNDLcTobJxOA0ShtfEcp1+XkwC9rCDVtAhH+H1VQpPPf//1B74C8dkk
	9jNrvS1WnR0ADvQVuqACmF2sF+IWEmC/7fIUFCbc+beSCJHuVgtu90yVWrg2XOfGfDnaSJeS3Ej
	9ohsHcJKCfzAmfQOmsfhD3X/0g5JWGLkA2gIuvYyL17ZAHkY2O7gkyxinBcxyIMxf5S9iNAJTSf
	t28fHP6Ggp5e5zBCITQg0io9/meyP9gr6S9egz3nN1PLJN3KZegbRiV1FPmrCCvPbmswb+gUGfy
	UCRMIKy74aIiSCXRWgtJc8Ty9PZoLf55dyoT6ntM2bV/zza/lmBuij5oDMpOFL4lnyntrm/Ws1m
	KIgbEJp1b+h95jcp7kQLulT7z2tELsoISe5CmRPQbl8JEb0IxDa5kMERK6FWx34TxQbymj85gP/
	JdXdMEMZ6+uJegn0klvlNeUHe9E2jAhS7Kn2hxqN2YtK6z+uBX/Og0fjiWcq80UDyaDCGVw2046
	xjheRfjBeGECAWwgDw5tBJyu1lu9gl4y241LdVGQbaJXWo0=
X-Received: by 2002:a17:90a:d446:b0:3a4:e735:b39d with SMTP id 98e67ed59e1d1-3acef603b1dmr3522678a91.64.1792302940213;
        Sat, 17 Oct 2026 22:55:40 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:39 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:01 +1000
Subject: [PATCH v3 07/21] ASoC: tas2770: Add compatible for TAS5770L
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-7-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=758;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9blMBWr7YSyHeQmUBs/7VgENlyvjO/n7aari+GuU1zA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nnc7m2aKqH0TDBh9iuOyj/7pF3478Srb3rG07en6
 mJ/VbJQx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKrzzjL8s6yU1a66u2PRM+OLheZhW/a1Hub/Fv5y14fNKn+KvT4+5mFkODrn2ZI
 8QaFFRdVFE67HGHSc7Zm03eRM7jZDTdv23ua7nAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225540_912613_F88FC415 
X-CRM114-Status: GOOD (  11.07  )
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

TAS5770L is an Apple-specific variant of TAS2770 found in a number
of first-generation Apple Silicon Macs. Add a compatible for it.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 882e19857697..5dfddd3bd049 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -978,6 +978,7 @@ MODULE_DEVICE_TABLE(i2c, tas2770_i2c_id);
 #if defined(CONFIG_OF)
 static const struct of_device_id tas2770_of_match[] = {
 	{ .compatible = "ti,tas2770" },
+	{ .compatible = "ti,tas5770l" }, /* Apple variant */
 	{},
 };
 MODULE_DEVICE_TABLE(of, tas2770_of_match);

-- 
2.56.0



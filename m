Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C0EC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GkASic1hpzs9f+gvFBpKnk1ih+SNPRQduHprBjjh18=; b=HEiCNuTrfCdEgXZUnLvkFyHrls
	rjyIdrx3x2i6HuhLxaEc2/ZEQixughbzB71KQpPvdk0nDFkODrw2FEn8F8T2q0OoJpkkB/nM7ZjwK
	Ei2iYwyqBPktXFo46zWvyXLUz3VQV/QHUQr0aO40xIasD18W3YhVwxp/PE+hOioCH9bbggmpaUCh/
	e2n7UYA1zid9s+Mmm7pzSnD9wN2k7Fj9xljF9zOXbUSx0ih/+le4Qq1rJ8pS60Tz74pjrk3+xR8/f
	VUSBraA5AEpPQbdf/PmSkWShEWIu19r+p0Hmfagz+X3VBcA8bigwZdVHd7FR9lwQJqNrqAlyB4mh/
	8hlgeN4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89aN-0000000Grxg-363C;
	Sun, 20 Sep 2026 04:55:31 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89aK-0000000Grvp-2ylV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:55:30 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d91ede8035so23816165ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880128; x=1790484928; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GkASic1hpzs9f+gvFBpKnk1ih+SNPRQduHprBjjh18=;
        b=XxHHW8ciWLxatVSxf2s9gfbcZUM9YR9bp8p4uv6r/ecpW4ivnAg4jL8wniiEaKtX3g
         5usadD2vJ1ekq9xUI05KU2E6EKAg7nArr+I1vOY7rgy3a/pTiIKMBRpnww1HG8aVQlVj
         I0dmOSy3zWDzJJUMUQCdz2r1o4xeQWhna1pNSu0NmFkpV+Ge4ZpGPTt/sBXftfeNxEtb
         kJFjCnumq/vGTah6G+f2/SHRGnfGOPxjAdS3JvMlu4YeblSByQBw3P4SXtjfT3Wz0EF4
         AIrlrEVcDGohPPbX20QxqlAmZiJnAX09xwqPZqO5LujBXJz1gxxcHnDKc2NkeZOO3lnv
         6rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880128; x=1790484928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GkASic1hpzs9f+gvFBpKnk1ih+SNPRQduHprBjjh18=;
        b=O6gOby5p0nA4FQEBLKw3CTmPvV9RsVDSTOZG3oHud+5b+6VZMNjhaz/AeedQ1HUivg
         LvmiMjEdSy9yYMFPhhJMv2nEebGx+rG9PMAjzIXfWBnZAyVCWomN//mIfuLrgJCEvgv4
         OK9+6a1qXURc5OmCNpyCm7FYirCsj4lwev5af9sXi7YSFQoXRTsoV4F9nICGVKt6+kpc
         axS6/Ae/kF3BLn4oZxNQFMtKJ5toILm0lsDrcKs2ZP76UIeu9Ko/677XA58uUSMJ1fLE
         AdSpcbQR7YQ+cvLujyRJbBntsngyYiD1e3GiCV98ePhwyAIhgUzYYz6h6evwqOq65jUB
         ooeg==
X-Forwarded-Encrypted: i=1; AKwUvBxTde640XjVZXOBxq1nIODd6jj+VBGroQyR21zwHZjUM5H6Itf1043zALjOUr+OSBvKu1lrNanxiNPO5aeQ7iWC@lists.infradead.org
X-Gm-Message-State: AFuF++laeSdI+BNtTdXZLSp/yFd5n0jXgi2WgWWkCaucd0vIzvLPkbGp
	Amt2oGLwTyB9BXmAKXfe0JGMdymzufi32SPcUfNAoeF74NFhml8ePg98
X-Gm-Gg: AYBFou3X1b2hW3owDq4snn3S7TX5Ei2zmAL9dKzuQHgFfkxYBiJ2At7u5GE22IO8N68
	4Gn3O39ORbJZjFoaxOR7xvRBZTHGa++t8fpdvXcMFFunbgVKEx0um8TaQiKFccehMfThoeJ0Ryn
	duhKBl2DNrOvW2N6enOPOnmTyF0yXZmC2v80aP9VChUOn/TB37gk/q52mOhX6zEVmPu0382al+v
	H6WIW1vx2Wv0TfWcsSI504oBfhDid/ZuB8tlL5IeWAKLy0Qwydw3G+VcdFx9NrX6IXHip1dgrdj
	RahmSmF1L8YdoTHUBjIOkmOpiAriZ2clLH2IlU7v10NonDmp3fEGw/nEwxbIhPEW6jcFPwGeIcy
	WC+KTOuUuge09+iuskX6HnhhQ/fB781Qe8wKKNoIGvxSjC1Zfq07zXMq6E4ZZ8/ba4oZPGZrrxN
	VKv9wTCbMXRRvcBLf65hGctMHcb6pIkCOZsvZNtpP7Dj7nChxMpflMwHjXfrpdc5DoMWhxTO53b
	Fn0j25FRuglPcHiYesSSm95qVuKuJSVNEizpvnQJv0lzOV1pGiQzyCZ5ivh4DoGPl8gnfesHhNO
	Eh6A1bzzcW5HigZrvWIKSSYE1q6azWIqRUZ0TRLBtvjp+/0odyJ0InMj/A==
X-Received: by 2002:a17:903:1246:b0:2dd:ad74:ac81 with SMTP id d9443c01a7336-2ddb1bbfe2dmr111629155ad.28.1789880127792;
        Sat, 19 Sep 2026 21:55:27 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:27 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:41 +1000
Subject: [PATCH 02/28] ASoC: cs42l42: Fix typo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-2-741cc20a74e5@gmail.com>
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
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=847;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=RKZhvpz4A2rORIqdl27bjjryHeuUXe6kyHBpGORO8M0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+U3+zQnhu+zaJQKbtE55GvuMdeJjUP0Xn+D6iO1s
 kfcag4dE1kYxLgYLMUUWTY0CXnMNmK72S9SuRdmDisTyBBpkQYGIGBh4MtNzCs10jHSM9U21DM0
 0jHWMWLg4hSAqRZxZvjv09Fj/vVMx40H1RefGF4ryvsty2485Ub2Gn7jwwt+e7WcZmR4oruqv/L
 X3j3Zqp6fA2dZMNX5TDt+qnrCrGgbgfol+he5AA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215528_753226_043B037F 
X-CRM114-Status: GOOD (  13.91  )
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

From: Martin Povišer <povik@protonmail.com>

Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/cs42l42.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 9e40c03ada4e..b5d69d5516a6 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1682,7 +1682,7 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	if (cs42l42->suspended || !cs42l42->init_done)
 		return IRQ_NONE;
 
-	/* Read sticky registers to clear interurpt */
+	/* Read sticky registers to clear interrupt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
 		regmap_read(cs42l42->regmap, irq_params_table[i].status_addr,
 				&(stickies[i]));

-- 
2.55.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA084CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgQKBXBVqugKEAIaw6gam4xuekLuGQC8Pf1ITJyu83w=; b=S1IXJ/I8jCw2NFibQN10HJZriW
	pF8GUIaW89ShuLBunxpzDyWU7Yu9gjMypSVkqWfrr+Ik/abzYoyGtSlBARkZCn0oZS1Fl/khqECDs
	mWyFHt3PbCnlcyCz+oXpmLLWNtidu+to4wMfnRlX4qRKn1AL/TDD9BsaPkH9QqYx+P83K8aIL+zT2
	iSTdtXOjHFWGbODZeaQHa4tvMcU7EqoLxz35aYkltKWIrFu0iouzwccegeyktmmmlui16sUBFlL11
	YwryVwQUU7yu4QAJJXP3lQZBjvsDfvl7kaAZUJOcOh6NbWODxThYzgOx+ACZEZkW58aKrDsud5mLo
	FBXq18RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZncM-0000000H5OB-2pdE;
	Wed, 17 Jun 2026 10:35:34 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZncI-0000000H5KI-05ae
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:35:33 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-30b6dad2382so6291158eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692529; x=1782297329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgQKBXBVqugKEAIaw6gam4xuekLuGQC8Pf1ITJyu83w=;
        b=GDavGPi81pWPHRcpwxHcRiQ2uNIfnh8caHbYXcXg3LnwwAtaHJPC/LscyCoLCQ0WJ4
         8neiJKPWfv6duL4LP6UKPiszRjHbHV++2X8kQLjC2v0nQkE+EPIROpjbkVwWsjISxkkb
         0Fo61SBsS1b0t/S2cPuh2ZKSTZl3EzayirdmQhYW3hzQw4VYaUraYDeHG/+JAXeJBmds
         dYWA0RPS/QN+flaPuIYrcZNaFHZ3TsvU7vruFxsqbFKPgazfScJx5n7uDbCGjKOmiWK0
         bU5CgzgqACAKu4LhLS3t9ozwb72xVVrsvNxdZ/uqiI4xG0CtpVQw4FP/aQjd40x8DJ5z
         NokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692529; x=1782297329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HgQKBXBVqugKEAIaw6gam4xuekLuGQC8Pf1ITJyu83w=;
        b=ihsDl7oW0VEhiYy3mXD90EyO8qcf9UImwCkWLvVL9CPpW8BR2iVpR/cIR2KNe6YCt5
         9fIzyByz44V2P3YCWTqhW/GC48no6Jp26yqRsY5kXkEGVsM9SYUXPyfJSov19EzEzkf6
         KMt7wg9M8Df1faBncDpVNvchuLuNwkk0j56woXPzlkxBab0J+ytzNJfMwTGlIhz74euG
         GQuf+2dApgYYryJKBxojlEdvy3KJEe/51D/b2A6OivcDI4qrcT6fRj3GVHIvPfiN+Wh9
         1YfvUxhrzv+XigKeIe6gOxLe0Z/c8V3wymKuEL6KC0NGBGvqibSqHFj/n+7qjU060m10
         nydw==
X-Forwarded-Encrypted: i=1; AFNElJ8Tc1FeFTElLED7hMaav0QJjMxD2UdjlRcRGMIwrUBrEbLtGfLZdpDhOyZr+sD6Yd+ZGRWIxCKXhiPVjucJdLVx@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgs2m+pxrl5C7EuD2LzmNn6e+HkRcysSOEKKhqgxGX37zN7WAA
	ZuXNO1Sg/dyEUMTI8fx5oZ6ypEOf+oMkrMNOdNG0tRQVp2wk9p1CUnGQ
X-Gm-Gg: AfdE7ckr9DiiQx+Gks2rIyE6efsNM0ixYq6lSAO7wG3cdwdKGH9DIyN/ry2z90BQkRj
	uXitGCtH2MbZNsaM4rcCT7zD6al0VSn0GtZojhIOCQo6FbTo67clgNAnFPlM7Om6YguWrs36kFV
	WQNA3fNqvAH8v0evEyO0sKDBQ2+KoJqEq/daoN0c1F+MgSl/k6+l7k0jIgavt5I9sGQZg5v2Ge9
	2hjB1ir2L0njsMT5pT5NFPVzraUN1kmRmZMtw9EOh5HxFMvAWLTPnVwP46Yd1zF0M/mrI6DDCVh
	NEjxXqO5KKvy8yGvjSuLzPiuYRMaaS6p5EV8D6Yhl5wBLL36s3LI59st7uLnEBi/TLovbm8Tc4c
	gMjPjh7rkQEX9DwTj+gPSdmE82XX4KFHHuXS8wevAlIUF6WmfNU3MoyF+RfU25qQmKOIbbPiZo0
	L5z9w1fLOqEDbq1P+ELR2zJzCsbwaXKr7fimF7Vo8wWVIXRME=
X-Received: by 2002:a05:7300:6dac:b0:307:91f5:92e2 with SMTP id 5a478bee46e88-30bca90bafbmr1658562eec.4.1781692528915;
        Wed, 17 Jun 2026 03:35:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 16/78] ASoC: codecs: cs42l84: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:33 +0700
Message-ID: <20260617103235.449609-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033530_061236_12D8283E 
X-CRM114-Status: GOOD (  12.24  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs42l84.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index f2a58163de0e..a212f6891b40 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -281,10 +281,9 @@ static int cs42l84_set_jack(struct snd_soc_component *component, struct snd_soc_
 	struct cs42l84_private *cs42l84 = snd_soc_component_get_drvdata(component);
 
 	/* Prevent race with interrupt handler */
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	cs42l84->jack = jk;
 	snd_soc_jack_report(jk, cs42l84->hs_type, SND_JACK_HEADSET);
-	mutex_unlock(&cs42l84->irq_lock);
 
 	return 0;
 }
@@ -831,7 +830,7 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 	u8 current_ring_state;
 	int i;
 
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	/* Read sticky registers to clear interrupt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
 		regmap_read(cs42l84->regmap, irq_params_table[i].status_addr,
@@ -902,8 +901,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 				break;
 			}
 
-			mutex_unlock(&cs42l84->irq_lock);
-
 			return IRQ_HANDLED;
 		}
 
@@ -919,8 +916,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 		}
 	}
 
-	mutex_unlock(&cs42l84->irq_lock);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.43.0



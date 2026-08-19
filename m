Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878A5C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZQj+ONDwpbh4PJ71wQ7JZ+LMR8i+c4jITqEqjly3CM=; b=CIiY4/zYrXB/gVRku1OFLcWGJt
	nT2bmyumQfldBm4t2K2v1DhI66WnTmA9EBIgz0OjT9ajQ5UaIzh8Q51lLALvsWRLsr2Z73eB2u21C
	1HdF9BbybQ1TEDU8vgdsWaKWiN23EtiNv4aPQn9kxsjLkz20+RYBkQUD/9KWU5QNQegq0LWWLXQgP
	k+InXI5Ov1TQwTIJs1wYfxmk0EdOSToCqcxb9ZfGxuaPj0OxVb2CyDBGF/m+G+VJr/e2jeL9ofGha
	TOP25O7m+GL/clG5f/fVcCQVTqkW2Vw0HSWVDv+sSaJn1EIPRrgep2qLeW6XtVbzS7N/o3RM6vFrM
	WM++4mfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdN5-00000009VUk-0htm;
	Wed, 19 Aug 2026 10:18:11 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdN0-00000009VQS-148b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:18:08 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38101f85591so1745791a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 03:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134685; x=1787739485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZQj+ONDwpbh4PJ71wQ7JZ+LMR8i+c4jITqEqjly3CM=;
        b=miapOLXYCi9zmmc9GYsv84ybP+8LxUkZrxL9fHiIG40+NeED1mRgmTDpVqrlV9t0Co
         rcnQIz+seF1Rwifm0rwXXyJIwwfDznwMgw/UpebFPCVL36sWxmyd3XFAgrAw5DWWZvO4
         Tpw9cdHfbUAWaG1T036utGDk93K53d8ikknV1Dtx1laygu6P07kZKtoC24SB9hwNUH4M
         qt4YaaOV+/SrNJflyrVWDD0hBG3ns8SOySho3C7D2KLJvwiKf8hEfx27FWiSzqvlX6CT
         pPF/2n4eHkPRH0VPDbFK7pVcpb755aezu4Uoib3/rmAhpP9ghQSTubHli0F3diwLdZ9N
         l0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134685; x=1787739485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZQj+ONDwpbh4PJ71wQ7JZ+LMR8i+c4jITqEqjly3CM=;
        b=e69ti+d7VwjArDE3yZZggnfErxhf5OgEmlCI9Ylz6OaigZYycN//rDC6UdG3gBIG16
         qGA41kO1fD4LK0HPodfFu0qWanA0VjLrF+lCtSBKJXrLeJ1fJIEBOql3VLfLGJlP0m7A
         YBzLpevir2HznXzYhIm8aKqaDKBK89tkw0UugvRpbRn9+dHQdlyTS0vQNwk0YIIz+JfV
         z5/iN9ZRg/D7QWgstH6/u5nuiO3Cx9emj4KHTe9TK/7bkpaJLjrNMXtUybOK0Pl0zJg4
         e5xeSms+TVkTs1fkDKSylZ3hF1ysjCxSTzKR3NJ8yvpwSwketArzRxta31Vol3sJQn2W
         UyLg==
X-Forwarded-Encrypted: i=1; AHgh+Rpu2oblRN0CEMeDaNYhklXTLbnR4KcFeKEP573WuYyn/NeWnPo25nuZtQLAlpbK/vdX1yamfY/2AafZ0x3geRT4@lists.infradead.org
X-Gm-Message-State: AFuF++n8ArLkKrim65Y1j+5QG/5MulvyyX+w/DLe62rH6X2VWLfrWsua
	DHb8O/BQa9D4C85h/Bo7DXvNBT4iuA6qNVKJZEiIvGfHc9qEBLHGPBz1
X-Gm-Gg: AR+sD11o/1rgwoo0CVfsTJJ7Mirb9CK7ScHiuNke2x3eDjJlZ4BxMKSycxLYDDMOiCV
	i7gcXGu6q3zSek69U9oDwR490ks26e1vxnyD1kO4TcL091H1fR3ZJgJ/WXXVYY6hE4QR6vQR6a5
	jAqVJw9mL/HCtJBPW0exdrUVQ4CJeVK+oVV8wBLeh03EKcBWhmsmzJg/ZFOWP24Jydp9/RN/SQq
	e87FI+ahma7BAP0QHtLurylZ01wkRYxgWQa1zfJc609cxq3TwA23YM1P6k31qyurNzmWA5VJsmw
	CG2I4HBH2Dl8qzJt5r4FgTRE0RHTyroDxW66J5Sh3KNXkprFjBxyq6ly0sItTWUjvqkYSUWpSAG
	JFOfelEnajrRwYqF+CJvGuzX6dHlMrn9ORfDM5qKvYOcM+Fy1yh66WYEKs8m9N/iE+fdK8P1j8p
	QdciETutlXft7+3enalGkEVemVz0lZiuDRTgLIarTE+WbQf3JAW8AgOqo1USo91D5Ewi5gEnz+B
	2yWr+iOerYfgQFIR9exN/6FJd+0STvSEj8dLQRbNmg7GaxUfGlmKW2B/BQe7W9iEHJeic9eyOF5
	NTJI
X-Received: by 2002:a17:90b:1d0d:b0:38e:9ca8:e99 with SMTP id 98e67ed59e1d1-3957f8f8c35mr3775298a91.5.1787134685426;
        Wed, 19 Aug 2026 03:18:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb60a2bsm2222374a91.17.2026.08.19.03.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:18:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/3] ASoC: mediatek: mt6797: Drop redundant probe error messages
Date: Wed, 19 Aug 2026 17:17:36 +0700
Message-ID: <20260819101736.67632-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101736.67632-1-phucduc.bui@gmail.com>
References: <20260819101736.67632-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031806_987723_DA23A7F1 
X-CRM114-Status: GOOD (  13.51  )
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

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index f62a32f2f2b6..dfe67727fe47 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -754,10 +754,8 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt6797_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	/* regmap init */
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
@@ -800,10 +798,8 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt6797_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		return ret;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0



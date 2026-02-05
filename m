Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF68DE83F05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 05:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q36RarQ5zuLWjYNX7YesQ+nnj2Oub0jdvj6mHXnRkNk=; b=wgYBWpJ43sRM5YaCHdJvW0SIRu
	ycTxhHhZuBo6OpaNpXumnglhGgt8PpCCWCLnHajJsApJqucmHHgjdetj0UcR7C5z+vQRO/i3Avhbi
	sgRssFzlCriXyfcCYiJ3y6IOspK6IjWvhG3w1u8Enbz5iujpTDlulYqqmeiBrYiCKq91jDbJpPcWn
	5VY9Rf2U4nOPo1I9qRQIdT/XGcq80Fs2d6RVf6e7M4E+oHDJTCuh33bwQpDdr8bWaecNrN9aaXYrj
	zFw6dRFpHZ6AFMqxkcBCqoCYFktB1mfZLFHlEZtAu0jxnrcLPS8NJw8V0G+qUlUHdb3VEscAmCQqe
	MbkUnjrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnrr8-00000009S9I-1C76;
	Thu, 05 Feb 2026 05:24:42 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnrr0-00000009S8R-0vmR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 05:24:41 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7d18a9d2b1aso448868a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 21:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770269072; x=1770873872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q36RarQ5zuLWjYNX7YesQ+nnj2Oub0jdvj6mHXnRkNk=;
        b=ubrR4XIubTm2ZJhcBRimr5cZJlRPyzNrweHiR90J7ZRgziUez6R8zFQYJHIRMpja5l
         ZQsGnBY9cnIyFyA4fSVr/+4RQRjMMhOwGuSrqNjNSeue72EHdy254IUXBSaCTw7B3pu3
         OCwUpH0MSyNjIRzJsQuJGL/63Yk9gMGKFU8tMBHwNxJK1DRQZCFJgwVzSENNV8LLd0/1
         2Q4/GDg+dolZhuwFYoj/cYhD4Y7wLfdhqO3k5+aqGJ+e9Bkcmd+TH+S0glFTLhYrhD3v
         k4SWG4IwOftHcJAm2rcieea29/Lh+AJhboKfjrDx/e0W54/ZdG8wiD6AOXHRoI0Cg2h6
         tGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770269072; x=1770873872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q36RarQ5zuLWjYNX7YesQ+nnj2Oub0jdvj6mHXnRkNk=;
        b=vxUFmDvReAqcduM8wZlespDLJSc01LLfezCIcDFmYNB1kZzcLvRqMEtAAucHdM+jub
         HYg13qQxN4EoEdY1PKccYWaevIJh52cbjTPkIANMf4uELTduBFXEHjN86DYk3e8/AK4g
         l8YRBu2WxYBS1An853bGnsSFcCNMhZs7121iqgJ6oPN1EWpyz9xjxMtsBGLXz4cEV0LC
         EBecSkQAqFDnTLP2PXlGb5htwJpijstLKJJw+QPSllgdqFOhz8AAYKANcduE0saKDRYF
         HgOdbrq08z/kJBQTpnvFW+x4Nk0/4vub6UgMdLeXjY8K1OKs5g4rq47PjTsmecMlbp68
         JG5w==
X-Forwarded-Encrypted: i=1; AJvYcCW0rWRnsEpxf98ipDAuwignlW/P4CBXD4882GPzyKJGyYTkhblXfY9Cpc8uU4EjR1Dk0mOpkxfJZmgFESihqvJf@lists.infradead.org
X-Gm-Message-State: AOJu0YyKA4RM2dLbd8C3qhEFknlUTouwJOI5AAIwvozL2kYaDGFI7h0F
	RI/xPAWdgghdlssNyZEI5wJoImEPwQ9F1bQDU35Tmb7qyzZsulCNabFEsiwCbmt4yXk=
X-Gm-Gg: AZuq6aIWxV3Tw4+lrqqQeswAYaKNZziTctzhjo10S58DAiG6HACKQWDXb3pNLo0/ghy
	8ftg9ZYNINeB0N/ezWScgPN0MzFVhCheYv6B1mWhYz7CHTY5b1UlFSzFjQXxMjDPusRiUSQN8mp
	mwiF36I/scX0BKGj+KWpNEERm+u5YeO0fd6mOXMM5F4+aSeoGu/G0/AHSy9vsx4P/FduuCRVMqC
	ZFPkfLUCJGhc5P0OZ8SKLzi8ikAduXOaB0NIpx6j5E4Az5DY/QC+6JVVvpvHC8PRNWcIm7nLhMY
	OAAIcUVuG7eqN8SvaxMgxFm7tEgD8TSy+ibi1Gg1WibZN1I5ESfYi3+b/tWVW7Au5e3ZS6Y/o7W
	4UZ87pVIcK0rCBExfOCNgFbOgP3Lj6FxbyREUFdt7BZYOQjMjBLqQRYvFIjkGEs+HlqLNdgb95V
	efwS80QuvqxGf4DjCEyENmbO+rs1TphGy/91tqIdF9f+MdXVx39u//TMlc7o2Q0XrBc8UAuWpZg
	HGAYx3wH9YOGbozzXLaeyODRR1Ujd8=
X-Received: by 2002:a05:6830:2649:b0:7d1:87ef:2b01 with SMTP id 46e09a7af769-7d44899c6a7mr2655061a34.10.1770269072338;
        Wed, 04 Feb 2026 21:24:32 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d45bd28d81sm98644a34.6.2026.02.04.21.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 21:24:31 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] ASoC: fsl: imx-rpmsg: use snd_soc_find_dai_with_mutex() in probe
Date: Thu,  5 Feb 2026 05:24:29 +0000
Message-Id: <20260205052429.4046903-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_212440_421839_7BEB683C 
X-CRM114-Status: GOOD (  12.84  )
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

imx_rpmsg_probe() calls snd_soc_find_dai() without holding client_mutex.
However, snd_soc_find_dai() has lockdep_assert_held(&client_mutex)
indicating callers must hold this lock, as the function iterates over the
global component list.

All other callers of snd_soc_find_dai() either hold client_mutex via the
snd_soc_bind_card() path or use the snd_soc_find_dai_with_mutex() wrapper.

Use snd_soc_find_dai_with_mutex() instead to fix the missing lock
protection.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 sound/soc/fsl/imx-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 53f04d1f3280..76a8e68c1b62 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -145,7 +145,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	data->dai.ignore_pmdown_time = 1;
 
 	data->dai.cpus->dai_name = pdev->dev.platform_data;
-	cpu_dai = snd_soc_find_dai(data->dai.cpus);
+	cpu_dai = snd_soc_find_dai_with_mutex(data->dai.cpus);
 	if (!cpu_dai) {
 		ret = -EPROBE_DEFER;
 		goto fail;
-- 
2.34.1



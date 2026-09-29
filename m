Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF39C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lCOnM4BG9opzc/4UWmCexloGpdYaWaFpKWwedqDPapw=; b=RbyFXmyoN4YzHKWdy8R6OpujSP
	oKUiK3V1dvMtt+1iHsSta6SsmspCaPSDwZNaQtWjYJNTFr+QN3LfFTH3Ze8Ut3v8DQkgJRT97s1Hf
	aFGEALdH7SoeTUohz/llL09krpKXpdnFtepSF466e3DD6iDsFWhNJpRJ342NFkBOF5jCQjL7r54PN
	ZU39MFxrN66d4RB4NWf75NHJB7c6A2NgeD9+FhO//w3TE75h5z9iWcRtNskO1Kvdtd7W3xEtwg1Ty
	xuJzNzzHY5pOxlSXsu5jKb4A3d2Vmkwq9w6XYKwa6lQxtN+Quftw3tIKkCxVMjuGSNmZSGWx3QIS+
	4hECpwBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR48-00000002PdB-0iVd;
	Tue, 29 Sep 2026 06:11:48 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR45-00000002PcM-2H8z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 06:11:47 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so1660887a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 23:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662304; x=1791267104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lCOnM4BG9opzc/4UWmCexloGpdYaWaFpKWwedqDPapw=;
        b=LetmDwN9hHe95x+LqMBUscGDGUEFM21PsUvEa/zpm6jcxqEvXN+CvAIkUtOMWKYWEy
         vU7lK2a7UExcCuGJTjs9FLOcqnPE4NTNp02fKMYG7MGsDkx9p3gKJVcD5LNxXgLhQq/G
         q3UP8GAAkTd/uoISR7Gkc8+nEsIJTYtXutgczMLYZXW6q3YcBdZdKc5o54F/2IVC2QVM
         DjbOu1/wxiNmTGBhi3JLRR/O+7JreiBUkyMYIv83kN0QGurX+ie5e6QPoClx+x+HKjNE
         u6SkDOpbDa+HI+GVhydZMBCFcr062HwZK3l17tL0KF+8Xooj5cLPvDgwXg9m9e32YUVI
         qGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662304; x=1791267104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCOnM4BG9opzc/4UWmCexloGpdYaWaFpKWwedqDPapw=;
        b=xUTtwoviYIndvYk6P/MDbDjZhPCbUHOswqKkhFyFGyJO3bXJ8ikykSFh5Rrs2ZV3YY
         k2Xd2IdGHE+NrUZ8w4iMqVpaXAtyEJH3xs0R3U8lMX2Hs3G60+7XTgURg+pqaPII0VkH
         GknoFM/a1va+CCXodG9wzO5d9kp25IXQoyOwb2tcH4mkw60uXArkfWHu3nZVrzV6my5p
         k5+lmiu1HLm90rXt0adWWUrXxplYrtbTq8Wr0hXCBiHjs/ucVOgGmZ1RJMzeEC/GchNo
         WU2DrDh2n1ok5EI78cwAv55UnJ/dbtBbSa98CsUlka13UgFSuva6eqE/isJv8TGuiNL3
         i5zQ==
X-Forwarded-Encrypted: i=1; AKwUvBzERsh2yvAmRjg/gbFRyCFpu/7Nzxj4RJTb6vrQt9/6ozuk6cLxQa5zenTWjSTeaaSvO30Q1pvMBwV/NXoN5MaP@lists.infradead.org
X-Gm-Message-State: AFq9FYLYzTcvfp3q4I3mvi6td5IHLw9jO1d6V3khgXjuhOLLmBcKs6Af
	kis/xLHmeDW3n/IhTcLGczXPdl4JKTb/Tgrs2+mJ7+yAwccwINFT+yntDkVaSQ==
X-Gm-Gg: AYBFou2WjoH/1wxTa8Qbm083+fcJKWnx+oI/THtrhM3WMd7tkWp47WNpiLCsjo+w0Xc
	1rDyXa0ClYZjCxgcFs/oVp72nMDtriSjjQx3+QJ7STTVGSI0ssEHgkWflix7zpRTSVYDKH/HddW
	jUYC5P2veN1UlflNfkW2mh0noC65aLr0j8CwFHKQYvuGUruf93q8bfWjDFTE693l+d32M6B5Zan
	iBzDUxFkP3AeRV88SWcnIf+dJ63HfNI7kcn0WQEc6VG4qSNQfMdWDVeORdwgmKih7WlM1q0YuWW
	448doBhGlg32CVM0ZxtDUuwpafWfkZzaY48PTNnjl5Sd8IaNV8z6PV04G8Vkh9xCuVwokRrCLnj
	X/DO4f7HhYsewBg13Has4ICWWhVAQWxfUkrVO022S+/DDvvGJ6Lsaj/+yKFnaGntQD3Cz4WhIn3
	d1EHFlooCu8nvaHBGLZ/ruvPNUl7UDazwtin7mU82+e/FGtWxdeSrIatOIxk1pJ9y/CSEvgrXzK
	mFkG7OspxEz8ezJn8OdfOWRL/jj4gZVesdPcv+evzl8rmaNjlOsSfAnixqfesOIP1IDFeE8k9IQ
	8NaMgzt7bTQ79g==
X-Received: by 2002:a17:90b:4c4f:b0:3a0:bf0a:c9da with SMTP id 98e67ed59e1d1-3a0bf0ad1cbmr11373686a91.47.1790662303866;
        Mon, 28 Sep 2026 23:11:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:11:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/10] ASoC: mediatek: mt8196: Fix clock error handling
Date: Tue, 29 Sep 2026 13:11:11 +0700
Message-ID: <20260929061121.124001-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_231145_584889_5D770B13 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
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

Hi all,

This series improves error handling in the MT8196 ASoC driver,
mainly by checking and propagating errors from clock operations.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (10):
  ASoC: mediatek: mt8196: fix APLL mux error handling
  ASoC: mediatek: mt8196: fix APLL enable error handling
  ASoC: mediatek: mt8196: fix MCK error handling
  ASoC: mediatek: mt8196: fix register access clock error handling
  ASoC: mediatek: mt8196: propagate main clock errors
  ASoC: mediatek: mt8196: use dev_err_probe() in mt8196_init_clock()
  ASoC: mediatek: mt8196: fix runtime resume error handling
  ASoC: mediatek: mt8196: remove redundant error message
  ASoC: mediatek: mt8196: propagate I2S clock errors
  ASoC: mediatek: mt8196: propagate TDM clock errors

 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 145 ++++++++++++++-------
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c |  28 ++--
 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c |  17 ++-
 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c |  16 ++-
 4 files changed, 136 insertions(+), 70 deletions(-)

-- 
2.43.0



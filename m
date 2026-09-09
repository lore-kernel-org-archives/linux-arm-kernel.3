Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D891FC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 20:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMGCVsS43Or0QvhvusoStvupM2eWy3k0/84tq8T1pu0=; b=jrBW1skhtigku1HniSDcYtstuR
	yo+XATjzuK5QNMcQrLD0TFK1vne0Y9qolWWUu2NOiImTYbM5G4zVX4WipsrhSExpbXU7CTSAmF2/T
	h6ehzpNT9x6+yPhneY8KD1SEstKXDogtX70BM0mTfECVwBbtfYaLppHKkVk9X0bUKGV3kDzSJ1cGa
	2+SMPyowo/18lbw4vwvmXKc4i2N8KaEDtTZDBNIFH8iS1V/60TgUGHafSr8fQscUFxgcPwXKBz19C
	4+jXnatFkH7McPUNhLl2kmYHGOe9boBwUxbKlZ4XwdCFRu+KTwql2a+vuW9nsLgjkUugSf28qWFm9
	+HHW0IGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4P7k-0000000CpJx-3e59;
	Wed, 09 Sep 2026 20:42:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4P7j-0000000CpJg-3AYF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 20:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BMGCVsS43Or0QvhvusoStvupM2eWy3k0/84tq8T1pu0=; b=f/IcLkKSxtkbxCJRTdmQ/AszKT
	MMuS7HeQyZwKrhT1FF6cT7kLEzLeG5Au9X8lZuOEADR41M12xHNZFzkftubKNPZBGYvP8eMS+dluS
	Q8C42km8E5WfaeeWVvGdamA8DgQQdS25+d/OoI8qSzCmjr8RPAypUj1lZyMxaknZLJHcdnyPVueH/
	aID/2e3zi61ui1IsXu6T0ZVW/kbYRIH5QcYnLk2ayx9SMsTZyUzNQq2W1EX5JaANTR77dzymhBad9
	QUdiDf+bnLqj97ZMCIii2TWNeA3Gogihj6vPwoo4KKV3pEjqR4pCL/qZalLWlnxlnvGVld+UKalqY
	QI6En28A==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4P6D-00000001ehG-1B9H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 20:42:24 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so8459955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 13:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986451; x=1789591251; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BMGCVsS43Or0QvhvusoStvupM2eWy3k0/84tq8T1pu0=;
        b=lSc4ZTI/YEFTxNvLfxW6yN53W2cugN9EwjLynMZYYL4Eyft5SIO5d8OGUVrCHa65Ek
         xRwjxwYTzFnjA2fuYhGO291A3ZsNEV72zxxVHnseAyIq4xF/0pAj+s1xkybvdyVGgXDZ
         LeXlTGwI8gUK0AiRfSPHhMG+3jJY0+z9QUjx5MgZPXZsDRG2sSmodgfmGN82qpI9rkGy
         CaNgC08KrmsY1vutsgH+M8O3TpLnTnDvJwPsK9zUqY0Xo5l57WTMPW4u9g61yuRRF4bH
         /NvBwCRdNKlTeSJsFQGtcgkt10A7Am4CiIIB6D3DhnaMV0G0O1YVr6w6jgmNAYm3bBw8
         k/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986451; x=1789591251;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMGCVsS43Or0QvhvusoStvupM2eWy3k0/84tq8T1pu0=;
        b=PvMVLVK/c/C/mBtNdSKygFKCkj3FmAsGoDsyiqZB2gJ9D8s9yYMtpt3VXfG2/iAgv1
         T7R8wDoEqnbvksHIdBJbBN9gVa9827yFndhPTIcrAf3O4EXhNsSqaNcSWBpxArIRAr4N
         7DjqNCD589qQHV3vq0NO36Kv6TTxlxbDIT3PQCpb2YRiL3Ae9/VI2wsF0wAUx+iPVLzI
         nIzf5Jnl1WEalBVzo2sbAWP24Ut4le7IxnG0fWx+L23RyxjbRjLWTx1G/0Rfn8aK1fOa
         cDgOzSOd21ewrB8IE+12dpCdCfhvlabSEa5jNNcFZbB1LHCsZ7tDEXWLP+nEE4JJJuH9
         mmig==
X-Forwarded-Encrypted: i=1; AKwUvBzL0+DhZYWRFmj4RADEVOGBcVqLslE3+AP42FJlYlS/IqSORYyWgFSMfT3gVoSsapnEcwi5dDT6sPktOcGuR5zJ@lists.infradead.org
X-Gm-Message-State: AFuF++ncyQrT2pLvgVMyZ0J634yyVVYN2CaHRJQfCb92stYLx9MXAJxD
	83/hfmlJX/VosWNBrxwt2/EwkZIx+p2fMuO/uwmTuQcOiLugwdpA5N3M
X-Gm-Gg: AYBFou0hd8ICVcAy8NhdSETAvE/EExhdeCEzLUyYHEleLyrlmrm7XJYM+L9v6PeaghM
	bnLPtxjtd7eqXS5D/i0n/fnLo03ifAZVQcGOacFgIPS37SOEuLUUt4Platk3d6EHupeK8tsEByk
	lk0oqOy0zA4k6yZ7ko7FBPdqAFX0NqtkyhwGx+YQJU35WSKPu7pDLt9gEE6YAWelnnN4L9RL30G
	9V93QN0MwVxBDi5kKCVNDQfFyRwUdHmLGLfSXRSjGDb7NmbF7LUvEd3mFZCiXoFMb7+JgaF/CvR
	LDzkRH37SPAkD7lMyVprF6wzZprBTTbDth+3QO7aeQ+5DodVTPS53BVWx0MJcGRgFsVxicKFvUE
	3ffHbGAFIK2AXEHokdhdO41fi9mZir1frlsoIaw2jqN3wgsaTU+sEss0ASJg5Y1WyWEb26Z72/t
	ks8JnJGKxRT/wBVUtJ0YD83YtPS0aNhziwKVs2x2jzfCfEtJpY+f3ok4yfLaK/S4yZ1hCcTDp3P
	nSWMwkglHDAqJYz9ojCkcpJ7PnJA0pfJss8NYJBazQFeIwt8iwHOE8Pvi5czY4yI/EBbqjTGAwq
	IJzFHF/m5EnL1hI20ocgvm0+LSLQ2Lfue2nYpHnHGGhjEQuCL1j3CnBX8Sa1A1CaQW1AJv1qBWx
	C1hnaEaX3pyb28FKw
X-Received: by 2002:a05:600c:34c9:b0:49d:1deb:a629 with SMTP id 5b1f17b1804b1-49d1f21ae8dmr155804825e9.2.1788986450686;
        Wed, 09 Sep 2026 13:40:50 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c437besm17171315e9.11.2026.09.09.13.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:40:50 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump
Date: Wed,  9 Sep 2026 23:40:42 +0300
Message-ID: <20260909204042.46656-2-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909204042.46656-1-stefanghetu9@gmail.com>
References: <20260909204042.46656-1-stefanghetu9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_214054_192181_87A6DD27 
X-CRM114-Status: GOOD (  11.37  )
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

Commit 58bb5081cba1 ("ASoC: SOF: Xtensa: dump ar registers to restore
call stack") added a shared Xtensa helper that iterates over a flexible
array of AR registers (`ar[]`) controlled by `plat_hdr.numaregs`.

While Intel IPC4 allocates dynamic storage for the AR block, the i.MX
IPC3 path reads the oops message into a stack-allocated struct without
backing storage for `ar[]`, while leaving `numaregs` unvalidated. This
causes a stack out-of-bounds read when printing a DSP panic.

Clear `numaregs` to 0 on i.MX since the AR block is not fetched or
supported on this platform, preventing unsafe out-of-bounds memory
accesses in the shared Xtensa helper.

Fixes: 58bb5081cba1 ("ASoC: SOF: Xtensa: dump ar registers to restore call stack")
Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 sound/soc/sof/imx/imx-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 7a03c8cc5dd4..436fe49246ba 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -34,6 +34,7 @@ void imx8_get_registers(struct snd_sof_dev *sdev,
 
 	/* first read registers */
 	sof_mailbox_read(sdev, offset, xoops, sizeof(*xoops));
+	xoops->plat_hdr.numaregs = 0;
 
 	/* then get panic info */
 	if (xoops->arch_hdr.totalsize > EXCEPT_MAX_HDR_SIZE) {
-- 
2.53.0



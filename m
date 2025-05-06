Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E270C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p+Dck54LelKfFHarJJxO87LH00lqZOeaegRHSKx0xqw=; b=m3mATc7GGXATSUNg51UEuaY0ID
	mh+bgdYjKat+k5a4QdlqmyrJ5ERRcoXezX/gUtZVwWwx1PXxMC+7vZuq7Win2jwD6bmi+v7oJ63Qm
	Q+sAlNB6xgjD4PXmD1TWslFgkcWAGWIF1cabZkC+GfcZBEEHT/GKrWS8jwOPUlx7+Va1OwjUV4KN0
	G1C46/ieCFDzhSskvnRNaftqJvtpNhy6v6zUSz87lfvLVkaA+Rlua2ZUYAD4su2ybN5b8zoVU0ccd
	L+5o0/m+YAbEBivtgMzkSxa++X8RY9gz3M0ARuLawU1IAexYq2lKkN2/3weS9joGmMyFIka0tRE7Q
	QczqVOvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUcH-0000000DxSc-33IE;
	Wed, 07 May 2025 02:34:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPyA-0000000DRIm-0WTn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 21:36:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 68B435C5A3E;
	Tue,  6 May 2025 21:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC145C4CEE4;
	Tue,  6 May 2025 21:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567413;
	bh=+fNJE1yTF2PALBlbEE+UifwLAvbWwqAE5ZTkWve7cD4=;
	h=From:To:Cc:Subject:Date:From;
	b=V95BtymwV/E5DqMEVgxfcFw1cm+UfaeVTE4Ot+mz1hWuy5jquRBNrGqRbMcxK60gm
	 kGgBDOHhzzVxIxKncgDuCr2T+PSlv9hDzWDuk9tpjo3a6/wKiHKvSZzqntNZohn9b/
	 QfigwMXfLSE9koBDnxL1KxkO7bZMDv7XguJ3PNC9pPpF6k+TrKV93CaHY+NIgjFd0/
	 snS4zfT2WYuuwQvRXNfGoCwgLuZatdeUpnuDrnzlrn7xcJ9tJ/zkrMH5vMdZs0slgG
	 FfYLVyOlHNQsuvnsvytTfhx0CvCskXCzITY4/HG9Co3r94bAB5MmLdHbVsoJnz/FI6
	 05om8T1x1HVIA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Chenyuan Yang <chenyuan0y@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 01/12] ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
Date: Tue,  6 May 2025 17:36:36 -0400
Message-Id: <20250506213647.2983356-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_143654_206918_A8345C65 
X-CRM114-Status: GOOD (  11.34  )
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

From: Chenyuan Yang <chenyuan0y@gmail.com>

[ Upstream commit a9a69c3b38c89d7992fb53db4abb19104b531d32 ]

Incorrect types are used as sizeof() arguments in devm_kcalloc().
It should be sizeof(dai_link_data) for link_data instead of
sizeof(snd_soc_dai_link).

This is found by our static analysis tool.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Link: https://patch.msgid.link/20250406210854.149316-1-chenyuan0y@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/imx-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 7128bcf3a743e..bb304de5cc38a 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -517,7 +517,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 	if (!card->dai_link)
 		return -ENOMEM;
 
-	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
+	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link_data), GFP_KERNEL);
 	if (!data->link_data)
 		return -ENOMEM;
 
-- 
2.39.5



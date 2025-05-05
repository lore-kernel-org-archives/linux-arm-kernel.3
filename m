Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F458C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 23:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJB1YFPC0nVify2Y5ZH3pBqyt9nMgIDD3ryrf4UN16I=; b=k/an/y2YmBB/k2nQRo3mGQf3Gv
	YfYILMSVeoen6Zfx6Acvw1hc80PNQclEYDxHkDanaiJBWaGy1uUvrABNn74A4LKiQl6/UwdnlY+Gb
	CyprtzPdCe7Cmo94u/D06sfu9GOrv+jX+44axzuR/Oz2EHYFJkD296Ri1WKGxTyCMFPMPs/2M71fR
	22n+9fwHhNzbQonoYeSC6Bj84VsmPydYR/6Qs6Qm2oe46s8NaazzORF3n5UG3RqAG6lFE6lXCEimy
	CRWv4v4BZ83+s/XuMX2f4q/XLllx7U2thQjjNb/QHnu71VGJf0ZTqR3ACN+zvryUs2lMufX1WAAb4
	mAKKgIIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5cN-000000099Yr-3jp1;
	Mon, 05 May 2025 23:53:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4Ha-00000008lOK-2i6X;
	Mon, 05 May 2025 22:27:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB8E65C04D4;
	Mon,  5 May 2025 22:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0311BC4CEEE;
	Mon,  5 May 2025 22:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484049;
	bh=O2mn++1uinwWnkH+yXKQUTW2RQxr5fSjFwSzt/Zof3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oUe0sSJ+XKyxl4qs3xU5BRxi+hmw+bh1G+S2GNH2V/bqcZ0Bq3QeMK9diLwCR64Xg
	 O0iiHfFH8AvZLTG+ZA4Ftzx6r0JCAJSkUqeYUdnobwBVQ2/14G0/uInYfeVaOkDZ+L
	 bEBOX2HOjrQRMwM8K6CfStFLuLd9b9KXMNwUF8mwHB8ZI6DoUpXnaTnoYABC4xmwoI
	 hi+qQ+AkXoxloZNJoOYi5+4tZvmfHPQJZsnBvSg7Aw1Htow4exTvZB2cz79tpd6YcC
	 KzD+PTaHhtYXEhg8+Sr3lu87yZgDijOr1FkUX+tDnPK7Tdxn7511nVQLHk8IlxGomI
	 n6digc7vayjvQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	ckeepax@opensource.cirrus.com,
	Parker.Yang@mediatek.com,
	yr.yang@mediatek.com,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 327/642] ASoC: mediatek: mt8188: Treat DMIC_GAINx_CUR as non-volatile
Date: Mon,  5 May 2025 18:09:03 -0400
Message-Id: <20250505221419.2672473-327-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_152730_731159_B1DD513A 
X-CRM114-Status: GOOD (  13.19  )
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

From: Nícolas F. R. A. Prado <nfraprado@collabora.com>

[ Upstream commit 7d87bde21c73731ddaf15e572020f80999c38ee3 ]

The DMIC_GAINx_CUR registers contain the current (as in present) gain of
each DMIC. During capture, this gain will ramp up until a target value
is reached, and therefore the register is volatile since it is updated
automatically by hardware.

However, after capture the register's value returns to the value that
was written to it. So reading these registers returns the current gain,
and writing configures the initial gain for every capture.

>From an audio configuration perspective, reading the instantaneous gain
is not really useful. Instead, reading back the initial gain that was
configured is the desired behavior. For that reason, consider the
DMIC_GAINx_CUR registers as non-volatile, so the regmap's cache can be
used to retrieve the values, rather than requiring pm runtime resuming
the device.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://patch.msgid.link/20250225-genio700-dmic-v2-3-3076f5b50ef7@collabora.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 73e5c63aeec87..d36520c6272dd 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -2855,10 +2855,6 @@ static bool mt8188_is_volatile_reg(struct device *dev, unsigned int reg)
 	case AFE_DMIC3_SRC_DEBUG_MON0:
 	case AFE_DMIC3_UL_SRC_MON0:
 	case AFE_DMIC3_UL_SRC_MON1:
-	case DMIC_GAIN1_CUR:
-	case DMIC_GAIN2_CUR:
-	case DMIC_GAIN3_CUR:
-	case DMIC_GAIN4_CUR:
 	case ETDM_IN1_MONITOR:
 	case ETDM_IN2_MONITOR:
 	case ETDM_OUT1_MONITOR:
-- 
2.39.5



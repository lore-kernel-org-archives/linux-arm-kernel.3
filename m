Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D73CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5tPW28u/y25LsoprSZgjrTYuNMeOHBtCHRS1PxOld3s=; b=TExTLimaFP+lOI1KDOVKZLeAl4
	0jJIOeQNEn07uVFVJwRNhFWCLk1iOcWy86y0+f/U+Ws79zf4kODnBc/iKBpg84fd2JbYgSY5p5j9W
	RW4puC9udpmPHDaHUZycoHv7Y+Et9vD9gzRpMoPMVGgQjnx5PnkIL1so8TMMk/fzTCUQ9+DjAUDFe
	CVjhC1tFUO2WiG4u4BiY7xaUgdR8wM9rcg2dKb0kQamuY+k15cgrCgKcGsJiBzuCKl1ZJdFFuWzdH
	y60K/T+6Gk2SppIWNtSHQdpv+x0TqR6k6RoWJ7BvU+oB+YqzmpLujLcHjcrNZ2IR0JafCMkjfE1kN
	Oo3wmHcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPWi-00000002Gq5-1qvG;
	Wed, 07 Oct 2026 11:09:36 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPWg-00000002GpO-19RT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:09:35 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3a8a2df4f93so381761a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371373; x=1791976173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5tPW28u/y25LsoprSZgjrTYuNMeOHBtCHRS1PxOld3s=;
        b=YIPqDshDp6P/yFXbAZ+pCrDNrLNJqUH140CTEHOK5h7pO2oMp2MxMnOH/wtqJoE+Gb
         ODn1qAfQEjryWDiyTYjMaANuhIH8ICb9YSqzscijEWWNk7urq4LElZu9nKRhXj1VZ4EU
         OGDcdFP4w083cmUzrXy+MEdTw7LR6ExDUFvU/KBNv8+utXZr+ZXvw5gMUzZRgCtsaDdt
         YsZBBymRtnYNgUdNFEdWgYxWiY+oPdSuUZSlM4zxhul32MW5kqYpBIAaO58txPgGEDOI
         mZXEuP/DFncVwzoAwfSI5nPP0CHECPDbeWN5bJdnmtgBg3895gjQTT7EsY/yh3tB70fN
         7Bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371373; x=1791976173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tPW28u/y25LsoprSZgjrTYuNMeOHBtCHRS1PxOld3s=;
        b=MPFoQ1Cnohwoae+Gf7mK10LL+JoLf/3j+Otb+NDhb7oU9HvFGwamVUzw/SucEljqdi
         h2tAie0o9hrJXmTxZvRVmbxLg1JDzaT9yU/wbQM9HgSZ5WKO3J0sO5HkqnRPM7qTA61k
         PqjzddVPqeuUGdzfJTAwFFHtdco5nYKsFBOk8otEmSLZCd6fPJ+KyoiZukjuKyCLhNu/
         kx83Ixv4cgQpbCjfDKontFLFi9Flu5jjoD41S3KYfI94skGIxeSE0smxPeZUGzgH+dKn
         W3+Hkmmvu9OE/HKfL8r2Cw1WFuzZZou91AIhU9EvlO5+5HoUzbmba8L+gkKNVn0OPcvj
         bJVg==
X-Forwarded-Encrypted: i=1; AKwUvBw4cNHthXgxEIKwrCy4byID+g41Yp+YRK7pC4qCyQa0qD2UbkAW5qYpZHUYEfrZ4CpWiW0lLRbdkF3D0sRg/3XH@lists.infradead.org
X-Gm-Message-State: AFq9FYJEeXz15ylEvqE/KkKXGf0kZAkG7kefCdLKo2LDLWRo4iZYeXf0
	xvNF+IGSCgRRb+rnoVrbXI6HbstYPX7RtrMopAVP7Yd/oByaHXE7OX6T
X-Gm-Gg: AYBFou2rZ5L8gWPXZ4xP74KG0s2G2BNoXdhY7FwHdsvYZtVYwsblrH0F1yRRQqNGUgE
	inbGjqDHAAeO0hvFxioHseL3ajZaGgsJbBLw7Dz4Yh8b7GOYOgZOlquM1S1PGN3w1zL+EimDGUd
	ZNfMlqmlmsIN7nhNcVhvHix2k+J3bwK0U3XqcEPNGkDXC1mP8yBjmpo8B1q35ki6aI/bhSJe/5J
	NNQUd9w+HqEs3Lm0nVWiXjCMhNfaomu5oXeyyWQU3bqmAlm7Z9LqnC2o0ix0T8bO0WNw+ncqkzl
	rre5cKYgS9Wilsi1Qqy7t2a8CCFBQyVQZ0re+JQ8eQc+XZPtf1znGgXROPLvInThqO+f09Ac/19
	/ru/stCVodDxDKVWgS4P6X00PudFdddIihLsk1O4VONc91t9QC3UKgTv+iWeTaQFTS+lig26Off
	FMwUSX6a41v8XUaFquQ/7GHYAXv2YoGG7bOaH3nqTrPDIOn2kJw5OQH91BEX0TIhphdpwy8ynjE
	FriaKPi7e3YrGjSMaBNCBXS5J7wVDZm1KkxdjVjtqaJ7e4nOp6xExc2fBQRdd4bfZq9O1KQK3Vq
	DONLy3BDjmyJSQ==
X-Received: by 2002:a17:90b:2246:b0:3a7:aeb4:e6eb with SMTP id 98e67ed59e1d1-3a8a1ceeb73mr1617868a91.67.1791371373155;
        Wed, 07 Oct 2026 04:09:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5ec70dbsm1328745a91.2.2026.10.07.04.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:09:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/4] ASoC: mediatek: Handle constraint return value in FE startup
Date: Wed,  7 Oct 2026 18:08:54 +0700
Message-ID: <20261007110858.509341-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_040934_326081_4F703767 
X-CRM114-Status: GOOD (  10.54  )
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

Some FE startup callbacks may return a positive value from constraint 
helpers, but ASoC expects 0 on success. This can cause .shutdown() to be 
skipped during rollback.

Return 0 explicitly on success.

Compile-tested only.

Changes in v2:
 - Rename the patch subject.
 - Simplify the code change as suggested by Cezary. 

Best regards,
Phuc

bui duc phuc (4):
  ASoC: mediatek: common: Handle constraint return value in FE startup
  ASoC: mediatek: mt8188: Handle constraint return value in FE startup
  ASoC: mediatek: mt8189: Handle constraint return value in FE startup
  ASoC: mediatek: mt8365: Handle constraint return value in FE startup

 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 8 +++++---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 3 +++
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 8 +++++---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 7 +++++--
 4 files changed, 18 insertions(+), 8 deletions(-)

-- 
2.43.0



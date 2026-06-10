Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1913CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IJUYz/VnH85xP5IAHA2EUA0hKYGmtjdBqL/tBoqQ/8M=; b=3wZeKNcQv3h1g8yV0X0Kb8JcnA
	ec+V45YIXLujuT159dLyiRwfA9Ft5pRUZO0T1RT2eWaAXDHIS5ajg8e3rjKT8wT9v8N+hnBufbFdf
	seDCnJZwAU3LRY5gjGEK+jWygBxA5Tz7A0GrI9aAGnYFBspmzthipbOI/KosmR/al0V5cZEBI9GZZ
	D3zV5leTpcS5N64OF3HwR0eip7IQlbP3/jzOfhlETppy5QNwoVXLEStbiKROr89rRcCpNDQBZvmO7
	XXkWufMn5BqC4S1iNF0yNPb7l/2YiHyYIOCe/gz8H2V0TDElRijSJzLJ/xYpUoScTFEMloA9+L+xe
	tOsg6lkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG35-00000007MkG-37R3;
	Wed, 10 Jun 2026 10:20:39 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG33-00000007Mjc-0lcj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 10:20:38 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2bf55c39e16so29525335ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 03:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086836; x=1781691636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IJUYz/VnH85xP5IAHA2EUA0hKYGmtjdBqL/tBoqQ/8M=;
        b=BmO/MbKtPdcb+eHkCHXJJEYObIPt6nfPQFfNmG8pmy6rSldybH5gPPKGqum5rsFCpZ
         FV5Q+CnHw4f9Q35qNTvbsiQ7QmMIdzoQr730MdZRoAfA+ZRcNdL8yrG0ipm72dUmvoYY
         kqG7LzDrjsqyoToZZfD1bjuT7Y19OY+7Xvv6HmpXiyYI168dIutxMotzKaAMsa3ltJm3
         Glk1zQpivd2Ip1Z/TB+N4GTD6Xk5dYXWIli48FQrmH8/OHv3O4jzYqlUsyTpuNM9KxhP
         8RdidPwsQw1KtYQ8ERbxzc1VgetJ9MRmAzGpkiKtvHR36X/RZjC489VIiNdcAuz+WD3b
         BzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086836; x=1781691636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJUYz/VnH85xP5IAHA2EUA0hKYGmtjdBqL/tBoqQ/8M=;
        b=QMSKLp5VpFDokkK7xWd8CU6oeqUP3mEGMDB2prJCA+T0EDbxw0SHvP+WirYOiSYTpc
         c1hqwwLQ0f9zlQmVxEuJhl6BZ2ddUtiXHUh8CsYWY6Q8/OHolKCByu0vfdwVHMDJxfcI
         GJXJHepqEL+hMYRF69P5y7vRQVyZC9woIf9qMDmpe9pkuybapS4O4p1rZcmkZ1dyZbIN
         eH73hA7yKvIHW4l0AflOXAf/Lp3c+J0bL3s+ruNxy+e3x7cYcjLoZYL6RRcHk5XzSP3r
         LUG8iYYQT7VZQ8tK9SQneLPxO6RROpfbJgpAru5K6kKamA1NKMGIJzitdGh40aaEO+WC
         cHWg==
X-Forwarded-Encrypted: i=1; AFNElJ/HSxzIhPa7AhXjLp29FnvQsTsplfmEQyHRbJzDnkykT4Oc3VzZjsICyjsasp7JFwNbE6bVMuLHFaKA4170r/Dt@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ4hCVl7wPmkPbbk1frneRTFX7Heejr3ZIK4+oe2L+BHRmt4HH
	ygdfRgIPfXQLrI6j09R8VvFEsnZ2UMUFwTXp+7PQ/Knno1UclNFbgpdo
X-Gm-Gg: Acq92OEUHk/sSlsLZQhwUIXIlvkff8cGTv6zDPHMNfRuKYiAoUDtfFjEGsp5cjFu1cB
	i2cOnZY4qM6ptB7LXtQM+j8LZXxExAbI4STUZpmoeTi7Ox0trs5jnCAjaJbZGfnkKTGHQ8BLPui
	zcAdSFf8W7WRfkS3X2LI8gCjUcrj+p+S6kfWyZfLDz6Cxv1TPA8GfXV1aZlrRT+UUBPi4mriPV3
	yjCm8NjTYkZ18BQnnVCyBn+YHgogM2xQu1Whpc3xgpWyMGwcr32JSL7Q6PgPJnlPUCgAm0r74ZF
	iWURvlEjoYg4Wm4HSFtyiLZHGpsrifgMVXygd3nt1yy2RhEtjti9K6rDFwJn1Qt2bf18Y5YaoP2
	7L+W9jRQ8bRb93gDEysZf5HF3dI5HX9IgYihp3HI1aAnWqBwtZML7Ntg3/GXbl/8mezjg42g5U3
	X55nog9jJd+I2rSRv/qN6HrneEjjCnAEcFgsvimAD+Rtv1kzbxnVlQ4CfsZX16CkWPW+Hf
X-Received: by 2002:a17:902:e544:b0:2bf:2d0:8877 with SMTP id d9443c01a7336-2c1ec7fe13emr206516295ad.23.1781086835997;
        Wed, 10 Jun 2026 03:20:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:20:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/10] ASoC: mediatek: Use guard() for mutex & spin locks
Date: Wed, 10 Jun 2026 17:20:11 +0700
Message-ID: <20260610102021.83273-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032037_228108_88D4DCA8 
X-CRM114-Status: UNSURE (   9.07  )
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

This series converts mutex and spinlock handling in Mediatek ASoC drivers
to use guard() helpers.

Most patches are straightforward conversions to guard() helpers with no
functional change intended.

One exception is mt8192-afe-gpio, where the mutex release point moves from
immediately before dev_warn() to scope exit. However, the affected path 
only emits a warning and immediately returns -EINVAL, without any further
processing.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (10):
  ASoC: mediatek: common: mtk-afe-fe-dai: Use guard() for mutex locks
  ASoC: mediatek: common: mtk-btcvsd: Use guard() for spin locks
  ASoC: mediatek: mt8186: mt8186-afe-gpio: Use guard() for mutex locks
  ASoC: mediatek: mt8188: mt8188-afe-clk: Use guard() for spin locks
  ASoC: mediatek: mt8192: mt8192-afe-gpio: Use guard() for mutex locks
  ASoC: mediatek: mt8195: mt8195-afe-clk: Use guard() for spin locks
  ASoC: mediatek: mt8195: mt8195-dai-etdm: Use guard() for spin locks
  ASoC: mediatek: mt8195: mt8365-afe-clk: Use guard() for mutex & spin
    locks
  ASoC: mediatek: mt8195: mt8365-dai-adda: Use guard() for spin locks
  ASoC: mediatek: mt8195: mt8365-dai-i2s: Use guard() for spin locks

 sound/soc/mediatek/common/mtk-afe-fe-dai.c  |  8 +-
 sound/soc/mediatek/common/mtk-btcvsd.c      | 81 +++++++++------------
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 13 +---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c  | 29 +++-----
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c |  4 +-
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c  | 42 +++++------
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 16 ++--
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c  | 30 ++------
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c | 10 +--
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c  |  5 +-
 10 files changed, 87 insertions(+), 151 deletions(-)

-- 
2.43.0



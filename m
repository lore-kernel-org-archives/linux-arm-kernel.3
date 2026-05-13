Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D47CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WJhDTZ96rCLwuybfvMwu4DRpewl1qW7+n/gNAgLcqec=; b=42ztSQJ7KlxhAOIKV5Xzy4hF2A
	W2eUZhgJDX6PU27NdIEdawcYM8U2hx+XShtK1I7S0OPsur4U5d9xWeuEztry9eb4LgjJP6kGCOGk9
	P2OlbyY8WXkx5sJuus4buKZPFGp50t0dQFrZPvSpkViCzmVrY6JtXKXEEyUoU2smVlhUcPeBUXLCK
	Q/8VIb4z4vpjGU4Xi3Jjc3C+AehiyCJjSI50U5vHLOqJpXTx4hF6ZjmS41EMDEkCduPNHydAv5gZk
	dcUUbJkvJJ/d4zheHpnPYVDH294At4ImFOwHMzWHwYhKMTUcwbj0zfEiYt5QjaRr4+RwKwibmez1g
	oMY7j40A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74C-00000002E82-10w9;
	Wed, 13 May 2026 10:43:52 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN749-00000002E7P-2IDw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:43:50 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ba4efedbeaso46590415ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 03:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778669028; x=1779273828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WJhDTZ96rCLwuybfvMwu4DRpewl1qW7+n/gNAgLcqec=;
        b=ApLRLYcLb2BOnen/rNagOz0XqkvHYfUXzWefu5ePLplrX53LwglcA0cOCyN4r8Flk4
         zjTrwJNJfVMOT/2T7vKHTU0a5DOGbsQjePqHOHSCnGCbMX17OBazC739Os8E3k+duIZG
         6UZvCKzcUsqWFupnOAuOoWe6jw9qps3THiBIhmosdAZlUwLkm6Lsn+Trl6iIMSKCuiFO
         wEo0h0JZR3MPjl5GTJphzf5uXPnreWvaA6dpJYH4oE5e1yC2+Nz2CDFNN1cGZMp+RRor
         Qb9RLv7XHnb/iHIs4OBhW+MskFwdF/JGVuII/MvrQ/36aIi6OggdsyjPSek3cuYpD8y3
         Evwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669028; x=1779273828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJhDTZ96rCLwuybfvMwu4DRpewl1qW7+n/gNAgLcqec=;
        b=bTjQ240mx9EbXPa24/tVtWBmr1YVDIq4RELfHUsXKR/XEnRWNlGIlTtcx9K2zXcT6N
         YcYBRF+rnn2HhFFxdUKZCICazmbIZA2XlxR3yWF/0q7m6+0xNUiGYGtaYTI1v9KT5RaB
         rjDxIH3OLQRT/AstOpcVYSw/evESof8FcfkDrF75mvoyKqGi2xD2NidpfA85d6s5yngB
         37PkCuOGjgRu1hNl9LkezF1WPZEXTv137pqNtabrLV91xX7wfE+0EQe5Q6t+sACCY6ho
         ZIRckNlYtXQiU1yaxwvNlfABVHbQb2XJ5JFeJhdd6Rb/1nEHzLnRv5B0+bCEp7D0VDDX
         3oDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/riIJKhZX6KnmPuppt2t3qcjQxQyF1kJs6IS/RZqcRptc++hatcL/WC8Obh6VqdPG1zAYByb12UaqdfDhAYAa0@lists.infradead.org
X-Gm-Message-State: AOJu0YwSfBd5ABZD0ilmYq8YaIICnxZdhFOKWS4BaY40H491H7ac2cpU
	O1+F858fFdq0aphh9pw/KqrhmjSi85WOqqWrxYbYH4O2gmWHREIeS0V+
X-Gm-Gg: Acq92OFi+LZ4NFTYndDVBH12Xm6rVONuKKEZEZw59yd8oQTIXu7lSBpY7r0JT0IZzjr
	RQcYQ2hvhW0Uu9XJpzxkgwUD/8MQUZZ5MOiv+fL91zzIx4pxOTjfWxwb41iIu8SC+aXhNYVlhjj
	6a7SnKJnJSh/mgy3NH3wv5RbLpk7ynnGAdTynrAanyXLbhg/UdWyGOPok8x64UotPxK3x63H6Rp
	OcRmvtHeP4Oyo2cXLw5QpYYlsz8Jv0XX5R59iJ43sJ++xv1xgjTIjzNgaaD9mlEzNEPwy9pMs2i
	MwVgNYNkyLYVspoFGYZ31xmi7dhYtwWHybvwq9V0xwN7Xz0oygKgJN7wctoSSgHDc5NNe7ny23Q
	j9hXyhcg1zGX4F+KuCc4IXXl7qrTiHl6L6i88HFVVCSGGe/5XCIE/+2+PqewYOgAiq/FB1HVYV9
	JiO5EjzSUgJAHrn5QgiKI4nSFicyDFECID3pernBGAiv439zYmyUEvsIvCVGdbGDaN+d9U
X-Received: by 2002:a17:903:986:b0:2ba:6ca2:bd9 with SMTP id d9443c01a7336-2bd30640442mr23589835ad.41.1778669028312;
        Wed, 13 May 2026 03:43:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35e9dsm170479535ad.39.2026.05.13.03.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:43:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/4] ASoC: stm: Use guard() for mutex & spin locks
Date: Wed, 13 May 2026 17:43:25 +0700
Message-ID: <20260513104329.81592-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_034349_614787_D71C93B7 
X-CRM114-Status: UNSURE (   7.79  )
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

This series converts mutex and spinlock handling in the STM drivers
to use guard() helpers.
The changes are code cleanup only and should have no functional impact.

Best regards,
Phuc

bui duc phuc (4):
  ASoC: stm: stm32_adfsdm: Use guard() for mutex locks
  ASoC: stm: stm32_i2s: Use guard() for spin locks
  ASoC: stm: stm32_sai_sub: Use guard() for mutex & spin locks
  ASoC: stm: stm32_spdifrx: Use guard() for spin locks

 sound/soc/stm/stm32_adfsdm.c  | 10 ++----
 sound/soc/stm/stm32_i2s.c     | 67 ++++++++++++++++-------------------
 sound/soc/stm/stm32_sai_sub.c | 29 ++++++---------
 sound/soc/stm/stm32_spdifrx.c | 44 +++++++++--------------
 4 files changed, 60 insertions(+), 90 deletions(-)

-- 
2.43.0



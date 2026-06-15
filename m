Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D00CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 09:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v8RfSoNGjMJMgs5qfUtbdb1xy6XGXw4boE+GRcRxWog=; b=mMEgtAZ/YP0TX7j3olmA4beHpV
	Ay15TIqXUrg7iwyCmw4DjmVTGIrGq7DQYeN7IijYmqmXpyD4Ct+slYnOnG1XC94I/3DR/EsTBxQg7
	F15wcVJQ7OBYx2wM5SI2o2QmO17jWhdudKkw7TjPZ5lKBpRc1S11Br+N5eFBWkWV8l9gMbLgYok+L
	Gu8KeeazfFlUcYXEGBRoC8dphsN4h/6O7qyicnBA6SFCkyS4PR1DIJjmYjYZiaYpvbKzE8gE78JPh
	E9heYKpzIDkc/qFlQNkoxkHmNA4+k/iEqQf0eUV8yUUCxkWYW0eDVA0CHxVfJ1NCUjmPHdMUrsU06
	Wyvczx1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3mw-0000000Dyay-3qkR;
	Mon, 15 Jun 2026 09:39:27 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3mu-0000000Dyae-2bmJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 09:39:25 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so2159317a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 02:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516363; x=1782121163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8RfSoNGjMJMgs5qfUtbdb1xy6XGXw4boE+GRcRxWog=;
        b=dnd1qThJa9UGqqEGnbCG+7SJ6lkjLTjHT69TCGxVmYyqpTzPH1Ev1hwpx+GTVqJONg
         xfdX58fk7mkvZ5WYlmt4u9EpuvQ2A6a1Y/dr5Ya8NKlQrauBzfx2QA6d8RD2QuHXnVnA
         JarRHulOQr9aKDD25Te40zSYQ6OW6Au/7k6aXDjeei4DROU8Ea6rjIKEkVhEQtCXgEHl
         4V4Aq9CSZCIjvj5DEgM987y1wFQ8H75fA+3SPavo4qjHGsAG+9CzZGC0yRqWKoRUb3XD
         x0Df8emu9+4hcCW5dK7i4g3jGSTjRi9tB9O3Ifsv2dgQlFDQ9BRn+YfSm24yb+8pu0tN
         L7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516363; x=1782121163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8RfSoNGjMJMgs5qfUtbdb1xy6XGXw4boE+GRcRxWog=;
        b=WgcHz+z749Vm40wu+9u7FhL9eV8wTibZMXUjMsG9wQDb9UlGYQjMBVXGjM92T3pLnN
         qY1DMWGkmsKXLtAH03QvhlUalsbjgVpCz9U7YHH9kKcPFnoM6YKs+rBrF0MokT79lSCC
         9UsVdA8JFAjh220C6V0pKVVSkKl0ljojVO4vKcyZrfxDlP5xCjJZ54RRp0tDpx8qWr9l
         Ip3XsBBfhWrp5C7Dz+ayYElzfQ8ymEngxXHlW4VAsD9TCSrBJmGMbyGhqxYIah4AzTpP
         RvioOcLnyKDBpjectZCxXZtZHi6QOSN11o2LpCBuW5KOkSgSvnGgCJGOaqoY0qGDY1DC
         kvVw==
X-Forwarded-Encrypted: i=1; AFNElJ8DpIdF18SZVXu6JyozcNh9uV72agC3JMMx3pdfL3Df/s55xlSE8VaFg/ZTVwv8uITfrzSBoaX//xr38XUiIaYU@lists.infradead.org
X-Gm-Message-State: AOJu0YxuavZ6yiwhZqICCgNAidRNjsfdi4ppAOh2+bqfup+Dcu8nJICX
	GaNfBo8bmPEXrHpO46BIo8qJw2ob8KdpaH1flqbLlOCcbvFFA18JdTFu
X-Gm-Gg: Acq92OHDbXu+qNnl1MKIfzSRrkvWDt82kyFcz8WmGv/kOWLiU1Xo0HMms1vwY8ZWX+2
	IszIgwcJO5dMqIJmq94y6RXhwrQtpIlWSr01/pSqgAwyNlPUv7PoGSft61xwqMe56AntAKdT1hT
	g+/nJ1zxbYzo4+2jnbY+qM27+XwkkNe5zAWZyYRxTcR1QxMh74oU3Pgx/o4tQUGstDaNoTSVl/D
	vaKYz9X1px7TDeBjWVbUItH3K5BBZK/1Gk2Gdy/gDfZjOQnJb08qg085OhOUPggee/sM0hm7YZV
	5pZFVhVg7f6EGTbGjvN9BOXIF6ucU8oHTBwzHPXLYmp4VgcCgPLzCQh/DbOIDBY2BFQfvCU2z+T
	QESMRVEr77Q5n0uDu9riBH7g22annZMk+K5t45QwKeLAeND35CtOUEH9UFc9t30nLyz/T1y6jHp
	DH/ktaKyeNj3MaC6usZ1I1HwIkdMC6EfPhocAqwrUTCu4j3AwI7xKZiT0tEgznQIy6s7IO
X-Received: by 2002:a17:90b:3e8e:b0:369:74b3:a103 with SMTP id 98e67ed59e1d1-379edacfef0mr11864728a91.8.1781516362913;
        Mon, 15 Jun 2026 02:39:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:39:22 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 00/11] ASoC: fsl: Use guard() for mutex & spin locks
Date: Mon, 15 Jun 2026 16:38:13 +0700
Message-ID: <20260615093824.115751-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_023924_667397_50575F8B 
X-CRM114-Status: UNSURE (   9.31  )
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

This series converts mutex and spinlock handling in the FSL sound drivers
to use guard() helpers.
The changes are code cleanup only and should have no functional impact.

Compile tested only.

Changes in v2:
 - mpc5200_psc_ac97: Fix scoped_guard() usage by replacing
   scoped_guard(mutex_lock, ...) with scoped_guard(mutex, ...).
 - Added compile testing for mpc5200_dma and mpc5200_psc_ac97,
   which were not compile-tested in v1.

Best regards,
Phuc


bui duc phuc (11):
  ASoC: fsl_asrc: Use guard() for spin locks
  ASoC: fsl_audmix: Use guard() for spin locks
  ASoC: fsl_easrc: Use guard() for spin locks
  ASoC: fsl_esai: Use guard() for spin locks
  ASoC: fsl_spdif: Use guard() for spin locks
  ASoC: fsl_ssi: Use guard() for mutex locks
  ASoC: fsl_xcvr: Use guard() for spin locks
  ASoC: imx-audio-rpmsg: Use guard() for spin locks
  ASoC: fsl_rpmsg: Use guard() for mutex & spin locks
  ASoC: fsl: mpc5200_dma: Use guard() for spin locks
  ASoC: fsl: mpc5200_psc_ac97: Use guard() for mutex locks

 sound/soc/fsl/fsl_asrc.c         | 10 +----
 sound/soc/fsl/fsl_audmix.c       | 11 ++---
 sound/soc/fsl/fsl_easrc.c        | 36 +++++------------
 sound/soc/fsl/fsl_esai.c         | 16 +++-----
 sound/soc/fsl/fsl_spdif.c        |  8 +---
 sound/soc/fsl/fsl_ssi.c          | 13 ++----
 sound/soc/fsl/fsl_xcvr.c         | 29 ++++++--------
 sound/soc/fsl/imx-audio-rpmsg.c  | 25 ++++++------
 sound/soc/fsl/imx-pcm-rpmsg.c    | 69 ++++++++++++++------------------
 sound/soc/fsl/mpc5200_dma.c      | 56 +++++++++++++-------------
 sound/soc/fsl/mpc5200_psc_ac97.c | 34 ++++++----------
 11 files changed, 121 insertions(+), 186 deletions(-)

-- 
2.43.0



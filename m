Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD78C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 06:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TINErpoZs249/gc7F8k6VoM2fKTzeeCGjix6Ih+NnM0=; b=XyxL8e/yCUHpIe
	vWsvEYOpumSmVVmVK8Z4rA6xZF9t6Wmc/+CyOphYi2VhK6WX3a1JRSm+SOqqyZ/CZTAIaLwKhJ0i7
	61oDoFxyD6u7NQG1ewDOGbQwCRVtkD7M7TezYlarS+B2mh/kdelEeN7CLcdbVbcUAikipEnfG8+W7
	rkput7TfT/DyXL2BAkryudJ+YHTXYogP9idlb+gKEZ0X9NnFoV8WmnmEThHMFTzuKdMN8K5L1I3sY
	pFJAPdK0dUxtCz4xY8iqeQ7HDZPw130T+UV0MmbX/B1dVJZhZhQD1ZKeok7tI2KzNyCmsOQBraV5+
	6/HuKTTkPLQARK4Vz3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wul5l-000000020EA-3fov;
	Fri, 14 Aug 2026 06:08:33 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wul5j-000000020Dk-0niq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 06:08:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-495590dde14so8246865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 23:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786687709; x=1787292509; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TINErpoZs249/gc7F8k6VoM2fKTzeeCGjix6Ih+NnM0=;
        b=Uf1dp6uJO3rlaxO31cXGDwMsfNGcKP9HkUcGVEoo+1jGgfsEn2+g+y4PADgkeIBLAa
         8jZFfU2pYwpF/gNgpocbp2vbThlid3EpoRs5Fs35KFdRnNYsJlQRtuYapXfJx4fT0Evw
         spZXTE3Tl6q/bZyw1cbAyS3bat3i4vzfPdVWFm+o2/ivhZnEH2ORXt6VDhpEMikqQVHu
         mFTH4J4e2EDhKFf4EQZYxA7MA/2Oy2eDfMxauyelsPP7uImGlROhpJbYAmNVDMEtmLS6
         9IQLkuSNQSZG4ICsLTTypAWVyi1M2lpYo8q0gAqhBS4LQDepW0Ogn7omnRlLBq+JqrtS
         Cujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786687709; x=1787292509;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TINErpoZs249/gc7F8k6VoM2fKTzeeCGjix6Ih+NnM0=;
        b=mPsE9T7hN+UTpHxkj1u/G59q/afTfVhRKxShdSkA3Mtc8uCDoAbcJ7zbLHHFiYhA+M
         TtK56pLQ/KZXSDpRv7kyVgUXcbu4Ggxcy1ubFnBBBTCciQ+iJfwkeSdhIMJD328MuLlW
         AgUBemVV5+7tsjmxxEULtBYnDMhxeEIyCYDte72i/wGPuF9it3OpGAAg31dKsQqYekYa
         DVoZU3GsAkwFNKRU/V4Sd0kn3XgtGMDUe9PDxctNTf84VX+oM5NTKwTkk2r2GyX0I1Hg
         jSsfj7B2CVkY0a2CsjFRgiQmGPDFND6kmg15weHNtt8sFURBecywWHLT9PU39Hz38l8j
         Bonw==
X-Forwarded-Encrypted: i=1; AHgh+RpnF570p5Tm8eYIHdpMG6ifPPzZobp4EmWnlQrBEhmhRCIVfO90Id1oG035o8+3vqLZRqAKLb8QUMe9GHu5GlRM@lists.infradead.org
X-Gm-Message-State: AOJu0YyzgeZXJm5UwCQsEeTtDpKYmSIN+jAfxY7Z15+0zG6dnVOzoray
	2kgWUlj4yZgA7VJ2+aEHmDXhXyI08Ubg5rX6zO2qmeQ9pXkPzcFqvLYV
X-Gm-Gg: AR+sD13ckMy4QGHbuwiXemO9+nPKkdnlMbgVoz4rRErS+MRzlqKVpHgISDYu7psVwTT
	7pV9Tu3lcc3fGenetxCe4u8PM8nIaNwfljzS4LYHXGkLss5B3Ql7WdtaEQAEu4V76cZ14HN9EOp
	rAXZQrBSepXpbNFrkImnPYuUpTpx1dN3MLlmbubX+FxPrxMUYIJISEysX0lIhLJ8xC2m7tfOcy0
	5Kp1qPfmHZ6yGZQz+rDBG6H8ErLnsUC421p7fziVovfosnORlLtDQw/+KRZLSGmGNKN/xxi4clo
	Ps0HwCuFWgz5dkXJN+7L4xLefEowe7giVs6Gf04opLo0FpsTDQ2W/b/BgkL1OGDtY63n0A2KP/q
	IeXiAHNjsG6oXdFEnT6vOCBaivyCrq7HgNLt5a/pwRWDl7NRrVdFvFY2xoVsilvag8f1O6IFu/9
	YG9zUfdwK92PrSX6Doap8RZOptw6u3S/EfnnrlFXM8H6ot6J8LeKJiVlL1P7fC9rMmS36mvVr/D
	aL1adCiqtCj9l1NlrwbSeoB9LVeF02pI5kHMca/
X-Received: by 2002:a05:600c:1d89:b0:499:726a:117c with SMTP id 5b1f17b1804b1-499879bf7d0mr46462705e9.19.1786687708806;
        Thu, 13 Aug 2026 23:08:28 -0700 (PDT)
Received: from INBSWN167928.ad.harman.com (bba-86-96-6-50.alshamil.net.ae. [86.96.6.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49989ae9618sm1475095e9.13.2026.08.13.23.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 23:08:28 -0700 (PDT)
From: Abid Ali <dev.taqnialabs@gmail.com>
Subject: [PATCH net-next v4 0/3] fix the MTL fifo and DMA race condition
Date: Fri, 14 Aug 2026 06:07:52 +0000
Message-Id: <20260814-stmmac-rx-fifo-block-v4-0-1951fd3d33b7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALiwfmoC/33Nyw6CMBQE0F8hXXtNH5SHK//DuOjjVhuBmpYQD
 OHfRTYSE1xOJnNmIgmjx0RO2UQiDj750C0hP2TE3FV3Q/B2yYRTXtCSF5D6tlUG4gjOuwC6CeY
 B6GRVG1G5utBkmT4jOj+u7IV02EOHY0+uS3P3qQ/xtf4NbO3/0wMDBrlUmta5Lgzl51urfHM0o
 V3BgW+RcgfhH8QakcvSCmbpLyK+SMXEDiKAQikqZTSilLbeIvM8vwEG8nIsTAEAAA==
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Qingfang Deng <qingfang.deng@linux.dev>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abid Ali <dev.taqnialabs@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786687705; l=2747;
 i=dev.taqnialabs@gmail.com; s=20260425; h=from:subject:message-id;
 bh=OdaBAiQb6gEmCNb7tFmBVM0j0naVT2qn4/yODI81cH0=;
 b=Dp4UMAGzWTSENRNb6J6gKaqOlTcxE4kwbzpspsjNxVeDZhtAGQlLgXTIGxhQDfHB/+bAMPmAY
 P9hhkFyeyD6DtwJEMI0/cor5QU5XZzAYFVALTKId94CVLFNBHFMFmUZ
X-Developer-Key: i=dev.taqnialabs@gmail.com; a=ed25519;
 pk=4Syx51HH/MOySSUpi79M2ToLOdwt1yiNb338eKZBJNk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_230831_291209_A260C5E4 
X-CRM114-Status: GOOD (  12.23  )
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

To: Andrew Lunn <andrew+netdev@lunn.ch>
To: David S. Miller <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Russell King <linux@armlinux.org.uk>
To: Qingfang Deng <qingfang.deng@linux.dev>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Abid Ali <dev.taqnialabs@gmail.com>

Changes in v4:
- Rebased on net-next.
- Link to v3: https://lore.kernel.org/r/20260813-stmmac-rx-fifo-block-v3-0-738acbee55d9@gmail.com

Changes in v3:
- v2 tried to fix the ordering in teardown path, but it still would
  not follow the ideal flow mentioned in the databook. So have
  seperated the patches to deal with the teardown and some findings
  from sashiko.

- "net: stmmac: enable MAC rx/tx after DMA start": reduced in scope,
  now only moves the MAC enable after stmmac_start_all_dma() in
  stmmac_hw_setup() and stmmac_xdp_open().
  This is to handle the overflow scenario during bootup causing hang.
  The teardown side in __stmmac_release() is no longer touched here.
  This change could go independently fix the overflow hang at bootup.

- Added "net: stmmac: xgmac: tear the datapath down in the documented
  order": for ensuring ordered sequence is followed for teardown.

- Added "net: stmmac: xgmac: decouple the MAC Rx/Tx enables from the
  DMA ops": drops the global TE/RE writes from the per-channel XGMAC
  DMA start/stop ops.

- Link to v2: https://lore.kernel.org/r/20260727-stmmac-rx-fifo-block-v2-1-4dc3457d31d0@gmail.com

Changes in v2:
- Corrected the ordering in teardown for xdp at stmmac_xdp_release().
- Link to v1: https://lore.kernel.org/r/20260726-stmmac-rx-fifo-block-v1-1-45ab094b6c02@gmail.com

---
Abid Ali (3):
      net: stmmac: enable MAC rx/tx after DMA start
      net: stmmac: xgmac: tear the datapath down in the documented order
      net: stmmac: xgmac: decouple the MAC Rx/Tx enables from the DMA ops

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  8 ++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 94 +++++++++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/hwif.h         | 17 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 85 ++++++++++++++-----
 4 files changed, 170 insertions(+), 34 deletions(-)
---
base-commit: 4f93b12cf7b25fbf8e73d222722805b049f0a6d3
change-id: 20260726-stmmac-rx-fifo-block-ef589c38f96b

Best regards,
-- 
Abid Ali <dev.taqnialabs@gmail.com>



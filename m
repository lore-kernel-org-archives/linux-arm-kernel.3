Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D2BCCA490
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 09:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R5dwpMdeDtafkrSIKilmZHw+Byk+8y+YTLJ/JPrzYVs=; b=YOZmY36tsfmbdr
	F526MauyHbsluPnRMUf93YgwlVZnvYdxNF6/z4IaoPuxDbZIy+oNuBO3lvKXBWYTQdDfTNMjwzwH/
	oHL/dzexicSN9u/ZyorMystKpg+P8ZHQ5gUnioVh1/alrBXVkU/FqTjR2lkBV2BKmMPBmNA49c1dV
	Onxn1n6qTUd5smo9/9w2vAFxCrhPkFTh3CRNJmVDOe4+K1ViJakzAGXfZ/ZEKYSQbvAsKG8lwuidC
	lWoUcJksEo4rCyqfLOp46V4y0khDIJ/bHh2VbdBThJzPs7scLLmFyZ2XhP+JHcc9llNftYjee6Lw4
	0R8R8E6MfDh8ThC4pLBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdzm-00000002RJH-2BRh;
	Fri, 16 Oct 2026 09:12:58 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdzk-00000002RIp-0oHQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 09:12:57 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cd61a2dfd7aso1080107a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 02:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141974; x=1792746774; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R5dwpMdeDtafkrSIKilmZHw+Byk+8y+YTLJ/JPrzYVs=;
        b=Oh9B9utSCLSgp2PRxsyAKRnaZup6ZCY/gDAsA21Snt7rbTpv3MfqnO5y7RPoSPtVra
         xXo+xllyIzudUgCD5uZbf3X8EZ7NxDd+mrCjdr/CMdMMqRoU22Q0RrLPwPqaajaHA3tn
         1zpzNGOuzh3iVOkwjw4tX8bJy3Rtx1naydCMfATvH/fX7XwNw5zzgLCbxt6lJhWFnk0d
         M4oeBZTXR2dAe1gEWvZqs0wvOt1L/xF5OGiMgPLSPG56y0xckuG/lo2onI9/kzACiki6
         xHTAYWgPmbZuMWQTshk23piKhhJvguO1OuVXWjDy73ug+dH8fnXOQwv2sQjitHvrqivU
         /fUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141974; x=1792746774;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R5dwpMdeDtafkrSIKilmZHw+Byk+8y+YTLJ/JPrzYVs=;
        b=u3TVNCX2f5lbKQ5PaW6zGXWLhkdFpZ0vS4q+ED3gDE1GFw84a6GSoN6PHtcvuc41UE
         YwfFrPo+p2y0FZgDMt/C2xp0DDnu4sBKJFtODiWiltXBzYHuj4MGf6IjhMxbeOf8YNt7
         bw1Ne1YejB/J/sRw3zGox45VLY1VIpuiRqrypR1qARaYPd7TNn8+zMuqmgw59f+fgeB3
         6zyjr2gjUwSrrUXUjfN91wvLth6H6pHy8I2W7JnlPmy9wP6tiPYcwmEfDwEEDGrp8b2c
         k8CwqljpX8FOqG8/6eYCwcC7rbHu/xTC/7EIw+COH2ywXZSwipw7Aq8MLA1LIrIyI4/Z
         Ooyw==
X-Forwarded-Encrypted: i=1; AKwUvBz/XtRV2kQUKmtmVJ5irOybVzZOX8XvZJm593YtAEk03e8I7U4rTIjanflwSyPGJXqE5XCBk9+gZImAevVE3qX2@lists.infradead.org
X-Gm-Message-State: AFq9FYKetk8L3CMiDnE5L2JQq/xOerRnD4H57NnoSscay5IOYNcQEZ7V
	QuPXapXTntFlCsO0E6jr8ZEfY02uGqDA/eO+ZqhGGsaQHFqTgWshMuIz
X-Gm-Gg: AYBFou2jt0516HE4+VPaGXFul50ZAD+cgUip5QmScfxQUTDENdAIlyKLYuqKvFhGf6K
	Mr51M0FgjM3nolzN9I1W+wT6DqytZuu1BxpgFiF7loE2woPNuHQOVEV4jzTazrez+iEyzpO2uLc
	Qvzo/LAwtYpNWsY8gaY/mNfQ77FgixBuw3y6REKdGStpiyS+XEP9LHAqTgie7pFVBWtA5vFtbC5
	DIegSPPVvQqzNsoxNL7abU+O9QabYgA2X9bTD8ILElZfKwbydW42Va2U/1OQgELVnwJOAkcI7jY
	Lq6QuOccd6e/gsDcAASoXhtFmAH5QopiJr/Tn6vYBEF67tU+/aiq7P4YbtG7QGO7KqEiPH0MtGH
	gZW3OpQdmCXV4FSHIHypnWUOWpxS3GTR/7J6Jq5oDULH3LgSuBVTzmvcl0ODbp8TD8g/6/HWaAp
	4vEBbxd16TZsmCAt3/wRhJyWjlZSCzPeQ8NDyxo1hv/lTy9rgRekS4nohf1DCqcsNKjsD64Zmfi
	obrFw2XT48H2Awq/9y4aPXQhuAVXUgUmawhreQOpfBMZ7FlmQ==
X-Received: by 2002:a17:90b:52c4:b0:3ac:9ed8:f319 with SMTP id 98e67ed59e1d1-3ac9ed8f5ffmr4225776a91.2.1792141974372;
        Fri, 16 Oct 2026 02:12:54 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497e28esm767274a12.7.2026.10.16.02.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:12:53 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH net v5 0/5] net: ethernet: mtk_wed: misc fixes
Date: Fri, 16 Oct 2026 17:12:32 +0800
Message-Id: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIDq0WoC/yWMyw5AMBQFf0XOWpOSqMeviAV6y7Uoab0S8e+K5
 Uwmc8GTY/KooguOdvY82wBZHKEfWzuQYB0YqUxVIhMlDtKGT1HIvDRZoTsjFUK8OAr6G9WwtKL
 5pd+6ifr1XeC+H49dyXVvAAAA
X-Change-ID: 20261016-wedfix-8079f58dbf06
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141973; l=1968;
 i=hujy652@gmail.com; s=20261016; h=from:subject:message-id;
 bh=cAYyzvBvABdQ3mPgVmEus3vWnqb83GFBiX1p5PjH1a8=;
 b=VVf24T35ucw91qTXLscFnfuQBIvCNVXax72WvCgQBWP7iRYfg2a2Md92x1wnbvy6rlwhXt0Zk
 geGFIrchTdnCstRJxHrqpZ+TlRCUsxcoNV+xlqHXS8CgRTcmeul1YBc
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=AYHrGhtLNb9z7JIsGOOYWmKKIoVPH7ZZgT+CLIDMuEM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_021256_241428_D2C55170 
X-CRM114-Status: GOOD (  11.12  )
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

Ths patch series includes some fixes for issues that were discovered
by Sashiko and one original patch fixing issue I encountered.

Patch 1,2,3,5 fix issues that were found by Sashiko
Patch 1 fixes tx wdma ring reset for WED v3
Patch 2 fixes the reset condition for rx wdma.
Patch 3 fixes rx ring and tx wdma ring not being freed up
Patch 4 fixes WED on non-DBDC mt7986.
Patch 5 adds error messages and bail out when wed_start fail

---
Changes in v5:
- Add cover letter.
- Add patch 3 to address Sashiko review on rx ring and tx wdma ring not
  being freed up.
- Add patch 5 to address Sashiko review on error handling.
- Link to review: https://lore.kernel.org/all/179000700034.2160803.10594281691384015089@kernel.org/

Changes in v4:
- Add patch 2 to address Sashiko review on rx wdma reset condition.
- Link to review: https://lore.kernel.org/all/20260730090030.201100-1-pabeni@redhat.com/

Changes in v3:
- Add patch 1 to address Sashiko review on WED v3 tx wdma ring reset.
- Link to review: https://lore.kernel.org/netdev/20260706101044.161059-1-pabeni@redhat.com/

Changes in v2:
- Address issues raisied by Sashiko in patch 4
- Link to review: https://lore.kernel.org/all/20260706101044.161059-1-pabeni@redhat.com/
- Add comment to explain the special case

---
Zhi-Jun You (5):
      net: ethernet: mtk_wed: skip ring reset in wdma_tx_ring_setup for WED v3
      net: ethernet: mtk_wed: fix reset condition for rx wdma
      net: ethernet: mtk_wed: free up rings during detach
      net: ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
      net: ethernet: mtk_wed: bail out when failed to set up rings in wed_start

 drivers/net/ethernet/mediatek/mtk_wed.c | 40 ++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)
---
base-commit: 191aa41548b2d2b6af534a6d5cf84a552435c74c
change-id: 20261016-wedfix-8079f58dbf06

Best regards,
--  
Zhi-Jun You <hujy652@gmail.com>



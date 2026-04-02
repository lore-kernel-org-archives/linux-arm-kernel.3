Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC472D6AAF7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 18:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b1n6z6TFS94mpyLJCVRW+VOlcY1RDTN5+gRHXXgGEEw=; b=uCfiM+8hQhIn8ettzEd73I4sxI
	uF/yml0wzyVvci8TFqmfobwLke/BhzzFo1f+1nNBnlRs3CF6CeEBBqGKoEtGAEV/eGGoRzyQcE8Hk
	yJT16nX1tIK8PnNwmXw23InFNdEy2DoeFaqVhDDLwmgxeAAzdX5m62gpEqdYTy9Mf6j/V1KfuIpp1
	JlGWEHu0h5BlrudmhFIgwnWA+TMcLzYPBOHv0GL1OdB/aDipAIMObsxAaFUVpK4OYrdbMDO7vITsK
	k5V/ssiUjI0k5/aWUzZNRxZF1nqQvaDlogbvZfBnUcnleylAQA6jcdhowkX5rQB+Jgg7lSlGx0AkB
	0PGiWtJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MsC-00000000fIc-0snj;
	Thu, 02 Apr 2026 18:34:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MsA-00000000fIQ-3gnH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 18:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=b1n6z6TFS94mpyLJCVRW+VOlcY1RDTN5+gRHXXgGEEw=; b=lGGRn+85coQKe66TW3ut4UpCmy
	bPUFg9jHfksZdRBDye+r90pcpJaA5nhEsgGPVV1u1fhducWaORRWfDn34796/WBXX38LXuxn2OS7K
	/6kzjQ38HRH758VEu99Nmx/I+/dlpB+jgEZVT/NBZ4TXFdnxvgCQJGgtcespHDeRYXYeUnL9+ozUc
	tSKnI+Tb4BZQ/8d1/c43Y74CQFqpZI5jUxYY/0YObU7gztt5M8J2+85u7r8AeUCG1JrY79NJ0/65F
	xriNg1U0z+FYPtC7gYPPEwY/sMJM3C6uH5tsTXQ5IIEjLL5fh6Pz360+rFvoDh3nmlgebIX3I9eX4
	YK0dqi0w==;
Received: from leonov.paulk.fr ([185.233.101.22])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ms8-000000033xm-0ikf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 18:34:29 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id B6CAC1F8004D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Apr 2026 18:34:18 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 2E013B4012B; Thu,  2 Apr 2026 18:34:18 +0000 (UTC)
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id F21FDB40126;
	Thu,  2 Apr 2026 18:33:51 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	=?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH v2 0/2] drm: lcdif: FIFO underrun/solid color bug fix
Date: Thu,  2 Apr 2026 20:33:49 +0200
Message-ID: <20260402183351.3281123-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_193428_331264_66E7431C 
X-CRM114-Status: UNSURE (   9.20  )
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

This series brings a fix for the FIFO underrun/solid color bug (in the
last commit) and two other changes that may help with reliability.

Paul Kocialkowski (2):
  drm: lcdif: Set undocumented bit to clear FIFO at vsync
  drm: lcdif: Wait for vblank before disabling DMA

 drivers/gpu/drm/mxsfb/lcdif_kms.c  | 18 ++++++++++++++----
 drivers/gpu/drm/mxsfb/lcdif_regs.h |  1 +
 2 files changed, 15 insertions(+), 4 deletions(-)

-- 
2.53.0



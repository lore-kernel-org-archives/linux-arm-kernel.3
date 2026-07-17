Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BEEC44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Content-Transfer-Encoding:Message-ID:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VOnpMQLqtWxoWPvEAvxWYuntVWIJXCH2mEgiCTe1og4=; b=JeS5ypPMvpvJstxQwRDZiM4W0+
	xfHLSrL8Ndk80ifxwHIvL9zEqECz5sXMkRObeuXg8jCbkR/byNZwip8WnM9bys4a8KWXC4TsBw03R
	rdZ2BkwFaXIlGgICuKJuOJmFUSoTrQETXiU4fugGsjEbhyiomU1Jv28U+Fw/ONj443DALsMJ35bnC
	x1IFcot+NxOg1E1AmPo3VQ/DyzJW/eXtFwjX4oQj/UQrdctrssW9iExLvvZ8fBIs1rG5uCIqvIitB
	cA2Tnd1dsPArk8C51PWvXBIznRlTGV4DO3LYowrYrFQXgTSl9xH3/46Yewb0wo3L80gwQpaB52KNy
	FAlGS3dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgIm-000000025Kq-1JHx;
	Fri, 17 Jul 2026 11:00:20 +0000
Received: from e234-53.smtp-out.ap-northeast-1.amazonses.com ([23.251.234.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgIi-000000025JD-2tfc;
	Fri, 17 Jul 2026 11:00:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=clipsneko.cc; t=1784286008;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=2Toci5uqsLuvPPWzuz/cs1WrKdJj/X8EFzQGQ0alrm0=;
	b=X4ctrmHd2UoeBcwe4PM2rJd4QTPGgnwSMa5Cj2oP7lwk5Bgno3QkEyY8hXCbmVrp
	MfCFc22fW4PgIOLe2qD1/ifdg39sINJKwCv7Vxr7ksfMrln8LVSFBwxu0l9I07B82dL
	yUvh6chRGvUAC51AnAsaKvqGbOQRbSuZUGE7Fjsw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1784286008;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=2Toci5uqsLuvPPWzuz/cs1WrKdJj/X8EFzQGQ0alrm0=;
	b=EMi4x7xwzuiUd96Y7/C2tDoycsBLOXyzZIzxIjmlo6JWIt4gIs7IiWakiZyuQ0dE
	5ygiHYVP7rMP4i1SpZR6kQ5NMvbnvzkeSVsf6vpoAQfjrhwsAKk+TCyegsBrUVn52oQ
	AlhuWcHkEl9tPp36/T5pu2bp92zI7hrqRQwAFfMI=
X-Mailer: git-send-email 2.55.0
From: Goliath Zhu <goliath.zhu@clipsneko.cc>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, goliath.zhu@clipsneko.cc
Subject: [PATCH 0/2] wifi: mt76: fix RX NAPI teardown on mt7996 removal
Message-ID: <0106019f6fbbd2b3-deb608fb-9fee-4026-98b5-5b108c95e4af-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: 7bit
Date: Fri, 17 Jul 2026 11:00:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.T/9jWCDXa31y4gauYStyPOpWTrkJmzALuy1iq6HUX1VjlgPUmzq7ZFI3EvLLZ39jJzv+2I2PP/uhCYcS7tWi4X9gcnDJGZZVVULSu7C54EK8m7rG19VNcAtmWQSUeF+Ydw79jCgmJ2QuxiKzKA17O4fInWrH2kml2UpMwmQGC6+Ow2RWdTIMP19sAecDaYp3:1.ap-northeast-1.tL27A1JIpKR2Y51a8BkHZBekDcSR82jwOhKrSwgRw2U=:AmazonSES
X-SES-Outgoing: 2026.07.17-23.251.234.53
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_040016_875045_C19C4187 
X-CRM114-Status: UNSURE (   5.70  )
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

Fix two RX NAPI teardown issues in the mt7996 removal path.

The first patch disables the RX NAPI instances before the common DMA
cleanup deletes them. This is the RX counterpart of commit 78ab4be54953
("wifi: mt76: disable napi on driver removal"), which fixed the same
warning for TX NAPI.

The second patch fixes a regression introduced by commit 6b470f36616e
("wifi: mt76: Fix memory leak destroying device"). Keep visiting WED RRO
queues to release their page pools, but do not delete NAPI instances
which were never registered while WED is active.

Build-tested with CONFIG_MT7996E=m, CONFIG_NET_MEDIATEK_SOC_WED=y and
W=1.

Goliath Zhu (2):
  wifi: mt76: mt7996: disable RX NAPI on driver removal
  wifi: mt76: skip NAPI deletion for WED RRO queues

 drivers/net/wireless/mediatek/mt76/dma.c         |  4 +++-
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 11 +++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

base-commit: 58717b2a1365d06c8c64b72aa948541b53fe31eb
-- 
2.55.0


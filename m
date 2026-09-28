Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5F2C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OXYeVQzELCKtGh0q84SkRLicj4vapUxgBVt2jQNGwLs=; b=Ax9hfKxe4wH2jY3XdgV9xvLizy
	w3Fkz0DT2ubC2yBMZrIp3/0YE7AKJa/ECQBwMsewmMA6yuzyx0uPYsaZayi7iZeR48r0Pt9BLR6HG
	kxdSC6u6Wvsu8hPWJOqGwitojIAf2grX8Qan0myr9Mr/CMS4uokxAhAHNvL8d8Omgn0oLR6UkQRgm
	qGjJfvz4faLTNcsa3tvRbY+hvCX8h1N9j/TeAPgt3ktdr3dLPxkO6kPaf8rcC5NOv44Zff/DYAtAi
	TRFoi5wjpQJ97kPebz/oQ5S38x9r6ss4bzBkDxczHJsXSZUay6CMzkxDyGxsLoV4DJIQvxhXMIWGi
	PS74UOzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6PZ-000000001QG-2zqr;
	Mon, 28 Sep 2026 08:08:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6PX-000000001Oc-0kpQ;
	Mon, 28 Sep 2026 08:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790582908;
	bh=mHblMN6ynrQHmtBIMtxtxnvLNaGyrMnqeA07Xe8HOBw=;
	h=From:To:Cc:Subject:Date:From;
	b=gWNPn2xdZ2Yvfz1tBN6iiFKQMTUBPWGhPE3dR6SZMLGB5yggsIhg/p8OJSH+YO++c
	 iXWQn1ez7kgW+vJq3ThyzB2G0L4wGd8t9LQTA5tH8+IsWgFU6Gs9LZd9PHIfOAx4BX
	 9+FCdU+inzctZOrbKuQrA5oXrSxEZmq0RCt03muC/grfTi37Iuqk2QUIRZG2LD8w3I
	 pYRElvOHc0dlMCPZwkxsAs6HnfUgqYu5GQSsrVFp5sJ5DSBjURwRjcEh+zcini6P6Y
	 XcoeUJ5Po4PlyqfJi2j89mvubU+5bkMizQwP3xlA2T+e7psXm8pHfT4qnjBCZNk9Ht
	 0HxzfKyooXPOQ==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 814E217E0056;
	Mon, 28 Sep 2026 10:08:27 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v5 0/3] media: verisilicon: remove unused variant and code clean up
Date: Mon, 28 Sep 2026 10:08:19 +0200
Message-ID: <20260928080822.19553-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_010831_376324_D40C7C10 
X-CRM114-Status: UNSURE (   8.51  )
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

"nxp,imx8mq-vpu" variant has been tagged as deprecated since 4 years
now. This series remove it and make some context's fields useless so
remove them too.

changes in v5:
- add more details in commit message
- add Conor Dooley accked-by tag

changes in v4:
- rework commits messages
- add r-b tag

changes in v3:
- remove more dead code

changes in v2:
- have a separate patch for documentation
- fix dt-bindings
- rebased on v7.3-rc1

Benjamin Gaignard (3):
  media: verisilicon: Remove deprecated nxp,imx8mp-vpu variant
  media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu
  media: verisilicon: Remove useless internal fields

 .../bindings/media/nxp,imx8mq-vpu.yaml        |  10 +-
 drivers/media/platform/verisilicon/hantro.h   |  10 +-
 .../media/platform/verisilicon/hantro_drv.c   |  30 +----
 .../media/platform/verisilicon/hantro_hw.h    |   1 -
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 117 ------------------
 5 files changed, 11 insertions(+), 157 deletions(-)

-- 
2.53.0



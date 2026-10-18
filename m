Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C806FCCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 10:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aV3QHZpzOHPfDb9zU7r95hbA5Y2mZWIiVFdWzeyQP7c=; b=e1TeY2OW4amYeQiEvkzJPqnQhf
	/byCLABq1rvqNGR4xW1gTFrufcpJaraQJ9x7cimb4OgLRECXlhFuvR4A0PGgCLReuMkF413jH/sL3
	cTGnEAsDmFZQtQhvj4xxy6s01Rt/hrW6Y+O+0V02wBLpzif82WtiJ3qLToirBhuauM4+2yFLhbECH
	WSqgMxbj634C9ek5Wpm1hGh4fkkkd3AW/OaDT14mw6sKP6Ar8/7IgYB2G3dWWiLDXPkBgZWvFBpN7
	JPDbfdcxO9t2Xnr+R6SLsoX6OoimxklRcx+DyrpzPOJKYNfQhBwjHBmoMc76IDATjklINbHE6k9Gy
	RVa9XGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIOR3-00000005ly2-49J5;
	Sun, 18 Oct 2026 10:48:13 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIOQs-00000005lnB-1FB2;
	Sun, 18 Oct 2026 10:48:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=aV
	3QHZpzOHPfDb9zU7r95hbA5Y2mZWIiVFdWzeyQP7c=; b=Df2I55a8LHOrYjC13T
	Y9/QsM72zoFNkxE2S168o6PFnJzVjPYrIFyYZwDyvaonYk0m3zB8g0qLvNFERF3+
	1dRiSwofPNT5dzmVbeqg00xV4LDgcug4LKK3OYJ4MVc+O4J4vfWSl5WpZ7XYGpfu
	2WRImamjG5AzuIS3qJeWWAaKQ=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDXHyjOo9Rq9DXFAw--.17380S2;
	Sun, 18 Oct 2026 18:47:43 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Money Wang <Money.Wang@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/2] wifi: mt76: mt7996: fix TWT and MLO teardown races
Date: Sun, 18 Oct 2026 18:47:37 +0800
Message-Id: <20261018104740.865520-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXHyjOo9Rq9DXFAw--.17380S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF4UKrW3Wr4ftF4xuw4UJwb_yoWfCrg_Gr
	95JryUK3Wv9F1DAFWfKrnxJrWjk3y8Wa47Cayrt3y7t3yfArs8CFnxKrnxXrs29a1xWrnx
	Ja98Z34I939F9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRMa07UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRDsJ2rUo9DJRgAA3U
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_034802_705810_B76D9CE3 
X-CRM114-Status: UNSURE (   8.23  )
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

Fix two teardown issues in mt7996.

The first patch removes a TWT flow from the scheduler list when the
firmware rejects the agreement. Without this, the flow slot remains on
the list while it is available for reuse, which can corrupt the list.

The second patch clears every link WCID of an MLD station before the
network synchronization in mac80211. The generic callback only clears
the default WCID and allows the RX path to retain pointers to the other
links while station removal proceeds.

The patches address independent paths and remain independently
buildable.

Jiale Yao (2):
  wifi: mt76: mt7996: unlink TWT flow if MCU rejects agreement
  wifi: mt76: mt7996: clear all link WCIDs before RCU removal

 .../net/wireless/mediatek/mt76/mt7996/mac.c   |  4 ++-
 .../net/wireless/mediatek/mt76/mt7996/main.c  | 27 ++++++++++++++++++-
 2 files changed, 29 insertions(+), 2 deletions(-)

-- 
2.34.1



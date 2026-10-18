Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE11CCF2D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 10:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aV3QHZpzOHPfDb9zU7r95hbA5Y2mZWIiVFdWzeyQP7c=; b=phKBkb7ac74x/q0MPtFM9J1kPn
	3TdstbjkK8LiZHWK/GjnE9FjiVnjWJU6zT6qfWrcGnCAOt5beeirBM5fVwhUKl17b5Q9zh3SBQTi/
	uk9S0Hx2gcDMLe3WpTAG1pQqt26BPP41JpwnvPHeF+4B7I/6LfIu+LdiIBnxfpCu8nnS6pwAWqDTj
	u/oK/cUpB3texFHGl8FoVQChYC+7PjMDkYpNuwl+RFJoxVpk7YzU1yGT5OL0y1opBKciafsKRdFIh
	d9FcX5mxTxUc4vA41U8dsNz6lyNa8MonGIT6zGN2nybJr9DsSDoeT7GTee4EtAkHmSD598VayZjH5
	omfyD5OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIOQj-00000005lhz-2cJU;
	Sun, 18 Oct 2026 10:47:53 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIOQe-00000005leJ-3eXO;
	Sun, 18 Oct 2026 10:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=aV
	3QHZpzOHPfDb9zU7r95hbA5Y2mZWIiVFdWzeyQP7c=; b=Ypdfi1KT70xA7ko7vW
	05kpE85n6HwAe36ASITupwv2XJi1lKS4eHzPxJic7DPtSLkFOewf7agxiC6ACR17
	n7JBwgC5DnYSbKhKco0QddQgHKC5gS7qcVdC+D6ZcqTvQCY7gt4syXeevFn/xoyl
	6MQu3pF+eb6jJxHGJcDFFfEco=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3H8HBo9RqgGcOBA--.32358S2;
	Sun, 18 Oct 2026 18:47:31 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/2] wifi: mt76: mt7996: fix TWT and MLO teardown races
Date: Sun, 18 Oct 2026 18:47:28 +0800
Message-Id: <20261018104728.865279-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3H8HBo9RqgGcOBA--.32358S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF4UKrW3Wr4ftF4xuw4UJwb_yoWfCrg_Gr
	95JryUK3Wv9F1DAFWfKrnxJrWjk3y8Wa47Cayrt3y7t3yfArs8CFnxKrnxXrs29a1xWrnx
	Ja98Z34I939F9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRXo7JUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8APoI2rUo8PY4QAA3f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_034749_560240_38266E53 
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



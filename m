Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC744CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wuIWijRtYYAq+6BiQ98mjJUGC3M/zZZs5wiFaBV7CKQ=; b=n9biFdEdfkPPJGPNC/82yQypST
	uhp9o2xAVcdLnlfwgsMJzpvCrI4luc3Sb4XE9VWK52TeIbr5mrCPQBovvuPPo7Hqy0YB4TaFZt8yb
	QjJu0qTpdr+wm8WtHbir0kkRxHypstdOAc9CXhIhiYHZjedMnomjisXvw1sIvDxGlInXYBDf8Z6Jk
	l5HB51016aFjUFBTfmcu6iSflvNXQ5pCYy3LUzpOSFQgYCizsUVhCiEGNtFm/D/6jPY2TURqPMcxD
	698D+VfqKvwI1PgJdBdxmglXOh1oMy7igAdWgT/za7C5AIMYLdU8PUF7+9p1uxtR1T8KehXdcH8So
	MpjLv3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkKh-0000000787T-2BPN;
	Mon, 19 Oct 2026 10:11:07 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkKY-0000000783M-2ny0;
	Mon, 19 Oct 2026 10:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=wu
	IWijRtYYAq+6BiQ98mjJUGC3M/zZZs5wiFaBV7CKQ=; b=HmM1/NcZRdhsrpk1Mv
	Fcv3FyCerOktb9bZmHZp527joX1ZoMtCfwslgUMxPRcJMQ50eryxc0p5ERYOcRsr
	WdFr86uo3162damvcw81es03JFf0P5VGukwDL0z6mNfLcVG3W/qdmYvR8myUx4Xi
	i/94gioD1HJIQq8rt5MwX5PiE=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3_8Wk7NVq1VPPBA--.45843S2;
	Mon, 19 Oct 2026 18:10:45 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/2] wifi: mt76: mt7996: clamp beamforming NSS
Date: Mon, 19 Oct 2026 18:10:40 +0800
Message-Id: <20261019101043.1922205-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_8Wk7NVq1VPPBA--.45843S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruF1fZr1rtr4DGrW7Ar1UJrb_yoW3AFg_C3
	4vyr98JF48tFWrKa17Kwn7XryIvay0gr1kCw1jy395X34xArs5WrZ7Jr1UXwsrWay8XF15
	Jrn3XFyxA34fZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUtl13UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wV0rmrV7KUf4gAA37
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_031059_873514_9142FA3D 
X-CRM114-Status: UNSURE (   5.42  )
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

The mt7996 beamforming configuration converts a peer maximum NSS to a
zero-based column count.  A peer may report no receive streams for a
VHT, HE, or EHT MCS range.  Decrementing that zero value underflows and
can send an invalid beamforming configuration to firmware.

Patch 1 fixes the shared VHT and HE MCS-map conversion.  Patch 2 fixes
the corresponding EHT conversions for 80, 160, and 320 MHz operation.

The series was checked with scripts/checkpatch.pl, and each patch was
checked for application against the common base.

Jiale Yao (2):
  wifi: mt76: mt7996: clamp VHT/HE beamforming NSS
  wifi: mt76: mt7996: clamp EHT beamforming NSS

 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
2.34.1



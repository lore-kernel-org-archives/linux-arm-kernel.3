Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80549CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VBomzRk9uUTgk753tHBnspcaDlOQMppIF8orQT9r2mI=; b=cTNqvJwNioeyPMe9fBSm+jlSxz
	VLg3Bn9ErVLewThl8w7tcQXPh4dJsP09Vu+qaoG6EMmCSxsUQ2DCXToK/7QwxK2upkop4umxu9i4S
	5P9CJkzk5MSYch5oy/5OuudT0XcZIkrJNfxm61baXUpp3RDe0mCOJXvKglIN9oMC9pkfDwJZ2a0gk
	Q6MoD9cCNRk0RHF3IcgSNsz4emkCQA6NCp/OdwDrNIXzJkq/Vo8ulaaRr+kl9mEs++FHVK9tlPxDx
	UnGbbOwlNEQH/pTuUwW1W8Uo/mOW9DTbLTXnXxW562vnYyixr0Vk2riFJllEri0wP1d10mv8VjhYZ
	lu0u4/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjkF-000000070yi-3Bej;
	Mon, 19 Oct 2026 09:33:27 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjkC-000000070xY-0UId;
	Mon, 19 Oct 2026 09:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=VB
	omzRk9uUTgk753tHBnspcaDlOQMppIF8orQT9r2mI=; b=LI7XT3pKwH1BQw30Gm
	3Mpv/Wk+Ex+kdYYifhKsQM2TjcXW74AaQfqYDZ2GXm0fCyRT9Y3kh02uYq2TNTiC
	4TsAWS9pihgdCBa4/MjYOJGi4FksYb+W6fVIAXrGbOyy3KbIN7gcRRpD6atTW/PY
	fOvFWpU9ZxE/u0cZEAnxzstEI=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3H73U49VqbIAVBQ--.320S2;
	Mon, 19 Oct 2026 17:33:11 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <jiale.yao@example.com>
Subject: [PATCH 0/2] wifi: mt76: mt7996: clamp beamforming NSS
Date: Mon, 19 Oct 2026 17:33:05 +0800
Message-Id: <20261019093307.1869749-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3H73U49VqbIAVBQ--.320S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFyrurWrJr1UZFyxJw4UCFg_yoW3trg_C3
	4vyr98JF48tFWrKF17Kwn7XryI9ay8Kr1DG34Yy398Xw1xJrs3WrZ7Jr17XwsrWay8XF13
	Jrn3XFyxA34SvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjLL07UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xc+eGrV49dfWAAA3y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_023324_797414_E01AC3AF 
X-CRM114-Status: UNSURE (   5.52  )
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

From: Jiale Yao <jiale.yao@example.com>

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



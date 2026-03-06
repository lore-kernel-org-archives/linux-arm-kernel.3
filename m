Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2F8F01822
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6su7dB16JTFoMBcxeJuAhCGcoSJbu/TNjj9N42DfbC8=; b=AvxIFUYsP6bs8U
	kWg55PhHUmZTsVDLOvDjy1TtYaKjJI+G0FlQ0a9DB8JwM6MEpt2HLkloODv1DO5lBCFNKWKUQQtc1
	2hQ4WlJ26fKyWLi+gOlYYDWDDdTs5PlrqU8UuuV6HJk+NXUKrMGwaWY18vMe/5KaxgslIR9AcfYZ9
	5ONKkE21hyo65g112vwRstFQSfkvgdzE8RfimPXfFUE4CzMFuZqzcTao+1XDcCcjz3UWJXJqjuvmR
	prj95VNy9xhMyVHCMHbHEHk0Td3MYOp/ddFlOglRL6OTWkrAEXXKM7LKMHKjFVsXDSGGSXe1/EQXV
	d2ApDEXzOzse9lWF5vNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySPg-00000003RtE-3okD;
	Fri, 06 Mar 2026 10:28:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySPf-00000003Rso-3PrZ;
	Fri, 06 Mar 2026 10:28:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF32760018;
	Fri,  6 Mar 2026 10:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DCCC4CEF7;
	Fri,  6 Mar 2026 10:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772792886;
	bh=xyoECdBTPkHphTz09uglf5Fw6arG6VEmkxyNX6In6MM=;
	h=From:Subject:Date:To:Cc:From;
	b=uNwTMYE1DoKL3rUtZKyGsvrXvWLZnbTJMsk8I4pOEvWfvhWdENhFUy9KEBQUn0Nga
	 dZNrWxois0UL7wprBmeNXcTjiAMVnR79fPXdgGzP0lAIWYKW9c8Fw9BxtRFxO7qPdG
	 DOsI0lYnWj9eZQUfN6+dePTHT2QvhpYyNFayJpmiUue5b7kuzBiqXu8VgEsKLagQ9o
	 +rWf5j3MMdp2PgBM2qDzXQg48Sx/yh31sxUdlc51+ugn6UB79Ikeumd6P+K0IEZLvD
	 hajtjApUZNtjWmZlNKgg5nCVwGQy5BMRDGWv8xkgg+Zkm6jDXGjTIfkWW/mVseggYF
	 3dHrvQrBCaGOA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH mt76 0/4] wifi: mt76: mt7996: Some MLO link reconfiguration
 fixes
Date: Fri, 06 Mar 2026 11:27:51 +0100
Message-Id: <20260306-mt7996-deflink-lookup-link-remove-v1-0-7162b332873c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NwQqDMBAFf0X23IVExaq/UjwU92kXNZFEpSD+u
 8HbzGXmpIigiNRmJwUcGtW7JPaVUf/7uhGskpxyk1emMCUv27tpKhYMs7qJZ++nfeWHAxZ/gG0
 vYlAWgtpS6qwBg/6fx6e7rhtMaEUDcwAAAA==
X-Change-ID: 20260304-mt7996-deflink-lookup-link-remove-1cdd0e43de81
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
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

This is a preliminary series to properly support R1 link reconfiguration
on AP side.

---
Lorenzo Bianconi (4):
      wifi: mt76: mt7996: Remove link pointer dependency in mt7996_mac_sta_remove_links()
      wifi: mt76: mt7996: Fix deflink lookup removing links
      wifi: mt76: mt7996: Fix deflink lookup adding links
      wifi: mt76: mt7996: Remove unnecessary phy filed in mt7996_vif_link struct

 .../net/wireless/mediatek/mt76/mt7996/debugfs.c    | 14 +++-
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    |  7 +-
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   | 82 ++++++++++++----------
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 74 +++++++++++++------
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  2 -
 5 files changed, 116 insertions(+), 63 deletions(-)
---
base-commit: 030eea77accf40477be540445fc5a5be52d810a3
change-id: 20260304-mt7996-deflink-lookup-link-remove-1cdd0e43de81

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>



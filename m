Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C7BC71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 07:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CncBn72Po4xfVSHEBJOvuxgfjvMFR73s62uElzwlrsY=; b=MfUfooihZWnpZj
	HLAYvt7gF5x5pfWm8BnNbFtjRijt1J66p5zLYCyZju5RkcCwiuzH2eu9SyI0LqUAlHDOpU0DpIKkt
	lfDgvKD1qqMYF68v+iMWc1cGdB7/w93deYmevqHxjfzaq1oOE4pqodzkFFk/Ul2vLlCr+9RSHRxHD
	8HTpgd5FE981RCzkYi8Dgo7Be4HfLrawSF6ki8SBe6quByk0Wj7nprYGsicSxDgBJr/gFghxNb9e1
	/azV0E2ozYSatfTsq5wH+oIbFXi47INwsaPG8IaRKnNIJUnxFISmmdS1SL+FdrwnKsX6GFnMrU1r0
	IUXTl/t/3EefnU4PEj+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2XU-00000004YR1-3AvW;
	Tue, 08 Jul 2025 07:14:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2V9-00000004YDh-3eX6;
	Tue, 08 Jul 2025 07:12:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4541661463;
	Tue,  8 Jul 2025 07:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3CBC4CEED;
	Tue,  8 Jul 2025 07:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751958747;
	bh=gjo96x9e45Yxy/9KO1uojpXNo9dbAQFOswgfQn3glyk=;
	h=From:Subject:Date:To:Cc:From;
	b=McnzOBb7/RzDNvcdlzM1uSubEdBkiig7ZRA5PyG+8wyb0LBeN+lV/uZNuOuEbTjQk
	 MQfoxQg/Xk3SwjfTZCJiNtFq4h5wqmWi9zTCZYq8sYSVWu4bHMWkKEUb4sQrSWvmxo
	 FdIkGuBQ6iISqJH9gpQdCUMO6wbcaYhhvaS+gtML4Ony8fITM6mKhqwQHnLYN7hL+e
	 Lhdyy+ZJx54sweX/XtZIUzlWfdL7ydaYwgmVBhbBVSC5zogXwMV0d5Pbr10+fzHtm1
	 25j8nRvbnchGllJLG34a4DvTm62xRANOEtVYuyyDns1en2l6i7fi71yWcdxsASwRYf
	 l9UfsK9lJXCWg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH mt76 0/2] Fix MT7996 driver performance in the mixed
 MLO/non-MLO scenario
Date: Tue, 08 Jul 2025 09:12:03 +0200
Message-Id: <20250708-mt7996-mlo-fixes-v2-v1-0-f2682818a8a3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMPEbGgC/x3LQQqAIBBA0avErBtQodSuEi2ixhpICw0JwrsnL
 R+f/0KiyJRgaF6IlDnxGSpk28Cyz2Ej5LUalFCd0MKgv7W1PfrjRMcPJcwK1866nqSSxjqo5xX
 pb3Ucp1I+14tdCGUAAAA=
X-Change-ID: 20250708-mt7996-mlo-fixes-v2-d59f6e12189f
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>, 
 Money Wang <Money.Wang@mediatek.com>, 
 Evelyn Tsai <evelyn.tsai@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 MeiChia Chiu <meichia.chiu@mediatek.com>, 
 Howard Hsu <howard-yh.hsu@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
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

Two more fixes to improve MT7996 driver performances in the mixed
MLO/non-MLO scenario

---
Lorenzo Bianconi (2):
      wifi: mt76: mt7996: Overwrite unspecified link_id in mt7996_tx()
      wifi: mt76: mt7996: Fix mt7996_mcu_sta_ba wcid configuration

 drivers/net/wireless/mediatek/mt76/mt7996/main.c   | 32 ++++++++++++++--------
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 12 ++++----
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  3 +-
 3 files changed, 30 insertions(+), 17 deletions(-)
---
base-commit: e553ac0d7616d6bcd06ed0c5f6126ce83097b31a
change-id: 20250708-mt7996-mlo-fixes-v2-d59f6e12189f

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069DAC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 11:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lgbyLG6ms1+YxnHx3lEBQOo07g6kINHjitNtyi/c/eY=; b=WFj0qesjZsd405
	Q8wefdr94wM7UPu6C3+P46EAud+sweHOlRg4w7/WXbprffmnkrPM2lsVsWGA2sbFZWiHP+RNwMISs
	gMAb/Bne8XmYdfuApBC6so+pOsF0ZNQGJGbotXDWRiDfaKHgssvjzAGznpZmhBLopbCaD4RxRVnxu
	DtHX+CvnOG6AX95aOJZ3ynF7epXQFWXPOf9rbk2UygwQnnRwwDSn0B2E5kzicH3PKNPjpyGMkak2K
	IKSdmE1yA4bAPzOFy/LaU1SY5hm9lq92RZTDtKeW+PC2yYz7l2WRFXGTv9Ne5LLl/HRBYppwu42K3
	cww3RyyDBBng0FZ6f10A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8gR-0000000FLtA-1OXp;
	Thu, 05 Jun 2025 11:22:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8c4-0000000FLTV-43GH;
	Thu, 05 Jun 2025 11:18:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 181256112E;
	Thu,  5 Jun 2025 11:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42AEEC4CEE7;
	Thu,  5 Jun 2025 11:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749122302;
	bh=tBOcorhhYIo/YdsKZH86zdXVOJw32seHQjAGm5MOlIE=;
	h=From:Subject:Date:To:Cc:From;
	b=AQI+hPehRdGmwWk8fAFErEY9JBj/y072b/fr7ZuK+l7AmC8iPzJnYxs8BALnFIKds
	 2K06CRRbT6Rhvq9JmDuPKpma9aBRMNLh2PCY9cEfA0XqKfnwSwUxe4MM6RD7GGsFZ8
	 whqevVpgoYA0tPfZy/G++MUpWtN/eztffUsSlVeC4Y3rusAkn3M0IyZdk7wxWzIQ+J
	 9IdU+isrGHH25VnNz5VHS+dccE0sdrTXQVv1IVD4+S9Yj4StU0IGbHa9AvdzwS/GRb
	 dBb9QiIFheu0YrrR3P9zrebbq+iHjIQe+Dk2Ae5VvYU/754eHw0OBh4bnZlnI8Xw72
	 u+m4dOcRJh7PQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH mt76 0/5] mt76: mt7996: Fix 'sleep while atomic' in
 mt7996_mac_sta_rc_work()
Date: Thu, 05 Jun 2025 13:14:15 +0200
Message-Id: <20250605-mt7996-sleep-while-atomic-v1-0-d46d15f9203c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAd8QWgC/x3MTQqAIBBA4avErBswI62uEi1KxxzoD40KorsnL
 d/iew9ECkwR2uyBQCdH3tYURZ6B8cM6EbJNDVLISihR4nLoplEYZ6IdL88z4XBsCxu0Y1Fr7bS
 sjYXk90CO7//dQWIK+vf9AIHOrNhxAAAA
X-Change-ID: 20250603-mt7996-sleep-while-atomic-db1877f728cd
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ben Greear <greearb@candelatech.com>, 
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

Fix a 'sleep while atomic' issue in mt7996_mac_sta_rc_work() since
mt7996_mcu_add_rate_ctrl() and mt7996_mcu_set_fixed_field() can't run in
atomic context.

---
Lorenzo Bianconi (5):
      wifi: mt76: Assume __mt76_connac_mcu_alloc_sta_req runs in atomic context
      wifi: mt76: Move RCU section in mt7996_mcu_set_fixed_field()
      wifi: mt76: Move RCU section in mt7996_mcu_add_rate_ctrl_fixed()
      wifi: mt76: Move RCU section in mt7996_mcu_add_rate_ctrl()
      wifi: mt76: Remove RCU section in mt7996_mac_sta_rc_work()

 .../net/wireless/mediatek/mt76/mt76_connac_mcu.c   |   2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    |  40 +----
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   |   5 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 188 +++++++++++++++------
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  16 +-
 5 files changed, 152 insertions(+), 99 deletions(-)
---
base-commit: 1b98f357dadd6ea613a435fbaef1a5dd7b35fd21
change-id: 20250603-mt7996-sleep-while-atomic-db1877f728cd

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>



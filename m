Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFC3F46456
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 11:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I3aJbkE9iVAdWd8MpiNIvxHHpK8Oy6kuO4iwfu/G784=; b=jzRInMsJ85PcHtx79nxV1121cb
	KEiLOT+bPSxmG6m+MQanPgJTp/chsZGI98HGOteZLghCq8dob96N7y3+VtiOgFfuemqsaNZU5ViiU
	edVxYJigDl64VsC4inYQhKRxQL1pQ3opF2eEwjC08cKB5Tyz9Owa3totHHpnIQHm3xo8k/5dD+IDW
	9I8rK81bq9Y+d9WWkJxMO38kam2Pl4N3XxHc4ad4eHo5hR/ZDzKLMETQ1P8yKbomumIHgsFmYUVA0
	9jwkmqAH1uREFzN00lgolsT4DjV2lrxLyrjzMq2skxbvDlOnrEHkYVSR9D2hX2cUbvfDmdmAhNqkQ
	r0X9x9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26NO-00000003qvQ-2w9t;
	Mon, 16 Mar 2026 11:44:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26NM-00000003quS-2E7F;
	Mon, 16 Mar 2026 11:44:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28A5542A0D;
	Mon, 16 Mar 2026 11:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB61C19424;
	Mon, 16 Mar 2026 11:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773661485;
	bh=inHV9Ped4ZMhwGK3rfrUQhkpL5mQU4uwMhKJpzqlqNQ=;
	h=From:Date:Subject:To:Cc:From;
	b=pBoxM5mnt3SKQXoXnj1AUM3wwwa4VZhnSSvPQ4ilJDVxPPl1Lbr/3I7mX4sgVVYpB
	 d4FfZ1sj+dYucs83o6kUYjQ8gtQJL+A3Za9AhJZaypiHijl8R4yTwIe/S/J3KUGP7P
	 mE1lm5TGSp5W6JazCR19NsjDWqOQ1Bwh2giS2q7LsbFdaFg4UoUjVSDCX2AjslnsMe
	 84w3C56kWv6FG9xv75PVK2/5PuZZtAbfo2QEKViYCrznx+VEjq8vvsrfPXw7hc7Q1J
	 1iAEhnURDZOFWth+nz4dbEg9oCWMV7m8flWcgR9ekoIGVws63HRGQw5SlT4DhamGgV
	 6qe1isiqgzQBw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 16 Mar 2026 12:44:27 +0100
Subject: [PATCH mt76] wifi: mt76: mt7996: fix frequency separation for
 station STR mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-mt7996-sta-str-v1-1-666814e6ab2d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBBFrxKzTtAUy64SLaymmkUWKhFId29o8
 RYP3v8FEkbCBH1VIOJNic7AouoK5t2HDQUt7NDIxkqtrDhy65wVKXsmCt2t7WS8cVpp4NEVcaX
 nPxyAWwvj+35Nw0zRZgAAAA==
X-Change-ID: 20260316-mt7996-sta-str-38f7b4a49313
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Peter Chiu <chui-hao.chiu@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_044448_598099_6342F5FD 
X-CRM114-Status: UNSURE (   7.82  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

Fix frequency separation field for STR in MLD capabilities
to allow prpl get correct chip capability.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 8dfb81eabc9aef9b54fd3b34e13114a1d5214541..d6f9aa1ab52d1258e3923783c8eac2ad5daf2b90 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -99,6 +99,7 @@ static const struct wiphy_iftype_ext_capab iftypes_ext_capa[] = {
 		.extended_capabilities_mask = if_types_ext_capa_ap,
 		.extended_capabilities_len = sizeof(if_types_ext_capa_ap),
 		.mld_capa_and_ops =
+			FIELD_PREP_CONST(IEEE80211_MLD_CAP_OP_FREQ_SEP_TYPE_IND, 1) |
 			FIELD_PREP_CONST(IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS,
 					 MT7996_MAX_RADIOS - 1),
 	},

---
base-commit: dab5edc5546c90674cfff033abc2b797b3ad4bf4
change-id: 20260316-mt7996-sta-str-38f7b4a49313

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>



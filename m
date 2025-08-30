Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF5DCA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 17:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nrVrXcIV1xnh8psffPMKeIjdtAN0BTmtBgvYjgncv4Q=; b=JMRl5Ua6yhl8uBecYADox6mVbV
	p1cmpg0ZTx9z8pnYqoxb+0lfWSxeMifxOolEtR3ElkM6aCnCTMrPms/qdcXxIPfkah4C8kQzxpWi9
	utQsoS20FJtXqIWTd6USsmE7e3mTLpjrHR4/e4I25ELBdN+Bdn73G+1RTj1n2j9Z5wladvR24eqCL
	DovTzkMYzxSHH9/U9KPx0Yu100WFqq45KypaoH7p0ScSm2XALOrdXItndS3ZN5m1lo03Q7qmPagXz
	2Eem6tLCF8reOZpPlypIV+4J5uEAgpPb/Fh5swMq1eXlq1OKjVaOyH2o0ucMI3rqvZz40fk8JTD1C
	v8Q+jDIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usPgC-00000008GBl-3PnR;
	Sat, 30 Aug 2025 17:47:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usP8Z-00000008DBY-3hGb;
	Sat, 30 Aug 2025 17:13:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CDE44418A;
	Sat, 30 Aug 2025 17:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECAC8C4CEEB;
	Sat, 30 Aug 2025 17:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756573991;
	bh=nRpClAVmKhPM4s+plqvugvMv46C4EG57OiMmEMzwUH8=;
	h=From:Date:Subject:To:Cc:From;
	b=qF3Lim3CWUypANIPoraJu0T/iGf+K/Iqp9/M9juuCaZ1DVaomWRLAvPeL+VMJt/HQ
	 kmqW8ZLN0bIBdA6lxqgP1RlYo1qJ9EeIQxT/LCZoiEssa8MEM/ofUTlQWXfsuWdNuM
	 4xyFf1Isv6+n3SP6iZSLuaE0OYrM+BDTtdQc4C9tBx7sYBf1Tzwmafjmn76lNNUCez
	 LWGc2RyZLmzzYJ1+sahL1/bi0PLuDXXa1U2+c3k/I/5aWp0RlvqE7NVjBJgOF9BMse
	 o2TozfvGWvaeODIjiO+rEimjItEpFZmf4WJfILOl8RpQ9cN3o09qk8RwalSyQ4ZgDO
	 8pjsXati3lPpQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 30 Aug 2025 19:12:50 +0200
Subject: [PATCH mt76] wifi: mt76: mt7996: Set EML capabilities for AP
 interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-mt7996_ap_eml_capa-v1-1-ef69c97c6adc@kernel.org>
X-B4-Tracking: v=1; b=H4sIABExs2gC/x3MTQqAIBBA4avErBNMsbKrRMhUUw30IxoRRHdPW
 n6L9x6IFJgiNNkDgS6OfOwJRZ7BsOA+k+AxGZRURtZaiu2srC0dekfb6gb0KLTCWlvq0U4GUug
 DTXz/07Z73w9ddaq3ZAAAAA==
X-Change-ID: 20250830-mt7996_ap_eml_capa-32a839eba9f5
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_101311_948893_9C0B14FD 
X-CRM114-Status: UNSURE (   7.53  )
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

Report EML capabilities to hostapd for AP interface.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 29e0cf966bcac5ab805b927fd73b7a23d15877ec..5af78760dbeaf3aa3d123e6438ff27c52d00ed51 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -75,6 +75,7 @@ static const struct wiphy_iftype_ext_capab iftypes_ext_capa[] = {
 		.extended_capabilities = if_types_ext_capa_ap,
 		.extended_capabilities_mask = if_types_ext_capa_ap,
 		.extended_capabilities_len = sizeof(if_types_ext_capa_ap),
+		.eml_capabilities = IEEE80211_EML_CAP_EMLSR_SUPP,
 		.mld_capa_and_ops =
 			FIELD_PREP_CONST(IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS,
 					 MT7996_MAX_RADIOS - 1),

---
base-commit: 035ba65d13516fa2afa78203ba3ef54fd70584af
change-id: 20250830-mt7996_ap_eml_capa-32a839eba9f5

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>



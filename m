Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C2C606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 10:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1WlLV5Nm;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XKD10/jR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRs+dp/44SrGLjjHHguutQnMLuK82bJeTnuJmmdtx2c=; b=1WlLV5NmTzKn9xnuFNRhlPRadU
	6z8AJfSqKpOWoDonxy1DZcb2o1V2gsfFilGDj/YjDCjAWuv0/mLpyIixE5OBDCi/JCpeePtoJ11az
	YHEXr9xgftqzMkfv23cFGPB6zDQ7WAm3LwXPO2gfyhqPtYrhIqOYoVO7yMRzscLM8St759i2Td5YO
	G7QCcw9cx7FN59kdaNT/KuDGvhx4wskHTUwY7Rs8Fb79SV6AFhVREkeDzLZ10nV/+T9aNWd2FlgF/
	e+6y7WTDjjSmdeHVB7U2ICiRVjLiJhh6cAUbZWeAATt2FKh/5DLLLhBuguxrhItPOmN4sEaFEL4RX
	5Z69LbrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJU0m-0000000BgKG-1e03;
	Wed, 21 Oct 2026 10:57:36 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJU0h-0000000BgHj-1bLk;
	Wed, 21 Oct 2026 10:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=fR
	s+dp/44SrGLjjHHguutQnMLuK82bJeTnuJmmdtx2c=; b=XKD10/jRABazCNIMJs
	S7jMwCvVY8O3GY9nkIODN4njwP090Xl++9xjweyAXRYhInYOZhhQxFhJOUidHdlj
	9ZqjveXIuqUQb/rJeiPg92QjY+i5eXUSicfAeF15EQazQ+CtMj0jLnza4U8Lc6hI
	jt86mWQRGG/Aww/aZwHLHRjvA=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3_1CJmthquYHTBg--.25487S3;
	Wed, 21 Oct 2026 18:57:18 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 1/2] wifi: mt76: mt7996: clamp VHT/HE beamforming NSS
Date: Wed, 21 Oct 2026 18:57:11 +0800
Message-Id: <20261021105712.4124467-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021105712.4124467-1-yaojiale02@163.com>
References: <20261021105712.4124467-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_1CJmthquYHTBg--.25487S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF1kAw1UXryxuF4Utw43ZFb_yoWfKFXE9F
	navFnaqFW8Kr10kr42ya9xurySyay8XrykG3y5t3ySga17A3y7urySvFyDJrsruF1xZr1U
	GwnxXFyjkayagjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbOzV5UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7w6a1GrYmo5BKQAA3h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_035732_136226_6643379E 
X-CRM114-Status: GOOD (  11.00  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A peer can advertise a VHT or HE MCS map with no supported
spatial streams.  In that case mt7996_mcu_get_sta_nss() decrements
zero and produces 255 for the beamforming configuration.

Return zero when the MCS map has no supported streams.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index cd7587ce5b8a..e6243dd33c31 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -120,7 +120,7 @@ mt7996_mcu_get_sta_nss(u16 mcs_map)
 			break;
 	}
 
-	return nss - 1;
+	return nss ? nss - 1 : 0;
 }
 
 static void
-- 
2.34.1



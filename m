Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D1F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 10:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SFhBYRvo;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=IvzovugP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jmjusv+/TilRvZcy4hr7+HvEUCRXyzMIezmOMmn48E4=; b=SFhBYRvoi7yzBZ/ZFHzn0j69Rf
	YU6TYYg2hTdXZI8O8Rw4JRznM6iO75sKg7KRVlRhPu1wvsnx5gdeAkYgSoJCNP6Xfp6f+VT5rI/5w
	MqqCI64M3AWeh3nwb3GKEK4Fb6gNN3WwQcZBaa5XmAgiMcucuPdgH3Tk8ziVYd8YsFPNbKr5saXkX
	xqDDqXBg9g44ewlah9g4ytB2WD6+U46Pst6IkmaYGqAvwUh+bHTC/bPaKkcRTm98OkbcgP4RDK5or
	3gkrv0AU+tN5gdhRaNZb0QBfUq4Eqv8TuHKbobkwomAwzq7WryLNRwQJAMv9GOMhaa/yJOMXTDUA2
	oa2duT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJU0i-0000000BgI9-0uHr;
	Wed, 21 Oct 2026 10:57:32 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJU0f-0000000BgHd-0VUn;
	Wed, 21 Oct 2026 10:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=jm
	jusv+/TilRvZcy4hr7+HvEUCRXyzMIezmOMmn48E4=; b=IvzovugP2uPXzlP9SN
	lomj1rAijISQFJ1claqNiVNkf2ChAbuKvSn5DYDooGPeX9ymNFhKfbxY8gfjpp9i
	iG2nXLcz3qkEcw29uDO7E5NuDbH/5M1j+34+dpm1HXOePNxymbrJNLAwWCRf7ZAF
	lLbK29/LJNWae6qJX5sEglmek=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3_1CJmthquYHTBg--.25487S2;
	Wed, 21 Oct 2026 18:57:15 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] wifi: mt76: mt7996: clamp beamforming NSS
Date: Wed, 21 Oct 2026 18:57:10 +0800
Message-Id: <20261021105712.4124467-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_1CJmthquYHTBg--.25487S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruF1fZr1rtr4DGrW7Ar1UJrb_yoWDWrg_u3
	yvyr95GF48JFWFka1xKFn7Zr1Ivay8Wryvkr1jy39xW34fArs3WrZ3tryrXwsFgay8ZF15
	twn3Xas7Z3sxZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj48B5UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wya1GrYmoxBBgAA3O
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_035729_491843_F79ADF6C 
X-CRM114-Status: UNSURE (   7.00  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

---
Changes in v2:
- Correct the author and sign-off email address.
- Add Cc: stable@vger.kernel.org to both patches.
- No code changes.

v1: https://lore.kernel.org/r/20261019093307.1869749-1-yaojiale02@163.com

 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
2.34.1



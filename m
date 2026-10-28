Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93FD606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 05:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gOHEBTs3;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=DepkwG9y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5+/zEcisdUo3RoFY7nVtqHud5/KjEXoewWCOd/h8vI4=; b=gOHEBTs3t3NIXy3DnoAGvJS/Jy
	EVeZ/L5dDBFnbcHAF107HLuOR3Tied+RhNyDwhjr3RiqC+r74bBBzHBF8KbS/o2Yd4Epzy8JmGQyC
	Nbioeer0M56rn2iUEQqzivlwYzZ/7lpJo6M2krQ4q3a6jS9Sw5dchBkqvhdCClEdrEHpvinNhl3R4
	jfb5DAmgEzgiiwZXfKRAV0M1oQANlhhjYcuhPpJpXMHKwOqENv1PySxxdjJkOZ6/PY1OqxMv98NZ1
	Gz4hgvpPJS8XzaT1Hnhx7B8gAmYfdsevDIpBEddthVI76hHlJrwgZou9t1e1mbyzYaLDcZYUgIfX5
	327ltwHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvpc-00000006Kep-32Oj;
	Wed, 28 Oct 2026 05:04:12 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvpQ-00000006KVm-0iNd;
	Wed, 28 Oct 2026 05:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=5+
	/zEcisdUo3RoFY7nVtqHud5/KjEXoewWCOd/h8vI4=; b=DepkwG9yHcqIxstD/W
	OMmGII+v6yaLEhGllylLD+7QHVrzaIwQhwt7hABwPWVGGyp59QckqAaTV9fm0PqJ
	VYC1WSFgBPr2ETgenpUclIlC0zI+tbHXtMi9b9PuVykdpXvn5pvraJiMYZhxdQ3t
	2BVpKGFxfyWNVxWl6uvJRDj9c=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3X28rguFqvXzDCw--.30877S2;
	Wed, 28 Oct 2026 13:03:40 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	Michal Kazior <michal.kazior@tieto.com>,
	Ilan Peer <ilan.peer@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/4] wifi: unwind failed interface setup and recovery
Date: Wed, 28 Oct 2026 13:03:33 +0800
Message-Id: <20261028050337.127464-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3X28rguFqvXzDCw--.30877S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GrWxWw4DWw48GFyrtF45trb_yoWkXrg_u3
	4kXr95Jw10yFykKFZrCF47C3yqyFWIkFyxZFWaqrW3Ar1xXFW3Wrnavr43ur4I9a1jyr9x
	CrnrXryrXws3WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0Gjg7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzg2++Grhgi3irQAA3u
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_220401_014652_BC61826C 
X-CRM114-Status: UNSURE (   6.27  )
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

Several wireless interface setup and reset recovery paths publish host
pointers or create firmware state before later operations which can fail.
Their error paths either retain pointers to vifs that mac80211 will free
or continue after firmware interface restoration has failed.

Clear the published ath10k and iwlwifi pointers on add failure. Check the
mt7921 and mt7925 firmware restore results, remove partial state and stop
configuring the affected interface. Each patch fixes an independent
driver path and can be applied separately.

Jiale Yao (4):
  wifi: ath10k: clear monitor interface after add failure
  wifi: iwlwifi: mvm: clear P2P device pointer on add failure
  wifi: mt76: mt7921: unwind interface restore failures
  wifi: mt76: mt7925: unwind link restore failures

 drivers/net/wireless/ath/ath10k/mac.c         |  1 +
 .../wireless/intel/iwlwifi/mvm/mld-mac80211.c |  5 +++-
 .../net/wireless/mediatek/mt76/mt7921/mac.c   | 16 +++++++++---
 .../net/wireless/mediatek/mt76/mt7925/mac.c   | 26 ++++++++++++++++---
 4 files changed, 41 insertions(+), 7 deletions(-)

-- 
2.34.1



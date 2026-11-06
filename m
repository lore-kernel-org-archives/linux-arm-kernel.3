Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F789606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RQYjiGpl;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=e8bCn0xj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=E2wwc7zaFaKTAagn5XMB9neG9tz4zIsm5fHynsnqTz8=; b=RQYjiGplOb0y3y679h2cjv8ZKX
	oiSYhOaaQhNNlkctiXUBlsyXl2Xz5Pq6U1ErjoA9LIE2GI3uFxhar4/ypz3rknWNOOQbgeEPNhx7L
	Bi3KO8flQupxRH/Of1LOAoxUAPjpJeFB5kqLe7QTBOuVpmOy6+j52HHCmZmTBQ3A4GvtpI5rh6v98
	+IL0gm52TSomfnqXkegeC9Zsy7sh0vobOvFbrY7/XhB4QBPclpc7VrQk8zXAqDsBwBiPY4CbD1v0d
	a6kbCmRJOpDE3ZD6UP0T7fFvh262sLovRQO68wNpthF2WCaRWBSj2f/alKUkX9ZpTbYKgyVfIeVsN
	A7WTRMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIUC-0000000CDF9-0W81;
	Fri, 06 Nov 2026 11:52:00 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIU6-0000000CDBd-3MCR;
	Fri, 06 Nov 2026 11:51:57 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DD71080449;
	Fri, 06 Nov 2026 12:51:51 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oszisWeC_mLU; Fri,  6 Nov 2026 12:51:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1793965911; bh=r6rXpQ7fhFSWHIdpUzyK8xO9/DWNH+d88klaR/M4tpE=;
	h=From:To:Cc:Subject:Date;
	b=e8bCn0xjo8DYglI3sgomLSMSiwhNWF7PY6QTs0R9FHuWU9Dx2FI/bI4uJTlU/xriz
	 NHM+2uYfP2o8GgCVfPSX08s59okwapKY8LLwjMRI2Yw2dkHgdMO4CH5xbfLvk/o5Uv
	 TVN7oWdmhX+ePJdezI5g1SH96peAC8iHkqoIkRlgQq7TAPmdoQURFERz3rdtXbbW9N
	 7iWpNJcSDOLBv7XWY/Le0EO7KUlY2T1ksoUbclL5vBwWfUBnhh+oZcEqO7hciiWUaE
	 XxUAJhZADeqLtrICJ/RUbmcx5q08UJ4viSKP3X2PICallR5+UIJjzuGWI+4cHbwZ1l
	 Hu92Hpz15VMtA==
From: Florian Maurer <fmaurer@disroot.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wireless 0/2] wifi: mt76: npu: fix rx ring handling
Date: Fri,  6 Nov 2026 11:51:11 +0000
Message-ID: <cover.1793927986.git.fmaurer@disroot.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_035155_273981_005C5933 
X-CRM114-Status: GOOD (  15.81  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On a Gemtek W1700K (Airoha AN7581 + MT7996) with the NPU offload
enabled, 5 GHz rx load crashed the board within seconds. Patch 1 fixes
that crash.

With patch 1 applied, the two WARN_ON_ONCE() checks in
mt7996_mac_tx_free() fired on misframed rx frames. A debug patch counted
2-4 of these bogus events per 30 minutes. Patch 2 fixes the misframing.
It needs multi-slot frames, which were frequent here because of a patch
that leaves the de-aggregation of mesh A-MSDUs to mac80211 [1]. Without
that patch the race may be hard to hit.

Lorenzo, I have no documentation for the NPU. Everything here relies on
what I inferred from the code, so can you confirm these?
- dma_idx is the host's consumer index, and the NPU leaves one slot free
  in front of it.
- The NPU writes the info word before it sets DONE in ctrl.

Also, with patch 1 the NPU can no longer get slots without buffers, so
a lasting page pool failure can stall the ring until something else
polls it. mt76_dma_rx_poll() has the same behaviour, so I left it. I
haven't tested this case.

Tested on OpenWrt with kernel 6.18.55 and openwrt/mt76 at 467ae2e3. Its
npu.c differs from this tree only in mt76_npu_setup_tc_block_cb(). The
test image also carried [1], [2] and other local patches. The W1700K
was meshed with an ath11k node and ran iperf3 in both directions on 2.4
and 5 GHz for 60 minutes (5 GHz rx mostly around 220 Mbit/s). There was
no reboot, and neither WARN_ON_ONCE() fired. That image had no debug
patch to count bogus events directly.

Reset/restart: repeated wifi down/up rounds under about 30 Mbit/s of
rx load were clean, but they don't reach the rx queue reset that
patch 1 changes.

Recovery itself can't be tested on this board because of a separate
problem, which I don't think comes from these patches: a build without
them also became unreachable after `echo 0,8` into the mt7996
sys_recovery debugfs file (full system error recovery, the same path a
real firmware crash takes). I will report this separately.

With the patches, the same trigger wedges the board with and without
rx load: the MT7996 stops responding on PCIe (completion timeout), the
firmware reload fails, and the retry loop deadlocks in
mt76_worker_disable(). A sysrq dump shows kthread_park() blocked on a
TX worker kthread that is already parked. `echo 0,1` ended in the same
state.

On this tree the patches are only build-tested (arm64, W=1); the
above was tested on the 6.18.55 image. Not tested: a completed
recovery with patch 1, and MT7992.

The same code is also open as a pull request against the OpenWrt mt76
tree [3].

[1] https://github.com/openwrt/mt76/pull/1170
    ("wifi: mt76: mt7996: let mac80211 de-aggregate mesh A-MSDUs")
[2] https://github.com/openwrt/mt76/pull/1132
    ("wifi: mt76: mt7996: use own MAC as BSS BSSID for mesh interfaces")
[3] https://github.com/openwrt/mt76/pull/1169

Florian Maurer (2):
  wifi: mt76: npu: return rx slots to the NPU only after refilling them
  wifi: mt76: npu: read the rx slot count after the first slot is
    complete

 drivers/net/wireless/mediatek/mt76/npu.c | 28 +++++++++++++++++++-----
 1 file changed, 22 insertions(+), 6 deletions(-)


base-commit: c4328134f3f7c2ce141121a8f82a5ec0cc8a709c
-- 
2.47.3



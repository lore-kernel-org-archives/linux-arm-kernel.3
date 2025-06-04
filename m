Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A72C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 01:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QvOVmPKvppy8gwIA/DZM2mitEjVunMyh6kXV99EpgrI=; b=yuRHMIyp43Zkc7iSvxqbwutF2C
	/0WVOIWettkX1CLAFY24TTD5JtxMOth/sbGqpJuJMrtXGqCnWTScezMZwWcwYb/L4erBc4mCrvgqt
	BrxwetxDzCNhwulsFlAsqMs4fnNft8eadW7Tys84eagJwL9NrMHZO80htwf2RPufR15LBD1Rox0H4
	xqkNYYAN6sAfLUXQ++/TwN3Wg+c3r30skG0IkIXuTjDAq++IxYmiLNhmVipOWBUsB7MC0lgz3JUve
	rwt2TPC6hhSzuzxFLb/ObuTWPhpfIbHvrTM069AcHQAVbXonAnNjUWlcgmIPrZ1KAv7Q5mwHmgjW0
	+M41Iz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcU0-0000000C7uG-3fzT;
	Wed, 04 Jun 2025 00:59:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcLd-0000000C6JT-2O4L;
	Wed, 04 Jun 2025 00:51:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 08EE45C17F0;
	Wed,  4 Jun 2025 00:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF150C4CEEF;
	Wed,  4 Jun 2025 00:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998276;
	bh=ruqyp1lgXUo0fJrZ8bntElC5bqwSl77q4nNBmXR4Xyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kH6CVXB7iwlkUa6KCN5DF78aZdii5u4c+sOEJRA6SJ3v11EGrHaD1Rq6Sh6f/ioB6
	 rIp9/LJuoRsOdZTMJOuE2ewWxnLAUMPENoL3E4hQM/92Nr2KEmAtNk1zVOzRi5Srj9
	 e+54NfoEy1ja4tg3boqMDyMM7GI1zeXo1rO5L6+ZqZhnGSvIXoW89OgnF09t/eG4wN
	 45jkaa9zLhyT9l/cJTx+631yaVDB4O/fi0LA9ii9A4glWKZJsqpIBBPEINuG1VE9Bj
	 sKHlq7M5bVE2cjkV6eKqnM0bv11AsJnHMP829TIaN8fnQIU/XqA5BGM+M3nWfJ90Sc
	 nSZ/ImVSZs4pw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: sunliming <sunliming@kylinos.cn>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lorenzo@kernel.org,
	shayne.chen@mediatek.com,
	chui-hao.chiu@mediatek.com,
	Bo.Jiao@mediatek.com,
	qasdev00@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.15 015/118] wifi: mt76: mt7996: fix uninitialized symbol warning
Date: Tue,  3 Jun 2025 20:49:06 -0400
Message-Id: <20250604005049.4147522-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005049.4147522-1-sashal@kernel.org>
References: <20250604005049.4147522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_175117_697499_13AB3711 
X-CRM114-Status: GOOD (  18.59  )
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

From: sunliming <sunliming@kylinos.cn>

[ Upstream commit 187de25110c8ac8d52e24f8c596ebdcbcd55bbbf ]

Fix below smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/main.c:952 mt7996_mac_sta_add_links()
error: uninitialized symbol 'err'.
drivers/net/wireless/mediatek/mt76/mt7996/main.c:1133 mt7996_set_rts_threshold()
error: uninitialized symbol 'ret'.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202504101051.1ya4Z4va-lkp@intel.com/
Signed-off-by: sunliming <sunliming@kylinos.cn>
Link: https://patch.msgid.link/20250419031528.2073892-1-sunliming@linux.dev
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

This repository appears to be much older or a different branch. Let me
analyze the commit based on the code changes alone: **Analysis of the
commit:** ## YES **Extensive explanation:** This commit should be
backported to stable kernel trees for the following reasons: ### 1.
**Bug Type: Uninitialized Variable Bug** The commit fixes uninitialized
variable warnings detected by static analysis tools (smatch). Looking at
the changes: - In `mt7996_mac_sta_add_links()`: The variable `err` was
declared but not initialized (`int err;`) and changed to `int err = 0;`
- In `mt7996_set_rts_threshold()`: The variable `ret` was declared but
not initialized (`int i, ret;`) and changed to `int i, ret = 0;` ### 2.
**Consistent with Similar Backported Commits** This fix is very similar
to the reference commits that were marked as "Backport Status: YES": -
**Similar Commit #1**: Fixed uninitialized variable `msta` in mt7915
driver - marked YES for backport - **Similar Commit #3**: Fixed
uninitialized variable `ret` in ath12k driver - marked YES for backport
- **Similar Commit #4**: Fixed uninitialized variable `msta` in mt7921
driver - marked YES for backport All these commits follow the same
pattern: initializing variables to prevent potential undefined behavior.
### 3. **Analysis of Code Paths** Looking at the specific functions:
**mt7996_mac_sta_add_links():** - The `err` variable could potentially
be returned uninitialized if the `for_each_set_bit` loop doesn't execute
any iterations (if `new_links` is 0) - While this might be rare in
practice, returning an uninitialized value could lead to unpredictable
behavior **mt7996_set_rts_threshold():** - The `ret` variable could be
returned uninitialized if `hw->wiphy->n_radio` is 0, causing the for
loop to not execute - Again, this creates undefined behavior where the
function might return garbage values ### 4. **Stable Tree Criteria
Compliance** This commit meets the stable tree criteria: - **Important
bugfix**: Yes - fixes potential undefined behavior - **Small and
contained**: Yes - only two simple variable initializations - **No
architectural changes**: Yes - minimal change that doesn't affect design
- **Low regression risk**: Yes - initialization to 0 is safe and
expected - **Clear side effects**: No side effects beyond fixing the bug
### 5. **Driver Context** The mt7996 driver is for MediaTek Wi-Fi 7
devices, which are actively used hardware. Uninitialized variable bugs
in wireless drivers can potentially cause: - Random return values
leading to unpredictable error handling - Possible crashes or unexpected
behavior in error paths - Static analysis tool warnings that indicate
potential runtime issues ### 6. **Static Analysis Detection** The fact
that this was caught by automated static analysis tools (smatch) and
reported by the kernel test robot indicates this is a legitimate concern
that should be addressed in stable kernels. The fix is identical in
nature to multiple other WiFi driver commits that have been successfully
backported, demonstrating this is a well-established pattern for stable
tree inclusion.

 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 91c64e3a0860f..ba8cfca842d0f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -987,7 +987,7 @@ mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 {
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
 	unsigned int link_id;
-	int err;
+	int err = 0;
 
 	for_each_set_bit(link_id, &new_links, IEEE80211_MLD_MAX_NUM_LINKS) {
 		struct ieee80211_bss_conf *link_conf;
@@ -1244,7 +1244,7 @@ static void mt7996_tx(struct ieee80211_hw *hw,
 static int mt7996_set_rts_threshold(struct ieee80211_hw *hw, u32 val)
 {
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
-	int i, ret;
+	int i, ret = 0;
 
 	mutex_lock(&dev->mt76.mutex);
 
-- 
2.39.5



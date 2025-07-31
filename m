Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD18AC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 10:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ehsQEF9YHeNhP8ob8sKXpKxHKKHF1FIYnlgtXwOJINM=; b=HnwOq2q8taoxHZvAyfWadEvwpS
	VBQzPIHdmlela00BlW2aeXXgyOLgsB5vXN1e5BziQhqOdYPLbnjdo0GRIg04bK1TeqRi00feOopUE
	9kKwGLx2soYPvafxAvQXH6VmAFtqBT0rTgb23P0Kc9rasx7zxmoXyIfC8YwEinLy8ps4nWSBchg9G
	it89dAkUjIDGcTqZS0GTMJHUTjrf85uWpVkDego+vRITHhWwfP1vU8jhvTVMrwQB5lBp0biAnr7Uw
	5HgAV1He4ahcLJEZtqV13nqj95o0z9siodyJm+xHcFrflvpduU/nma9kFWJZMmp5PCcxGydMtQ99c
	V6mJK+dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQgZ-00000003OKJ-24Z0;
	Thu, 31 Jul 2025 10:38:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQXQ-00000003N6Q-118B;
	Thu, 31 Jul 2025 10:29:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD9BF40BD1;
	Thu, 31 Jul 2025 10:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49203C4CEEF;
	Thu, 31 Jul 2025 10:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753957766;
	bh=YfUsBUo4ovzeXnKYZGrQHH7bnuk3EN5LYkXrLstAfJo=;
	h=From:Date:Subject:To:Cc:From;
	b=pZi6JGbZxBuFXF8FG2gBNppKNgyyp9C4ewQvFvHrJYPhIxPkrHkqRYIPRlXWzJMDQ
	 ODbTXPslfRYLVBbL42GfZXWpn8iEvhT2UqQ2JqgMcSwIuDDyyOowwKwBXwauVA5tkn
	 k/0Si4p6+6sbX3+ZsEws7nxovanj8fnCdPqF6evll26KXRee5kewEKuEg5WhhdXi5F
	 5+cYDCAKNL32t+w0/dboTEXSrF45Ih1KxyID8G8bS2Otg5K0QP6uNVhPGUJZV50yI/
	 Ly3rDVYjFPzhzpMIsR0+nBjRoB8RcnjKzJNGvJcRT/SuV4x1n3CC7UXXn0Uj4+TpJ8
	 sX9PpZRYfRwXw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 31 Jul 2025 12:29:08 +0200
Subject: [PATCH net v2] net: airoha: Fix PPE table access in
 airoha_ppe_debugfs_foe_show()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-airoha_ppe_foe_get_entry_locked-v2-1-50efbd8c0fd6@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHNFi2gC/42NTQ6CMBQGr0K6tqYtKOjKexjS8PMBL5CWvBIiI
 dzdyglczixmdhHAhCCeyS4YKwXyLoK5JKIZKtdDUhtZGGVuKjeFrIj9UNl5hu08bI/Fwi282ck
 3I1qZK2Soa+BRZCJWZkZHn/PwLiMPFBbP2zlc9c/+31611LK4pwpNnnZpq18j2GG6eu5FeRzHF
 xA3CGXPAAAA
X-Change-ID: 20250728-airoha_ppe_foe_get_entry_locked-70e4ebbee984
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_032928_331063_CAB8D15C 
X-CRM114-Status: GOOD (  12.03  )
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

In order to avoid any possible race we need to hold the ppe_lock
spinlock accessing the hw PPE table. airoha_ppe_foe_get_entry routine is
always executed holding ppe_lock except in airoha_ppe_debugfs_foe_show
routine. Fix the problem introducing airoha_ppe_foe_get_entry_locked
routine.

Fixes: 3fe15c640f380 ("net: airoha: Introduce PPE debugfs support")
Reviewed-by: Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Use locked postfix for the routine that is running holding the
  ppe_lock spinlock
- Link to v1: https://lore.kernel.org/r/20250728-airoha_ppe_foe_get_entry_locked-v1-1-8630ec73f3d1@kernel.org
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index c354d536bc66e97ab853792e4ab4273283d2fb91..47411d2cbd2803c0a448243fb3e92b32d9179bd8 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -508,9 +508,11 @@ static void airoha_ppe_foe_flow_stats_update(struct airoha_ppe *ppe,
 		FIELD_PREP(AIROHA_FOE_IB2_NBQ, nbq);
 }
 
-struct airoha_foe_entry *airoha_ppe_foe_get_entry(struct airoha_ppe *ppe,
-						  u32 hash)
+static struct airoha_foe_entry *
+airoha_ppe_foe_get_entry_locked(struct airoha_ppe *ppe, u32 hash)
 {
+	lockdep_assert_held(&ppe_lock);
+
 	if (hash < PPE_SRAM_NUM_ENTRIES) {
 		u32 *hwe = ppe->foe + hash * sizeof(struct airoha_foe_entry);
 		struct airoha_eth *eth = ppe->eth;
@@ -537,6 +539,18 @@ struct airoha_foe_entry *airoha_ppe_foe_get_entry(struct airoha_ppe *ppe,
 	return ppe->foe + hash * sizeof(struct airoha_foe_entry);
 }
 
+struct airoha_foe_entry *airoha_ppe_foe_get_entry(struct airoha_ppe *ppe,
+						  u32 hash)
+{
+	struct airoha_foe_entry *hwe;
+
+	spin_lock_bh(&ppe_lock);
+	hwe = airoha_ppe_foe_get_entry_locked(ppe, hash);
+	spin_unlock_bh(&ppe_lock);
+
+	return hwe;
+}
+
 static bool airoha_ppe_foe_compare_entry(struct airoha_flow_table_entry *e,
 					 struct airoha_foe_entry *hwe)
 {
@@ -651,7 +665,7 @@ airoha_ppe_foe_commit_subflow_entry(struct airoha_ppe *ppe,
 	struct airoha_flow_table_entry *f;
 	int type;
 
-	hwe_p = airoha_ppe_foe_get_entry(ppe, hash);
+	hwe_p = airoha_ppe_foe_get_entry_locked(ppe, hash);
 	if (!hwe_p)
 		return -EINVAL;
 
@@ -703,7 +717,7 @@ static void airoha_ppe_foe_insert_entry(struct airoha_ppe *ppe,
 
 	spin_lock_bh(&ppe_lock);
 
-	hwe = airoha_ppe_foe_get_entry(ppe, hash);
+	hwe = airoha_ppe_foe_get_entry_locked(ppe, hash);
 	if (!hwe)
 		goto unlock;
 
@@ -818,7 +832,7 @@ airoha_ppe_foe_flow_l2_entry_update(struct airoha_ppe *ppe,
 		u32 ib1, state;
 		int idle;
 
-		hwe = airoha_ppe_foe_get_entry(ppe, iter->hash);
+		hwe = airoha_ppe_foe_get_entry_locked(ppe, iter->hash);
 		if (!hwe)
 			continue;
 
@@ -855,7 +869,7 @@ static void airoha_ppe_foe_flow_entry_update(struct airoha_ppe *ppe,
 	if (e->hash == 0xffff)
 		goto unlock;
 
-	hwe_p = airoha_ppe_foe_get_entry(ppe, e->hash);
+	hwe_p = airoha_ppe_foe_get_entry_locked(ppe, e->hash);
 	if (!hwe_p)
 		goto unlock;
 

---
base-commit: 759dfc7d04bab1b0b86113f1164dc1fec192b859
change-id: 20250728-airoha_ppe_foe_get_entry_locked-70e4ebbee984

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>



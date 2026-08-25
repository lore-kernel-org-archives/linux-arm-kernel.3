Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3627CC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 05:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z2LjV1RDgMLJOxPbvy1Tzbd0cSfyrD3G222e0ML0XYI=; b=jQghpOVQ8C4BDeeGMij/j9Ac8S
	da/prwN3ePC52ZJi+uDGa62PJ2PLnmYh1ZIpzGx4fZfQILvC35okj5eS3Tx2Hm9ibLFf5z9RdVxWk
	jauGcKs0tNzwQDXsvdCbUStQod/oc9pzTcDF7HD1LXEmFJO5dcWvbtwE3VKvNYrzuet4vfJXP8tgR
	WS09A0WhD88XLPNo4SSI76yWS64slJhBsC1lTIYcc5AI8swr9mArm24kw2atbR9M3h15BZJD+Pmo0
	gqNIEyuEC4dV79/YYw7bwJ10pJT5jnNrelS3+8APq9tI5muZ5W4biORoyVVoyPJ6A1IOv+OHR++Lu
	Ac7+b0iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyjQZ-000000009yk-1CaH;
	Tue, 25 Aug 2026 05:10:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyjQX-000000009ye-0gbD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 05:10:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A8F36011F;
	Tue, 25 Aug 2026 05:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B98A5C2BCB8;
	Tue, 25 Aug 2026 05:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787634623;
	bh=hXnMDKcJk9t+ynGzOsO5VQ5udjQ56Oyu67C3zs9QzrI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=WLQHeN3dIom4b1tnW13mQK+6NWZ47wl59vDrY+X5vMb8enAPNNSGmzl/d8QNfnFkP
	 DoMEyOt79RAsUt4TroG4cqhj16L0M3DQHXEV3/5S5H/7eFVZxTjwZhngvAsuPnk0bO
	 PFBBnLgu9qEq/p4O10bISv7ht1VwmDwo2YznC257Nacfgtp8vPT6PIVzcoY+horpwo
	 i+7DTNMfNVOUZlmV3XMYiwtKc7Ss622ExWBTzLt3wEYGCFIs6SruntNR02lkGc9HIh
	 sZ4qqih2RMvDFpzwgeZhNcvnysLmjeF3iuJvQfEO8ZsO7i8Z+smzih6vbwVq4X7FO6
	 IJVeU+JsL3n/Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9438EC5DF94;
	Tue, 25 Aug 2026 05:10:23 +0000 (UTC)
From: Kim Mankyum via B4 Relay <devnull+mankyum.kim.samsung.com@kernel.org>
Date: Tue, 25 Aug 2026 14:10:17 +0900
Subject: [PATCH v2] KVM: arm64: Honour the SPMC FF-A RX/TX buffer size
 limits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-master-v2-1-f8af766d1f34@samsung.com>
X-B4-Tracking: v=1; b=H4sIALgjjWoC/2WNwQ6DIBAFf8XsuTSAlZKe+h+NB8Ct0gQ1rJI2x
 n8v2GOPk8ybtwFh9EhwqzaImDz5acwgTxW4wYw9Mt9lBsml4lpyFgwtGFlzlRehTd1oYyHLc8S
 nfx+hR/tjWu0L3VLWxRg8LVP8HE9JFO8vmgQTDI3i0qqu1orfyQRax/7spgDtvu9fPHsWlLAAA
 AA=
X-Change-ID: 20260820-master-572418a358ab
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Will Deacon <will@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Sebastian Ene <sebastianene@google.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
 Andrew Walbran <qwandor@google.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Kim Mankyum <mankyum.kim@samsung.com>
X-Mailer: b4 0.17-dev-1f2f7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787634622; l=7690;
 i=mankyum.kim@samsung.com; s=20260820; h=from:subject:message-id;
 bh=Sm5QCwajey1SaOwSaAJcudU9HgqxJdMcerYzBC9FXf0=;
 b=kiBaC1+ZZ9Jvk9u0bYHeEJMYXd+8bw9q7h/Ipl0xoXYPfnHnQfqZSsJBp76NBD8HmCs2PlXpR
 1QSPFK+0Uw0B7xuiVGWXd5FYxrhhoQRJJUktetoVK66WbLCnlN1H1HO
X-Developer-Key: i=mankyum.kim@samsung.com; a=ed25519;
 pk=HN6chQ/xsDvZkhMY6iO4umFaQcr/drgbOI/tEzVYrSg=
X-Endpoint-Received: by B4 Relay for mankyum.kim@samsung.com/20260820 with
 auth_id=964
X-Original-From: Kim Mankyum <mankyum.kim@samsung.com>
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
Reply-To: mankyum.kim@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Kim Mankyum <mankyum.kim@samsung.com>

pKVM currently sizes its FF-A RX/TX buffers according to PAGE_SIZE:
do_ffa_rxtx_map() rejects any FFA_RXTX_MAP request from the host whose
page count does not match the hyp buffers' full PAGE_SIZE capacity,
and FFA_FEATURES for FFA_RXTX_MAP never tells the host otherwise.
hyp_ffa_post_init() already queries the SPMC's minimum RX/TX buffer
size, but only for a feasibility check.

This breaks when PAGE_SIZE is larger than the RX/TX buffer size the
SPMC actually supports. For example, an FF-A 1.2 SPMC advertising both
a minimum and a maximum RX/TX buffer size of 4K rejects the 16K
FFA_RXTX_MAP request that pKVM consequently forwards to the SPMC on a
16K kernel.

Compute the RX/TX buffer size pKVM and the SPMC both support in
hyp_ffa_post_init(), from the SPMC's advertised minimum and (FF-A 1.2
onwards) maximum sizes, capped at the hyp buffers' capacity; below
FF-A 1.2 the maximum field is undefined, so fall back to the minimum.
Store it in hyp_ffa_rxtx_sz, report it to the host via
FFA_FEATURES(FFA_RXTX_MAP), and require the host's FFA_RXTX_MAP
request to match it exactly, as before. The other buffer-size bound
checks in this file are updated to use hyp_ffa_rxtx_sz too, since that
is the amount of the hyp buffers actually visible to the SPMC once it
is smaller than PAGE_SIZE.

Host page ownership remains PAGE_SIZE-granular: do_ffa_rxtx_map()
still shares and pins the entire host page backing each RX/TX buffer.
Such pages leave the plain PKVM_PAGE_OWNED state, so any subsequent
host FF-A share/lend on any part of them is rejected by
__pkvm_host_share_ffa(). The part of a page not visible to the SPMC
therefore stays pinned but is never exposed to it.

Fixes: 9d0c6a9af9e3 ("KVM: arm64: Handle FFA_RXTX_MAP and FFA_RXTX_UNMAP calls from the host")
Suggested-by: Sebastian Ene <sebastianene@google.com>
Signed-off-by: Kim Mankyum <mankyum.kim@samsung.com>
---
Changes in v2:
- Rework the fix to negotiate the RX/TX buffer size with the SPMC
  instead of relaxing the FFA_RXTX_MAP page-count validation.
- Account for the maximum RX/TX buffer size advertised since FF-A 1.2.
- Handle FFA_FEATURES(FFA_RXTX_MAP) in pKVM so the host discovers the
  negotiated size.
- Use the negotiated size for the SPMC-facing buffer bounds.
- Keep host page sharing and pinning PAGE_SIZE-granular, addressing the
  partial-page sharing concern raised in v1.

Link to v1: https://patch.msgid.link/20260820-master-v1-1-ea602b6d3860@samsung.com
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 62 ++++++++++++++++++++++++++++++++++++++-----
 include/linux/arm_ffa.h       |  7 +++++
 2 files changed, 62 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index a327c2bbb6b6..c3379d1e8fd7 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -71,6 +71,15 @@ static u32 hyp_ffa_version;
 static bool has_version_negotiated;
 static hyp_spinlock_t version_lock;
 
+/*
+ * Size, in bytes, of the RX/TX buffers used by the pKVM FF-A proxy: the
+ * portion of the (fixed, KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) hyp buffers
+ * that is actually mapped into the SPMC. Negotiated with the SPMC in
+ * hyp_ffa_post_init() and, since it is what the host must in turn provide,
+ * also reported to the host via FFA_FEATURES.
+ */
+static size_t hyp_ffa_rxtx_sz;
+
 static void ffa_to_smccc_error(struct arm_smccc_1_2_regs *res, u64 ffa_errno)
 {
 	*res = (struct arm_smccc_1_2_regs) {
@@ -239,7 +248,7 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
 	int ret = 0;
 	void *rx_virt, *tx_virt;
 
-	if (npages != (KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) / FFA_PAGE_SIZE) {
+	if (npages != hyp_ffa_rxtx_sz / FFA_PAGE_SIZE) {
 		ret = FFA_RET_INVALID_PARAMETERS;
 		goto out;
 	}
@@ -421,7 +430,7 @@ static void do_ffa_mem_frag_tx(struct arm_smccc_1_2_regs *res,
 	int ret = FFA_RET_INVALID_PARAMETERS;
 	u32 nr_ranges;
 
-	if (fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE)
+	if (fraglen > hyp_ffa_rxtx_sz)
 		goto out;
 
 	if (fraglen % sizeof(*buf))
@@ -484,7 +493,7 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 	size_t mem_region_len = FFA_MEM_REGION_SZ(hyp_ffa_version);
 
 	if (addr_mbz || npages_mbz || fraglen > len ||
-	    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
+	    fraglen > hyp_ffa_rxtx_sz) {
 		ret = FFA_RET_INVALID_PARAMETERS;
 		goto out;
 	}
@@ -619,7 +628,7 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	 * bogus.
 	 */
 	if (offset + CONSTITUENTS_OFFSET(0) > len ||
-	    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
+	    fraglen > hyp_ffa_rxtx_sz) {
 		ret = FFA_RET_ABORTED;
 		ffa_rx_release(res);
 		goto out_unlock;
@@ -723,6 +732,26 @@ static bool do_ffa_features(struct arm_smccc_1_2_regs *res,
 	}
 
 	switch (id) {
+	case FFA_RXTX_MAP:
+	case FFA_FN64_RXTX_MAP:
+		switch (hyp_ffa_rxtx_sz) {
+		case SZ_4K:
+			prop = FFA_FEAT_RXTX_MIN_SZ_4K;
+			break;
+		case SZ_16K:
+			prop = FFA_FEAT_RXTX_MIN_SZ_16K;
+			break;
+		case SZ_64K:
+			prop = FFA_FEAT_RXTX_MIN_SZ_64K;
+			break;
+		default:
+			ret = FFA_RET_NOT_SUPPORTED;
+		}
+
+		if (!ret && hyp_ffa_version >= FFA_VERSION_1_2)
+			prop |= FIELD_PREP(FFA_FEAT_RXTX_MAX_SZ_MASK,
+					    hyp_ffa_rxtx_sz / FFA_PAGE_SIZE);
+		goto out_handled;
 	case FFA_MEM_SHARE:
 	case FFA_FN64_MEM_SHARE:
 	case FFA_MEM_LEND:
@@ -741,7 +770,8 @@ static bool do_ffa_features(struct arm_smccc_1_2_regs *res,
 
 static int hyp_ffa_post_init(void)
 {
-	size_t min_rxtx_sz;
+	size_t min_rxtx_sz, max_rxtx_sz = 0;
+	size_t capacity = KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE;
 	struct arm_smccc_1_2_regs res;
 
 	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs){
@@ -774,9 +804,27 @@ static int hyp_ffa_post_init(void)
 		return -EINVAL;
 	}
 
-	if (min_rxtx_sz > PAGE_SIZE)
+	if (min_rxtx_sz > capacity)
 		return -EOPNOTSUPP;
 
+	/*
+	 * The maximum RX/TX buffer size was only added to FFA_FEATURES in
+	 * FF-A 1.2; the field is undefined on earlier versions, so treat it
+	 * as unavailable there and settle for the (guaranteed supported)
+	 * minimum size instead of guessing.
+	 */
+	if (hyp_ffa_version < FFA_VERSION_1_2) {
+		hyp_ffa_rxtx_sz = min_rxtx_sz;
+		return 0;
+	}
+
+	max_rxtx_sz = FIELD_GET(FFA_FEAT_RXTX_MAX_SZ_MASK, res.a2) * FFA_PAGE_SIZE;
+	if (max_rxtx_sz && max_rxtx_sz < min_rxtx_sz)
+		max_rxtx_sz = min_rxtx_sz;
+
+	/* A maximum of 0 means the SPMC does not enforce an upper bound. */
+	hyp_ffa_rxtx_sz = min(max_rxtx_sz ?: capacity, capacity);
+
 	return 0;
 }
 
@@ -868,7 +916,7 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 	}
 
 	copy_sz = partition_sz * count;
-	if (copy_sz > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
+	if (copy_sz > hyp_ffa_rxtx_sz) {
 		ffa_to_smccc_res(res, FFA_RET_ABORTED);
 		goto out_unlock;
 	}
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index e71d83ee0aef..a70d087174af 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -130,6 +130,13 @@
 #define FFA_FEAT_RXTX_MIN_SZ_16K	2
 #define FFA_FEAT_RXTX_MIN_SZ_MASK	GENMASK(1, 0)
 
+/*
+ * Maximum buffer size supported by the callee, expressed in units of
+ * FFA_PAGE_SIZE, as returned by an FFA_FEATURES query for FFA_RXTX_MAP.
+ * A value of 0 means no maximum size is enforced.
+ */
+#define FFA_FEAT_RXTX_MAX_SZ_MASK	GENMASK(31, 16)
+
 /* FFA Bus/Device/Driver related */
 struct ffa_device {
 	u32 id;

---
base-commit: cb8a75eec0877810b50aa1c5a833f929525cd2ee
change-id: 20260820-master-572418a358ab

Best regards,
--  
Kim Mankyum <mankyum.kim@samsung.com>




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8553BC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 05:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EVAonvAaePFFNIn/A+22NqA16fMd3B6JKu24rLge8jE=; b=dyF56qGiNFlgClqYk204+Jc9XV
	qZQFjkIizBx8tnd7/7+/jVNCcPKM3d11ndGT7ec891SZxDRpjKrDEqdFoa2WzOziQrfFmFGKa9lPx
	+RdSE16PjD7DPQA+O7swA1smArHK7b0T8wkh/nC13HClHS2RA3FN5/Tf7+oN964dShus3USPvGqMt
	V/5FoHJedLOEFmkIeMNPykIwvh8TFG7Q+flEuAGL9TrVHRUD/WwgguNat2ErFp/2PqsoP27MbeOw8
	5bdyO4VxX3dftNcy4KOg3Jf8qmzkzZalvnjjC9KZzJVJaTqtumNrpKQcfbEim2fpKo6Y5JV3nlKUi
	eB2l3olw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvYN-0000000Ar9v-379H;
	Thu, 20 Aug 2026 05:43:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvYL-0000000Ar9p-3xJ5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 05:43:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F162541B06;
	Thu, 20 Aug 2026 05:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4313C2BCC7;
	Thu, 20 Aug 2026 05:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787204580;
	bh=lKIuNEwXkewsy4tK1WJN34QuAHDuKZl6AT7O6VoE3N8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=uMDVJvb04CCtDl94mj1hr+od6rKZXfuCvVlJjTJO0dUUhoWqvz+o05aLfk7YsUMP8
	 odHIX0vCMzyQ4KGfI3Pyn2WoqHwIkVdYGVjglc/uokMkaJgnjw+ufUO7RK454VIt1O
	 v8CTTJ1MYa3wvP5+XiixFoqeR1sZcvVoB33qLR31HlMK7nPHps2zLgkxOp/WXKDD80
	 kd+JnaIURfZ9wcBvEYrHGvoLZWqglldyGQIyk3waheUFKQPi+jUnJV6BUgIJzm8Mpx
	 /dDvrlWS5fd/d+CQr0F+cTW7E8enS5BqcX37KnZQoseohhxDHGM+UbiymImA3oKMT6
	 hdHcNV7BxuGHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FF9C5DF82;
	Thu, 20 Aug 2026 05:43:00 +0000 (UTC)
From: Kim Mankyum via B4 Relay <devnull+mankyum.kim.samsung.com@kernel.org>
Date: Thu, 20 Aug 2026 14:42:31 +0900
Subject: [PATCH] KVM: arm64: Allow smaller FF-A RX/TX buffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-master-v1-1-ea602b6d3860@samsung.com>
X-B4-Tracking: v=1; b=H4sIAMeThmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMD3dzE4pLUIl1TcyMTQ4tEY1OLxCQloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AKBR3YWoAAAA=
X-Change-ID: 20260820-master-572418a358ab
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Will Deacon <will@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Andrew Walbran <qwandor@google.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Kim Mankyum <mankyum.kim@samsung.com>
X-Mailer: b4 0.17-dev-1f2f7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787204579; l=1770;
 i=mankyum.kim@samsung.com; s=20260820; h=from:subject:message-id;
 bh=U52efmJXTVzb8RMYHZnmIqS8t9rchcBRv6qyuCeV+Vg=;
 b=dDXmHg0ktieaSq7oXc09SObUbo7VHQ21lTUDunWXpSJKaBcfxUJ7WC6oIQiaHrtskS44NfKup
 tFGxEU6qfnFDF5d75K/eI0rdDEMiR7aGY8u05cYXrDNN49hdefDtAnZ
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

pKVM currently requires the host to map PAGE_SIZE worth of RX/TX
buffers, as do_ffa_rxtx_map() requires the FF-A page count to match
the capacity of the hypervisor RX/TX buffers.

This is unnecessarily restrictive when the kernel page size is larger
than the minimum RX/TX buffer size advertised by the SPMC. For
example, with a 16K kernel and an SPMC advertising a minimum RX/TX
buffer size of 4K, a host request with a page count of one is rejected
by pKVM.

hyp_ffa_post_init() already allows an SPMC whose minimum RX/TX buffer
size is smaller than PAGE_SIZE, and the page count supplied by the host
is forwarded unchanged when mapping the hypervisor buffers into the
SPMC.

Allow RX/TX buffers smaller than the capacity of the hypervisor buffers
while continuing to reject requests which exceed it.

Fixes: 9d0c6a9af9e3 ("KVM: arm64: Handle FFA_RXTX_MAP and FFA_RXTX_UNMAP calls from the host")
Signed-off-by: Kim Mankyum <mankyum.kim@samsung.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index a327c2bbb6b6..594d1112b5f9 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -239,7 +239,8 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
 	int ret = 0;
 	void *rx_virt, *tx_virt;
 
-	if (npages != (KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) / FFA_PAGE_SIZE) {
+	if (!npages ||
+	    npages > (KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) / FFA_PAGE_SIZE) {
 		ret = FFA_RET_INVALID_PARAMETERS;
 		goto out;
 	}

---
base-commit: cb8a75eec0877810b50aa1c5a833f929525cd2ee
change-id: 20260820-master-572418a358ab

Best regards,
--  
Kim Mankyum <mankyum.kim@samsung.com>




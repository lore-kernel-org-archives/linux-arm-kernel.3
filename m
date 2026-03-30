Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13581061B06
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgJ7zzrUW2V45knd7wTngmEu7ELXc1m/JD3T7B10AxM=; b=VYm1YRbYyJ0WudBi7qdxzLnJ/U
	aOgNE8yROCC3HXGFZG2ahSdT992rpedxuk1uvHaG7aVtz/xxPq89nqVVYMa3CUtVCbWMzySSxwnqK
	k2wITBzOqCSU0GNPGvwI4pq83U8NRHKRb7FHAugnRqSIu/EYzwyEQZ9b/F6LEIDdmDZ6dWjeMb9BY
	SJ3Wjz4BvENhZFm/01nNJo/rzlkmwpkRtmoA3W/MzdTeepMH6BDS0Vj0aODcxVI+nAnyw726Se89z
	6DfJ4aklOlcApoUgyfnDgOqp7vs0yb+AXvEGA2p7ON82KagVVR0C41wt+9Qgef3hTa8/N5kIM7yuF
	qBYHLI6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dvl-0000000BT6V-1NMs;
	Mon, 30 Mar 2026 14:49:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DvT-0000000BSvm-1yn7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:49:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3112140A92;
	Mon, 30 Mar 2026 14:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5454BC4CEF7;
	Mon, 30 Mar 2026 14:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882151;
	bh=ow7XJsMmy3N9br36ooPJfkzHGKyMX+Ym+pCiAfKaBdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lFqFqj50wqr2FJViioFsNc9/xL2EuLqR6jXGF6Z/MOtfJQ9BCUl44tzp6ti+xvG5D
	 IdCmLt/223LdESYrVQlR4EX/VrFy2cpgX91nWRvfM5LSU9uA1GYIkO52L3vu+h4ZwE
	 VbcGyrV/EbWfBmherpgyHGDl3ji7AooM/wHQwntACvNC5j3ZKdqQhdHuOvZlO0i81h
	 2U8hDyqiHlEvCHNfJycsHGOkGczb5cRd5lH3CvyJpLETrg5ixfjOSCucdHLwtqZ6Ta
	 iP5VdXcJQ3tZELv7/zjh7WDoPc8SUqNfPzDUmEQqfnGaythR2pkFiVn2hePslG3rP8
	 tBJZoU8DRJ28Q==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v5 06/38] KVM: arm64: Expose self-hosted debug regs as RAZ/WI for protected guests
Date: Mon, 30 Mar 2026 15:48:07 +0100
Message-ID: <20260330144841.26181-7-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330144841.26181-1-will@kernel.org>
References: <20260330144841.26181-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_074911_524277_BA8BA88B 
X-CRM114-Status: GOOD (  10.24  )
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

From: Fuad Tabba <tabba@google.com>

Debug and trace are not currently supported for protected guests, so
trap accesses to the related registers and emulate them as RAZ/WI for
now. Although this isn't strictly compatible with the architecture, it's
sufficient for Linux guests and means that debug support can be added
later on.

Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 06d28621722e..0a84140afa28 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -392,6 +392,14 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 	/* Cache maintenance by set/way operations are restricted. */
 
 	/* Debug and Trace Registers are restricted. */
+	RAZ_WI(SYS_DBGBVRn_EL1(0)),
+	RAZ_WI(SYS_DBGBCRn_EL1(0)),
+	RAZ_WI(SYS_DBGWVRn_EL1(0)),
+	RAZ_WI(SYS_DBGWCRn_EL1(0)),
+	RAZ_WI(SYS_MDSCR_EL1),
+	RAZ_WI(SYS_OSLAR_EL1),
+	RAZ_WI(SYS_OSLSR_EL1),
+	RAZ_WI(SYS_OSDLR_EL1),
 
 	/* Group 1 ID registers */
 	HOST_HANDLED(SYS_REVIDR_EL1),
-- 
2.53.0.1018.g2bb0e51243-goog



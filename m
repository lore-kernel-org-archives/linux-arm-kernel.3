Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2013D49C91
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 09:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f5EUBZ9dcsQ8t0gdihtzP5GMIMef8v977R/zbeHqjRo=; b=Emsk3D+duml3ACKWcQ5FfvPLT/
	K+BtiKfo7NQI8dmXa1DolN7AFelwpvAvQw981NRjsqSROQG/hKPwqBUJHjtlkzWexfUqB6E3TU65g
	Z54xLizGGI5fz8ZJUsKpKZpdCxJvuk6FkzRn1QsHo2ymDh3Vc9Olfh/EktrlEszT/9V5DWd8KhawF
	uWxpxP2yOyDtakpnEuyTI+R5ZX+DVJmWbZUnbqnNPnmqf44HnXq5JhUATHmBWBZ5a51mFp3eoiCMd
	txA5SJYQBTrbexP1F1wd6mvb+xlC72Ec/9LXi95qvNeT5QFsGObPkzlyLMhkPW768IKSI0kyCtti2
	EmKmvIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vll5c-00000001HS0-0dma;
	Fri, 30 Jan 2026 09:46:56 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vll5Y-00000001HPD-2p09
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 09:46:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769766287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f5EUBZ9dcsQ8t0gdihtzP5GMIMef8v977R/zbeHqjRo=;
	b=kyht1wy3aohi0RqXxWer36V24GEjuIn6TKENl97zz08XDESg9lmeO7shOI1qwBXO5f0YPi
	2jA0pVm3eLaL5CeK+6dDdZaMjd9GDT9368v6Zv1K/nA/icc8G79GfjVtU0qzG4cmBsz2k3
	02fLaAYYcPEqbir9aB9tVKQ3ZIPhboU=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	zenghui.yu@linux.dev,
	wanghaibin.wang@huawei.com
Subject: [PATCH] KVM: arm64: nv: Add trap config for DBGWCR<15>_EL1
Date: Fri, 30 Jan 2026 17:44:35 +0800
Message-Id: <20260130094435.39942-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_014653_021674_D24E842C 
X-CRM114-Status: UNSURE (   6.59  )
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

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

Seems that it was missed when MDCR_EL2 was first added to the trap
forwarding infrastructure. Add it back.

Fixes: cb31632c4452 ("KVM: arm64: nv: Add trap forwarding for MDCR_EL2")
Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 arch/arm64/kvm/emulate-nested.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 834f13fb1fb7..34a5460adaf0 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1166,6 +1166,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_DBGWCRn_EL1(12),	CGT_MDCR_TDE_TDA),
 	SR_TRAP(SYS_DBGWCRn_EL1(13),	CGT_MDCR_TDE_TDA),
 	SR_TRAP(SYS_DBGWCRn_EL1(14),	CGT_MDCR_TDE_TDA),
+	SR_TRAP(SYS_DBGWCRn_EL1(15),	CGT_MDCR_TDE_TDA),
 	SR_TRAP(SYS_DBGCLAIMSET_EL1,	CGT_MDCR_TDE_TDA),
 	SR_TRAP(SYS_DBGCLAIMCLR_EL1,	CGT_MDCR_TDE_TDA),
 	SR_TRAP(SYS_DBGAUTHSTATUS_EL1,	CGT_MDCR_TDE_TDA),
-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C0BC36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 08:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kFFvVb7pyRd1m9PwZr3OgHd+El34mFJ6WcuuSCpuExo=; b=UClpthAiopEr4iCeal8NOSfKQM
	NkSUbR3BPTG5NNtDMUGaVbBy2DF4RrZtnQ9OnlVzC6h1vJQ/hxTkKHjl+NqX+Rj2M/yQiLC6zwiF2
	oRbBicMNvsVjiza0pPH1ga4A0g1CUMxh+s4rTvpX/c/tw1+fhVLFH7Mlx2VE+gDFMWnEZNM446Y8u
	5Dzs4qDFEac7NK3E7Zx2P7etAl7On3JTvvPQkojB/kMvxTfJ5ATo35At7BP+RdC9MoUEww9ZPXSeN
	1Dv0GZzEulnqQufObBaM9TmSypO+pPtf+7kfb+H4vAXQmm6kAxsjKdZYr5lojTrYtLW6cUlXu2Zyi
	A5nQBXrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXNq-00000002NZB-3shN;
	Tue, 01 Apr 2025 08:54:10 +0000
Received: from fanzine.igalia.com ([178.60.130.6] helo=fanzine2.igalia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXM2-00000002NP0-2e7f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 08:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=kFFvVb7pyRd1m9PwZr3OgHd+El34mFJ6WcuuSCpuExo=; b=G4swfDbX/nywfj0pb7hMY5OgFh
	oRL2Vu1aq3y/bodsb6MSs1ZZFgbPKkrI4Ez9PwCq9btHC2q2xEvVmUj2ANerr87coc+ngWcfPfVvU
	QwlzA8an/OuG8KZ50NcFCX8dAoPMhv86ub8QrfD0tq+/a0dZTN9SXBRebkTFvZ6m0BnV6vd8YpV1U
	l5HC1OJvAeJLgjDTbxCiBvmRdv6ASeQiVeM/xZCfAWhNWQ/lpE+DDdIijxgy6CFr254aGzizoArFt
	l8of9psQPK+wW02zD+/79v7+u/9cgeqWcqDdxuEIdaxJE0lX8ADaOj4t1H7TOkDcI20ju5pMJX4tc
	kBzJVjwQ==;
Received: from i59f7adb8.versanet.de ([89.247.173.184] helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tzXLz-009Zsi-UM; Tue, 01 Apr 2025 10:52:16 +0200
From: Angelos Oikonomopoulos <angelos@igalia.com>
To: linux-arm-kernel@lists.infradead.org
Cc: angelos@igalia.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	anshuman.khandual@arm.com,
	stable@vger.kernel.org
Subject: [PATCH v3] arm64: Don't call NULL in do_compat_alignment_fixup
Date: Tue,  1 Apr 2025 10:51:50 +0200
Message-ID: <20250401085150.148313-1-angelos@igalia.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_015218_685068_96B891AE 
X-CRM114-Status: GOOD (  10.15  )
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

do_alignment_t32_to_handler only fixes up alignment faults for specific
instructions; it returns NULL otherwise. When that's the case, signal to
the caller that it needs to proceed with the regular alignment fault
handling (i.e. SIGBUS). Without this patch, we get:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
  Mem abort info:
    ESR = 0x0000000086000006
    EC = 0x21: IABT (current EL), IL = 32 bits
    SET = 0, FnV = 0
    EA = 0, S1PTW = 0
    FSC = 0x06: level 2 translation fault
  user pgtable: 4k pages, 48-bit VAs, pgdp=00000800164aa000
  [0000000000000000] pgd=0800081fdbd22003, p4d=0800081fdbd22003, pud=08000815d51c6003, pmd=0000000000000000
  Internal error: Oops: 0000000086000006 [#1] SMP
  Modules linked in: cfg80211 rfkill xt_nat xt_tcpudp xt_conntrack nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack_netlink nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 xfrm_user xfrm_algo xt_addrtype nft_compat br_netfilter veth nvme_fa>
   libcrc32c crc32c_generic raid0 multipath linear dm_mod dax raid1 md_mod xhci_pci nvme xhci_hcd nvme_core t10_pi usbcore igb crc64_rocksoft crc64 crc_t10dif crct10dif_generic crct10dif_ce crct10dif_common usb_common i2c_algo_bit i2c>
  CPU: 2 PID: 3932954 Comm: WPEWebProcess Not tainted 6.1.0-31-arm64 #1  Debian 6.1.128-1
  Hardware name: GIGABYTE MP32-AR1-00/MP32-AR1-00, BIOS F18v (SCP: 1.08.20211002) 12/01/2021
  pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : 0x0
  lr : do_compat_alignment_fixup+0xd8/0x3dc
  sp : ffff80000f973dd0
  x29: ffff80000f973dd0 x28: ffff081b42526180 x27: 0000000000000000
  x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
  x23: 0000000000000004 x22: 0000000000000000 x21: 0000000000000001
  x20: 00000000e8551f00 x19: ffff80000f973eb0 x18: 0000000000000000
  x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
  x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
  x11: 0000000000000000 x10: 0000000000000000 x9 : ffffaebc949bc488
  x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
  x5 : 0000000000400000 x4 : 0000fffffffffffe x3 : 0000000000000000
  x2 : ffff80000f973eb0 x1 : 00000000e8551f00 x0 : 0000000000000001
  Call trace:
   0x0
   do_alignment_fault+0x40/0x50
   do_mem_abort+0x4c/0xa0
   el0_da+0x48/0xf0
   el0t_32_sync_handler+0x110/0x140
   el0t_32_sync+0x190/0x194
  Code: bad PC value
  ---[ end trace 0000000000000000 ]---

Signed-off-by: Angelos Oikonomopoulos <angelos@igalia.com>
Fixes: 3fc24ef32d3b93 ("arm64: compat: Implement misalignment fixups for multiword loads")
Cc: stable@vger.kernel.org
---
 arch/arm64/kernel/compat_alignment.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/compat_alignment.c b/arch/arm64/kernel/compat_alignment.c
index deff21bfa680..b68e1d328d4c 100644
--- a/arch/arm64/kernel/compat_alignment.c
+++ b/arch/arm64/kernel/compat_alignment.c
@@ -368,6 +368,8 @@ int do_compat_alignment_fixup(unsigned long addr, struct pt_regs *regs)
 		return 1;
 	}
 
+	if (!handler)
+		return 1;
 	type = handler(addr, instr, regs);
 
 	if (type == TYPE_ERROR || type == TYPE_FAULT)
-- 
2.49.0



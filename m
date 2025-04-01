Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2684C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 13:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBSmAf96K9K37XWBnmUNvBRxxbqCThNLvDtTH19N198=; b=ix9w10M7NT5XRWhKPdiuwIPy5q
	Kk2MTHsMo7F2evNOqS6cGPflB/TcWmryhZJl2eNugqeERRGJ6Op2f0s4UVCSY25Bsa9wTsOg75Zsv
	PuJrLZxDMjRzbjxyuWmH9fAUQRW405KKzT04+3613Eu2j8epImqBE3yeUa2vIRzepEDjWeEopqEGa
	633NRWCuYMcSb+Iny9CMH1n6uyKp+5nrc547OJptu9ib0cXvqB4XkXRIPU1kfiONI9u1BiLaH5AfW
	/+ZTGtCKvxFVVq+uHV4RLB6HHPdBlCTakxNn5XJl8sgz3uTdMdEvPTozaDeS89JYVe8nyiJfN9EOI
	f6jdIDEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbmx-00000003SaY-0o2U;
	Tue, 01 Apr 2025 13:36:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbl1-00000003Rxz-0O2s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 13:34:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 860606112D;
	Tue,  1 Apr 2025 13:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77EB7C4CEE4;
	Tue,  1 Apr 2025 13:34:20 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Angelos Oikonomopoulos <angelos@igalia.com>
Cc: Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	anshuman.khandual@arm.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] arm64: Don't call NULL in do_compat_alignment_fixup
Date: Tue,  1 Apr 2025 14:34:18 +0100
Message-Id: <174351444424.198539.17675821891390639702.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401085150.148313-1-angelos@igalia.com>
References: <20250401085150.148313-1-angelos@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 01 Apr 2025 10:51:50 +0200, Angelos Oikonomopoulos wrote:
> do_alignment_t32_to_handler only fixes up alignment faults for specific
> instructions; it returns NULL otherwise. When that's the case, signal to
> the caller that it needs to proceed with the regular alignment fault
> handling (i.e. SIGBUS). Without this patch, we get:
> 
>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>   Mem abort info:
>     ESR = 0x0000000086000006
>     EC = 0x21: IABT (current EL), IL = 32 bits
>     SET = 0, FnV = 0
>     EA = 0, S1PTW = 0
>     FSC = 0x06: level 2 translation fault
>   user pgtable: 4k pages, 48-bit VAs, pgdp=00000800164aa000
>   [0000000000000000] pgd=0800081fdbd22003, p4d=0800081fdbd22003, pud=08000815d51c6003, pmd=0000000000000000
>   Internal error: Oops: 0000000086000006 [#1] SMP
>   Modules linked in: cfg80211 rfkill xt_nat xt_tcpudp xt_conntrack nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack_netlink nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 xfrm_user xfrm_algo xt_addrtype nft_compat br_netfilter veth nvme_fa>
>    libcrc32c crc32c_generic raid0 multipath linear dm_mod dax raid1 md_mod xhci_pci nvme xhci_hcd nvme_core t10_pi usbcore igb crc64_rocksoft crc64 crc_t10dif crct10dif_generic crct10dif_ce crct10dif_common usb_common i2c_algo_bit i2c>
>   CPU: 2 PID: 3932954 Comm: WPEWebProcess Not tainted 6.1.0-31-arm64 #1  Debian 6.1.128-1
>   Hardware name: GIGABYTE MP32-AR1-00/MP32-AR1-00, BIOS F18v (SCP: 1.08.20211002) 12/01/2021
>   pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>   pc : 0x0
>   lr : do_compat_alignment_fixup+0xd8/0x3dc
>   sp : ffff80000f973dd0
>   x29: ffff80000f973dd0 x28: ffff081b42526180 x27: 0000000000000000
>   x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
>   x23: 0000000000000004 x22: 0000000000000000 x21: 0000000000000001
>   x20: 00000000e8551f00 x19: ffff80000f973eb0 x18: 0000000000000000
>   x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
>   x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>   x11: 0000000000000000 x10: 0000000000000000 x9 : ffffaebc949bc488
>   x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
>   x5 : 0000000000400000 x4 : 0000fffffffffffe x3 : 0000000000000000
>   x2 : ffff80000f973eb0 x1 : 00000000e8551f00 x0 : 0000000000000001
>   Call trace:
>    0x0
>    do_alignment_fault+0x40/0x50
>    do_mem_abort+0x4c/0xa0
>    el0_da+0x48/0xf0
>    el0t_32_sync_handler+0x110/0x140
>    el0t_32_sync+0x190/0x194
>   Code: bad PC value
>   ---[ end trace 0000000000000000 ]---
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: Don't call NULL in do_compat_alignment_fixup
      https://git.kernel.org/arm64/c/c28f31deeacd

-- 
Catalin



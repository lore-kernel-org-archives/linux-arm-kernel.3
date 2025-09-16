Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79593CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 14:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQ7ppX3vDT+VC/vQpmx83hEP2Nvnm+7NScx7xOMahAM=; b=R3wHxCAqiIoNQKRPTW8bwwGZYw
	nuNveHK503SZ/JQDmhFsPksLhGaIXChmrUvCKrMYqcQt8NeKiAmr68iD0e0UDR3AFQGZPNnVUY5qB
	ldI73jhJNzlnxBP/9BS+9+3AEt7jKVxvhUZ47Z9EPzDBTn8s4RmIXLwU8WztWmHkQr9IxIjkClkfD
	LP6FGTSoUC5Jrb32oIGQ+h+6qmuV2x/pge+8ZumzILfyqmkq8HTJXduy1ocRwVhOdOObYLJsJbbr2
	Mx1TBi4iqnc9/fcf0R2C7rTbZL609ZKSUAUP3/g9rBgIBzjSKD1PUsCb+l3lbFK4cXOKme3rQJb7t
	fhfDMUSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWxo-00000008B1C-1s3H;
	Tue, 16 Sep 2025 14:47:24 +0000
Received: from mail.cock.li ([37.120.193.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWxi-00000008AyQ-25CC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 14:47:20 +0000
From: kemal <kmal@cock.li>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1758034031; bh=iNdPy1RoJEZ6L4XEIMicV8SguEdC/4lMJe75Iqpc6C0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aSOAEb5GMAH6RIXoRVRiUdKOKG/BUzf11lz2JzIkXW71YsF1HCSWVGR120mFnk3Rd
	 ZlZljh+td160I9cCT2ndocBGItVbxUnxftpno060IKMuWVfj0iFagh96Cn0vXINVIg
	 QOe9FSwDSfXhBbw3q2xf5SgxBYeepU2Uj5D8zkH6CuahQ290aPyMKgc0ik3ZnhO3vl
	 /lj6AlsX5ikkVDRxCfBXVK5cddRk3juNFAIwmjPDl44nFkt+6Bqruzwd2TdrejYuwa
	 9tVtEweu2nQbmOdJMa7jXBFramG61pHdvmlEEIKl1/yTUdJG0S0sR6wJRBZ8e7Dg+J
	 BLDPDo9aQXFxQ==
To: ruanjinjie@huawei.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v6 10/10] arm64: entry: Convert to generic entry
Date: Tue, 16 Sep 2025 17:46:21 +0300
Message-ID: <20250916144621.5606-1-kmal@cock.li>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916082611.2972008-11-ruanjinjie@huawei.com>
References: <20250916082611.2972008-11-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_074719_057673_8048A43B 
X-CRM114-Status: UNSURE (   8.52  )
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

Hi, can you make it so that this patch series support Syscall User
Dispatch? There needs to be 2 changes:

1 - Implementing arch_syscall_is_vdso_sigreturn
Here is my implementation for it:
(I checked for syscallno unlike x86, which checks if the IP exactly
matches with the VDSO sigreturn symbol. This solution seems better to me)

bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
{
	unsigned long addr, pc;

	pc = regs->pc - 4;
#ifdef CONFIG_COMPAT
	if (is_compat_task()) {
		addr = (unsigned long)current->mm->context.sigpage;
		if (pc >= addr && pc < addr + PAGE_SIZE)
			return true;
		return false;
	}
#endif
	if (regs->syscallno != __NR_rt_sigreturn)
		return false;
	addr = (unsigned long)current->mm->context.vdso;
	if (pc < addr || pc >= addr + vdso_info[VDSO_ABI_AA64].vdso_pages * PAGE_SIZE)
		return false;
	return true;
}

2 - This trick shouldn't be done if the syscall will be catched by SUD:
if (scno == NO_SYSCALL)
	syscall_set_return_value(current, regs, -ENOSYS, 0);
As the ABI could be anything.

Thanks,
-kemal


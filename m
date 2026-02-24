Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF3FEFB7F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 08:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JrK3VBIjVrucSlrAberyLkEdWmeJE2yLhBbtaEZeu7c=; b=fc8mv6r+13AhsBYHKbOSIWBJEN
	4/WiF8X2Df659VIzoC7Lk+4rznZ2azguTCo5RUE/B7wxG1X36/pNXS4CR6e0ZkI7V/ZVEagSu0EQY
	gqVm8OaVQdocHNN/R8JN6tj+piRqaEsWi+g27nuy/eyx0qKjsbZuhM6ZFgXSQbVdFGvbgGLPBW2E4
	Hc+BjfoUZAK/RkBzMBQi1ZHpEV603ZiNQm3LifvEpKkE4Sq/NNb2MWYiXIYUdmm/rxI09ituInVxT
	szSRaJ3PcNukrWP4K0W88x1HkEXGfacghJi4VsBUowuO1dWjFVNbyNgT5JrSSR3CcRtV0h9S3aBKS
	uZKnRfxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunVZ-00000001cb1-2x1v;
	Tue, 24 Feb 2026 08:11:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunVW-00000001caS-3OTP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 08:11:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45FCE339;
	Tue, 24 Feb 2026 00:10:55 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC0343F62B;
	Tue, 24 Feb 2026 00:11:00 -0800 (PST)
Date: Tue, 24 Feb 2026 08:10:58 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Zeng Heng <zengheng4@huawei.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/2] arm64: io: Extract user memory type in ioremap_prot()
Message-ID: <aZ1dEsub9133Qv1e@arm.com>
References: <20260223221012.31962-1-will@kernel.org>
 <20260223221012.31962-3-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223221012.31962-3-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_001102_894227_072C8BE6 
X-CRM114-Status: GOOD (  14.70  )
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

On Mon, Feb 23, 2026 at 10:10:11PM +0000, Will Deacon wrote:
> The only caller of ioremap_prot() outside of the generic ioremap()
> implementation is generic_access_phys(), which passes a 'pgprot_t' value
> determined from the user mapping of the target 'pfn' being accessed by
> the kernel. On arm64, the 'pgprot_t' contains all of the non-address
> bits from the pte, including the permission controls, and so we end up
> returning a new user mapping from ioremap_prot() which faults when
> accessed from the kernel on systems with PAN:
> 
>   | Unable to handle kernel read from unreadable memory at virtual address ffff80008ea89000
>   | ...
>   | Call trace:
>   |   __memcpy_fromio+0x80/0xf8
>   |   generic_access_phys+0x20c/0x2b8
>   |   __access_remote_vm+0x46c/0x5b8
>   |   access_remote_vm+0x18/0x30
>   |   environ_read+0x238/0x3e8
>   |   vfs_read+0xe4/0x2b0
>   |   ksys_read+0xcc/0x178
>   |   __arm64_sys_read+0x4c/0x68
> 
> Extract only the memory type from the user 'pgprot_t' in ioremap_prot()
> and assert that we're being passed a user mapping, to protect us against
> any changes in future that may require additional handling. To avoid
> falsely flagging users of ioremap(), provide our own ioremap() macro
> which simply wraps __ioremap_prot().
> 
> Cc: Zeng Heng <zengheng4@huawei.com>
> Cc: Jinjiang Tu <tujinjiang@huawei.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Fixes: 893dea9ccd08 ("arm64: Add HAVE_IOREMAP_PROT support")
> Reported-by: Jinjiang Tu <tujinjiang@huawei.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>


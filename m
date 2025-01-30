Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E931BC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 11:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZhqmywNcTqztKKkliyLoM9JUYawgcV/0EaQIzbfwi8=; b=N0OZtGMgusnySbCVCKfVMHwNNb
	55WfnQU54AxCph1JACjr/iiTqmNAABNZX/9vr9ZcAOF/AGkCdsG8fLNZvduym1fkXZ9DcO2zgwZ7F
	VzPvuNQxgi3z4dZxw9LVZVas+56Gw9mRZOTJeP6EBEi/Ot9/jdrSairCe4crXOT8Br4J1WZcKHiJp
	SBJ8DvHczjoDm12s44Tnu4xcMdGSwt9QdD2JlwVdZLmoMaRl6ajCsQUH2rSWRKqeFc/XILwRyiygV
	TENSJa8C9jMgWr4/gneHXuL4cR6OtfHJMQeJ5UWUstZ2pQxceG+FpK9x2NUkIHgKeLWc4t3d2/w6p
	XOxfPVag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdSyi-00000008j78-3p5v;
	Thu, 30 Jan 2025 11:45:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdSxP-00000008j32-06eS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 11:43:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CABEDA41E06;
	Thu, 30 Jan 2025 11:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747A5C4CED3;
	Thu, 30 Jan 2025 11:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738237417;
	bh=d909y8uoNbt6v8ZbwGPvH/z8+HKBXHqOmOGrYqPPB1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mw9zbo6iwD4EREVgnpZHrklccUTi0/GD6QIYt9/PeiK6MznCpcMOjVwYvaa0+Brjd
	 NBoHQQ+mw3uAEq+96e6wOnFs2yPSOwVwmVv/C//vFCQmcwf1JjkefRf9nIx2uS0kzr
	 Qu+oGkxdWvse2GB1xVjpOuEjGdcHCLcpgZiFLpsH0bEf0BSx3eFSvG8ezrwvURsMrJ
	 MJo66Lku/c2wbgrQAxUprwuDKtvE1OwSM3oIyHQFGOCN8hoQ/UZ+AYXomJIXt6Y9Wh
	 sTQAwP8ZHBmL53lec043FHmC+BjkaP4ROQ/mMdI62iIX3dW3hcoKZPyilzTdR/82uE
	 Q4UD6egLhPEbg==
Date: Thu, 30 Jan 2025 11:43:33 +0000
From: Will Deacon <will@kernel.org>
To: Emanuele Rocca <emanuele.rocca@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [BUG] ARM64 regression: NULL pointer dereference in
 arm_smccc_version_init+0x90/0x1ac
Message-ID: <20250130114332.GA28662@willie-the-truck>
References: <Z5OpGluX6oX5NLxh@NH27D9T0LF>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5OpGluX6oX5NLxh@NH27D9T0LF>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_034339_136393_7FB20285 
X-CRM114-Status: GOOD (  15.70  )
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

On Fri, Jan 24, 2025 at 03:52:10PM +0100, Emanuele Rocca wrote:
> longterm kernel 6.1.123 crashes early when booting on the Lenovo Thinkpad X13s
> with the following error:
> 
>  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000264
> 
>  pc: arm_smccc_version_init+0x90/0x1ac

Please can you share the full crash log?

> According to faddr2line, that is line 31 of smccc.c:
> 
>  arm_smccc_version_init+0x90/0x1ac:
>  arm_smccc_version_init at debian/build/build_arm64_none_arm64/drivers/firmware/smccc/smccc.c:31
> 
>  22 void __init arm_smccc_version_init(u32 version, enum arm_smccc_conduit conduit)
>  23 {
>  24         struct arm_smccc_res res;
>  25 
>  26         smccc_version = version;
>  27         smccc_conduit = conduit;
>  28 
>  29         smccc_trng_available = smccc_probe_trng();
>  30 
>  31         if ((smccc_version >= ARM_SMCCC_VERSION_1_2) &&
> 
> This is with kernel 6.1.123. The last known good kernel I have available right
> now is 6.1.119. In the 6.1.120 changelog I see the following commit which seems
> potentially related?
> 
>  https://lore.kernel.org/all/20241106160448.2712997-1-mark.rutland@arm.com/
> 
> That's stable commit [1].

I can't see anything wrong with that patch but if you have reason to
suspect that it's broken can you try reverting it to see if the problem
disappears?

Will


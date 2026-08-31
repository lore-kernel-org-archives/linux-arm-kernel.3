Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0129C61DF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 06:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQ1mOUazk5upCwE99RY/bxkx1ogD35Z5ZprZqBWTmPY=; b=UfFAm1ZMxpjV1v0H1xLC7C2T8S
	AJON0nSFNcy4dSb3wVs6M91UIRJi95+kCE3n8L7Fc5d9DaSzfae1UgicFCrcvDxMujhfgeE+/uCwJ
	LZeAVgodcgKt4x8bdArQRUmizWcF05/HxGtXi2qEV1f420oR5KyEtKd5Rm88v2ZWGUgYmQGmp+hYd
	Tar0LvQ8QjrUT7JPxEBfN8CdHY4XRcjRCFQ6zq2bCpWW9hJgLqggNjr9FmvEW6SfkyeYrPBxXARyp
	SwahoHfaSc7Bd8yLMC2ogn/w1bT9FVsi8yLyeRrWUaS+q2yeSjEpnDHd92iIPHFTqpr6NxZYA/ufC
	jbzspqYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0vJc-00000008b3Q-45pH;
	Mon, 31 Aug 2026 06:16:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0vJb-00000008b30-317Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 06:16:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A03E60120;
	Mon, 31 Aug 2026 06:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66FB81F00A3E;
	Mon, 31 Aug 2026 06:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788156978;
	bh=nQ1mOUazk5upCwE99RY/bxkx1ogD35Z5ZprZqBWTmPY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=mknXiB5Wx4PX614tqvlG5yEzEYhGj7zNdApSg1s/xb7+xe1cqik9uWHFoRUttQTN8
	 GLbG4REFR4A6flpaaTQXrjNUZevMoY6CBXixEt5LvXCIRxJrQfYrcjAlVpjZAWaH0I
	 DOCSmM/BGDIdrIlnVhwX5xef51ABfjYrQFODHTckOvzxD7JwPV7kIb8pdQhuww32o4
	 RDwm6xhsn21sGYPg0qO5bEJxfCfpOkpwZKQuq0sf/zSAS/VBd9oT27QLqnkrSlo8pS
	 O3s9R2/qj4UzfBRiK2EvfDhxWm5nUqEOiDh0fmAIxR5cLV7JkPbUBvR6F+wVEEzGFM
	 BXkPNPpKyyYVQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id B8903198006B;
	Mon, 31 Aug 2026 02:16:15 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Mon, 31 Aug 2026 02:16:15 -0400
X-ME-Sender: <xms:LByVamJ7YeNEvsdQ5Y59DrfwXpB_TjwlTyX_bJRfLfv6LDGtGi4wnA>
    <xme:LByVao9oQvsisq7XdcG8CRYfCvOghSz89z2vpa2siduxQ3YtucXsOwquH4aQ9DR0S
    ChPkAZO1ur9rdgMRNQLYdXxiEacoYvH6AJv77CWcjRluGg7c8R13BA>
X-ME-Proxy-Cause: dmFkZTGRWh3uAKJSJ4fzX7rQUTkRM0ok+x/9RVY95O3Kt4edIQPIo1yJqgLo4+wl9GIaUM
    Wf8bZrzB15C1S53cXh2wjZRLf2q/UgVT1n5TsW7zTfa3WG65q87zeGcgvWR0AgpkKuJ4LY
    sJ2CIIYGo/xMIC692J/5sSbaE6Zuwi2J0VQpbRvGreXOZ3QyH3CY2i1gFm6e7QbyDW4bdv
    XpRpoi+TP0awhJOXN0sIHbiLb+aJCUr2C1r9+Awi9h0sSAUAlYyp8zsbKIGINIqe4Cnk8c
    tsshHKB+sXTCCUw9lgMoozWSOKPArHEJ4wbyK7YGlnZlUf9j/531J8moto0g/EMln/JMQE
    S7gQiRYEpv5NiofMsAEWSr9F1A3Xaud8jtXNZUlNPNO58ewVHnaXAQkp2enfpiF6zSJ/sp
    UX/JyD2c6L/lPsj0KTaJvnLbZN3GpZKQYaipS3QwUdez3c3vi44ypBHxlCyy79NwUuDSFF
    td9jmitMJCFRHcrJQ+0GZH/zSMzj+TuMC6cDUNfaewl1USOVroOxyZB2ESZ1aGvoBXHJd9
    0sdZmP7D1JxqyNm2WgNcSs4wQF/NFl7NYTKUQjYaWbzGjkKVmJQ1dxKuH4ogl7jmCUVUz0
    w0FyFcBFGqdfzn6/o4+rB9QoR+z1Dp7h8IS6TjRMgp4kAMWisJx3rZC3suYg
X-ME-Proxy: <xmx:LxyVaor5sfsREBCEH4eOTypzkAHN3YpRbkQkBFQSsmd-gWb0oJimLg>
    <xmx:LxyVarMi_T_Ox9-Wj9JcVHmVN8XYFs6gi9lBkCtm8WR-kSQysvQPzA>
    <xmx:LxyVahrRnlY7Iqvq9CYqmqxxGyXGNtD_U0CwXtRrsqPatamZri7f8w>
    <xmx:LxyVamtl6REANe3zb3EWJipMSBViE5rmUnWQeQwRmTxcmTR2qTKn5A>
    <xmx:LxyVao0oQPZc3hQMux2mHrUHAgkSU1cV7x6tNCqtqQWHLBEUiPIlxG7H>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A90ACF8007B; Mon, 31 Aug 2026 02:16:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 31 Aug 2026 08:15:52 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Karl Mehltretter" <kmehltretter@gmail.com>
Cc: stable@vger.kernel.org, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <7f744f2a-409b-454f-bdb9-fccb5031640d@app.fastmail.com>
In-Reply-To: <2026083125-upbeat-series-9565@gregkh>
References: <20260831054247.33352-1-kmehltretter@gmail.com>
 <2026083125-upbeat-series-9565@gregkh>
Subject: Re: [PATCH 6.6.y] arm64: mm: clear extra idmap level before use
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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



On Mon, 31 Aug 2026, at 07:54, Greg Kroah-Hartman wrote:
> On Mon, Aug 31, 2026 at 07:42:47AM +0200, Karl Mehltretter wrote:
>> The 6.6.y adaptation of commit 0e9df1c905d8 ("arm64: mm: Don't remap
>> pgtables for allocate vs populate") removes the clearing performed by
>> early_pgtable_alloc().  Its replacement clears allocations made by the
>> generic page-table walkers, but 6.6's create_idmap() still allocates an
>> extra root level directly when a sub-48-bit VA kernel is loaded
>> sufficiently high in physical memory.
>> 
>> memblock_phys_alloc_range() does not zero the returned memory.  The direct
>> caller therefore publishes an uncleared root page and passes it to
>> __create_pgd_mapping().  A stale nonzero entry can trip the bad-descriptor
>> BUG_ON or be followed as a page-table descriptor, preventing the kernel
>> from booting.
>> 
>> Clear the direct allocation through its linear alias before publishing it.
>> init_clear_pgtable() also supplies the barrier required before the table
>> descriptor becomes visible.
>> 
>> Mainline is not affected because commit e6128a8e523c ("arm64: mm: Use
>> 48-bit virtual addressing for the permanent ID map") removed the dynamic
>> extra level before page-table initialization moved out of the allocator.
>
> Why can't we take that change instead?
>

Nope. That relies on a massive refactoring of the arm64 startup code.

Can we just revert 0e9df1c905d8 (aka 54322d95309d) instead?



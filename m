Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65CACD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 07:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPopNC27oawMykQuSW/IDqrzZZS47cGIcgQtGkeR160=; b=lIk0aon+yovrEv1TXk8H3rQUXV
	aDZM7JQVnKu5h+0fygwuToNFDdKw8Dn2fwey6b6slSQy5UwaC98aXvj18rYkzQgG1gYj/MzDTrLq1
	2/zxr0b+8/OGZNVsejbur2sCLsppyKsC7lQdwQ/p+I1zBEEWaeoGzXHt3NdGE/dBwMJuWkU2a8AS6
	olF00rdyvCU4h5NfFxBaHWYK8u24b6Mg6G3nccKwuUhD9VOmwtTveNLbSu64lR1Aw4huHM73Jfb+r
	FSu+/VblB9WAcI3CMtTpjf3vWJA7TieuISEkpeByWlobE0hKx3vTIA9NFDWA5cP3HYT+VsGWxFENX
	UrHtDCEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKuu-0000000Ca9z-1HLu;
	Mon, 11 May 2026 07:19:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKus-0000000Ca9j-31pV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 07:19:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DE7CA600C3;
	Mon, 11 May 2026 07:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9B6C2BCB0;
	Mon, 11 May 2026 07:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778483941;
	bh=YlUMgn6eywvdd+m8xsMAbtxx9sf3bufm2FHgr9rZp3I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cZLZ8enaAWGNplfv/sllWtTTdqqOopEt9SagU5SvHYtu+YhhmJ6L5MV38yCV8xdOh
	 tOq3m0MhsVCh1TXf5xoDyo8Hhu4O0edW2pIYvYIGzTKbyIa/v+K8/MkIxT7dfzIifE
	 OuBzUF9fKGxnvADk7ZSTFglT/lV8fBmlte+XYLsJdNXqhCAAi4vBMtpwsCdsmGtIVH
	 wKICPKqVWmJVdI9nke9ZXmKOlHZi+WrSkrv9lTKGKbz71YzKV8hMCwhphqTzJcA9l1
	 OrouE6dPUU60X6Gnitry1EJxX76p9mw7VHTX1tjpZR/+utMy/HOCMNrmE/SkdS25QP
	 P7VvP8B4sjK7g==
From: Thomas Gleixner <tglx@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg
 Roedel <joro@8bytes.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Subject: Re: [PATCH 1/2] [RFC] debugobjects: avoid gcc-16.0.1 section mismatch
In-Reply-To: <d52dcd45-959a-4ff4-9e82-0bae133785f1@app.fastmail.com>
References: <20260203162406.2215716-1-arnd@kernel.org> <874ikf9i34.ffs@tglx>
 <d52dcd45-959a-4ff4-9e82-0bae133785f1@app.fastmail.com>
Date: Mon, 11 May 2026 09:18:57 +0200
Message-ID: <87y0hq8lcu.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, May 11 2026 at 08:17, Arnd Bergmann wrote:
> On Sun, May 10, 2026, at 21:31, Thomas Gleixner wrote:
>> On Tue, Feb 03 2026 at 17:23, Arnd Bergmann wrote:
>>> WARNING: modpost: vmlinux: section mismatch in reference: lookup_object_or_alloc.part.0+0x1ac (section: .text) -> is_static_object (section: .init.text)
>>>
>>> From what I can tell, the transformation is correct, as this
>>> is only called when lookup_object_or_alloc() is called from
>>> debug_objects_selftest(), which is also __init.
>>
>> So clearly the compiler is buggy. It creates an __init specific copy of
>> lookup_object_or_alloc() and then fails to attribute it correctly.
>
> I don't see what else the compiler is supposed to do, it has no idea what
> __init means in the kernel, or what the rules are for calling between
> that and normal functions. Putting a non-inlined lookup_object_or_alloc()
> into a special section without an explicit attribute would clearly
> be a bug.

I agree that the compiler does not know what __init means, but this
sucks as it leaves an unused copy of lookup_object_or_alloc() around
after init.

What happens if you mark is_static_object() with 'noinline'?

Thanks,

        tglx


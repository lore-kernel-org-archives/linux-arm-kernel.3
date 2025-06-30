Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CA4C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 09:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=tLe7TOXoCAoj8LxI3gDkgpaKkUGcA1IXZjIu7n3dQ8E=; b=OGrgnJ1YSfSqH4
	cJnjTpovECJ9bFTFz0GbyWq7eum9eDRhJ2RJE+piNVf8t2SWM9pzqf6fPzpQAkK++waoPw0Caow8D
	cNEevLEPhSPiDdxm5epZKxt1jfeKjWGid49kD6dxJ9tgCiEcUvVhX+IEeecnzJI9Z8R5cO6pViZpH
	K5f7oUYbrqbxHbbBW00J30IiS+wVouhDnhD/1l/gVvNV25SRjyE08zF5O0Fzthnd3Ww7RKC8gmPOR
	m6OCE3r0Z+xXjRRCCXvLclik42fBvOXb1+4S9iDZ0mjKU9V/+ZeOQYb5hCfozvEjAXsqErR3QOsZh
	0sqRBLhYNz1REq9KaeWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAPx-00000001h56-1o97;
	Mon, 30 Jun 2025 09:03:13 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAMP-00000001gdZ-1IDh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 08:59:34 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751273970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=tLe7TOXoCAoj8LxI3gDkgpaKkUGcA1IXZjIu7n3dQ8E=;
	b=U6mqQVC8AqElmiW3izk43DYsf8ppZf3bdcjAliMTAw14YQJ+yHJ3YNEsC0D7qiYJBLnKtT
	Bd9I/HNAdZLG/o9bS0KtBOvaD2JoNx4jhPEXvqYJ74GFjIPS2wyx29QjAzSLgo/YFb6zae
	j9iCO9EexEgbBXlZSoWYzuZID6zZY2ET/iNwue0sc8VEQy6YBbDwmK4I0ft85hKLlDzSPY
	RcbiAn8Gf2KDjqPIotFVlDDQkpg3AMv6VmFE/EMLgQcJnWkdx3K/LgoRWazu6j3+Y7Nsaj
	mDnTF1ku4prHRLRvgpDsO3hCX4rA/xPJLENAyoWK1UWQRch2UXA1FVLVLw94fA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751273970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=tLe7TOXoCAoj8LxI3gDkgpaKkUGcA1IXZjIu7n3dQ8E=;
	b=IFZ8/U9QdKHV90tmMrhoqOyp+wCtvZ3NQqRoPgyEFHesJokQaq5wvLU58qJDL9MKCtTS46
	YkTqYymLUgoPSrCA==
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] irqchip/msi-lib: Honor the MSI_FLAG_PCI_MSI_MASK_PARENT
 flag
In-Reply-To: <86o6vjelw2.wl-maz@kernel.org>
Date: Mon, 30 Jun 2025 10:59:29 +0200
Message-ID: <87ecv1ob9q.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_015933_515492_F61BC4ED 
X-CRM114-Status: GOOD (  33.85  )
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

On Fri, May 23 2025 at 10:06, Marc Zyngier wrote:
> On Sat, 17 May 2025 20:59:10 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>> 
>> On Sat, May 17 2025 at 11:30, Marc Zyngier wrote:
>> > +	/*
>> > +	 * If the parent domain insists on being in charge of masking, obey
>> > +	 * blindly. The default mask/unmask become the shutdown/enable
>> > +	 * callbacks, ensuring that we correctly start/stop the interrupt.
>> > + 	 * We make a point in not using the irq_disable() in order to
>> > +	 * preserve the "lazy disable" behaviour.
>> > +	 */
>> > +	if (info->flags & MSI_FLAG_PCI_MSI_MASK_PARENT) {
>> > +		chip->irq_shutdown	= chip->irq_mask;
>> > +		chip->irq_enable	= chip->irq_unmask;
>> 
>> This is only correct, when the chip does not have dedicated
>> irq_shutdown/enable callbacks.
>
> The chip structure provided by the PCI MSI code doesn't provide such
> callback, meaning that they are unused for the whole hierarchy.

Fair enough, but it still stinks.

>> And I really hate the asymmetry of this.
>
> So do I, but that's how the lazy disable thing currently works. Drop
> the bizarre asymmetry on irq_disable, and we can make this nicely
> symmetric as well.

Well, it's not that bizarre and it has a massive performance win if the
thing does not need to go out to the hardware in some scenarios. Don't
ask about the main use case. Mentioning it is probably considered a
violation of the United Nations Convention Against Torture (UNCAT).

>> > +		chip->irq_mask		= irq_chip_mask_parent;
>> > +		chip->irq_unmask	= irq_chip_unmask_parent;
>> > +	}
>> 
>> I'm still trying to understand, what's the actual problem is you are
>> trying to solve.
>
> I'm trying to remove some overhead from machines that don't need to
> suffer from this nonsense double masking. Specially in VMs when
> masking/unmasking requires *two* extremely costly exits (write +
> synchronising read-back). This change reduces the overhead
> significantly by only masking where it actually matters.
>
>> MSIs are edge type interrupts, so the interrupt handling hotpath usually
>> does not mask at all. The only time masking happens is when it's lazy
>> disabled or during affinity changes, which is not the end of the world.
>
> And that's part of the problem. The lazy disable ends up being way
> more costly than it should when the interrupt fires during the
> "disabled but not quite" phase, and in turn makes the critical section
> delineated by disable_irq()/enable_irq() more expensive.
>
> So while, as you put it, it's "not the end of the world", this seems
> to me like a valuable optimisation.

I understand, but this needs more thoughts. Doing this wholesale for all
potential PCI/MSI parent domains which require MASK_PARTN makes me more
than nervous.

> Another possible improvement would be to teach the PCI code it can
> still rely on masking even when the endpoint is not capable of masking
> individual MSIs.

Well, it relies on that today already if the underlying parent domain is
capable of masking. If not, it hopes that nothing bad happens, which is
the only option we have :(

It get's worse when the device does not support masking _and_ the parent
domain does not provide immutable MSI messages because then the MSI
message write becomes a horrorshow. For illustration see the mess in
arch/x86/kernel/apic/msi.c::msi_set_affinity(), which is a violation of
above mentioned convention as well. Despite the fact that this has been
known for decades, RISC-V went ahead and replicated that trainwreck in
the IMSIC IP block. Oh well....

I sat down and stared at it in the few moments where the heat wave did
not completely shutdown my brain. As usual this ended in a larger
cleanup and overhaul... At the end I went and created a new pair of chip
callbacks and the corresponding logic around it. A preview of the whole
pile is at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/msi

Thanks,

        tglx











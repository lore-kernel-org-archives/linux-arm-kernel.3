Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34F9CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 13:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yg4tHkrWB8iD6I0E177EhXaJTLbrmVH+67p7EVU8ik0=; b=JPCAO6eUaTWxQVTGh5tsimCGju
	Egsjmz1jRKpVkVzZZ7QUsG4gdt6oPvt3vqVNPB0HEAjk1fAgr7+55qsoqWeqcZJhsCX9U5fGif16l
	7wRJSkIPKrZgCuL5BwoVjQNQ+cA87ZDu7MlbI40q+zfLaCYfJOFwYuM+lyoCyYac5DVg2L5TET9oV
	EoIZhtTGM9NUCGd7nwdArb85qBGCKDtkZSUcrMgy9Kwv8YX2vVwObKwGLn9wfw/emiaangG+AG4BH
	eiFFthZrOHDWgZRzfjBspa83NFPw1BZrzSIUkmCmKUZqYOmQezuTUA7uL1N0PmJR5SwnSZDXs8BuH
	CEJK+Yzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNQP-0000000E4Yx-1kO9;
	Mon, 27 Oct 2025 13:38:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNQO-0000000E4Yk-0H3a
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 13:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Yg4tHkrWB8iD6I0E177EhXaJTLbrmVH+67p7EVU8ik0=; b=epQVAUHktf+ZDnJR9b3ByUMp9R
	ifz7fGlSEPnA/mPC8OskOFmF32N38t6bpDFZBZ8KOqZZcQKMmR+YjsHSQsNCxv3HC7dkwyBBg6Uxg
	zcCoN77VdO3c8tyEw+LgFF2PI2Wo2qpCNscAAGspFrtVS4Lnoe5mrdVqH01kc7GOvNWOlpy4/rya8
	RxfwQeNgtYJlZ6Rf2bVQjT4k11eZ4mnpXxWj6FpkfOzAS7ctWYt9n8oKtZZg+3ik4N8Cmujud0LkH
	uHpFj92BsJBkvQd/vaCmSBtygHEjxUMS4CoCbJ5GnNECE/6lDUkbTBLR3ITNw/5x6UyI8WX3VkqdC
	cT90yAjQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMYZ-00000002CWT-2UfG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:42:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 593A4175D;
	Mon, 27 Oct 2025 06:38:02 -0700 (PDT)
Received: from [10.57.68.196] (unknown [10.57.68.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FD233F673;
	Mon, 27 Oct 2025 06:38:02 -0700 (PDT)
Message-ID: <1db69026-199c-4cee-bb3b-1217f8a3afad@arm.com>
Date: Mon, 27 Oct 2025 14:38:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
To: David Woodhouse <dwmw2@infradead.org>,
 David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-12-kevin.brodsky@arm.com>
 <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
 <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
 <6ed9f404-9939-4e9f-b5aa-4253bef46df1@arm.com>
 <7324616a8d2631aa8132f725f9f6551e3e6b21dd.camel@infradead.org>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <7324616a8d2631aa8132f725f9f6551e3e6b21dd.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_124239_998432_9948F750 
X-CRM114-Status: GOOD (  18.74  )
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

On 24/10/2025 17:17, David Woodhouse wrote:
> On Fri, 2025-10-24 at 17:05 +0200, Kevin Brodsky wrote:
>> On 24/10/2025 16:47, David Woodhouse wrote:
>>> On Thu, 2025-10-23 at 22:06 +0200, David Hildenbrand wrote:
>>>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>>>> We currently set a TIF flag when scheduling out a task that is in
>>>>> lazy MMU mode, in order to restore it when the task is scheduled
>>>>> again.
>>>>>
>>>>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>>>>> mode in task_struct::lazy_mmu_state. We can therefore check that
>>>>> state when switching to the new task, instead of using a separate
>>>>> TIF flag.
>>>>>
>>>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>>>> ---
>>>> Looks ok to me, but I hope we get some confirmation from x86 / xen
>>>> folks.
>>> I know tglx has shouted at me in the past for precisely this reminder,
>>> but you know you can test Xen guests under QEMU/KVM now and don't need
>>> to actually run Xen? Has this been boot tested?
>> I considered boot-testing a Xen guest (considering the Xen-specific
>> changes in this series), but having no idea how to go about it I quickly
>> gave up... Happy to follow instructions :)
> https://qemu-project.gitlab.io/qemu/system/i386/xen.html covers booting
> Xen HVM guests, and near the bottom PV guests too (for which you do
> need a copy of Xen to run in QEMU with '--kernel xen', and your
> distro's build should suffice for that).
>
> Let me know if you have any trouble. Here's a sample command line which
> works here...
>
> qemu-system-x86_64 -display none --accel kvm,xen-version=0x40011,kernel-irqchip=split -drive file=/var/lib/libvirt/images/fedora28.qcow2,if=xen -kernel ~/git/linux-2.6/arch/x86/boot/bzImage -append "root=/dev/xvda1 console=ttyS0" -serial mon:stdio

Thanks this is helpful! Unfortunately lazy_mmu is only used in the PV
case, so I'd need to run a PV guest. And the distro I'm using (Arch
Linux) does not have a Xen package :/ It can be built from source from
the AUR but that looks rather involved. Are there some prebuilt binaries
I could grab and just point QEMU to?

- Kevin


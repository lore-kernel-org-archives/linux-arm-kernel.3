Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA141D64080
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 19:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhWTv6Xz+p6/uRt5a0JjkR7Y5OsaggoRDeYnfKiG8p8=; b=OEWpah/XhGG/S4I+Hkc1I4IpnZ
	ugufkvExoNtezo+dVUnw+HqyItm7p5n34UX8O29CtsMrgA/CobgtfL/EBUYKE4tkVIhvuN+xSG1/K
	fTDJeyjVlVtJMCoHvK0SJANvHWjbNAa5urLkCgzmAZdnEYmGkTNMBCm7WlYJBah6oFYjz3clvEUFw
	3vgP3fqenpl7LJL1ExrUF00EcMJqzDvprGKHTqFlPqtJyC9pbUtlXVP0PqYb3pzUFGOylByLBQq+d
	5dr5Uwc2qfMhYSPnMM8k11ZVQ73zc/116TPZr/M47m23RszeiVpeL+nm4PNa3Jv1NC7/SgnJVGtG7
	0xR96a1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Usl-0000000BlRA-0INX;
	Fri, 08 Nov 2024 19:42:59 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Uqz-0000000BlFt-47hF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 19:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1731094868;
	bh=KhWTv6Xz+p6/uRt5a0JjkR7Y5OsaggoRDeYnfKiG8p8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eFof62/o+3Ah7YL4swFSXp9NNbyWhpE/jpxAp1V0hqddWcsJbT70qSYUBEJ9Cc6Nq
	 i1Ht5pUIVwOv7ozD3OuoIfG8ndi7iDXyHZeqyBUFw9vDsX5T9JYdLuGNuomxOnNfZp
	 lPZXw/EGjMFvq/nlF4MyDGcxz4ho4GZfDRp3RCKo=
Received: by gentwo.org (Postfix, from userid 1003)
	id C978D40681; Fri,  8 Nov 2024 11:41:08 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id C7119401C7;
	Fri,  8 Nov 2024 11:41:08 -0800 (PST)
Date: Fri, 8 Nov 2024 11:41:08 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
cc: linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-arch@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, 
    tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
    dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
    pbonzini@redhat.com, vkuznets@redhat.com, rafael@kernel.org, 
    daniel.lezcano@linaro.org, peterz@infradead.org, arnd@arndb.de, 
    lenb@kernel.org, mark.rutland@arm.com, harisokn@amazon.com, 
    mtosatti@redhat.com, sudeep.holla@arm.com, maz@kernel.org, 
    misono.tomohiro@fujitsu.com, maobibo@loongson.cn, zhenglifeng1@huawei.com, 
    joao.m.martins@oracle.com, boris.ostrovsky@oracle.com, 
    konrad.wilk@oracle.com
Subject: Re: [PATCH v9 01/15] asm-generic: add barrier
 smp_cond_load_relaxed_timeout()
In-Reply-To: <87v7wy2mbi.fsf@oracle.com>
Message-ID: <88b3b176-97c7-201e-0f89-c77f1802ffd9@gentwo.org>
References: <20241107190818.522639-1-ankur.a.arora@oracle.com> <20241107190818.522639-2-ankur.a.arora@oracle.com> <9cecd8a5-82e5-69ef-502b-45219a45006b@gentwo.org> <87v7wy2mbi.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_114110_082816_ECE7118E 
X-CRM114-Status: GOOD (  11.53  )
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

On Thu, 7 Nov 2024, Ankur Arora wrote:

> > Calling the clock retrieval function repeatedly should be fine and is
> > typically done in user space as well as in kernel space for functions that
> > need to wait short time periods.
>
> The problem is that you might have multiple CPUs polling in idle
> for prolonged periods of time. And, so you want to minimize
> your power/thermal envelope.

On ARM that maps to YIELD which does not do anything for the power
envelope AFAICT. It switches to the other hyperthread.

> For instance see commit 4dc2375c1a4e "cpuidle: poll_state: Avoid
> invoking local_clock() too often" which originally added a similar
> rate limit to poll_idle() where they saw exactly that issue.

Looping w/o calling local_clock may increase the wait period etc.

For power saving most arches have special instructions like ARMS
WFE/WFET. These are then causing more accurate wait times than the looping
thing?




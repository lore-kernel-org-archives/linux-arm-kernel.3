Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20677E7BDB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 13:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7/dLwVFyqFMwla88r06s/4GRt/gYHBI4R0JxKfAJ7A=; b=eKFKhPryTidoWX4Xlt41QMGIEg
	M/rVMN/mbbBKVsE7zhPiYR735MRLq9GQzkm8JxnJ0lTa5MD/uGPVj5btLFaO8FKBCxQX8nIxonrHD
	AXo4p2XVj1jIx4fh8u+02WqFWyLdIXG8L2Gl18RMedDa4gaz3JcowzEKILtBOqnoiZB8OXexlFBse
	fbdioqUa+AOO0nCSnSva1L8CYb+AtPYLLpnrMtzTj3NwaHV8jqIpiq789zZYSYZEi2A0knsRe1Ld+
	D1qtJnpnSXpWuCuCgwwPgOIrEpq12/9jM+i3kVICC0fV/cwk1ZDimKHgj7xFKClz1Q6liO9OjNvU4
	zwXIgtXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vryIF-00000006bKb-1DkG;
	Mon, 16 Feb 2026 13:05:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vryHv-00000006bA3-3rWZ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Feb 2026 13:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=x7/dLwVFyqFMwla88r06s/4GRt/gYHBI4R0JxKfAJ7A=; b=jPQrAtStpVr7Ojtbpq+cj44XyC
	+jzF7Krdv3GX0MNu42eQWiid7hTjqJzfab5A4F0P+4ZPS+KDKUznHjt2DpAdQaqTlYGYrAvADaDuB
	DtcFyKqfVXHfQIBSS+VON3dbsq+xvY8pcoMB5f/zOtTpnclzf0xWnWlPwnvmmiosAYRJjUnaAREMX
	joCYENJTFatvbpFPLcxXXrZhpUy6M4n7Q8sNEjWxqu49WkmluNeERba5GubaMepqxPA1OAPT01XEU
	J1j7PRTgf2AwfnnrJeDyh2BMlQFP2++EDkGehJmCiDrA7MJvcbwsLmZpvmL4zpSvvppS/i78iGstU
	ufkcdBdw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vryHs-0000000EXQY-3G1x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 13:05:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 955F3415F2;
	Mon, 16 Feb 2026 13:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713A7C116C6;
	Mon, 16 Feb 2026 13:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771247111;
	bh=q82IcuKBKVPmAGGlfrXASO3H7rLUeonQFbZAWVqZ0iQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sdPEs1gKpuGSTUahCadmc+TQvDK7e/l8YBbdw/Rz0Il6UfMmmHrygvsAE0Ou9v1iO
	 Kd2xCetmtM4eibPJ0o9UA3K/KuLaOp+v2GELkCNzk1hY+/25VsoPJwkPeb/x97Zu7F
	 DujtNXCUhY94PVIL8iqcKI2WH8oOa3/XUDckpXhlnhwk+v2uLjjZsIuSw5CZI4LVCS
	 xV4Czn2QSisQZOfYqCQt+FStpgZNJZiIdL92JNcOw8Gp0o2t1U65TqnCrH9R4qMZp+
	 /BGQOrRWIaaJCsTR8Ceh9OQEepaSx8hogK4MLn4ePkQN2RfAa+2GTi4SdffbxBdOek
	 EpvMuNIcHjmzA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vryHl-0000000BOK2-06in;
	Mon, 16 Feb 2026 13:05:09 +0000
Date: Mon, 16 Feb 2026 13:05:08 +0000
Message-ID: <86cy24bzzv.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: "yezhenyu (A)" <yezhenyu2@huawei.com>
Cc: "rananta@google.com" <rananta@google.com>,
	"will@kernel.org"
	<will@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"dmatlack@google.com"
	<dmatlack@google.com>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
	"kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	zhengchuan <zhengchuan@huawei.com>,
	Xiexiangyou <xiexiangyou@huawei.com>,
	"guoqixin (A)" <guoqixin2@huawei.com>,
	"Mawen (Wayne)" <wayne.ma@huawei.com>
Subject: Re: [RFC][PATCH] arm64: tlb: call kvm_call_hyp once during kvm_tlb_flush_vmid_range
In-Reply-To: <2b29bbc8-c588-4ce0-b249-5cc544338ec1@huawei.com>
References: <42bcdd9100bf4c63b79d2b72bd6db951@huawei.com>
	<86wm0massi.wl-maz@kernel.org>
	<2b29bbc8-c588-4ce0-b249-5cc544338ec1@huawei.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: yezhenyu2@huawei.com, rananta@google.com, will@kernel.org, oliver.upton@linux.dev, catalin.marinas@arm.com, dmatlack@google.com, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, zhengchuan@huawei.com, xiexiangyou@huawei.com, guoqixin2@huawei.com, wayne.ma@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_130517_209345_1417B83F 
X-CRM114-Status: GOOD (  35.06  )
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

On Thu, 12 Feb 2026 12:02:33 +0000,
"yezhenyu (A)" <yezhenyu2@huawei.com> wrote:
> 
> Thanks for your review.
> 
> On 2026/2/9 22:35, Marc Zyngier wrote:
> > On Mon, 09 Feb 2026 13:14:07 +0000,
> > "yezhenyu (A)" <yezhenyu2@huawei.com> wrote:
> >> 
> >>  From 9982be89f55bd99b3683337223284f0011ed248e Mon Sep 17 00:00:00 2001
> >> From: eillon <yezhenyu2@huawei.com>
> >> Date: Mon, 9 Feb 2026 19:48:46 +0800
> >> Subject: [RFC][PATCH v1] arm64: tlb: call kvm_call_hyp once during
> >>   kvm_tlb_flush_vmid_range
> >> 
> >> The kvm_tlb_flush_vmid_range() function is performance-critical
> >> during live migration, but there is a while loop when the system
> >> support flush tlb by range when the size is larger than MAX_TLBI_RANGE_PAGES.
> >> 
> >> This results in frequent entry to kvm_call_hyp() and then a large
> > 
> > What is the cost of kvm_call_hyp()?
> > 
> 
> Most cost of kvm_tlb_flush_vmid_range() is __tlb_switch_to_host(), which
> is called in every __kvm_tlb_flush_vmid/__kvm_tlb_flush_vmid_range.

That was not my question: you indicate that frequent calls to
kvm_call_hyp() are making things costly. I find this assertion
surprising, given that on a VHE system, this is exactly *nothing*.

> 
> >> amount of time is spent in kvm_clear_dirty_log_protect() during
> >> migration(more than 50%).
> > 
> > 50% of what time? The guest's run-time? The time spent doing TLBIs
> > compared to the time spent in kvm_clear_dirty_log_protect()?
> > 
> 
> kvm_clear_dirty_log_protect() cost more than 50% time during
> ram_find_and_save_block(), but not every time.
> I captured the flame graph during the live migration, and the
> distribution of several key functions is as follows(sorry I
> cannot transfer the SVG files outside my company):
> 
>     ram_find_and_save_block(): 84.01%
>         memory_region_clear_dirty_bitmap(): 33.40%
>             kvm_clear_dirty_log_protect(): 26.74%
>                 kvm_arch_flush_remote_tlbs_range(): 9.67%
>                     __tlb_switch_to_host(): 9.51%
>                 kvm_arch_mmu_enable_log_dirty_pt_masked(): 9.38%
>         ram_save_target_page_legacy(): 43.41%
> 
> The memory_region_clear_dirty_bitmap() cost about 40% of
> ram_find_and_save_block(), and the kvm_arch_flush_remote_tlbs_range()
> cost about 29% of memory_region_clear_dirty_bitmap().
> 
> And after the patch apply, the distribution of several key functions is
> as follows:
> 
>     ram_find_and_save_block(): 53.84%
>         memory_region_clear_dirty_bitmap(): 2.28%
>             kvm_clear_dirty_log_protect(): 1.75%
>                 kvm_arch_flush_remote_tlbs_range(): 0.03%
>                     __tlb_switch_to_host(): 0.03%
>                 kvm_arch_mmu_enable_log_dirty_pt_masked(): 0.96%
>         ram_save_target_page_legacy(): 38.97%
>
>
> The memory_region_clear_dirty_bitmap() cost about 4% of
> ram_find_and_save_block(), and the kvm_arch_flush_remote_tlbs_range()
> cost about 1% of memory_region_clear_dirty_bitmap().

What is ram_find_and_save_block()? userspace code?

> 
> >> So, when the address range is large than
> >> MAX_TLBI_RANGE_PAGES, directly call __kvm_tlb_flush_vmid to
> >> optimize performance.
> > 
> > Multiple things here:
> > 
> > - there is no SoB, which means that patch cannot be considered for
> >    merging
> > 
> If there are no other issues with this patch, I can resend it with the
> SoB (Signed-off-by) tag.
> 
> 
> > - there is no data showing how this change improves the situation for
> >    a large enough set of workloads
> > 
> > - there is no description of a test that could be run on multiple
> >    implementations to check whether this change has a positive or
> >    negative impact
> 
> This patch affected the migration bandwidth during the live migration.
> With the same physical bandwidth, the optimization effect of this patch
> can be observed by monitoring the real live migration bandwidth.
> 
> I have test this in an RDMA-like environment, the physical bandwidth is
> about 100GBps; without this patch, the migration bandwidth is below 10
> GBps, and after this patch apply, the migration bandwidth can reach 50
> GBps.

Again: how can other people reproduce your findings? Please provide a
test, and its exact configuration. If this truly results in a 5x
improvement, it shouldn't be hard to reproduce.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.


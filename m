Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FEFC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ym2vB8taCXVhXuUVrfzAT1jmbvDb6jkdVJy/SrgbKTc=; b=1m47427UprTsmx4GHcHmah7p2y
	JKUbRf+OYlGgwcnBXla6/4rk4UAUcUx/Tp7qSQLKG+Ci217KRqqDWi9NRGhu4u5KK0RGcr70iZxC5
	W/3y4Nr+9PDW5oGX/4+YHq2Mi0xaPdN1Yic91KpashH1wqBtz+fD55Tx53Q2x4GU+vVHBY6D/0Xre
	dXsBegaURma9h0T2FSWdZLQPxvIpeQM+XcGl0WmEVuJ4/c3iUPrsZbrz4beQ98rVdcfSBnl0pjcKM
	zvgfJGhBVY7fYM+InXNJYQJxX6drwRFeTW8Xxjd8Aup9h6GeT0zJ961nhagP+94eEANMty5rJUIge
	1ks1FGuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4bj-00000000guK-3rv1;
	Mon, 03 Mar 2025 12:09:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3mk-00000000VSq-1eRy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:16:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FC8E113E;
	Mon,  3 Mar 2025 03:16:45 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CDCF3F673;
	Mon,  3 Mar 2025 03:16:26 -0800 (PST)
Date: Mon, 3 Mar 2025 11:16:24 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: Yicong Yang <yangyicong@huawei.com>, <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <will@kernel.org>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<dietmar.eggemann@arm.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<morten.rasmussen@arm.com>, <msuchanek@suse.de>,
	<gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <yangyicong@hisilicon.com>,
	<xuwei5@huawei.com>, <guohanjun@huawei.com>,
	<sshegde@linux.ibm.com>
Subject: Re: [PATCH v11 3/4] arm64: topology: Support SMT control on ACPI
 based system
Message-ID: <Z8WPiOweOjFZqTwN@bogus>
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-4-yangyicong@huawei.com>
 <Z8HAkZiHYRjj97M7@bogus>
 <336e9c4e-cd9c-4449-ba7b-60ee8774115d@arm.com>
 <20250228190641.q23vd53aaw42tcdi@bogus>
 <a52972c7-aadd-4a77-a292-057fa5f8372d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a52972c7-aadd-4a77-a292-057fa5f8372d@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_031634_473326_FB739891 
X-CRM114-Status: GOOD (  22.92  )
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

On Mon, Mar 03, 2025 at 10:56:12AM +0100, Pierre Gondois wrote:
> On 2/28/25 20:06, Sudeep Holla wrote:
> > > >
> > > > Ditto as previous patch, can get rid if it is default 1.
> > > >
> > >
> > > On non-SMT platforms, not calling cpu_smt_set_num_threads() leaves
> > > cpu_smt_num_threads uninitialized to UINT_MAX:
> > >
> > > smt/active:0
> > > smt/control:-1
> > >
> > > If cpu_smt_set_num_threads() is called:
> > > active:0
> > > control:notsupported
> > >
> > > So it might be slightly better to still initialize max_smt_thread_num.
> > >
> >
> > Sure, what I meant is to have max_smt_thread_num set to 1 by default is
> > that is what needed anyways and the above code does that now.
> >
> > Why not start with initialised to 1 instead ?
> > Of course some current logic needs to change around testing it for zero.
> >
>
> I think there would still be a way to check against the default value.
> If we have:
> unsigned int max_smt_thread_num = 1;
>
> then on a platform with 2 threads, the detection condition would trigger:
> xa_for_each(&hetero_cpu, hetero_id, entry) {
>     if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)     <---- (entry->thread_num=2) and (max_smt_thread_num=1)
>         pr_warn_once("Heterogeneous SMT topology is partly
>                       supported by SMT control\n");
>
> so we would need an additional variable:
> bool is_initialized = false;

Sure, we could do that or skip the check if max_smt_thread_num == 1 ?

I mean
	if (entry->thread_num != max_smt_thread_num && max_smt_thread_num != 1)

I assume entry->thread_num must be set to 1 on single threaded cores
Won't that work ? Am I missing something still ?

--
Regards,
Sudeep


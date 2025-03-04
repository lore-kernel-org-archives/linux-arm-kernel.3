Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D818C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTH1Bq/PxKSr1gUXalyKFsKG5IYts2vm06lCPnwHDEY=; b=ny5WhbduLoi3WOvs8i/04/5Knt
	YH3oHj0fOlWFXQDMXMWZZN1+wzBN5/dDTIuyd/MeTYyVM5VfEfvU34/kAmfUiB4K356a3WgP4bnnT
	mMWpBUdZJnG9eNzCkNGt1mGcf+tYZ8w8i1tjB8r2VBV2vxujskkZApaIeHwzHOdVSqzCzcM0ONBpC
	Kr2mTMk3TwfxxQPJvpRl8On6opVeIKiXmWLgqyhyqQaqo+4lmKnI7jS6SEKCFNDCCqghHu4sKoCiO
	+ltQ6dDDOCfsbzDX9FvZXpZbMATzJ+5jj95bozPKTAyFEubznLY/2B8mn+W4hCCnQiUcoj92M3Ndx
	8gfzAjnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPcY-00000004Asj-1hxG;
	Tue, 04 Mar 2025 10:35:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpP6k-000000043RJ-050j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:02:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25F28FEC;
	Tue,  4 Mar 2025 02:02:51 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C0923F5A1;
	Tue,  4 Mar 2025 02:02:33 -0800 (PST)
Date: Tue, 4 Mar 2025 10:02:30 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: Yicong Yang <yangyicong@huawei.com>, <yangyicong@hisilicon.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <tglx@linutronix.de>, <peterz@infradead.org>,
	<mpe@ellerman.id.au>, <linux-arm-kernel@lists.infradead.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<dietmar.eggemann@arm.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<morten.rasmussen@arm.com>, <msuchanek@suse.de>,
	<gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>,
	<sshegde@linux.ibm.com>
Subject: Re: [PATCH v11 3/4] arm64: topology: Support SMT control on ACPI
 based system
Message-ID: <Z8bPtsO7dEV0lq2M@bogus>
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-4-yangyicong@huawei.com>
 <Z8HAkZiHYRjj97M7@bogus>
 <336e9c4e-cd9c-4449-ba7b-60ee8774115d@arm.com>
 <20250228190641.q23vd53aaw42tcdi@bogus>
 <a52972c7-aadd-4a77-a292-057fa5f8372d@arm.com>
 <Z8WPiOweOjFZqTwN@bogus>
 <32e572d6-dedd-d8a3-13be-6de02303a64d@huawei.com>
 <2fdea4f6-db98-4dc7-947f-e19ee54d2c3c@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fdea4f6-db98-4dc7-947f-e19ee54d2c3c@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_020238_149845_2CF44D28 
X-CRM114-Status: GOOD (  30.48  )
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

On Tue, Mar 04, 2025 at 09:25:02AM +0100, Pierre Gondois wrote:
>
>
> On 3/3/25 15:40, Yicong Yang wrote:
> > On 2025/3/3 19:16, Sudeep Holla wrote:
> > > On Mon, Mar 03, 2025 at 10:56:12AM +0100, Pierre Gondois wrote:
> > > > On 2/28/25 20:06, Sudeep Holla wrote:
> > > > > > >
> > > > > > > Ditto as previous patch, can get rid if it is default 1.
> > > > > > >
> > > > > >
> > > > > > On non-SMT platforms, not calling cpu_smt_set_num_threads() leaves
> > > > > > cpu_smt_num_threads uninitialized to UINT_MAX:
> > > > > >
> > > > > > smt/active:0
> > > > > > smt/control:-1
> > > > > >
> > > > > > If cpu_smt_set_num_threads() is called:
> > > > > > active:0
> > > > > > control:notsupported
> > > > > >
> > > > > > So it might be slightly better to still initialize max_smt_thread_num.
> > > > > >
> > > > >
> > > > > Sure, what I meant is to have max_smt_thread_num set to 1 by default is
> > > > > that is what needed anyways and the above code does that now.
> > > > >
> > > > > Why not start with initialised to 1 instead ?
> > > > > Of course some current logic needs to change around testing it for zero.
> > > > >
> > > >
> > > > I think there would still be a way to check against the default value.
> > > > If we have:
> > > > unsigned int max_smt_thread_num = 1;
> > > >
> > > > then on a platform with 2 threads, the detection condition would trigger:
> > > > xa_for_each(&hetero_cpu, hetero_id, entry) {
> > > >      if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)     <---- (entry->thread_num=2) and (max_smt_thread_num=1)
> > > >          pr_warn_once("Heterogeneous SMT topology is partly
> > > >                        supported by SMT control\n");
> > > >
> > > > so we would need an additional variable:
> > > > bool is_initialized = false;
> > >
> > > Sure, we could do that or skip the check if max_smt_thread_num == 1 ?
> > >
> > > I mean
> > > 	if (entry->thread_num != max_smt_thread_num && max_smt_thread_num != 1)
> > >
>
> I think it will be problematic if we parse:
> - first a CPU with 1 thread
> - then a CPU with 2 threads
>
> in that case we should detect the 'Heterogeneous SMT topology',
> but we cannot because we don't know whether max_smt_thread_num=1
> because 1 is the default value or we found a CPU with one thread.

Right, but as per Dietmar's and my previous response, it may be a valid
case. See latest response from Dietmar which is explicitly requesting
support for this. It may need some special handling if we decide to support
that.

--
Regards,
Sudeep


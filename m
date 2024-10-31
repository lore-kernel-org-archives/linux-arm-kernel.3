Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E3CD7495C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 13:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26Hc5JbZE9H+bruksdDbu2UeUsWpWpzQwfy9DOEAULY=; b=DEpIg4nrZTGoJlB4ei674uVaP+
	wDXmZ9TZ+oEN38Rd6yRQdiufZhlrv35n0DbK60cX3Alvmz0TPLQ/Q+i6AcQp5A9qnVB/lae1p0KC9
	PJjDbHfnGNmcNZYS2V52JIMbG8KnnBZ9FGwbtKndgZedKF0PN+v4KiAJ/APwmLfIpFF/AbSZfi0JD
	udvNPnsrDLIW14WosMOsbV7bDf6f4VYOGUJwXs3i4HqVCY/jZeoBLUP6JTT8vT8rhfo2uwghMxlMR
	Gio/fEZ72V+mF4ykkJtl0s+zihLtCl10N50yQkUujRGmMI1py8VbWUgn5W37Lg+WXJL0ay9ilOs5F
	cUjDP+2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6VLO-00000003hA4-1ccN;
	Thu, 31 Oct 2024 13:36:10 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6VIj-00000003gkV-1wek
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 13:33:29 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730381603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=26Hc5JbZE9H+bruksdDbu2UeUsWpWpzQwfy9DOEAULY=;
	b=gagkVmBl6WnQSFOD69Xb95l+H7UmNHpjjkTYe6X/DWIDEh0GjAMD8+vmk0wUpfeDt8O2X1
	CNA9S2Iv7ftRB/v4mTD6XiFPHvKIRx1ts35Dvt+P9eY67JNkhcFQZ5DXQvtYEg9IvGCpI7
	a/0C2D0B6aFNWSo+gX/VichuLWITHmmbZrqy8LCFk+8dSe7HdrcpAXm07hPpl02NyGVtSB
	yu4cSWIV57zaOxhosEs23HTdt2nPHkGUGxMsIiL4erY0LsD2WVrA5dzHE+DoQWnYDMM9xf
	jq+1iL8avH7blQ39B7u5lOKChCBlbLUiNGUdImnUWh45ZCEF9bHLP9Go+o2+Rg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730381603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=26Hc5JbZE9H+bruksdDbu2UeUsWpWpzQwfy9DOEAULY=;
	b=gv9/SICB709Be4Ze+KmpFVPyPGNclfHrUo9edWFPCMcONde8dWy5Dl1l4sJaeLKcfstvyH
	5+/U5qFxfh6KU+Cg==
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, sudeep.holla@arm.com, peterz@infradead.org,
 mpe@ellerman.id.au, linux-arm-kernel@lists.infradead.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 pierre.gondois@arm.com, dietmar.eggemann@arm.com
Cc: yangyicong@hisilicon.com, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org,
 jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
 linuxarm@huawei.com, xuwei5@huawei.com, guohanjun@huawei.com
Subject: Re: [PATCH v7 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
In-Reply-To: <488d8289-b538-01cb-5de7-d691f49c0d7b@huawei.com>
References: <20241030125415.18994-1-yangyicong@huawei.com>
 <20241030125415.18994-2-yangyicong@huawei.com> <87ttcty71m.ffs@tglx>
 <488d8289-b538-01cb-5de7-d691f49c0d7b@huawei.com>
Date: Thu, 31 Oct 2024 14:33:23 +0100
Message-ID: <87frocwg64.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_063325_662746_6EFF4910 
X-CRM114-Status: GOOD (  14.35  )
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

On Thu, Oct 31 2024 at 20:17, Yicong Yang wrote:
> On 2024/10/30 22:55, Thomas Gleixner wrote:
>>> +static inline bool topology_is_primary_thread(unsigned int cpu)
>>> +{
>>> +	/*
>>> +	 * On SMT hotplug the primary thread of the SMT won't be disabled.
>>> +	 * Architectures do have a special primary thread (e.g. x86) need
>>> +	 * to override this function. Otherwise just make the first thread
>>> +	 * in the SMT as the primary thread.
>>> +	 */
>>> +	return cpu == cpumask_first(topology_sibling_cpumask(cpu));
>> 
>> How is that supposed to work? Assume both siblings are offline, then the
>> sibling mask is empty and you can't boot the CPU anymore.
>> 
>
> For architectures' using arch_topology, topology_sibling_cpumask() will at least
> contain the tested CPU itself. This is initialized in
> drivers/base/arch_topology.c:reset_cpu_topology(). So it won't be
> empty here.

Fair enough. Can you please expand the comment and say:

     The sibling cpumask of a offline CPU contains always the CPU
     itself.

> Besides we don't need to check topology_is_primary_thread() at boot time:
> -> cpu_up(cpu)
>      cpu_bootable()
>        if (cpu_smt_control == CPU_SMT_ENABLED &&
>            cpu_smt_thread_allowed(cpu)) // will always return true if !CONFIG_SMT_NUM_THREADS_DYNAMIC
>          return true; // we'll always return here and @cpu is always bootable

cpu_smt_control is not guaranteed to have CPU_SMT_ENABLED state, so this
argument is bogus.

> Also tested fine in practice.

I've heard that song before.

What matters is not what you tested. What matters is whether the code is
correct _and_ understandable.

Thanks,

        tglx


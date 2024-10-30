Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390CFD5CCB3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 14:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMLlcuyrBExBFQ7cARmq4EKvLPPMbZK83A9cofBFpAU=; b=C+dyJV1u0NGK36OXBrs4T+jSh8
	eNT9uxybwZeJ4va0tf+U20AbDyuombg6CLyNd0O2BzLt49MU5624clP28LpJARZagvZTQAizPG04+
	TwsKYh6cVaw8XZ2r7YCNXSWNknNaGZPqoSav2SJkkyg3znsnMxPgxD4HStrNoDAgIjRaXt2waNyFq
	WV8ZtkqRAE/zh+LczGQBjKDD2Atep4wIBHAeQLkRuo7+BAhByJnfWyAisTEpC/CvkZ7F+JvFTH0Td
	o0It6iDCSCuU1RvaC+ulEIHMW+Df1CAGNKfsxQlcrUxVS/2ddxhrLqnU4/hUtPuOZkDMwUwgtofaA
	8hbOFWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6A8B-00000000k4y-26if;
	Wed, 30 Oct 2024 14:57:07 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6A6S-00000000jet-256b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 14:55:23 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730300117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CMLlcuyrBExBFQ7cARmq4EKvLPPMbZK83A9cofBFpAU=;
	b=rNKB143K8Ctczk3QICRDrjfntQZPdO2TZ1f0bQAU/xyc6baIqN5IkK9Z1iloHVIxUm4eL1
	DTVv8Fa2zQg7+4CZn8EqI2YxizzNT94IXwGJldgfESCpFi6tePC7ZXoOvt4WTbdXbhNgsq
	1sT6qx//LyoEXjk+Aun+OKMoPlBU4KnBmGMKRt4xsjZgQAyu/XFDtMSRHOd40hHQX9Fo2n
	4/W7322h5dgZu3XjP0zpmdf4ZW0uFTLVzALlgwMozRxJJo5igweVCQUhEX2JHXJ6Rz8QLP
	2fsyjfqPZS9d4ZOG8O6oLnV0CtqmcDSqZcWxXIHUaPt9YqxHPn4NTUd8w/mAQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730300117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CMLlcuyrBExBFQ7cARmq4EKvLPPMbZK83A9cofBFpAU=;
	b=sXqooMKj4WSJGhKapgzAlZ6y8k02GuQUsISSgkOq1Val6CrIZxncFkQriu8lZfjdEsOgzR
	Xb0yWorE+ouD/cDA==
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, sudeep.holla@arm.com, peterz@infradead.org,
 mpe@ellerman.id.au, linux-arm-kernel@lists.infradead.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 pierre.gondois@arm.com, dietmar.eggemann@arm.com
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org,
 jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
 linuxarm@huawei.com, yangyicong@hisilicon.com, xuwei5@huawei.com,
 guohanjun@huawei.com
Subject: Re: [PATCH v7 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
In-Reply-To: <20241030125415.18994-2-yangyicong@huawei.com>
References: <20241030125415.18994-1-yangyicong@huawei.com>
 <20241030125415.18994-2-yangyicong@huawei.com>
Date: Wed, 30 Oct 2024 15:55:17 +0100
Message-ID: <87ttcty71m.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_075520_700748_F303DEB7 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

On Wed, Oct 30 2024 at 20:54, Yicong Yang wrote:
>  
> +#ifndef topology_is_primary_thread
> +#define topology_is_primary_thread topology_is_primary_thread

Please do not glue defines and functions together w/o a newline in between.

> +static inline bool topology_is_primary_thread(unsigned int cpu)
> +{
> +	/*
> +	 * On SMT hotplug the primary thread of the SMT won't be disabled.
> +	 * Architectures do have a special primary thread (e.g. x86) need
> +	 * to override this function. Otherwise just make the first thread
> +	 * in the SMT as the primary thread.
> +	 */
> +	return cpu == cpumask_first(topology_sibling_cpumask(cpu));

How is that supposed to work? Assume both siblings are offline, then the
sibling mask is empty and you can't boot the CPU anymore.

Thanks,

        tglx


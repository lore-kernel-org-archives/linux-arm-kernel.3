Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438F6D5CC99
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 09:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRtXYp9uSZhyFJ6aIO9ndrZ8PxfKsSbAu5n2VyXKSrA=; b=NtvVchLjNdJ8MwAdDjlEflydXa
	7979ZHwxtFFcZEWbg6XfuwZCVFhe/DtSE0hSyoDHD5jOtMierhmlFAOYT2FmQAHJ9MP75HriVZD/1
	ojjtZcDsABHI8sZpkZlamfbWvaMEjCEO3/htnaCUu4KbuCPzunJsnI34v0BMKKWH2jN3LV4R7Kof4
	ctq0D28M1l4HUMhwSRUFzG5k88mMriWXDQqOkbANmvP46w5QGBt7v2PDfPJk9jA0zVPFFcjDyiUiK
	b51xt4wgaQDv/+3I4L/NT3FFKR5u7U1tdtdXaPmQkshChmZ/8QHjN8rNEmBx6bpaEsqyvvA6YXmVa
	HUIbXcNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6o4F-00000006QJK-0mZK;
	Fri, 01 Nov 2024 09:35:43 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6o0M-00000006PaE-1Aeb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 09:31:54 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730453498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bRtXYp9uSZhyFJ6aIO9ndrZ8PxfKsSbAu5n2VyXKSrA=;
	b=sTh0cz9jeEjl/nHRPDp3Zy7VsXBFyCthyomq9SR6Dzx2W6EgBML4YQlaeqZgLmPQiIIbsn
	JNroU4CRQVUCEitpVuFWa4MtnOyy5s+26iOJtCMfn3yawgWCIOFVJ6h0A/3Kfr4wo68LAb
	AghTIjIV/r/0WQfwMhtFHNSgjJ7iJvMlal8B80tQ4qMnRgn8DuEM/aIZORmwyxAwKh9LFM
	N8tsHk3R7eSWg8OsWMT+BACj99/tBemsSdWJdvKs/CGpidaFkUY6LZhFDTGnjjo2tFkraa
	TRsYu/K2GjVXy/7LinOfr5bH3qzv67Npjix2UyEo5buI+z5GotGdR5MkZsGwPA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730453498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bRtXYp9uSZhyFJ6aIO9ndrZ8PxfKsSbAu5n2VyXKSrA=;
	b=8PKH97nEM3rOHURhaR6S+L7+WYJKlqoAcKnJbk65kf3FjXuNkqnFRRWnpIDWO60iGL1eT3
	mmO7IsCy+ZyufBBQ==
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
In-Reply-To: <5617934d-45ac-509a-510e-d96d52a2ebf9@huawei.com>
References: <20241030125415.18994-1-yangyicong@huawei.com>
 <20241030125415.18994-2-yangyicong@huawei.com> <87ttcty71m.ffs@tglx>
 <488d8289-b538-01cb-5de7-d691f49c0d7b@huawei.com> <87frocwg64.ffs@tglx>
 <5617934d-45ac-509a-510e-d96d52a2ebf9@huawei.com>
Date: Fri, 01 Nov 2024 10:31:37 +0100
Message-ID: <87h68ruwp2.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_023142_493289_63FD5436 
X-CRM114-Status: UNSURE (   8.02  )
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

On Fri, Nov 01 2024 at 11:18, Yicong Yang wrote:
> On 2024/10/31 21:33, Thomas Gleixner wrote:
>> cpu_smt_control is not guaranteed to have CPU_SMT_ENABLED state, so this
>> argument is bogus.
>> 
> sorry for didn't explain all the cases here.
>
> For cpu_sm_control == {CPU_SMT_ENABLED, CPU_SMT_NOT_SUPPORTED, CPU_SMT_NOT_IMPLEMENTED},
> all the cpu's bootable and we won't check topology_is_primary_thread().

You don't have to copy the code to me. I'm familiar with it.

All I need is a proper explanation why your topology_is_primary_thread()
implementation is correct under all circumstances.

Thanks,

        tglx


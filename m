Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59819CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 14:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2Pww/gGQGWQfeDScaRC/ktdjiEbzeAZRvLxrOAHIR0=; b=LAIR4ioEJTLIuw6Z/l6LgIix09
	nqc1kcD07x7fzURMQCrvxKfVJSWt+H9sBnWFxCzNyjQADi/ZQfEjwh0xkOAQ3NRcZYZsBm+wSKtM9
	jvjZrmYIBVt7DH2TVLK/ddPF1GA9MQ6jOEoP1xjSWp5h4ng0BPct/5lUCTVrcP1EGdhKltYEwQ9YK
	FMWraeIiAl8JySokreHoC0tS/LX2elET0ukhLqOTb1EuVk31de65NMKq55YoVPU/uVcayxIEFaJld
	l7DrTCPBlfXA8UH1jd1bc7l3yOy++Zun0WacXoXrHKfAc0QAWueIajpj+oi8QcMcu/CMhqXsPwJZB
	4+ZEW5oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9l1r-000000080cV-2zJA;
	Fri, 17 Oct 2025 14:02:00 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9l1p-000000080a3-1aqh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 14:01:58 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760709714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T2Pww/gGQGWQfeDScaRC/ktdjiEbzeAZRvLxrOAHIR0=;
	b=qbcVHJiua0r9iuEli8MmHVmkt+ko+4RQMBgcCB+j+/hu8DkfWsK7hZnRLMgfIp8MoPmgHE
	5POi8jezXKn2v1riWc0Hp3yr+kbGQ/OzkdQNs9DZXaSSYY1fQ94QGi6vgwQLRnGXviAL+z
	iQVj0kwIIbt+7UhFDX2khqBiAK79LCd3T6sy9jiG8q9zE2NRXFzCEUpRKb2qVv0Rv4bRxm
	fOnVLHF65fYgTCDlRo7/v6yfpUYWExaIgkBarDO57ZG+Ef94gh6lV6ITOvIW92Nx9RBwKT
	DibS6Xfz5a4c2iiVufjsiZzFv692PRx2J7MLPAOcsthjt89jWXNuasZunMLlvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760709714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T2Pww/gGQGWQfeDScaRC/ktdjiEbzeAZRvLxrOAHIR0=;
	b=BJX24J5xLMU3A3635JuUMzPUqbCVxBAtaeJMhE2HY+7QCGjy6skYASrZIflpJVMVX90XGi
	sbjLEs/wuxNaMtCQ==
To: Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Maulik Shah <quic_mkshah@quicinc.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ulf
 Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 2/3] arm64: smp: Implement cpus_has_pending_ipi()
In-Reply-To: <20251003150251.520624-3-ulf.hansson@linaro.org>
References: <20251003150251.520624-1-ulf.hansson@linaro.org>
 <20251003150251.520624-3-ulf.hansson@linaro.org>
Date: Fri, 17 Oct 2025 16:01:53 +0200
Message-ID: <87ms5pzkxa.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_070157_567937_8A5F881E 
X-CRM114-Status: UNSURE (   8.39  )
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

On Fri, Oct 03 2025 at 17:02, Ulf Hansson wrote:
> Note, the implementation is intentionally lightweight and doesn't use
> any

By some definition of lightweight.

>  static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
>  {
> +	unsigned int cpu;
> +
> +	for_each_cpu(cpu, target)
> +		per_cpu(pending_ipi, cpu) = true;

Iterating over a full cpumask on a big system is not necessarily
considered lightweight. And that comes on top of the loop in
smp_call_function_many_cond() plus the potential loop in
arm64_send_ipi()...

None of this is actually needed. If you want a lightweight racy check
whether there is an IPI en route to a set of CPUs then you can simply do
that in kernel/smp.c:

bool smp_pending_ipis_crystalball(mask)
{
	for_each_cpu(cpu, mask) {
                if (!llist_empty(per_cpu_ptr(&call_single_queue, cpu)))
                	return true;
        }
        return false;
}

No?

Thanks,

        tglx


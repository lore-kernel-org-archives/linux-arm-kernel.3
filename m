Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCF1C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 02:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vt0BRkV4HbKu6MTzBCKXcr3c2dk0SxLej6WBuqUWFI4=; b=Si5iRoFkeeZTOD
	lI7M981orv0bNpcpRG3axcL7MVbzg+PL7j1EgU5usALg6cS/MQ59TmgMuHiPMBf6V27QyicmOTWka
	jmUfG0fp99k235j/8dN70Hrd2ClnyVgzc9+oba1WmPVLjqsZQPlOK0pqSTI8nvgza4+0au/DUM4VB
	I+WlBS27//x5oJoD3JQkpoVRoU9XqYIcpMUKsjUywxTUrUraSfrb2Vi4WGQzQa5owS8gaAzbTB8CL
	b1K3S+W6JPZmpfzTm8Wa2RVuOyvGta4QBwK1EjB0BFYrztsjVOFYnEU4tuj9ruk+UfVV9PgKHc0MG
	sOHPcdndNGdmUwZ0+Ehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtcWd-0000000DBJH-2UdF;
	Tue, 11 Aug 2026 02:47:36 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtcWa-0000000DBIp-0ufY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 02:47:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=vt0BRkV4HbKu6MTzBCKXcr3c2dk0SxLej6WBuqUWFI4=;
	b=kiavNp3pAAQTTMMwCIEgcQu4bqVDMCGfSc/BEm6IB+XGTh01sLE2PU+FnDB1DYGpJnpUvoXwj
	pFEJlbs83cAO1hjYcXIOHd5bGCgv49AnO/2I+1AaKx0YP3bMpcIUg1Hq7HgsV3q+HkGqYSC5q25
	IxIMddeF6DscykUqOtBpr8A=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hJwkh6mlhzcb0T;
	Tue, 11 Aug 2026 10:37:16 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id CB16C4057F;
	Tue, 11 Aug 2026 10:47:21 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Aug 2026 10:47:20 +0800
Message-ID: <77080aa8-7df1-43f0-8c82-1096db05f745@huawei.com>
Date: Tue, 11 Aug 2026 10:47:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64: entry: PSTATE_I_SET is leaking on pseudo NMI
 mode
To: Vladimir Murzin <vladimir.murzin@arm.com>, Mark Rutland
	<mark.rutland@arm.com>, Breno Leitao <leitao@debian.org>
References: <20260807-arm64_fix-v1-1-d069ccf9d71b@debian.org>
 <anXkO8YpoadRzm07@J2N7QTR9R3> <0c47125b-6a5e-41c9-b31c-d78643cbe6bd@arm.com>
 <7b16d183-86d5-481e-b212-977ad0598ac7@huawei.com>
 <3e5f1532-ea17-4994-8cd0-5ce1d42e9049@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <3e5f1532-ea17-4994-8cd0-5ce1d42e9049@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_194732_722946_9DE70B8B 
X-CRM114-Status: GOOD (  13.98  )
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
Cc: rmikey@meta.com, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, kernel-team@meta.com, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



在 2026/8/10 21:04, Vladimir Murzin 写道:
> On 8/10/26 13:44, Jinjie Ruan wrote:
>>> Agreed on the need for a clearer explanation.
>>>
>>> Perhaps local_irq_disable() isn't the right API here, and we should
>>> use local_daif_restore(DAIF_PROCCTX_NOIRQ) instead?
>> The local_irq_disable() here is pair with the local_irq_enable() in
>> preempt_schedule_irq(). So I think it is not correct to replace them
>> separately.
>>
>> The pseudo NMI does not consider how to do local_irq_disable() /enable()
>> when the interrupt is masked by the DAIF.I bit as I reported before.
> 
> Unless I missed anything local_daif_restore(DAIF_PROCCTX_NOIRQ) would
> clear DAIF.{IF} and set PMR to GIC_PRIO_IRQOFF which is the state we

Hi, Vladimir,

Yes, local_daif_restore(DAIF_PROCCTX_NOIRQ) does indeed clear the
DAIF.IF bit and then set the PMR to IRQOFF.

But there is a side effect that will clear the DAIF.{DA} bit. This will
cause `arch_irqentry_exit_need_resched()` to bypass the DAIF check.
Originally, it could not be preempted, but after this fix, it becomes
preemptible.

As the below comment said, If DAIF.{DA} is set, we may be handling an
NMI or debug context, and preemption should not occur.

30 static inline bool arch_irqentry_exit_need_resched(void)
 31 {
 32 >-------/*
 33 >------- * DAIF.DA are cleared at the start of IRQ/FIQ handling, and
when GIC
 34 >------- * priority masking is used the GIC irqchip driver will
clear DAIF.IF
 35 >------- * using gic_arch_enable_irqs() for normal IRQs. If anything
is set in
 36 >------- * DAIF we must have handled an NMI, so skip preemption.
 37 >------- */
 38 >-------if (system_uses_irq_prio_masking() && read_sysreg(daif))
 39 >------->-------return false;

Best regards,
Jinjie

> expect from local_irq_disable() so we can do local_irq_{en,dis}able()
> later on.
> 
> Cheers
> Vladimir
> 



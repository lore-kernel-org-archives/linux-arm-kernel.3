Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B96C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sw2yugL+7Erfuei9UPQvrYVvznFLIzp1oIQXB9V2xNQ=; b=H8C+77Jdd52JX8pWsRoOA47gyd
	Xm15k3fkEsCv1SgmxRP59V836/WurU6wLXVMUXYJOG/PEbZzSSc3PKoV7oDz0jPPZWYxwa831QmOZ
	f1GWp5Xx2IXp2axMLiMTxKT2UkC2syac7WaoCAhBLN8dWTPPBG7yvJyuurXAYw7zpaop+MrnBskS+
	8ZLe4/a80l3t+radt7sxai/chY5SdKrEMDbV/vJlMZNJfQoJOPCQQqanD6cHVj5wc33dxWSdqz5fV
	GURAU6VvFq8u+wTsTygVUDQlYHsGtnGl7CCy4lcYdD3qR+EEeQpXkspUgz4oCuMBJb7pcg2Yif8fj
	hsCvnzVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbLi-0000000BgfN-0ake;
	Tue, 14 Jul 2026 11:30:54 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbLd-0000000Bgdk-2vat
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 11:30:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sw2yugL+7Erfuei9UPQvrYVvznFLIzp1oIQXB9V2xNQ=;
	b=lAzOYofco9Xs9VSMrtqbJLt5BIaIr1wG21le3uiYJ/W7CzN/IMuPU62FTQFAQz1ip3UfV5nW7
	4Km+kGV6XavSca+I6uH0STCS5hkdtkHfbdrKRdsT8do0CuCQx6rxGRF52XUx1NVWY+ZK1zhT26F
	ZUB8r3mtkj2L5+C7NZpo0Vw=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gzxhP0KN8zRhQf;
	Tue, 14 Jul 2026 19:21:25 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 939024056E;
	Tue, 14 Jul 2026 19:30:41 +0800 (CST)
Received: from kwepemq200011.china.huawei.com (7.202.195.155) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Jul 2026 19:30:41 +0800
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemq200011.china.huawei.com (7.202.195.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Jul 2026 19:30:40 +0800
Message-ID: <cf8d8507-a7ba-402a-b43f-3b42843ffd13@huawei.com>
Date: Tue, 14 Jul 2026 19:30:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/36] arm64: irqflags: save and use both DAIF and PMR
To: Vladimir Murzin <vladimir.murzin@arm.com>, Jinjie Ruan
	<ruanjinjie@huawei.com>, <linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-11-vladimir.murzin@arm.com>
 <73bfbebb-e8fd-4b6c-b0e4-8f7d5b09b6af@huawei.com>
 <7a4e09a4-18e9-49a6-9a17-cad552e39076@huawei.com>
 <253e0c6b-7b50-46e6-bd13-69c0459ddae0@arm.com>
From: "Liao, Chang" <liaochang1@huawei.com>
In-Reply-To: <253e0c6b-7b50-46e6-bd13-69c0459ddae0@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq200011.china.huawei.com (7.202.195.155)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_043050_204499_4D0E725F 
X-CRM114-Status: UNSURE (   8.49  )
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

在 2026/7/14 17:44, Vladimir Murzin 写道:
> On 7/10/26 09:11, Jinjie Ruan wrote:
>>>> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
>>>> index f7dc5fb9427d..192eb97cd50b 100644
>>>> --- a/arch/arm64/include/asm/ptrace.h
>>>> +++ b/arch/arm64/include/asm/ptrace.h
>>>> @@ -205,7 +205,7 @@ static inline void forget_syscall(struct pt_regs *regs)
>>>>  
>>>>  #define irqs_priority_unmasked(regs)					\
>>>>  	(system_uses_irq_prio_masking() ?				\
>>>> -		(regs)->pmr == GIC_PRIO_IRQON :				\
>>>> +		(regs)->pmr >= GIC_PRIO_IRQON :				\
>>>>  		true)
>>>>  
>>>>  static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)
>>> Is there any reason to keep interrupt_enabled()? It appears to be rarely used
>>> across interrupt and exception code. So far, i've only found a single use in
>>> gic_handle_irq(), corret me if i'm wrong. So using regs_irqs_disable() directly
>>> might reduce the number of small helper that people need to remember.
>> For arm32.
> 
> Indeed, gic_handle_irq() is shared between arm64 and arm32, and latter
> doesn't provide regs_irqs_disabled(), thus we have to keep
> interrupt_enabled() for now.

Understood, please keep it to hide the architectural difference, thanks for explaining.

> 
> Thanks
> Vladimir
> 


-- 
BR
Liao, Chang


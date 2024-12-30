Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C7BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 15:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:
	CC:To:From:Subject:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOfgW/eb6kbMKUfxY1t2iZZ7URZoLlkvL+AeJyVhRQw=; b=XiHLdfBB8FcTjXTPh6AWW9RgOk
	LD0sEIdZWbKnFrddJBEbB5UPwmLROb6G0IEWW2jOVSHuow73M9vfi4i3h5LAIDaqnPxNy9I6f4L6f
	RQ+x2nKM8eeJLcl6aAccZZIb/RO+t2TpneifGlN1TOAp958pR1zFGDF+zMIP9/czQVgt6GNmTlpJk
	KEh61iiDYuQzYc/xP94NwPmHxyixr1cgjHJAu/rlP+gs0iOUy1/i1DVD7sWB2c2cbkGt7bL29vk7w
	rhxgfFIR4hyGabnoqlzLtkKZSEah5hpLXJwKa7Y+z67JpkFz8zfTmdJ5x3ds8Fpj7E3rKWwhm/4oI
	ryeP7fTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSHQk-00000005PyY-08zZ;
	Mon, 30 Dec 2024 15:11:42 +0000
Received: from smtp-fw-6002.amazon.com ([52.95.49.90])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSHPW-00000005PrW-2tLM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 15:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1735571427; x=1767107427;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:mime-version:content-transfer-encoding:subject;
  bh=VOfgW/eb6kbMKUfxY1t2iZZ7URZoLlkvL+AeJyVhRQw=;
  b=WPsIvRxQUbIJ5oSQ8Z6Q9WtYEhEXXVPrjCiISLvzwohIAmYYIFPiSA1h
   agUHCbxvaKfuW48eRKzwQ+RcDSQMkXJQ+pZspklkBMIanuQ+Wwk0q8Z2x
   eC/EHlAOU/U0ddroJWv1EbVLAE60JbwCFyxUx2lHa0+LGBu/j4u0CduuK
   o=;
X-IronPort-AV: E=Sophos;i="6.12,276,1728950400"; 
   d="scan'208";a="460634235"
Subject: Re: [PATCH] irqchip/gic-v3-its: fix raw_local_irq_restore() called with IRQs
 enabled
Thread-Topic: [PATCH] irqchip/gic-v3-its: fix raw_local_irq_restore() called with IRQs
 enabled
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 15:10:23 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.10.100:7772]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.45.187:2525] with esmtp (Farcaster)
 id e1fc8684-6ae6-48ce-b5f0-78b8871a1118; Mon, 30 Dec 2024 15:10:20 +0000 (UTC)
X-Farcaster-Flow-ID: e1fc8684-6ae6-48ce-b5f0-78b8871a1118
Received: from EX19D030EUC002.ant.amazon.com (10.252.61.251) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Mon, 30 Dec 2024 15:10:20 +0000
Received: from EX19D030EUC004.ant.amazon.com (10.252.61.164) by
 EX19D030EUC002.ant.amazon.com (10.252.61.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Mon, 30 Dec 2024 15:10:20 +0000
Received: from EX19D030EUC004.ant.amazon.com ([fe80::f98a:db18:b0eb:477]) by
 EX19D030EUC004.ant.amazon.com ([fe80::f98a:db18:b0eb:477%3]) with mapi id
 15.02.1258.039; Mon, 30 Dec 2024 15:10:20 +0000
From: "Krcka, Tomas" <krckatom@amazon.de>
To: Marc Zyngier <maz@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	Hagar Hemdan <hagarhem@amazon.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Thread-Index: AQHbWsHwg3M2yPeY4U6TNzo16wTFH7L+2JgAgAALuIA=
Date: Mon, 30 Dec 2024 15:10:20 +0000
Message-ID: <81111C9C-2A06-4865-8A3C-1DF10F174910@amazon.de>
References: <20241230134903.84613-1-krckatom@amazon.de>
 <86h66lp7nn.wl-maz@kernel.org>
In-Reply-To: <86h66lp7nn.wl-maz@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.13.138.67]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <79BC47E0B5F2AC438BB9B34E69737471@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_071026_881008_2A702132 
X-CRM114-Status: GOOD (  26.88  )
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



> On 30. Dec 2024, at 15:28, Marc Zyngier <maz@kernel.org> wrote:
> =

> CAUTION: This email originated from outside of the organization. Do not c=
lick links or open attachments unless you can confirm the sender and know t=
he content is safe.
> =

> =

> =

> Hi Tomas,
> =

> On Mon, 30 Dec 2024 13:49:03 +0000,
> Tomas Krcka <tomas.krcka@gmail.com> wrote:
>> =

>> The following call-chain leads to misuse of spinlock_irq
>> when spinlock_irqsave was hold.
>> =

>> irq_set_vcpu_affinity
>>  -> irq_get_desc_lock (spinlock_irqsave)
>>   -> its_irq_set_vcpu_affinity
>>    -> guard(raw_spin_lock_irq) <--- this enables interrupts
>>  -> irq_put_desc_unlock // <--- WARN IRQs enabled
> =

> Urgh. Nice catch. It really should have been either raw_spin_lock or
> the _irqsave variant, but not the _irq variant which should really
> never be used outside of the core code. I guess this was never really
> tested when rewritten at commit time...
> =

>> Fix the issue by using guard(raw_spinlock), since the function is
>> already called with irqsave and raw_spin_lock was used before the commit
>> b97e8a2f7130 ("irqchip/gic-v3-its: Fix potential race condition in its_v=
lpi_prop_update()")
>> introducing the guard as well.
>> =

>> This was discovered through the lock debugging, and the corresponding
>> log is as follows:
>> =

>> raw_local_irq_restore() called with IRQs enabled
>> WARNING: CPU: 38 PID: 444 at kernel/locking/irqflag-debug.c:10 warn_bogu=
s_irq_restore+0x2c/0x38
>> Call trace:
>>  warn_bogus_irq_restore+0x2c/0x38
>>   _raw_spin_unlock_irqrestore+0x68/0x88
>>   __irq_put_desc_unlock+0x1c/0x48
>>   irq_set_vcpu_affinity+0x74/0xc0
>>   its_map_vlpi+0x44/0x88
>>   kvm_vgic_v4_set_forwarding+0x148/0x230
>>   kvm_arch_irq_bypass_add_producer+0x20/0x28
>>   __connect+0x98/0xb8
>>   irq_bypass_register_consumer+0x150/0x178
>>   kvm_irqfd+0x6dc/0x744
>>   kvm_vm_ioctl+0xe44/0x16b0
>> =

>> Fixes: b97e8a2f7130 ("irqchip/gic-v3-its: Fix potential race condition i=
n its_vlpi_prop_update()")
>> Signed-off-by: Tomas Krcka <krckatom@amazon.de>
> =

> Two problems here:
> =

> - there is no "From Tomas Krcka <krckatom@amazon.de>" at the beginning
>  of the patch, which is needed since you are posting from a gmail.com
>  address
> =

> - there is no SoB using your gmail.com address, which is needed since
>  this patch appears to be from your Amazon doppelganger.
> =

> So either you post this patch from your amazon.de email, or you add
> the two missing pieces of information that are required.
> =

>> ---
>> drivers/irqchip/irq-gic-v3-its.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>> =

>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-=
v3-its.c
>> index 92244cfa0464..8c3ec5734f1e 100644
>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -2045,7 +2045,7 @@ static int its_irq_set_vcpu_affinity(struct irq_da=
ta *d, void *vcpu_info)
>>      if (!is_v4(its_dev->its))
>>              return -EINVAL;
>> =

>> -     guard(raw_spinlock_irq)(&its_dev->event_map.vlpi_lock);
>> +     guard(raw_spinlock)(&its_dev->event_map.vlpi_lock);
> =

> This otherwise looks good to me. Please repost this with the above
> issues fixed, and the following tags:

Ack, reposted as v2 - https://lore.kernel.org/all/20241230150825.62894-1-kr=
ckatom@amazon.de/


> =

> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> =

> Thanks,
> =

>        M.
> =

> --
> Without deviation from the norm, progress is not possible.





Amazon Web Services Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597



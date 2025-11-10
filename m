Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FFDCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJUr/0EUzjfCaK+KSuA5yM/imTi7pw3eemoaLfp6LKk=; b=14M5YocMhapzDA9mKLGjFFXTXM
	RngMoArxc8E9tcvrr65mlKaXfsyUpn94ab3M8Jp+c8mh9lu5ONzxO0LBcoPkWzcpEhvGzLf/y8/L5
	cq0Bhiuf1etHAIR6oloGDhUdjCIwR8sI+mDrj6zXBDwy/EjVl03g8pdjQlQUwasw83tEtfYkNw72t
	ZCjvwaZCvOSiEYZlIYUXnjOvHiwbdKz2rTxnpKEqqlTZUXPSQBVQ3WzNMDAU5LXuPBkXI7NopkV5l
	u5Zsn2SJdM0FhSWqsyWrVgRgO8tN1kJcaMuPwIjvbyy/hPzAnA/bp2FHDdZ7oZnp7RIoFni9yG5pK
	7BZRlHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITYD-00000005f2k-04Z9;
	Mon, 10 Nov 2025 15:11:25 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITY8-00000005f1x-3UuN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 15:11:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8C5561A199A;
	Mon, 10 Nov 2025 15:11:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61D74606F5;
	Mon, 10 Nov 2025 15:11:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12B06103718D6;
	Mon, 10 Nov 2025 16:11:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762787476; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=wJUr/0EUzjfCaK+KSuA5yM/imTi7pw3eemoaLfp6LKk=;
	b=QfqhNo2/G3HQxs/W7N3+/hwen5dY46GEKIU3Wnc8Iksx6Avkh9be9p7gLH9zzDmSM7tH/a
	AaYhmj/U0WQC/e2VYQkRUX49MQAZYzFbJS85OeTIkwSzXSRRJmHL5b6XaOORgjJfBZKdXQ
	UuHG0qnKFnyDT9chCkvfSd5i1hod3ks1hDygZy1RSkHSsdJuqSNCIR94z+tG5X0MaAA8nw
	GzI5FvThdAjWFBBpJis8C23MPtRd+I+3VdcGWmVmGulP5QGJu/qSyydRhvqiPbNb94VhbU
	dJQmLalY5exmCVEcdro31ZxgAr643zB/oYCOuFIzYMJKMyR3DA6BPIZt5KI9OA==
Message-ID: <5ea31c61-7bf5-441c-a7c1-e346039d03d2@bootlin.com>
Date: Mon, 10 Nov 2025 16:11:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] firmware: ti_sci: handle IRQ restore in
 BOARDCFG_MANAGED mode during resume
To: Nishanth Menon <nm@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, richard.genoud@bootlin.com,
 Udit Kumar <u-kumar1@ti.com>, Prasanth Mantena <p-mantena@ti.com>,
 Abhash Kumar <a-kumar2@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251017-ti-sci-jacinto-s2r-restore-irq-v1-0-34d4339d247a@bootlin.com>
 <20251017-ti-sci-jacinto-s2r-restore-irq-v1-2-34d4339d247a@bootlin.com>
 <20251107115457.i6tkt466bp62mwp2@whiff>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20251107115457.i6tkt466bp62mwp2@whiff>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_071122_457025_13A44A55 
X-CRM114-Status: GOOD (  19.41  )
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

Hello Nishanth,

On 11/7/25 12:54 PM, Nishanth Menon wrote:
> On 16:44-20251017, Thomas Richard (TI.com) wrote:
>> In BOARDCFG_MANAGED mode, the firmware cannot restore IRQs during
>> resume. This responsibility is delegated to the ti_sci driver,
>> which maintains an internal list of all requested IRQs. This list
>> is updated on each set/free operation, and all IRQs are restored
>> during the resume_noirq() phase.
> 
> Couple of drive by comments:
> 
> clarify why is this not handled by ia / ir driver?

A patch was sent to handle this in intr driver [1], but the feedback
was: this shall be done in ti_sci driver [2].

And now I have an other argument:

I'm actually working on having functional PCIe after a suspend-resume on
J784s4. And I noticed that set_parent (sci-clk driver) shall be restored
during resume. Restoring irqs and set_parent clk config is only needed
on Jacinto platforms. The sci-clk and inta/intr driver don't know if we
are running on a Jacinto platform or not. The ti_sci have the
information so it can take the decision to restore irqs and set_parent
configs.

[1] https://lore.kernel.org/all/20220607061912.12222-1-a-govindraju@ti.com/
[2] https://lore.kernel.org/all/87r0l96f0e.wl-maz@kernel.org/

> 
>>
>> Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
>> ---
>>  drivers/firmware/ti_sci.c | 143 +++++++++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 135 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
>> index f9f1a67e8e66b0a4048fae04ce31be54ca5cba7a..a211f8805dd21c7675b8cefd61929ecfda8e0f7f 100644
>> --- a/drivers/firmware/ti_sci.c
>> +++ b/drivers/firmware/ti_sci.c
>> @@ -87,6 +87,16 @@ struct ti_sci_desc {
>>  	int max_msg_size;
> [...]
>> +
>> +	irq_desc.valid_params = valid_params;
>> +	irq_desc.src_id = src_id;
>> +	irq_desc.src_index = src_index;
>> +	irq_desc.dst_id = dst_id;
>> +	irq_desc.dst_host_irq = dst_host_irq;
>> +	irq_desc.ia_id = ia_id;
>> +	irq_desc.vint = vint;
>> +	irq_desc.global_event = global_event;
>> +	irq_desc.vint_status_bit = vint_status_bit;
>> +	irq_desc.secondary_host = s_host;
>> +
>> +	list_for_each(this, &info->irqs.list) {
> 
> list_for_each_entry_safe ?
> 
> How big is this list on a j784s4 class device? is it worth creating a
> irq_desc_hash and using a hlist a better option?

I did the test with arm64 defconfig on j784s4 and the list has 43 elements.
I'll look at the hlist.

Best Regards,
Thomas


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9589DC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 08:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/UxV99VUsTKwX6Ufc+aD/IAajOrvOVIgQ7yGjhIBSU=; b=3MVNi+XQzYBGWjH6DKxFWQuHbq
	93PGodfhDxL2BDCxn/b4ePJUXQF+601Om8flv4MVK9+xPVIvh5TkG/U7aLxrFDEHf02+7cVBKae1Q
	gLYdGJPF9HWcwDV6g+zHHWOlypYL1DhOgTGrMujXvCkPzXpw6LKv05VfKxXAeM+QZTmekDxvy/FOn
	qgeFuijAgBx+EYZ3BX1khxA7yh5bhBbr/J0JYU77z+BjUl1v5D1+zD6KWzD9c2nNlxQI2R6OTGT5G
	gDn4cCORrZUHlRJ+2NwyP69jf1cO9jRrLkR6VMPKadU3cGfbq9Im4cITQqrMnDSVJ7InTFhesbw+M
	ZvudA1mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tasrL-0000000C1hA-2BQD;
	Thu, 23 Jan 2025 08:46:43 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taspl-0000000C1Kz-1mEi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 08:45:07 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1737621901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O/UxV99VUsTKwX6Ufc+aD/IAajOrvOVIgQ7yGjhIBSU=;
	b=lzXi/HfI4VgJk4vxNJ5LKOKAwaHHCNZhtzmhHzisiLQrPbV0TNdmeSWYIm4dvMsOlRtbf7
	fplhx/UzmCyO+nsphrlvUbRDrd8wd3JT7ITgTt9aCCTH/T2Px5ADvQV0hFIEjlPH3tFMyo
	RMF7p4ckUwJ+ZILfY/oixQDATmQOa5ipMDvbroBcKVbtVkdfp5R+kc2Qh33giAqF7Dvgb7
	oWZ3grxKjw6sh9JnGVDm2nC16exY73ycFusyd9WvWMmTdBVPpbG3K0ZTuDTpCnkCxWqE+m
	izw82KExycYZqym2I9pR15bcmHLQBlixZ5OxYvz4P0oG0D2jS8i4NJ2ndmLf7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1737621901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O/UxV99VUsTKwX6Ufc+aD/IAajOrvOVIgQ7yGjhIBSU=;
	b=MdgqXRzicre22EJiADcmHir+0lpV4e2R4seDS6oTR6tbegjQAGYVbskCkQ2SEImNJxl1dA
	2GMF/9hnXdyyviAA==
To: Stefan Eichenberger <eichest@gmail.com>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, shivamurthy.shastri@linutronix.de,
 anna-maria@linutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] irqchip/irq-mvebu-icu: Fix irq_set_type for sei and nsr
In-Reply-To: <Z46AhYi3DN4TtBKM@eichest-laptop>
References: <20241217111623.92625-1-eichest@gmail.com> <87frlkcx2b.ffs@tglx>
 <Z4k-DkMt8XQYs_kf@eichest-laptop> <87tt9ya2qy.ffs@tglx>
 <Z4qbioby2DK2Dddl@eichest-laptop> <87cyghan60.ffs@tglx>
 <Z46AhYi3DN4TtBKM@eichest-laptop>
Date: Thu, 23 Jan 2025 09:45:00 +0100
Message-ID: <877c6lapgz.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_004505_602265_01E49AE9 
X-CRM114-Status: GOOD (  25.74  )
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

On Mon, Jan 20 2025 at 17:57, Stefan Eichenberger wrote:
> On Mon, Jan 20, 2025 at 09:45:43AM +0100, Thomas Gleixner wrote:
>> On Fri, Jan 17 2025 at 19:03, Stefan Eichenberger wrote:
>> > It seems that irq_chip_set_type_parent is not failing. By adding some
>> > debug messages to kernel/irq/manage.c I found that irqd_get_trigger_type
>> > returns IRQF_TRIGGER_RISING even though it should return
>> > IRQF_TRIGGER_HIGH according to the device tree. Maybe this was fixed
>> > between 6.10 and 6.12 but I need to analyze that again in more detail.
>> 
>> The trigger type is fixed up in mvebu_icu_irq_domain_translate(), but
>> that should be the same with the new code in mvebu_icu_translate().
>> 
>> Can you instrument mvebu_icu_translate() and validate that it is
>> 
>>     1) Invoked at all
>> 
>>     2) The type fixup is done:
>> 
>>        if (msi_data->subset_data->icu_group == ICU_GRP_SEI)
>>               *type = IRQ_TYPE_EDGE_RISING;
>
> Thanks a lot for pointing me in the right direction. I think I found
> what is going on. My instrumentation showed that we still end up in that
> function but the translation does not work. I think the reason is that
> the msi_data conversion is wrong. The following patch would solve the
> issue:
>
> diff --git a/drivers/irqchip/irq-mvebu-icu.c b/drivers/irqchip/irq-mvebu-icu.c
> index b337f6c05f18..4eebed39880a 100644
> --- a/drivers/irqchip/irq-mvebu-icu.c
> +++ b/drivers/irqchip/irq-mvebu-icu.c
> @@ -68,7 +68,8 @@ static int mvebu_icu_translate(struct irq_domain *d, struct irq_fwspec *fwspec,
>                                unsigned long *hwirq, unsigned int *type)
>  {
>         unsigned int param_count = static_branch_unlikely(&legacy_bindings) ? 3 : 2;
> -       struct mvebu_icu_msi_data *msi_data = d->host_data;
> +       struct msi_domain_info *info = d->host_data;
> +       struct mvebu_icu_msi_data *msi_data = info->chip_data;
>         struct mvebu_icu *icu = msi_data->icu;
>
>         /* Check the count of the parameters in dt */
>
> Do you agree with that fix? If so I will prepare a proper patch.

Duh, yes. What was I thinking?

Thanks,

        tglx


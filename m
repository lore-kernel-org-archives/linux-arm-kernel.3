Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC25C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 21:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1O9A+0MyPDityKYvRib0cobH5u7ug+oiIww1XDgpps=; b=nwsT9ysjyebmvzevw06jrVlXRo
	iZ6lfrzaKjxIGGuLc28tMap/co49sAAezMe2Tmow7sS+v8w31MA8Y8cBFsWiFIiwl/ngDzqDzlbk3
	41qHb+80L+UG6Oa8wd1ai6CFkYG1CBzjfn7sdCv/9mltlNMoepuUKpdKr1q2ul0Uq3XdRKz+xOx79
	Gh3r29jcRw+Sivrq7dN7jb2iXv6I4NIXTvpZUvKmYe1J8fL3zHyUQSehawsePEhxUDSAXZTT6E1gP
	cq4VcjzyqYWE+hiwFFl5ToOyAVudGEHFKoHAOWAzlTfaArBwji02F4LyDq9kJmP2+xS1Rq0LFC8Ma
	rfYVuWzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPOp-00000005aqH-1tc4;
	Thu, 02 Jul 2026 21:56:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPOm-00000005apS-147Q;
	Thu, 02 Jul 2026 21:56:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A70AC404A5;
	Thu,  2 Jul 2026 21:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACB71F00A3A;
	Thu,  2 Jul 2026 21:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783029403;
	bh=d1O9A+0MyPDityKYvRib0cobH5u7ug+oiIww1XDgpps=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=bIVNZuWyWeP2V4+bwBK9HSvNdv6ystQNIZT6kCx4+bJgWYju9hEdaH2Ztvv/ErNZC
	 Ogbcyuxt9U0x/uPQJ0SOIaC21crm/2VsxR+qxOLpAcid/9GDkCTVA6qxzLEifSe2Hg
	 7v1DZllsIXmqFokVi2GrV1HFUNz+JcL3QQKeEWR/aXuy1hXJELtFQCMMpiZsnFL+/E
	 2q0iMDea5oKQrPFRhyu/BtPNSh/oLNCte1OJ7G85y/sap4h3j53W+KaU5zh9LVfW1M
	 i8Cp1y4c/hFDryD/rGM7/xyBtpIl/GZlVslF0CxQ4mm/0nUcY/dKrYQlujnf1yfeMw
	 bLU9R05z8xB0Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Sunil V L
 <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v3 7/7] irqchip/gic-v5: Enable GICv5 IWB ACPI probe
 ordering detection
In-Reply-To: <878q7tnjj2.ffs@fw13>
References: <20260701-gic-v5-acpi-iwb-probe-deferral-v3-0-c5562cf0fe29@kernel.org>
 <20260701-gic-v5-acpi-iwb-probe-deferral-v3-7-c5562cf0fe29@kernel.org>
 <878q7tnjj2.ffs@fw13>
Date: Thu, 02 Jul 2026 23:56:40 +0200
Message-ID: <875x2xnjhj.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, Jul 02 2026 at 23:55, Thomas Gleixner wrote:

> On Wed, Jul 01 2026 at 16:38, Lorenzo Pieralisi wrote:
>> Register an ACPI hook in the ACPI interrupt management code for GICv5 to
>> retrieve the ACPI interrupt controller handle (if any) of the controller
>> handling a specific GSI, by updating the acpi_set_irq_model() call with
>> the gic_v5_get_gsi_handle() function pointer parameter.
>>
>> gicv5_get_gsi_handle() allows ACPI core to detect the ACPI handle
>> of the controller that manages a specific GSI interrupt.
>>
>> Update the IWB driver to clear device dependencies in ACPI core once the
>> IWB driver has probed.
>>
>> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
>> Cc: Thomas Gleixner <tglx@kernel.org>
>
> Assuming this goes through the ACPI tree:
>
> Acked-by: Thomas Gleixner <tglx@kernel.org>

If that's not the plan, let me know and I pick it up.


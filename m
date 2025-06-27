Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2114C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 12:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VHJiTNKmHRt1NAN5DWWOMO9cG8S1vMPUEz+x35djbk=; b=Ow38JrqYx5ZrIZcsPbgKg9s91M
	kOdsNncCvs8D4vIc1qKX2U5m3mXUiUOUnMrwBSa6cUl1yBacNQKfOo0YlLw4Kz4sgIbhwKGiAAXpg
	TeWS2daj2TVMqKbLk3gRoFs4hR/qkyBdpqDJfr+6EqQ7pGL3NkXQBzSMaojPR8eqQbjtqPz0pKdfl
	uLvPSmGLU5XL2D4oESg4AcmbQgnpMcJMMTqAfEf4MT9Ulgy3ckaLVQCmc5w3YT/Q6KLKLhk6DKUva
	Or54VBjNbBJL3eJFACxBiCZxJgDskkwJuajn7IwBvjzq4cr20JGeAwes/iE+YeFh1vjxjmjV7maIY
	YHwb0DiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7tD-0000000Eb7m-1aH8;
	Fri, 27 Jun 2025 12:09:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6Xm-0000000EK42-2uY4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 10:42:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0907D1A00;
	Fri, 27 Jun 2025 03:42:35 -0700 (PDT)
Received: from [10.57.30.59] (unknown [10.57.30.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9D143F58B;
	Fri, 27 Jun 2025 03:42:50 -0700 (PDT)
Message-ID: <43acfcd8-b359-448f-bbb6-da1b71a64f45@arm.com>
Date: Fri, 27 Jun 2025 11:42:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SMMUv3 interrupt handling via custom logic
To: Michal Simek <michal.simek@amd.com>, Will Deacon <will@kernel.org>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 iommu@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Sarangi, Anirudha" <anirudha.sarangi@amd.com>
References: <0482d84e-871b-4522-b94b-29a97c87ff66@amd.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <0482d84e-871b-4522-b94b-29a97c87ff66@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_034254_770817_B8B30269 
X-CRM114-Status: GOOD (  24.73  )
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

On 2025-06-27 8:19 am, Michal Simek wrote:
> Hi Will and Robin, (+Stefano, Anirudha)
> 
> We are using smmu-v3 in our SOC and I would like to ask you for 
> recommendation how to handle our interrupt cases.
> 
> here is description which we are using
> 
> smmu: iommu@ec000000 {
>      compatible = "arm,smmu-v3";
>      reg = <...>;
>      #iommu-cells = <1>;
>      interrupt-names = "combined";
>      interrupts = <0 169 4>;
> };
> 
> but it is missing one important detail which just arise that actually 
> there is additional HW logic which deals with SMMU interrupts separately.
> There is a secure part (global, cmd, event - gerror, cmdq-sync, eventq 
> in DT)
> and non secure part (pri, global, cmd, event - priq, gerror, cmdq-sync, 
> eventq in DT).
> Based on my information all these interrupts should be acked once 
> handled to be able to get another one.
> The driver itself is able to handle them separately but we didn't create 
> any solution to reach custom HW to do it.
> 
> I looked at f935448acf46 ("iommu/arm-smmu-v3: Add workaround for Cavium 
> ThunderX2 erratum #126") which introduced combined IRQs but it looks 
> like that there is no need for additional ACK of that IRQs.

Per the architecture, SMMU interrupts are logically edge-triggered so 
there is nothing to clear at the SMMU end (the "interrupt status" is 
implicit in whatever condition caused an interrupt to be sent, e.g. the 
event queue becoming non-empty, SMMU_GERROR becoming different from 
SMMU_GERRORN, etc.)

If this is an Arm SMMU IP (MMU-600/700/S3) then the physical interrupt 
outputs are most definitely rising-edge. If somone's stuck some 
interrupt combiner in between those and the main interrupt controller, 
then yes, that interrupt combiner really should have its own driver.

> The HW logic itself is handling secure and non secure settings for SMMU 
> that's why would be the best to avoid directly mapping it in Linux.
> 
> One way to go is to create secondary interrupt controller driver
> a) ioremap one with notice about secure part because we are using SMMU 
> only with NS world
> b) firmware based to tunnel accesses via SMCs and allow only access to 
> limited amount of registers
> 
> The second way is likely create any hooks in the driver to be able to 
> provide additional SOC specific hooks.

If this thing is munging *all* the SMMU interrupt outputs as I suspect, 
then the big problem with that idea is that "the driver" is at least two 
separate drivers (SMMU and PMU), 3 if it has RAS and you ever want to 
entertain the idea of kernel-first handling.

Thanks,
Robin.

> 
> I am not quite sure which way would be the best that's why I would like 
> to get some recommendation from you.
> 
> Stefano: please correct me if any of my description is not accurate.
> 
> Thanks,
> Michal



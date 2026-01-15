Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D13AD44C51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHJLlu6q/UbOFAxNX53Zd8WnNJ7TKP0K9h0lcoYt/VA=; b=bq2KdtnsZYVTi34+JX2EpAgMmj
	svtFoVR0pKRpMGNBfZXNb2PV+zEzXvPv9snPPFUfVNKGuGvsBcKQkwh7DlTDGQFkQlewCDYNvfrUD
	jHTdbCj4AGqmsntWkXC3Y0yjF5ZJN6+3CZ3IYOIcQfhHeCElYV/4YofH/Ow7XRBGqhCp9wFVYonwZ
	YCi8nPyDNym9S4+b8iYHRRPm35spUx7Dy49UtILe0JNK2tK8GSodIR/3nJKcWvu8L9+hXNE/iSNN3
	H1TX9L8JjVkt93Mx8C437ms2r1OjvRiOePhERZ2m3SvqcrA+e3FRO7liR7tTxenaOd/+HqDR6qk1N
	UKD4DGhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOTn-0000000CUq2-3p80;
	Thu, 15 Jan 2026 14:37:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOTl-0000000CUpV-1GoS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 14:37:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AFE1FEC;
	Thu, 15 Jan 2026 06:37:31 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3FE83F632;
	Thu, 15 Jan 2026 06:37:32 -0800 (PST)
Message-ID: <46047ccd-3b45-4bce-a71b-47dadc1eab88@arm.com>
Date: Thu, 15 Jan 2026 14:37:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 0/45] arm_mpam: Add KVM/arm64 and resctrl glue
 code
To: Zeng Heng <zengheng4@huawei.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 catalin.marinas@arm.com, corbet@lwn.net, dave.martin@arm.com,
 david@kernel.org, dfustini@baylibre.com, fenghuay@nvidia.com,
 gshan@redhat.com, joey.gouly@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, kvmarm@lists.linux.dev, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 maz@kernel.org, oupton@kernel.org, peternewman@google.com,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 suzuki.poulose@arm.com, tan.shaopeng@fujitsu.com, will@kernel.org,
 sunnanyong@huawei.com, Babu Moger <bmoger@amd.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260114065149.1108631-1-zengheng4@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260114065149.1108631-1-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_063741_893868_F3B810BF 
X-CRM114-Status: GOOD (  23.71  )
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

Hi Zeng,

+CC Babu (Comments on PLZA)

On 1/14/26 06:51, Zeng Heng wrote:
>> From: Ben Horgan <ben.horgan@arm.com>
>> Date: Fri, 19 Dec 2025 18:11:02 +0000
>> Subject: [PATCH v2 00/45] arm_mpam: Add KVM/arm64 and resctrl glue code
>>
>> One major departure from the previous snapshot branches referenced in the
>> base driver series is that the same MPAM setting are used for kernel-space
>> and user-space. That is, MPAM1_EL1 is set to the same value as MPAM0_EL1
>> rather than keeping the default value. The advantages of this are that it
>> is closer to the x86 model where the closid is globally applicable, all
>> partids are usable from user-space and user-space can't bypass MPAM
>> controls by doing the work in the kernel. However, this causes some
>> priority inversion where a high priority task waits to take a mutex held by
>> another whose resources are restricted by MPAM. It also adds some extra
>> isb(). I would be interested in opinions/data on the policy for MPAM in
>> kernel space, i.e how MPAM1_EL1 is set.
> 
> Another advantage is that, given the small size of the L2 cache,
> frequent switching of MPAM configurations between kernel and user modes
> can cause cache-capacity jitter, making it difficult to isolate
> interference from noisy neighborhood.
> 
> However, in addition to the issues mentioned above, updating the
> MPAM1_EL1 configuration also exposes interrupt handling to the MPAM
> settings of the current task.

Makes sense, thanks for these two observations.

> 
> I still agree with the current modification of setting MPAM1_EL1 to the
> same value as MPAM0_EL1. However, the ARM MPAM hardware supports more
> flexible configuration schemes than x86 RDT and another approach is also
> worth considering: Software can let a control group choose whether
> kernel mode follows the user mode MPAM settings, or whether the kernel
> mode configuration is delegated to the default control group, though
> this may change the existing user interface.

I wonder if this would be possible in AMD PLZA as well. Babu?

> 
> At the LPC resctrl micro-conference, Babu also mentioned the PLZA proposal
> as an attempt to address the issues raised above. Seems like no clear
> interface was presented yet. Wait to see what new interface that solution
> will introduce.

Yes, I watched a recording of that. :)

> 
> One last thing, please add me to the CC list for future MPAM patch series.
> I'll provide timely testing on my local aarch64 environment and review
> feedback. Thanks.

Will do. Apologies for not doing this earlier and thank you for the
promise of testing and reviews :) There is a v3 which you have hopefully
seen.

> 
> 
> Best Regards,
> Zeng Heng
> 
> 

Thanks,

Ben



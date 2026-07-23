Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F8DC531CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 12:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cF6Kerioyn7MXtxYd1Ov/DR+CcXp3mUtdJwYQP0QVv4=; b=g7RXcRgxDcyorSkWDWnt2eOQCE
	17FO9QW1F+YFIqwfnchAaQZ2cMJ2/HoffdaV0z0Q4FLo5IwLfR1y7ETVMSn0pxGMapkZtR4wOUtz5
	LjBnwX8VBsMnHCJ9ERVEOF+UQ+zbME5Gz0ElxzZ7azE7/r7SBwlNWH4KfjlNcYvhXqCprobsrxj0Z
	Jr9FgEhAGpur/Vv6i4nTUCuEo1QXtGmT/1/R+8h/HMFshJJO3+qqLE0Se3i0f3X2RZzlKcZsJw6rM
	2zXra78RHs7WsYihaMOKo7GQDF5LH4HzK1wrxEOojMkFnPjw12AuvHABcakE8nkcmnJN25y4sT7Pa
	X3c9lj6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsb9-0000000EFA4-3G0X;
	Thu, 23 Jul 2026 12:32:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsb7-0000000EF9g-3FOi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 12:32:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 752451477;
	Thu, 23 Jul 2026 05:32:16 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA5063F59E;
	Thu, 23 Jul 2026 05:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784809940; bh=pGFCcgmtP66RoZMszPwjCpkcv+BiFgQPgqBlPICwB1s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G9WCeu+Pacpjw6aajzuQpslJvP5yu5tu+wShgkZR07J19Y0Ovr69JYVRvye8sGgu+
	 VuvNkLyqcWt7ozAQefvkdPOv/C8vWL0X/NSsXj0yKBUNi9LGJX7ia/rzukvo9Zz4Hv
	 +4TeJKvlyYzWH387wjuKHj5EQAEj14atc147Evvs=
Message-ID: <5417593d-9ef2-4ef0-8f18-6b92d1494751@arm.com>
Date: Thu, 23 Jul 2026 14:32:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/16] arm_mpam: add MPAM-Fb MSC firmware access
 support
To: Niyas Sait <niyas.sait@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260710144520.917375-1-andre.przywara@arm.com>
 <20260710144520.917375-15-andre.przywara@arm.com>
 <c687f89e-d36e-4d8f-8b8d-695f2a8249ef@arm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <c687f89e-d36e-4d8f-8b8d-695f2a8249ef@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_053221_890928_CF90A207 
X-CRM114-Status: GOOD (  24.95  )
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

Hi Niyas,

On 7/14/26 14:27, Niyas Sait wrote:
> On 10/07/2026 15:45, Andre Przywara wrote:
> 
>> +#define MPAM_VERSION_MSG_SIZE    (PCC_TYPE3_MSG_PAYLOAD_OFS)
>> +#define MPAM_READ_MSG_SIZE    (PCC_TYPE3_MSG_PAYLOAD_OFS + 3 * 
>> sizeof(u32))
>> +#define MPAM_WRITE_MSG_SIZE    (PCC_TYPE3_MSG_PAYLOAD_OFS + 4 * 
>> sizeof(u32))
> 
> I think these lengths are wrong for ACPI extended PCC shared memory.
> 
> Length should be command + payload, and should not include the payload 
> offset within the PCC shared memory region.
> 
> I think this should be something like
> 
> #define MPAM_VERSION_MSG_SIZE  sizeof(u32)
> #define MPAM_READ_MSG_SIZE     (sizeof(u32) + 3 * sizeof(u32))
> #define MPAM_WRITE_MSG_SIZE    (sizeof(u32) + 4 * sizeof(u32))

Yes, that's right, that's just the MPAM-Fb visible part of the protocol 
message, not the potentially preceding SCMI header.
Adjusted it like that.

> 
>> +
>> +static int mpam_fb_build_version_message(unsigned int token,
>> +                     void __iomem *msg_buf)
>> +{
>> +    struct acpi_pcct_ext_pcc_shared_memory *pcc_shmem = msg_buf;
>> +
>> +    writel_relaxed(0, &pcc_shmem->flags);
> 
> Here the flags are always 0.
> 
> If the PCCT advertises interrupt based completion, I think we need to 
> set PCC_CMD_COMPLETION_NOTIFY here. Otherwise the platform can process 
> the request without generating an interrupt back to the AP, and the PCC 
> driver will time out waiting for completion.

So yeah, Ben commented on the previous version that we don't know if the 
platform requires an IRQ or not, so we better leave that 0.
But on platforms that do require one, we probably must set that flag. 
TBH it's a bit odd to have it, since it muddles transport and protocol, 
I'd say. In the kernel it shows because the client doesn't  have easy 
access to the PCCT options, that's hidden away by the mailbox abstraction.
I will bring the flag back, under the assumption that an agent not 
supporting interrupts would ignore it.
One other way I can think of is to peek into the mbox_chan mailbox 
controller structure and look at the txdone_method member, to check 
whether it says polling or not. But that sounds like cheating and 
violating the abstraction. If anyone has a better idea, I am all ears.

>> +
>> +static int mpam_fb_send_request(struct mpam_pcc_chan *pcc_chan, u32 
>> msc_id,
>> +                u16 reg, u32 *result, int mpam_fb_command)
>> +{
>> +    unsigned int token = atomic_inc_return(&mpam_fb_token);
> 
> MPAM-Fb token is a 10-bit field in the message header, so this needs to 
> be masked before using it. Otherwise once the token exceeds 1023, the 
> platform returns the wrapped 10-bit token but Linux compares it against 
> the original value and will probably time out.

Ouch, that's a good one, thanks for spotting this! I confirmed it by 
initialising the token value to 1000, and indeed it stops with an error 
after 24 transactions. Fixed now.

Many thanks,
Andre

> 
> May be something like:
> 
> unsigned int token = atomic_inc_return(&mpam_fb_token) & 
> FIELD_MAX(MPAM_MSC_TOKEN_MASK);
> 
> 
> Thanks,
> Niyas



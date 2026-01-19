Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBF6D29C33
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3FpTQNKVIMlmBtuW8+zcZfwb0sI6cN5OYUHozp3xZE=; b=LKFKKxnklD6fcHBT/4PKRYSWiW
	aCKQbNGU65GRtJjuwtPsn07v8fmuaxFrSoI7FXeWE8h8JfI6+VtXU5LpHaUaYkVHiv8LAWWcpiCJR
	N+fNv9eEVPOJH7Wdh0NwHf4u8lKvXowqSbToXcJQpFcgUNL9YmdnHK06DpDVb53W13HSzD0CtNw/s
	kccL7UCYVgG8a/FWCUUqLXbbHoiNqyo9GBgiaYc/1dSr8MYSD7X7CtYe4o0+SAYQjNuNepMMiyzIH
	EHmqgPlIjYhfGF+et/CjOjX+HnvtZ+5Ul8rn2ejHALK8KJYxbnS15sZJBZEujDAkze/JHUxc9qLho
	S/bTzAnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrTR-00000002O4H-1lKc;
	Mon, 19 Jan 2026 15:47:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrTN-00000002O3D-42l3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:47:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0554FEC;
	Mon, 19 Jan 2026 07:47:07 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F3963F694;
	Mon, 19 Jan 2026 07:47:09 -0800 (PST)
Message-ID: <e0be8ced-4bfe-437a-ae4d-9b4dcc15d100@arm.com>
Date: Mon, 19 Jan 2026 15:47:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/47] arm64: mpam: Add helpers to change a task or
 cpu's MPAM PARTID/PMG values
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, will@kernel.org,
 corbet@lwn.net, maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
 suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-12-ben.horgan@arm.com> <aWk8aZafbtXx5bPu@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <aWk8aZafbtXx5bPu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_074722_967944_831C7ABC 
X-CRM114-Status: UNSURE (   6.90  )
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

Hi Catalin,

On 1/15/26 19:13, Catalin Marinas wrote:
> On Mon, Jan 12, 2026 at 04:58:38PM +0000, Ben Horgan wrote:
>> +static inline void mpam_set_task_partid_pmg(struct task_struct *tsk,
>> +					    u16 partid_d, u16 partid_i,
>> +					    u8 pmg_d, u8 pmg_i)
>> +{
>> +#ifdef CONFIG_ARM64_MPAM
>> +	u64 regval = __mpam_regval(partid_d, partid_i, pmg_d, pmg_i);
>> +
>> +	WRITE_ONCE(task_thread_info(tsk)->mpam_partid_pmg, regval);
>> +#endif
>> +}
> 
> Isn't this function, together with mpam_thread_switch(), in an enclosing
> #ifdef already?

Yes, I'll remove the inner #ifdef.

Thanks,

Ben



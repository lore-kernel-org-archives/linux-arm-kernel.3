Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401F5CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXUmKbbNO3lTdF+TIniCzMR+B5Zi1zCZ7HmxRzVH2iA=; b=jZcYfs+Ak5KSkDS1ntj1f4AziS
	gxzXoBB5gdBrrimVbuwsM/nWYN7Gmma2YXhuV4ZPSp8GY5TDEKusc0ajBG4MKkDRczbGivTkeYSxa
	CToN6i5B8quPhyIPYZMmxAA48ZBQdrrxIUz/hl3VtARm8DAS6k1NfvOnP2BGJMEnAcEvQfeadcIPa
	vBq6yE9AxKuFJkkxAt26RG0EEBu3KxlVraCJeWcAaB8mJ4j4RlKdGVDw7Q0CgHtbmUkgl2JVy1/Sw
	84XvYFQWyW7WPYQZLFwbKlKWx5Qa01AQj/vNApO7OXeFeBwGmC8aL0VvqhJAfPqVwp+H39G4ffwLD
	aoWQVV3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux58G-0000000A2gJ-2N0L;
	Fri, 12 Sep 2025 14:52:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux58E-0000000A2eT-0g8q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:52:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93B2616A3;
	Fri, 12 Sep 2025 07:52:00 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F0013F694;
	Fri, 12 Sep 2025 07:52:04 -0700 (PDT)
Message-ID: <52b6bd30-55af-4916-89c0-f87446689fbe@arm.com>
Date: Fri, 12 Sep 2025 15:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/29] arm_mpam: Reset MSC controls from cpu hp
 callbacks
From: Ben Horgan <ben.horgan@arm.com>
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-16-james.morse@arm.com>
 <abb9b4bb-18d8-4de7-a216-3c18769f61cb@arm.com>
Content-Language: en-US
In-Reply-To: <abb9b4bb-18d8-4de7-a216-3c18769f61cb@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_075210_245084_86D542FC 
X-CRM114-Status: GOOD (  17.01  )
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



On 9/12/25 12:25, Ben Horgan wrote:
> Hi James,
> 
> On 9/10/25 21:42, James Morse wrote:
>> When a CPU comes online, it may bring a newly accessible MSC with
>> it. Only the default partid has its value reset by hardware, and
>> even then the MSC might not have been reset since its config was
>> previously dirtyied. e.g. Kexec.
>>
>> Any in-use partid must have its configuration restored, or reset.
>> In-use partids may be held in caches and evicted later.
>>
>> MSC are also reset when CPUs are taken offline to cover cases where
>> firmware doesn't reset the MSC over reboot using UEFI, or kexec
>> where there is no firmware involvement.
>>
>> If the configuration for a RIS has not been touched since it was
>> brought online, it does not need resetting again.
>>
>> To reset, write the maximum values for all discovered controls.
>>
>> CC: Rohit Mathew <Rohit.Mathew@arm.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> ---
>> Changes since RFC:
>>  * Last bitmap write will always be non-zero.
>>  * Dropped READ_ONCE() - teh value can no longer change.
>>  * Write 0 to proporitional stride, remove the bwa_fract variable.
>>  * Removed nested srcu lock, the assert should cover it.
>> ---
>>  drivers/resctrl/mpam_devices.c  | 117 ++++++++++++++++++++++++++++++++
>>  drivers/resctrl/mpam_internal.h |   8 +++
>>  2 files changed, 125 insertions(+)
>>
>> +
>> +static void mpam_reset_msc(struct mpam_msc *msc, bool online)
>> +{
>> +	struct mpam_msc_ris *ris;
>> +
>> +	mpam_assert_srcu_read_lock_held();
> 
> Unneeded? Checked in list_for_each_entry_srcu().> +

If you do get rid of this then that leaves one use of the helper,
mpam_assert_srcu_read_lock_held(), and so the helper could go.

> Thanks,
> 
> Ben
> 
> 

Thanks,

Ben



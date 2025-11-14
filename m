Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90EDCE7AA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+URdYloP1X0Be0QGBTMXY11c1QBiml4xjvRjBFG+cA=; b=nZZD1GTbbF+ETwFfiqihYm7CiC
	HLiFDWl1x4aKW1+Nu5QOXL53Hq1LaARgfL8/yzvOSTQcO680l9bmOx/30FfauvymclfGDwg/HYI1T
	YK+pNip7rDbNBzadyBaHJ5ymdqEOTRzoN25PpA/scCoHq8akLYzIdRjJC8EQavnSrWu2qOLzJ0BWM
	qReRSUHko421wJSnGtqqsXxOaIOf54WZ6fQOFjK5NFepCSAmoOZgyEfReFrwXDqSJ9oiJV7Br1uIo
	Bi/ob/RigKA07gPbHYSZQpjsOaFu9FSM7v9dc8BgWL0uyLCvWb+O7uPaw47P8P+r20JRPGgBfxkLK
	tvFaXZ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJr7I-0000000C1Y6-2cDy;
	Fri, 14 Nov 2025 10:33:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJr7H-0000000C1XZ-0eb1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 10:33:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EA821063;
	Fri, 14 Nov 2025 02:33:10 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B28953F5A1;
	Fri, 14 Nov 2025 02:33:13 -0800 (PST)
Message-ID: <e4521b04-6c3c-418b-8cee-6be43d5ef17f@arm.com>
Date: Fri, 14 Nov 2025 10:33:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/33] arm_mpam: Allow configuration to be applied and
 restored during cpu online
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: james.morse@arm.com, amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, gshan@redhat.com,
 guohanjun@huawei.com, jeremy.linton@arm.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-24-ben.horgan@arm.com>
 <20251110172724.00005675@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251110172724.00005675@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_023319_241970_DED62FAE 
X-CRM114-Status: GOOD (  13.33  )
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

Hi Jonathan,

On 11/10/25 17:27, Jonathan Cameron wrote:
> On Fri, 7 Nov 2025 12:34:40 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> From: James Morse <james.morse@arm.com>
>>
>> When CPUs come online the MSC's original configuration should be restored.
>>
>> Add struct mpam_config to hold the configuration. This has a bitmap of
>> features that were modified. Once the maximum partid is known, allocate
> 
> I'm not following 'were modified'.  When?  Sometime in the past?
> Perhaps "features that have been modified when XXX happens" or

The intent of the features bitmp is to only update the configuration in
hardware for the feautures that require it. On reset, this is all
features, but for a user configuration change this is just the
difference from what was previously set.

However, I don't think the difference part is currently working
correctly; the bitmap always has all the bits set and so any update
configures everything. I'll look into this.

> 
> Having read the code I think this is something like "are modified as configuration
> is read".
> 
>> a configuration array for each component, and reprogram each RIS
>> configuration from this.
Thanks,

Ben



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3820CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 11:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oKmouidKKBVsyXF0K/DNGIxfENXL583CftUMKE39cU=; b=V7UKd3bed1l0tb6/zJu7SW84qj
	5Aw6nA7kwG/IFhQszs2UOxA2ECr5FGwzxt5Sb5Q9+ipw/H64z5oivRE8vU4BOb9JDDr1xuOt1ljWy
	jpCU4kr07KxLL8VYcnqQhnfKAWoWTqzoSucmOr36kUOkicCys13sDApOmX62k4pbdzb3yxBW83Guy
	wsUDk95CNgu2a2C8h7lrohxGjpFnRcYVYwi75tpQasZ5eqjtcPBEsfybTK+ORWrGGOhpJFL5WZGCi
	fsoR8MoUYH+eNDoWebp9p5yb1cNecBMNt5X7fCAhIjwUVpOOsZ/qF08AiCfy0LuZ0q2NdyZJAVj6o
	9mlm/MLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLRm-0000000DlVh-32IY;
	Mon, 27 Oct 2025 11:31:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLRk-0000000DlV9-20wq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 11:31:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D9AC169E;
	Mon, 27 Oct 2025 04:31:22 -0700 (PDT)
Received: from [10.57.67.85] (unknown [10.57.67.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 262D53F673;
	Mon, 27 Oct 2025 04:31:27 -0700 (PDT)
Message-ID: <8304f4b3-3c17-4ecc-b1f1-528941e32b56@arm.com>
Date: Mon, 27 Oct 2025 11:31:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/11] coresight: etm4x: Ensure context synchronization
 is not ignored
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
References: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
 <20251024-arm_coresight_power_management_fix-v4-5-690e69ae6977@arm.com>
 <503e673c-441b-46dc-89d0-fb54ac81ec60@arm.com>
 <aP9M7W9ufz0NGt80@e129823.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aP9M7W9ufz0NGt80@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_043132_554966_B7CD3702 
X-CRM114-Status: GOOD (  15.16  )
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

On 27/10/2025 10:43, Yeoreum Yun wrote:
> Hi Suzuki,
>> On 24/10/2025 17:45, Leo Yan wrote:
>>> As recommended in section 4.3.7 "Synchronization of register updates" of
>>> ARM IHI0064H.b, a self-hosted trace analyzer should always executes an
>>> ISB instruction after programming the trace unit registers.
>>>
>>> An ISB works as a context synchronization event; a DSB is not required.
>>> Removes the redundant barrier in the enabling flow.
>>
>> It is required for MMIO based instances and must be retained.
> 
> I think it seems fine. since the the etm4x device mmio is mapped as
> Device-nGnRE and according to the section Leo mention:
> 
>    Synchronization when using the memory-mapped interface
>    ..
>    When disabling or enabling the trace unit, the trace analyzer must poll TRCSTATR to check the trace unit is either
>    idle or not idle, as described in Use of the trace unit main enable bit on page 4-169:
>      • When the memory is marked as Device-nGnRE or stronger.
>        — Write to enable or disable the trace unit.
>        — Poll TRCSTATR to ensure the previous write has completed.
>        — Execute an ISB operation.
> 
> Therefore, we can omit the dsb in here.

You are right, to be precise, as long as we quote the following, I am fine.


Section 4.3.7, Synchronization when using the memory-mapped interface -

When using the memory-mapped interface to program the trace unit, the 
trace analyzer must ensure that writes have completed, to ensure that 
the trace unit is fully programmed and either enabled or disabled.

• If the memory marked is as Device-nGnRE or stronger, read back the 
value of any register in the trace unit. This relies on peripheral 
coherence order defined in the Arm architecture.


Suzuki


> 
> [...]
> 
> Thanks.
> 
> --
> Sincerely,
> Yeoreum Yun



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626DFC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 07:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLAIrt0dbSaCg5u89f/dqe/c3es1MhLcmB9sSUfkDns=; b=ljXmjP5M0ARxbElL2+cT8eDxdo
	mcvOZQi/w+p0/FolCHv2XpuQa9dFrViLDZkknAx3KuTrcoLwOqMHwe69gIDU1zB2AMwuEtArW1ou0
	i/SpblhJHWG+PTQvLW/yvCWLP+otDJuf+xMD5gTUtouIKjn23r98h00v1c5lBl4Kd7cCdPDH2WL5P
	3TyHwr90xreCpZu9+slirPW8OS9WEqSGwgm7iARaDOnKO5FGX+UI2S0b47b5umGa5VTMKhN81t3lr
	r/sUvDzbk4IFqJNAVJ14i9zp4Z6hmTBf22/jEg97WS6JEv1X0qA7vyK+qMPraU6ONcT46uksMTAn1
	U/Ttrgjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHcT-00000002CxJ-0Xtq;
	Fri, 08 Aug 2025 07:34:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHMK-00000002AnG-0AGK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 07:17:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77C2E16F8;
	Fri,  8 Aug 2025 00:17:39 -0700 (PDT)
Received: from [10.57.5.99] (unknown [10.57.5.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38D8F3F673;
	Fri,  8 Aug 2025 00:17:42 -0700 (PDT)
Message-ID: <b7318d03-7138-4fbb-8c83-6368928d465d@arm.com>
Date: Fri, 8 Aug 2025 08:17:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 27/36] arm_mpam: Allow configuration to be applied and
 restored during cpu online
To: Fenghua Yu <fenghuay@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
 Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-28-james.morse@arm.com>
 <4778e89f-0b94-441e-947a-dfc9839b250b@nvidia.com>
Content-Language: en-US
From: James Morse <james.morse@arm.com>
In-Reply-To: <4778e89f-0b94-441e-947a-dfc9839b250b@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_001748_121733_46AC1189 
X-CRM114-Status: GOOD (  16.06  )
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

Hi Fenghua,

On 04/08/2025 17:39, Fenghua Yu wrote:
> On 7/11/25 11:36, James Morse wrote:
>> When CPUs come online the original configuration should be restored.
>> Once the maximum partid is known, allocate an configuration array for
>> each component, and reprogram each RIS configuration from this.
>>
>> The MPAM spec describes how multiple controls can interact. To prevent
>> this happening by accident, always reset controls that don't have a
>> valid configuration. This allows the same helper to be used for
>> configuration and reset.

>> diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/
>> mpam_devices.c
>> index bb3695eb84e9..f3ecfda265d2 100644
>> --- a/drivers/platform/arm64/mpam/mpam_devices.c
>> +++ b/drivers/platform/arm64/mpam/mpam_devices.c>>   @@ -909,51 +913,90 @@ static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg,
>> +/* Call with MSC lock held */
>> +static int mpam_reprogram_ris(void *_arg)
>> +{
>> +    u16 partid, partid_max;
>> +    struct reprogram_ris *arg = _arg;
>> +    struct mpam_msc_ris *ris = arg->ris;
>> +    struct mpam_config *cfg = arg->cfg;
>> +
>> +    if (ris->in_reset_state)
>> +        return 0;
>> +
>> +    spin_lock(&partid_max_lock);
>> +    partid_max = mpam_partid_max;
> partid_max is not used after the assignment.
>> +    spin_unlock(&partid_max_lock);
> 
> Doesn't make sense to lock protect a local variable partid_max which is not used any way.
> 
> [SNIP]

Because you cut the user out:
| 	for (partid = 0; partid <= partid_max; partid++)
|		mpam_reprogram_ris_partid(ris, partid, cfg);
|
|	return 0;
| }

mpam_reprogram_ris() needs to snapshot the value because it can be called via mpam_reset_msc() -
which does run before mpam_enable_once(). This can race with mpam_register_requestor(), but the
race can only reduce partid_max, all the MSC are guaranteed to support at least the original value.

Taking the lock is so you don't get a torn value which is larger than the original value.


Thanks,

James


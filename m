Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC575C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0Cmq6MdhqtQEr5Yu8exUTR0bKn4Kww3wGhBLbVQ7jk=; b=Iy2t35a9KrwhT+Y8jmDmA03O6f
	iW0QzuHF4htSXFoEI7npr1yU4G7409/O+GdnW9xtPirTAKolnKtkvhVm1op/IfxDuaVwF5/eh/EN0
	VrbFpXJl2uapzuyrJcpdFHl6gD+CkyOghF90dZSVXl9l7r1obd3lN0k2nJULbrE5u+thgoo5MhF9D
	TFJR52wP537TcTuvrVZCseil7xygbak4Cdt+j27mDp311kGuUbrqpphmcVeliQlWX8jqmhgmFFcVZ
	2MSYx/YK+plDwOUC2ydvnX0WWaeDLIHyD5floxiJAC1ykjb0Mgy8J6t5S7YH4HBNR4HKNxVAUDt9J
	R8ffgRPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiqj-0000000G4D5-0vhG;
	Wed, 06 Aug 2025 18:26:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiXz-0000000G1cV-2BgM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 18:07:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0745819F0;
	Wed,  6 Aug 2025 11:07:23 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39D283F738;
	Wed,  6 Aug 2025 11:07:27 -0700 (PDT)
Message-ID: <2164fca1-0a78-4c72-b93b-2b95d5f41e08@arm.com>
Date: Wed, 6 Aug 2025 19:07:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 17/36] arm_mpam: Add cpuhp callbacks to probe MSC
 hardware
To: Baisheng Gao <baisheng.gao@unisoc.com>
Cc: amitsinght@marvell.com, baolin.wang@linux.alibaba.com,
 ben.horgan@arm.com, bobo.shaobowang@huawei.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 kobak@nvidia.com, lcherian@marvell.com, lecopzerc@nvidia.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, quic_jiles@quicinc.com, rex.nie@jaguarmicro.com,
 robh@kernel.org, rohit.mathew@arm.com, scott@os.amperecomputing.com,
 sdonthineni@nvidia.com, shameerali.kolothum.thodi@huawei.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, zengheng4@huawei.com,
 hao_hao.wang@unisoc.com
References: <20250711183648.30766-18-james.morse@arm.com>
 <20250729061127.206-1-baisheng.gao@unisoc.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250729061127.206-1-baisheng.gao@unisoc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_110731_601486_4AEEF4FF 
X-CRM114-Status: GOOD (  16.33  )
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

Hi Baisheng,

On 29/07/2025 07:11, Baisheng Gao wrote:
>> Because an MSC can only by accessed from the CPUs in its cpu-affinity
>> set we need to be running on one of those CPUs to probe the MSC
>> hardware.
>>
>> Do this work in the cpuhp callback. Probing the hardware will only
>> happen before MPAM is enabled, walk all the MSCs and probe those we can
>> reach that haven't already been probed.
>>
>> Later once MPAM is enabled, this cpuhp callback will be replaced by
>> one that avoids the global list.
>>
>> Enabling a static key will also take the cpuhp lock, so can't be done
>> from the cpuhp callback. Whenever a new MSC has been probed schedule
>> work to test if all the MSCs have now been probed.


>> diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
>> index 0d6d5180903b..89434ae3efa6 100644
>> --- a/drivers/platform/arm64/mpam/mpam_devices.c
>> +++ b/drivers/platform/arm64/mpam/mpam_devices.c
>> @@ -513,9 +541,84 @@ int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>> +static void mpam_register_cpuhp_callbacks(int (*online)(unsigned int online),
>> +					  int (*offline)(unsigned int offline))
>> +{
>> +	mutex_lock(&mpam_cpuhp_state_lock);
>> +	if (mpam_cpuhp_state) {
>> +		cpuhp_remove_state(mpam_cpuhp_state);
>> +		mpam_cpuhp_state = 0;
>> +	}
>> +
>> +	mpam_cpuhp_state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "mpam:online",
>> +					     online, offline);
>> +	if (mpam_cpuhp_state <= 0) {
>> +		pr_err("Failed to register cpuhp callbacks");
>> +		mpam_cpuhp_state = 0;
>> +	}
>> +	mutex_unlock(&mpam_cpuhp_state_lock);
>>  }
>>  
>>  static int mpam_dt_count_msc(void)

>> @@ -797,6 +900,46 @@ static struct platform_driver mpam_msc_driver = {
>> +static void mpam_enable_once(void)
>> +{
>> +	mutex_lock(&mpam_cpuhp_state_lock);
>> +	cpuhp_remove_state(mpam_cpuhp_state);
>> +	mpam_cpuhp_state = 0;
>> +	mutex_unlock(&mpam_cpuhp_state_lock);

> Deleting the above 4 lines?
> The mpam_cpuhp_state will be removed firstly in mpam_register_cpuhp_callbacks
> if the mpam_cpuhp_state isn't 0.

Yup - this is a pointless appendage because of the way the code evolved!
Thanks for catching it


James

>> +
>> +	mpam_register_cpuhp_callbacks(mpam_cpu_online, mpam_cpu_offline);
>> +
>> +	pr_info("MPAM enabled\n");
>> +}



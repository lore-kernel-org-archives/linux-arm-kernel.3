Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F58CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 12:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07N3HrrnfmVLmIfo5KrRRGyAn1RrYES9XOvAqELZQQI=; b=p5ZqjT7M8np68uO6w4rialHkxA
	gOAszgVy/8Fh9ZUY5FlQE+/OqDPbsftZVKDv1a1V5fKW2pEVBw9UAvehgwtGeAm8wgG4AJh8uuVcm
	oL484n5FZNluXY3J8ZK4jPc0Lt+Sh3lSAJR9vApqeYMtsBLb+WPhQWVDjgMhMP0F2iWOFA223OXYa
	qi1CpLuqWKEIBg5gZWV8ptg+sxq36lBqvuyKVYbXZS7iEi0IxAGlnSd/13+1PsbzDBLy73USYuRjo
	PmO1i8LYbVtRQrpVVrjnarkFcz/rBwJfGM7NXkAYXavCFYl/uUt9agxJTt+7JzFbSe1ZbnH0gGKhy
	KqSfkupw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWjw-00000003V1Q-3Enu;
	Tue, 29 Sep 2026 12:15:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWjv-00000003V0s-215Z
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 12:15:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=07N3HrrnfmVLmIfo5KrRRGyAn1RrYES9XOvAqELZQQI=; b=WMrzMrmyj6SLuB7P6i+FHA2hNU
	JUNxnO6ysDaVJXuBQ/ObRhSpgYPJj8tzu46lpEPVhVAv5KHqvstnrOzNe2cNX+mAKnqNm13A/anUD
	ZPCK+tBK6S8CCwFpCw47LxMKki9OPtMTCZbZqEpbjwqfBjCSQ0nxRhrFdobqkztYH3LDrdl/r7Mgb
	IAi8Hx0RPS00y9fnhPjF+0vjQ9+D2MaA8RTq3+9wP1GGyV3BMNHRIHfcePxaBB/EB71E9SH2XHaIZ
	2jcoh1WQy6taBEHfGzumKi9QVSns/VktxqVm/0CiqI8ffUFl1ZqQGUim+pSYOf7VWZHVY1TeDdJWQ
	em8NmeUA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBWjo-00000002azb-3r3m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 12:15:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5ACD51476;
	Tue, 29 Sep 2026 05:15:06 -0700 (PDT)
Received: from [10.57.12.116] (unknown [10.57.12.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AED7C3F86F;
	Tue, 29 Sep 2026 05:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790684109; bh=fKf+MQsHsTqBw9S5I/sRTtOpEHY+jJc4iJgimZH5RsE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HITdtAq75oNRx3Z63AmHRvFNEG8MwjXFTdQtZ3bjgWz/LK4LCf4OIkGmWMsCOo1Ts
	 JJOmZHqnkldvAiQ1u+nMzemAH7XOOQKCu2EZYx0gsnynacSO5dkak55hXOU92mhwbu
	 +a0kGk+dH0m1Cda4aM9JU+UuS26n1xynIZCw2vPI=
Message-ID: <cabdfbaf-92dd-4873-9993-c65f6f55f913@arm.com>
Date: Tue, 29 Sep 2026 13:15:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 7/7] firmware: arm_rmm: Add wrappers for Realm related
 RMI commands
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-8-suzuki.poulose@arm.com> <arZhdzjoOejKdAvp@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <arZhdzjoOejKdAvp@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_131515_646335_B1718A09 
X-CRM114-Status: GOOD (  13.06  )
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

On 25/09/2026 12:56, Catalin Marinas wrote:
> On Thu, Sep 24, 2026 at 02:52:01PM +0100, Suzuki K Poulose wrote:
>> + * rmi_rec_create() - Create a REC
>> + * @rd: PA of the RD
>> + * @rec: PA of the target REC
>> + * @params: PA of REC parameters
>> + * @sro: Allocated SRO context to be used
>> + *
>> + * Create a REC using the parameters specified in the struct rec_params pointed
>> + * to by @params.
>> + *
>> + * Return: 0 on success, positive RMI result code or negative Linux error code
>> + */
>> +static inline long rmi_rec_create(unsigned long rd,
>> +				  unsigned long rec,
>> +				  unsigned long params,
>> +				  struct rmi_sro_state *sro)
>> +{
>> +	long ret;
>> +
>> +	sro->addr_count = 0;
>> +	sro->regs = (struct arm_smccc_1_2_regs) {
>> +		SMC_RMI_REC_CREATE, rd, rec, params
>> +	};
>> +	ret = rmi_sro_memxfer_execute(sro, GFP_KERNEL);
>> +	rmi_sro_free(sro);
>> +
>> +	return ret;
>> +}
> 
> Nit: isn't this just open-coding rmi_sro_memxfer_cmd()?

Ack, fixed.

Suzuki

> 



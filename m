Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2695C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poDmI9dqjAABZmR5NmRM0o6e7zCFjaRb8/fCTmvstxc=; b=y/ysavzTlGTxcVDO2VeDou/09T
	b52nvj1sSFkO5SXyXG+B8ENNhKCoLBtva0evL/+KxOTh2YE8X7K0rjdeebXR3b6/ahOxYeNm7qTXe
	Z+ZTrhS44kecH7a/ZWeFqycFwnaldg45nBIXg14VYYRt1BeSy1NMIa//luhetL1z8QGFtWGpAVR5W
	PFqlP86z8Z7/vpcdCdHtymvpwS3ed4yiHtL6nQBdiT+GgnyKJ6YaOjCgWxDrl97Jd/X9SJNQ+Avot
	ujvoA+ZzbYkve1BQf1yKUHsLm2ENnYAdV8zPBEwK+uw+fVlxUwqnHOVNW9YeBSs5lPd6KWMd/vgFO
	G94evsGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53By-0000000H3Sl-0sg7;
	Fri, 11 Sep 2026 15:29:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53Bt-0000000H3R3-1hvH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:29:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30BB516A3;
	Fri, 11 Sep 2026 08:29:18 -0700 (PDT)
Received: from [10.0.129.245] (unknown [10.0.129.245])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E56723F8C6;
	Fri, 11 Sep 2026 08:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789140561; bh=/xb0Nb16G9yyks+ml9kb/BhM51LigV9IcfIjYK9Rc4E=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=p3fqa3VdOpYwaS6o072jyxRYETcjmQ17Q9gq4SbokoxOYB4jszQP5QyKIJNk9qBUf
	 N7TzV2DrG9fefESFhJVXKTizxlIGa7ubjd7dXFEs5w/ZSuhRionnydRPs08XlUjDEY
	 94VHRvvW3Xm9TflxDf6eS8Hz6n50gvndA0MZoJAU=
Message-ID: <89da8c52-9dd5-4ca3-81c6-1bf390029dc4@arm.com>
Date: Fri, 11 Sep 2026 16:29:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 4/7] firmware: arm_rmm: Add support for SRO
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
 <20260907095942.1140734-5-suzuki.poulose@arm.com>
 <50d19bb3-6a08-462a-9c01-2eac8a8e286e@redhat.com>
 <603b2de8-7636-4eb8-a378-21be986f4e44@arm.com>
In-Reply-To: <603b2de8-7636-4eb8-a378-21be986f4e44@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_082925_592612_54B39583 
X-CRM114-Status: GOOD (  11.62  )
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

On 10/09/2026 10:51, Suzuki K Poulose wrote:
> Hi Gavin
> 
> Thank you for the the review, much appreciated. Responses inline.
> 
> 
> On 09/09/2026 05:10, Gavin Shan wrote:
>> Hi Suzuki,
>
>>
>>> +
>>> +    sro->addr_count = 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(rmi_sro_free);
>>> +
>>> +long rmi_sro_memxfer_execute(struct rmi_sro_state *sro, gfp_t gfp)
>>> +{
>>> +    unsigned long sro_handle;
>>> +    struct arm_smccc_1_2_regs *regs = &sro->regs;
>>> +    bool cancelled = false;
>>> +
>>> +    rmi_smccc_invoke(regs, regs);
>>> +
>>> +    sro_handle = regs->a1;
>>> +
>>> +    while (RMI_RETURN_STATUS(regs->a0) == RMI_INCOMPLETE) {
>>> +        bool can_cancel = RMI_RETURN_CAN_CANCEL(regs->a0);
>>> +        int ret = 0;
>>> +
>>
>> Strictly speaking, we need to refresh the SRO handle after every RMI 
>> call.
>>
>>          bool can_cancel = RMI_RETURN_CAN_CANCEL(regs->a0);
>>          unsigned long sro_handle = regs->a1;
>>          int ret = 0;
>>
> 
> Ack for both instances

This is not correct. e.g., after RMI_OP_MEM_DONATE and 
RMI_OP_MEM_RECLAIM, the regs->a1 is the number of granules consumed or 
reclaimed. The SRO handle once provided by an SRO triggering operation,
is invalidated by the RMI_OP_CONTINUE() running to completion.
i.e., RMI_OP_CONTINUE either completes with RMI_SUCCESS

OR

completes with a status other than RMI_BUSY or RMI_INCOMPLETE.

Thanks
Suzuki


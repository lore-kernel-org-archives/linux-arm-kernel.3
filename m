Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CD2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERXtlzEWgEsinB9Zi5xLPPi02rhEC6xjhkEEB6f/SJQ=; b=RjdFaeOCkAKWYFUGK7H6U0rmx8
	jew3J+6L+M6UBwkkbs2MokiLVXgMforhOXTE6AqONj8ujsGOTLBagQRjvuXBsGirgSdLOSW2c/eZv
	h9Xj9whP6pxVdR0Hipvqh1kv4nc26JGWcAAInUvKxNw8N3IVqHjI1eF42Ccy2EAwApb0S+dmJ5aWW
	6aAI69UkWBO05BML1LA0/DtUdIB13tgLOwhwpWYpMCVkSVYuQ6++YGGQESKUzunBiqOolRMYscQZU
	r7ZmRja3rtE7TOAr9R/Z2V2uf/OvDq7jGR3q1lYbKFjZYLmRUtqaRGUKBNnmd3f16XopX14ErHEnP
	jOqysthw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZf9-0000000BU1c-3bjm;
	Tue, 14 Jul 2026 09:42:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZf7-0000000BU1J-1eoA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:42:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2749339;
	Tue, 14 Jul 2026 02:42:43 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 489693F93E;
	Tue, 14 Jul 2026 02:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784022167; bh=ylNE0p+vP/URJswGo08Ck/ZPP2GHVw7Gj8Qa8p1x8pk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wpvkvb3SGvbX1ibnsaSCP2lIzKIqPceDRe6TEiCPFNVo6iY0liDOpW8wHzStJuURI
	 gkc88zuxPiq3Ka3Dm3q1tLwAFrq8Jo5g0r9a5Fc32QwiHl5xio64gwC3UITmGmZQsx
	 paCUTW1F8wot8TMMPcv9BdfgK+3giHkAIVtUzB6Y=
Message-ID: <facc6c75-758d-4790-8c1f-338b9a1c0a11@arm.com>
Date: Tue, 14 Jul 2026 10:42:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/36] arm64: hibernate: mask DAIF before restoring
 hibernated kernel
To: "Liao, Chang" <liaochang1@huawei.com>,
 linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, ruanjinjie@huawei.com,
 stable@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-4-vladimir.murzin@arm.com>
 <2410686c-bc58-44a0-9f71-ec79791daaa6@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <2410686c-bc58-44a0-9f71-ec79791daaa6@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_024249_500706_7EA6A88C 
X-CRM114-Status: UNSURE (   8.96  )
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

On 7/10/26 04:40, Liao, Chang wrote:
>> @@ -465,9 +466,21 @@ int __nocfi swsusp_arch_resume(void)
>>  	if (el2_reset_needed())
>>  		__hyp_set_vectors(el2_vectors);
>>  
>> +	/*
>> +	 * It is necessary to mask all DAIF exceptions here as:
>> +	 *
>> +	 * - The copy of swsusp_arch_suspend_exit() in the hibernation
>> +	 *   text cannot handle taking any exceptions.
>> +	 *
>> +	 * - The suspended kernel masked all DAIF exceptions in
>> +	 *   swsusp_arch_resume(), and expects to be re-entered in the
>> +	 *   same state : with all DAIF exceptions masked.
>> +	 */
>> +	flags = local_daif_save();
>>  	hibernate_exit(virt_to_phys(tmp_pg_dir), resume_hdr.ttbr1_el1,
>>  		       resume_hdr.reenter_kernel, restore_pblist,
>>  		       resume_hdr.__hyp_stub_vectors, virt_to_phys(zero_page));
>> +	local_daif_restore(flags);
> As Jinjie said, the resumed kernel never return from hibernate_exit(). If that's
> the case, it seems better to place unreachable() rather than local_daif_restore(),
> would you agree?

Cannot disagree :) I'll fix that in the next iteration.

Cheers
Vladimir


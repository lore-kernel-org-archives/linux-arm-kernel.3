Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBC8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rg2prOaCx2jJwuekcepCOE07+ORXbtQWnMuXigIbEOg=; b=vfb/+uX8h5Tso5Ur0KjldZMkZW
	FwiUBNO9XgNwzX8UfAJbbi+98NiaKBb/nmoLqG0Br5yhArz+KaFnjyqW98oolbiTeIaLGBGGkiPeM
	wJwUQRFiZPABacVNJnFB+JSG315vBMVpq5KIBQa9HQ7MJml6aMwH2aRaJfoM+LLPYbODzRsHeKqqy
	543pXZRWANazCMHuozVjrLXM866G1FuXnWkyMmiztj3elAh0wBTA7UNgcFsFjxZhVhjB9Bi7rzCRY
	KF63tH92DBa1SQf3bgYtXm6az+IcIQ2r9hYeNRutyPb6WDu8jbiCdfGrbxdNTEFVukjLFIAJs8LRZ
	U11EeNcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1Fn-0000000EUUW-0YI6;
	Tue, 07 Jul 2026 08:34:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1Fk-0000000EUU3-3JfD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 08:34:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 734CC1BCA;
	Tue,  7 Jul 2026 01:33:58 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D01C83F85F;
	Tue,  7 Jul 2026 01:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783413242; bh=LhHiLpPGD0VGhAPhlgwMkZeOIR/H2PToTxiyxxNPCAc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EY/3vUZyyA8poxneYJmQU4rSm7GIPeOvAStPuqoJoSmiKS2H2rfVeEVzTXkvbA75z
	 a0QbgxFmvk6flT57KE6oqQ5LOgW8EFah3i97Q7+kQyzRWrEyOCgIAg+JLjqKeVNCWU
	 FQr2SV6zNS1tpQmBUtFdngtOKMyQry0Aiy3RIy5A=
Message-ID: <c3550c4a-a962-4dab-aa19-9f62e7aaf9d8@arm.com>
Date: Tue, 7 Jul 2026 09:33:59 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v4 1/3] x86,fs/resctrl: Add resctrl_arch_preconvert_bw()
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: james.morse@arm.com, fenghuay@nvidia.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net,
 x86@kernel.org, linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260706160639.2136674-1-ben.horgan@arm.com>
 <20260706160639.2136674-2-ben.horgan@arm.com>
 <643be9eb-06ea-4811-a879-ca014d09742e@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <643be9eb-06ea-4811-a879-ca014d09742e@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_013404_881722_A267A187 
X-CRM114-Status: GOOD (  16.42  )
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

Hi Reinette,

On 7/6/26 22:33, Reinette Chatre wrote:
> Hi Ben,
> 
> On 7/6/26 9:06 AM, Ben Horgan wrote:
>> On MPAM systems the rounding behaviour of the MBA control would be improved
>> if the rounding in the fs/resctrl code is removed but this is not the
>> case for x86. To allow any rounding or conversion of the bandwidth value
>> provided by the user to be specified by the arch code a new arch hook is
>> required.
>>
>> Introduce resctrl_arch_preconvert_bw(), and add its x86 implementation.
>> This is currently unused in resctrl but when plumbed in it will replace the
>> call to roundup() in bw_validate().
>>
>> Signed-off-by: Dave Martin <dave.martin@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> 
> This chain does not look right. The first SOB is expected to be from the
> author but the patch does not have Dave as author. 

Ah.. I've changed the author of this and the last patch to be Dave as he
wrote the code.

Thanks,

Ben

> 
>> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
>> ---
> 
> Reinette
> 



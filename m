Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF75C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 11:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIEZ6Eb3p7RktQKX67dPkNYTPHwJ/efBXlo8c7Lu8uo=; b=UTKmfezmjsiKjFqRG2qp9+WQ2U
	/reQAUY7Tcd0OGi8uD2/ipS4L6XnLKftcPAri6M7lQD9eWJdd2iShyinjeQGpEH1YEtGNkQpenZRf
	WxEJBM4Tnak4PqbCpcP5js+0nac4G9F3GgkcTBVUElsksbsWixtLcBA7yLSWgYHiACOrCS2VnZHqQ
	Ar9MdekbkyiIqhEB9CbnbggBT1jYRC0ZBrL8pEN2xSERrOqX8bH7VVr1nIZHRydsINbBt7MLjCTnk
	BiwvF283cc80M9iEHXIu7AVkLqQi+IGMsIvzFiNZwN2bhouQd0QZQkmRGf22Ez+ow3CrzwYnsunKQ
	2rci89nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9N7M-00000006491-0Mp0;
	Mon, 28 Apr 2025 11:57:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MdQ-00000005x9J-1Hgs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 11:26:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF09C1516;
	Mon, 28 Apr 2025 04:26:42 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC3053F673;
	Mon, 28 Apr 2025 04:26:47 -0700 (PDT)
Message-ID: <f44eabb4-9b5e-479b-b78b-e9c918b3798c@arm.com>
Date: Mon, 28 Apr 2025 12:26:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] KVM: arm64: Make MTE_frac masking conditional on
 MTE capability
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kselftest@vger.kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, shuah@kernel.org
References: <20250414124059.1938303-1-ben.horgan@arm.com>
 <20250414124059.1938303-3-ben.horgan@arm.com> <86bjshjz5x.wl-maz@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <86bjshjz5x.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_042652_395961_B1FCE7C1 
X-CRM114-Status: GOOD (  18.22  )
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

Hi Marc,

On 4/27/25 18:24, Marc Zyngier wrote:
> On Mon, 14 Apr 2025 13:40:58 +0100,
> Ben Horgan <ben.horgan@arm.com> wrote:
>> [...]
>> +	/*
>> +	 * Previously MTE_frac was hidden from guest. However, if the
>> +	 * hardware supports MTE2 but not MTE_ASYM_FAULT then a value
>> +	 * of 0 for this field indicates that the hardware supports
>> +	 * MTE_ASYNC. Whereas, 0xf indicates MTE_ASYNC is not supported.
>> +	 *
>> +	 * As KVM must accept values from KVM provided by user-space,
>> +	 * when ID_AA64PFR1_EL1.MTE is 2 allow user-space to set
>> +	 * ID_AA64PFR1_EL1.MTE_frac to 0. However, ignore it to avoid
>> +	 * incorrectly claiming hardware support for MTE_ASYNC in the
>> +	 * guest.
>> +	 */
>> +
>> +	if (mte == ID_AA64PFR1_EL1_MTE_MTE2 &&
> 
> The spec says that MTE_frac is valid if ID_AA64PFR1_EL1.MTE >= 0b0010.
> Not strictly equal to 0b0010 (which represents MTE2). Crucially, MTE3
> should receive the same treatment.

This is specific to MTE2 as when MTE3 is supported MTE_ASYM_FAULT is 
also supported and when MTE_ASYM_FAULT is supported the spec says 
MTE_frac is 0.
> 
>> +	    user_mte_frac == ID_AA64PFR1_EL1_MTE_frac_ASYNC) {
>> +		user_val &= ~ID_AA64PFR1_EL1_MTE_frac_MASK;
>> +		user_val |= hw_val & ID_AA64PFR1_EL1_MTE_frac_MASK;
> 
> This means you are unconditionally propagating what the HW supports,
> which feels dodgy, specially considering that we don't know how
> MTE_frac is going to evolve in the future.
> 
> I think you should limit the fix to the exact case we're mitigating
> here, not blindly overwrite the guest's view with the HW's capability.

Sure, better safe than sorry. I can update the if condition to the below.

u8 hw_mte_frac = SYS_FIELD_GET(ID_AA64PFR1_EL1, MTE_frac, hw_val);
...
if (mte == ID_AA64PFR1_EL1_MTE_MTE2 &&
     hw_mte_frac == ID_AA64PFR1_EL1_MTE_frac_NI &&
     user_mte_frac == ID_AA64PFR1_EL1_MTE_frac_ASYNC)

> 
> Thanks,
> 
> 	M.
> 

Thanks,

Ben



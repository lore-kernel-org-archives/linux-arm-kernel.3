Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658F4C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 22:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDLiz8FMfzrfsb7Xo3AVv+D+VOndCOPqvNkFpYC+ujA=; b=u8I9odiYo+v+M6V0M9AQHT76Hf
	uL8ljKMMSW/KflCsNEz1qQ9ZqCdaDMvcKJEGfYuNpFH76dHWmyi8mCEi779YIXJtPjiRSLxU4pSSZ
	SFmBjgdNCegLuI1wzkrjiTxrvmXxWtBgF6nd9dRQrINlVbmL3sQA2cUOBMvmGMraQnSazqhixjJ5p
	E81VaGgXT3fPaGxgKEwtzhVUS92Lm0o1ki5j0SNe8tNpS27a8kMIJ/24wscRyWzy/68Op6UsqEZYB
	Wqp+GpK3lHdGaPekHaK55b04JUIwgOI6XVoU4sCFuw5hiIKUS2j6CUU13ISeSs7eVlCFUo0LdIM5R
	r0c8a7vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udzH0-00000000pZx-3txj;
	Mon, 21 Jul 2025 22:46:18 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udzEY-00000000pTX-2EzQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 22:43:47 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e8bd171826cso4430890276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 15:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1753137825; x=1753742625; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YDLiz8FMfzrfsb7Xo3AVv+D+VOndCOPqvNkFpYC+ujA=;
        b=AeOF1T3/wYeupcw/GnFw2Ei5x52YKBbOUkhuYKIT17vmouQKaTNLzAFSA5nilLsRAy
         kX5Ife1/EToUBjRifDhpMgi7z5UZBZ8bGSBfUwk30xqTDjpo3bqXtwDRt34U3ThaKl7x
         g7TL1Mjk21IirPF/sVN7yuuLIBl+SU4YD3COfR+PQDuOAhft4mEE1+JPNpVVqX4BGzi5
         4tVyfuyzNkz+zhtin/a3IXYMSmWKH4Ix2ipyuDAThxXZeVRstVYMalBMp+OYzOl216D6
         V6nyHDWIB6EkkmTw8hN6ZmRPpD0hodRIxyQBbp3rMXQGA3MYzPun1IHe0OLxeN7sRbLR
         LSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753137825; x=1753742625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YDLiz8FMfzrfsb7Xo3AVv+D+VOndCOPqvNkFpYC+ujA=;
        b=IPN/nAJKG3Ml0BX2BSdvC+lMLhYgu3HJ+FxbUwo9Bk3L2aW/+WA63K4c5KxXeNIpJQ
         8DuGPTwJjGvIu6PJeTdlvY0C1jyxMh0hpiII5k7RfZGfSYn/dlNV2ruXyf3dHOt0BlgC
         ri9MePzLU4Jtekdv+ZNrQBLic290t63jFDK3bMqsLXgnGzEVRNCDEdhQ1ufKTuJFGl0O
         xPshz1DArIhJF481jbS5vvBxw4CMjXYeRkUgiSlaAmN9x/mNeV4IYlHJRfjWByPgAlJ1
         nXsZ2y+JYdXN+XqbODwDAhHa0w1NXSclIHSspKeHu/grF/fKDcRtJF3tsc4IzZgw2ys6
         yEGg==
X-Forwarded-Encrypted: i=1; AJvYcCX1MFWVd301gxjeIIfYbnHFNMCMZIBQ+8kphXuz7LlCpI0RT/ANAFl+gFjsedx+FhQowHly8w81KdMHIRQ2HLp8@lists.infradead.org
X-Gm-Message-State: AOJu0YyhQC6BQU0kqgsLKHWCLCELhbbUL832vdZ6ceUH3CL0cxEb0Jhy
	825FTXmIZoITYaPrSorLI1PnY8skVDhhZWRuRRH451YW7hvoopxy/npXa3yvD/aF2hk=
X-Gm-Gg: ASbGncvZBkw/qiIXWVbCPJhFq9V8pONFL7ClxTVTN2A7CBLhl09K5iDPDxEzbffSAhb
	2Zz81YcPAaWzLb5LLR755L46HQljdS2pykt4gCju+fP17IcIwX2/GNuTJSkqoufkNo//ryvU/r6
	cMfKYyjc2zxpsHUHjzUThDHIfaDZ/mtXyEhReoMUGPbXmx4mSQUORWKZwe7LRO4LQyifGIMe312
	WsPniysKtZnmWzdgm4ApKrmCyyG/INwjDgUNOLqUW6au7z9V3AYnY+u9ZaZazjQGagLKQk/odA4
	hHP1f9iX+yGvJe1f84acagSrtMUORTg7taVa6ps6V6ATEw+Or+3wy19K7EcXHutOFXbumBmx8vr
	swaqxAGGqdeh86fObBYnJ6cjJ/Q==
X-Google-Smtp-Source: AGHT+IEpyRag75hc7wIz2NAkH4ib5Oe2/59jHMeOSeAr7Vhqgp5XGFfjMhc7CtftjhemnWwEjA2myQ==
X-Received: by 2002:a05:6902:2190:b0:e87:bdbe:103b with SMTP id 3f1490d57ef6-e8bc2433f8dmr26729859276.5.1753137824850;
        Mon, 21 Jul 2025 15:43:44 -0700 (PDT)
Received: from [10.10.1.14] ([12.9.190.3])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e8d7ce0e246sm2864343276.28.2025.07.21.15.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 15:43:44 -0700 (PDT)
Message-ID: <25ba5929-79c0-40b8-b529-79a37914605d@immunant.com>
Date: Mon, 21 Jul 2025 15:43:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in
 host handler
To: Will Deacon <will@kernel.org>, perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, ahomescu@google.com, armellel@google.com,
 arve@android.com, ayrton@google.com, qperret@google.com,
 sebastianene@google.com, qwandor@google.com
References: <20250701-virtio-msg-ffa-v7-0-995afc3d385e@google.com>
 <20250701-virtio-msg-ffa-v7-5-995afc3d385e@google.com>
 <aHpRvBO864x1vvqP@willie-the-truck>
Content-Language: en-US
From: Per Larsen <perl@immunant.com>
In-Reply-To: <aHpRvBO864x1vvqP@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_154346_818013_D1E208B9 
X-CRM114-Status: GOOD (  25.21  )
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



On 7/18/25 6:53 AM, Will Deacon wrote:
> On Tue, Jul 01, 2025 at 10:06:38PM +0000, Per Larsen via B4 Relay wrote:
>> From: Per Larsen <perlarsen@google.com>
>>
>> FF-A 1.2 adds the DIRECT_REQ2 messaging interface which is similar to
>> the existing FFA_MSG_SEND_DIRECT_{REQ,RESP} functions except that it
>> uses the SMC calling convention v1.2 which allows calls to use x4-x17 as
>> argument and return registers. Add support for FFA_MSG_SEND_DIRECT_REQ2
>> in the host ffa handler.
>>
>> Signed-off-by: Per Larsen <perlarsen@google.com>
>> ---
>>   arch/arm64/kvm/hyp/nvhe/ffa.c | 24 +++++++++++++++++++++++-
>>   include/linux/arm_ffa.h       |  2 ++
>>   2 files changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
>> index 79d834120a3f3d26e17e9170c60012b60c6f5a5e..21225988a9365219ccfd69e8e599d7403b5cdf05 100644
>> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
>> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
>> @@ -679,7 +679,6 @@ static bool ffa_call_supported(u64 func_id)
>>   	case FFA_NOTIFICATION_GET:
>>   	case FFA_NOTIFICATION_INFO_GET:
>>   	/* Optional interfaces added in FF-A 1.2 */
>> -	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
> 
> I think that's the only change needed. In fact, maybe just don't add it
> in the earlier patch?
> 
>>   	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
>>   	case FFA_CONSOLE_LOG:			/* Optional per 13.1: not in Table 13.1 */
>>   	case FFA_PARTITION_INFO_GET_REGS:	/* Optional for virtual instances per 13.1 */
>> @@ -862,6 +861,22 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
>>   	hyp_spin_unlock(&host_buffers.lock);
>>   }
>>   
>> +static void do_ffa_direct_msg2(struct arm_smccc_1_2_regs *regs,
>> +			       struct kvm_cpu_context *ctxt,
>> +			       u64 vm_handle)
>> +{
>> +	DECLARE_REG(u32, endp, ctxt, 1);
>> +
>> +	struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];
>> +
>> +	if (FIELD_GET(FFA_SRC_ENDPOINT_MASK, endp) != vm_handle) {
>> +		ffa_to_smccc_error(regs, FFA_RET_INVALID_PARAMETERS);
>> +		return;
>> +	}
> 
> Why do we care about checking the src id? We don't check that for
> FFA_MSG_SEND_DIRECT_REQ and I don't think we need to care about it here
> either.
FFA_MSG_SEND_DIRECT_REQ is handled by do_ffa_direct_msg [0] (in the 
android common kernels, I'm not aware of efforts to upstream this).

I patterned the check in do_ffa_direct_msg2 off the checking done in 
do_ffa_direct_msg. I pressume your reasoning is that this check can
never fail since we pass in HOST_FFA_ID in kvm_host_ffa_handler. My
thinking was that we do need to validate the source ID once we start
using this function for requests that come from a guest VM. I could
of course add the check in an android-specific patch, WDYT is best?

Also note that since do_ffa_direct_msg was switched to use SMCCC 1.2, I 
think it can handle both FFA_MSG_SEND_DIRECT_REQ and 
FFA_MSG_SEND_DIRECT_REQ2. If you agree, should we upstream 
do_ffa_direct_msg and use it to handle both of these direct requests?

[0] 
https://cs.android.com/android/kernel/superproject/+/common-android16-6.12:common/arch/arm64/kvm/hyp/nvhe/ffa.c;l=1446

Thanks,
Per





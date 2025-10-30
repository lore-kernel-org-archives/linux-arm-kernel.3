Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D5ECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 16:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqNtoyinBX8qcU7mGg+XDQHvMcc/k1G1RSgPd+RXN58=; b=IJgzq/RoFVBxOAMqXqM4gxn+RB
	GBHTX5XrUAwWXCgi5oqgxqyoiTrOD0zbfiUGJa6klcfHFKI1xA+RoUMbaDieV6FeMFULGhdVwucav
	A4THxvTA+aZqoeZu9f2aCaVAGIFjtUSMUOhBcNS4nwrESSmbulz+5d/MRFp8EoPIKi1J9R9vEAtKZ
	W25BL8mTm1q1bi/wYYpgWwXnOO9Cm6SCjmTLrknpPJtb0kh+2PJI2kbeQNqXV9A+D7GN80lG0ZoE+
	INeBtgO243XIHvUAH+hDp1lpj2LfUEnSUZOYFrZFoZxv8KfoAjGZYp5UPo8vwrJVJt88uO7pOHdc3
	bfAhc3Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVMY-00000004RiM-43wA;
	Thu, 30 Oct 2025 16:18:58 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVMW-00000004Rhd-1Ber
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 16:18:57 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5930e30857bso1686754e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 09:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1761841134; x=1762445934; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rqNtoyinBX8qcU7mGg+XDQHvMcc/k1G1RSgPd+RXN58=;
        b=A+Gs6zitzlB30pWJRd5smMhqsWzAOV6gWfmwyi6owmEaIPMhglbfDp0j9DtEY5iaer
         d2dvI62XvwaOJ5bqFdDYgWucBfwzSiyjEcJS3xsvrzv1vaAvFYM1X0mbPi88ufXXw1z9
         xv4qEdDBkzuhTpKOe7zxGW/fhPmPzkwA+TlVtRzeHRuwIO2c29Sv0+cyhxFNIuYivflJ
         IgtjDFC7+Dn4oWFm6OXIscBiOIS5VRXX/dM1rct2MZ92zxJwUza+MSDmFMwfxt6CODhR
         CIIcr48/6zQYoOGqB7/+hRktHGLRin1Gvp03jIdLITMmZ0xp4oyGe+wlmRuid6WsuFuK
         1NGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761841134; x=1762445934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqNtoyinBX8qcU7mGg+XDQHvMcc/k1G1RSgPd+RXN58=;
        b=b7Ine3IOHX0xLgj/puZXh9z1JS938TudK+lRza3GUKohffHmKtJKWsxtx/0a/QPItC
         LAzvO/izLFNeFZYBjvk/d+qb/mrpjgcHE3unx7YZrKcP0CRL9h6wB5Fh+wApKZR1BvM3
         Imiw1c01UhA8X7+nLcxp83KW4T4cql9+3JcGoUJiApG7gWCtUp5mgb+J99sxZJpSAikw
         TpSZnWxbIwiqDfw/uimIBVbFeIopisXJIcR0BnRXmv3+rSoo0A4v6GHjUa3HANDzT3g3
         mbfRN9mb2jSaX+ES1vm8nPJnEf0t5bdiyv+vUHs/XVB5yzKL6Tl3cXb8ONJeZh9IwwxV
         R8Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUobF+8G4W6bkA1zcUUUk2ESKDxXl+ntlI/sbjgDLDyT0EWGTX2pJ3JiDqKdLZxGtP+UAKGKU+Bu38jee/B0Qig@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi/EfiNLCk50myWfy2sT8advjajXmA7ng3TqJK9MrPeio14rrg
	3CyvcnjUjvDajoQQO7bI0QRtSyrxqQ0BZ6LaEi3vCCuOgo5HiXgsyO/9nxYltkr+Ieo=
X-Gm-Gg: ASbGncucJX0lUg0m2oNKqk5/UD+7Wsyhk59JRhnSL88ospwHQpg5R4bgfSPUYj8Rw2B
	6A+vGeysYTgoezKe1e9Rpy/qzPGqSwiPwEUVVNLsGtfsmWIvlTEPA7shC175OIDF3M5SKXZ8d2N
	dpLEKyFsF9skkrZB2O4gwb1fuG4/M4EScFaDczFNeEMKO5MTFdBoRM4jbIc6ESpLmtdgQNPmOiv
	sSg8mPE32M1lDUe9XTTBCGpF0il/jbTg0LPhgSpSGQ5qJUpNNI3D8Katv7rtFFAtyo7keD0NQuw
	lrYBqC9HFbWeEEekvMd2gbQKw2ihKHxDFFMZ8zAFt1MNJWK4WoSozbkHGNchdYSyVWTgAiq752S
	91GmQQfNHGkfNsj3aOvPrgEo7Xbz0UK8eT8W2l+ryoRs9Wa03v5Ft0I7RRSUAP5idH8vHI7MATh
	f1ufrSaBwbDqEV0brEx46iSo1YoPgz6kHSxBJfR2IpvrYdey6vvTKpg6FQ5zFNKw4mVA==
X-Google-Smtp-Source: AGHT+IEr5Z9g4wWlPda3oSInszfMw3AYzjKy3w2kVd2XI9iVXSOcL/bI6ZR5gKAx0+1+VUI13DCoYw==
X-Received: by 2002:a05:6512:3b89:b0:594:1b24:b419 with SMTP id 2adb3069b0e04-5941d4febfbmr110344e87.3.1761841133288;
        Thu, 30 Oct 2025 09:18:53 -0700 (PDT)
Received: from [192.168.1.11] (0x5da5f0d7.static.cust.fastspeed.dk. [93.165.240.215])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0c6269sm40611501fa.30.2025.10.30.09.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 09:18:52 -0700 (PDT)
Message-ID: <fb69e006-8460-4a5d-a19e-28bdec10434d@immunant.com>
Date: Thu, 30 Oct 2025 17:18:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in host
 handler
To: Yeoreum Yun <yeoreum.yun@arm.com>, perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ben Horgan <ben.horgan@arm.com>, Armelle Laine <armellel@google.com>,
 Sebastien Ene <sebastianene@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251030-host-direct-messages-v1-0-463e57871c8f@google.com>
 <20251030-host-direct-messages-v1-1-463e57871c8f@google.com>
 <aQNsrjceYM3RvY0e@e129823.arm.com>
Content-Language: en-US
From: Per Larsen <perl@immunant.com>
In-Reply-To: <aQNsrjceYM3RvY0e@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_091856_586392_B2181A0F 
X-CRM114-Status: GOOD (  20.82  )
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

Hi Yeoreum,

On 10/30/25 2:48 PM, Yeoreum Yun wrote:
> Hi Per and Sebasian,
> 
>>
>> Allow direct messages to be forwarded from the host.
>>
>> Signed-off-by: Sebastian Ene <sebastianene@google.com>
>> Signed-off-by: Per Larsen <perlarsen@google.com>
>> ---
>>   arch/arm64/kvm/hyp/nvhe/ffa.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
>> index 4e16f9b96f637599873b16148c6e40cf1210aa3e..191dcb301cca3986758fb6a49f15f1799de9f1d1 100644
>> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
>> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
>> @@ -857,6 +857,15 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
>>   	hyp_spin_unlock(&host_buffers.lock);
>>   }
>>
>> +static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
>> +			      struct kvm_cpu_context *ctxt,
>> +			      u64 vm_handle)
>> +{
>> +	struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];
>> +
>> +	arm_smccc_1_2_smc(args, res);
>> +}
>> +
> 
> TBH, I don't have a strong comment for this but, I'm not sure why
> it is necessary.
> Since it calls just "smc" with the passed argments,
> I think it can be handled by default_smc_handler() without adding this
> function but return the ture for DIRECT MSG2 in ffa_call_support().
> 
> Am I missing something?
Calling `do_ffa_direct_msg` from the host ffa proxy ensures that the 
caller has negotiated a FF-A version with the hypervisor first. In turn,
this means that `ffa_call_support` can use the negotiated version to 
decide whether to proxy this interface or not.

Moreover, `kvm_host_ffa_handler` currently proxies host FF-A calls. 
Android also proxies FF-A calls from guest VMs via a similar function: 
`kvm_guest_ffa_handler` so this function avoids duplication if/when 
adding a guest proxy. This function is also where one would check FFA 
IDs before forwarding messages (to prevent spoofing). You can see the 
downstream implementation here 
https://android-review.googlesource.com/c/kernel/common/+/3422040.

> 
>>   bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>>   {
>>   	struct arm_smccc_1_2_regs res;
>> @@ -915,6 +924,13 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>>   	case FFA_PARTITION_INFO_GET:
>>   		do_ffa_part_get(&res, host_ctxt);
>>   		goto out_handled;
>> +	case FFA_ID_GET:
>> +		ffa_to_smccc_res_prop(&res, FFA_RET_SUCCESS, HOST_FFA_ID);
>> +		goto out_handled;
> 
> I think FFA_ID_GET should be a seperated patch?
Agreed. I've dropped it from this patch set as I don't think we need it.>
>> +	case FFA_MSG_SEND_DIRECT_REQ:
>> +	case FFA_FN64_MSG_SEND_DIRECT_REQ:
>> +		do_ffa_direct_msg(&res, host_ctxt, HOST_FFA_ID);
>> +		goto out_handled;
>>   	}
>>
>>   	if (ffa_call_supported(func_id))

Thanks,Per


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE296CD13DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 02:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Zz06y3dy6mo3qg7oz1Qz0EljeplPY7aX5ubVoycO3M=; b=F/M9vpq24tK/yzkLUVDIT/MH5h
	Z1q8VJbtt5qlgeNBKSgMQiYjG0PiNWQnvNlQA2C+pjgFRJuDRSQaSJfHtcHTgUpyeuigP2S/565ti
	OZzff7ksOE/uCV83bVLSd0oEcHoagXT1mYs7CB0NAvejhVWMqHRNAZ9afbl/lgr5Lmgws8AWlZUp4
	9QhytZC7Oh9ueM0Emtzu9zgBlznQn9t9K73ev/3zCGuDt7VxxQqNjaH7XZjV2MYCSGhHzzSagTQ4L
	da4VxZEcjeSwE1agiof6EjWTXgQdouog9SAmzkDgCoosd6uWR7YwjAN4RNY350kME4yEPT1ZvR8Xa
	TOjgj1Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIdSw-00000006Fl0-12nM;
	Fri, 01 May 2026 02:18:54 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIdSs-00000006Fkd-3xUR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 02:18:52 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-79a535e7c00so17514957b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 19:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20251104.gappssmtp.com; s=20251104; t=1777601929; x=1778206729; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Zz06y3dy6mo3qg7oz1Qz0EljeplPY7aX5ubVoycO3M=;
        b=nPD4CfOIVPwSXSxmsd65GNAVOzKucR3AkfktZyOEUfrWGhbFjQ5lbKk3GtCcGqQjEX
         eqhwaqKy3ePZEm5oz9606y3BD58Rigj6ZypkjHz7KeaIOemiaMrZYGcx0nVgK8pIdbeO
         xO/bZtGAWwZnT3N3gWDpqdVKCJAbIaumSXt5OuXHddSVBRMWUaBKPObTKCA8GtaGqhFu
         mYZyBjAhE00YOTiFCfl5v5lcOMA9WxPLXMeMzrzG6ssg+drnI5JB9bQgZkWYM52dxyB4
         EJqtl707cXVTPrArF6IMtDQHERo9GXJ/JvXIbyKOcLuAsYlB15vg6jctEoz2FgP1LSxH
         I2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777601929; x=1778206729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Zz06y3dy6mo3qg7oz1Qz0EljeplPY7aX5ubVoycO3M=;
        b=kwpPzK56/1VrMrA95ZJ2omJ8dmirEgbR7tEG0UZuYDrj67Nxp/1e9dohJJfyrcvDLR
         P8OanHBAogxhzlh6GfhVH+1obR4PJtiNXEYmMqA3Vq6D8nC1583rgiuWiaGsPR7J2ciX
         HrrvLru72GWh5OlXm3yjHnaoSNkQsi1Dqw4pWYEYvWvAAtk8joT4r1NL2Mps63YnmVZL
         Qmf2i0//HI0I9hBzaTcT0G6wVpeomHpsL8UKRAGmapVDtiHX9ttAGqnH+y5chKr742Lb
         4fW+z2gAieHfI15yP46vEKWt4D0XuZ0GRN7XOJ8iyUmvc5G/W7qB36qFO+mo/UUyspfd
         ftlA==
X-Forwarded-Encrypted: i=1; AFNElJ+sDIoNcVmNSPmezyFWqP0Pmb2TirAaWlQ8goCg+sq0IRZWUH1c0PHWcpYl1tZ/Lgs0lyCNkJpKi8jiz3IWyzpo@lists.infradead.org
X-Gm-Message-State: AOJu0YxPgpGI62BBAJAQ4kRkmnAT3iif+tSbkkq0cPQ9S1A8bAc2R0Xz
	xgYmiMuSbZhs+ql4y63esJTDD4MnbKLMZzJ7WD8Fpn7cty5W5aX6QZeERqO3D1Y8xYo=
X-Gm-Gg: AeBDiesEJabrz3q66775h44EpPjd9pDPprjI4sdUlLQ9btpgQzhKnu67bghPLVRr4va
	MRHlEQnw9cXawZ9pC2YKFIxoatNbrNIvAL3aIFhWc1LntHccPQ97QWAJy6zhr3DLA9WOPNCKYnM
	xIpqx80EoWQDgbYZokTG3TOMOJqPkujT3ZmFLpyS+PV9pKQnRrBcQ5cbzhhWKa4sIRwIaCl52MN
	LqP6a3eooDPcIYL6s4snOis/lRWBFzIMR47lGf8tbhTigk9PCWxEqMXhAvdz4ehMQhyOV6dl7UG
	XVR+iJP8n2nihZEuEDnW7n9I48wrBULhzXVF8YEyGUCvtPfydlMr8LttMgBQLScUY/WvlQ5kjbn
	RrdiglCPpxamPAIFRB0pOU9B3s7IGj+TZhXVZdkXFiHztHv/fvH8pJpwVzzRL9IhhZoLAa+Opfj
	5lAnxQqQSTLaqxL2tOxwiUV97izanV7eqUrFtiqJ25cMcPiZeTOMV7g0XghJDF2WoQJwKkqtPre
	IHbw1M=
X-Received: by 2002:a05:690c:348a:b0:7bb:eaf:5101 with SMTP id 00721157ae682-7bd52844a2cmr58631067b3.16.1777601929088;
        Thu, 30 Apr 2026 19:18:49 -0700 (PDT)
Received: from [10.87.48.52] ([12.15.201.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66838851sm5182957b3.23.2026.04.30.19.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 19:18:48 -0700 (PDT)
Message-ID: <635b64dc-0083-4421-9145-59636c4ac7cc@immunant.com>
Date: Thu, 30 Apr 2026 19:18:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in
 host handler
To: Will Deacon <will@kernel.org>, perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Oliver Upton <oupton@kernel.org>, Armelle Laine <armellel@google.com>,
 Sebastien Ene <sebastianene@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260121-host-direct-messages-v5-0-2c1614c94e80@google.com>
 <20260121-host-direct-messages-v5-1-2c1614c94e80@google.com>
 <aXNvzxoBXr-oRB8r@willie-the-truck>
Content-Language: en-US
From: Per Larsen <perl@immunant.com>
In-Reply-To: <aXNvzxoBXr-oRB8r@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_191851_245624_6FC3CFE3 
X-CRM114-Status: GOOD (  25.89  )
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



On 1/23/26 4:55 AM, Will Deacon wrote:
> Per,
> 
> On Wed, Jan 21, 2026 at 08:27:12AM +0000, Per Larsen via B4 Relay wrote:
>> From: Sebastian Ene <sebastianene@google.com>
>>
>> Allow direct messages to be forwarded from the host. The host should
>> not be sending framework messages so they are filtered out.
>>
>> Signed-off-by: Sebastian Ene <sebastianene@google.com>
>> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
>> Signed-off-by: Per Larsen <perlarsen@google.com>
>> ---
>>   arch/arm64/kvm/hyp/nvhe/ffa.c | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
>> index f731cc4c3f280a32acccca0de92b9ac6c8e05602..9967916278a7ca051500946ef2fcfe7bb40e0e8d 100644
>> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
>> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
>> @@ -862,6 +862,28 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
>>   	hyp_spin_unlock(&host_buffers.lock);
>>   }
>>   
>> +static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
>> +			      struct kvm_cpu_context *ctxt,
>> +			      u64 vm_handle)
>> +{
>> +	DECLARE_REG(u32, flags, ctxt, 2);
>> +
>> +	struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];
>> +
>> +	if (vm_handle != HOST_FFA_ID) {
>> +		ffa_to_smccc_error(res, FFA_RET_INVALID_PARAMETERS);
>> +		return;
>> +	}
> 
> Sorry, but this isn't what I had in mind. 'vm_handle' is just a local
> variable and the only caller passes HOST_FFA_ID, so this isn't really
> achieving anything.
> 
> What you had in v4 dropped the 'vm_handle' argument entirely, which I
> think is the right thing to do. However, the FF-A spec encodes the sender
> ID in bits 31:16 of register W1 and so _that_ is what I think we should
> be checking because _that_ is what the receiver will see.

I should have read your feedback more closely and checked against the 
spec. I will add a new mask for bits 31:16 to check sender ID against
HOST_FFA_ID. Sorry to waste a review cycle and your attention on this.

> Honestly, we could avoid quite a lot of these review cycles if you
> actually replied to my emails on the list instead of just responding
> with a new patch series each time. It's supposed to be a technical
> discussion...

Acknowledged; will do! Apologies for the very late reply.





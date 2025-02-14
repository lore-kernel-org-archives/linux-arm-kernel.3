Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D000FC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 16:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28IvIq5nHgvTTsS1xkW6rKGY+23JWzsECQOgFfIsF5A=; b=Wk6eDEwnM0jNErr0xfQGfPws2n
	DUWdnErifNQ0+hKFPGz14K47wB7txAMCy3PgNR7tiGfDgAhlWnxc8Eq6TXtr1+h+1PY59nFnLPbyD
	U7D/BKZqBmIIP76NDhZEUzGq3hoxw2hsqAail49cR3IfW4GrEGziMSniY8Dk9RN1M8oNEtTVrT1RJ
	i9mgMsgaG7oieGXmgXo8hzgOMrXvZ8Vw0oEMRQ3mYqfyHkNPEJkHhTEhj6jjNL1GX4p64qeAaqXXb
	edpODarIC5iXr3P3Kv3Jw6pp05ISxNNfk3PVeB/2FzAFLAFdX9AtWPdFH//6CgHfRHSK7Lv+4L7rj
	h42ootzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiyzU-0000000Fb2l-1VHU;
	Fri, 14 Feb 2025 16:56:36 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiyqj-0000000FZI9-3Bws
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 16:47:34 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5AB9D203F3FA;
	Fri, 14 Feb 2025 08:47:32 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5AB9D203F3FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1739551652;
	bh=28IvIq5nHgvTTsS1xkW6rKGY+23JWzsECQOgFfIsF5A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IW63B+KZ14zR7bqnRbpO33qkUJyw4qDrPsbj9UBbRpj0a+6lr+6RXpWIDuKREAgzH
	 2Qg6HF8nC6RiAuSTMsFtmtMVu1yKOWfbHulTasDK13lhcgOfJ2rZeCJKN1EasDLBka
	 ovOZ+fKPesWAq+xITmqp5mNqjeWSHCgiRBxJSqaY=
Message-ID: <6e4685fe-68e9-43bd-96c5-b871edb1b971@linux.microsoft.com>
Date: Fri, 14 Feb 2025 08:47:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v4 1/6] arm64: hyperv: Use SMCCC to detect
 hypervisor presence
To: Arnd Bergmann <arnd@arndb.de>, bhelgaas@google.com,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Conor Dooley <conor+dt@kernel.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Dexuan Cui <decui@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, "H. Peter Anvin" <hpa@zytor.com>,
 krzk+dt@kernel.org, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Ingo Molnar <mingo@redhat.com>, Rob Herring <robh@kernel.org>,
 ssengar@linux.microsoft.com, Thomas Gleixner <tglx@linutronix.de>,
 Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org
Cc: benhill@microsoft.com, bperkins@microsoft.com, sunilmut@microsoft.com
References: <20250212014321.1108840-1-romank@linux.microsoft.com>
 <20250212014321.1108840-2-romank@linux.microsoft.com>
 <1b14e3de-4d3e-420c-819c-31ffb2d448bd@app.fastmail.com>
 <593c22ca-6544-423d-84ee-7a06c6b8b5b9@linux.microsoft.com>
 <97887849-faa8-429b-862b-daf6faf89481@app.fastmail.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <97887849-faa8-429b-862b-daf6faf89481@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_084733_857031_54075506 
X-CRM114-Status: GOOD (  27.45  )
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



On 2/14/2025 12:05 AM, Arnd Bergmann wrote:
> On Fri, Feb 14, 2025, at 00:23, Roman Kisel wrote:
>> On 2/11/2025 10:54 PM, Arnd Bergmann wrote:
> 
>> index a74600d9f2d7..86f75f44895f 100644
>> --- a/drivers/firmware/smccc/smccc.c
>> +++ b/drivers/firmware/smccc/smccc.c
>> @@ -67,6 +67,30 @@ s32 arm_smccc_get_soc_id_revision(void)
>>    }
>>    EXPORT_SYMBOL_GPL(arm_smccc_get_soc_id_revision);
>>
>> +bool arm_smccc_hyp_present(const uuid_t *hyp_uuid)
> 
> The interface looks good to me.

Great :)

> 
>> +{
>> +	struct arm_smccc_res res = {};
>> +	struct {
>> +		u32 dwords[4]
>> +	} __packed res_uuid;
> 
> The structure definition here looks odd because of the
> unexplained __packed attribute and the nonstandard byteorder.
> 

Fair points, thank you, will straighten this out!

> The normal uuid_t is defined as an array of 16 bytes,
> so if you try to represent it in 32-bit words you need to
> decide between __le32 and __be32 representation.
> 
>> +	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_HVC)
>> +		return false;
>> +	arm_smccc_1_1_hvc(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
>> +	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
>> +		return false;
>> +
>> +	res_uuid.dwords[0] = res.a0;
>> +	res_uuid.dwords[1] = res.a1;
>> +	res_uuid.dwords[2] = res.a2;
>> +	res_uuid.dwords[3] = res.a3;
>> +
>> +	return uuid_equal((uuid_t *)&res_uuid, hyp_uuid);
> 
> The SMCCC standard defines the four words to be little-endian,
> so in order to compare them against a uuid byte array, you'd
> need to declare the array as __le32 and swap the result
> members with cpu_to_le32().
> 
> Alternatively you could pass the four u32 values into the
> function in place of the uuid.
> 
> Since the callers have the same endianess confusion, your
> implementation ends up working correctly even on big-endian,
> but I find it harder to follow when you call uuid_equal() on
> something that is not the actual uuid_t value.
> 

I'll make sure the implementation is clearer, thanks!

>> +
>> +#define ARM_SMCCC_HYP_PRESENT(HYP) 								\
>> +	({															\
>> +		const u32 uuid_as_dwords[4] = {							\
>> +			ARM_SMCCC_VENDOR_HYP_UID_ ## HYP ## _REG_0,			\
>> +			ARM_SMCCC_VENDOR_HYP_UID_ ## HYP ## _REG_1,			\
> 
> I don't think using a macro is helpful here, it just makes
> it impossible to grep for ARM_SMCCC_VENDOR_HYP_UID_* values when
> reading the source.
> 
> I would suggest moving the UUID values into a variable next
> to the caller like
> 
> #define ARM_SMCCC_VENDOR_HYP_UID_KVM \
>      UUID_INIT(0x28b46fb6, 0x2ec5, 0x11e9, 0xa9, 0xca, 0x4b, 0x56, 0x4d, 0x00, 0x3a, 0x74)
> 
> and then just pass that into arm_smccc_hyp_present(). (please
> double-check the endianess of the definition here, I probably
> got it wrong myself).

Will remove the macro and will use UUID_INIT, appreciate taking the
time to review the draft and your suggestions on improving it very much!

> 
>       Arnd

-- 
Thank you,
Roman



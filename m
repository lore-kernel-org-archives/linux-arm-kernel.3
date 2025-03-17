Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB81C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 18:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgR7z0T2ShM1jjkPMrelwXUQsvor6qx9o5NQCWLdIwY=; b=Ptn4V0IOVirZtOkvc3ZUi55xJX
	O2kUel2IIBGGMgLiO4icOOpN0GHmoqSr/5Ocf7/+V9Q5UIdt0LXswfXhF9QGTQPP5174pCE3y5tDt
	nKno1x8yOmVQzBdheZXUtsnQpVPEWHo7qkgj+Dd0bX1tvx6Rv1gxCqseWvNTAoKw4jfWRLloemWcv
	3aKDOqmQpljS3cnjDVBBtwjgfSXnBvcaV4Zt0uIuaIlWhNpu2bxjDZcOAo4BLW2P7G/ncuzy1JR4v
	NoEhhtXRONUAM247CoQFsEk1vXTCgY4CgEYkYZbtRnwFCZHw+U0rYEP1sKaGV3SEHGDn4QAZAwu30
	s1rAMH6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuF3B-00000003fNO-2TKT;
	Mon, 17 Mar 2025 18:18:57 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDzx-00000003UUy-31RA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 17:11:35 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 829452033441;
	Mon, 17 Mar 2025 10:11:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 829452033441
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1742231492;
	bh=qgR7z0T2ShM1jjkPMrelwXUQsvor6qx9o5NQCWLdIwY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iB5HkHF/A/Slm14vX+aYEAmVR42WWsEoeBkLbzvaiREpnLDzWzHQvyPfIpAMI5vNP
	 cGxzvVsNVvS63EDK4o/DOK/hA+9ejTYQXhejalajxyoCA3OS8peBoo9E3lm9FqtPpe
	 dXqlCaDHhHvIVonIlr8haVF0Jk1ZYa4yKt/doL6g=
Message-ID: <d168a483-b425-4c18-ad71-eb39a0aba06c@linux.microsoft.com>
Date: Mon, 17 Mar 2025 10:11:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v6 01/11] arm64: kvm, smccc: Introduce and use
 API for detecting hypervisor presence
To: Mark Rutland <mark.rutland@arm.com>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
 catalin.marinas@arm.com, conor+dt@kernel.org, dan.carpenter@linaro.org,
 dave.hansen@linux.intel.com, decui@microsoft.com, haiyangz@microsoft.com,
 hpa@zytor.com, joey.gouly@arm.com, krzk+dt@kernel.org, kw@linux.com,
 kys@microsoft.com, lenb@kernel.org, lpieralisi@kernel.org,
 manivannan.sadhasivam@linaro.org, maz@kernel.org, mingo@redhat.com,
 oliver.upton@linux.dev, rafael@kernel.org, robh@kernel.org,
 ssengar@linux.microsoft.com, sudeep.holla@arm.com, suzuki.poulose@arm.com,
 tglx@linutronix.de, wei.liu@kernel.org, will@kernel.org,
 yuzenghui@huawei.com, devicetree@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org,
 apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com
References: <20250315001931.631210-1-romank@linux.microsoft.com>
 <20250315001931.631210-2-romank@linux.microsoft.com>
 <Z9gHmkNOsd29viHj@J2N7QTR9R3.cambridge.arm.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <Z9gHmkNOsd29viHj@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_101133_811402_B38AD1E9 
X-CRM114-Status: GOOD (  22.92  )
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



On 3/17/2025 4:29 AM, Mark Rutland wrote:
> On Fri, Mar 14, 2025 at 05:19:21PM -0700, Roman Kisel wrote:

[...]

>> +}
> 
> This use of a statement expression is bizarre, and the function would be
> clearer without it, e.g.

I'll change that to what you're suggesting, thanks for your help!

> 
> | bool arm_smccc_hyp_present(const uuid_t *hyp_uuid)
> | {
> | 	struct arm_smccc_res res = {};
> | 	uuid_t uuid;
> |
> | 	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_HVC)
> | 		return false;
> |
> | 	arm_smccc_1_1_hvc(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
> | 	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
> | 		return false;
> | 	
> | 	uuid_t = SMCCC_RES_TO_UUID(res.a0, res.a1, res.a2, res.a3);
> | 	return uuid_equal(&uuid, hyp_uuid);
> | }
> 
> As noted below, I'd prefer if this were renamed to something like
> arm_smccc_hypervisor_has_uuid(), to more clearly indicate what is being
> checked.
> 
> [...]

Will update, thanks for your help!

> 
>> +/**
>> + * arm_smccc_hyp_present(const uuid_t *hyp_uuid)
>> + *
>> + * Returns `true` if the hypervisor advertises its presence via SMCCC.
>> + *
>> + * When the function returns `false`, the caller shall not assume that
>> + * there is no hypervisor running. Instead, the caller must fall back to
>> + * other approaches if any are available.
>> + */
>> +bool arm_smccc_hyp_present(const uuid_t *hyp_uuid);
> 
> I'd prefer if this were:
> 
> | /*
> |  * Returns whether a specific hypervisor UUID is advertised for the
> |  * Vendor Specific Hypervisor Service range.
> |  */
> | bool arm_smccc_hypervisor_has_uuid(const uuid_t *uuid);
> 
[...]



> 
> I think this'd be clearer if we did something similar to what we did for
> the SMCCC SOC_ID name:
> 
>    https://lore.kernel.org/linux-arm-kernel/20250219005932.3466-1-paul@os.amperecomputing.com/
> 
> ... and pack/unpack the bytes explicitly, e.g.

That looks great, thanks for the suggestion!

> 
> | static inline uuid smccc_res_to_uuid(u32 r0, u32, r1, u32 r2, u32 r3)
> | {
> | 	uuid_t uuid = {
> | 		.b = {
> | 			[0]  = (r0 >> 0)  & 0xff,
> | 			[1]  = (r0 >> 8)  & 0xff,
> | 			[2]  = (r0 >> 16) & 0xff,
> | 			[3]  = (r0 >> 24) & 0xff,
> |
> | 			[4]  = (r1 >> 0)  & 0xff,
> | 			[5]  = (r1 >> 8)  & 0xff,
> | 			[6]  = (r1 >> 16) & 0xff,
> | 			[7]  = (r1 >> 24) & 0xff,
> |
> | 			[8]  = (r2 >> 0)  & 0xff,
> | 			[9]  = (r2 >> 8)  & 0xff,
> | 			[10] = (r2 >> 16) & 0xff,
> | 			[11] = (r2 >> 24) & 0xff,
> |
> | 			[12] = (r3 >> 0)  & 0xff,
> | 			[13] = (r3 >> 8)  & 0xff,
> | 			[14] = (r3 >> 16) & 0xff,
> | 			[15] = (r3 >> 24) & 0xff,
> | 		},
> | 	};
> |
> | 	return uuid;
> | }
> 
> ... which is a bit more verbose, but clearly aligns with what the SMCCC
> spec says w.r.t. packing/unpacking, and should avoid warnings about
> endianness conversions.
> 

I believe what you're proposing hits a better trade-off, thanks again!

>> +
>> +#define UUID_TO_SMCCC_RES(uuid_init, regs) do { \
>> +		const uuid_t uuid = uuid_init; \
>> +		(regs)[0] = le32_to_cpu((u32)uuid.b[0] | (uuid.b[1] << 8) | \
>> +						((uuid.b[2]) << 16) | ((uuid.b[3]) << 24)); \
>> +		(regs)[1] = le32_to_cpu((u32)uuid.b[4] | (uuid.b[5] << 8) | \
>> +						((uuid.b[6]) << 16) | ((uuid.b[7]) << 24)); \
>> +		(regs)[2] = le32_to_cpu((u32)uuid.b[8] | (uuid.b[9] << 8) | \
>> +						((uuid.b[10]) << 16) | ((uuid.b[11]) << 24)); \
>> +		(regs)[3] = le32_to_cpu((u32)uuid.b[12] | (uuid.b[13] << 8) | \
>> +						((uuid.b[14]) << 16) | ((uuid.b[15]) << 24)); \
>> +	} while (0)
>> +
>> +#endif /* !__ASSEMBLER__ */
> 
> IMO it'd be clearer to initialise a uuid_t beforehand, and then allow
> the helper to unpack the bytes, e.g.
> 
> static inline u32 smccc_uuid_to_reg(const uuid_t uuid, int reg)
> {
> 	u32 val = 0;
> 
> 	val |= (u32)(uuid.b[4 * reg + 0] << 0)
> 	val |= (u32)(uuid.b[4 * reg + 1] << 8)
> 	val |= (u32)(uuid.b[4 * reg + 2] << 16)
> 	val |= (u32)(uuid.b[4 * reg + 3] << 24)
> 
> 	return val:
> }
> 
> #define UUID_TO_SMCCC_RES(uuid, regs)		\
> do {						\
> 	(regs)[0] = smccc_uuid_to_reg(uuid, 0); \
> 	(regs)[1] = smccc_uuid_to_reg(uuid, 1); \
> 	(regs)[2] = smccc_uuid_to_reg(uuid, 2); \
> 	(regs)[3] = smccc_uuid_to_reg(uuid, 3); \
> } while (0)
> 
> ... though arguably at that point you can get rid of the
> UUID_TO_SMCCC_RES() macro and just expand that directly at the callsite.
> 

I'll work on that, thanks!!

> Mark.

-- 
Thank you,
Roman



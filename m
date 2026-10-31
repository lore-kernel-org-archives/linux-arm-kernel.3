Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157DC606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 00:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yGGl32gx;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=cFReCf0d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EQ7fNiO0P3mhoLAhbj+6WfCFh3aUC3uBzQXi0YuoPKA=; b=yGGl32gxOLm9Hw
	rcPdWmb1UilsRsuNTE2W9x6+CpepExYw8OJKS9a+BPy1HdxV/irRQRLXxUQB3FDdvSzca6jmOsS0o
	Cbl8EyNASbq2N7O+eSxqU0tjqkz9qJs3v0izFx18Rn/3/RiT4a+PiZM2OHpYVSWrQuunFwhm2V+g9
	TMWwyMNOYK3bl+90VoYT6emDvPJHWVI36Dqf6/THO30hOAp29vSAbX7g6xUBqzwfyll03ptChapkD
	xTdFvyyLoDjFPDyauPgENzN0wZ7QWpo21sEgNhDzzzOqXCXY7X/ma6klei2b9FGGf+tqjmk5JSXWg
	fqfdY+QbFHpISxRENFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMx4k-0000000CmkS-05LP;
	Sat, 31 Oct 2026 00:36:02 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMx4h-0000000Cmk7-1jhl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 00:36:00 +0000
Received: from [100.64.217.159] (unknown [20.191.74.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id AA10520B7166;
	Fri, 30 Oct 2026 17:35:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AA10520B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793406945;
	bh=EQ7fNiO0P3mhoLAhbj+6WfCFh3aUC3uBzQXi0YuoPKA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cFReCf0dabEhVznpQ0oD55qIBHIWSpDa9udX1pxRG3zX1SNL32mSHA7gtkVWZ3o5R
	 a5Ybru57SRz08HUAxBWKguLzKeKVQ8iP0UxbJlrd/cesfBW1GSHpRKtSd5qKYZ/4rS
	 7CgsawYhdc/qNWDJX2md8+pz2f2nsiQImu+7nhJs=
Message-ID: <8d175247-24a9-42ee-8ce8-4bdfce6db548@linux.microsoft.com>
Date: Fri, 30 Oct 2026 17:35:58 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] firmware: smccc: Detect hypervisor via RSI host
 call in CCA Realms
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 mhklinux@outlook.com, will@kernel.org, mark.rutland@arm.com,
 lpieralisi@kernel.org, sudeep.holla@kernel.org, arnd@arndb.de,
 thuth@redhat.com, linux-hyperv@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Suzuki K Poulose <Suzuki.Poulose@arm.com>
References: <20261002215725.2015959-1-kameroncarr@linux.microsoft.com>
 <20261002215725.2015959-3-kameroncarr@linux.microsoft.com>
 <auPOnb_9Jfzh-oQE@arm.com>
Content-Language: en-US
From: Kameron Carr <kameroncarr@linux.microsoft.com>
In-Reply-To: <auPOnb_9Jfzh-oQE@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_173559_506182_E1C26261 
X-CRM114-Status: GOOD (  17.67  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>

On 10/29/2026 3:54 PM, Catalin Marinas wrote:
> On Fri, Oct 02, 2026 at 02:57:21PM -0700, Kameron Carr wrote:
>> +#ifdef CONFIG_ARM64
>> +static struct rsi_host_call uuid_hc;
>> +static DEFINE_SPINLOCK(uuid_hc_lock);
>> +
>> +/*
>> + * Helper function to get the hypervisor UUID via an RsiHostCall.
>> + */
>> +static void arm_smccc_realm_get_hypervisor_uuid(struct arm_smccc_res *res)
>> +{
>> +	guard(spinlock_irqsave)(&uuid_hc_lock);
>> +
>> +	memset(&uuid_hc, 0, sizeof(uuid_hc));
>> +	uuid_hc.gprs[0] = ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID;
>> +
>> +	if (rsi_host_call(__pa_symbol(&uuid_hc)) != RSI_SUCCESS) {
>> +		res->a0 = SMCCC_RET_NOT_SUPPORTED;
>> +		return;
>> +	}
>> +
>> +	res->a0 = uuid_hc.gprs[0];
>> +	res->a1 = uuid_hc.gprs[1];
>> +	res->a2 = uuid_hc.gprs[2];
>> +	res->a3 = uuid_hc.gprs[3];
>> +}
>> +#endif
>> +
>>  bool arm_smccc_hypervisor_has_uuid(const uuid_t *hyp_uuid)
>>  {
>>  	struct arm_smccc_res res = {};
>>  	uuid_t uuid;
>>  
>> -	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
>> +#ifdef CONFIG_ARM64
>> +	if (is_realm_world())
>> +		arm_smccc_realm_get_hypervisor_uuid(&res);
>> +	else
>> +#endif
>> +		arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID,
>> +				     &res);
> 
> Is this meant to be generic? I'm not sure the trick to pass
> ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID in gprs[0] and forward it to the
> host is a documented ABI. I think it even confuses other realm guests
> that don't expect this (e.g. kvm_init_hyp_services()).
> 
> I thought realms should stick to the RSI interface and not try to guess
> the host hypervisor. But if you do need this, a better fit would be in
> hyperv_detect_via_smccc() (if realms don't boot with ACPI).
> 
> I'll leave it to Sudeep or Suzuki to comment further.

I moved this code to a Hyper-V specific location as you suggested.

Let me know if you have any other concerns.

[v6] https://lore.kernel.org/all/20261031001412.4150488-1-kameroncarr@linux.microsoft.com/

-- 
Regards,
Kameron


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D663AC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 07:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/QZJikpo5kZYaUKl+nXZK03zswjscmlVtD3BHEcVcQ=; b=XINIqItFoXK/LPQR5n+OG42Q6b
	SIN3qIxbi7gvV/IC9hPaHkzDCYgqWadFeoQH6pQsgZ6WfOZvbZdonacfx/DvkcgxZs+DYKLT8gi9m
	mecFBtZkGsPwbeokcx/EpDlaZ/B7imsdaqYau/qY95TBGrb1XJfKntDmrXnrncOziax3730KaecTu
	7UveUowgX/LDAmA5FA659KwphK3mgQo1Wq/1bm+YEORvaXy9TUEkd1uMJ5GvqmhEl3EC+hyGxCToB
	JB7RsjtekuA0dRyoivzHZ9ivVPdEuZ6JILvZUPKrc2p6KFvPPvToCfhHYqZG5f2HjS1+/SSGKLgw5
	IEKFMKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Cs8-0000000B0GM-0uQZ;
	Wed, 09 Sep 2026 07:37:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Cs4-0000000B0Eq-0PSK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 07:37:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 47B7C601FE;
	Wed,  9 Sep 2026 07:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E580A1F00A3F;
	Wed,  9 Sep 2026 07:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788939447;
	bh=U/QZJikpo5kZYaUKl+nXZK03zswjscmlVtD3BHEcVcQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Dl+hRUS7EGUIOBSQVLZBfIfZurYDPsVL4Az7bRRfECr6kD5mpE6oUfbena6TSipgH
	 IILNxj5T8iND/m3lPyC1dVNo/vsed361q4LXmfL01jScxrnXhbl6SQ+b1hxUEwxPdU
	 xM8sLLyukLF1dLS3INT9077CdWagsWWS5RE5JR74VEDgvpKzPevSd9bp6Re9jv9cAY
	 esbfnCE9qIN8hd6A46n4Dv/gSB5mDs57hN4XRJyEa0kU0JjYcj+vkAwYDtbFcD3WrW
	 GtxRgz0G2EcBDcAVSWMmtGWLeXcQlHcY45EwszMtYzUZMjgnf0cZbCd72QEazjoS5B
	 /aa7vM9A9gXlw==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v10 6/7] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
In-Reply-To: <178855077571.693280.17942746234757215326.b4-review@b4>
References: <20260904095000.1184861-1-aneesh.kumar@kernel.org>
 <20260904095000.1184861-7-aneesh.kumar@kernel.org>
 <178855077571.693280.17942746234757215326.b4-review@b4>
Date: Wed, 09 Sep 2026 13:07:18 +0530
Message-ID: <yq5atsnyeuz5.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Jason Gunthorpe <jgg@nvidia.com> writes:

>> [ ... 42 lines skipped ... ]
>> @@ -94,6 +95,11 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
>>  		.requires_smc   = false,
>>  		.device_name    = "arm-smccc-trng",
>>  	},
>> +	{
>> +		.func_id        = SMC_RSI_ABI_VERSION,
>> +		.requires_smc   = true,
>> +		.device_name    = "arm-rsi",
>> +	},
>>  };
>>  
>>  static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
>
>    [Severity: High]
>    When this new entry is probed by smccc_probe_smccc_device(), does
>    arm_smccc_1_1_invoke() pass uninitialized registers to the firmware?
>
>    Looking at smccc_probe_smccc_device() during system initialization:
>
>    drivers/firmware/smccc/smccc.c:smccc_probe_smccc_device() {
>        ...
> 	   arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
>        ...
>    }
>
>    Since arm_smccc_1_1_invoke() is a variadic macro, providing only the func_id
>    leaves x1/r1 uninitialized in the SMC inline assembly.
>
>    For SMC_RSI_ABI_VERSION, the RMM uses x1 as the requested interface revision
>    to determine supported revisions.
>
>    Could this pass a garbage requested interface revision to the RMM,
>    potentially causing probe failures or returning an unsupported boundary?
>
>    Could this also leak kernel register state to EL2?
>
> Sashiko still has this to say, I think it should pass 0 as the x1
> 'requested version' instead of unpredictable garbage.
>

To handle 

> Could this also leak kernel register state to EL2?
>

Should we instead do

	arm_smccc_1_1_invoke(smccc_dev->func_id,
			     0, 0, 0, 0, 0, 0, 0, &res);
	ret = res.a0;

There is no standard defining how the various SMCCC VERSION calls are
expected to work. For example, ARM_SMCCC_TRNG_VERSION does not use x1,
while SMC_RSI_ABI_VERSION does. Another VERSION call could use both x1
and x2. The only consistent behavior is to return
SMCCC_RET_NOT_SUPPORTED when the SMCCC function ID is not supported.

-aneesh


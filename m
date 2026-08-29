Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53ECC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 06:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRZw1V1vB378QeSlvx5BVidjqGhxuO+qRstnpjHPWb8=; b=y7pEMs37sQhGSo4VstIVRK9NNX
	LbKD637k7OuCqviYa0ofobQfnA1haOtnp8tqic8ZkrgHovOpKTsW6zf12/XnBwagUEeUeEGZhqh21
	+OotTbF+u673GwxNhYmNeNW0vsNxw/04lMteWTq+cSESluP3qZtOyJI2n1MDn2JXEevzXP910LKnH
	wwpzfMMeUUSlt2PSZLcRVtUEuR/pl3qkoiKIhHbqlDUw/j2isKyb/N7eJda5rVxJFlPjuerKSLCVs
	+6JmBx4PvQVq+GB5lye73wsKBRHHO9wDw4eK1WrZyYzLkKcELYcjKpG2v1K8w+JMr2lkCg1oPA3Dt
	8HMzGaAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0CIq-00000006lqh-3Fcb;
	Sat, 29 Aug 2026 06:12:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0CIo-00000006lpx-47Qd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 06:12:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 71E4B435B5;
	Sat, 29 Aug 2026 06:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1701A1F000E9;
	Sat, 29 Aug 2026 06:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787983950;
	bh=TRZw1V1vB378QeSlvx5BVidjqGhxuO+qRstnpjHPWb8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=L7m7g7Ps2C498I4YlV7/C6DjkiyJ6vKG70Snu3K+r9J9UaUIbMjW1gV4QlFQh536/
	 jSpCSm/Qt2WZ7gRJFGJTw1dAf0EC3itaGrMZvE79e9OxcdHvfTi9pORbP74TT0ztwE
	 oHZFrpLtxWSWg2hBsGhnBMd8yVdcYS8fah5iOjplxgWvMqjiuI+XKsmDySwfT1cOCG
	 s0LzhW6Px8IrQroI1TiwDC+N75K1wi+KYe554VP+n0gwZWXWqr0c6m8xuY7Ij5f9O7
	 dJAh7PwqyAav04unbNz3h1+NHKHPuNjwHd2j59jK1UWyKH/MZdRYyZyZGLNGDWyXh4
	 sqXuw4fuPdYWQ==
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
Subject: Re: [PATCH v9 6/7] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
In-Reply-To: <178794567780.4159892.17969556982711821646.b4-review@b4>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-7-aneesh.kumar@kernel.org>
 <178794567780.4159892.17969556982711821646.b4-review@b4>
Date: Sat, 29 Aug 2026 11:42:20 +0530
Message-ID: <yq5ald9ptpyz.fsf@kernel.org>
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

>> [ ... 43 lines skipped ... ]
>> @@ -94,6 +95,12 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
>>  		.requires_smc   = false,
>>  		.device_name    = "arm-smccc-trng",
>>  	},
>> +
>> +	{
>> +		.func_id        = SMC_RSI_ABI_VERSION,
>  [Severity: High]
>  Does this new entry cause uninitialized registers to be passed to the
>  firmware?
>
>  Looking at smccc_probe_smccc_device():
>
>  	arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
>
>  The invocation only passes the func_id, leaving r1 uninitialized. Since the
>  SMC_RSI_ABI_VERSION ABI requires r1 to hold the requested version parameter,
>  does this leak uninitialized kernel register state to the firmware and pass
>  a garbage ABI version?
>

Yes. This even can result in error return from firmware like

[   rmm ] SMC_RMI_VERSION                   6 > RMI_RMI_ERROR_INPUT


>
> This seems like a good point.. Several other APIs had this 'pass a
> thing in' as part of their version contract too.
>
> There is ABI incompatabilitiy here right? It would make sense to break
> up the really different versions into different device strings if
> possible. eg v1 and v2?
>

The goal is only to check whether the firmware function is supported,
hence the explicit check for SMCCC_RET_NOT_SUPPORTED.

	arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
	ret = res.a0;

	if (ret == SMCCC_RET_NOT_SUPPORTED)
		return false;


>
> ...
>
>  [Severity: High]
>  Could this also execute an SMC64 call on 32-bit ARM (AArch32) systems?
>
>  The smccc_devices array unconditionally includes SMC_RSI_ABI_VERSION, which
>  is an SMC64 call. Executing an SMC64 function identifier from an AArch32
>  execution state is architecturally unpredictable and could cause a crash
>  or hang on 32-bit hardware.
>
> No idea if sashiko is right , but it is what I was wondering about in
> the rng patch...
>

I will check whether issuing an SMC64 call on 32-bit ARM is a problem.

>
>> [ ... 44 lines skipped ... ]
>> +static void unregister_cca_tsm_report(void *data)
>> +{
>> +	tsm_report_unregister(&arm_cca_tsm_report_ops);
>> +}
>> +
>> +static int cca_tsm_probe(struct arm_smccc_device *sdev)
>>  {
>>  	int ret;
>>  
>> @@ -178,30 +175,33 @@ static int __init arm_cca_guest_init(void)
>>  		return -ENODEV;
>>  
>>  	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
>> -	if (ret < 0)
>> -		pr_err("Error %d registering with TSM\n", ret);
>> +	if (ret < 0) {
>> +		dev_err_probe(&sdev->dev, ret, "Error registering with TSM\n");
>> +		return ret;
>> +	}
>>  
>> -	return ret;
>> +	ret = devm_add_action_or_reset(&sdev->dev, unregister_cca_tsm_report,
>> +				       NULL);
>> +	if (ret < 0) {
>
> Can just make unregister the remove function. Don't need to use devm
> for everything.
>

IIUC, you are suggesting to do the below?

static void cca_tsm_remove(struct arm_smccc_device *sdev)
{
        tsm_report_unregister(&arm_cca_tsm_report_ops);
}

static struct arm_smccc_driver cca_tsm_driver = {
        .driver_name = "arm_cca_tsm",
        .probe = cca_tsm_probe,
        .remove = cca_tsm_remove,
        ...

-aneesh


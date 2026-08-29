Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA06C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 05:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFTrJI2OeaOiAaQDcbHU1K6Yg8r+hEUD6sJwtiaktYE=; b=vVN/aOEp+lmkN70ZAB7tuBerEK
	ntKNJ9xSVFcSpIdkD/Y9GCxbnjcWPU0kxqgZ+cSQC5ilMLj0GH9LcvZH5gkco+CRu6xFzx9SnfWI0
	Pdf7W4u/KvbD6CaWPSm/hWV4RaQwPxGx+Y+fyd1vHAKcamjd7J9PtHPu7WAhubwfIaneJuWV1QvPw
	+GmK6y3Ggi1GW/DcEIlGHoYNpACcPNtYRj5fl0NR2D9HdKALcn+5k23mxaxfhSMnPdUoMlIiC+jd9
	e5eFmuNcc+Bi4s7yrF+H9p2NwJGBAuZAUrxbBezFcxrBaq47ua8fLRf7sCf5M0nqzACwTsZZoh047
	f9/2ajlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0C1L-00000006lBq-0bzc;
	Sat, 29 Aug 2026 05:54:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0C1K-00000006lBf-0mzB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 05:54:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B8B24398D;
	Sat, 29 Aug 2026 05:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533FB1F000E9;
	Sat, 29 Aug 2026 05:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787982865;
	bh=yFTrJI2OeaOiAaQDcbHU1K6Yg8r+hEUD6sJwtiaktYE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=i134d/WacIrlcXNhsLMoRsdAUYUPQU+u5jVamSqmNuVIr31oNDoDyix3Bl7iQ3n4O
	 cJ+/AWv1CT8il1Gy4Xhyz+/lXEW4ePaMV2mK0B+zawE6uIRXRiVqqyhF1AT5YsGMqp
	 Z4VeVGpBz+Ra2Ovxs8VTNU2LA2HRxLYI6st5dFqRodePXpkNwBKWvMowdb4lDySqID
	 /12B349d0ne77G9obHl+zZ3nHAgCn1YbqgpE+1i1hg96c1rGzVc+b1fMQWOlYNMFdx
	 6ST4ftT2MkZXU5U1dLBCmCr2r1ZYrHJg8aLCtQLcAyiJZ+SYyMdufuVjQKNImiZ9SJ
	 PEV9uQfDoOEYg==
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
Subject: Re: [PATCH v9 2/7] firmware: hwrng: arm_smccc_trng: Register as an
 SMCCC device
In-Reply-To: <178794567779.4159892.8570190086048719424.b4-review@b4>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-3-aneesh.kumar@kernel.org>
 <178794567779.4159892.8570190086048719424.b4-review@b4>
Date: Sat, 29 Aug 2026 11:24:14 +0530
Message-ID: <yq5atsodtqt5.fsf@kernel.org>
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

>> [ ... 58 lines skipped ... ]
>> @@ -94,29 +96,37 @@ static int smccc_trng_read(struct hwrng *rng, void *data, size_t max, bool wait)
>>  	return copied;
>>  }
>>  
>> -static int smccc_trng_probe(struct platform_device *pdev)
>> +static int smccc_trng_probe(struct arm_smccc_device *sdev)
>>  {
>>  	struct hwrng *trng;
>>  
>> -	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
>> +	/* validate the minimum version requirement */
>> +	if (!smccc_probe_trng())
>> +		return -ENODEV;
>
> It feels like slightly poor practice to do this.. It is doing three
> things:
>
> 1) ARM32 disables this entirely for some reason, shouldn't the bus do
>    it? Maybe it already does?
>

Why? The bus only checks whether the firmware function is supported and
creates the device if it is. Further validation should be the driver's
responsibility, shouldn't it?

>
> 2) Checks the API exists and checks but the bus already did this.
>

This checks that the firmware supports the minimum ABI version required
by the driver.

>
> 3) Checks the version number
>
> Maybe the bus should capture the version output and pass it in as an
> argument to probe so the driver can do the min version check directly?
>

One of the earlier discussions suggested that the bus should only check
whether the function ID is supported, rather than checking for an
expected version or anything similar. This keeps the bus code generic.

	arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
	ret = res.a0;

	if (ret == SMCCC_RET_NOT_SUPPORTED)
		return false;

The other alternative discussed was a device-specific callback that
would perform additional validation and create the device only when
those conditions were met. It was dropped in favor of the simpler bus
code above.

>
> It is very minor anyhow, it looks OK
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>
> -- 
> Jason

-aneesh


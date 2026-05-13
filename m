Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D06CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 06:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prbkpKqijRZ3fxZxXVSsD6ueoi7E15CoIDow1Ify5GM=; b=CxRPN+wn98J9L7h91I/bn8+irh
	7iRITCer1oEundGw1uN43g+gEudV6T48viPS97/piOdz8syQXO7wdWxVxllhnWHG2+qV8oZTvo271
	uOsk+TP+xWS8Q6UK+K/qeacDTplnZ5mg7gtFc/hRX3JLyL5SPNkUNIlGSduMjc5nurSmuVcYZ6RP1
	uu2mP2qc9NzEip2J0piSvo3DKs7GRf8ravqf45/0bjHYcQ3bYrOYZds5WyAgvsRJWiGQoV5rn0vNH
	S600DSMQeVzh/VDdVs7KSNc75a/LvdGEABcqoJ/aEh4fMR6pKSh2+2Ru1l3kXiHtGlJsKLHY5TaDY
	eClPhB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3W4-00000001U5F-3vgV;
	Wed, 13 May 2026 06:56:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3W3-00000001U4j-1E7N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 06:56:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 220A760120;
	Wed, 13 May 2026 06:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E05C2BCB7;
	Wed, 13 May 2026 06:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778655381;
	bh=pumZDJ3Ed1xWVAZjH5xTGLWKQMlEkQ41itR01nJUqRQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=k3arSQ2kBwvpaPNRXH+Vkq8W9PZfuXCGHR5JzzBqSI0hgCeiRQQDVY/1uoiFMCI4v
	 Ifv9qZzDJttNyP7upoxzGiZM9Mwead1p1mR96EVdFij8EVhe49OawopmxVtoxttDfv
	 xnK0jR1eQkxqkn9mTZVb8VUNPgnzqUS8nFMO3yFlUOQKiaRT28VwVeqs6Ff2uVlhK4
	 obaOC4kfB+OxCxGJehf1pDhIzeKJ+A4gx+zVgQXPt8F6Ql5sYs2ptQnifrjlQ51dXU
	 peYsDgQXGrY8OeOAxDTnoLgHT1P30vuLgK83WvpnvOXh8jz83LxPIheNU83PUmnRdu
	 0DCkAf4Iq8jXg==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v4 1/2] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
In-Reply-To: <agM699d4KwdjnS39@arm.com>
References: <20260427061615.905018-1-aneesh.kumar@kernel.org>
 <20260427061615.905018-2-aneesh.kumar@kernel.org>
 <agM699d4KwdjnS39@arm.com>
Date: Wed, 13 May 2026 12:26:13 +0530
Message-ID: <yq5aa4u3u7aq.fsf@kernel.org>
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

Catalin Marinas <catalin.marinas@arm.com> writes:

> + Suzuki
>
> On Mon, Apr 27, 2026 at 11:46:14AM +0530, Aneesh Kumar K.V (Arm) wrote:
>> diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
>> index 88b50d660e85..2d2d363aaaee 100644
>> --- a/arch/arm64/include/asm/rsi.h
>> +++ b/arch/arm64/include/asm/rsi.h
>> @@ -10,7 +10,7 @@
>>  #include <linux/jump_label.h>
>>  #include <asm/rsi_cmds.h>
>>  
>> -#define RSI_PDEV_NAME "arm-cca-dev"
>> +#define RSI_DEV_NAME "arm-rsi-dev"
> [...]
>> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
>> index bdee057db2fd..fc9b44b7c687 100644
>> --- a/drivers/firmware/smccc/smccc.c
>> +++ b/drivers/firmware/smccc/smccc.c
>> @@ -12,6 +12,8 @@
>>  #include <linux/platform_device.h>
>>  #include <asm/archrandom.h>
>>  
>> +#include "rmm.h"
>> +
>>  static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
>>  static enum arm_smccc_conduit smccc_conduit = SMCCC_CONDUIT_NONE;
>>  
>> @@ -85,6 +87,18 @@ static int __init smccc_devices_init(void)
>>  {
>>  	struct platform_device *pdev;
>>  
>> +	pdev = platform_device_register_simple("arm-smccc",
>> +					PLATFORM_DEVID_NONE, NULL, 0);
>> +	if (IS_ERR(pdev)) {
>> +		pr_err("arm-smccc: could not register device: %ld\n", PTR_ERR(pdev));
>> +	} else {
>> +		/*
>> +		 * Register the RMI and RSI devices only when firmware exposes
>> +		 * the required SMCCC function IDs at a supported revision.
>> +		 */
>> +		register_rsi_device(pdev);
>> +	}
>
> So as per the cover letter, instead of "arm-cca-dev" as a platform
> device, we get "arm-smccc" as a platform device with an auxiliary
> "arm-rsi-dev" child device. This does not get rid of the platform
> device, it just creates a synthetic platform device to represent the
> SMCCC firmware interface.
>
> Looking at the earlier discussion, I think this is what Greg/Jason were
> suggesting, except that we do not currently have an SMCCC platform
> device:
>
> https://lore.kernel.org/all/2025101534-frosty-shank-00b1@gregkh/
>
> If we go this route, shouldn't the platform device above be created only
> if !SMCCC_CONDUIT_NONE?
>

register_rsi_device() does check for 

	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
		return;

>
> "smccc_trng" would also fit this model (together with the driver),
> assuming we don't break any user-space (searching the Debian codebase
> did not find any use).

Will switch smccc_trng to an auxiliary device in the next revision.

-aneesh


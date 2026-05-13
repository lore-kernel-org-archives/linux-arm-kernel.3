Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EB4CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZupwSjkQ4gsVUgCccXxooEf9YCkyv1V1BGfE224HpY=; b=Bl5oLI0D22M6hYQMPmXK+1go39
	4N+xwIQOKjhyt0SL3YS2pCwvoOmCtqBw3122W3orCXD1nsgcQ3A7/QUW6LwNdl8lIo6lZFRDhRZGN
	U9nrHCiaTLpYIdPGsf88Lruk+/Inh4lDdqfBP1sjRH18RlyTdutWDA8+8SEemMe8n1DTJmtFGPfuL
	TFgQD2gBOk2YpoNNVi3PYbwRyLdsBUg0lK/nNBhr8+kSm7yGdjc1Rti+0vVo5sKkSxr75lcPyYWWK
	zAsmyW9j3us1FxjHZxMco/q3ganNOHbYHgfrjBnuAj5tRBhzjuEXK2G52CIYHgJ1vi6cKeDLjEdYR
	5+GaRvvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN77b-00000002FWf-1h85;
	Wed, 13 May 2026 10:47:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN77Y-00000002FVm-1A7s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:47:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F30841595;
	Wed, 13 May 2026 03:47:12 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BFD63F7B4;
	Wed, 13 May 2026 03:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778669238; bh=OgqGS/kY8nvnh9OETRtKIcNbhfvLGdyeAmEexN8EN5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GXyuBGl7N+I9IrOMPtW/uKNjpwmAhSM7gBxsvvNyB2BVi+wu62ix2lIf/thUSfhBG
	 fAeLABPGaXBAzwr+4YQY5SKBBeRr6T5chr3rbQn0ghulUpMxmbtJ4b9S5hj6xNIfmc
	 dKet3A/A6fqE8bVbVSoXPHed9KMKjjnENhfSGJZ4=
Date: Wed, 13 May 2026 11:47:09 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v4 1/2] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
Message-ID: <agRWrRqmxG2vHfg0@arm.com>
References: <20260427061615.905018-1-aneesh.kumar@kernel.org>
 <20260427061615.905018-2-aneesh.kumar@kernel.org>
 <agM699d4KwdjnS39@arm.com>
 <yq5aa4u3u7aq.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aa4u3u7aq.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_034720_393546_26BDC87A 
X-CRM114-Status: GOOD (  27.18  )
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

On Wed, May 13, 2026 at 12:26:13PM +0530, Aneesh Kumar K.V wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> > On Mon, Apr 27, 2026 at 11:46:14AM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
> >> index 88b50d660e85..2d2d363aaaee 100644
> >> --- a/arch/arm64/include/asm/rsi.h
> >> +++ b/arch/arm64/include/asm/rsi.h
> >> @@ -10,7 +10,7 @@
> >>  #include <linux/jump_label.h>
> >>  #include <asm/rsi_cmds.h>
> >>  
> >> -#define RSI_PDEV_NAME "arm-cca-dev"
> >> +#define RSI_DEV_NAME "arm-rsi-dev"
> > [...]
> >> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
> >> index bdee057db2fd..fc9b44b7c687 100644
> >> --- a/drivers/firmware/smccc/smccc.c
> >> +++ b/drivers/firmware/smccc/smccc.c
> >> @@ -12,6 +12,8 @@
> >>  #include <linux/platform_device.h>
> >>  #include <asm/archrandom.h>
> >>  
> >> +#include "rmm.h"
> >> +
> >>  static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
> >>  static enum arm_smccc_conduit smccc_conduit = SMCCC_CONDUIT_NONE;
> >>  
> >> @@ -85,6 +87,18 @@ static int __init smccc_devices_init(void)
> >>  {
> >>  	struct platform_device *pdev;
> >>  
> >> +	pdev = platform_device_register_simple("arm-smccc",
> >> +					PLATFORM_DEVID_NONE, NULL, 0);
> >> +	if (IS_ERR(pdev)) {
> >> +		pr_err("arm-smccc: could not register device: %ld\n", PTR_ERR(pdev));
> >> +	} else {
> >> +		/*
> >> +		 * Register the RMI and RSI devices only when firmware exposes
> >> +		 * the required SMCCC function IDs at a supported revision.
> >> +		 */
> >> +		register_rsi_device(pdev);
> >> +	}
> >
> > So as per the cover letter, instead of "arm-cca-dev" as a platform
> > device, we get "arm-smccc" as a platform device with an auxiliary
> > "arm-rsi-dev" child device. This does not get rid of the platform
> > device, it just creates a synthetic platform device to represent the
> > SMCCC firmware interface.
> >
> > Looking at the earlier discussion, I think this is what Greg/Jason were
> > suggesting, except that we do not currently have an SMCCC platform
> > device:
> >
> > https://lore.kernel.org/all/2025101534-frosty-shank-00b1@gregkh/
> >
> > If we go this route, shouldn't the platform device above be created only
> > if !SMCCC_CONDUIT_NONE?
> >
> 
> register_rsi_device() does check for 
> 
> 	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
> 		return;

Yes but I meant for the "arm-smccc" platform device, not the rsi one.
You don't want it create if SMCCC_CONDUIT_NONE.

-- 
Catalin


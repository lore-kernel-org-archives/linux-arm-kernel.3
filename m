Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70912FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPOduJLO4mOmGf2YUMXz/FwBP5VO3cUo22OtLHxOqY0=; b=jQwP3K1atW39L2UNW4/VAjy+BJ
	4s144LBsLXruWu1TrgSj2IX+nmywm0WGOJJ6qEzRUTjjGiDYS0W2OIMRrVRp0ItbdtIitZwhO5pFZ
	bXQ1v5BV3mCkO8oEEA3K4VlcBXnFIMmBhO5D7YwYWkYxhibcoUgVwF5kmpRwu8IPstm4HJIlovrrH
	WF6tW2u3QiWHNgQDjGD2kAb+w686Awy0pX3tXT0tiEBr8BdVP1HjonUTmbuROyBehp0WmPgAgXd1v
	9McPnZSF5V7mMs7y+RttBTDn4yi7moObL2TGhAAMODjtNx2mHk2i/3D8VztzD0e9RcHVdjMBecg9E
	TUVWOlRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDHB-0000000FvtM-2nCP;
	Tue, 05 May 2026 10:45:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDHA-0000000FvtE-1Ar1
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 10:45:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LPOduJLO4mOmGf2YUMXz/FwBP5VO3cUo22OtLHxOqY0=; b=CD5hWfo9GhZWg1713yVLELCvfy
	D17ZqFqNgYBovuh6e8zUBo5E4KARrk12qQ4E5uLiuIu/Sd4NHQrXBnCvFP315JxQ5NR1xOZ//n65S
	8kHo2dAvw9BVU0DlHCYB6N1+G6+5SLXqP7fE6NGQQD7TyxkhadGJ8k/lbcq3beaBS/tMo2eeFmb1w
	3gnFX4ap3h8RfzD/bX7pUFs7kvhGSYUh1Vx4A+zvwKi3mUcpjiGYfAG5DR9WrymbYqLT15nlz3CfX
	W6WLh8jsxVjbVuzNpTNCWmcPNgHldPJDE1yPhb6TN9Wmeh+5gbY9THqlo416AKzWnzOkIM6FA94ib
	3CcVotWg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDH2-0000000DF5y-2KG9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:45:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DE2B293B;
	Tue,  5 May 2026 03:44:59 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C217D3F763;
	Tue,  5 May 2026 03:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777977904; bh=nXnH+ukVWHiFgFzkGEuGRS3UZnP6EPJC93zYaHByI9k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dTV46SUXHzARKB78y1+A9QR0ngcUGXfCnANsGKX4rYYv26v4ipV6zAg1oJhyzy2vg
	 To+WmwyY7GDYttqUYc5PIxwHqzgiS2/JNVABQa8IvnaLEH/COx86dTQEBZMpkG4tuf
	 4LGiN/y9ifQugZWcXHlwY5Ki9Mrp0D8keTFwCKbE=
Message-ID: <8942c12e-6315-493e-98c5-d55f4e6341f4@arm.com>
Date: Tue, 5 May 2026 11:45:00 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [RFC PATCH 0/3] initalise ff-a after finalising pKVM
To: Yeoreum Yun <yeoreum.yun@arm.com>, linux-integrity@vger.kernel.org,
 keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev
Cc: jarkko@kernel.org, zohar@linux.ibm.com, roberto.sassu@huawei.com,
 dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 catalin.marinas@arm.com, will@kernel.org, sudeep.holla@kernel.org
References: <20260505095409.1948371-1-yeoreum.yun@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260505095409.1948371-1-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_114511_814859_7A1C3006 
X-CRM114-Status: GOOD (  25.01  )
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

Hi Levi,

On 5/5/26 10:54, Yeoreum Yun wrote:
> This patch is split out from the patchset [0] --
> fix FF-A call failure with pKVM when the FF-A driver is built-in,
> specifically the IMA-related part.
> 
> When pKVM is enabled, the FF-A driver must be initialised after pKVM.
> Otherwise, pKVM cannot negotiate the FF-A version or obtain the RX/TX
> buffer information, leading to failures in FF-A calls.
> 
> Currently, pKVM initialisation completes at device_initcall_sync,
> while ffa_init() runs at the device_initcall level.
> 
> So far, linker deployes kvm_arm_init() before ffa_init(), and SMCs can
> still be trapped even before finalise_pkvm() is invoked.
> As a result, this issue has not been observed.
> 
> However, relying on above stuff is fragile.
> Therefore, when pKVM is enabled, the FF-A infrastructure should be
> initialised only after pKVM initialisation has been fully finalised.
> 
> To achieve this, introduce an ffa_root_dev ("arm-ffa") and
> a corresponding driver to defer initialisation of the FF-A infrastructure
> until pKVM initialisation is complete, and to defer probing of all FF-A devices until then
> when pKVM is enabled.
> 
> This patch is based on v7.1-rc2
> 
> Question:
> 
> FF-A initialisation can occur at late_initcall. Because it may be deferred,
> some FF-A requests cannot be serviced at that stage.
> A typical example is the EFI runtime variable service using DIRECT_MSG_REQ.
> 
> Depending on the platform, the EFI runtime variable service runs with StandaloneMm
> and uses FF-A DIRECT_REQ. However, when pKVM is enabled, FF-A initialisation
> may be deferred to late_initcall. In this case, load_uefi_certs()
> can fail if it is invoked before the FF-A driver is initialised
> via deferred_probe_initcall().
> 
> Moving load_uefi_certs() to late_initcall_sync, as in the third patch,
> seems not to have any problem since late_initcall and
> late_initcall_sync are both of do_basic_setup() and it's before loading
> init process. However, it is still unclear whether
> it would be better to allow DIRECT_MSG_REQ in kvm_host_ffa_handler()

The spec doesn't allow this. Looking at DEN0077A 1.2 REL0:

Section 13.2.2 says:

"If they are compatible, it enables them to determine which Framework functionalities can be used. Hence, negotiation of
the version must happen before an invocation of any other FF-A ABI."

and a bit further down

"Once the caller invokes any FF-A ABI other than FFA_VERSION, the version negotiation phase is complete."

I would have thought that an SP would only go into the waiting state once the version negotiation is done.

Thanks,

Ben

> even before FF-A version negotiation since handler’s purpose seems to hook
> certain memory operations, and DIRECT_MSG_REQ has been available
> since FF-A specification v1.0.
> 
> Any feedback or alternative suggestions would be appreciated!
> 
> Link: https://lore.kernel.org/all/20260422162449.1814615-1-yeoreum.yun@arm.com/ [0]
> 
> Yeoreum Yun (3):
>   arm64: KVM: defer kvm_init() to finalise_pkvm() when pKVM is enabled
>   firmware: arm_ffa: initialise ff-a after finalising pKVM
>     initialisation
>   security: integrity: call load_uefi_certs() at late_initcall_sync
> 
>  arch/arm64/kvm/arm.c                          |   8 +-
>  arch/arm64/kvm/pkvm.c                         |  15 ++-
>  drivers/firmware/arm_ffa/bus.c                | 125 +++++++++++++++++-
>  drivers/firmware/arm_ffa/common.h             |  13 +-
>  drivers/firmware/arm_ffa/driver.c             |  21 ++-
>  drivers/firmware/arm_ffa/smccc.c              |   2 +-
>  security/integrity/platform_certs/load_uefi.c |   2 +-
>  7 files changed, 166 insertions(+), 20 deletions(-)
> 
> 
> base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE34CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJkDQ0O9Xtv+xe17rEC0EzNxGCmOQ7aVeLC6BKG5uwg=; b=2dPJ5VbdwL8OTwF2bGtfpux+uD
	vF0dROajEJGLoEdPl32GQbF1yYYOhMjbp5VgPHPMwL2lfQMUvDRZiYSqkwn0NxXEDhE4c/ysJZYiL
	UgAehapaAV67lXT/JtkqdEZ4DwT92Hc69+tcI0TDRYLQPYy/2LbD7mL5kbvOeytU/ZzWSgLcguUbz
	bcGbMw8c1Sy6DMK/nb0pMJIMOXrWeBTSduiyFG2aEg3NuqHAPRxah6drZ7BmUH4d8+f6/zRf5OR8S
	ivbMK2CO6fvEwLWahhWpxxZmxJvIs4D8TluHRctjgNZskMVJLRJyYIpLTCjWl8pwn8fJcgSSu9GHy
	ZFSr5QZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHMU-0000000Gbgr-2K3O;
	Tue, 05 May 2026 15:07:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHMR-0000000Gbg6-1xP3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 15:07:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C9BB165C;
	Tue,  5 May 2026 08:06:52 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E02F83F836;
	Tue,  5 May 2026 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777993617; bh=BeYuC+U+TvY87kCGVgh7iHS9dj+g7bI/fKs9BPIiGBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f+iBoUGk8BmoZc0I83YuzJUwdRjjsapp0YmhbwVraS05rC5e8/lAxTo6QaBJzO/uz
	 XxwMCmGis1kvV3x3mcD/LXf1oAs+ephfkejwE3zO0tuJLrO6BlpAgIdVC8KOKKS1z0
	 5hKCdG2Glgkt/8ZNFa4lo3kv0SNaawo/o2/95uAI=
Date: Tue, 5 May 2026 16:06:51 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	jarkko@kernel.org, zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [RFC PATCH 2/3] firmware: arm_ffa: initialise ff-a after
 finalising pKVM initialisation
Message-ID: <afoHizU8NgFWzvYW@e129823.arm.com>
References: <20260505095409.1948371-1-yeoreum.yun@arm.com>
 <20260505095409.1948371-3-yeoreum.yun@arm.com>
 <20260505-super-gecko-of-argument-655030@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-super-gecko-of-argument-655030@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_080659_658028_B1C254BB 
X-CRM114-Status: GOOD (  20.98  )
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

Hi Sudeep,

> On Tue, May 05, 2026 at 10:54:08AM +0100, Yeoreum Yun wrote:
> > When pKVM is enabled, the FF-A driver must be initialised after pKVM.
> > Otherwise, pKVM cannot negotiate the FF-A version or obtain the RX/TX
> > buffer information, leading to failures in FF-A calls.
> > 
> > Currently, pKVM initialisation completes at device_initcall_sync,
> > while ffa_init() runs at the device_initcall level.
> > 
> > So far, linker deployes kvm_arm_init() before ffa_init(), and SMCs can
> > still be trapped even before finalise_pkvm() is invoked.
> > As a result, this issue has not been observed.
> > 
> > However, relying on above stuff is fragile.
> > Therefore, when pKVM is enabled, the FF-A infrastructure should be
> > initialised only after pKVM initialisation has been fully finalised.
> > 
> > To achieve this, introduce an ffa_root_dev ("arm-ffa") and
> > a corresponding driver to defer initialisation of the FF-A infrastructure
> > until pKVM initialisation is complete, and to defer probing of all FF-A devices until then
> > when pKVM is enabled.
> > 
> 
> I don't like this whole ffa root device design.
> Two question for now:
> 1. Can FF-A be a module on systems with pKVM which removes the need for all
>    this dance done here ?

But this means we reduce the other feature e.x) IMA with TPM over
FF-A and pKVM feature. Since IMA must be a built-in, we couldn't avoid
to build FF-A driver with built-in.

> 2. If it is a requirement to have this built-in, I prefer to add a probe
>    and defer it instead of this root ffa device.

But, How? anyway all of FF-A device & driver couldn't be probed unless
FF-A initialisation is finished and How can we trigger FF-A initailise
after pKVM finish its initialisation?

The problem is ff-a intiailisation happens before pKVM finish its
initailasation and to do defer probe, it should use dd-model and
As we discussed in other thread, notifier couldn't be a soluation.

Could you let me share other way I'm missing?

Thanks!

> -- 
> Regards,
> Sudeep

-- 
Sincerely,
Yeoreum Yun


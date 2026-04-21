Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98C9F8FA80
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 14:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3oJcLyo7vkpYXoTMc3/PzZ4YiSdMZCysgNXPHUpAiM=; b=oUEXcXbWnMIvhcMNhPYLS6c21C
	N4BXfBsWIi+g7z/x2an8dK8KrsaoXGsEQfa5FIHM2UFNIWh0X3tJSm4eN4VJn2TcB/geeicnG5ffQ
	QcOr8sz/BQSU7R10loZ6i2/Pzt4ndLtuKyri3e2QSLyuPe8T//ZYlQRaAYsJTmLJwPIG8PeSGaKwC
	GOVTQAfS7Q0PAn2tKOjiDA457ItQh+n3a2PKM9WT+jVd/qqcgcS++hLnnA97n/QNtueVpqeatj1ck
	fYmeD/5hDHArxXZo+JaHgwfJve0FlSalCGy3USYUrczCU2LeSqI3DGeKpDwUJ8+1w9prMpqwdxzLz
	6fkMPhLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBnB-00000008iRp-35YE;
	Tue, 21 Apr 2026 14:09:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBn9-00000008iRL-24kQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 14:09:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9411D25DC;
	Tue, 21 Apr 2026 07:09:23 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE3763F915;
	Tue, 21 Apr 2026 07:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776780568; bh=PM0r4vU3njSbwOSpmk+txAaJg1BVbJV8LhO5dpZzTXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aqpn6Rs6HdmexG8FiKGSHBbrKhhKVxm72mZiGAWnCbVyf1d+em6YjunDAfB22s/bS
	 QQkYCu8FBISjfN4/0nJ/dGmsJsEA5WNXPJ/KK2n0K4lAWF96MweAYDOhli6QHxz8Lc
	 MmQMD2rltRpMnrYoMqAktVh7FekpLbELIu7MJ2w0=
Date: Tue, 21 Apr 2026 15:09:23 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	roberto.sassu@huawei.com, dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com, peterhuewe@gmx.de, jarkko@kernel.org,
	jgg@ziepe.ca, sudeep.holla@kernel.org, maz@kernel.org,
	oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org
Subject: Re: [RFC PATCH 1/4] security: ima: move ima_init into
 late_initcall_sync
Message-ID: <aeeFE18HFBN/qDoU@e129823.arm.com>
References: <20260417175759.3191279-1-yeoreum.yun@arm.com>
 <20260417175759.3191279-2-yeoreum.yun@arm.com>
 <a6a0e15286c983d720de227c6827adbe976c5b9b.camel@linux.ibm.com>
 <aedyh61iTnQRyzMv@e129823.arm.com>
 <d6bcc9ef98a1e86887c5a79ff2822e70b5534343.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6bcc9ef98a1e86887c5a79ff2822e70b5534343.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_070931_696048_AA27D02B 
X-CRM114-Status: GOOD (  43.10  )
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

Hi Mimi,

> On Tue, 2026-04-21 at 13:50 +0100, Yeoreum Yun wrote:
> > Hi Mimi,
> >
> > > On Fri, 2026-04-17 at 18:57 +0100, Yeoreum Yun wrote:
> > > > To generate the boot_aggregate log in the IMA subsystem with TPM PCR values,
> > > > the TPM driver must be built as built-in and
> > > > must be probed before the IMA subsystem is initialized.
> > > >
> > > > However, when the TPM device operates over the FF-A protocol using
> > > > the CRB interface, probing fails and returns -EPROBE_DEFER if
> > > > the tpm_crb_ffa device — an FF-A device that provides the communication
> > > > interface to the tpm_crb driver — has not yet been probed.
> > > >
> > > > To ensure the TPM device operating over the FF-A protocol with
> > > > the CRB interface is probed before IMA initialization,
> > > > the following conditions must be met:
> > > >
> > > >    1. The corresponding ffa_device must be registered,
> > > >       which is done via ffa_init().
> > > >
> > > >    2. The tpm_crb_driver must successfully probe this device via
> > > >       tpm_crb_ffa_init().
> > > >
> > > >    3. The tpm_crb driver using CRB over FF-A can then
> > > >       be probed successfully. (See crb_acpi_add() and
> > > >       tpm_crb_ffa_init() for reference.)
> > > >
> > > > Unfortunately, ffa_init(), tpm_crb_ffa_init(), and crb_acpi_driver_init() are
> > > > all registered with device_initcall, which means crb_acpi_driver_init() may
> > > > be invoked before ffa_init() and tpm_crb_ffa_init() are completed.
> > > >
> > > > When this occurs, probing the TPM device is deferred.
> > > > However, the deferred probe can happen after the IMA subsystem
> > > > has already been initialized, since IMA initialization is performed
> > > > during late_initcall, and deferred_probe_initcall() is performed
> > > > at the same level.
> > > >
> > > > To resolve this, move ima_init() into late_inicall_sync level
> > > > so that let IMA not miss TPM PCR value when generating boot_aggregate
> > > > log though TPM device presents in the system.
> > > >
> > > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > >
> > > IMA should be initialized as early as possible. I'm really hesitant to defer
> > > ima_init() to late_initcall_sync() for systems that the TPM is currently
> > > initialized in time. For these systems, continue initializing IMA at
> > > late_initcall(). As a compromise for those systems that the TPM isn't properly
> > > initialized in time, define and instantiate the late_initcall_sync().
> > >
> > > ima_init() would need to differentiate between the late_initcall and
> > > late_initcall_sync.  On late_initcall(), instead of saying "No TPM chip found,
> > > activating TPM-bypass!",  it should say "No TPM chip found, deferring to
> > > late_initcall_sync" or something similar.
> >
> > But can we really move those initialisations to be called again?
> >
> > I am referring to functions such as ima_init_crypto(),
> > ima_add_boot_aggregate(), and ima_measure_critical_data() in ima_init()—
> > first without TPM, and then a second time once TPM becomes available.
> > I don’t think that approach would work.
> >
> > In other words, unless tpm_default_chip() can differentiate between a TPM
> > device that is deferred and one that does not exist, we cannot distinguish
> > between the “defer” case and “-EEXIST”.
> >
> > It might be possible if the TPM core tracked the state when a driver returns
> > -EPROBE_DEFER, but I am not sure that is the right approach.
> > For deferred probe cases, the “device initialised in time” check should
> > likely be done at late_initcall_sync, rather than late_initcall.
> >
> > This implies that any such check performed before late_initcall_sync
> > does not reflect a valid state, as it cannot distinguish between “not
> > present” and “deferred”.
> >
> > Therefore, I think the TPM check in IMA should be performed at
> > late_initcall_sync.
> >
> >
> > Am I missing something?
>
> In ima_init() you short circuit out, when called by late_initcall(), if the TPM
> hasn't been initialized.  So the rest of the ima_init() isn't called.  Roughly
> something like this (needs some cleanup):
>
> int __init ima_init(void)
> {
>         static int first = 1;
>         int rc;
>
>         if (ima_tpm_chip)
>                 return 0;
>
>         ima_tpm_chip = tpm_default_chip();
>         if (!ima_tpm_chip && first) {
>                 pr_info("No TPM chip found, deferring te late_initcall_sync()\n");
>                 first = 0;
>                 return 0;
>         }

I see. then I'll respin in v2.

Thanks!

--
Sincerely,
Yeoreum Yun


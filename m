Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D67FA1FEC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 19:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rXDVK33gfZVR3lpOnjY9M7/bnJ3YRSBVCxVw47KCfQ=; b=UJv68ne5pEwwKlJGgsu7WstasM
	poClyILC+Az7hUNYEF+G6EyAS/2lQH59uh4qNj07yYPc3NmWkI/WdHx+QpUaWArOsvwjg34MH2AB+
	zsoYxdtq9vcqAy8sos3o5PBNPfVcofWK1zo866bGOieWE/0Kmbd1TDKziUNn8M7dXDClWxwHMkwS8
	cV2Y/AOVOzn+JtRbhYFpiZazoKo5Fn8guQU/XyvXyEKQx4Wx/b64udmCle2FmEww2Kq3ZgRQpdpyj
	Ve5hmvLKO6V/vycUcNodK0Pz/T+RndRCvFnj27p0nugYC+01eCXtJVwXXLVpDKbSUemn24LPlvPfI
	LQuEYd2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFdRo-0000000Agmk-1F6d;
	Wed, 22 Apr 2026 19:41:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFdRl-0000000AgmN-2iIG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 19:41:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBCF22F;
	Wed, 22 Apr 2026 12:41:09 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE68F3F7B4;
	Wed, 22 Apr 2026 12:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776886875; bh=tGo1tyalwnLC7Qix4mlWc2AAj2+tR6uJ/+3oGMxJUVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ld27Ctu3LjLwz6nyJncF4IMY20+aIHT/e3N866KLdFOVkS2ybBAVb1fp0IiWooEF7
	 OTw5J2O+YHnNNRT/B23ikfOGGohqln1hPRtAbFlJWe7BNP2EwNp/Bo/HHtkP+eru/d
	 3PquYiSxL9s664PGxh/lDrWC43BpYpYW5dJMiK20=
Date: Wed, 22 Apr 2026 20:41:09 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	roberto.sassu@huawei.com, dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com, jarkko@kernel.org, jgg@ziepe.ca,
	sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com,
	sebastianene@google.com
Subject: Re: [RFC PATCH v2 1/4] security: ima: call ima_init() again at
 late_initcall_sync for defered TPM
Message-ID: <aekkVQwueKbFtG7C@e129823.arm.com>
References: <20260422162449.1814615-1-yeoreum.yun@arm.com>
 <20260422162449.1814615-2-yeoreum.yun@arm.com>
 <6919248bdc85dac60277fa9d9c83d8bd258ca635.camel@linux.ibm.com>
 <aekXaU52fzvNYaUF@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aekXaU52fzvNYaUF@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_124117_818520_7CBCD121 
X-CRM114-Status: GOOD (  30.77  )
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

> Hi Mimi,
>
> > On Wed, 2026-04-22 at 17:24 +0100, Yeoreum Yun wrote:
> > > To generate the boot_aggregate log in the IMA subsystem with TPM PCR values,
> > > the TPM driver must be built as built-in and
> > > must be probed before the IMA subsystem is initialized.
> > >
> > > However, when the TPM device operates over the FF-A protocol using
> > > the CRB interface, probing fails and returns -EPROBE_DEFER if
> > > the tpm_crb_ffa device — an FF-A device that provides the communication
> > > interface to the tpm_crb driver — has not yet been probed.
> > >
> > > To ensure the TPM device operating over the FF-A protocol with
> > > the CRB interface is probed before IMA initialization,
> > > the following conditions must be met:
> > >
> > >    1. The corresponding ffa_device must be registered,
> > >       which is done via ffa_init().
> > >
> > >    2. The tpm_crb_driver must successfully probe this device via
> > >       tpm_crb_ffa_init().
> > >
> > >    3. The tpm_crb driver using CRB over FF-A can then
> > >       be probed successfully. (See crb_acpi_add() and
> > >       tpm_crb_ffa_init() for reference.)
> > >
> > > Unfortunately, ffa_init(), tpm_crb_ffa_init(), and crb_acpi_driver_init() are
> > > all registered with device_initcall, which means crb_acpi_driver_init() may
> > > be invoked before ffa_init() and tpm_crb_ffa_init() are completed.
> > >
> > > When this occurs, probing the TPM device is deferred.
> > > However, the deferred probe can happen after the IMA subsystem
> > > has already been initialized, since IMA initialization is performed
> > > during late_initcall, and deferred_probe_initcall() is performed
> > > at the same level.
> > >
> > > To resolve this, call ima_init() again at late_inicall_sync level
> > > so that let IMA not miss TPM PCR value when generating boot_aggregate
> > > log though TPM device presents in the system.
> > >
> > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> >
> > A lot of change for just detecting whether ima_init() is being called on
> > late_initcall or late_initcall_sync(), without any explanation for all the other
> > changes (e.g. ima_init_core).
> >
> > Please just limit the change to just calling ima_init() twice.
>
> My concern is that ima_update_policy_flags() will be called
> when ima_init() is deferred -- not initialised anything.
> though functionally, it might be okay however,
> I think ima_update_policy_flags() and notifier should work after ima_init()
> works logically.
>
> This change I think not much quite a lot. just wrapper ima_init() with
> ima_init_core() with some error handling.
>
> Am I missing something?

Also, if we handle in ima_init() only, but it failed with other reason,
we shouldn't call again ima_init() in the late_initcall_sync.

To handle this, It wouldn't do in the ima_init() but we need to handle
it by caller of ima_init().

--
Sincerely,
Yeoreum Yun


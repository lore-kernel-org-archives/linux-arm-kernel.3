Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBE0F589CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 13:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhqmQtSXuGtz3JsE5XvFwEBY9BcH2MnEeQMlIt5rSN0=; b=iZ2TXdwMDDfKNBcAheB+Vxarzi
	6W8vI/zjtxaEACKtex0eDtTHwKjEbzCP/pX6AEGFv3PFqzADS8RYIPlYrzdtcjbMP+odFo4E6Qiao
	1KT4LqeLOfsNX+16ENdzs0dORgfb+/zgCrsZxTLO6M/9NC3eCbKQGndvGeivIrmOpYmC9EzTYUnB1
	abRb1CzGZoqAOOZSSzR5E7JlR7isvqRxgdsJZXJOhikMMqRbkShDspPwpuTVdr7OaGySZMROaR6Zx
	sZonv6JCmpdUCs1+JXHkwd5YRkyheB+SkTGP+tsMlMLGyizGH0OZcuE1ITKnbZ+GF0J1DKviMfz6H
	Zu3NJqNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtm2-0000000BiVk-1iWP;
	Thu, 23 Apr 2026 13:07:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtlw-0000000BiV1-14xJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 13:07:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28BE71C25;
	Thu, 23 Apr 2026 06:07:04 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 252DA3F23F;
	Thu, 23 Apr 2026 06:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776949629; bh=RHhcDZSJjqbRFX5DvA0y5u/itfLV8Axf4SV02gWmRjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RETRutih09HHlXWKLVKHaO/cqhNbepyaLVofdEY4Le4dC4voXpZcY79oHaMaR5IzT
	 7c0IXm9yjEBBV4I8YBJ+yzU/LSzXbmoplWIqeZhp+uaIikQqVg29Und9n0ibXiUCt9
	 W7ktWMiz+W5UB4frGHtuw/sdI7E8LZLCCwvOpjOo=
Date: Thu, 23 Apr 2026 14:07:03 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jonathan McDowell <noodles@earth.li>
Cc: Mimi Zohar <zohar@linux.ibm.com>, linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org,
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
Message-ID: <aeoZd/qb+/W6ufwz@e129823.arm.com>
References: <20260422162449.1814615-2-yeoreum.yun@arm.com>
 <6919248bdc85dac60277fa9d9c83d8bd258ca635.camel@linux.ibm.com>
 <aekXaU52fzvNYaUF@e129823.arm.com>
 <aekkVQwueKbFtG7C@e129823.arm.com>
 <82803bb3b471898a77084c449b73c7f7b4eb2149.camel@linux.ibm.com>
 <aem0SSQuE1e3pGOS@e129823.arm.com>
 <56a8aab50a3b5ce0a345fc2079fb2abc7d0f1b23.camel@linux.ibm.com>
 <aeoAlVEwzRUPrlVe@e129823.arm.com>
 <aeoRxWPyOHGJd+Jh@e129823.arm.com>
 <aeoWO2Cwo04YYu2l@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeoWO2Cwo04YYu2l@earth.li>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_060712_389141_34BE902B 
X-CRM114-Status: GOOD (  56.43  )
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

Hi,

> > > > On Thu, 2026-04-23 at 06:55 +0100, Yeoreum Yun wrote:
> > > > > > On Wed, 2026-04-22 at 20:41 +0100, Yeoreum Yun wrote:
> > > > > > > > Hi Mimi,
> > > > > > > >
> > > > > > > > > On Wed, 2026-04-22 at 17:24 +0100, Yeoreum Yun wrote:
> > > > > > > > > > To generate the boot_aggregate log in the IMA subsystem with TPM PCR values,
> > > > > > > > > > the TPM driver must be built as built-in and
> > > > > > > > > > must be probed before the IMA subsystem is initialized.
> > > > > > > > > >
> > > > > > > > > > However, when the TPM device operates over the FF-A protocol using
> > > > > > > > > > the CRB interface, probing fails and returns -EPROBE_DEFER if
> > > > > > > > > > the tpm_crb_ffa device — an FF-A device that provides the communication
> > > > > > > > > > interface to the tpm_crb driver — has not yet been probed.
> > > > > > > > > >
> > > > > > > > > > To ensure the TPM device operating over the FF-A protocol with
> > > > > > > > > > the CRB interface is probed before IMA initialization,
> > > > > > > > > > the following conditions must be met:
> > > > > > > > > >
> > > > > > > > > >    1. The corresponding ffa_device must be registered,
> > > > > > > > > >       which is done via ffa_init().
> > > > > > > > > >
> > > > > > > > > >    2. The tpm_crb_driver must successfully probe this device via
> > > > > > > > > >       tpm_crb_ffa_init().
> > > > > > > > > >
> > > > > > > > > >    3. The tpm_crb driver using CRB over FF-A can then
> > > > > > > > > >       be probed successfully. (See crb_acpi_add() and
> > > > > > > > > >       tpm_crb_ffa_init() for reference.)
> > > > > > > > > >
> > > > > > > > > > Unfortunately, ffa_init(), tpm_crb_ffa_init(), and crb_acpi_driver_init() are
> > > > > > > > > > all registered with device_initcall, which means crb_acpi_driver_init() may
> > > > > > > > > > be invoked before ffa_init() and tpm_crb_ffa_init() are completed.
> > > > > > > > > >
> > > > > > > > > > When this occurs, probing the TPM device is deferred.
> > > > > > > > > > However, the deferred probe can happen after the IMA subsystem
> > > > > > > > > > has already been initialized, since IMA initialization is performed
> > > > > > > > > > during late_initcall, and deferred_probe_initcall() is performed
> > > > > > > > > > at the same level.
> > > > > > > > > >
> > > > > > > > > > To resolve this, call ima_init() again at late_inicall_sync level
> > > > > > > > > > so that let IMA not miss TPM PCR value when generating boot_aggregate
> > > > > > > > > > log though TPM device presents in the system.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > > > > > > > >
> > > > > > > > > A lot of change for just detecting whether ima_init() is being called on
> > > > > > > > > late_initcall or late_initcall_sync(), without any explanation for all the other
> > > > > > > > > changes (e.g. ima_init_core).
> > > > > > > > >
> > > > > > > > > Please just limit the change to just calling ima_init() twice.
> > > > > > > >
> > > > > > > > My concern is that ima_update_policy_flags() will be called
> > > > > > > > when ima_init() is deferred -- not initialised anything.
> > > > > > > > though functionally, it might be okay however,
> > > > > > > > I think ima_update_policy_flags() and notifier should work after ima_init()
> > > > > > > > works logically.
> > > > > > > >
> > > > > > > > This change I think not much quite a lot. just wrapper ima_init() with
> > > > > > > > ima_init_core() with some error handling.
> > > > > > > >
> > > > > > > > Am I missing something?
> > > > > > >
> > > > > > > Also, if we handle in ima_init() only, but it failed with other reason,
> > > > > > > we shouldn't call again ima_init() in the late_initcall_sync.
> > > > > > >
> > > > > > > To handle this, It wouldn't do in the ima_init() but we need to handle
> > > > > > > it by caller of ima_init().
> > > > > >
> > > > > > Only tpm_default_chip() is being called to set the ima_tpm_chip.  On failure,
> > > > > > instead of going into TPM-bypass mode, return immediately.  There are no calls
> > > > > > to anything else.  Just call ima_init() a second time.
> > > > >
> > > > > I’m not fully convinced this is sufficient.
> > > > >
> > > > > What I meant is the case where ima_init() fails due to other
> > > > > initialisation steps, not only tpm_default_chip() (e.g. ima_fs_init()).
> > > >
> > > > The purpose of THIS patch is to add late_initcall_sync, when the TPM is not
> > > > available at late_initcall.  This would be classified as a bug fix and would be
> > > > backported.  No other changes should be included in this patch.
> > >
> > > Okay.
> > >
> > > > >
> > > > > I’d also like to ask again whether it is fine to call
> > > > > ima_update_policy_flags() and keep the notifier registered in the
> > > > > deferred TPM case. While this may be functionally acceptable, it seems
> > > > > logically questionable to do so when ima_init() has not completed.
> > > >
> > > > Other than extending the TPM, IMA should behave exactly the same whether there
> > > > is a TPM or goes into TPM-bypass mode.
> > > >
> > > > >
> > > > > There is also a possibility that a deferred case ultimately fails (e.g.
> > > > > deferred at late_initcall, but then failing at late_initcall_sync
> > > > > for another reason, even while entering TPM bypass mode). In that case,
> > > > > it seems more appropriate to handle this state in the caller of
> > > > > ima_init(), rather than inside ima_init() itself.
> > > >
> > > > If the TPM isn't found at late_initcall_sync(), then IMA should go into TPM-
> > > > bypass mode.  Please don't make any other changes to the existing IMA behavior
> > > > and hide it here behind the late_initcall_sync change.
> > >
> > > Okay. you're talking called ima_update_policy_flags() at late_initcall
> > > wouldn't be not a problem even in case of late_initcall_sync's ima_init()
> > > get failed with "TPM-bypass mode".
> > >
> > > I see then, I'll make a patch simpler then.
> >
> > But I think in case of below situation:
> >  - late_initcall's first ima_init() is deferred.
> >  - late_initcall_sync try again but failed and try again with
> >    CONFIG_IMA_DEFAULT_HASH.
> >
> > I would like to sustain init_ima_core to reduce the same code repeat
> > in late_initcall_sync.
>
> I think what Mimi's proposing is:
>
> If we're in late_initcall, and the TPM isn't available, return immediately
> with an error (the EPROBE_DEFER?), don't do any init.
>
> If we're in late_initcall_sync, either we're already initialised, so do
> return and nothing, or run through the entire flow, even if the TPM isn't
> unavailable.
>
> So ima_init() just needs to know a) if it's in the sync or non-sync mode and
> b) for the sync mode, if we've already done the init at
> non-sync.

But think think about when "late_initcall_sync" happens.
In case of it, whether TPM present or by-pass mode, if it failed,
it try again with the DEFAULT_HASH if hash isn't use DEFAULT one
(e.x. user set boot arguments hash_setup=md5).

IOW, late_initcall_sync should call twice just like former code do this.
I mean to wrap this duplication of code with init_core_ima().
so that int late_initcall_sync in case of deferred case to try agina
ima_init() with the DEFAULT HASH.

--
Sincerely,
Yeoreum Yun


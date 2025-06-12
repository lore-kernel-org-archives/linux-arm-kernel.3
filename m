Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF36C71143
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+G0MkenI8+78yTdy/GxEdsQJdm0H15Gx5Ts3QRYT38=; b=TFlJfHabuPLp61mUVVuyGOHAjS
	vnOwd61bkAynHBmiJgGK+1c/bVOqSGC8C64hdAVoakmviVm0ODi+XHsvMWlweLSKBSQK0qohbOfZy
	PO3qKQlF04vM1sTFFjUWiQB2qmuGWEZ4SeaQEOAdrCySu1ZCxJ5qPG4dIykl75a17jz2mG1pDKaHj
	+79f3JIsWnLUzxdGYTLpEUefWxyFACFVGIxKiwwc9C2zHcf8SWmBds1M4duE3kZG+Hzbx+am/1Apb
	VfWRaXIP25VRn3CMB1x6gLlCqfSZld1tuKy4iIcO8yUmUebEaVx27+lQP1W/rnuWI90I4mPW24WRA
	wgBoOEBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhpc-0000000DMZe-0GFT;
	Thu, 12 Jun 2025 13:19:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPfD1-0000000CzOF-3ckw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 10:31:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 313604A1DD;
	Thu, 12 Jun 2025 10:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0929C4CEEA;
	Thu, 12 Jun 2025 10:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749724259;
	bh=UptZCHL/SIqqhiJnZoOAivvnbhhBVRs8nh2meH1TAcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RoppQeLrgwYBS3NtzwQCtg9PLDtH/IW+ZdBAiOqEUnLKHV7xetiRSWhnJCL+5ufcr
	 TLeO5n8ZYUTLCEvR/bpqNXAckoT3PD8OstCVmnSkcaacWAbQsqFbjhxXKXjml9hGx0
	 g3gSZuma6ldoBoH5tCj1cqwYsBg2wt9X1kp5GrcAf4TiSTpkVKYjM+D3rKXThm2kxd
	 prCk207kuuLlS4HyEGVy5tHgKTtw4uBDlBdiwDjwHvU1wLmKsvzQab0rtIAj96qAz3
	 VHItFaOFe64btH1Wmli7MOVyhz4OR9jLZe/OH0J0Mk5NXu+XyRzR9n0F+9KokdT4vT
	 Y798ZykDBKcQQ==
Date: Thu, 12 Jun 2025 13:30:55 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: sudeep.holla@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca,
	stuart.yoder@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v2 0/2] fix failure of integration IMA with tpm_crb_ffa
Message-ID: <aEqsX0hBKb7ZC1qZ@kernel.org>
References: <20250610060334.2149041-1-yeoreum.yun@arm.com>
 <aEgmhwu1RP27yBpw@kernel.org>
 <aEgwpXXftXW6JNRy@e129823.arm.com>
 <aEg6Bgh8TqzK5nSu@kernel.org>
 <aEhDY4VlkIPYAjPE@e129823.arm.com>
 <aEhIPC95FisptBO5@kernel.org>
 <aEhNnAxlToRMteA2@e129823.arm.com>
 <aEmxaJQNfYJwSCd0@kernel.org>
 <aEm+gqyp0aa4ULYa@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEm+gqyp0aa4ULYa@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_033059_919641_69E1A9AC 
X-CRM114-Status: GOOD (  21.13  )
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

On Wed, Jun 11, 2025 at 06:36:02PM +0100, Yeoreum Yun wrote:
> Hi Jarkko,
> 
> > On Tue, Jun 10, 2025 at 04:22:04PM +0100, Yeoreum Yun wrote:
> > > > OK, if ffa_init() is leveled up in the initcall hierarchy, shouldn't
> > > > that be enough as long as ko's can be found from initramfs?
> > >
> > > As you mentioned, this is handled in Patch #1.
> > > However, although ffa_init() is called first,
> > > unless tpm_crb_ffa_init() is also invoked,
> > > crb_acpi_driver_init() will fail with -EPROBE_DEFER.
> > >
> > > Please note that IMA is always built-in and cannot be built as a module.
> >
> > Sure but if one needs IMA, then tpm_crb_ffa can be compiled as built-in
> > with zero code changes.
> 
> All of my describtion based on all things are built as "built-in".
> in case of ffa_init() changes the init level to root_initcall,
> so, the ffa_device will be produced first before the trial of TPM probe.
> 
> Note that tpm_crb_ffa_init() which is the "ffa_driver" is called in
> device_initcall level. I mean
> 
>     ffa_init() -> arm_ffa -> root_initcall
>     tpm_crb_ffa_init() -> device_initcall
>     crb_acpi_driver_init() -> device_initcall
> 
> therefore, "crb_acpi_driver_init()" can be call first before
> tpm_crb_ffa_init() since they're deployed in device_initcall.
> If this happen, "crb_acpi_driver_init()" failed with -EPROBE_DEFER.
> 
> That's why this patch is required to probe "tpm_crb_ffa" when
> crb_acpi_driver_init() called to complete the TPM device probe before
> IMA subsystem initailization.

Yep, and you sort it out by not compiling it as a module.

+	ret = ffa_register(&tpm_crb_ffa_driver);
+	BUG_ON(!ret && !tpm_crb_ffa);

These lines struck me in your patch. The commit message has nothing
about ffa_register().

Also, please remove BUG_ON(). That said, I don't think 2/2 is needed.

> 
> Thanks.
> 
> --
> Sincerely,
> Yeoreum Yun


BR, Jarkko


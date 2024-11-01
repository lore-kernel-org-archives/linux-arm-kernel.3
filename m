Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11A6E6F075
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 17:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnBaoA+nCLBNWyTrK/1YiSY2eLDw4f9jVMccFjdYI0E=; b=PzvS8krKOh9VkcPEyWQRp4/LI0
	mMF+po5KcaBSGWsE7ly/+9BdravluUaY6IOvWDOv2Hxo23cstfrey+DXPjC53j4TW8l5uYoQPbHVS
	AisbVTYDTXZhIh42ldf69n6kmSehjwQoj6rZPvKRnbe0eHFta7pocPq5uXktCyq81l6cvhWAz6UYQ
	O7bslWYG1IGBtGmuCrstLoIw6JajxDrcKjTgVqTyQfJ+fzMhiPpQBR5YcIaG8aqOyg/OdLCVTQDP2
	9ysk1XK9cFHNGJfoGm8LznxGPzIX5FPdUL3xmEnHhT6Rw5YFBVSXqKH3L9Rbc3LkZLOtHFr/+NS/T
	UCW5i1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vnP-00000007tbg-3bUp;
	Fri, 01 Nov 2024 17:50:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vlg-00000007tAa-24wK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 17:49:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09C815C02D6;
	Fri,  1 Nov 2024 17:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E5DC4CECD;
	Fri,  1 Nov 2024 17:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730483343;
	bh=/b91CoH0L4+ZOxrMGr0zsD4PKr5FuOWyhTBccBHPH7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LjtBASiJpj3wSWJdTJkZgQD3yarqRwCy6apE0QFm4Yo6QoTSPUahEDoXH/eZR5Wd6
	 loXUanal2E/JmK4aF1aCq61B4EkINhFbMdzBp21IbCNAnSVmM7wQEdroXQVurZg9Dl
	 WdjtXYLh3YN+FlE7SojVKHollfTiMWZ3WUSCE/Vnl5hbcudFjg+YsV6bwC5VhD2hdW
	 rwHsJ3S7bKIes/RzbFtfxPjx4qZDEoueK/xypG9lfrEjtOe5CpRmzRrkkS/a6RqPht
	 so5a9ymD7x0VWkisb6FJTR0pGEnM+OYO8duhU05uFutMCvjJPGgA6Rl7Jdg6rGQ/lB
	 ukMPsfwBG2mTg==
Date: Fri, 1 Nov 2024 18:48:55 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>, sami.mujawar@arm.com,
	ardb@kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
	Shuah Khan <shuah@kernel.org>, David Woodhouse <dwmw@amazon.co.uk>,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Francesco Lavra <francescolavra.fl@gmail.com>,
	Miguel Luis <miguel.luis@oracle.com>
Subject: Re: [PATCH v6 6/6] arm64: Use SYSTEM_OFF2 PSCI call to power off for
 hibernate
Message-ID: <ZyUUh6KawapLkj0z@lpieralisi>
References: <20241019172459.2241939-1-dwmw2@infradead.org>
 <20241019172459.2241939-7-dwmw2@infradead.org>
 <ZyPEn4qhaYyYqrzk@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyPEn4qhaYyYqrzk@lpieralisi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_104904_632377_079D51BF 
X-CRM114-Status: GOOD (  25.29  )
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

[+Ard, Sami, for EFI]

On Thu, Oct 31, 2024 at 06:55:43PM +0100, Lorenzo Pieralisi wrote:
> On Sat, Oct 19, 2024 at 06:15:47PM +0100, David Woodhouse wrote:
> 
> [...]
> 
> > +#ifdef CONFIG_HIBERNATION
> > +static int psci_sys_hibernate(struct sys_off_data *data)
> > +{
> > +	/*
> > +	 * Zero is an acceptable alternative to PSCI_1_3_OFF_TYPE_HIBERNATE_OFF
> > +	 * and is supported by hypervisors implementing an earlier version
> > +	 * of the pSCI v1.3 spec.
> > +	 */
> 
> It is obvious but with this patch applied a host kernel would start executing
> SYSTEM_OFF2 too if supported in firmware to hibernate, it is not a hypervisor
> only code path.
> 
> Related to that: is it now always safe to override
> 
> commit 60c0d45a7f7a ("efi/arm64: use UEFI for system reset and poweroff")
> 
> for hibernation ? It is not very clear to me why overriding PSCI for
> poweroff was the right thing to do - tried to follow that patch history but
> the question remains (it is related to UpdateCapsule() but I don't know
> how that applies to the hibernation use case).

RFC: It is unclear to me what happens in current mainline if we try to
hibernate with EFI runtime services enabled and a capsule update pending (we
issue EFI ResetSystem(EFI_RESET_SHUTDOWN,..) which might not be compatible
with the reset required by the pending capsule update request) what happens
in this case I don't know but at least the choice is all contained in
EFI firmware.

Then if in the same scenario now we are switching to PSCI SYSTEM_OFF2 for the
hibernate reset I suspect that what happens to the in-flight capsule
update requests strictly depends on what "reset" PSCI SYSTEM_OFF2 will
end up doing ?

I think this is just a corner case and it is unlikely it has been ever
tested (is it even possible ? Looking at EFI folks) - it would be good
to clarify it at least to make sure we understand this code path.

Thanks,
Lorenzo


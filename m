Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B896D5CCAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 12:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJDEPXTChMKrpdGhvAdJvqibkp4cmd3gs/U830lsVoU=; b=aMSkTdy8DZ585B0kSxWRdSY1x5
	UyW56CIl65xFLgIB52KMrUOrJ9MZSVewDIYX3a3M8iGVaXmHZ/2qekkVdpko77vl00a3TaPA7Myxx
	emSD88nepmeDb7qBkWr+N/t4bFdDpmLQSI3pW/TRJkLglAbD7T3wcMq3PKcjLipDvEgjiqqQR+jwP
	P2G4WIp788Ml0ak5LYgngAh2honN0hthVG/90/HDOVD6jqox1J+JyshJbkxEwwyrgjxOaLC1DlVIb
	lxZBXHpbdBfXm4sZYljb9CcT6klxEsFpy+AnPnxRFtCYVCFZW1cwtgD28vq5XD4p7GafYF7mulemc
	69IDESTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6U92-00000003VWC-1DeU;
	Thu, 31 Oct 2024 12:19:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6U6B-00000003V5t-2nOt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:16:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 37B8CA44131;
	Thu, 31 Oct 2024 12:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573A1C4CEF5;
	Thu, 31 Oct 2024 12:16:18 +0000 (UTC)
Date: Thu, 31 Oct 2024 12:16:16 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
Message-ID: <ZyN1EMPCjdX7zZSB@arm.com>
References: <20241019172459.2241939-1-dwmw2@infradead.org>
 <20241019172459.2241939-7-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019172459.2241939-7-dwmw2@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_051623_789551_56713F4E 
X-CRM114-Status: GOOD (  23.47  )
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

On Sat, Oct 19, 2024 at 06:15:47PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The PSCI v1.3 specification adds support for a SYSTEM_OFF2 function
> which is analogous to ACPI S4 state. This will allow hosting
> environments to determine that a guest is hibernated rather than just
> powered off, and handle that state appropriately on subsequent launches.
> 
> Since commit 60c0d45a7f7a ("efi/arm64: use UEFI for system reset and
> poweroff") the EFI shutdown method is deliberately preferred over PSCI
> or other methods. So register a SYS_OFF_MODE_POWER_OFF handler which
> *only* handles the hibernation, leaving the original PSCI SYSTEM_OFF as
> a last resort via the legacy pm_power_off function pointer.
> 
> The hibernation code already exports a system_entering_hibernation()
> function which is be used by the higher-priority handler to check for
> hibernation. That existing function just returns the value of a static
> boolean variable from hibernate.c, which was previously only set in the
> hibernation_platform_enter() code path. Set the same flag in the simpler
> code path around the call to kernel_power_off() too.
> 
> An alternative way to hook SYSTEM_OFF2 into the hibernation code would
> be to register a platform_hibernation_ops structure with an ->enter()
> method which makes the new SYSTEM_OFF2 call. But that would have the
> unwanted side-effect of making hibernation take a completely different
> code path in hibernation_platform_enter(), invoking a lot of special dpm
> callbacks.
> 
> Another option might be to add a new SYS_OFF_MODE_HIBERNATE mode, with
> fallback to SYS_OFF_MODE_POWER_OFF. Or to use the sys_off_data to
> indicate whether the power off is for hibernation.
> 
> But this version works and is relatively simple.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Acked-by: Rafael J. Wysocki <rafael@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>


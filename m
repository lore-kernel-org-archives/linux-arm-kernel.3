Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFFAD149F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 22:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zT1JrWE0wCzIdFq3Ykrqf07oSRTFil0hjG6CI7HG/ls=; b=35m4vzWRgiQ+fXd2Fz6SbpG0p7
	FQbZNwQ7MGEguxEc2u9NjO2aACsxBciVsn21l6qBqF1XDL0dB7cBv46ZzKcCY/8m8C1UuJxBdv/VM
	8hI5MzCyED5IoJRG4fw+H3+uOdNfKdS3iHhC0fWCP6n4rzanJ8whSegaTgrczvjZ0L9kKgO7aZMXl
	Ep/F1Em6QDN7bcxlnMfDWv5H3uOo3AIU9Ojbo5HMTBbwpdT4NAAylG3XkKWL00FdgWFjM0XoLLAHC
	51sMxhht2tb9wPoCmUONiUTO9mjfxriUfcKQ/6ElIwEvgxdeL3sxjovyUKzzfj/sMBc7560D3vG8T
	582lt/Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Sct-00000005Q6i-0HWa;
	Fri, 25 Oct 2024 22:17:47 +0000
Received: from out-175.mta0.migadu.com ([91.218.175.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4SYF-00000005POP-2Gqa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 22:13:01 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729894375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zT1JrWE0wCzIdFq3Ykrqf07oSRTFil0hjG6CI7HG/ls=;
	b=GsqKIeiVrOjDeIqr8pui3jQ5t9ZLl0riwXzeEm3iMypLtUcBfhsFMieprt7Jp5OCC0vXYD
	VeR8QxXxWX+5gPplyWcBcmvxVFiiLWnU3/GseaivcagIBJbS3cu7H4+xzUuK/o30WeNPCG
	EK6wMoMIt90L9dhTT5SxTL+0e1zn780=
From: Oliver Upton <oliver.upton@linux.dev>
To: Zenghui Yu <yuzenghui@huawei.com>,
	James Morse <james.morse@arm.com>,
	linux-doc@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	kvmarm@lists.linux.dev,
	Len Brown <len.brown@intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Miguel Luis <miguel.luis@oracle.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	linux-kselftest@vger.kernel.org,
	Francesco Lavra <francescolavra.fl@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Oliver Upton <oliver.upton@linux.dev>
Subject: Re: (subset) [PATCH v6 0/6] Add PSCI v1.3 SYSTEM_OFF2 support for hibernation
Date: Fri, 25 Oct 2024 22:12:41 +0000
Message-ID: <172989416837.3684225.4795897590830335669.b4-ty@linux.dev>
In-Reply-To: <20241019172459.2241939-1-dwmw2@infradead.org>
References: <20241019172459.2241939-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_151300_134089_C4656538 
X-CRM114-Status: GOOD (  12.01  )
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

On Sat, 19 Oct 2024 18:15:41 +0100, David Woodhouse wrote:
> The PSCI v1.3 spec (https://developer.arm.com/documentation/den0022)
> adds support for a SYSTEM_OFF2 function enabling a HIBERNATE_OFF state
> which is analogous to ACPI S4. This will allow hosting environments to
> determine that a guest is hibernated rather than just powered off, and
> ensure that they preserve the virtual environment appropriately to
> allow the guest to resume safely (or bump the hardware_signature in the
> FACS to trigger a clean reboot instead).
> 
> [...]

I grabbed the KVM portions of this series, as they look ready to go. Happy
to take the last one through kvmarm tree w/ acks, and can toss it on top.

Applied to kvmarm/next, thanks!

[1/6] firmware/psci: Add definitions for PSCI v1.3 specification
      https://git.kernel.org/kvmarm/kvmarm/c/2f2d46959808
[2/6] KVM: arm64: Add PSCI v1.3 SYSTEM_OFF2 function for hibernation
      https://git.kernel.org/kvmarm/kvmarm/c/97413cea1c48
[3/6] KVM: arm64: Add support for PSCI v1.2 and v1.3
      https://git.kernel.org/kvmarm/kvmarm/c/8be82d536a9f
[4/6] KVM: selftests: Add test for PSCI SYSTEM_OFF2
      https://git.kernel.org/kvmarm/kvmarm/c/72be5aa6be4a
[5/6] KVM: arm64: nvhe: Pass through PSCI v1.3 SYSTEM_OFF2 call
      https://git.kernel.org/kvmarm/kvmarm/c/94f985c39a1e

--
Best,
Oliver


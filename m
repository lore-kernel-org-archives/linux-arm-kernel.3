Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93471D767F4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 17:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWtV3C7i/G3T+slJBVyjKo2SBOT6MrCS/c6nAmcFKU8=; b=Nm06h0yN1i1iecvlioeqiy6ILi
	ComEe65OyvC7Pm5D6OsJVCf6VORJR1n53s0XfnxqQPsEdkD2pdw8uqvJZicPWCEx3sz0Qx1eg/yoB
	hD0aKjx4tVAm8Yq2F/XwsjM3lN4JqQxrCweDrS7Tzi6G18aQOUr7qFOwaLfxLkzfxJCHZPSuMh609
	Ork4vgRkKgz8ko2zErQLpy9nes12iIhK3uvnZ7kw8Yr9xSBmk6bN7rw6Uds0VNNQ9lGGFqBXKSXGg
	yMvM/JTH2FUrgYsnZm0ETXhVXIyT9gdFBLcvxO/t41Qpx4+VGJxD9gWVvzKeJqGr16Vdf4dsfZDZq
	2foDOYtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ZSN-00000004QeY-010G;
	Thu, 31 Oct 2024 17:59:39 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ZQ7-00000004Q8L-2CWs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 17:57:21 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730397432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bWtV3C7i/G3T+slJBVyjKo2SBOT6MrCS/c6nAmcFKU8=;
	b=XvOSQQTywyn8PCw6xWHtz1OrMtjHLRWt92nbzaZvZKYHrN31c8h6b8bI7KThzcdghDdNWP
	YYuFi56kPBEGeWUalckQgnAzJVNB2STUmA84eliFRc3Rq7w4FovNH2mvo1MqIcxGuF6HRB
	hIv2QMaIVOKAYrQ9wt2bRNq0OqomD7w=
From: Oliver Upton <oliver.upton@linux.dev>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pavel Machek <pavel@ucw.cz>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Will Deacon <will@kernel.org>,
	Len Brown <len.brown@intel.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	kvmarm@lists.linux.dev,
	David Woodhouse <dwmw@amazon.co.uk>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Francesco Lavra <francescolavra.fl@gmail.com>,
	linux-pm@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	kvm@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Luis <miguel.luis@oracle.com>,
	linux-kernel@vger.kernel.org,
	James Morse <james.morse@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	linux-doc@vger.kernel.org,
	Zenghui Yu <yuzenghui@huawei.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Oliver Upton <oliver.upton@linux.dev>
Subject: Re: (subset) [PATCH v6 0/6] Add PSCI v1.3 SYSTEM_OFF2 support for hibernation
Date: Thu, 31 Oct 2024 17:56:58 +0000
Message-ID: <173039739006.2928363.16193131105108954688.b4-ty@linux.dev>
In-Reply-To: <20241019172459.2241939-1-dwmw2@infradead.org>
References: <20241019172459.2241939-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_105719_791811_778543FA 
X-CRM114-Status: GOOD (  10.52  )
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

Thanks Catalin for the ack, as promised:

Applied to kvmarm/next, thanks!

[6/6] arm64: Use SYSTEM_OFF2 PSCI call to power off for hibernate
      https://git.kernel.org/kvmarm/kvmarm/c/3e251afaec9a

--
Best,
Oliver


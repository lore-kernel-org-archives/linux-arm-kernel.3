Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386B0D6B6A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 12:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9PP7SOh+ShQMVJSREjqhktD1dlC8Yd29xfB6FbB4eE=; b=fn0LwlEh+wAaGIhLgBxIztq3oG
	k33eO7z8AXIHIU98hELGiwV8Y/JBSZf6k0yJ7N56KKTy2PLwLkRoePzxa8+2QZnRYs9Mz9iOBPJzA
	bcHGXfBQBsDGvYjvRGSGpWdDp46nMyjdYt5ZkEwxFbOAA2VPzAfenbJmCDP7hrby8tCYhDJbMK6MB
	1g0hn1q4b79sMDOusYYhOpjzGAKgYhNYS679tdV1X913zzrkGAXgolNtTW+7/CBQvEHC9yGKDKz7M
	5UUxGn4Xc1Qat/L4IORtn/cy+d2bZ4g7mdfO5W5MnCW8FBo27i1ug2OwAZjuFcRXPxBVnQ96/T+Wj
	I9OxwxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6U7Q-00000003VGj-0Yfi;
	Thu, 31 Oct 2024 12:17:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6U5k-00000003UzK-1Ug2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:15:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C65E3A440CE;
	Thu, 31 Oct 2024 12:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E468AC4CEDC;
	Thu, 31 Oct 2024 12:15:50 +0000 (UTC)
Date: Thu, 31 Oct 2024 12:15:48 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Zenghui Yu <yuzenghui@huawei.com>, James Morse <james.morse@arm.com>,
	linux-doc@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
	Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	kvmarm@lists.linux.dev, Len Brown <len.brown@intel.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>, Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Miguel Luis <miguel.luis@oracle.com>, Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	linux-kselftest@vger.kernel.org,
	Francesco Lavra <francescolavra.fl@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v6 0/6] Add PSCI v1.3 SYSTEM_OFF2 support for
 hibernation
Message-ID: <ZyN09BSZqKLXLi6_@arm.com>
References: <20241019172459.2241939-1-dwmw2@infradead.org>
 <172989416837.3684225.4795897590830335669.b4-ty@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172989416837.3684225.4795897590830335669.b4-ty@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_051556_489418_56D8AD73 
X-CRM114-Status: GOOD (  15.84  )
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

On Fri, Oct 25, 2024 at 10:12:41PM +0000, Oliver Upton wrote:
> On Sat, 19 Oct 2024 18:15:41 +0100, David Woodhouse wrote:
> > The PSCI v1.3 spec (https://developer.arm.com/documentation/den0022)
> > adds support for a SYSTEM_OFF2 function enabling a HIBERNATE_OFF state
> > which is analogous to ACPI S4. This will allow hosting environments to
> > determine that a guest is hibernated rather than just powered off, and
> > ensure that they preserve the virtual environment appropriately to
> > allow the guest to resume safely (or bump the hardware_signature in the
> > FACS to trigger a clean reboot instead).
> > 
> > [...]
> 
> I grabbed the KVM portions of this series, as they look ready to go. Happy
> to take the last one through kvmarm tree w/ acks, and can toss it on top.

Happy for you to take the last patch as well through the KVM tree. Feel
free to adjust the code comment as you see fit.

-- 
Catalin


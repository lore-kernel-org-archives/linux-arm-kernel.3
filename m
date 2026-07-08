Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC32CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 17:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxaHlrIyCTT+Tky2RVoWtaCnnTjFxFRloEdDU4EuCzc=; b=NwmP0CKVXOVNNyY0CDEvrBsv7Q
	5Z8ly0cqi0ZXE6WEK+OXZjq+ATuHSYZru+YFHpD720kVvvWBspM85rZvjI2kMMlWAnAhGqnaMH3rH
	bzgxkf1TCIzs9jrEcSvZKJiXhrBqJhIr3Wo9AOVnzRLB/46Lej6cl0bHUmzLTvbEwE45cSjuh4MqT
	Rcz7l0DiEU2rgnoQpe3DNHyLAx90s++qkyzmUrSXxa79sVKbL07ewf5sIofjF7fEQnWEmyThUI7Kf
	R8ZSZrEntWQ11BlCY0M45EubbFBCR8t1R8zPT4e95KzFhMPGve4ZOA9w63l6rg5nxKJjH/vuOa9/+
	XQ0I6oIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVyU-000000005Tc-3PyV;
	Wed, 08 Jul 2026 17:22:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVyR-000000005SN-3QjN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 17:22:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF2071A9A;
	Wed,  8 Jul 2026 10:22:07 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E233F3F905;
	Wed,  8 Jul 2026 10:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783531332; bh=T4DolrksHpBlFffH/pVsAhemSkqQ2fajQ+WonnBkFcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oquNZy40VlB4u+ad+r39/E4zUwKgSz7vkaY1izkGo4d74I/MvaS6c0Vp7C719P/gx
	 f3GDkS6LHtD112cjRIwbCfMFsK/mXPh875q8wpbyUXgagUpJQyRh96GhP6xgAGug11
	 cOb/y3R5iARSx9k3/c6PcMUOXX9dBr4HY5Z7zVZ0=
Date: Wed, 8 Jul 2026 18:22:06 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Ruidong Tian <tianruidong@linux.alibaba.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Umang Chheda <umang.chheda@oss.qualcomm.com>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
	zhuo.song@linux.alibaba.com, oliver.yang@linux.alibaba.com,
	James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 00/16] Support Armv8 RAS Extensions for Kernel-first
 error handling
Message-ID: <ak6HPmosSUleJFYU@arm.com>
References: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
 <20260708024131.GCak242z-9YE2xL6q0@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708024131.GCak242z-9YE2xL6q0@fat_crate.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_102215_946624_DA212548 
X-CRM114-Status: GOOD (  18.39  )
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

On Tue, Jul 07, 2026 at 07:41:31PM -0700, Borislav Petkov wrote:
> On Tue, Jun 02, 2026 at 03:15:23PM +0800, Ruidong Tian wrote:
> >  Documentation/ABI/testing/debugfs-arm64-ras |   87 ++
> >  MAINTAINERS                                 |   11 +
> >  arch/arm64/include/asm/ras.h                |   99 ++
> >  drivers/acpi/arm64/Kconfig                  |   10 +
> >  drivers/acpi/arm64/Makefile                 |    1 +
> >  drivers/acpi/arm64/aest.c                   |  423 ++++++++
> >  drivers/ras/Kconfig                         |    1 +
> >  drivers/ras/Makefile                        |    1 +
> >  drivers/ras/arm64/Kconfig                   |   16 +
> >  drivers/ras/arm64/Makefile                  |    9 +
> >  drivers/ras/arm64/ras-cmn.c                 |  479 +++++++++
> >  drivers/ras/arm64/ras-core.c                | 1026 +++++++++++++++++++
> >  drivers/ras/arm64/ras-inject.c              |  130 +++
> >  drivers/ras/arm64/ras-storm.c               |  198 ++++
> >  drivers/ras/arm64/ras-sysfs.c               |  319 ++++++
> >  drivers/ras/arm64/ras.h                     |  374 +++++++
> >  drivers/ras/debugfs.c                       |    3 +-
> >  drivers/ras/ras.c                           |    3 +
> >  include/linux/acpi_aest.h                   |   36 +
> >  include/linux/cpuhotplug.h                  |    1 +
> >  include/linux/ras.h                         |   10 +
> >  include/ras/ras_event.h                     |   79 ++
> >  22 files changed, 3315 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/ABI/testing/debugfs-arm64-ras
> >  create mode 100644 arch/arm64/include/asm/ras.h
> >  create mode 100644 drivers/acpi/arm64/aest.c
> >  create mode 100644 drivers/ras/arm64/Kconfig
> >  create mode 100644 drivers/ras/arm64/Makefile
> >  create mode 100644 drivers/ras/arm64/ras-cmn.c
> >  create mode 100644 drivers/ras/arm64/ras-core.c
> >  create mode 100644 drivers/ras/arm64/ras-inject.c
> >  create mode 100644 drivers/ras/arm64/ras-storm.c
> >  create mode 100644 drivers/ras/arm64/ras-sysfs.c
[...]
> But that's still not that important - what is even more important is who from
> ARM is going to review and maintain this? I can take a look at the generic
> bits so that the RAS stuff coexists fine in drivers/ras/ but I'd need an ARM
> person to take care of this.
> 
> There are enough on Cc so let's see if anyone moves.

I will volunteer James Morse (he doesn't know yet) as the Arm RAS
expert. He's away this week, hopefully can have a look when he gets
back. For the ACPI bits, we have Lorenzo, Hanjun, Sudeep who should be
able to review.

Adding Rob Herring as well who's been giving some feedback on the DT
counterpart:

https://lore.kernel.org/all/20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com/

I have some vague recollection James wanting to start with something
simpler like EDAC and do DT first but I may be wrong or things could
have changed since. So, let's wait for James to comment.

-- 
Catalin


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3954FFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 13:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JkHp6xKRAW/MZYyZ7lFeEZ7wQ6ocTjVxF4mQwSs/vCI=; b=ZYYvubagFuQOxYTZyYjRnZFpvV
	ciIoM+agfusrbpAWaWJDhYBnjFSY807Jf29bYoIKLUBV3JcGFN+S5Y9H6wLAnf14aKHDSBgR/BvFN
	9VvFJ1b2/9RMQpOMsDcS01d2BgsSpKQY5h8n25vug2P8qW+C94BTKqL4MM4kLFxV4dT+RrGleKfUm
	H0sjrVt2xC9okXb3EJc7dQ2LTimcA6o/5W6gEOmMr69lavdyj3SzhZF/5wU7lju0rNePXCGtxVOWf
	/4tCJo1hZE71FvfxiWYIvxBLPF7sQAj2sfJDW9rVIgAapmS+AMp7D4m4DoCSloVXl+wni7CfWpzWt
	2yYR1Hsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMGH-0000000H1Le-010S;
	Mon, 27 Apr 2026 13:44:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMGE-0000000H1LK-1xDV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 13:44:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EA1A1684;
	Mon, 27 Apr 2026 06:44:23 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 110773F763;
	Mon, 27 Apr 2026 06:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777297468; bh=Px/W/Ya2SR7lP2+gVdyjKWhgWqDhPeYV/Ic2w6HMEeQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ACj7EZ6xUTVoXpW8tnBi3R3snDJlEy+3KZmtG/9Wl9R+21vW7Uw0AZHFgRINaOlCM
	 7DsKo5KWBHKjcDPED2EljkY/Vjt1iJRtmC4/V/Ov1Ee0KI3tSqvTrZTNKNv42KYi/y
	 CyOHEaCImUHAGG31urirAnZnsSCzfATmJBzTGlNQ=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Huisong Li <lihuisong@huawei.com>,
	Breno Leitao <leitao@debian.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pjaroszynski@nvidia.com,
	rmikey@meta.com,
	kernel-team@meta.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] ACPI: arm64: cpuidle: Tolerate platforms with no deep PSCI idle states
Date: Mon, 27 Apr 2026 14:44:21 +0100
Message-ID: <177729716542.3579760.5742318124586748645.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260420-ffh-v1-1-6b4c10fec442@debian.org>
References: <20260420-ffh-v1-1-6b4c10fec442@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_064430_632763_BF57DF94 
X-CRM114-Status: UNSURE (   7.05  )
X-CRM114-Notice: Please train this message.
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

On Mon, 20 Apr 2026 02:27:13 -0700, Breno Leitao wrote:
> Commit cac173bea57d ("ACPI: processor: idle: Rework the handling of
> acpi_processor_ffh_lpi_probe()") moved the acpi_processor_ffh_lpi_probe()
> call from acpi_processor_setup_cpuidle_dev(), where its return value was
> ignored, to acpi_processor_get_power_info(), where it is now treated as
> a hard failure. As a result, platforms where psci_acpi_cpu_init_idle()
> returned -ENODEV stopped registering any cpuidle states, forcing CPUs to
> busy-poll when idle.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] ACPI: arm64: cpuidle: Tolerate platforms with no deep PSCI idle states
      https://git.kernel.org/arm64/c/3ea4415015d6


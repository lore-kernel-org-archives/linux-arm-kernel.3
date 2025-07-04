Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A13C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 18:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+daXMO4VCbo30eEljKxj3YH7pZC6AWqXVtH6a784brA=; b=AvAhbjxoR5VKYcTw/a6OjV0dOY
	kswRpghrI0EgHRwBAtWvwsztv/C2/jPcI3NRy3rhHKYOOTvVSlFTRDwtSNY7zMbBP+XZaOn077DFP
	dPPfIiblFwu0bnFjyh2w62xmHDtyfYthQx5R+1CNFqNGy+ItwKr6y+wPb7B2EdyqpSDhmwGtQtPt5
	ER3+fD7yzf6dQxkX5wHpGrh1s5EVesZzNJKj7zBxD6X5wWL2nv/2XlyzQOD2yrSMqZGCGqniDtSo0
	U9jZD9dK3Ef77YnrHV0eVc793Skicm13vYjTCC83eiC2Wbarzl/LbsYtaUC9ff0gahOEEb2dx3uj9
	T0n2v/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXl3i-0000000FCjL-30E3;
	Fri, 04 Jul 2025 18:22:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkT2-0000000F8Ik-1KgU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 17:44:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 06997435C0;
	Fri,  4 Jul 2025 17:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34092C4CEED;
	Fri,  4 Jul 2025 17:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751651095;
	bh=2elf3c9/H8yzzfmeQk7h00AS6esaabulQD2MYTXF5QU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S6QSP9q/k3jphQdYKIvlbX813rtmBZZmMqndyx8E6ux/zy/L3ALhvsv7rfKFqczXC
	 p/rJrvPtscSIyss2mOYnrY3NYlvjQoxbXeAIBzOXGkIlo5Zy3Q8Y6C0IfGd7CdsXBB
	 sIDuXjpxsUSJKSEFB71ykcbLSugPwqRfW9j12Ul+KuDnm4+O9OARPNajNOPfwR8cQ2
	 Wf+2LvBc4kqx0K0scAXvRvfetUiyimo9AWTt9a/bk2tS85e764jAvRDuOHG8CUrBl+
	 XKecXX4SwQ2QF43Js1eXkMLh6eEbwM8bxD7glLh/dURK389p5CDTrvxCujqs8oJtf+
	 dj7Dd2KWivJQw==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	akpm@linux-foundation.org,
	dianders@chromium.org,
	kernelfans@gmail.com,
	tglx@linutronix.de,
	song@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Yicong Yang <yangyicong@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	jonathan.cameron@huawei.com,
	zhanjie9@hisilicon.com,
	prime.zeng@hisilicon.com,
	yangyicong@hisilicon.com,
	linuxarm@huawei.com
Subject: Re: [PATCH v3 0/2] Update the watchdog period according to real CPU frequency
Date: Fri,  4 Jul 2025 18:44:20 +0100
Message-Id: <175163145128.4115671.15722319061876419012.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250701110214.27242-1-yangyicong@huawei.com>
References: <20250701110214.27242-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_104456_374570_CAC893F8 
X-CRM114-Status: GOOD (  11.06  )
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

On Tue, 01 Jul 2025 19:02:12 +0800, Yicong Yang wrote:
> watchdog perf needs architecture to provide method for converting the watchdog
> thresh to counter period. For arm64 we're using the max CPU frequency for
> doing the conversion which is from cpufreq driver. But some cpufreq driver
> are registered lately, for example cppc_cpufreq will be registered at late
> initcall which is after the initialization of watchdog perf (initialized in
> armv8_pmuv3 of device initcall). In such case the period of watchdog will not
> be accurate enough. Fix this by registering a cpufreq notifier and update the
> watchdog period once the cpufreq driver is initialized.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/2] watchdog/perf: Provide function for adjusting the event period
      https://git.kernel.org/will/c/60bc47b5a0b1
[2/2] arm64/watchdog_hld: Add a cpufreq notifier for update watchdog thresh
      https://git.kernel.org/will/c/7a884442aeb6

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


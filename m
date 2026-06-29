Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2183CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSfJycGBvghvjj9JTE52l96HOp9y/EgWtyndduzLs4w=; b=NyTGgHb/09X1Laj4jZ7sAVv7Fv
	YmX98koq1rA77QvujUrOP4MkXU2hyALtzkVq5EqkhHQX4TrtnkH/xBAoX80KDEhCroSdBRx27AdLk
	xFkAc0Zcs6KxzSHo7zfbYv0WMrAwUWnBNp5XD2LkDWHQ0JEujV6WoxrE7PhMJ2zQU0M/0LzHkrCDE
	D3SqxGormp8ShIlHHKmBtwzC5CfLmyQHooFE8hgpkpGsCss3rFfF757wORNhfepV2aqzKo7jm98uh
	+QsLnK6MF8dW12b6xiK989mrhzPOwzReZ0aXDIne8lmx6puMOwGRzB54i3NG1Psz36Ur8CXRZvel5
	+BOLfUnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAf4-0000000EVEf-2g9m;
	Mon, 29 Jun 2026 12:00:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAes-0000000EVB7-1gHn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:00:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B6A5260008;
	Mon, 29 Jun 2026 12:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3344B1F000E9;
	Mon, 29 Jun 2026 12:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782734413;
	bh=oSfJycGBvghvjj9JTE52l96HOp9y/EgWtyndduzLs4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qw1HvND1Q0WFQZiqxOLHcGOKV417i5PFGS2X2jMcUhvRfKooQJ5Uep2OcAIf7jLvB
	 MSdhxcPtPBiE7cRDEGumGyp5U3m77ZWM0WdIU5Qb+gMSFQWbEejK4c3/NIYrFdRc6B
	 9vn1gKHOjdWZ91M/o0SnLa47nD987j3j6M3b1jq3EWqhwgO2NMK0ETG757JlgBli/e
	 oYncoC0i7CwYpdksf2xc2DGEXZN2O4PrI0Kj74QQ4MJvTrBQU2tOIVvWF11PFRv48h
	 XWnRlg3UNVlBDENw5MnN3yVjnRfHI/CPlb0k/xZZ9gz0Eo45tBMDCf8wbJFDGyYCrR
	 8nqpuFH3aFSGQ==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	punit.agrawal@oss.qualcomm.com,
	mrigendra.chaubey@gmail.com,
	suzuki.poulose@arm.com,
	chenl311@chinatelecom.cn,
	fengchengwen@huawei.com,
	maz@kernel.org,
	timothy.hayes@arm.com,
	lpieralisi@kernel.org,
	arnd@arndb.de,
	gshan@redhat.com,
	jic23@kernel.org,
	dietmar.eggemann@arm.com,
	sudeep.holla@kernel.org,
	pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 0/2] arm64: acpi: Fix NULL kobject warning in cpuhp_smt_enable()
Date: Mon, 29 Jun 2026 12:59:59 +0100
Message-ID: <178272999871.1010833.778390654407420563.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610075202.3597031-1-ruanjinjie@huawei.com>
References: <20260610075202.3597031-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 10 Jun 2026 15:52:00 +0800, Jinjie Ruan wrote:
> Fix NULL kobject warning in cpuhp_smt_enable().
> 
> Change in v4:
> - Fix hot-unplug tearing as Sashiko AI code review pointed out
>   by forcing unregistration.
> - Update the arm64 hotplug doc.
> - Update the commit message.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/2] arm64: smp: Fix hot-unplug tearing by forcing unregistration
      https://git.kernel.org/arm64/c/18a4e5cf633f
[2/2] cpu/hotplug: Fix NULL kobject warning in cpuhp_smt_enable()
      https://git.kernel.org/arm64/c/f9a82544c717

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


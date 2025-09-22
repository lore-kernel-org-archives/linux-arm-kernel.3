Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E6DCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIhywx4ZxMrOxy6/OPSaWrFs8oYWY20A9i8+2lH/Iw8=; b=kthGfIbhP2EyCCtvxBHdMwuPeI
	AwZdxnXTthEWoygeUZVWeZ5FAMRSu+UjOBCxF0Zjv58RHvI0Qlf+XXOuJqX5dyQ8VtqarU3uq293d
	4xbzA9kHZ2jsL0nVGQ+oLBE6SNgvnJWhA89wwUPjM4xFpvSnyyEV4zOlSQkKD2j7D8hRCKwT2ci49
	lXVmuBTxESPHVUziBCqrLNV+WjvFPQAQzwb9HVMgOWg8XgOeihm5hEE1R/FiGtH3+H6ORSgoMQKX/
	cWWFkU1Yr0VD9drp+MlHo6YfUP1DIh+NoG/3Il5qxM4/XV5jd1cm8oh8NE5f7RqiFcIAFlri0xmQZ
	w+Mp5bsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gNq-0000000ASAU-2AJ4;
	Mon, 22 Sep 2025 13:15:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gNn-0000000AS8p-2ZZT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:15:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DD0D601F2;
	Mon, 22 Sep 2025 13:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2302C113D0;
	Mon, 22 Sep 2025 13:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758546906;
	bh=82ttxSMSEH3ZtEUKmy8PdeINF6t2+aMiPJPzyVHU8aQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a0DttOC3XZWhMwZfaIUvd6QJ4ILg4SOyEa+9PhjK0EvNN7OI/ZFmYgam50ND54UDO
	 +04S34jnJshMLJZkoG8zCFsaDT7xI+nWIWbMia0RBaSvw8e2FW5RiXiJCSNPNIqktw
	 XwW/LxFIV6MpDnVL6s1rqcKzWfU+SRs/Z0jU1OaCeUYW6kINoduYk+AgOF2AdX5pBz
	 NTZL+w32HCEtzoEbO6UuiCOXil716Juz06qas/Fsa8+CiQO+BgYU1A8pLtmPPWuOsC
	 zJGC9Cy1O0gOHJfR/eN2k6xUQgzVT/9C1jG66pelFi5leQcutSXc1xKQ2YX8bT40Nm
	 F/PPQu0avTQrQ==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Gowthami Thiagarajan <gthiagarajan@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Koichi Okuno <fj2767dz@fujitsu.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v9] perf: Fujitsu: Add the Uncore PMU driver
Date: Mon, 22 Sep 2025 14:14:47 +0100
Message-Id: <175854271310.3138824.7032222735567665921.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250909030259.2313226-1-fj2767dz@fujitsu.com>
References: <20250909030259.2313226-1-fj2767dz@fujitsu.com>
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

On Tue, 09 Sep 2025 12:02:50 +0900, Koichi Okuno wrote:
> This adds a new dynamic PMU to the Perf Events framework to program and
> control the Uncore PMUs in Fujitsu chips.
> 
> This driver exports formatting and event information to sysfs so it can
> be used by the perf user space tools with the syntaxes:
> 
> perf stat -e pci_iod0_pci0/ea-pci/ ls
> perf stat -e pci_iod0_pci0/event=0x80/ ls
> perf stat -e mac_iod0_mac0_ch0/ea-mac/ ls
> perf stat -e mac_iod0_mac0_ch0/event=0x80/ ls
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf: Fujitsu: Add the Uncore PMU driver
      https://git.kernel.org/will/c/bad11557eed2

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


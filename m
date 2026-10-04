Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF00CA5FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 22:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkNIQLMpC1d0MEJXAzW0sGVZFQPX3e0T6cZ2nuvw/Bs=; b=dJjj+zx1EIHhlacV2/PCWZ9KHe
	zwHqN1fNCo4yeVb+YYJRvxauZ0HsflsB0t8iMfM27ZOKvCm1z32AR+R+OKlv7t7Z4hnAm9l80tKBD
	WUjG4PTSQoV9tMj671RgdEYAdlm3IMEpy7zPiTHy64yu77j1CQfWtW8RWk6NiMwrCEDQgCnRJS+cQ
	JFLtM3Un4bOg8ePlhGA9wfjgwFIOW6Yah8c/8vy0TiqM8zCCYQkIYlcA7U+xmkr/oUXW6L1a3ZCNP
	dYCTW+6KNa88wOeF4gdhcT6AjeNfm7qGi3uaxpA/0ph3CPi0iQ0VoXfZDGcYa0ikFRGakwZU9r6XN
	TG7FBtAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUOy-0000000FPDV-2paz;
	Sun, 04 Oct 2026 22:09:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUOx-0000000FPCa-2a5C
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 22:09:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 600F740D9D;
	Sun,  4 Oct 2026 22:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72441F00898;
	Sun,  4 Oct 2026 22:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791151787;
	bh=vkNIQLMpC1d0MEJXAzW0sGVZFQPX3e0T6cZ2nuvw/Bs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UQIGghcmZ2XPSAGpdOETkygsDHVBwLjNJemPo2BdKKHMrkSfXA4i1U/OV7ph006pu
	 OmjvWTkoIaMe2wZpusrKJqhvzM9aQEuNrmAilDXVne69UwK+TsUSz7gQ69EO80a70r
	 0ZoMis4oCoJMWnV7SPg8PEOIdkmsyJCL6712k52yosu8Ks8EYDxP+knNn7NvkUc5cx
	 WMBo2BDjbXmXwVNAN1UZGvCuvdp8q5noKk9BSPvHeTHOoZMAtSxxePeeVPjZOD/pYA
	 AmQolxiJyhmzvOHZm24BVO1yM9g679NErgZebCyhy3sXNSErPsAX+w0V3XVq4d/Hzr
	 aGm7Dkn/VvVAQ==
From: Will Deacon <will@kernel.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	Ruoyu Wang <ruoyuw560@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] perf/dwc_pcie: Fix PCI device reference leak in probe
Date: Sun,  4 Oct 2026 23:09:19 +0100
Message-ID: <179113437863.1501714.3722625240012640399.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820135611.3901886-1-ruoyuw560@gmail.com>
References: <20260820135611.3901886-1-ruoyuw560@gmail.com>
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

On Thu, 20 Aug 2026 21:56:11 +0800, Ruoyu Wang wrote:
> pci_get_domain_bus_and_slot() returns a referenced PCI device. When the
> subsequent RAS DES capability lookup fails, dwc_pcie_pmu_probe() returns
> -ENODEV without releasing that reference. Repeated failed probes can
> therefore keep the PCI device allocated after removal.
> 
> Declare the looked-up device with __free(pci_dev_put), so the temporary
> reference is released on every return path. Keeping the reference scoped
> to the whole probe also covers all later uses of the device during
> initialization.
> 
> [...]

Applied to arm64 (for-next/perf), thanks!

[1/1] perf/dwc_pcie: Fix PCI device reference leak in probe
      https://git.kernel.org/arm64/c/3a4067658363

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


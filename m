Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF57E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 18:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ey2L68AupkBL1hedKU/FdBpt7KDlLS6aJdEZrYU/YPA=; b=4dR96WaQ8P7Wm0jSy4I57BM2Rq
	iAHn+b+fyFFBo4QMbpvLJ1gvbNbQpv3zlqdHQJjjTh4t1xMT2GbAF+xjNnSkehgxez87FEk6PV7jY
	NXa1GasixWlsq01sHls08+ggaZyeQRCorqN4uI+r+cWdfKnTdLOyS3AnCKLA6h+VQgZI8ug3l46hb
	T+5IBgXDSF5JNVlbeAHgN/xB6YYEwUtqPRSFTvhcMhwj5wfAITqvTDJKx8ZHvn8cuY18yoN5TKG3r
	9EHklxcF5rRg9nUHxu9vu/ZByrKF9VzEpIwja9u+J5KOSLGZ2PjmPV83DiN61fVRo4jVErrtMMgQ6
	35b0ar9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKijw-00000008uov-1sV4;
	Mon, 09 Dec 2024 18:44:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKiit-00000008uce-0hQF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 18:43:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 876655C555C;
	Mon,  9 Dec 2024 18:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D27C4CED1;
	Mon,  9 Dec 2024 18:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733769789;
	bh=ojpEli5GutwJa5SYzbhkYSwq4mRUsfSiYSiGGNNLcFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uq5xjWiKg17mNQZbTI4UExKm4udRvhgVqyduDyFXM/jmuDWl1KKPhcYxEtn3b1BT1
	 /bVCzNbaasEZIWbTCCXfqIDK3NtAnSbYS7hwoZi9LoxKxLV2C93fuOyoQP9ObX3kPy
	 AQqIB6iPupGWIGsv86Q0jclh58J5DO1d/wnKyr2YWNSMUSC/c1vjpRz4X5fmt4e2zo
	 1RBdlDSqCnzhVHJhux7D15aR+3IdpYYHqOyr2/P6ML6/ps+YIHUf4egxDYrHSx3AGV
	 qHa+gp+X52an0xmui4cHY44thmRWsZ0BsJhDBiJOUBpaaIbiSVCiRZ+IkysuCV2hzD
	 WPt1yiFcJacjg==
From: Will Deacon <will@kernel.org>
To: suzuki.poulose@arm.com,
	robin.murphy@arm.com,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	Besar Wicaksono <bwicaksono@nvidia.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	treding@nvidia.com,
	jonathanh@nvidia.com,
	vsethi@nvidia.com,
	rwiley@nvidia.com,
	rknight@nvidia.com,
	ywan@nvidia.com
Subject: Re: [PATCH v2 0/4] perf: arm_cspmu: nvidia: update event list and filter
Date: Mon,  9 Dec 2024 18:43:01 +0000
Message-Id: <173375687020.3268682.2167190065642330868.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241031142118.1865965-1-bwicaksono@nvidia.com>
References: <20241031142118.1865965-1-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_104311_247056_4B4E1EBF 
X-CRM114-Status: UNSURE (   9.01  )
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

On Thu, 31 Oct 2024 14:21:14 +0000, Besar Wicaksono wrote:
> This series update the list of supported events and filters in NVIDIA Grace
> CoreSight PMUs.
> 
> Changes from v1:
>  * Split the change for setting default filter value.
>  * Add new patch to fix NVIDIA PMU sysfs path in kernel doc.
>  * Drop the patch for CNVLINK PMU events renaming from this series.
> v1: https://lore.kernel.org/linux-arm-kernel/20240918215846.1424282-1-bwicaksono@nvidia.com/T/
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/4] perf: arm_cspmu: nvidia: remove unsupported SCF events
      https://git.kernel.org/will/c/ac4c52956f62
[2/4] perf: arm_cspmu: nvidia: fix sysfs path in the kernel doc
      https://git.kernel.org/will/c/5f7cd0dc98a6
[3/4] perf: arm_cspmu: nvidia: enable NVLINK-C2C port filtering
      https://git.kernel.org/will/c/ca26df4b1036
[4/4] perf: arm_cspmu: nvidia: monitor all ports by default
      https://git.kernel.org/will/c/bce61d5c5764

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


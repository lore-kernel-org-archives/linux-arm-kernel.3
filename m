Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2ECF54AC5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 15:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XajZYZ02b1XGoDSd5XhZd8eWlNUNU52oD8VDQPl0R1I=; b=pI/9Pwvf2O/0WGhajpgEs1R8Ej
	XBhRfAszRxd9EB9HqyPZUgR93iu0OqoP2e4DNpS25YzcgUw/iTZ3MdeMniLE+cEFYXT6GBLMdQMHJ
	/Vso8857L87zh+g2p3lZCufYraiLhecCrntJoss5qLEEOlOY/u4CicWBvnpQjvBdDKncISE38N83/
	yDi5J5YUrz9FxhnJt3sTC07f1ejRMn3quWL1M1rv0qNw9uLzkwRjALWHnpbUwb7q2sZ5kzPeZ5eYL
	TRx6aerXkIEqXjGNhKqtbMbGqHa6lC/pc/E/mCDl9Lvm9UKNA/iC0ALFj5M2G+MES4j6hpKtk0L5Q
	QKiX/btw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53Mr-00000001iqv-43Gj;
	Tue, 24 Mar 2026 15:08:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53Mq-00000001iqM-16QO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 15:08:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 817EB41B61;
	Tue, 24 Mar 2026 15:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1842C19424;
	Tue, 24 Mar 2026 15:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774364907;
	bh=sBt192ebZ6UTIURRnm+LynelOlFw9P5iMkWpe5Wk0Sw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=APG2cjhQlBl1F/ZnKTNo6ZJMIowrLl6A1Ltx4H6JbRnVovR07YySaOa2yjG08OIY+
	 zsWPcLBjuiXMMeD75QXj0gzRgs+vYsI5C4NSePOZga3rdD/0c73+uRuasUkKndttxB
	 ck8mc+coeeqvpFMCoRBokj90QqosYecdLZDo100+Jr8/xvQjXgSJk0Z0GKktldjpUD
	 Ztwi3xLa2u5L7gnYK/za0WYBrL4vdOpMwRzVZsWJYHPSaKaHKwDLZSAQSjxaHeyB2I
	 lbost2XqNW/wxAFM0urPmSDDNMnnGdDC1DMgGS8pZmWpEql05TSLxK+PfNZkSY60IW
	 YZ4ziBL+4oAFg==
From: Will Deacon <will@kernel.org>
To: suzuki.poulose@arm.com,
	robin.murphy@arm.com,
	ilkka@os.amperecomputing.com,
	jonathan.cameron@huawei.com,
	Besar Wicaksono <bwicaksono@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	mark.rutland@arm.com,
	treding@nvidia.com,
	jonathanh@nvidia.com,
	vsethi@nvidia.com,
	rwiley@nvidia.com,
	sdonthineni@nvidia.com,
	skelley@nvidia.com,
	mochs@nvidia.com,
	nirmoyd@nvidia.com,
	bhelgaas@google.com,
	wangyushan12@huawei.com,
	shiju.jose@huawei.com,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 0/8] perf: add NVIDIA Tegra410 Uncore PMU support
Date: Tue, 24 Mar 2026 15:08:10 +0000
Message-ID: <177435585471.1950471.14714231023010509332.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324012952.1923296-1-bwicaksono@nvidia.com>
References: <20260324012952.1923296-1-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_080828_318330_441279EA 
X-CRM114-Status: UNSURE (   7.82  )
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

On Tue, 24 Mar 2026 01:29:44 +0000, Besar Wicaksono wrote:
> This series adds driver support for the following Uncore PMUs in
> NVIDIA Tegra410 SoC:
>   - Unified Coherence Fabric (UCF)
>   - PCIE
>   - PCIE-TGT
>   - CPU Memory (CMEM) Latency
>   - NVLink-C2C
>   - NV-CLink
>   - NV-DLink
> 
> [...]

Applied first seven to will (for-next/perf), thanks!

[1/8] perf/arm_cspmu: nvidia: Rename doc to Tegra241
      https://git.kernel.org/will/c/d332424d1d06
[2/8] perf/arm_cspmu: nvidia: Add Tegra410 UCF PMU
      https://git.kernel.org/will/c/f5caf26fd6c7
[3/8] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
      https://git.kernel.org/will/c/bc86281fe4bd
[4/8] perf/arm_cspmu: nvidia: Add Tegra410 PCIE PMU
      https://git.kernel.org/will/c/bf585ba14726
[5/8] perf/arm_cspmu: nvidia: Add Tegra410 PCIE-TGT PMU
      https://git.kernel.org/will/c/3dd73022306b
[6/8] perf: add NVIDIA Tegra410 CPU Memory Latency PMU
      https://git.kernel.org/will/c/429b7638b2df
[7/8] perf: add NVIDIA Tegra410 C2C PMU
      https://git.kernel.org/will/c/2f89b7f78c50

The defconfig change should go separately via arm-soc (Arnd).

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A61CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 22:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0a14oKoy0hGUwl14Hk8RU7rKTvewWF1YWf6zha/hyIA=; b=V2Uc3XnONWuc6FN0snOOrvxIn8
	+zC1TqAzbEVuE9BS8Cz+X0XlAweUdVRe3PzxGXvKpMnt9u0gZZVxSj0uH1x8z5HOPo0sBZ0qDOkjd
	VhgtZodd0ZgIAzijf1fXhXgJyR2s0gwUkgy34ibK+a/7DrLfO12lCEcTnNi/pDxhr3ssEMxweGXxU
	ePSOqN7X9MBTDR/5CqPbs2hpo8kwTds8HDNKGLITYxOP4zQgOOTQb00iZGVMXj8lXTKbR+6wo4QeI
	PisrYUwh2cAh3G1vaH49/SHXIBSYkbGOCjkFhhwrRjAb8fg8PKgBiPxteKQYlJ4G/wmQECpDnN8P0
	6lHTHa3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUP4-0000000FPGU-3FEq;
	Sun, 04 Oct 2026 22:09:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUP0-0000000FPEb-3uE3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 22:09:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD562432C2;
	Sun,  4 Oct 2026 22:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D134E1F0089C;
	Sun,  4 Oct 2026 22:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791151790;
	bh=0a14oKoy0hGUwl14Hk8RU7rKTvewWF1YWf6zha/hyIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n5Zyv5MTZ0zOCqwrSKCOEolSaVcLU9JMCtvCNhhelqGJZfoCTAtnpgntlDQE5tLAj
	 0IUtejN0rG779RBdHIkl+OFKun4DtDNmDryEDJFrp4+N7pMGBghB2Krfqx2vI0pVd1
	 okBm5bJPF2pGWf8xxv5Zv7IYsPYfWGPPPPkbV08g4pb89fTqohe4mbQ0Pwln6bVKwq
	 MUpzCuA6+R+VNZo+N7rJ019ZUXj9ZYgq4vplViFE4kuDctFObjRtVr8FWlQqm0USE7
	 nMn6j7PcJ4wCf6GkSfcHqqZNTBqAXSVsqQToig4zBeW01iXxEE977DZq2QK/Pw6TcI
	 HdDLXLgdS1yYQ==
From: Will Deacon <will@kernel.org>
To: mark.rutland@arm.com,
	robin.murphy@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yushan Wang <wangyushan12@huawei.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	u.kleine-koenig@baylibre.com,
	linuxarm@huawei.com,
	liuyonglong@huawei.com,
	prime.zeng@hisilicon.com,
	wangzhou1@hisilicon.com
Subject: Re: [PATCH v6 0/3] drivers/perf: hisi: Updates for HiSilicon uncore PMUs
Date: Sun,  4 Oct 2026 23:09:20 +0100
Message-ID: <179113241038.1478216.17577065797192083960.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916065348.3957834-1-wangyushan12@huawei.com>
References: <20260916065348.3957834-1-wangyushan12@huawei.com>
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

On Wed, 16 Sep 2026 14:53:45 +0800, Yushan Wang wrote:
> This patchset adds support for the ITS PMU and a new version of MN PMU.
> 
> The ITS (Interrupt Translation Service) PMU counts the number and
> latency of interrupts routed to the ITS by category (LPI/SGI/PPI), and
> collects micro-op statistics for the ITS itself. It supports filtering
> counters by a 32-bit interrupt id (int_id).
> 
> [...]

Applied to arm64 (for-next/perf), thanks!

[1/3] drivers/perf: hisi: Consolidate uncore PMU cpuhp states
      https://git.kernel.org/arm64/c/4c226fa3238a
[2/3] drivers/perf: hisi: Add support for uncore ITS PMU
      https://git.kernel.org/arm64/c/38de567676bf
[3/3] drivers/perf: hisi: Add cycle event for new MN PMU
      https://git.kernel.org/arm64/c/8a76246afe04

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


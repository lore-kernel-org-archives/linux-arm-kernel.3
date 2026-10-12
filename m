Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D87CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/P9KONt2lHIBvkAwdoMeixvu5Zm+mO0D7DF6TXvNXik=; b=0tKBtF1PMnMsgFHcQFrRZS1ycd
	KtpTFpUEK9KwOpE3pQbjb5MC4FrH4FjHwwwWHGW9NPDOO0Pc5MVXRSACg70JGQJ0PRYjruW+KkIKD
	IDZPvC9Ag/V4LNJyENuZqcWYWbe1+OFV6zpllK0bD55AcGdJJMYfy/rClPaOlYb2EkX6OMfHNwZLV
	Df0kq1nU03BiWYAmg6CfL/to0FsxR3J9+q294fKdA5IUCLiC6o/rk+0d1+cgUR4+SS/MwMr1lQ1nr
	0zwO0JUTC6gFb5L7xpSUWtAFFwV8xViYpvsGV/fFrN4SDLO974f2tRw8nQsqfS28VZL66onL8Wxz4
	YpCJPdrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJEx-0000000B1Ou-1OIZ;
	Mon, 12 Oct 2026 16:51:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJEu-0000000B1OB-1z52
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 16:51:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EECF91650;
	Mon, 12 Oct 2026 09:50:59 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 758203F673;
	Mon, 12 Oct 2026 09:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791823863; bh=D+EWCyvU5lM3bpyjoskEyi+nYvM+Cu4MsxC5akYkFug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hgH3yg7k5nLsFckquZBVNyD/rrEj0Hp+/Lx9q7hs9XYsZlYeJZph/6QmyB1y9DUgk
	 72m0STX7+R2vcFbip7Iuqc/2XkF61poZN+1EUcU4IJtKmsuFftBBNDE9WXqQ6IxMvR
	 9fXgR2Hf7X5oBYYY4A/U9XhZmRYRPoHg9Ocqe2uc=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: "Ivan T. Ivanov" <iivanov@suse.de>,
	Francesco Dolcini <francesco@dolcini.it>,
	Franz Schnyder <franz.schnyder@toradex.com>,
	Frank Li <frank.li@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 0/2] arm64: errata: Add NXP iMX8QM workaround for A53 cache coherency issue
Date: Mon, 12 Oct 2026 17:50:53 +0100
Message-ID: <179182359007.897996.12846127704007429935.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010-imx8qm-cache-coherency-v5-v5-0-c9d6cd60c0c2@nxp.com>
References: <20261010-imx8qm-cache-coherency-v5-v5-0-c9d6cd60c0c2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_095105_044407_6CE90D04 
X-CRM114-Status: UNSURE (   9.00  )
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

On Sat, 10 Oct 2026 01:19:44 +0800, Peng Fan (OSS) wrote:
> This picks up the work originally done by Ivan T. Ivanov in 2023 [1],
> reworked to address review feedback from Will Deacon and Mark Rutland,
> and rebased onto linux-next (next-20261008).
> 
> According to NXP errata document IMX8_1N94W [2], the i.MX8QuadMax and
> i.MX8QuadPlus SoCs suffer from a cache coherency issue (ERR050104).
> The upper bits, above bit 35, of the ARADDR and ACADDR buses within
> the Arm A53 subsystem have been incorrectly connected, corrupting some
> TLBI and IC maintenance operations exchanged between the A53 and A72
> core clusters.
> 
> [...]

Applied to arm64 (for-next/cpu-errata), thanks!

I tweaked a few bits in here: commit, Kconfig and errata description
texts, some code comments.

[1/2] arm64: cpufeature: add ARM64_CPUCAP_SOC_ERRATUM for SoC-level errata
      https://git.kernel.org/arm64/c/cea68e7489a0
[2/2] arm64: errata: Add NXP iMX8QM workaround for A53 cache coherency issue
      https://git.kernel.org/arm64/c/d44e08dab27d


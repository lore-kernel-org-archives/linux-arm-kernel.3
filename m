Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511A3C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 05:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59F/wbLVw9RX8vZDA3ieRVFIxpjqaRAIon2IYyvu+0c=; b=pZTjHaPUgs51/ImJ0DCGOsn+Lp
	JQ/ZAiVczMEPtaJUZk3TXdo8p6CO+/J9fgK8Tpp3xLtmQb+b0xvQVm3wp7OPYQtX9fCeh7XZjvea/
	1O4JuoksJHWHg3FGvGh2DOPt3lEClwF3kTboB0SvG2Vneu3777Qyv1yOVnySpXJ8mZcvyf6vaFqb7
	HDW5+auG5UYG/Ku5Cf1V31FeP5fJpbd1pu+ms+sCjH4oVicSfkUWb9vxxx5LTRORdsZv1m8P9YMii
	FoxphY9RaGIWYQgG+WdtEk5MxAkMnA8TLIIVkdhzROkv98M9TF1kJBzCGRlq087peyUoozK1M+z1+
	3rAfithg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6GV-0000000DkT5-46CN;
	Fri, 11 Jul 2025 05:25:43 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5vq-0000000DiKG-2qvV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 05:04:24 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56B54JTk1345674;
	Fri, 11 Jul 2025 00:04:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752210259;
	bh=59F/wbLVw9RX8vZDA3ieRVFIxpjqaRAIon2IYyvu+0c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YZOzLIDb4ETfgi4L5jvvbwA2QX+wLqWSyZGLOAxgZzORvmT8/HS9MwXPIvQki2uog
	 SOKaQBuDzRByIibpkCp+rjGe0LL/CUaFaUCsS5zd/n7yQLCsxnH9hmRBdxvcALDPTG
	 OUSHt1G/lcCkbaMVbsNX5Ehq7XJ5PqDlOVsSaCI8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56B54J4H4178005
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 11 Jul 2025 00:04:19 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 11
 Jul 2025 00:04:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 11 Jul 2025 00:04:18 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56B54FFF2875859;
	Fri, 11 Jul 2025 00:04:16 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62-main: Remove eMMC High Speed DDR support
Date: Fri, 11 Jul 2025 10:34:02 +0530
Message-ID: <175205725858.918402.16645352321440429421.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707191250.3953990-1-jm@ti.com>
References: <20250707191250.3953990-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_220422_813525_52CB5308 
X-CRM114-Status: GOOD (  12.61  )
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

Hi Judith Mendez,

On Mon, 07 Jul 2025 14:12:50 -0500, Judith Mendez wrote:
> For eMMC, High Speed DDR mode is not supported [0], so remove
> mmc-ddr-1_8v flag which adds the capability.
> 
> [0] https://www.ti.com/lit/gpn/am625
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62-main: Remove eMMC High Speed DDR support
      commit: 265f70af805f33a0dfc90f50cc0f116f702c3811

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh



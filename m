Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07105E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 20:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=siuaQT0FRAMt/zg3Cylz6Vorg3cK24DGRgN6rvZjLl4=; b=iSaEP+1lq+gIu2I316n6dUezPF
	kyUlj+5snaMJ9y5WFArfvHnfe++2uuw8O5VLFsp1gPA8mHqDmlJJGr3t7dy6CGiqd4Ujcp38JCp5h
	sBY1Uqx5GaMazn4ngKCNDUlv/OkJb50KloT2oYCe30nkr1jKzxNF3CzuZDY3Cwt4bKaZcUjpA8bSn
	CylV7ZfERCt933h0BOuqnFOVqbs5hUfi5UUzI2Mg8B+PeQfadfCFb2vHuZZXmESVkm78JVfnk4IA1
	byhehVqmMTN35TeJE9RYVqe0++oSLHfSNPjAai2SoXXvOW6CIIhy/OIx8Z74fmzgn8jfMB6qTEx6Y
	XcpFtzGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQuVz-0000000GNa2-3NT1;
	Thu, 26 Dec 2024 20:31:27 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQuUj-0000000GNGx-1zHJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 20:30:10 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BQKTvek027397;
	Thu, 26 Dec 2024 14:29:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735244998;
	bh=siuaQT0FRAMt/zg3Cylz6Vorg3cK24DGRgN6rvZjLl4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Sd4FyHBp7M9z/Q5gUzSV+PT5IcOFgypK/J8ajpDlvDqJt3UokHOGNYaie7Dt5y3ZU
	 3ty1doeYpRlJH7MlfYmYQpwDPQce/JKKZrr8zDcx5VmCbTA9OKKe+klCsEmT87/fc1
	 CncUawdk6U266IFxj6mQFnd/TjcNvyvHLZKOUvLk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQKTvM5032432
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Dec 2024 14:29:57 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Dec 2024 14:29:57 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Dec 2024 14:29:57 -0600
Received: from localhost ([10.249.33.38])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BQKTv5J105182;
	Thu, 26 Dec 2024 14:29:57 -0600
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>
CC: Nishanth Menon <nm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH v2 0/2] Add Deep Sleep pinmux macros for TI's K3 SoCs
Date: Thu, 26 Dec 2024 14:29:55 -0600
Message-ID: <173524493391.82332.13942073781133579692.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241205120134.754664-1-s-vadapalli@ti.com>
References: <20241205120134.754664-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_123009_609140_AB099C20 
X-CRM114-Status: GOOD (  15.23  )
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

Hi Siddharth Vadapalli,

On Thu, 05 Dec 2024 17:31:27 +0530, Siddharth Vadapalli wrote:
> This series introduces deep sleep macros which are common to TI's K3
> SoCs and can be used to configure the behavior of SoC pins during Deep
> Sleep mode. Additionally, support for SoC wakeup with USB1 on AM62x
> based SoCs is added with the help of the newly introduced deep sleep
> macros.
> 
> v1:
> https://lore.kernel.org/r/20241112115650.988943-1-s-vadapalli@ti.com
> Changes since v1:
> - Rebased on next-20241204.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-pinctrl: Introduce deep sleep macros
      commit: 325aa0f6b36eab0fe7d7efdb49b55cf7d664424a
[2/2] arm64: dts: ti: k3-am62x-sk-common: Support SoC wakeup using USB1 wakeup
      commit: 527f884d2d94981016e181dcbd4c4b5bf597c0ad

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
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D



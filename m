Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C005D33998
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mE81JjZAIyv/w8C/GnaHDiDAA5IgxibD+gHZL58LzA=; b=RO0IopFLmc3Vauj9PgMvGyvJ3e
	Y04StkD7Z0fO/tIGe4qtpyHtwRcJ9TeSeD4qt8nzMS06wXAOMW8RFq0wnzcbbLlUeke6hdL9IMHjK
	BhCtEg0+m/8pSPodT5cxyRQuOlNCryGg0PpmuW5OusoJCzvVLcnwd8y7DxBWsh6anE1QPvKMxldIo
	yKMfQe4df7TfNVcwd8W2e74L9kGpATTajwdwQdmW7tKk10gVOiqzOuUFgju7tj3tw/yutTKRrvwMu
	Mr4envWG77qgCGFs7D/Y2EnQ9E4R8PDnM2/8lDT+tDYMrXzOc5mRc1B3LSCwytlqEmI3wqvXNPu+G
	Rf6PxGBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Rv0-0000000BM8L-0vVj;
	Mon, 28 Oct 2024 15:44:34 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RKt-0000000BFUt-3C2m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:07:17 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49SF7CKb091667;
	Mon, 28 Oct 2024 10:07:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730128032;
	bh=1mE81JjZAIyv/w8C/GnaHDiDAA5IgxibD+gHZL58LzA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Cou1LqZ8Q5ZSsRkp+HAeYyc+CzquvL1Zw9Mn8cpdRCyzd5nEE+RnLGxLYpkYci/+0
	 EI+hXz8xOzcd6bgjbqYsqQChWYJK0wPPmIu4LqbLj2KZ31lIDorWZoL16VURqjqetx
	 rWeDuWXx9HXDio1qOJY47g/qBCUfbMTewqPRW3aQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49SF7CBb040690
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Oct 2024 10:07:12 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Oct 2024 10:07:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Oct 2024 10:07:11 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SF5tcq129665;
	Mon, 28 Oct 2024 10:07:08 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, MD Danish Anwar <danishanwar@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <conor+dt@kernel.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kristo@kernel.org>,
        <srk@ti.com>, Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH 0/4] Add pa-stats Support
Date: Mon, 28 Oct 2024 20:35:22 +0530
Message-ID: <173012710990.558239.9508764901403650078.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241014074527.1121613-1-danishanwar@ti.com>
References: <20241014074527.1121613-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_080715_948095_ABE4F398 
X-CRM114-Status: GOOD (  12.82  )
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

Hi MD Danish Anwar,

On Mon, 14 Oct 2024 13:15:23 +0530, MD Danish Anwar wrote:
> This series adds ti,pa-stats node to AM64x and AM65x dts files.
> The driver and binding patches are already merged.
> 
> MD Danish Anwar (4):
>   arm64: dts: ti: k3-am65-main: Add ti,pruss-pa-st node
>   arm64: dts: ti: k3-am654-icssg2: Add ti,pa-stats property
>   arm64: dts: ti: k3-am64-main: Add ti,pruss-pa-st node
>   arm64: dts: ti: k3-am64: Add ti,pa-stats property
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/4] arm64: dts: ti: k3-am65-main: Add ti,pruss-pa-st node
      commit: aef4959ee000069d13461166eefe0de86a0bda8c
[2/4] arm64: dts: ti: k3-am654-icssg2: Add ti,pa-stats property
      commit: 6fb909467d5ac9439eb67c3b33ed301f9ff83357
[3/4] arm64: dts: ti: k3-am64-main: Add ti,pruss-pa-st node
      commit: 007f3e72c9138d5951aac58b993db0114eddfca7
[4/4] arm64: dts: ti: k3-am64: Add ti,pa-stats property
      commit: 30a9a1a26b9568f49aee24a888767105cb0855b2

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



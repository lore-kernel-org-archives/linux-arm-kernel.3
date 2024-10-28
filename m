Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1C9D33990
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcG6NepwaS5v72y5EW4BrZy3aZfCt9DWG2OfGvOadBQ=; b=a3wZeDrlrqSdrIithaqqZsvCRB
	MGVtkXxS2C4H/uvFCujPC0h1h0KYYxVylIjGsNlUc9NucLIJGbL+0St74u7PALu720qeqMxr3wW6Y
	7CjBFGupUrSywwBm+h5bvyDH4Rmpotgz6tNmKDBpJOLNu7CVz9cDrCkBHpAbe0KxTzxh1QNbwfAI+
	qgzB21uqJRAV1lc5jxymw1whrXNYcxvFdv74rl/myJr23eF8AAkyJoLCUxo5+ZopDvpedbLZQbEks
	8B4jCuUjL/Xpjo/9sTKj3riTPsXuR8HaZW0YHL6FJzGFOnUloaVV7F/c2uddKxfP0SBumjdmgfdZB
	G3Jd6ehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Rf9-0000000BJCx-39Wz;
	Mon, 28 Oct 2024 15:28:11 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RMe-0000000BG4B-3CvV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:09:06 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49SF8JL1091957;
	Mon, 28 Oct 2024 10:08:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730128099;
	bh=PcG6NepwaS5v72y5EW4BrZy3aZfCt9DWG2OfGvOadBQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=b+vT8B6q2raKBHSXuY35w2rCwScPCPJi5zOj91ho3/XcT4GZlyJkCGMufrCEjMs4O
	 ZDNJvlPRfsafg3PhRB1HPR0cetK/SZA5vYZWCack5ewd3SJTq1KR4Q1msiGhrRmR95
	 cWHYyyaCryvomCR6UxZpkfMAU6SoZ3sVg8kNfCVg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SF8Jsq057726;
	Mon, 28 Oct 2024 10:08:19 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Oct 2024 10:08:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Oct 2024 10:08:18 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SF5tcs129665;
	Mon, 28 Oct 2024 10:08:15 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: William Breathitt Gray <wbg@kernel.org>, Judith Mendez <jm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <kristo@kernel.org>, David Lechner
	<david@lechnology.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>
Subject: Re: [PATCH v6 0/5] Enable eQEP DT support for Sitara K3 platforms
Date: Mon, 28 Oct 2024 20:35:24 +0530
Message-ID: <173012710989.558239.256253831200168385.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240924220700.886313-1-jm@ti.com>
References: <20240924220700.886313-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_080904_992464_EB268634 
X-CRM114-Status: GOOD (  14.88  )
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

On Tue, 24 Sep 2024 17:06:55 -0500, Judith Mendez wrote:
> Git rebased the series since due to merge conflicts, part of the
> series was not merged. Also dropped the patches that were already
> merged.
> 
> This patch series adds eQEP DT nodes for K3 Sitara devices:
> - AM62x
> - AM62ax
> - AM62px
> - AM64x
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/5] arm64: dts: ti: k3-am62-main: Add eQEP nodes
      commit: 79e668d0d938ca05f340bd1faf37262f31c7a029
[2/5] arm64: dts: ti: k3-am62a-main: Add eQEP nodes
      commit: 36370ccf93bd0bd2be0c529ef7c0b687988ad3c0
[3/5] arm64: dts: ti: k3-am62p-main: Add eQEP nodes
      commit: 0f4a318ee64c647e2cbf7d802b8d06b03aef31e5
[4/5] arm64: dts: ti: k3-am64-main: Add eQEP nodes
      commit: 78b918b58e4b13ad53373882b01945106d196ff9
[5/5] arm64: dts: ti: k3-am64x-sk: Enable eQEP
      commit: 25da98eb3997d21e128ab75d426923a0dc23c4e4

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



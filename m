Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6985ED3A66F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 16:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jZp44ao9GgsPKwOd2u5mw6DAfNNVFmUXvM3+52JYbo=; b=hUbt8795oD9xn2t67mLBN+E8Uv
	H2PDz8f31u+qnckokwJFhpEOBg6Sj1An6o0sy9NdbsZ6176SKY7FBFookqLWA7Eck6gIhCiiauCqU
	zDeGadpnCLsaplaW/AwCBwdDFXaIt23JOe4UXF79FP5yokV1QT5+83VqOY8WIRvuQkDqpd9vYRrrH
	VyBN0tNYOu0Lx9IOvB440Eb6KVpoL3tqNl/Epcp4nSmx8YEAZOSzN1R8t3lbvWZWwDBtvXE+Rcftv
	it9RDypcFNXr/sv1tb+9q3rGGDmIp6CyxlL5T4CmxeF9hkOlBFoZw3f7kFyQwpB2HyRZ7KWyZ6Aee
	5/uXpLGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ovg-0000000F5to-2zVk;
	Tue, 29 Oct 2024 16:18:48 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oS5-0000000F0EC-2cS1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:48:15 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49TFm1uc114777;
	Tue, 29 Oct 2024 10:48:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730216881;
	bh=5jZp44ao9GgsPKwOd2u5mw6DAfNNVFmUXvM3+52JYbo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yIiw3GBcBipLu9dYvdDsnTgk9lHqdymFbM4a19NZb0iJKlpBCL1+AjAZlu72W50GF
	 /JQQa1L1EBviTIYZfN4dK26sVYc/ikvWJjxZuI8mDmz81pwxY6Y9Ef9LxduIqdRN4u
	 vd5Xyc1v+m1hhX8YF84VDgHW33NOsQgWjdUfKAOA=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49TFm1W0029172
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 10:48:01 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 10:48:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 10:48:00 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49TFlunr083726;
	Tue, 29 Oct 2024 10:47:57 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <d.schultz@phytec.de>, <w.egorov@phytec.de>,
        John Ma
	<jma@phytec.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am64-phycore-som: Fix bus-width property in MMC nodes
Date: Tue, 29 Oct 2024 21:17:54 +0530
Message-ID: <173021674668.3859929.796823456061016223.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240926184918.3342719-1-jma@phytec.com>
References: <20240926184918.3342719-1-jma@phytec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_084813_820709_C2DE07F4 
X-CRM114-Status: GOOD (  12.94  )
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

Hi John Ma,

On Thu, 26 Sep 2024 11:49:17 -0700, John Ma wrote:
> The bus-width property was moved to k3-am64-main.dtsi.
> 
> See commit 0ae3113a46a6 ("arm64: dts: ti: k3-am6*: Fix bus-width property
> in MMC nodes")
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am64-phycore-som: Fix bus-width property in MMC nodes
      commit: 018465cd811a11d00ac4160e5c97c4549336ede4
[2/2] arm64: dts: ti: k3-am642-phyboard-electra-rdk: Fix bus-width property in MMC nodes
      commit: dc2660a603214c98994068af378a4ac124c44c57

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



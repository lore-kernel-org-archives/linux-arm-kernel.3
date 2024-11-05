Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C4CD1266B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 09:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6chZfM4wCRiFoGVQY+FPUsIU4u2NVDd3s6mX1/3RoY=; b=jphOxube2WJSY+yGaIvreXxdLi
	CacFBKBD9ZY8kGqDLIhlKQyV5IN7CchiJkL7/6Boy+za6Z5UGlLKeojlsNPpt4nMqXV5+PtZwA7MP
	smYVMZJLiRvS47l6Vd9WQhX+Cs4StPChHzggdfzX20mt7CiP4QoHbcjly1Ro5q7q9OdM5AaMBcM+8
	D7h8trKMxpxSauIdPMmRyoJkyBefdyFrXR923HVawX5a3ETbyWbdKzeuW8sh881/OQqfDkDPvkzt/
	6UyE/R5LhHO2TsgXK7OVmigyVw0DiC5Vjev0RZodyeFmm50/YCsBQW1OKD1ZsmBoRIx0ZqkRt2vWE
	NZ39GKyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FmO-0000000GUWb-12Eq;
	Tue, 05 Nov 2024 09:23:16 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Feg-0000000GSt9-39JT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 09:15:20 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A59FBOX054211;
	Tue, 5 Nov 2024 03:15:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730798111;
	bh=v6chZfM4wCRiFoGVQY+FPUsIU4u2NVDd3s6mX1/3RoY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MaLeimXlshnLopr7IeQQezs3HP6wkXFm3VqxU9AuqGtX+yfWWEFvOs/TM6h9ckcFT
	 Rx3qI5OS0v1OKnHsJU02JYQk0FHuXYKbW890g2ZdnVvWXYqBkULv08KqFyqXnJyWdF
	 R/GJ20zXU0zxUupVa73UOSWTtWr2EMH6PfO/cajM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A59FB1A116459;
	Tue, 5 Nov 2024 03:15:11 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Nov 2024 03:15:10 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Nov 2024 03:15:10 -0600
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A59Er9M091006;
	Tue, 5 Nov 2024 03:15:07 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Francesco Dolcini <francesco@dolcini.it>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/3] arm64: dts: ti: k3-am62-verdin: Add Ivy carrier board
Date: Tue, 5 Nov 2024 14:44:49 +0530
Message-ID: <173079800515.66204.8061592597799138939.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240924120044.130913-1-francesco@dolcini.it>
References: <20240924120044.130913-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_011518_903590_FF6FC6D2 
X-CRM114-Status: GOOD (  12.37  )
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

Hi Francesco Dolcini,

On Tue, 24 Sep 2024 14:00:41 +0200, Francesco Dolcini wrote:
> Add support for the Toradex Verdin AM62 Ivy carrier board. Ivy is a carrier
> board designed for industrial environments, supporting industrial
> I/O interfaces such as CAN, RS485, RS232, Gigabit Ethernet, 0-25mA analog
> inputs, relays, PCIe and more. The board also includes a TPM for security
> applications.
> 
> https://www.toradex.com/products/carrier-board/ivy-carrier-board
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/3] dt-bindings: arm: ti: Add verdin am62 ivy board
      commit: 9db282063b2daf5558400feb7293043b66c5263b
[2/3] arm64: dts: ti: k3-am62-verdin: add label to som adc node
      commit: 25c8a5bebd652ad26d99701c9b2e979d7a1c11b4
[3/3] arm64: dts: ti: k3-am62-verdin: Add Ivy carrier board
      commit: 881f5e9d808243d27830b3ed294e2e8abda05e62

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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7046FD74963
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 04:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5xWe2qGp1zJi1HAfyqxvR6bkfEvGyVfKesTdiBP3t0=; b=n5mpXd4H8n4PfYMEdulyvPFoTA
	tLxLnRObxaSZchFFBsNTE61dl/wOAskVWytyaDQAZv1DxbIB7F6ITzNgtZO9J5Xsruv4MAPBEd8Wr
	uJvdcNaoMO5waWapwv1+b6RT6lKmtl62G/k6e3c4ArUnyKy6r5yX9Cyrefba7yECxHyVAIuswdvru
	HUi9cagJnkSI1SKaiBVjvalY+SwIFW2mUaQ495yXF3p43A696AGj8HlWKlpjvcJMmAhCW2Rn7nRh6
	Qoo9BRb36EISKFjuSoU3UogK80sS+MbhEuEag8VbGf3lURzsbAzxekeskax8TppkRwodnYhSdkcBS
	u5Y3Z/EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t60lV-0000000Gj4T-36e9;
	Wed, 30 Oct 2024 04:57:05 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t60fv-0000000GiKI-3Q5C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 04:51:21 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49U4pH9Z059807;
	Tue, 29 Oct 2024 23:51:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730263877;
	bh=P5xWe2qGp1zJi1HAfyqxvR6bkfEvGyVfKesTdiBP3t0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZC3PKORlKHfu1h8XTdkSxGBrAUkESiJAXDh6dCOddrH5ncsjXCQnNfFGTaK179FaE
	 DCf6VO1XpjnlP8BLu5ethmzgKfvGQr+xL5+8Ml9oR5zOeC48TmDAOodHE7daBAxHji
	 n7C9IK29xxDMvGxy6OFyp2q4nBxigdL2l+WTP9kI=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49U4pHZf117694
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 23:51:17 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 23:51:16 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 23:51:16 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49U4pC3U061595;
	Tue, 29 Oct 2024 23:51:13 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j7200-evm: Add overlay for PCIE1 Endpoint Mode
Date: Wed, 30 Oct 2024 10:21:10 +0530
Message-ID: <173021674667.3859929.7376219255805790509.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241001093426.3401765-1-s-vadapalli@ti.com>
References: <20241001093426.3401765-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_215119_963325_4EDCD476 
X-CRM114-Status: GOOD (  13.01  )
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

On Tue, 01 Oct 2024 15:04:26 +0530, Siddharth Vadapalli wrote:
> Add overlay to enable the PCIE1 instance of PCIe on J7200-EVM in
> Endpoint mode of operation.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j7200-evm: Add overlay for PCIE1 Endpoint Mode
      commit: f43ec89bbc83813efa1d33215ab920e66fcc9471

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



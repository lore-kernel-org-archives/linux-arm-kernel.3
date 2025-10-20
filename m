Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB562CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRpZ7zgsNrhNM+rxIDLJnGPAUyw2qc9ktVSnlul7uqQ=; b=oOfhwJ0QrKRr4dTwGCPKXHI5Qg
	EKtSQUFgjTjKtWuOUEsk4EUjHp9zVXtA4RU/sahZCGtTWyLhR2ECRdzDo1Gu7Bjgx/ePagPJhw5d5
	dSJ7+4rMQuvk1w+CbmpPjIVhFiXlUWuWsUeJpo94LuM7fk1lvm2hVSTZvW+5bOtfBNoK6BCvIc2fN
	b571FGLG+api2r+eobZ1y3pl76ifCW3mFo9XoZcWbj7cyuuWEk9G2VczJXwkWZfk5R4AuIyOAnZNb
	u+A47mG6Nm2Ld5K52RPiVAu2iIThjc5i4GOR3zuSxF3pZCgto/mGsbXfdD6b1nBFlxjhok8oAlHdx
	pyZY4KzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtQ6-0000000EQrI-3bNr;
	Mon, 20 Oct 2025 17:11:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtQ5-0000000EQp2-0EQl
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 17:11:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kRpZ7zgsNrhNM+rxIDLJnGPAUyw2qc9ktVSnlul7uqQ=; b=EjyfPf2TO8U/Td13zXrWLCmroI
	r8a13Q0mFQKZJdEbotu9gdJ0OPTGHxCguRIFTchwtXHaGIYalDWWLphye5Pd/VOSXsnafDUiqOb34
	1AbksUs3cRBPRaptuJMUy41DztZEtklds+LLVT8kC6VoZNJHAM8Fc7T6dJ5n3M7m9iG52ZyFej6Wn
	SxM0cRWg1ixC6wyuEwZmaxDna7hh6zSJwVYlDHPwroZYm+Pja+ExXRH5WAfl03iekP5QbWdH3buzh
	5HMcD15H9E+F2eCUmFcWMckQEBsadc3ZOcQeP0mPDiTa4GTs/eC0m4oF45CpUqbBCmuk1DQDf67Om
	oiqPANbA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsYL-0000000025J-3Vzb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 16:16:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9821348DEB;
	Mon, 20 Oct 2025 17:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD3FC113D0;
	Mon, 20 Oct 2025 17:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760980282;
	bh=IrJnFSl0vpD3jGCn+oBa7YlslutdYfojddkzQZM95dk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ll1u0K+4eP+gsGLcebeYiSuIsCSyF8lilj4gby7yHw+6Xm3n7BC9FS3+kiL4RKIr8
	 G9aTXWih4Z4rHUEHbA1WtbrlC1svYG/6DBSJHXtC3rf01P2OcNLgo1BOrzMjxzb6Jq
	 0omSqngr32C9EmsA/OmpFuXddT91xBpOPlD8ayQYbi/k4TEt6scLSZy1KYhepV/Gl4
	 7ActQB0DDucoi9b7qvg3ndo1UDigjgpj6ksXdVIuOO32YllCwPDoqWPO3TJiMdh2te
	 hiFUGH0YEV9gU5YArLPP+4CmX+3nOdB8ITc84yPdyMUo5xc95YJ6yli0E38DqmOy08
	 Q35J/32vbmsPQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 524AA5FEC0; Tue, 21 Oct 2025 01:11:18 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] clk: sunxi-ng: sun55i-a523-ccu: Lower audio0 pll minimum rate
Date: Tue, 21 Oct 2025 01:10:52 +0800
Message-ID: <20251020171059.2786070-7-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020171059.2786070-1-wens@kernel.org>
References: <20251020171059.2786070-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_171610_083221_89A367DA 
X-CRM114-Status: GOOD (  13.68  )
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

While the user manual states that the PLL's rate should be between 180
MHz and 3 GHz in the register defninition section, it also says the
actual operating frequency is 22.5792*4 MHz in the PLL features table.

22.5792*4 MHz is one of the actual clock rates that we want and is
is available in the SDM table. Lower the minimum clock rate to 90 MHz
so that both rates in the SDM table can be used.

Fixes: 7cae1e2b5544 ("clk: sunxi-ng: Add support for the A523/T527 CCU PLLs")
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index acb532f8361b..20dad06b37ca 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -300,7 +300,7 @@ static struct ccu_nm pll_audio0_4x_clk = {
 	.m		= _SUNXI_CCU_DIV(16, 6),
 	.sdm		= _SUNXI_CCU_SDM(pll_audio0_sdm_table, BIT(24),
 					 0x178, BIT(31)),
-	.min_rate	= 180000000U,
+	.min_rate	= 90000000U,
 	.max_rate	= 3000000000U,
 	.common		= {
 		.reg		= 0x078,
-- 
2.47.3



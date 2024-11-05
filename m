Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E526D12663
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 09:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsBEnIeM0ClFMrKKZeG8lCafRcbNksm47uQYOf90CDk=; b=YQFRmK5c+cFRltGwBXnjHnRXzr
	hGcKj+70NqBcGdqm2iY5GLzmm4xYTFPwvqZHSH7t5b+aipmDaa94NVl/Ze7ufqJy8lrlJH5Rg3ZFT
	WuaqFNMx01PyDoCSFkj9FnjrB02QMKaPJ1vCyy9IpBvz64wHf/RvtkZ3RO2HsfvsO4LcXb0kcsxw1
	Afziss5OF6XjCZWmoGydfTfnCqRrz59a6+XYSoeB8KKS4EiUar5NLrKaAAlmSpW1VMSdw5a3bg2z2
	o65VM2lGKgE737WrMu6nKTQ0gauJtmgFJJaAQKgU9LvElZoznVqqrQ1emo0YE0+THAr8v9DXVrdVL
	wP2/gynw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FhI-0000000GTa7-0kYg;
	Tue, 05 Nov 2024 09:18:00 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FeP-0000000GSmU-0nTm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 09:15:03 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A59EvOe054097;
	Tue, 5 Nov 2024 03:14:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730798097;
	bh=GsBEnIeM0ClFMrKKZeG8lCafRcbNksm47uQYOf90CDk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GkakHc+kTyeQ3+hYO5WlLi45e9rczsQ3a1/vU/gtWJWX2DHEEoJjVWUUKjW5jmE1f
	 /Er9nwM2AVdj+SuDcJ92mly2XMUOIZMcJCmmvUCXwxbPUX59ornVtdB59kwZ1alsw0
	 ZhFqhdpHBGicXQglAEdCt6kYBA7deMHMThj/NTdA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A59EvRV002378
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Nov 2024 03:14:57 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Nov 2024 03:14:56 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Nov 2024 03:14:56 -0600
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A59Er9K091006;
	Tue, 5 Nov 2024 03:14:54 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Dhruva Gole <d-gole@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <linux-pm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, Bryan Brattlof <bb@ti.com>,
        Wadim
 Egorov <w.egorov@phytec.de>
Subject: Re: [PATCH V3] arm64: dts: ti: k3-am62: use opp_efuse_table for opp-table syscon
Date: Tue, 5 Nov 2024 14:44:47 +0530
Message-ID: <173079800515.66204.10332098378075075871.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104063707.3604302-1-d-gole@ti.com>
References: <20241104063707.3604302-1-d-gole@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_011501_345956_2E80C749 
X-CRM114-Status: GOOD (  14.91  )
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

Hi Dhruva Gole,

On Mon, 04 Nov 2024 12:07:08 +0530, Dhruva Gole wrote:
> Add another entry in the wkup_conf for the syscon node, and then use
> that for the syscon in opp-table.
> 
> Marking entire wkup_conf as "syscon", "simple-mfd" is wrong and needs to
> be addressed similar to how other child-nodes in wkup_conf are implemented
> in the same file.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62: use opp_efuse_table for opp-table syscon
      commit: 767b6a0d0900c951e8b42306bd636268481a97ae

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



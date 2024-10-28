Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E926D33997
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTiIAkYLCBE5cLJwTYB6jvuj3Ej/hew6+3zdpGYew1A=; b=ZQpkfnAQ9+jvmRZotDg8nuouGP
	O4kRXQ3VW3sG4G2lozl3jX6scWGfBmpZJxpjG0JMTBpODLaZTPVbVuzYvBhgwEmRsNH4pvE2chj6H
	Xryggw343poJBA75H3oY2XTNqq/y11NeILu0BLUFzIf5+NUiMdOTEL5xZtObQii7DQm+qQ0gEHfd4
	Ha+eGFy4hPuUerR/oSsi5vAJZGORGffmDF4LGORCajXGWkVDvzZ0tpNaqOSQLzPPWxTnViPp/6Ih9
	vOuVN07LaKzDKmuoEgTqXEsTp06ZLRt7qIE7cs6S5utQXZGWUPrPwYGb/YqebHxtHub453/qISJe9
	yH1H32EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Rc1-0000000BIhz-1syh;
	Mon, 28 Oct 2024 15:24:57 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RM7-0000000BFuC-3I2d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:08:33 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49SF8SC4092306;
	Mon, 28 Oct 2024 10:08:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730128108;
	bh=uTiIAkYLCBE5cLJwTYB6jvuj3Ej/hew6+3zdpGYew1A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nga35kReybkopyLMv9Yn1e8LEEvRlYTv1Lxyw62VHaa+we12oBQJQcLVA/NFJEEhB
	 jLviKBi3h5uZaePFr2vvxlfgmRFyHJfCAPa272l5X32bGjbpN+hhgnm/3VJO2UCsFV
	 TBqk7+6XIAjwOZ2aYkPwyVOl109O2tV9k6Ig9Es0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SF8Svq057794;
	Mon, 28 Oct 2024 10:08:28 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Oct 2024 10:08:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Oct 2024 10:08:28 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SF5tcu129665;
	Mon, 28 Oct 2024 10:08:25 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, Nathan Morrisson <nmorrisson@phytec.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>,
        <w.egorov@phytec.de>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-phyboard-lyra-rdk: Update ethernet internal delay
Date: Mon, 28 Oct 2024 20:35:26 +0530
Message-ID: <173012710990.558239.4218886473649588688.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241004221049.1155022-1-nmorrisson@phytec.com>
References: <20241004221049.1155022-1-nmorrisson@phytec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_080831_972194_6E131046 
X-CRM114-Status: GOOD (  12.00  )
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

Hi Nathan Morrisson,

On Fri, 04 Oct 2024 15:10:49 -0700, Nathan Morrisson wrote:
> Update the RGMII delay to 2.5ns to improve performance. We use an
> additional mapper board for the am62a7 phyBOARD Lyra which makes this
> delay necessary.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62a7-phyboard-lyra-rdk: Update ethernet internal delay
      commit: e6c01aeb220274b1ce7b19d1b8fdfe433984cbd2

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



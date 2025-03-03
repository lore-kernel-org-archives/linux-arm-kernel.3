Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82978C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 05:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0aYExE+fmXOum0ucByrnNGU4z/laft84m3pfF3bsHQ=; b=O6xb0Nd4jPnjb8LgPe0vzcigUN
	rzJ676zncgnhNsc1xcBviuBAmOeGWilhnOh1W6PWFzD1zk86rACCAi0t3qa/w+6ppfYrbloaal0vQ
	6FpO2FUZkayeUCJ1iIHSeWi1T+UVzOmBJGPfDhS3f8J0PM/y7t7whcU5n/Sn0YN//7S80ts3+/iES
	WT5n7No4L8B19lCy+5RIaZ5IDSb5Dxfnbr3+KndhasQaIzp623QNFulzjFkh6VVXbtcvrCNEySChN
	jv37qxkcJq2BDD5P+yibSOfn8v2nszhNxTyxlP2Rqz5bLttrXEOVGLB/enitAbwyk3Y7pYG/qJoxY
	LQtm2BTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toxxC-0000000HDBd-1Kel;
	Mon, 03 Mar 2025 05:02:58 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toxq7-0000000HC7w-31Eb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 04:55:41 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5234tba33209336
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Mar 2025 22:55:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740977737;
	bh=x0aYExE+fmXOum0ucByrnNGU4z/laft84m3pfF3bsHQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ODHfIIRlmJKJDqBLvdc6azxzq3o5WiP4VSaliChWdDsdaVqORqShW9IkL2Kjq5JyS
	 CqGsa7AZ5rlStw91uZhZK/EX1bfFshGd13AKI5W1H5q/lVT1QdP7BNfIy1UoBibRAG
	 vEvF68mnNuo53rnk40KETjrzXX6yhJPfndvjbReA=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5234tbHb129160
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 2 Mar 2025 22:55:37 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Mar 2025 22:55:36 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Mar 2025 22:55:36 -0600
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5234tSoT063226;
	Sun, 2 Mar 2025 22:55:33 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p5-sk: Support SoC wakeup using USB1 wakeup
Date: Mon, 3 Mar 2025 10:25:22 +0530
Message-ID: <174092143358.3272913.4362724493070822448.b4-ty@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250130062550.1554651-1-s-vadapalli@ti.com>
References: <20250130062550.1554651-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_205539_847025_3A1B4AE5 
X-CRM114-Status: GOOD (  14.74  )
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

On Thu, 30 Jan 2025 11:55:47 +0530, Siddharth Vadapalli wrote:
> After the SoC has entered the Deep Sleep mode, USB1 can be used to wakeup
> the SoC based on USB events triggered by USB devices. This requires that
> the pin corresponding to the Type-A connector remains pulled up even after
> the SoC has entered the Deep Sleep mode. Hence, enable Deep Sleep pullup /
> pulldown selection for the USB1_DRVBUS pin and set its Deep Sleep state to
> PULL_UP.
> 
> [...]

I have applied the following to branch ti-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62p5-sk: Support SoC wakeup using USB1 wakeup
      commit: 115290c112952db27009668aa7ae2f29920704f0

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



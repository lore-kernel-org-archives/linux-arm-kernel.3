Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF07C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 05:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAtPwuJxwTw3fe5iCISNmAbzibXIDozHyZtM11bF4og=; b=ZQLpzClB8JJSw1kEW4SARoY9Za
	OE+AeKpPz4HUjT9WrI1Zjgx10xcXCxDcQE923WuSHzYu53Pe8JGLeM68XxBe3RQD1DxL0Fe5ZYKbI
	TAU/7d5lPTZVVg5bDX7+s0qFK8ZoYWSonRuJmmPkMynKdVy87u1yWD63aoQi0bewCNPFIMEcbn+5I
	r/8jWgY2z5gcJbJgbucoCtzjZmb/z1ISPoPB8p28mizCMs8sP2meWNKstEtJ6KrMB5uVKeHCwHz0e
	qNYoagfwUX/h/hJmlvLBh1vY6gepDKeyONcuWbAM740hH/dlBQXamSMAjbfWmROZPbxMBfQdRNOgx
	upXC1kyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6Ip-0000000Dkj1-2keF;
	Fri, 11 Jul 2025 05:28:07 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5w6-0000000DiMc-2eny
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 05:04:40 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56B54ZIa1712262;
	Fri, 11 Jul 2025 00:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752210275;
	bh=gAtPwuJxwTw3fe5iCISNmAbzibXIDozHyZtM11bF4og=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wbZQAC6vSjt4aebmT3LmcPNONPNW95E0i0klalhjP72LcLBsgUrKMWzuYehnIA7YG
	 0NSqoRCNOO33mSbo1QrClEpLvK2w/uMjLypvIY8gDdFX6filqCCj3mN/mTDPHlA90O
	 F059Fy13u+zboEfIN4i2hQvn/YQq+wLJCH/FSUk4=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56B54ZVE4178100
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 11 Jul 2025 00:04:35 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 11
 Jul 2025 00:04:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 11 Jul 2025 00:04:34 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56B54VOd2876133;
	Fri, 11 Jul 2025 00:04:31 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62*: Move eMMC pinmux to top level board file
Date: Fri, 11 Jul 2025 10:34:17 +0530
Message-ID: <175205725858.918402.16357151083608277299.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707190830.3951619-1-jm@ti.com>
References: <20250707190830.3951619-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_220438_758079_C71001DC 
X-CRM114-Status: GOOD (  12.86  )
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

On Mon, 07 Jul 2025 14:08:30 -0500, Judith Mendez wrote:
> This moves pinmux child nodes for sdhci0 node from k3-am62x-sk-common
> to each top level board file. This is needed since we require internal
> pullups for AM62x SK and not for AM62 LP SK since it has external
> pullups on DATA 1-7.
> 
> Internal pulls are required for AM62 SK as per JESD84 spec
> recommendation to prevent unconnected lines floating.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62*: Move eMMC pinmux to top level board file
      commit: a0b8da04153eb61cc2eaeeea5cc404e91e557f6b

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



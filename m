Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17297C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 05:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9a1qT38KzNKFqzHT4jH1u+Pmf2ewvv8eOtT7trCzsPE=; b=KMY9iEqmTfDEFpGYSzlA1OH7h8
	SFZE8+qanElDdQ2/4ufmAPF8GMU/cNc3kQ3TSSzZJWxQZnKClcvvc5HsMUr3MVR9eKN6BpT91vUdt
	d7Il+5VLnpJPdzjMAT7vejQ9UBXo8bOkjk73RfH6lkjWQhD75z3RXRvHA4HlxhfP/VYB/YT1SeQSy
	fO7wMSlJ1Vc+dlcztCXwjP4KBsdUMMMPSOHY0fwmkUnTge0o8Eym9ZGUFCzHpUEOJw/N6XNyzdKo0
	MxX0aHjdcHEs7erNKE3s5FqF300dndsId0oZt9AUMu8cnT0K5udiWo4+CVSba95zdMHX05Ld4H9Ij
	298tT04Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6NS-0000000Dl5u-0S9s;
	Fri, 11 Jul 2025 05:32:54 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5xU-0000000DiWI-2lXv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 05:06:06 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56B560NJ1936309;
	Fri, 11 Jul 2025 00:06:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752210360;
	bh=9a1qT38KzNKFqzHT4jH1u+Pmf2ewvv8eOtT7trCzsPE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XtiAB7YD8hutz45qXPzIln6ujJHr2nHXiphGUoTPD8mCkUDZbyZbsd3biUZ2ryXDn
	 S+kf1MSljwCyh38iq/F4oWYFOTfaBUVVLPB3PxhqWucGwqcTtxDORBQ7R4zeBt0z6g
	 kC/9vRrSOmNQvWT8XcAfyZ9JYsY+/YtmKpD4If1Y=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56B560ZO3708141
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 11 Jul 2025 00:06:00 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 11
 Jul 2025 00:06:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 11 Jul 2025 00:05:59 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56B55uIj2878323;
	Fri, 11 Jul 2025 00:05:56 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Joao Paulo Goncalves <jpaulo.silvagoncalves@gmail.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Joao Paulo Goncalves
	<joao.goncalves@toradex.com>
Subject: Re: [PATCH 0/2] arm64: dts: ti: k3-am62p|j722s: Add passive trip points
Date: Fri, 11 Jul 2025 10:35:41 +0530
Message-ID: <175205768444.924566.10610235115148189827.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623-b4-verdin-am62p-cooling-device-v1-0-cc185ba5843d@toradex.com>
References: <20250623-b4-verdin-am62p-cooling-device-v1-0-cc185ba5843d@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_220604_782786_61D1B8AA 
X-CRM114-Status: GOOD (  12.79  )
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

Hi João Paulo Gonçalves,

On Mon, 23 Jun 2025 13:12:25 -0300, João Paulo Gonçalves wrote:
> Enable CPU frequency throttling on AM62P/J722S when an alert temperature
> threshold is reached before the critical temperature for shutdown.
> 
> Adjust Verdin AM62P thermal threshold accordingly to the SoM
> thermal specification.
> 
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am62p-j722s: Enable freq throttling on thermal alert
      commit: f02dccbe9641c4be467d22f4d5712523d902e94d
[2/2] arm64: dts: ti: k3-am62p-verdin: Adjust temperature trip points
      commit: 3b08f8a34a2061d89a2411d04a675b3860d4f9cc

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



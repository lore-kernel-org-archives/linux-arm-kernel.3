Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF906C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 04:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCf0aH05fmJBzgSm7qF5p9iHCH/I78ZbgJ7w+fU2PjQ=; b=KdrS5gn6xOykM6KKrovsobRdTW
	yYeM6dIKrAJphetZ3/wLZ5KnE8XjlR4N25McQkw7jfo/Pu1wW+J4DOoTvVNviHs3+No/GxfaaIIez
	G8N0A5UTRyApmEdU2pzytYHWjY8677dwmeafy/weMGJ6wWWeARMCdPMFRPgQfOc3fhvQ12os/438y
	sDOVocV+BpcNppF5+ZOZB6MiER6RS+QCTMXwa3yAeCR455xNtUaixrHzUHB0LHuKEtI4QObUTG/Pt
	vVqMQQffIxbH+Uejbjhpee5YmMZ+epO3uifLxwl4SyJmW7NTmB+p5/gc3Ryz1SAsFCPpZG1L3Zx2c
	pS/n3UOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toxr2-0000000HCFc-2ekK;
	Mon, 03 Mar 2025 04:56:36 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toxkk-0000000HBQS-44xB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 04:50:08 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5234o3Tk2668522
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 2 Mar 2025 22:50:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740977403;
	bh=LCf0aH05fmJBzgSm7qF5p9iHCH/I78ZbgJ7w+fU2PjQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aU07YMWuuWXpDqcHH9asBKezlpX1JHUxfzPv2jIrszC6DiE/2gcR99r+squ5MyW+X
	 Q4FUaM6YhcoNXQGDXCLpE2Iyx8lc3f2uv6zJG7J3vwBvSKWeduTIxEpJ0mI5gG/uJf
	 M8GnM0XHvDvyW9bfESBf3XXZFA12JvYturxL5ioc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5234o3AD031117;
	Sun, 2 Mar 2025 22:50:03 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Mar 2025 22:50:02 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Mar 2025 22:50:02 -0600
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5234nv9D109097;
	Sun, 2 Mar 2025 22:49:58 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Markus Schneider-Pargmann <msp@baylibre.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Vishal Mahaveer <vishalm@ti.com>,
        Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>,
        Sebin
 Francis <sebin.francis@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] arm64: dts: ti: k3-am62*-sk: Add wkup/mcu_uart0 aliases
Date: Mon, 3 Mar 2025 10:19:55 +0530
Message-ID: <174092143358.3272913.5963413997044284059.b4-ty@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203-topic-am62-serial-aliases-v6-14-v1-0-f26d4124a9f1@baylibre.com>
References: <20250203-topic-am62-serial-aliases-v6-14-v1-0-f26d4124a9f1@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_205007_098066_470E9BEB 
X-CRM114-Status: GOOD (  13.36  )
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

Hi Markus Schneider-Pargmann,

On Mon, 03 Feb 2025 10:34:09 +0100, Markus Schneider-Pargmann wrote:
> add serial aliases for wkup and mcu uart0. Add them to have the same
> order on all boards as well.
> 
> Best
> Markus
> 
> 
> [...]

I have applied the following to branch ti-next on [1].
Thank you!

[1/3] arm64: dts: ti: k3-am62x-sk-common: Add serial aliases
      commit: 3e7f622685e8c3ae3adb5d905f56008c4371c660
[2/3] arm64: dts: ti: k3-am62a7-sk: Add serial alias
      commit: 5a74aef8821885e3d567f4a67bc20ecd723731e7
[3/3] arm64: dts: ti: k3-am62p5-sk: Add serial alias
      commit: 8b0f601f9869b01e2dc35c5860eb0f8ce0650be5

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



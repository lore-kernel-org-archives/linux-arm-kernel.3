Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223C4D74962
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 04:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8tXovtfoixcxi7B8JqfwoOyVvh02/h3f6Kwr8P3V4g=; b=PUZBSysgtlIjL2GW1FJ6MKWxZE
	FnAS/bTkepUCo5GktjKQBdz26AfYQvZq34V/u6xh0RRZNr44nDMjO06OwEwZUH3o8RyXRUt/FxMnh
	Hs9+V14ZcIa8TxWWYmOu7QxnNLGO5BMPPdhYxWC9/wzhFjG4dyr6OItPmENn3b/GxfHwN354Y3w3n
	4GZBKjhmND0EIm9+fGhPUIm2XTbbh+e0sbZAKeAmOuudYGcJUOgOAwkmGRdQMdQwGpB+Br2bfv9GP
	aCUfx2joEYbdl46tpb+nd8kjN8UeN87xTG6YS8U5H8x/TN+MR5lNrzH9K33UVkC4TBON6zFygjnoC
	liVgDOtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t60ju-0000000GirR-3LoC;
	Wed, 30 Oct 2024 04:55:26 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t60fj-0000000GiIq-3MKR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 04:51:09 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49U4p4Jm090231;
	Tue, 29 Oct 2024 23:51:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730263864;
	bh=E8tXovtfoixcxi7B8JqfwoOyVvh02/h3f6Kwr8P3V4g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Yb8vUdjr7376F9jAQjJMzL6GX+gq4XhQVVcQNsRrCV7ipeQWfHG+xy8A4GX16pVDQ
	 cdBcLFZFBQp1DKJrTqftyhP75UX0QMZzb2riG/WFprmf3tE1bMgtOpY26TyVmR8Odw
	 ieTbAlcHCw3Y1pYD4nYbrt5PI62B/NGNXECeU0lc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49U4p4eF085037;
	Tue, 29 Oct 2024 23:51:04 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 23:51:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 23:51:04 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49U4p0BO061271;
	Tue, 29 Oct 2024 23:51:01 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am642-evm: Add overlay for PCIe0 EP mode
Date: Wed, 30 Oct 2024 10:20:58 +0530
Message-ID: <173021674667.3859929.9064799464954390534.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240930103413.3085689-1-s-vadapalli@ti.com>
References: <20240930103413.3085689-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_215107_974794_83189A8F 
X-CRM114-Status: GOOD (  12.85  )
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

On Mon, 30 Sep 2024 16:04:13 +0530, Siddharth Vadapalli wrote:
> Add overlay to enable the PCIe0 instance of PCIe on AM642-EVM in
> Endpoint mode of operation.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am642-evm: Add overlay for PCIe0 EP mode
      commit: 34d7b8419323f6e35cecb445ec39ba5fd30a2d27

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



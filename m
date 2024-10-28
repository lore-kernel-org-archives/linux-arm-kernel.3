Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D29D33997
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b96FhIf/5C/V7LXfZZc3vpon5alrJPDglX3GKmrmGOg=; b=Tp3r0Wyrg8RiT5hadoUeW7NpX7
	uluzDFBU2mnnFhd1gMK7oRv7fXY01fqlHo/Snqp7kHQ4HJjIC+kqvmM/Q51k69L5xs07/9oE122Fj
	vCNsPqbGMZVUG1QAarfYzas41vq1sVBipJFI6p8+Q85j3pulG1p9pW4Q6ePU4nPdDMgXzIleI9FIH
	YQgV7HH062iMzSOamjAUxB1Jupb6PXjxH15+935Uqvp7SPg69MFvrx0wK48UBx3eXkWKmlwNlObwM
	DIfSthEJOcdP3Oe8pT2a1dkR9KuFDKKQeAY9lVaVHkCBI6d+X3oJCyTXGZ0U9VYLJtnzUTRRIDFBB
	M3dn5jaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Rda-0000000BIz5-32NQ;
	Mon, 28 Oct 2024 15:26:34 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RMB-0000000BFvF-3Eu1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:08:39 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49SF8Xuc005602;
	Mon, 28 Oct 2024 10:08:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730128113;
	bh=b96FhIf/5C/V7LXfZZc3vpon5alrJPDglX3GKmrmGOg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SlColhrzavdXadcC4OHy0lcvheX5cmsXanoTknJyygvCmoZUfkEYIjvIPma7O/lUN
	 TXR8q26q2K6lDAOz7qPmCGjhbkAsSn8TW9awFgsaHBhFBxV3NYkSNaibRvV4H3pQsB
	 01gQemWotwB1CDF3vu8FpqkpKemdsxe+OVvjYYGM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SF8XnE057827;
	Mon, 28 Oct 2024 10:08:33 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Oct 2024 10:08:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Oct 2024 10:08:32 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SF5tcv129665;
	Mon, 28 Oct 2024 10:08:29 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <j-luthra@ti.com>,
        Nathan Morrisson
	<nmorrisson@phytec.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>,
        <w.egorov@phytec.de>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62x-phyboard-lyra: Drop unnecessary McASP AFIFOs
Date: Mon, 28 Oct 2024 20:35:27 +0530
Message-ID: <173012710989.558239.9145851807780794840.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241002224754.2917895-1-nmorrisson@phytec.com>
References: <20241002224754.2917895-1-nmorrisson@phytec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_080835_937544_7579B376 
X-CRM114-Status: GOOD (  11.63  )
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

On Wed, 02 Oct 2024 15:47:54 -0700, Nathan Morrisson wrote:
> Drop the McASP AFIFOs for better audio latency. This adds back a
> change that was lost while refactoring the device tree.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62x-phyboard-lyra: Drop unnecessary McASP AFIFOs
      commit: c33a0a02a29bde53a85407f86f332ac4bbc5ab87

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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62ADED33998
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zkTdVlTW/i5WYDBFKyKCfHptSPFJOKhP2+osqRe1mCQ=; b=wg4oxsPSbByurhrzFbdCJXL7cT
	mM76hpSP7AhCEQMWohqV7D1kitS3zqmsaqGWtXVcdz8e0+JoFUQk3iL6ApmbQ+XgXqFObKnEDg+8/
	PWRjotHlvKGPfoXTVLUODX+m9xf+hJLKZH09+1uJ1br/PwLYCeHDLbSK8RULz0FcOk8DgEt/43hBV
	GAnfEjjVCbwzFBPrcn2ukXktNnqCeFO8se/0+WIxnK3vm47RZTLZwo3tnKtcZvUTBk9lgO/KULgqJ
	b45wim28OU4K7/lLUJ/z9R6N77gtoZAj5NiO9TeIeXCcjwcrjiaHYUGFSbXN7EM1rUL2Hoz88SujD
	vexxVm+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Rzi-0000000BN0s-0I4V;
	Mon, 28 Oct 2024 15:49:26 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RLy-0000000BFro-2wqC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:08:24 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49SF8BvA005538;
	Mon, 28 Oct 2024 10:08:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730128091;
	bh=zkTdVlTW/i5WYDBFKyKCfHptSPFJOKhP2+osqRe1mCQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hoiUXP12Iw5adaChwA91jtMELvdxpDsOM2+iSm7FSNrB+6BmQvQgoWLenokxVBWFJ
	 Rsz9I/+eR2N8zDkUna4m/SrXPlBReTmtftxvp3ye0jMS49Y82ShdKVPZ6G5KqoWukS
	 lSNx3e+A88u5EFQkul2GVUICJl5vxn268njtl4pg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SF8BPs057680;
	Mon, 28 Oct 2024 10:08:11 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Oct 2024 10:08:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Oct 2024 10:08:11 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SF5tcr129665;
	Mon, 28 Oct 2024 10:08:08 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <w.egorov@phytec.de>, Garrett Giordano <ggiordano@phytec.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: Re: [PATCH v2 0/2] Reconfigure 1.4GHz in AM62 PHYCORE SoM
Date: Mon, 28 Oct 2024 20:35:23 +0530
Message-ID: <173012710988.558239.17362858553590828268.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241001071916.1362213-1-ggiordano@phytec.com>
References: <20241001071916.1362213-1-ggiordano@phytec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_080822_854865_66735D52 
X-CRM114-Status: GOOD (  15.55  )
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

Hi Garrett Giordano,

On Tue, 01 Oct 2024 00:19:14 -0700, Garrett Giordano wrote:
> This patch set moves our 1.4GHz opp table definition out of our overlay
> and into our som dtsi. This change goes along with our updated PMIC, which
> is now configured to output 0.85v by default.
> 
> We drop the overlay as it is no longer needed.
> 
> Changes in v2:
>   - Use git revert to revert the overlay patch
>   - Update commit message to reflect revert adding the device tree overlay
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: am62-phycore-som: Increase cpu frequency to 1.4 GHz
      commit: bc3552d675537be111148d9614f4f02f31e30de3
[2/2] Revert "arm64: dts: ti: am62-phyboard-lyra: Add overlay to increase cpu frequency to 1.4 GHz"
      commit: 151ed40a4f204e8786a2573e3f8083ffd29f3b1e

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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BCBC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1sFmVEx4gXcykMRmXYn9FRQlYWf21/wBfA1y8v8IXM=; b=xvqXsr93AEko9bYhm3vfGP0aps
	iKljA9ql4aVErzyQItprAHQeJDXj5Fqe9G3IVsoOia8FqukHthIqBys4CET3nbjpI4RNQRBFCWFGj
	42iDnsY3+7xdrcWSpxvP7Z0VsxwwqoO1Uo4RnCw2AvoyUyCoQtqLx4BuxHAyJtyneYBCr+oGM2zqj
	TqTxWnRbqJmT1FJGsxmr2LiMboRHeZvO+kyebELdS/43qUKpSsBstPcfnve4RHpeZX54PjfxQaUOO
	R2Hla0G+YsxxbueiSMFn+V1MWHtIs8NPhRIldtHQxktCE40mivjLiG1W2KkDpGQYPKZgalEqFtJSg
	AV79UBvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsvE-00000002RZ8-2kzU;
	Fri, 02 May 2025 16:07:32 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAspz-00000002QaX-2MGo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:02:09 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542G24M2444126
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 11:02:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746201724;
	bh=Y1sFmVEx4gXcykMRmXYn9FRQlYWf21/wBfA1y8v8IXM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=g+HW2vH9aGKBxccZII6OOARqXktgjlKPRZtbVsUNXlb6Xb/HfIi126G0I3bwF/tB/
	 Ksqmwbt4we8Iz53RgR6PtfFPKM0zq4a96211W+4g6qjvNPDq6W/K8MtIIFD1l29+TI
	 lXovZpbQNHODSyb5vuu2WWTqACPptE0DJ3UCwJ2A=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542G23Oc106153
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 11:02:03 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 11:02:03 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 11:02:03 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542G236V085051;
	Fri, 2 May 2025 11:02:03 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am65-main: Add missing taps to sdhci0
Date: Fri, 2 May 2025 11:02:02 -0500
Message-ID: <174620171156.3146851.4963787197478116210.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250429173009.33994-1-jm@ti.com>
References: <20250429173009.33994-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_090207_690775_CA9968D3 
X-CRM114-Status: GOOD (  13.31  )
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

On Tue, 29 Apr 2025 12:30:08 -0500, Judith Mendez wrote:
> For am65x, add missing ITAPDLYSEL values for Default Speed and High
> Speed SDR modes to sdhci0 node according to the device datasheet [0].
> 
> [0] https://www.ti.com/lit/gpn/am6548
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am65-main: Add missing taps to sdhci0
      commit: f55c9f087cc2e2252d44ffd9d58def2066fc176e

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
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D



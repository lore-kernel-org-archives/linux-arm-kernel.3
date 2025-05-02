Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D57C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 16:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SM/2nkvFBsdAVdTDZP4AfmeiPEIN/8uymH+sgluv2DA=; b=jDzPAddE8X3sdLI1Mbb8knBOfp
	WJ4L7ibYVJ5XHRSvg3KwbsDM09iLwxPXDJs8XcTzZFkXsVA9cdTZPpT3D/5nGpuE6GHWTUIcTZlR2
	zOpvvFEnYNmksVjI3TzSaqM1r9r8qz6HELH2lNNhX3RWERaJaALQfvA8PEz5qKpwJNRLnbOVaGmou
	tYD7qppXGkAmfESbwH6f8xAKQCFIG1Kmax3i2oNQTizjZR1HUenFrWHczhrS7BKIm5PCLB4cBug55
	DLCs+QIj4NCPTHRq0Q5m6rW1kLXmUCuGC5SgikKFUlYwoWy8N0HjFn+wGWbryipYF3kHYCNg3fW0P
	CFK+FvIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAstK-00000002RLs-457t;
	Fri, 02 May 2025 16:05:34 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAspi-00000002QWI-0sDw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:01:51 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542G1ilP3899617
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 11:01:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746201704;
	bh=SM/2nkvFBsdAVdTDZP4AfmeiPEIN/8uymH+sgluv2DA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=N2xCKHNO95Y00XdTjBME+cxRUZ5NETxV+97ukXPf9w7MOYWOqeBeWy6c1Hekpvz5A
	 GhBXvu5jZv6r/Cx9NpW/j64gafqp2iVDTGQPv4etQ9eEvXSPhnMVcxl99nqk+GjbwC
	 Fp8i73APkOSpzBc8c3iMwjlnDRsYNti9LAAv59NE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542G1iSw105937
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 11:01:44 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 11:01:43 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 11:01:43 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542G1hA7084565;
	Fri, 2 May 2025 11:01:43 -0500
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
	<m-shah@ti.com>,
        Udit Kumar <u-kumar1@ti.com>, Bryan Brattlof <bb@ti.com>
Subject: Re: [PATCH v2 0/3] Set eMMC clock parent to default
Date: Fri, 2 May 2025 11:01:42 -0500
Message-ID: <174620168930.3146730.1790558612742355964.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250429163337.15634-1-jm@ti.com>
References: <20250429163337.15634-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_090150_334119_C2B98D0F 
X-CRM114-Status: GOOD (  17.10  )
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

On Tue, 29 Apr 2025 11:33:34 -0500, Judith Mendez wrote:
> This series was split-off from "Misc MMC updates" patch series [0] and the
> original patch further divided into three to help with backporting as per
> review comments [1].
> 
> This series sets clock parent for eMMC to the default clock parent
> MAIN_PLL0_HSDIV5_CLKOUT for am62, am62a, & am62p/j722s SoCs. Software (DM)
> does not switch MMC clock parent correctly as per the Arasan IP requirement
> to hold the IP in reset while clock source is switched. Since muxes to
> switch clock parent are not glitch-free and the default parent is tested
> and working fine, switch to the default as a preventative action.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/3] arm64: dts: ti: k3-am62-main: Set eMMC clock parent to default
      commit: 3a71cdfec94436079513d9adf4b1d4f7a7edd917
[2/3] arm64: dts: ti: k3-am62a-main: Set eMMC clock parent to default
      commit: 6af731c5de59cc4e7cce193d446f1fe872ac711b
[3/3] arm64: dts: ti: k3-am62p-j722s-common-main: Set eMMC clock parent to default
      commit: 9c6b73fc72e19c449147233587833ce20f84b660

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



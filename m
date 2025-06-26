Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A1FC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 04:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6iawhAcBMlqWUHyPcEw0STZIXQJ74Yg3UZePUno615M=; b=WH+NMORpMYKFuFeyd5ONQE6211
	req1ZZiftmwULhpqL1k0OYUtG7Nu+sufmxymfUZ3AWPvP3EV6gdWp/LFthsvtI+/j6bUVd994Xroc
	COFct4dZQfXHxzlcBvUrmrvZHfBsNClu36jznZAV20zPKfRm9kARLyz58IL180xaiyMGnNa3Ti76L
	ojROYs4xvPWdB+wtQ7kAggVa2z+t7gmpM6/sCt5cZW1YSZFnmgB4Rs96auSulOdhgfrgZh3VfzD/N
	XbY3skE65GptDjR6/BDQ/hYtM2HMuhPEgmLK7L7s2FouWt/ajg2jFL6Q4JRexdptsMr5Eto4p1neu
	iGljZFRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUdvk-0000000AZe4-08EM;
	Thu, 26 Jun 2025 04:09:44 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUdqn-0000000AZQK-3DlG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 04:04:39 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55Q44ZaY2303517;
	Wed, 25 Jun 2025 23:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750910675;
	bh=6iawhAcBMlqWUHyPcEw0STZIXQJ74Yg3UZePUno615M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NfU6O7Ww5UvBI2qJ5cqCA7ktN6s/X1hV8Fg2fsKbKZnkPkp5I7kAL3yagSXIBqmdH
	 r4Gp6fJ7eVItUJTAcuMiSZVtt5xxOhQGulvSmSFeEu3lJEbBoJlnrxnnmXsloApG9X
	 f6EgCYnfqA2JS7gT4OJ4RADtwskfB6v3/mOlYgzg=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55Q44Ydo1621181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 23:04:34 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 23:04:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 23:04:34 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55Q44U92600170;
	Wed, 25 Jun 2025 23:04:31 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <devicetree@vger.kernel.org>,
        Jayesh Choudhary
	<j-choudhary@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <r-donadkar@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: (subset) [PATCH 0/3] Enable audio support for J721S2-EVM
Date: Thu, 26 Jun 2025 09:34:10 +0530
Message-ID: <175079060333.1874839.12615376553290693686.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604104656.38752-1-j-choudhary@ti.com>
References: <20250604104656.38752-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_210437_898830_B61649D3 
X-CRM114-Status: GOOD (  16.09  )
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

Hi Jayesh Choudhary,

On Wed, 04 Jun 2025 16:16:53 +0530, Jayesh Choudhary wrote:
> These 3 patches add the support to enable audio on J721S2-EVM.
> 
> This required the i2c-mux support[0] which is now in linux tree.
> 
> Now, this series ***depends upon only one dts change[1]*** to ensure there
> are no dtbs_check warnings (no functional issues):
> "ti,j721e-system-controller.yaml" refers to "ti,am654-ehrpwm-tbclk.yaml"
> for clock-controller nodes, but for audio we need "ti,am62-audio-refclk".
> When scm_conf is "simple-bus", there are no such warnings.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/3] arm64: dts: ti: k3-j721s2-main: Add McASP nodes
      commit: 56bf596ff9026b616137968102884233c86055d4

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



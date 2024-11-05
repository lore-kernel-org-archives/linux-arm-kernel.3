Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D94D12663
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 09:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k56lFvEOKH32JIgIFyzcC92zIpf3K+3SQ3N0wnbsXNk=; b=t7Ou1stkSfx+FbGIc7D99hcpSE
	/DlfOyZjAcY3p+JU90qLLiwBg6CH3BX920A8K48dqnDJI+Dpt5+B9I7MmWRfE+YLqcUAe2diK1IMn
	QBef1SCRd/QnS3cTHPpES0nqyZL9P6Drya1D/bT3bCcfCy4QCsKBKxJ9tXYK8/1wSnEHf4tNoQ1xh
	VLP641/cbATrE0LOanfC+5Z71hZSaMoYOHJHd5/Rkni6g3+266gQenghLkE/PqNzAcdZJw4fakYY6
	cwVNrQxpbj1dJjEOPuHGBGLEpyLWblcOqmNsQNrnewl9Fwr9V00nV7mOEQOQRNVKOUSAdbEiJ4S+d
	KpZfJLuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Fkf-0000000GU95-2kgb;
	Tue, 05 Nov 2024 09:21:29 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FeZ-0000000GSrW-2Yit
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 09:15:13 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A59F1J9049673;
	Tue, 5 Nov 2024 03:15:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730798101;
	bh=k56lFvEOKH32JIgIFyzcC92zIpf3K+3SQ3N0wnbsXNk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xmGDr2RqKjv83x+1Y9PDN/1Ngml+S6OSugilnMOIm3G/k+M5F2aaaMVbSb1iDsxfL
	 b7klEZ3Y8I9nQpvTE9CH0mxbM176OORTJmtykiMxIHMYTr8YEUDlTzVdADUuXZ8zlp
	 3syV9OxUh/rhoR2GID447KQ3mFSAMsDKQ/gjcOVY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A59F1DQ051675
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Nov 2024 03:15:01 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Nov 2024 03:15:01 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Nov 2024 03:15:01 -0600
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A59Er9L091006;
	Tue, 5 Nov 2024 03:14:58 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Dhruva Gole
	<d-gole@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <linux-pm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, Bryan Brattlof <bb@ti.com>
Subject: Re: [PATCH V8 0/4] arm64: dts: ti: k3-am62{a,p}x-sk: add opp frequencies
Date: Tue, 5 Nov 2024 14:44:48 +0530
Message-ID: <173079800515.66204.13724466415704123785.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241008132052.407994-1-d-gole@ti.com>
References: <20241008132052.407994-1-d-gole@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_011511_757557_20F3D085 
X-CRM114-Status: GOOD (  14.38  )
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

Hi Dhruva Gole,

On Tue, 08 Oct 2024 18:50:49 +0530, Dhruva Gole wrote:
> This series adds in the OPPs for the Cortex-A53s on the AM62Ax and
> AM62Px SoC families along with the defining the
> WKUP_MMR0_WKUP0_CTRL_MMR0_JTAG_USER_ID which we can use to to properly
> limit the OPPs available for that variant.
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> Signed-off-by: Dhruva Gole <d-gole@ti.com>
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/4] arm64: dts: ti: k3-am62a: add opp frequencies
      commit: aeedca40159c7017f3f0cfbd1ac2066e091e784c
[2/4] arm64: dts: ti: k3-am62a7-sk: add 1.4ghz opp entry
      commit: 5dae00dfaf8e4a40c68c8a4d9e453cd06bc5bf19
[3/4] arm64: dts: ti: k3-am62p: add opp frequencies
      commit: 76d855f0580148d8f07f1c0aa96f33cad382e6cc
[4/4] arm64: dts: ti: k3-am62p5-sk: add 1.4ghz opp entry
      commit: 50f5ad2cb52f322d472dfb451881bea7d7d78d32

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



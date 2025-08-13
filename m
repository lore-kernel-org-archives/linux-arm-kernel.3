Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74095CA0EE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGklE0oOttbbG4y1Ct8hcFq72Z83Cf2egeNakYpGEpU=; b=mwUKSp1UIaqA3kJwFzJ0lzHrfc
	GG8Ft5yi1aBbO4lb35Wo4C0QHbkcE1mrR14NAyTX9rI/+SpI6aXi8Fa3D+l7lWmEBHgvyAJZNIPCl
	GK769TtFjIWY49I40wax4TRqKtS8/sjVRgPuT9xrPDCgNt7rdiCcHzp+G06A8iHVmJAzzl+7KZNeD
	+UsiFRWRcvn2vE/+XgdxVqz5wV8B4DcUSiycu6KgbpG6B/TVEUT8IRSciWSV0FpcMje/ZPyPjZHn+
	9YyuEU/fdxwYlptJhgAe5zOA1qYZL2WlSNGXIz53jIC0GEWYfEnUsMZnDb3wDzt7apAgJu38fDfRc
	Va1VjN4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCnw-0000000Dxr9-01i1;
	Wed, 13 Aug 2025 14:50:16 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCXr-0000000DvHu-33tU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 14:33:41 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DEXZAD2167127;
	Wed, 13 Aug 2025 09:33:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755095615;
	bh=KGklE0oOttbbG4y1Ct8hcFq72Z83Cf2egeNakYpGEpU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yiSwiktxZpo5H+GfDyZ335qN6fWOBGcfymhpcRnL3lQGjRg5VUc32VVQTGNdCTrIg
	 O3chRC5xpbMuPY0v//t1OBH83MJofwkSkdUkodUtxnifBXgY++ZPiHcN1HsMJtCq4t
	 ScYU0v9lu/jtyd/UE4BhxTmjU7DWZ6DAZKJCu52k=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DEXZG1456604
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 09:33:35 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 09:33:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 09:33:35 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DEXZ2C2441722;
	Wed, 13 Aug 2025 09:33:35 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
CC: Nishanth Menon <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: Re: [PATCH V2 0/7] Add Interrupts property for CDNS CSI2RX
Date: Wed, 13 Aug 2025 09:33:33 -0500
Message-ID: <175509558118.158553.18446597481463221079.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250808095804.544298-1-y-abhilashchandra@ti.com>
References: <20250808095804.544298-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_073339_857073_16126B26 
X-CRM114-Status: GOOD (  16.35  )
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

Hi Yemike Abhilash Chandra,

On Fri, 08 Aug 2025 15:27:57 +0530, Yemike Abhilash Chandra wrote:
> The driver patch that adds support for error detection on the
> Cadence CSI2RX by enabling its interrupt lines was recently
> picked up [0].
> 
> Accordingly, this patch adds the required interrupts property
> to the Cadence CSI2RX device tree nodes.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].

I did minor edits for the $subject to indicate it is CSI2.

Thank you!

[1/7] arm64: dts: ti: k3-j721s2-main: Add interrupts property
      commit: 94801d4bf1ed9277462ebe1afaf8323664fd6a85
[2/7] arm64: dts: ti: k3-j721e-main: Add interrupts property
      commit: 33b34bfa4f22216845f5fd738d320e78d75cf1ff
[3/7] arm64: dts: ti: k3-j784s4-j742s2-main-common: Add interrupts property
      commit: 84ba1f67c6169e4533aa109888accbbccef25705
[4/7] arm64: dts: ti: k3-am62p-j722s-common-main: Add interrupts property
      commit: 347866a21ff447e868305426c294395b2cee68a7
[5/7] arm64: dts: ti: k3-j722s-main: Add interrupts property
      commit: 772cc597174486b85585ed02a74cc332ba25de01
[6/7] arm64: dts: ti: k3-am62-main: Add interrupts property
      commit: 96ba5ce55ec192ca28446d4045dfd501270769b3
[7/7] arm64: dts: ti: k3-am62a-main: Add interrupts property
      commit: 9307cad31efcfe3446847ee34effaaa5c4930fa8

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
https://ti.com/opensource



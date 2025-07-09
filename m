Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C3BC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 13:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHGPtIS3stNvh59VAzBioQkLBG2SSTCj9st1LBQOmuk=; b=0ckNwmLEVrsAz0sJwCn0EWhvEA
	/jnNpbxzyW7zPOx9ywTH/9nuvRd8Lj0NOrlLOtTwt2BvFSOx3PGNEp74MvXwxVVuNmVokApqMuUDp
	AtFbWqK04GmwnkEoh1WcA5vecd4xYq3pprz8cEhgsTMbniGskFFAJZoQV4OpcFpfNylwP8a/opPxk
	jiS2Oukuqf9+0lVnAz+ki1HqqPlxhL68yxHjwIlCsZXvs5M0BlcmRnTZuJ9wr7DXvEtfB7JqUpaK4
	p7muVQsB4T9hEfV6649o6BZbpSXaIHJKML8mgMN89aDSnI01ARY1Ce1XM4QuZaVwR8AJbmkiJgedh
	4gWOq6Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUTc-00000008jOs-34hn;
	Wed, 09 Jul 2025 13:04:44 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSHt-00000008Lnm-1btT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:44:30 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 569AiQsf1453753;
	Wed, 9 Jul 2025 05:44:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752057866;
	bh=jHGPtIS3stNvh59VAzBioQkLBG2SSTCj9st1LBQOmuk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kSxayfnmivYCyKF6GDhukYNSlMYo4zWW1RDfg5IwL7woLtQD24GV1u9yeJQUTtDKT
	 kq+ynNovT09nMfMkxNm4WTtgrV5lUGrps0+H4uFiA67UIgQakwVRZ9oxMZ/3BTcVOj
	 KLAWlzSl2LWcGtxkU4R1QYz3KFvSK2Frd+nWBo5U=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 569AiPmv1928962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 9 Jul 2025 05:44:26 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 9
 Jul 2025 05:44:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 9 Jul 2025 05:44:25 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 569AiLFA3506025;
	Wed, 9 Jul 2025 05:44:22 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Parth
 Pancholi <parth105105@gmail.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        Parth Pancholi
	<parth.pancholi@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] arm64: dts: ti: k3-j784s4-j742s2-main-common: Add ACSPCIE1 node
Date: Wed, 9 Jul 2025 16:14:08 +0530
Message-ID: <175205778773.925763.16850623285742388487.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513152155.1590689-1-parth105105@gmail.com>
References: <20250513152155.1590689-1-parth105105@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_034429_553149_ACC3ADC0 
X-CRM114-Status: GOOD (  13.72  )
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

Hi Parth Pancholi,

On Tue, 13 May 2025 17:21:55 +0200, Parth Pancholi wrote:
> The ACSPCIE1 module on TI's J784S4 SoC is capable of driving the reference
> clock required by the PCIe Endpoint device. It is an alternative to on-
> board and external reference clock generators.
> Add the device-tree node for the same.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j784s4-j742s2-main-common: Add ACSPCIE1 node
      commit: abba0c4845ea110a10b4f0dec5351fef17aaa4be

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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA12D33990
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Uq5bz0/uLvuCGnqo7Ja68lnqAVIcBafEDmrDLYmls4=; b=2GBsUaXthuGZOK2BzOMSQdKIKd
	iI4ty/ET/wCPpxhh9dZpkeD9Q1OB3SdUyBRBsNYc7abPpViQJYN/dGyE1U1iDOHjDOJe3CJWPHXn4
	z3gwjQPSBhn8hbGcRKl3aGs3ScNHtU+g+Q6pd8LHeAlSy9RawvfmmiRBwrvC7kW7PTQ+J1Z9RGmMn
	NFMuEnu03SbXYwJQhKl9er8R3kbtyH3CL8ms9041lBJEpI16b5I+ipCBgDyAECrnsztI0mZPY4NEf
	61Hxmcqjn2dHMrMdpanJXvlIztyZbPReT2s8McBeP5/u0mLrqR+HpEc3BJjvK/f/EcRZCpYgIvvkO
	SBOQKhPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Rrq-0000000BLZP-3yOC;
	Mon, 28 Oct 2024 15:41:18 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RJs-0000000BFMh-0x8m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:06:14 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49SF5wB1022225;
	Mon, 28 Oct 2024 10:05:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730127958;
	bh=9Uq5bz0/uLvuCGnqo7Ja68lnqAVIcBafEDmrDLYmls4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RdLPTFg7+rmpq9di6vik8km+WtCAZnYeKKuyhi6BCl81mGdwOS8CgDLN+vRK40Olj
	 4EXCrB04KY+Vp31W5nkd5vGfW2SZlVGEU75VvrVE22AcQzZEtGd6VG3p0RJBYDbXh8
	 qGLdh27FtuU7umKSQEWt5QHRjoMF1r6GRVXtC2zI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49SF5wPf039975
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Oct 2024 10:05:58 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Oct 2024 10:05:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Oct 2024 10:05:58 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SF5tco129665;
	Mon, 28 Oct 2024 10:05:55 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 0/5] TI K3 M4F support on AM62 and AM64 SoCs
Date: Mon, 28 Oct 2024 20:35:20 +0530
Message-ID: <173012710988.558239.13240176298323302898.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241003170118.24932-1-afd@ti.com>
References: <20241003170118.24932-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_080612_484713_019D3C22 
X-CRM114-Status: GOOD (  14.87  )
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

Hi Andrew Davis,

On Thu, 03 Oct 2024 12:01:13 -0500, Andrew Davis wrote:
> M4F driver[0] and DT bindings[1] are in, so last step is adding the
> nodes to the base AM64/AM62 DTSI files, plus a couple of our
> SK boards. These can be used as a reference for other boards using
> AM64/AM62, or I can add these nodes for existing upstream boards,
> just let me know.
> 
> Thanks,
> Andrew
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/5] arm64: dts: ti: k3-am62: Add M4F remoteproc node
      commit: be4bac3bcb281b264bd35ae1ff7bbbb99e3e00fe
[2/5] arm64: dts: ti: k3-am625-sk: Add M4F remoteproc node
      commit: 23a6aba92e53883bccbbb27933aad6dd09992e6f
[3/5] arm64: dts: ti: k3-am64: Add M4F remoteproc node
      commit: ef1876ff76096b3cad6fdb8b797226e4914f5726
[4/5] arm64: dts: ti: k3-am642-sk: Add M4F remoteproc node
      commit: 6e36e6200360e1703071b38fa5e91f4894716658
[5/5] arm64: dts: ti: k3-am642-evm: Add M4F remoteproc node
      commit: 8e77fc1fbb291e193664df0ac5176ac9fbfb3ea8

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



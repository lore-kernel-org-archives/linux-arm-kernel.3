Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CB7C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 14:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wmfIKm7N506C2a5N3qHxuYy4t3bfiFN97CIf5mSVFo=; b=iQ4juV0+i3yVhOhpRCNhdobX08
	NVuoLVXvSTA9bOr7siY//ZlTOCDVYT+ZwsDwxynAAKko1bVBKMF8cj8l0shMEUZhSeFYGNu4dVc6l
	/ejbe/Kp2or9+zVz+8iQtrsnT0X9WZX9AgYMYWvAIH9LiuOWKyEK4q5abZJprZaPvjXjyRlMBPcRp
	URJngya3fwCfqIuwZFQnTEXenY51BTeopiyw8go8ZgyyaFnqHqdnzs+oC/58T7AZ8xy6XsBfwtRha
	GycixKS/NkohDbMf0rKeDK6EA0EHx9smlKjcNnxNhajRBeF/f1yENYWSAmT0R1abf1RkZ5OfDX5Uv
	RaQkIepw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArfm-00000002Emr-0fqS;
	Fri, 02 May 2025 14:47:30 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArcj-00000002EI0-1PYQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 14:44:22 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542EiEr63882172
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 09:44:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746197054;
	bh=1wmfIKm7N506C2a5N3qHxuYy4t3bfiFN97CIf5mSVFo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vXPR0PCLpRkX85Oc6tod53Uxy0Hg3B63NCJBWuQaY1a+4mTsqYeXlXqgQNEoXNxWF
	 QegY0X+W9oXKQ1j2tFIOWiQr7smo599NlQ7h+n9/HG/p9CLBzzGBUuOgxPdPCiEBpN
	 XB6/DH8G+CtHaRQyh8UxhGW8aZdbMDr6u18oHJWM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542EiEat011001
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 09:44:14 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 09:44:13 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 09:44:14 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542EiDit040995;
	Fri, 2 May 2025 09:44:13 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>,
        Siddharth
 Vadapalli <s-vadapalli@ti.com>
CC: Nishanth Menon <nm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH v2 0/7] AM64 and J7X DT: Enable PCIe 64-bit Address Space
Date: Fri, 2 May 2025 09:44:11 -0500
Message-ID: <174619700947.3122830.6151754441565392409.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250422120042.3746004-1-s-vadapalli@ti.com>
References: <20250422120042.3746004-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_074421_477222_B5615212 
X-CRM114-Status: GOOD (  18.73  )
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

On Tue, 22 Apr 2025 17:30:35 +0530, Siddharth Vadapalli wrote:
> The Cadence PCIe Controllers in TI's K3 SoCs namely:
> AM64, J7200, J721E, J721S2 (AM68), J722S, J742S2 and J784S4 (AM69)
> support two address regions:
> 1. 128 MB address region in the 32-bit address space
> 2. 4 GB address region in the 64-bit address space
> 
> Currently, the 128 MB region in the 32-bit address space is enabled in
> the device-tree. This might be suitable for most of the use-cases, but
> for those use-cases requiring larger address regions than 128 MB it is
> necessary to switch to the 64-bit address space with the 4 GB address
> region. This series implements the corresponding device-tree changes to
> support the 4 GB address region as the default configuration. Existing
> use-cases should continue to work without any regression.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].

NOTE: I have ignored the checkpatch warning on long lines since the
documentation added in the context of the line makes more sense than splitting
it up.

Thank you!

[1/7] arm64: dts: ti: k3-am64-main: switch to 64-bit address space for PCIe0
      commit: 1159f911435b9371575d9956bb5aef579265d29a
[2/7] arm64: dts: ti: k3-j7200-main: switch to 64-bit address space for PCIe1
      commit: 46e3d7d7048872ffb90aa25e360b975dc1c3e28b
[3/7] arm64: dts: ti: k3-j721e: add ranges for PCIe0 DAT1 and PCIe1 DAT1
      commit: 1025003a1e068a25b35e1dbb39cad18e23278c0f
[4/7] arm64: dts: ti: k3-j721e-main: switch to 64-bit address space for PCIe0 and PCIe1
      commit: f0f78192d3b3b3c3c935de0d681e7bf2117bbb13
[5/7] arm64: dts: ti: k3-j721s2-main: switch to 64-bit address space for PCIe1
      commit: 5a765365c689b90ea81f651a43bc30cd9c9c4ed8
[6/7] arm64: dts: ti: k3-j722s-main: switch to 64-bit address space for PCIe0
      commit: 0fde00328cf8245bf498349a696ba22d6a4a1916
[7/7] arm64: dts: ti: k3-j784s4-j742s2-main-common: switch to 64-bit address space for PCIe0 and PCIe1
      commit: b1f9ec6545c6423e106f0aeddc3b8651b5ad116c

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



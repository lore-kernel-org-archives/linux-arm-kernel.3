Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A07FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 21:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eru1uAB6XxcdGB6ETHFsUgF8NYEghEFeFKagaGASKFg=; b=AI5y90pPNkdSRUn1IhYm9bH8hn
	009+WlNv3jEWdvY4RrVerKmyO3nQ48SLvaieVfKppUP34hZU8aeUHQw69y+Cn8QbLaJJeZJZcDIBm
	cijiaH0ZVIsIuLAZWW7tyzbOvJakzkF7HbnfIfoXkn1efnDGhwEdHzc4u3bYiYwqLQJyp2ANJ7Os4
	a6eJ2JVkRoPc3c5mCoNL10zxIUbSBGntZXs9djvWbtKLK0n4RB3VQc7ptiJs/pNnexH2uK2+TjRYF
	8T0EWtjA5LecU+QCxS76/ivsRIntBD4U7YrOaQSnEuPJGe2pKscLn9l4udC4LqdBTAIYHyVOty9/u
	akStZI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QLN-00000000tlF-2pjD;
	Fri, 25 Apr 2025 21:12:21 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QII-00000000tBo-0qjS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 21:09:11 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PL96Qu3026950
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 16:09:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745615346;
	bh=eru1uAB6XxcdGB6ETHFsUgF8NYEghEFeFKagaGASKFg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ebT9O2OaydUolYzIqIHMWRYDr7i7ZqMtelypk66uLG4HCw45+NbwXZrTjK8Xj0+gM
	 lqLJKK/cgADx8Phr6K8tHWarZHR2F3KD+Uf+FiLZmXP2TQh2XfHniwPhew8gSpy/Jr
	 F6FYAiQ/T/yTv1muWidAen7Ts+l5EuYSxDVX6hB0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PL96c5122444
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 16:09:06 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 16:09:05 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 16:09:05 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PL95iw092863;
	Fri, 25 Apr 2025 16:09:05 -0500
From: Nishanth Menon <nm@ti.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Jan Kiszka <jan.kiszka@siemens.com>, Andrew
 Davis <afd@ti.com>
CC: Nishanth Menon <nm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] Fix remaining TI K3 CHECK_DTBS warnings
Date: Fri, 25 Apr 2025 16:09:04 -0500
Message-ID: <174561533074.210099.18320816568415769793.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250421214620.3770172-1-afd@ti.com>
References: <20250421214620.3770172-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_140910_329528_AFCDC827 
X-CRM114-Status: GOOD (  15.62  )
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

On Mon, 21 Apr 2025 16:46:17 -0500, Andrew Davis wrote:
> Until we resolve this thread[0] we do not have a set direction for
> modeling our device's controller devices. For now as the AM654 MAIN
> domain controller region is already one of the messy combination
> syscon + child device containing nodes, no harm in silencing this last
> DT check warning in the meantime.
> 
> Depending on the outcome of [0], this series can be safely unwound in
> a couple ways without any backwards nor forwards compatibility breaks.
> So no need to wait on the outcome there to take this series.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/3] dt-bindings: mfd: ti,j721e-system-controller: Add compatible string for AM654
      commit: 5959618631fec502ec0963f4082d565f7fbfff04
[2/3] arm64: dts: ti: k3-am65-main: add system controller compatible
      commit: 4765253055cc8ab3fdc5f9eb5b121d867e209fb1
[3/3] arm64: dts: ti: am65x: Add missing power-supply for Rocktech-rk101 panel
      commit: ae3ac9ffd59acf46b8934f4e7a5fa7a6803ac959

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



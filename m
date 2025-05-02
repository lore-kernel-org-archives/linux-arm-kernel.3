Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B429CC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 14:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6yQn4QfB0hC25F9cY87ostqbnKwXQMlrXFsKG/EbB0=; b=aZGMx52fr9+nw2sFIKtdSMKxqo
	Axql+jquHjz6rn/6yjIWdYSUlj0dxNp3ew4v/Bk3erGmzPSMmnByl4+Mdg1DkhpdRIHfjSmmMlMxf
	b630XIaO2vMMcq/0ebS0te6dRbGJPNKiOEwlR5/F7Z9debPKJIMsngY7wkl2G4AfRYpYR9REDL6Jo
	KrFm7Em0zTGJKg8R7KEcn2hCDJIjR4KX05EWVaGWlzX6RtY6MHTrcISJDPyToUPr4KEi+WhG5gf2B
	wq27OZHAItjgrh7LyQ6vug/5mLgYQL1cjIem90gACk1D5g4mN6aPFDNRfLxjT0mUQLiqzg650HuBM
	A8fDi38g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArjb-00000002FNr-2Dx5;
	Fri, 02 May 2025 14:51:27 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArdN-00000002EPW-49To
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 14:45:03 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542EiqR63883493
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 09:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746197092;
	bh=m6yQn4QfB0hC25F9cY87ostqbnKwXQMlrXFsKG/EbB0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NZ55NKZAsxorzG6zcWae1wFzvHFNADcoAoUl7a89jWvLzUuNoNVypyRo7I5TAvjt4
	 MDoGK8kV0AiFjP8+1VRyMJrycZ059Fzo/8xGVz9n9NGN/+j24iZGaW2qdESZCa9bHg
	 6FQJCPiKAB5wjJJc4H8SR783V06ol7V0TU+I1ZJE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542EiqoB037936
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 09:44:52 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 09:44:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 09:44:52 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542EiqRu041427;
	Fri, 2 May 2025 09:44:52 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Francesco Dolcini <francesco@dolcini.it>
CC: Nishanth Menon <nm@ti.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/6] arm64: dts: ti: Add Toradex Verdin AM62P
Date: Fri, 2 May 2025 09:44:51 -0500
Message-ID: <174619707844.3123252.13529152591624600690.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250430102815.149162-1-francesco@dolcini.it>
References: <20250430102815.149162-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_074502_130277_4D769D9A 
X-CRM114-Status: GOOD (  16.81  )
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

Hi Francesco Dolcini,

On Wed, 30 Apr 2025 12:28:09 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This series adds support for the Toradex Verdin AM62 SoM which can be used on
> different carrier boards (Verdin Development Board, Dahlia, Yavia, Mallow and
> Ivy).
> 
> The module consists of an TI AM62P family SoC, a TPS65219 PMIC, a Gigabit
> Ethernet PHY, up to 8GB of LPDDR4 RAM, an eMMC, a TLA2024 ADC, an I2C EEPROM,
> an RX8130 RTC, plus an optional Bluetooth/Wi-Fi module.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/6] dt-bindings: arm: ti: Add Toradex Verdin AM62P
      commit: cd156f8741e362f3e0b0282c4abc3d0d0fecda57
[2/6] arm64: dts: ti: add Toradex Verdin AM62P
      commit: 87f95ea316ac68598544d512a3750cd4a73b5683
[3/6] arm64: dts: ti: am62p-verdin: add dahlia
      commit: c98ac03937e24913f90efe16832bac6c22ada76f
[4/6] arm64: dts: ti: am62p-verdin: add mallow
      commit: cfdd38cfeb87d2a69303f3cf1bbc57d404826b28
[5/6] arm64: dts: ti: am62p-verdin: add yavia
      commit: b0a01514cd906bb90eb2c7589a69429bced7ba1d
[6/6] arm64: dts: ti: am62p-verdin: add ivy
      commit: 441870bb81b22d4a3937caeb4b890a94b40c689d

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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BEFEA3F20
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VHs+V5Qf6cBn0u+qBjqXwHoGBqfeVK7Ewhcs2HXJU/w=; b=otRzuzjWncSi7VoFfyP+1TNcc/
	sMwbiqsirFaWK8aehMm/mfb/LpSMsAm4ghdLuF9LLnwsGd9MPZZkVM45wkVC4g7/+1x8LK1kKTr+z
	DqGM4IbPZQX/a9PfvBaZ/S7hpy2VcSb3MQUOBLrL+gigb0+SL1l8/ueET+cMpWwGWOS2iNcnnMZi6
	3lDNBMtBH8ex7IDw/AU74Q7DTlErcpi94BDf9yd7D8lDpxdDqnkIkE5QceHM0PjN5mcReMR/9KiOM
	Y2Zn8rs2SWxta7NhtpPb1Hf254n7qnch4h1nlxLNsNf4IT5PMOdTaNdN4s95osAsycgUz4e1nIb49
	XNRlUIKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiiJ-0000000GfAF-1Cye;
	Tue, 10 Feb 2026 08:03:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiiC-0000000Gf6D-1xxn;
	Tue, 10 Feb 2026 08:03:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=VHs+V5Qf6cBn0u+qBjqXwHoGBqfeVK7Ewhcs2HXJU/w=; b=DSpyflf+s6yyfzlRDf7BaNF7qr
	Gfd55tsRV61JwIQvCwOYvOWjKyu1f/7Q2ZRF1nJNZAn3hxcdPn0CvdBRPahCoezrOtaalZToY9tp9
	6f+xqFTWH9F7Zgb7qaza7tBlRCoQ0G2hHUjjWwspnpmO2m0Vpbsg9PdZCHAP/SJPE5APoTBIqwWZE
	Ti/QdZDIX5Y0sBzXwm8nPH3fQrLqJoQAsZtRZsjVuN7fFg1pQl3j54xVgBKxVWjAbN1MTednTXZTo
	Np/MP+Hftg3w8U8ErplSIMeUv6O7RitU32CPOirxdoPHK89zo3vIRrxAvvDMwJSdeB4hUsh9Ds0tV
	S7ZNHhgg==;
Received: from i53875a81.versanet.de ([83.135.90.129] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vpii8-007v2y-OB; Tue, 10 Feb 2026 09:03:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Move to gated-fixed-clock for Theobroma/Cherry boards
Date: Tue, 10 Feb 2026 09:02:58 +0100
Message-ID: <20260210080303.680403-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_000308_521751_CC5C1C67 
X-CRM114-Status: GOOD (  11.61  )
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

Both Tiger and Jaguar currently use a fixed-clock and gpio-gate-clock
to model the PCIe clock generator they have.

Ever since I wrote the gated-fixed-clock binding + driver, I carry
around conversion patches for those boards to use the new binding
and describe actual hardware.

I submitted different versions in the initial submission of the
then still named "clock-generator" binding, but have reworked
them now to use the gated-fixed-clock binding that actually landed.

changes in v2:
- trim down comment block on generator node (Quentin)
- re-use old clock-name (Quentin)
- update commit message about added regulator (Quentin)
- add patch fixing the pinconf of the Jaguar clkreq_m0 (Quentin)


Heiko Stuebner (4):
  arm64: dts: rockchip: use gated-fixed-clock for pcie-refclk on
    rk3588-jaguar
  arm64: dts: rockchip: use gated-fixed-clock for pcie-refclk on
    rk3588-tiger
  arm64: dts: rockchip: add pinctrl for clk-generator GPIO on
    rk3588-tiger
  arm64: dts: rockchip: Make Jaguar PCIe-refclk pin use pull-up config

 .../arm64/boot/dts/rockchip/rk3588-jaguar.dts | 21 +++++----------
 .../arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 27 +++++++++----------
 2 files changed, 19 insertions(+), 29 deletions(-)

-- 
2.47.2



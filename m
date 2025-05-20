Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8799CC54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 19:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfK/WZUC6HpnE6+y8HvFf0XgBFRz9UTmeovFUb5mvxQ=; b=iHGruqMeKX6+8KYMDKvqcFvy7C
	UtFus4gA3tA4R399XMBSVQXIWVvrn+4g3KRwmjfKeUGmwgJmHNfkLPPqS1hT8XIvi2kk39LdyHPIf
	rPkYUqNfckElEzyEvWsuOe92u8RHee1bYWwJcCc2y8xrb/sxAG8H19rIb6wDSm2C/dkbnDX3h9Dfh
	NrtJIUKufCZ4hpBKmAwu74smDVvkLS4MdJ28/IAiB93LvBDNWdF4M5uUCMezI4WUn06lMG/t0cYne
	v7EywnSIyjBvhIYTlZkOiD2YA198JoSxpf5MDH2r5XAK2qsPbP6Vyd0dFyn3bV89eY6BMKuKg/baC
	gN/K0dYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSi2-0000000DwLg-35H3;
	Tue, 20 May 2025 19:33:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSLi-0000000DtgD-49Nz;
	Tue, 20 May 2025 19:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=qfK/WZUC6HpnE6+y8HvFf0XgBFRz9UTmeovFUb5mvxQ=; b=JljiE9taUQFAHFrx20s04ywxMn
	JN4ULIvssSanFQ5v+g5v3IWMrCq2MUbmXL/RO2VXB6qFNm0nCwD+Wd3tNZtaSrOrCDi4g+ly2M6tD
	0RWDhYWuTtsYacsEuLiwM19Fe1+UHLjWWoxpAoB+fba6fOjIEeH7qpI5RhqEMUin3Pzlg5xxVo7sM
	PXZMSObBkLrbeFA6v002mnypql6p9WDHUF6mfzHB2v5Ys/udKfV6Xu3nmTzRuJvlJHO+O11D9H43Z
	uExJxldkWwih4HLGevcRJPrYkosJcH2NpuTaz873kex0qrx0MACiosm1V3SiN4iMY3u3pAn3L5TdN
	HKmT7DUA==;
Received: from [61.8.146.112] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uHSLd-0004fK-De; Tue, 20 May 2025 21:09:57 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ziyao@disroot.org,
	kever.yang@rock-chips.com,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] Fix some warnings about PCIe and pinctrl on RK3528/RK3562/RK3576
Date: Tue, 20 May 2025 21:09:45 +0200
Message-ID: <174776817932.2879626.9195213851952486465.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250518220449.2722673-1-heiko@sntech.de>
References: <20250518220449.2722673-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_121003_029106_1907BFCD 
X-CRM114-Status: GOOD (  12.27  )
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


On Mon, 19 May 2025 00:04:42 +0200, Heiko Stuebner wrote:
> Inspired by the issue reported by the kernel-test-robot in
>   http://lore.kernel.org/r/202505150745.PQT9TLYX-lkp@intel.com
> 
> fix it and similar issues in all of rk3528, rk3562 and rk3576.
> 
> 
> Heiko Stuebner (6):
>   arm64: dts: rockchip: fix rk3576 pcie unit addresses
>   arm64: dts: rockchip: move rk3576 pinctrl node outside the soc node
>   arm64: dts: rockchip: remove a double-empty line from rk3576 core dtsi
>   arm64: dts: rockchip: move rk3528 pinctrl node outside the soc node
>   arm64: dts: rockchip: fix rk3562 pcie unit addresses
>   arm64: dts: rockchip: move rk3562 pinctrl node outside the soc node
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: rockchip: fix rk3576 pcie unit addresses
      commit: 4d2587e0e1ce7145a38802fa281f4f1f411ec56f
[2/6] arm64: dts: rockchip: move rk3576 pinctrl node outside the soc node
      commit: 8ff721f60257d550daf524fc559c0f0d2176b198
[3/6] arm64: dts: rockchip: remove a double-empty line from rk3576 core dtsi
      commit: f8b11d8cfbfc8a0232c1e7cc6af10583c8bdb3f1
[4/6] arm64: dts: rockchip: move rk3528 pinctrl node outside the soc node
      commit: 7d086f78fe09fb94eb3b2e12436f2feed21d9c1e
[5/6] arm64: dts: rockchip: fix rk3562 pcie unit addresses
      commit: 25d3e1d2558caf823902e3b1b83901f5ac65af8d
[6/6] arm64: dts: rockchip: move rk3562 pinctrl node outside the soc node
      commit: dfab90b9580c2fbc4e8bb4ceee97cdd75832a6e7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


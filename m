Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0815C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 20:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gglx4zAvfkLMpQ1XOKMrFKuCVcehZElgoQp6Brx/pAs=; b=MVz6eZ4d9Wa+mZMpgwGfA4YNzj
	xRU043YU6fzglTr22qjDqoyyuL+srGm3NAQSjx4Tty6AdHm8rKKI4fXQfw/EJ8OnLD4KvLlsUz6wi
	aFPnspURAeA6SdXXliZMrkrWBJio+atOqdzzYaOJgsM8gQXMhEh2okzJuMzTjzptCX2FOW3+arIk6
	P3Ij9R3LnfViMDfJpv5Vzhb/KpQUA7cWOapVfz+/0yPnilE+XlznXaPTZm0UfnjxMYuZ0SVgQKi3y
	3ZB/AbEFgCMk7kxr2HZsRCkCIo7a+AdZxRfUyhqj360ozIplXJsNhG/ieLE2sp5CyeNkNyg83pblr
	mCLcwa8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thx3D-00000005EFC-1RHF;
	Tue, 11 Feb 2025 20:40:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thwz5-00000005DWQ-3vej;
	Tue, 11 Feb 2025 20:35:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gglx4zAvfkLMpQ1XOKMrFKuCVcehZElgoQp6Brx/pAs=; b=H7MrS9De4hPowMUdCH9oefcgN6
	kCXtVpn13LcqwiIJn9sFpI4Vuzc5k7aviykPLir6QP3xYxebYCzuVSYXtBioMeHpF+jw53rpj5dCY
	/hBLBXl2L5oSqTgBJy03681mS07NlmSQfxNa1MH+wcPf349BzjjZNr7prx1Zes2JZ9ep9qaX/sj3E
	jdO7yFhnwdNiTLFAEdQhP1AuV610dcsio0uA+vmo4/4ZS2zFk0mlZGgggfgNe05BNRanaRVf8DX0M
	aFYiR00RE6FS4Wg5KXbh8ElPYQr2ECj0B+AL4EP996tB8Hm1s7XC081OiMCpus98It123U1Q+L/ew
	N4EfNxJw==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thwz0-0003OL-Ao; Tue, 11 Feb 2025 21:35:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: disable IOMMU when running rk3588 in PCIe endpoint mode
Date: Tue, 11 Feb 2025 21:35:36 +0100
Message-ID: <173930613280.1358259.14632106493042428046.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250207143900.2047949-2-cassel@kernel.org>
References: <20250207143900.2047949-2-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_123555_973441_1330AE60 
X-CRM114-Status: GOOD (  12.92  )
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


On Fri, 07 Feb 2025 15:39:01 +0100, Niklas Cassel wrote:
> Commit da92d3dfc871 ("arm64: dts: rockchip: enable the mmu600_pcie IOMMU
> on the rk3588 SoC") enabled the mmu600_pcie IOMMU, both in the normal case
> (when all PCIe controllers are running in Root Complex mode) and in the
> case when running the pcie3x4 PCIe controller in Endpoint mode.
> 
> There have been no issues detected when running the PCIe controllers in
> Root Complex mode. During PCI probe time, we will add a SID to the IOMMU
> for each PCI device enumerated on the bus, including the root port itself.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: disable IOMMU when running rk3588 in PCIe endpoint mode
      commit: 7d1163fc08936fcb5cf5d9daf366c322c3b4e882

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


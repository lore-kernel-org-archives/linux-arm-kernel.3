Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9365FE674B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 13:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zyNlIYVGdqBwPbC3NbHSO9fACJaQ81uwPvV6sz6WN6w=; b=p0NdsWN+mBH6jfeeVTV/iNKWdn
	g54nwW4A4s+7YmfTsuwFCjSTwdcgUKgj1kZ8LCK6e5K/lVFWlKPG2sa7E3YR0xQ+6Ck+I3h7q/5eG
	/0w8sRs2GhrQZqZildq3TJrn3Xto0dZWp2PQcKtlMgVyLkJO+fj3PZZ09qWHiHSdXHTfU0XKfm5a1
	/bmQ2DJlqAsTkjGoKvw92fvVIRFrNFuRNI00wCgqqyIw8E0LD3HuDr4emGBMp0ZyIeE68yVw1kHZx
	GoUVCYG8doOPdTqg/1/E921Z1Q2/6y1Itv+12bW5de0lhchkjbxYzvM6JYWopLMWib92mcDPU5Yku
	R8fCSHLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXg7m-0000000Dp0r-3v3f;
	Mon, 22 Dec 2025 13:38:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXg7U-0000000Dou4-3xLW;
	Mon, 22 Dec 2025 13:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=zyNlIYVGdqBwPbC3NbHSO9fACJaQ81uwPvV6sz6WN6w=; b=aKJ20RLNXHNkpP2m2BcJ6miVeB
	6GhEYyqmtsenDadUpjQQMitJZg3sWrSnZXcvMG5GIEdMvND5H9GZrhGs1X9EQkP2OBbbO4ofLUNO1
	72cLOsJlZPrvNXiiyZxOytHX+jEA5bvXSycFudNyvQgUmmePQ/otQxFXV891s6IclLBhidX7L1sFx
	Xk8A3uz5WWCwkBIeIuvSo8UQXfoAYT/nEtXFvRjKYZZtqdt1+oukQVGqFP7ZFchkIzKKcud/n6MYF
	eZASupZg71vr114cvoI91jlMqOsrlxa5OvabmhCon4iw2osNSONtddl0X07oY0WIyb+duvpQRCSJ1
	0npPj5Ww==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vXg7L-0005s2-6w; Mon, 22 Dec 2025 14:38:31 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/4] PCI: rockchip: 5.0 GT/s speed may be dangerous
Date: Mon, 22 Dec 2025 14:38:24 +0100
Message-ID: <176641067349.1648325.7613113925741792154.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1763415705.git.geraldogabriel@gmail.com>
References: <cover.1763415705.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_053840_987782_61CE4591 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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


On Mon, 17 Nov 2025 18:46:43 -0300, Geraldo Nascimento wrote:
> Dragan Simic already had warned me of potential issues with 5.0 GT/s
> speed operation in Rockchip PCIe. However, in recent interactions
> with Shawn Lin from Rockchip it came to my attention there's grave
> danger in the unknown errata regarding 5.0 GT/s operational speed
> of their PCIe core. Even if the odds are low, to contain any damage,
> let's cover the remaining corner-cases where the default would lead
> to 5.0 GT/s operation as well as add a comment to Root Complex driver
> core, documenting this danger. Furthermore, remove redundant
> declaration of max-link-speed from rk3399-nanopi-r4s.dtsi
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: rockchip: remove dangerous max-link-speed from helios64
      commit: 0368e4afcf20f377c81fa77b1c7d0dee4a625a44
[4/4] arm64: dts: rockchip: remove redundant max-link-speed from nanopi-r4s
      commit: ce652c98a7bfa0b7c675ef5cd85c44c186db96af

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


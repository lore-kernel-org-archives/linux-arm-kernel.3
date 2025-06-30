Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34E9C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 09:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYYqwm/0x3s6bT2OIY4EV6VsEmIz3D1C60tQTlTepEM=; b=Oho+0MFNhmU0cjDqtTj32gS+G2
	LOkEBlFdoHwIbCGrG/Vnwndc3dzexuF43sfQIdEeivDlIdt2C81RrqM8XXCK1EcfCY985fe8aDbAu
	CFNXwG3MJaWAgMF45qvhxmiSuvWb9aDoBLS2ITfmG4Jia9kEK3Lba7MpWT/LDuDf649yFvSTu413l
	zXKOd1PRH8BvsE0zzLCxs16jiJA21oCMOP8OGetxYFfc6zLntN4OYADPw+lr219aCVx9p8iiqKBj8
	/HpmB49KXaFlbf0T2h4j8+h1HlZ3/fNhCs4Ee3qmbq0ICrhd8ZQA781KaIStzBnhOyZIgi4Us3dCb
	s+Yebgqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAcl-00000001j5t-25UL;
	Mon, 30 Jun 2025 09:16:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAYH-00000001iaq-2U44;
	Mon, 30 Jun 2025 09:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=HYYqwm/0x3s6bT2OIY4EV6VsEmIz3D1C60tQTlTepEM=; b=M/Dy0kHKw0idDPTa3AG1rAYr8m
	CBImeUnTk5Wqc8hXsQ7x9BKHoI2dthy0ZqJ2ObiUSy1NRMf9Lw0VKzvKHSB77GK+2gUFcc9S4Jql+
	W3oFonU0ZnSmA4I/K6IHbyAFVB3RJVk5uv0k29/Coq5M2c2ccC94suObf7K8H7Itz1fLRU7OHu1jG
	+NsUgwEz22e0UUY54z+JYSzXRn0nqFHc6A482NL1/12llqR20nwwDbXGSLOJQ7GFojARe3FT3Idyx
	zBG1CPKAoa7TVO5Ciu5+dlOsgoRUx136wH3YeFvoNbFJg7g1sk5OqlcPoPjLVDBNIBVJVVBm1spWr
	0qnP/V2w==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWAY5-00065C-Nn; Mon, 30 Jun 2025 11:11:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Diederik de Haas <didi.debian@cknow.org>,
	Jakob Unterwurzacher <jakobunt@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	stable@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: use cs-gpios for spi1 on ringneck
Date: Mon, 30 Jun 2025 11:11:25 +0200
Message-ID: <175127468078.130313.4898907937836060073.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250627131715.1074308-1-jakob.unterwurzacher@cherry.de>
References: <20250627131715.1074308-1-jakob.unterwurzacher@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_021149_640253_B7448603 
X-CRM114-Status: GOOD (  13.18  )
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


On Fri, 27 Jun 2025 15:17:12 +0200, Jakob Unterwurzacher wrote:
> Hardware CS has a very slow rise time of about 6us,
> causing transmission errors when CS does not reach
> high between transaction.
> 
> It looks like it's not driven actively when transitioning
> from low to high but switched to input, so only the CPU
> pull-up pulls it high, slowly. Transitions from high to low
> are fast. On the oscilloscope, CS looks like an irregular sawtooth
> pattern like this:
>                          _____
>               ^         /     |
>       ^      /|        /      |
>      /|     / |       /       |
>     / |    /  |      /        |
> ___/  |___/   |_____/         |___
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: use cs-gpios for spi1 on ringneck
      commit: 53b6445ad08f07b6f4a84f1434f543196009ed89

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


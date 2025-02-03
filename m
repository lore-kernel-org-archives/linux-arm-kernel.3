Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D43C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 08:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ik41dgyjlw+9TChaY48btmDAd5C/ThMKLX6iSZ9VoAc=; b=NJfudoUlmFHQC5p+fJQ6QEM09j
	23qDNrmvIwrB2+alyVBKQj6umP8Cw1EhcEpndcIGHpvRvoO5O9qE+0ZB3KLZJAiAuZ4aoXz8N2gCq
	ydfNNnIA4fswCPwtKGc1NgKU1FAqwsq5CM3SK2ECatqfj9CzOGOk8UsnLK/3YLVlkV+TbQudPb7Vn
	wexah4rnD1CseePKxBmcGqmdgOm422H2JDjQfDllFI3fZA60pRXhmq3Wrm1mGQqyfVlIdruVeHMEI
	WmerECtf4A5wvW2xt4hSe8i1bj54IxIbtsEN97qJ4OM7QcK7kriLlMwB9WVS85FQ1pEEXgoW8ObRU
	QzxWLsqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teriK-0000000Eoxu-0rP8;
	Mon, 03 Feb 2025 08:21:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1terco-0000000EnWN-1Si3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 08:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ik41dgyjlw+9TChaY48btmDAd5C/ThMKLX6iSZ9VoAc=; b=xWKctEdPbbCKrsivx/7r2nEIyB
	U+C++sN4iBu7EvVHMpajdHRlZKDqC6Edqm7Prchbqw3HWhBgtFX6gkdEU+A/wXVGiX+ZTGl9hn7rQ
	8hqjw6cJ6qVdGz5beu0xK52JtplVbumoWFT1kRMpUTo0fza2J2Tab3bugKZlYkI6px0nSXSERQCtk
	PvAIKGdpDJLf6erb6OFyV1imD4gJnyWgMsMn5nl7W1RgzRdPYug0+7dX9hlvNitE6Ds5YMEjaeunQ
	JjTLDkSh8AgTh5sKSpnB9LtrHN2071LjAeh6Uw2dCuHppBJjvWrXV+PFYD7UZwXSCcGQmRWwfU+pD
	rcqxQ47Q==;
Received: from i53875b5c.versanet.de ([83.135.91.92] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tercn-0005Vr-1W; Mon, 03 Feb 2025 09:16:09 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	quentin.schulz@cherry.de
Subject: Re: [PATCH v2 0/2] Disable DMA on secondary UART on PX30 Ringneck
Date: Mon,  3 Feb 2025 09:16:01 +0100
Message-ID: <173857053620.78657.12420738003783521778.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250121125604.3115235-1-lukasz.czechowski@thaumatec.com>
References: <20250121125604.3115235-1-lukasz.czechowski@thaumatec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_001610_390472_C14A4A51 
X-CRM114-Status: GOOD (  14.30  )
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


On Tue, 21 Jan 2025 13:56:02 +0100, Lukasz Czechowski wrote:
> The PX30-uQ7 (Ringneck) SoM has two external UARTs, connected to
> uart0 and uart5 controllers on the PX30 SoC. The uart5 does not
> expose RTS/CTS pins on the Q7 connector, as they are used for
> different purposes. It was observed that UART controllers without
> hardware flow controller behave unstable if the DMA is enabled.
> This patch series moves the pinctrl-0 to SoM dtsi file and uses
> /delete-property/ to remove DMA from this UART controller.
> ----
> Changes v2:
>  - Update commit message of patch 1/2
>  - Add Cc: stable@vger.kernel.org
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Move uart5 pin configuration to SoM dtsi
      commit: 4eee627ea59304cdd66c5d4194ef13486a6c44fc
[2/2] arm64: dts: rockchip: Disable DMA for uart5 on px30-ringneck
      commit: 11534d3c53d5f3bd93285f8c1adcb793a733ad60

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


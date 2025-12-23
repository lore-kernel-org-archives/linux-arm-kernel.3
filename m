Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D74EE6F086
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wj7GDHLzW+C414QXD/lrtEL4bgBibXRM1vZM9QNHvr0=; b=R1x7R/kjymjVyNFQF35XFuPaRI
	yEI6q1tsxB0Sjsgl8Uik0PQJOQNvwa5YfUkBJpSGZv5yWQ6NcDdmrGAYpghomTIWhCwPFl5qrkC6C
	dW0Pa1ajUsg4mTN3VWUiesTo58RwTRfm16UCYC7Opp0sv/GHMNcrrl/zqE0wp0L0+ZECYqQboMXJ1
	XExLZ7mzZA34WoHKHE5uZ3FVYg9D5ba4ZpL6BmwEORTpamBTV9xfqIEee9NYsvo82hY3HSUDxcBLw
	Vz90w5nNHIQQW+1sVjOQ6TxE4Nc6Ton6IAXtTkBXLlP5eAyW1hrDaOryclRZKJwQERiz/WRfLZyR8
	HIPLijjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6RC-0000000Fqve-1gZp;
	Tue, 23 Dec 2025 17:44:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6R8-0000000FqtB-1c1o;
	Tue, 23 Dec 2025 17:44:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D4CB4085E;
	Tue, 23 Dec 2025 17:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F482C116D0;
	Tue, 23 Dec 2025 17:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511881;
	bh=PLc3ggjOm8pNxE0mUFygpy5myL/Add/ECkFcmWDsJv4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fTamgbyDxueAuqzoR9INSRwthaBzUMhXpEdygryva+7DYO4SeZMDwBavCCXhjiJdH
	 hcZcpyiGn9+XeMsDkXGtt5gkMIOsgfycGsGnykYFyDdB6HsLBViAUZlaRXnYHGwv2k
	 r7U9QTD33CDFoKVGEx0k8DHHPuUe5sS7q9FrQBIxSIFce+VlzxfcqaUYqVUZeh3+ZQ
	 AgRrp/701JuNokeo489S5Dq7Pdqlu8Bjo9seUYBU6gEV47ORyhiUvquWz5cfDzRFhw
	 LMKbW/UmYQkyYFs3mOdDEafdTF1BqQ+Tlf7MERjlytvEuTLM/rfYrYFsnuvg+vtBKc
	 jVn6whfYs3j0Q==
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Guillaume Ranquet <granquet@baylibre.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
In-Reply-To: <20251217-mtk-genio-evk-hdmi-support-v2-0-a994976bb39a@collabora.com>
References: <20251217-mtk-genio-evk-hdmi-support-v2-0-a994976bb39a@collabora.com>
Subject: Re: (subset) [PATCH v2 00/12] Add HDMI support for Mediatek Genio
 510/700/1200-EVK and Radxa NIO-12L boards
Message-Id: <176651187669.759340.13955241073309104035.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:14:36 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_094442_448928_8EF8CFC2 
X-CRM114-Status: UNSURE (   7.66  )
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


On Wed, 17 Dec 2025 11:18:59 +0100, Louis-Alexis Eyraud wrote:
> This patch series adds and enables the HDMI output support for the
> following boards:
> - Mediatek Genio 510-EVK (MT8370)
> - Mediatek Genio 700-EVK (MT8390)
> - Mediatek Genio 1200-EVK (MT8395)
> - Radxa NIO-12L (MT8395)
> 
> [...]

Applied, thanks!

[01/12] dt-bindings: phy: mediatek,hdmi-phy: Fix clock output names for MT8195
        commit: 65790df6dcd2f41fab2288ed3d2c3bca00d8dfd4
[02/12] dt-bindings: phy: mediatek,hdmi-phy: Add support for MT8188 SoC
        commit: 6226f616c8e9ac30c294b86ff59e3a9566e2a8d0
[03/12] dt-bindings: phy: mediatek,hdmi-phy: Document extra clocks for MT8195
        commit: ff89cea2385b6236790f3be2727d9ae527daf4a0

Best regards,
-- 
~Vinod




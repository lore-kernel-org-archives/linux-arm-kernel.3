Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B0FEEF31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 08:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vc01CRGQLcw/5pqYY0c4DTGrG6YXseuv6cjG8JfPxnE=; b=rNbwnhpKED9TSZ5g4twgerRwPp
	dq0wTTtXwQ4g+zlxTDGUsSiSQlsc7tCW3Iv80ELmMPdmwD9QRSNWcpq4hdnolMcIX4VrKWsbBQLC+
	NN47zAlu4WjLzFoCdqVmfhdkOjnOPkzaA56sVOmj3c5bdRelVXAeFPvyfFvt7VJOtLqfHF77h+1NK
	QEEu3/O+DOo0l4XEIcujG0iOvs5Ho77MrOeZMEXCNy1aY2cNe4MgGkQyDq4u589jzbxO2sHnMIArp
	VdH23J1L2k+hA/x5ACE7QaTV/MbOetKMs5Ul+4PiJahdSJDa30NXCcUeuJPH956gW84N8pKxNrew6
	/y6qjtmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3oe-000000019xV-420o;
	Thu, 05 Mar 2026 08:12:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3ob-000000019u1-3rPH;
	Thu, 05 Mar 2026 08:12:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FE22432C1;
	Thu,  5 Mar 2026 08:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FD9C19423;
	Thu,  5 Mar 2026 08:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772698333;
	bh=qhIDiUOpJGUOHKetZKcw0dA0wuDpf9VhjdgGMlIEdTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pVElDDFaW8UyP1bYz0ioQjWGgyilhCihlygdWb5JTaL8HYTjM9JXJGaV8uT+0c07T
	 0oSXXdJvkcvECdbbObpOvP4MCOSJuGhIlX+2hqAPUFlHm3mQ51i28KZh43HmvWV0Qi
	 Owt6LWQQzcLwlkEo9IMSWJ4gKXJz/BOSAgchj38W8G1ltoA8Bsvqkaex7im9kwUjNf
	 tGQ+LERmqP3VbxlLOb6phRUOEOTwjsQZmjFwjo9ULFECnmgDQBXcVW6gj6NLRCkyaU
	 paLH91ckAeLf0lYxqEipB2rKRpla0N0udlB+7nzLTz+QTH79fpXcAUoo59rr9V+vlj
	 KqBv+bCawNZ3g==
Date: Thu, 5 Mar 2026 09:12:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Antoine Tenart <atenart@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>, 
	Daniel Palmer <daniel@thingy.jp>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: interrupt-controller: arm,gic: Document
 symbolic definitions
Message-ID: <20260305-olive-lion-of-culture-b31aef@quoll>
References: <cover.1772644406.git.geert+renesas@glider.be>
 <36c8fe02dc911141170ea6607034422410e0ddc2.1772644406.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <36c8fe02dc911141170ea6607034422410e0ddc2.1772644406.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_001213_982064_62F1B72C 
X-CRM114-Status: GOOD (  11.04  )
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

On Wed, Mar 04, 2026 at 06:21:56PM +0100, Geert Uytterhoeven wrote:
> Currently, the various GIC DT bindings document the magic GIC and
> interrupt numbers used in interrupts properties, but omit any references
> to the corresponding symbolic DT binding definitions.
> 
> Add references to these symbolic definitions, and convert the examples
> to make use of them.  This improves readability, and makes the examples
> more similar to what actual users look like.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../bindings/interrupt-controller/arm,gic-v3.yaml    | 12 +++++++++---
>  .../interrupt-controller/arm,gic-v5-iwb.yaml         |  2 ++
>  .../bindings/interrupt-controller/arm,gic-v5.yaml    |  2 ++
>  .../bindings/interrupt-controller/arm,gic.yaml       | 11 +++++++++--
>  4 files changed, 22 insertions(+), 5 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



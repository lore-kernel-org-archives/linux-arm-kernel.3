Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1BEC021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 21:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DAT4Z/fR4DazPK814lmIU7uKg6/L6K8TykEp9cEL9k=; b=ulyq1/ML/VFOjOsircU1CdT+5/
	MD+eSW62sHzm4gF7JXC0NNKrEVAp8ip3j6qj2+PXe3FILCAHQE2LyqG6rqzP817z4GhWNbeInRdp3
	aWzQIefMGbSQZYQkS1WPYfFf1X75NK2rOya2nQYDSL7slnrZwIu5Jbbefzbxwf1gU9H9Hi/kCwrDP
	hFz8D7N/tEI7AIo7rsDVHuTFviUgB01MfNjTAyauu4zQse0YCxSwUmRWC8sQROF9IqNgD0eypOdiv
	7T0v6mj3sfxNTV76dRbm2oKyxRYwDFo9RcK2MJHfcrEayhLDFMLXZVukPchJsBshtEaR7Syb0N0C9
	5tkOA1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thxVq-00000005Imu-0rGc;
	Tue, 11 Feb 2025 21:09:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thxUO-00000005IJH-2N0v;
	Tue, 11 Feb 2025 21:08:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2582FA40D7F;
	Tue, 11 Feb 2025 21:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26979C4CEE2;
	Tue, 11 Feb 2025 21:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739308095;
	bh=bGAOKA1MkNL81iEciQ/YaP9238hsjmHj0yVs2PHuZjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WQ+4Fr4obzotuKZeY0/kEEylnLtsOD6qn4FsTE6130dX+MJjMj/w+e8PP+Rimq72C
	 TrSDrPoODZpQ0mWRSCDfuz5DIEnbG4cxoY5xlGdm+mXlMGfSE1wUUT/m3Jspj+9rrA
	 G81fXqid9RUh9II6oOuWG9CkvC3Lbz3ogvPg7KAEakKMpacaZBCIQWesFL8M9BTx6U
	 Zbzo+M49Pq+rEzRVuGgmkNbc7Ew8iY78IZleQNZb3B+N5X07Yyb4F1putZOT+qAPRP
	 5y1Ze4HTH/9MfNe8uOxWCKn4VxNHAhJ+YFRaj67QNEb3ULeJzPFkuvAsj7C99etlv+
	 6Sy+bxDDNG+AA==
Date: Tue, 11 Feb 2025 15:08:14 -0600
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andras Szemzo <szemzo.andras@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 09/10] ARM: dts: sun8i: add DTSI file for V853
Message-ID: <20250211210814.GB1172102-robh@kernel.org>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
 <20250205125225.1152849-10-szemzo.andras@gmail.com>
 <20250206161958.1ae885db@donnerap.manchester.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206161958.1ae885db@donnerap.manchester.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_130816_730011_34E21304 
X-CRM114-Status: GOOD (  19.39  )
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

On Thu, Feb 06, 2025 at 04:19:58PM +0000, Andre Przywara wrote:
> On Wed,  5 Feb 2025 13:52:24 +0100
> Andras Szemzo <szemzo.andras@gmail.com> wrote:
> 
> Hi,
> 
> > V853/V851 is a new SoC by Allwinner. Add a basic dtsi file for it.
> > 
> > Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
> > ---
> >  arch/arm/boot/dts/allwinner/sun8i-v853.dtsi | 656 ++++++++++++++++++++
> >  1 file changed, 656 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v853.dtsi
> > 
> > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v853.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v853.dtsi
> > new file mode 100644
> > index 000000000000..8b82b8783127
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/allwinner/sun8i-v853.dtsi
> > @@ -0,0 +1,656 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> > +// Copyright (C) 2024 Andras Szemzo <szemzo.andras@gmail.com>
> > +
> > +#include <dt-bindings/clock/sun6i-rtc.h>
> > +#include <dt-bindings/clock/allwinner,sun8i-v853-r-ccu.h>
> > +#include <dt-bindings/reset/allwinner,sun8i-v853-r-ccu.h>
> > +#include <dt-bindings/clock/allwinner,sun8i-v853-ccu.h>
> > +#include <dt-bindings/reset/allwinner,sun8i-v853-ccu.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/power/allwinner,sun8i-v853-ppu.h>
> > +
> > +/ {
> > +	#address-cells = <1>;
> > +	#size-cells = <1>;
> > +
> > +	dcxo: dcxo-clk {
> 
> What's people's opinion about the node name? Traditionally we call this
> "osc24M", in all the other SoCs except D1 and A100. So is this the new
> black?

That's documented (but not enforced) in fixed-clock.yaml now. It's 
"clock-<freq-in-hz>".

Rob


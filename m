Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E4EC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 20:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=lAibKvibvd7T5W3iaSn801AHja5REt6+1xTQXsSN+m0=; b=sxpVrpNQ1m8aRw
	EXvyRKAbDFwPjj5aeSSa22tF9gDIIkconr3wa/zI+oUpQtBYU3KQfkr6FTBye2UhZ/2Ov/5WksHd3
	x5w2Azim+FbfPDD2pnn4wC5b4KzJ7tWeNTNANli5/TwTxvI3f9DhyNDtKoURxOq9fAPxEbhLgxVPp
	O/DOhSCsxbkUngK/RJkLXurT06c/2qSXWckRymHbxMudRDLFgcOiPWNnsTqBHa3bmaisjpVQqNIRw
	19MkmkcgSiuWhqKl6fUopfB5luv2d7oADcz3Ngh56U+e8Br+MxJabzGt7FQDFv1AwMO+73KyvA4Gz
	BibZHY977Tc3sGRhR+SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEZxM-0000000AeEh-4A8F;
	Mon, 12 May 2025 20:41:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEZvJ-0000000Ae2N-2Zk5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 20:38:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 467EF44E47;
	Mon, 12 May 2025 20:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5DBC4CEE7;
	Mon, 12 May 2025 20:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747082333;
	bh=kg9NkMy5B4dPI9xo/pe0LzyIjCV0NLlaNIUzv5DOXcg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=X1XChO32f0KRB15Adrdya0tZA9RsWZyHi2OyQM90f2f/DxA6HtAIgEERcssph1xl+
	 G3aHwg214YRXq5YCiyZnqaO2iHunQAmi4DFZlpNulNG0jItWntZFyXyIUKnqtV5MJz
	 nCOAb8aSdo1iTQ/vL7nM+j5svpuy9h6AQwiV7C5nZAtbyS1uZ1sWOYO5eZnOgmyqO1
	 GQmz9jpyeCjzc+G1dqd18yFN9PuOL5ojTAgLQfAeg+lcifseYw1r0lAMDVH06EP4LE
	 rFDf3QFMwq+rOz/Obx6SZ0Kp+5u2PEfUpjkEAYD24Z0ItIPu4LYYhRf6iXYhTqrJIn
	 I2NOY1KOmJQ6g==
Date: Mon, 12 May 2025 15:38:51 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	saravanak@google.com, p.zabel@pengutronix.de,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 5/8] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
Message-ID: <20250512203851.GA1127434@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <869269a7-8267-45f3-9e4d-678de18c0888@tuxon.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_133853_674312_CBF1514D 
X-CRM114-Status: GOOD (  20.64  )
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

On Fri, May 09, 2025 at 01:29:40PM +0300, Claudiu Beznea wrote:
> On 05.05.2025 14:26, Claudiu Beznea wrote:
> > On 01.05.2025 23:12, Bjorn Helgaas wrote:
> >> On Wed, Apr 30, 2025 at 01:32:33PM +0300, Claudiu wrote:
> >>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>
> >>> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
> >>> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
> >>> only as a root complex, with a single-lane (x1) configuration. The
> >>> controller includes Type 1 configuration registers, as well as IP
> >>> specific registers (called AXI registers) required for various adjustments.
> >>>
> >>> Other Renesas RZ SoCs (e.g., RZ/G3E, RZ/V2H) share the same AXI registers
> >>> but have both Root Complex and Endpoint capabilities. As a result, the PCIe
> >>> host driver can be reused for these variants with minimal adjustments.
> ...

> >>> +static void rzg3s_pcie_update_bits(void __iomem *base, u32 offset, u32 mask, u32 val)
> >>> +{
> >>> +	u32 tmp;
> >>> +
> >>> +	tmp = readl(base + offset);
> >>> +	tmp &= ~mask;
> >>> +	tmp |= val & mask;
> >>> +	writel(tmp, base + offset);
> >>> +}
> >>
> >> Nothing rzg3s-specific here.
> >>
> >> I think u32p_replace_bits() (include/linux/bitfield.h) is basically this.
> > 
> > I wasn't aware of it. I'll use it in the next version. Thank for pointing it.
> 
> I look into changing to u32p_replace_bits() but this one needs a mask that
> can be verified at build time. It cannot be used directly in this function.
> Would you prefer me to replace all the calls to rzg3s_pcie_update_bits() with:
> 
> tmp = readl();
> u32p_replace_bits(&tmp, ...)
> writel(tmp);

It seems like this is the prevailing way it's used.

You have ~20 calls, so it seems like it might be excessive to replace
each with readl/u32p_replace_bits/writel.

But maybe you could use u32p_replace_bits() inside
rzg3s_pcie_update_bits().

Bjorn


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80D8C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 20:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=lxAa+lqyIz6ocD7YV6umkonJDpeLszoFhJ1rMZ8JEcg=; b=og/lhT/A+d4BSd
	mRpkNktLpXTdSLZVoh2bWrDVwUTYtdAIvO+25rgMTehp3idUPrUbJBRMPlwCCXPsyMwp98ljd2AE5
	1wTZWcODNuaQLMY4DrT88u7zVSHiyYgjQTCKZtBiPug6NITEolkS2uVO40At2IBI2moDAiwTLusvG
	AgcgA833erL5n+HtCmiTsbhiWI9+YPs0OudAcpgttKMM5v0TJRZyGeSclNQuy8Miusn87LjsDFwXn
	JtNvt+rqh12gPMdA5HmackWDElyMoZquND090ew6w3D4FYGvhHvNmrQ9LgYSaLjgzIB/bT0HPWnnP
	jgZgH+1gPsbphuiOGyjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEZkl-0000000Ad97-3AXO;
	Mon, 12 May 2025 20:27:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEZik-0000000Ad05-08r4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 20:25:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EA85A4A74D;
	Mon, 12 May 2025 20:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D75C4CEE9;
	Mon, 12 May 2025 20:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747081552;
	bh=cln9IOQi28YDju/Nx39q/YI+6TzFSaKpgzcvW+4KHUg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=PXPz5tqEEn7YI/LRDehuE9Wx6021yCNOYYo8cP2QO6KrLVRqheGAh6KVLIurBZPZq
	 broMq3BnJXbatqkcOe9VxUqh8ZKa7yASR+/sANZ9lhLacbi0FrGIgsuL/ZwnP3sUaH
	 x/SkxdHzcMtNkPCABpEvBW0xkeCXk3fHkCwVq7LIv1Tz9mM20PaKAa1qaCxMuYKiHm
	 DimDcNqefDelEy2YoFZh7lnW9eFvbMx9q1VDBIRDZkohVJjnK7tR1jw6r4a1hnmiKf
	 HXxw57fBCS3TKYxskUxwBF/6Rge8WGH2mnq9HfXitl6abar40pW9FMswo3O00CyBsn
	 Yq+Ur1t4mHu2w==
Date: Mon, 12 May 2025 15:25:50 -0500
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
Message-ID: <20250512202550.GA1126561@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26bdfbd6-7bf5-4688-b793-5d0f613d340b@tuxon.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_132554_113847_53359444 
X-CRM114-Status: GOOD (  34.83  )
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

On Mon, May 05, 2025 at 02:26:43PM +0300, Claudiu Beznea wrote:
> On 01.05.2025 23:12, Bjorn Helgaas wrote:
> > On Wed, Apr 30, 2025 at 01:32:33PM +0300, Claudiu wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
> >> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
> >> only as a root complex, with a single-lane (x1) configuration. The
> >> controller includes Type 1 configuration registers, as well as IP
> >> specific registers (called AXI registers) required for various adjustments.
> >>
> >> Other Renesas RZ SoCs (e.g., RZ/G3E, RZ/V2H) share the same AXI registers
> >> but have both Root Complex and Endpoint capabilities. As a result, the PCIe
> >> host driver can be reused for these variants with minimal adjustments.
> ...

> >> +static void rzg3s_pcie_irqs_init(struct rzg3s_pcie_host *host)
> > 
> > This and many of the following functions have names that don't
> > correspond to anything in other drivers, which makes it harder to
> > transfer knowledge between the drivers.  If you can find a pattern
> > somewhere to follow, it will make it easier for others to read the
> > driver.
> 
> OK, I'll think about it. Do you have a recomentation?

Not really.  Maybe pick a driver with recent activity.

> >> +static int rzg3s_pcie_probe(struct platform_device *pdev)
> >> +{
> >> +	struct device *dev = &pdev->dev;
> >> +	void *devres_group_id;
> >> +	int ret;
> >> +
> >> +	devres_group_id = devres_open_group(dev, NULL, GFP_KERNEL);
> >> +	if (!devres_group_id)
> >> +		return -ENOMEM;
> > 
> > What's the benefit of using devres_open_group()?  No other PCI
> > controller drivers use it.
> 
> This driver uses devm_add_action_or_reset() to keep the error path simpler.
> Some of the action or reset registered handlers access the controller
> registers. Because the driver is attached to the platform bus and the
> dev_pm_domain_detach() is called right after driver remove [1] having devm
> action or reset handlers accessing controller register will later lead to
> hangs when the device_unbind_cleanup() -> devres_release_all() will be
> called on remove path. Other issue described in [2] may arries when doing
> continuous unbind/bind if the driver has runtime PM API (not case for this
> driver at the moment) that access directly controller registers.
> 
> This is because the dev_pm_domain_detach() drops the clocks from PM domain
> and any subsequent pm_runtime_resume() (or similar function) call will lead
> to no runtime resume of the device.
> 
> There is a solution proposed to this here [2] but it slowly progresses.
> Until this will be solved I chosed the appraoch of having the devres group
> opened here. If you agree with it, I had the intention to drop this call if
> there will be an accepted solution for it. If you are OK with going forward
> like this, for the moment, would to prefer me to add a comment about the
> reason the devres_open_group() is used here?
> 
> This is not PCIe specific but platform bus specific. There are other
> affected drivers on this side (e.g. rzg2l-adc [3], rzg3s-thermal [4]).
> 
> A similar solution as [2] is already used by the i2c subsystem.

OK.  Is there something unique about rzg3s that means it needs
devres_open_group(), while other PCI controller drivers do not?  Or
should the other drivers be using it too?  Maybe they have similar
latent defects that should be fixed.

If there's something unique about rzg3s, please add a brief comment
about what it is so we know why it needs devres_open_group().

Bjorn


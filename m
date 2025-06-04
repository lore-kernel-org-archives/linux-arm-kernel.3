Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AA7C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 19:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=UM3sOgSjonfGSuGoHdGzZLzGjTDlyfl4NGEgldF5Ya4=; b=goDpYrpjwfI7Tv
	KfgCeQw9ufUkW7kzkKGax+ZCVuZ5mPy01vZpUL844gL0pwu7f2HRnWSyjKXtKzCUmJzzoCeXEB+bY
	WURAtTy/2WiTWmEheOARrwM0oUGjX5vXBWFhp4Au40kZmHZmFiJK3i9vfZ0uZC4iJGKoEeSYcKCft
	oIhxXHAacINAMytPv9VooquVqjc5AxDXx9NQgCeQ/4dVApk6feFXiG7RK3d1kCv5u+w1aMCxR0fp8
	5Zv1QIncMoENpBoLp/assibq3rjddVYaGQv8XJ3TpI4clPeZFl6uVCvN006o5+RI/g2DVMKuXyqUb
	NXSoM5y6/q31vxLTyvxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMuG0-0000000E8et-1zgY;
	Wed, 04 Jun 2025 19:58:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMt6W-0000000E2iB-24oe;
	Wed, 04 Jun 2025 18:44:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A6355C656E;
	Wed,  4 Jun 2025 18:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFED0C4CEE4;
	Wed,  4 Jun 2025 18:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749062687;
	bh=EcqIEu76v+ExmEM3HZKzLHuCykcVPoooykubp6BZ/ZE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=AjzuDRyFDhGTPH+X9h2Ta/0pCqmctmhSUIprVyPMBEqgy2MQOwKw2j2ZEindiLvD+
	 6uoQoM5wj74hm3gdfCVATatJnv9j0I9bgM2ukVJFU7csL83JjCmxfkI+ayLPjTPm8v
	 qX+egtay6PWa1zCxMmpcHbCThv51rh9XGZhDm5g6nAkJA0/RVlVR71BoOvmTvDArec
	 tYu58pfh+sVFLTjfT21fHfcTRwslgv6bnol52OOE93VhUpuFkc6pd6vGmICW6rRhhy
	 jqN9X1GGhlCakLtpheFNDOlAIrtM8MS+O/e8Ntxl2yVPJMJi+3xxHJmGO5EOIrZ4Q6
	 kz92/sUS4lnhg==
Date: Wed, 4 Jun 2025 13:44:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Niklas Cassel <cassel@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/4] PCI: dw-rockchip: Do not enumerate bus before
 endpoint devices are ready
Message-ID: <20250604184445.GA567382@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rrtrcwajj4vjvbqzosskdnroqnijzaafncgckoh2dlk3c4njvs@twop3vyidmh7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_114448_626432_3FA38373 
X-CRM114-Status: GOOD (  28.98  )
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

On Wed, Jun 04, 2025 at 10:40:09PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Jun 04, 2025 at 01:40:52PM +0200, Niklas Cassel wrote:
> > On Tue, Jun 03, 2025 at 01:12:50PM -0500, Bjorn Helgaas wrote:
> > > 
> > > Hmmm, sorry, I misinterpreted both 1/4 and 2/4.  I read them as "add
> > > this delay so the PLEXTOR device works", but in fact, I think in both
> > > cases, the delay is actually to enforce the PCIe r6.0, sec 6.6.1,
> > > requirement for software to wait 100ms before issuing a config
> > > request, and the fact that it makes PLEXTOR work is a side effect of
> > > that.
> > 
> > Well, the Plextor NVMe drive used to work with previous kernels,
> > but regressed.
> > 
> > But yes, the delay was added to enforce "PCIe r6.0, sec 6.6.1"
> > requirement for software to wait 100ms, which once again makes
> > the Plextor NVMe drive work.
> > 
> > > The beginning of that 100ms delay is "exit from Conventional Reset"
> > > (ports that support <= 5.0 GT/s) or "link training completes" (ports
> > > that support > 5.0 GT/s).
> > > 
> > > I think we lack that 100ms delay in dwc drivers in general.  The only
> > > generic dwc delay is in dw_pcie_host_init() via the LINK_WAIT_SLEEP_MS
> > > in dw_pcie_wait_for_link(), but that doesn't count because it's
> > > *before* the link comes up.  We have to wait 100ms *after* exiting
> > > Conventional Reset or completing link training.
> > 
> > In dw_pcie_wait_for_link(), in the first iteration of the loop, the link
> > will never be up (because the link was just started),
> > dw_pcie_wait_for_link() will then sleep for LINK_WAIT_SLEEP_MS (90 ms),
> > before trying again.
> > 
> > Most likely the link training took way less than 100 ms, so most of those
> > 90 ms will probably be after link training has completed.
> > 
> > That is most likely why Plextor worked on older kernels (which does not
> > use the link up IRQ).

Definitely seems plausible.

> > If we add a 100 ms sleep after wait_for_link(), then I suggest that we
> > also reduce LINK_WAIT_SLEEP_MS to something shorter.
> 
> No. The 900ms sleep is to make sure that we wait 1s before erroring out
> assuming that the device is not present. This is mandated by the spec. So
> irrespective of the delay we add *after* link up, we should try to detect the
> link up for ~1s.

I think it would be sensible for dw_pcie_wait_for_link() to check for
link up more frequently, i.e., reduce LINK_WAIT_SLEEP_MS and increase
LINK_WAIT_MAX_RETRIES.

If LINK_WAIT_SLEEP_MS * LINK_WAIT_MAX_RETRIES is for the 1.0s
mentioned in sec 6.6.1, seems like maybe we should make a generic
#define for it so we could include the spec reference and use it
across all drivers.  And resolve the question of 900ms vs 1000ms.

Bjorn


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC518C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 17:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=5hmDkoykXyuPCNX5o4VG9nAOn2vOS+ZzIkyEv+1eQgQ=; b=Tdx7eDuFJWEFbi
	enkPLstFxxnM9FCvqWlbpexqs6vuuFY0Pt4vCbvRF7IuYbl3M+aiJJF/eZgVk15GniLvyE0060Qub
	fz8tufNPojLlU3fHN5WfaIRGSEJCwwMwuReEBIUdGBpSi/ZSw/YaolsRjI4zrxMUmLU2ewrAcc1uM
	sbVxi8khZGe2x62l00RHiePniqbkaZdJOxPLYZTkdH2Ml1LE+SJHMxY1tWpxlMSnIK2Wd+QvDSmO/
	ZcAGbAWK2ft0MQvTFDIBOkI2xFyryDywWq5hGkZa1aQQeqD3yzZw2oECjUaSYpAO7ToymG038jq2e
	edLeyvl8fLril1lv5YzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKqx-0000000A9SQ-2dJs;
	Mon, 13 Jul 2026 17:54:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKqw-0000000A9SK-3My4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 17:54:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 387B242A54;
	Mon, 13 Jul 2026 17:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10EB1F000E9;
	Mon, 13 Jul 2026 17:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783965242;
	bh=5hmDkoykXyuPCNX5o4VG9nAOn2vOS+ZzIkyEv+1eQgQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=QIFnMeAWfUu5xUX6zoFQeRz6/U1yN51/WVkbP9f8XVzRUvQVcT1PnbYX012sRdGsu
	 Yyal/hZB1vTsCmmRZ1bfV9/nK3hfKtCLBdKy6S/lOLRz1Oi6xaTlUo0xAJH3y5yvxM
	 LF+DBgK79KTe3L40BkSYfaO9GEaxv0EosnBX1cz3wVSzqIt6k4wZKpttVTk6Blf79y
	 l5DQy8Qg/eQRV85kTfyR1ZXpHugtN7H2fv/jsSbItz9sx+XylYKfvyjHwM9kZFH0Ov
	 dqRv/ToS+zowvCFe6dUK0hqlP3fS9gS7EEOwmUmNOJYpLQmrIqhxrlv50iR7bml+nK
	 mIwHXEWzlrz2w==
Date: Mon, 13 Jul 2026 12:54:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-pci@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
Message-ID: <20260713175400.GA1258926@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cb03029-0957-4ed8-98bd-9b3e0e0bce2d@mailbox.org>
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

On Fri, Jul 10, 2026 at 03:35:10PM +0200, Marek Vasut wrote:
> On 7/10/26 10:30 AM, Marc Zyngier wrote:
> > On Thu, 09 Jul 2026 21:10:03 +0100,
> > Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
> > > 
> > > Instead of pulling in the whole linux/irqchip/arm-gic-v3.h ,
> > > copy the one GITS_TRANSLATER register offset macro directly into
> > > the driver.  This repairs the ability to build the driver on
> > > non-ARM non-GIC targets the way it was possible until now, which
> > > retains good build test coverage.
> ...

> So in the end, it is either this patch or limit the build to
> arm/arm64 . At least this patch still allows building this driver
> with more compilers on the various build bots, so I would opt for
> this patch here.

I like the build coverage, but duplicating the #define doesn't really
seem good to me.  It makes readability worse because cscope/tags now
sees two definitions without an obvious reason.


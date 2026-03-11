Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F96104BEDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/BxnOsKpXyJQnekkvYf+o8NWkmGy4DjNnbucwVbsLY=; b=qq6YHfQz52P1KM6r46TgGt9B4Q
	PB80oMArxqPDHGZEGWmO6X7VKhnRl5sh3DQce5m2E3e/qV8+SM8wsY7FIzLBVkyB/AeDVksdkkiFR
	qUGh1T1PZuDm01RVxJlr5r9BepNquflQotgCOJpzUFoH97jWt0HouRI66n3Cp4M4el9UJmG2OHC8w
	EY57a7h3DOgNSuJiFVPZuc5YZ3oAMRlMBDGA634bYHjop+EXlSvtsxj8ma59o6N60NsenOu8lqNiN
	an2M0DUEOnIS67NU3TNBuc+wc1CLngtR/8H3kmZOO8MTyn2EQk2rWFTVt9DqSD7Bfn+CNx4eU5LyR
	RoBo7FcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gxy-0000000BRbm-389h;
	Wed, 11 Mar 2026 10:39:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gxx-0000000BRbW-2oB0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:39:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98527600B0;
	Wed, 11 Mar 2026 10:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4256C2BC86;
	Wed, 11 Mar 2026 10:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773225540;
	bh=W7ULGNJxGs/DGU9Myuy1oXiG5LI/4bcuMikaWvPhafA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPXTMuVttZqUZ/o7JPPcYnite3Um4wggHLpvXqpIoWuC2usNA6k425SfK6rMs77rB
	 CYWeP0jsQTNUcUIy8PnTh9S3O1nsMJGjNBhq2Dq0SHWq7cP3w5ZyXyw9RdDTA3R1eW
	 S440F5uh0GmInYEkvybjOxJt938zdDJqpyKVdapOCNKsje+vi1+1YLP/xkfpiLNDws
	 05TBCJ8PNE7rD4f12++HjlcvSoHkNaTbYC0bbQKnbCiOof2KrsmYEZaZiY5R+JFXdj
	 /8xPc+/68mvyzrREgIspZOqMj2/RD7sCmgpK/s0D84g4YnUN/WpSgEaH93P51o62GI
	 KrW++eDJAd9HA==
Date: Wed, 11 Mar 2026 11:38:50 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/9] PCI: endpoint: Introduce pci_epc_bar_type
 BAR_64BIT_UPPER
Message-ID: <abFGOoZUX_vexLWR@fedora>
References: <20260302095913.48155-11-cassel@kernel.org>
 <20260302095913.48155-12-cassel@kernel.org>
 <dtxdgxrewfby5hu3cu3pu5kljylm627uc43sw75gk7loimmm6r@ei4w6wmqgd6a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dtxdgxrewfby5hu3cu3pu5kljylm627uc43sw75gk7loimmm6r@ei4w6wmqgd6a>
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

Hello Mani,

On Wed, Mar 11, 2026 at 12:05:59PM +0530, Manivannan Sadhasivam wrote:

(snip)

> This also brings the question, do we really need to mark the preceding BAR?

From a pure code PoV, marking the preceding BAR is enough even with the
current code:
https://github.com/torvalds/linux/blob/v7.0-rc3/drivers/pci/endpoint/pci-epc-core.c#L101-L103

However, the current documentation claims that the succeeding BAR must be
marked as BAR_RESERVED:
https://github.com/torvalds/linux/blob/v7.0-rc3/include/linux/pci-epc.h#L207-L210

I want to change this to BAR_64BIT_UPPER / BAR_64BIT_UPPER_BASE, so we can use
BAR_RESERVED for BARs that expose fixed hardware resources (e.g. eDMA regs).


Thus, an EPC driver does not strictly need mark the succeeding BAR with anything.
This was done mostly for clarity. (E.g. with BAR_64BIT_UPPER_BASE it is obvious
that this BAR cannot be a standalone 32-bit BAR.)

If we don't mark the succeeding BAR with anything, IMO, it is less obvious that
the succeeding BAR cannot be used as a standalone 32-bit BAR.

But... since the code already does the "right thing". We could simply nuke this
part of the documentation, and drop the .type for all BARs succeeding a
.only_64bit BAR, if you prefer that option over having a dedicated type for the
"upper base of a 64-bit BAR".


> Why can't we let the PCI EPC core to always assume that if the previous BAR
> has 'only_64bit' bit set, next BAR cannot be used as a standalone 32bit BAR?
> 
> I find it weird or redundant to mark both BARs.

Redundant, yes, but in my opinion marking both BARs makes it unambigious
that two BARs are used when a BAR is "only_64bit".

E.g. Manikanta originally wanted to add code comments for the upper part of
the 64-bit BAR:
https://lore.kernel.org/linux-pci/20260217-master-v1-2-727e26cdfaf5@nvidia.com/

Sure, we can just skip the .type for the succeeding BAR...
But is that really better than clearly showing that a "forced" 64-bit BAR will
always occupy two BARs?


Tell me what you prefer:
1) s/BAR_RESERVED/BAR_64BIT_UPPER_BASE/
2) Change documentation and drop .type for a BAR following a .only_64bit BAR.

And I will respin with that.


Kind regards,
Niklas


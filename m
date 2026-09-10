Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C04C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6HCWu2hbcfle+OvKBSmPT4M6o/vYsuuZIXSEloGREU=; b=2VJ4JupGjR3kHRjdqv2dnSPr9u
	jvlrjUzJylzlpq1Wtt5sr9f00TVd5wO23nV69x+s8P1pIbMEeJsdpEUdNXpx086iLf9Sdkg56bQ8R
	iBbGWFFXcNdDqbn7CSMrVdmLE1Q/qeSFhSdYyCrmLmRTP0DpkyXfyTiFJxyDleYW8QPF2AUZX0zVr
	TuevlfbRk4N/Q9rU/RKm7VEQe2LJw51c56eY3bPDmgvkq3pr7K99ZO9ibJNxZeXZoda2GdZjClf7J
	B4tRMzpOu9E7tPLioi8hWAKS7XVNLfxuPuBiQtSFeOcyNksAA0agK3Q4yFNwNYfZx5HGTQpNF4juF
	EnuzUtAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Zib-0000000DgQU-0cJm;
	Thu, 10 Sep 2026 08:01:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZiY-0000000DgQI-3pgx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 08:01:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F20CD60204;
	Thu, 10 Sep 2026 08:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016B71F000FF;
	Thu, 10 Sep 2026 08:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789027269;
	bh=l6HCWu2hbcfle+OvKBSmPT4M6o/vYsuuZIXSEloGREU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kENVZIJ6Uwy1AioUjX39zcpAXhJV5m/O0gndOlbR+X0rlfBdx0Jy4Z+GvrbaU72Q4
	 3VVmb4dkFP77usyi/rl9Cp0yXO9ULeuFTXvT2R0q0iShedmOKmo5Bs3g413mD7MsBq
	 baDOyMPqczfWvrbDWtymIrqwEyvFQH3zKQArocrA/ugDKvo+M4voX0vcbqSGDjUMs4
	 1GsP2S9nGOVgZurcLZ4YvdUEpooOnUcSfd8Gv5pImRt6exOzyaGNfPIm/1PwaoFiuI
	 26B+zwgZO9M877skA+NBC1SgiXRMRY26rDvcvS/jlc8fWDZExCQjZgBR2p0d8MFknc
	 Ul1aZR4LcvXIw==
Date: Thu, 10 Sep 2026 10:01:00 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-pci@vger.kernel.org, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"moderated list:ARM/UNIPHIER ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCHv2] PCI: dwc: uniphier: use fwnode API for
 legacy-interrupt-controller
Message-ID: <hkyniwb2j5vvigayiqwix7hyosijz7aplgeuy7tvooukthvqgx@ogjpatxnogua>
References: <20260722231532.872962-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722231532.872962-1-rosenp@gmail.com>
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

On Wed, Jul 22, 2026 at 04:15:32PM -0700, Rosen Penev wrote:
> Convert uniphier_pcie_config_intx_irq() from the OF-specific to the
> generic firmware-node API: of_get_child_by_name() to
> device_get_named_child_node(), irq_of_parse_and_map() to
> fwnode_irq_get(), of_fwnode_handle() on the child node to passing the
> fwnode directly, and of_node_put() to fwnode_handle_put().
> 
> Unlike irq_of_parse_and_map(), fwnode_irq_get() returns a positive IRQ
> or a negative errno and never 0 (it rewrites 0 to -EINVAL), so check
> pp->irq < 0 and propagate the error. pp->irq is an int, so the negative
> value is preserved. Drop the now-unused np / dev_fwnode() locals, since
> device_get_named_child_node() operates on the device directly.
> 
> Built for arm64 (defconfig + CONFIG_PCIE_UNIPHIER) with LLVM=1;
> drivers/pci/controller/dwc/pcie-uniphier.o compiles cleanly.
> 
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

What is the point of doing all these conversions of an OF only driver to fwnode?
It just adds noise and provide no value.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


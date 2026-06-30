Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DB8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FL0SLwfXlT7L+oOMsLkMNmEaeLRGVGRS0w0AOzU0THw=; b=xJmeUJDFUPwkcVFEodq2el9Cfz
	giRqfJJ3+uOBqFX1ykoLGe7G3Tkr9Ggv84hf5Eiv4sxE7NE+dKUQdx5e7YuRsfIkLrZxB12G8Ad/Q
	A62dSG9Jyn9HLtYlQ8gazFINjvLQO1su8SiHffVyuXUA6zEOWaBEMU70ukLagVvlHoled/jkC362V
	+iRk6Kl2268Ma0KNo3C6S3Ao8lDcKSyN0zJgR+3RVM/cQAy69EZCE1h6aN0sZABgv3BG8JhKrDoVH
	AniVjd4fKJX52KlX4dSLoZ8W/nlUJTxzj8Dq6IzhEvfeJJ7rqE4gEngsLHvIHF7zaOMBLN2xZwPfh
	FUQhgZ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSpS-0000000G5sC-2AHe;
	Tue, 30 Jun 2026 07:24:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSpR-0000000G5s6-2jP8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:24:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C56A760008;
	Tue, 30 Jun 2026 07:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084F81F000E9;
	Tue, 30 Jun 2026 07:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782804260;
	bh=FL0SLwfXlT7L+oOMsLkMNmEaeLRGVGRS0w0AOzU0THw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cmQAdiHpPL3ydZ6Op4olnnbcfAimXfAgdq5sVrz7ImVtTKi2QvvoYh5a15SQDVKpS
	 mlU4S6PT+c8N6SNeYen5dKjLFpR/eIAHQAPb8TSd6iWk4R4zj2cIdjdwpLGdeTF2Xc
	 yUBc29xjS0d6iUuB0Q9WOOxDCqVwBQnkv03DvnqbE059urMTaTZ/BTAI+1pNtj7fsF
	 TCdXnZx+qLutQuTKq7e6W7eu4KwnUk2cc8fgrPaQm6j4q12IfU9o8wD9vvkfKdqozW
	 HtPX3k8QUI+NxjQ81fnty4ESvLbg1yGbwYYFSiWiB21MciL7nMeGOxTz29pP0ozQmN
	 hfo/iYrS5r71g==
Date: Tue, 30 Jun 2026 09:24:09 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, Frank.Li@nxp.com, 
	bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, will@kernel.org, 
	"Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>, imx@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, sherry.sun@nxp.com
Subject: Re: [PATCH V2 0/2] PCI: imx6: Improve PERST# fallback logic
Message-ID: <wj7dtqwadw4mletyq2s2an3g74acpmvvnkbogsdztgb27s2lul@i6ogmrnbd6to>
References: <20260525065443.2338629-1-sherry.sun@oss.nxp.com>
 <178280401285.286395.10401291228239552702.b4-ty@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178280401285.286395.10401291228239552702.b4-ty@b4>
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

On Tue, Jun 30, 2026 at 09:20:12AM +0200, Manivannan Sadhasivam wrote:
> 
> On Mon, 25 May 2026 14:54:41 +0800, Sherry Sun (OSS) wrote:
> > From: Sherry Sun <sherry.sun@nxp.com>
> > 
> > The pci_host_common_parse_port() shouldn't decide whether to fall back
> > to the legacy RC-level binding by checking for "reset-gpios/reset-gpio"
> > properties on the RC node and returning -ENODEV. That's a policy
> > decision belongs to the caller, not this common helper.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/2] PCI: host-generic: Simplify return value handling in pci_host_common_parse_port(s)
>       commit: 4b523544008aa70cda4b34c0589bbe47172c2637
> [2/2] PCI: imx6: Add imx_pcie_perst_found() to inspect the parsed result
>       (no commit info)
> 

I've squashed patch 2 with 1 to avoid bisectability issue pointed out by Sashiko
and rewrote the subject/description as well.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FA9C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=OP3JYLBXOqOHgXrUVwmby9CoOJ787szehasQI38rGyQ=; b=OZQWxqGDlLLwIx
	QjNkLnmhvNFkRnk79Zbgs0F9HeaQaayK6IvmXaemqT7busVN/b3MS0JE9vNGZuk0DUYdLwiuhSPO0
	H+xUb3YecUp8ZjwH0QJutwXCCB1wlW/aS0l4qH+wM0cWp9gF2sBQQ0fpafuVxr09poWG5FY5kqdgs
	+zKtedBrKBYe4Mb48InhHp85jS77B9x1kWnbkd5hGBsABmZGrxhRQrYosG6vbLQZvbIojLRGYTdj0
	ztQoIjsEVxEGE2zPazHpsfLKQdw8IHs8dy/DxGtfpeYzolxLUPSlqJSo2+maZaMESlXFUDAf7B5C/
	2AatnqDoVFA8Byjd/cNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7K7J-0000000CcQY-1iT9;
	Thu, 17 Sep 2026 21:58:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7K7I-0000000CcQS-1gN3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:58:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C169C41E5F;
	Thu, 17 Sep 2026 21:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7769B1F000FF;
	Thu, 17 Sep 2026 21:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789682283;
	bh=OP3JYLBXOqOHgXrUVwmby9CoOJ787szehasQI38rGyQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=CMs0O2Bc4ICSa1T8bJvuWgzlf1kyPiBEEAF8YyNkZlKYj7AxxFwuNZMf3kUkq6Spa
	 2qeDwdnLti+1xiaJ9UVSm+RmoHRrX3uzf2/IH2yZFTVvppENKWnC0ZpTieYrfRdFxR
	 CSNdnYwPeuvBZBm3nKeHhvWK+Q4iUClTWxeQ0Oawmp32DyR1beYSUW/qKkJZ7GvprH
	 GqeZzJlKBlIJ1lXFBksRX5HROuSwupFZSnbecaWuaYZeecNNWl9Nc+lEaSKRZjTJ3k
	 JUckV5Lra7ixgKiCSl9YKGOc8KE0Jk+DOq5/1uERCzIaTyfo5f752rKdDTL+lqMFs1
	 k4YU98t7DQ4FA==
Date: Thu, 17 Sep 2026 16:58:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	leoreis.costa@gmail.com, fra.schnyder@gmail.com,
	francesco@dolcini.it, frank.li@nxp.com, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, hongxing.zhu@oss.nxp.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>, stable@vger.kernel.org,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH v2] PCI: imx6: Move clock enable after core reset
 assertion
Message-ID: <20260917215802.GA1056201@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ed9e4de-2e57-4c15-875c-16512f00163f@leemhuis.info>
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

On Thu, Sep 17, 2026 at 01:08:03PM +0200, Thorsten Leemhuis wrote:
> On 9/2/26 16:15, Manivannan Sadhasivam wrote:
> > On Thu, 13 Aug 2026 17:50:03 +0800, hongxing.zhu@oss.nxp.com wrote:
> >> Commit 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
> >> inadvertently moved clock enablement before core reset assertion, breaking
> >> PCI device initialization on i.MX6Q Apalis platforms with
> >> ASM1061/ASM1062 SATA controllers connected.
> >>
> >> NOTE: It is not 100% clear if the issue is specific to the ASM1061/ASM1062
> >> device or on the specific power-up sequence (reset vs cold-power-on).
> >>
> >> [...]
> > 
> > Applied, thanks!
> > 
> > [1/1] PCI: imx6: Move clock enable after core reset assertion
> >       commit: 16929741a622eb345057e41c7b335d9b297890e1
> Thx Mani.
> 
> Mani, Bjorn, what's the status of this patch? Is it heading to mainline
> any time soon? This (unless I got confused, which is possible!) afaics
> fixes a 7.2 regression that annoyed quite a few people -- which is why
> it was even briefly considered to revert about a Dozent changes shortly
> before the 7.2 final:
> https://lore.kernel.org/all/20260811214900.GA763236@bhelgaas/
> 
> Didn't come to this, but it afaics would be good to finally resolve
> this. Or am I missing/confused something?

It's in pci/next, but probably should be in for-linus.

I moved it to pci/for-linus for v7.3, thanks for the heads-up.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0706E77182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 20:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=saNpTLRGid0dJH2QIpJUDMuGmIyVFvgQVhJ29lzQt0U=; b=Vm1kUh7m0DIBvR
	knkyLTfIytApVn8/5BRhrVdB4vzi41W3CHxVJ0GJChNbEwIQwNjTIoyGglCnDHtOkWoqDezbgx5GO
	kpp9sMkxFdSw6/rLdKvvWicxp/n23/Q2tc9AuXhidZL/cd4RV/gEmwn7+e/jLrmOegm+H7dhYN+Az
	vaEdcSLKqYDuAZc6xZN1Ql5os6ONv06e8KF4RKlK9qbsWgtEYQliae0Vwifi53SxrH0NBjeosvLrG
	Yrmp0U8CRacCDBig53dqeZXXiVfhJbFwSgCf85DCt+Gu5EcTHYfM1ywEblg3kJTvoZVQVPPAqM7VH
	PWqlhlzS/p+cMYxYze2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLTGm-0000000G1QD-4BA1;
	Wed, 11 Dec 2024 20:25:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLTFk-0000000G1KM-05H2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 20:24:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DD8845C4A0E;
	Wed, 11 Dec 2024 20:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC91C4CED2;
	Wed, 11 Dec 2024 20:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733948651;
	bh=yOVE+KCLnL0G/rxLAXTZ9ej8maw36A8IfDnAQICINJI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Cx2r9xO8BA+5R3kqdtPbHgKc0SB+T8twQUdgeeilcmsRt3ODTEfboCsRxO+qRbWA0
	 ZBgzobKuPR0r7SGnjNNQhdt9mZ0Tb4eTkBAkDrSWtbjQQhUIV3EhINgYoUK3aqV3Wi
	 OOTZgU8ulJhEWbXIpQBDymEbR1Yu5TKJhTdp6kG4yZRc1XuIZGbOKpSDx/R7QDFK1R
	 IgjhIwV96L4AsNBCw6FzNgDp3xEwi8KEbXyiENt7HHQQ0Oj0UMd+fl/VjgBUnE22qN
	 3ER2inDG3/8ORfjHmnFu5HM2TkP8f/uMKBuZN3yTh7NxCxuY1ylnhHggM8g0XRJeFX
	 bX229EITTmyGw==
Date: Wed, 11 Dec 2024 14:24:09 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Thomas Richard <thomas.richard@bootlin.com>, vigneshr@ti.com,
	s-vadapalli@ti.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, theo.lebrun@bootlin.com,
	thomas.petazzoni@bootlin.com, kwilczynski@kernel.org,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	gregory.clement@bootlin.com, u-kumar1@ti.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] PCI: j721e: In j721e_pcie_suspend_noirq() check
 reset_gpio before to use it
Message-ID: <20241211202409.GA3305505@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211091421.4empou7mbm35ynxq@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_122412_104348_74388C28 
X-CRM114-Status: GOOD (  26.07  )
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

[+cc GPIO folks in case they think it's worthwhile to document that
it's safe to pass NULL pointers to gpiod_*() interfaces]

On Wed, Dec 11, 2024 at 02:44:21PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Dec 11, 2024 at 09:59:30AM +0100, Thomas Richard wrote:
> > On 12/10/24 16:42, Bjorn Helgaas wrote:
> > > On Mon, Dec 09, 2024 at 12:23:21PM +0100, Thomas Richard wrote:
> > >> The reset_gpio is optional, so in j721e_pcie_suspend_noirq()
> > >> check if it is not NULL before to use it.

> > >> +++ b/drivers/pci/controller/cadence/pci-j721e.c
> > >> @@ -644,7 +644,9 @@ static int j721e_pcie_suspend_noirq(struct device *dev)
> > >>         struct j721e_pcie *pcie = dev_get_drvdata(dev);
> > >> 
> > >>         if (pcie->mode == PCI_MODE_RC) {
> > >> -               gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> > >> +               if (pcie->reset_gpio)
> > >> +                       gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> > >> +
> > >>                 clk_disable_unprepare(pcie->refclk);
> > >>         }

> > > It looks like gpiod_set_value_cansleep(desc) *should* be a no-op if
> > > desc is NULL, based on this comment [1]:
> > > 
> > >  * This descriptor validation needs to be inserted verbatim into each
> > >  * function taking a descriptor, so we need to use a preprocessor
> > >  * macro to avoid endless duplication. If the desc is NULL it is an
> > >  * optional GPIO and calls should just bail out.
> > > 
> > > and the fact that the VALIDATE_DESC_VOID() macro looks like it would
> > > return early in that case.
> > > 
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/gpiolib.c?id=v6.12#n2316

> Yes. Almost all of the GPIO APIs accepting desc (except few) use
> VALIDATE_DESC() to check for NULL descriptor. So explicit check is
> not needed.

I think it would be nice if the kernel-doc for these functions
mentioned this somewhere.  It's kind of a pain for every user to have
to deduce this.

Bjorn


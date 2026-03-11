Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CD7112583B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 14:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxwsUH5NxYcd7eAP3KCFt8MlCNMC8DPCTU47ttb2/Io=; b=wGxgVu7IjDiPw0v0g83FlCt8rK
	R+CSSeq/N0/ZglCHkNNvBeso/MiLBgGd/m2Ag1UpeXsmC/Sx/MwS2MOhouoW91WK/kdJlbkkK9ABb
	gNO0pI/ugOATjFvmAvm6s0Af19mwBN/LumKyFAouqF/b1ogHNaPUFFh/WZwJS6Pd6GSTShmsMDMoQ
	1sn+4E/kaUp/KbJlQUI76wf+An+jz41tQjYX3l29kAsVJKl7tH8+XxgKlBtsFZQBoc5yEYP9IbFuX
	imFiE7pczgJ7GxkEqHFJkMEwlYPtnDEC7aX1rrgXKIvgW/8k+bahL+MYpbLkz5dhbFZ3mPKL4RAXS
	vsq3MFqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KPW-0000000Bh78-2zgt;
	Wed, 11 Mar 2026 14:19:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KPV-0000000Bh6z-1ILj;
	Wed, 11 Mar 2026 14:19:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37CA36012A;
	Wed, 11 Mar 2026 14:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B07C19424;
	Wed, 11 Mar 2026 14:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773238778;
	bh=4rspw70lAXPaOuNzAVTpF3DEdU6++Hs8qNZtz9nP5TU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N7wEdddLJiDMDeFh9fRzF+0AA/jXYO0kBBjbzURmzLnta3Acyr9OALzeu3zxpMSGz
	 ZrjGvpciOTY4AuauFhvmS3Wy3ddEbuZETYuOSCzwcRrzzlbKYSdame0ojFrSrdvEBJ
	 vVrnwnGdPwejHqQtOF00rp1scWaAMrnV3hg8RYSkNXHwB6li0T02sarbLcTMsTlC6Y
	 IjWWtjC1KHZZmC7w1VB9Lg2H0+V6dAXzPndwp63I3ERDG8PIVGK/5eQnXaVXcglpvC
	 /MayvYHwZ7hYB9D7x0mFv4UhX1G4EdDHcCODregjf3maJAIZNh4R4ysMR3ky/ZNwNb
	 4gJZ0556zKdUw==
Date: Wed, 11 Mar 2026 19:49:23 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <hof7aknmmkeug6et7cj3zrwpj3cu77bofqllm25numelratbg6@pfiep2xaqlbd>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <aHoh1XfhR8EB_5yY@ryzen>
 <aHokdhpJUhSZ5FSp@ryzen>
 <tujurux64if24z7w7h6wjxhrnh4owkgiv33u2fftp7zr5ucv2m@2ijo5ok5jhfk>
 <aJ743hJw-T9y3waX@ryzen>
 <lakgphb7ym3cybwmpdqyipzi4tlkwbfijzhd4r6hvhho3pc7iu@6ludgw6wqkjh>
 <aLmcO8ukT-CDZMuT@ryzen>
 <mevtdhght66tds7yhmr5a6xg5a75fb667b6lyvguoxqexmc74p@mroqidhzptxk>
 <abFLGRn9TYrsycRs@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abFLGRn9TYrsycRs@fedora>
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

On Wed, Mar 11, 2026 at 11:59:37AM +0100, Niklas Cassel wrote:
> On Tue, Mar 10, 2026 at 07:07:39PM +0530, Manivannan Sadhasivam wrote:
> > > 
> > > I tested your patch series + your suggested change above, and after a:
> > > 
> > > ## On EP side:
> > > # echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
> > >   sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start
> > > 
> > > Instead of:
> > > 
> > > # FAILED: 1 / 16 tests passed.
> > > 
> > > I now get:
> > > # FAILED: 7 / 16 tests passed.
> > > 
> > > Test cases 1-7 now passes (the test cases related to BARs),
> > > all other test cases still fail:
> 
> (snip)
> 
> > I guess what is going wrong here is that you might be rebooting the device
> > *after* restoring the config space in 'slot_reset()' callback. So all the
> > previous config space contents would be lost and the device would've started
> > afresh.
> 
> I'm confused.
> 
> # echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
>   sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start
> 
> Will not reboot the device.
> 
> 
> > 
> > I don't think we can restore the config space after rebooting the EP device,
> > because host has no idea about it. It can only restore the content after
> > recovering the device through platform specific means.
> 
> Am I missing something, or why are we talking about rebooting the device?
> 

Sorry, I just went with reboot scenario since I remember you referring to it in
the thread. But I must admit that I didn't read your repro steps where you just
write to the 'start' parameter.

But I did test with toggling the LTSSM alone on the EP and was able to execute
the test successfully on the host. So I'm not entirely sure what is going wrong
on yours.

I need to look into it more in detail, but I do not want to block the series
from getting merged due to this.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


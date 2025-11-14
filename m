Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7A0CEACD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 21:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=TGO8+N9PpF7BMxZuziqATlztibLC+TocFdsUk8iwYM0=; b=oFt9F5dPbQD6CZ
	1pykwOrs2B0mb58OZ/6u/V158PbL8HbTAxoYM9uc92QuwUJNpVafl/YKecqPB12B0iUCDL7Af2fsm
	KLVfJzHP7EYXPIXkQWF6L0Py3Kmm2uA0W33qg0KuLgsfW9uHGI65kcvIMGOtaOruAKgROQR0qw03N
	G6uADbzl5xX35Hd8TFDO1x+HsARCxzsV9QlpQdlIPagezInD1cjzJlZ8g+U0klzV6tZQPk4hHvIvK
	IHD9sGu6hvhyhtQMmfEp9Q97oDq1Zxk+KJRkAsphHJXrg9xPj0gizsAPlY/MAarwhFuxkEgJ0DNLQ
	NzvzVSdsmJKAMbCK+6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK1SN-0000000D8EV-2F3U;
	Fri, 14 Nov 2025 21:35:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK1SK-0000000D8E7-2bxH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 21:35:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B06F043D42;
	Fri, 14 Nov 2025 21:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 615DFC4CEF1;
	Fri, 14 Nov 2025 21:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763156141;
	bh=7+gBsjbSf8GGUjKAhjC9BjsZi2tNC9506bmmv93MuO0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=aa7dTlg+g4JoT9xX34DucEx0Z+AdddJdQXp3TRuzjqjFnyE4M4YPv4U6sDfQ8DaOS
	 mPBVLXkF4VNf1JKgb8ADAeETueV3PJuPCTVdDGIhEXCXM1PwjsP27s9Ci5IOrzqkYv
	 QNty5UnzGGK89TrFyWlCmjZpuq+Xin2YSIi/lXHdnA9eeuWV9SdXJNdeT5Gd9MbDSD
	 qQoW2iBN0NyKRzBoShc+ZNsj7izl4YfPU9R/fBWkVqcSeIjdO1QwhmDaN0RU5HfRmX
	 w0ATx4bBEOKtQgV6jE7HEhbXWn/qdxhmwbtQmFfMGvsib42qjUfT7N+Fiz5O4sW2ww
	 u7ueHayrsqO9g==
Date: Fri, 14 Nov 2025 15:35:40 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	chester62515@gmail.com, mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, bhelgaas@google.com,
	jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, cassel@kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 3/4 v3] PCI: s32g: Add initial PCIe support (RC)
Message-ID: <20251114213540.GA2335845@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b945e463-52ec-417c-8e6a-599c35a6727d@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_133544_726105_35E08A81 
X-CRM114-Status: GOOD (  23.36  )
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

On Fri, Nov 14, 2025 at 11:05:45AM +0100, Christian Bruel wrote:
> > > The implication is that *every* user of dw_pcie_suspend_noirq() would
> > > have to check for the link being up.  There are only three existing
> > > callers:
> > > 
> > >    imx_pcie_suspend_noirq()
> > >    ls_pcie_suspend_noirq()
> > >    stm32_pcie_suspend_noirq()
> > > 
> > > but none of them checks for the link being up.
> 
> stm32 supports L1.1, so we bail out before pme_turn_off() in
> dw_pcie_suspend_noirq()

I think you're referring to this code::

  dw_pcie_suspend_noirq()
  {
        /*
         * If L1SS is supported, then do not put the link into L2 as some
         * devices such as NVMe expect low resume latency.
         */
        if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
                return 0;

        if (pci->pp.ops->pme_turn_off) {
                pci->pp.ops->pme_turn_off(&pci->pp);
        } else {
                ret = dw_pcie_pme_turn_off(pci);
                if (ret)
                        return ret;
        }

I think this is bogus.  For starters, the code doesn't match the
comment.  The comment talks about "L1SS being supported", but the code
checks for L1 (not L1SS).  And it checks whether L1 is *enabled* (in
Link Control), not whether it's *supported* (in Link Capabilities).

And it's up to the user whether L1 is enabled.  Users can disable L1
by building the kernel with PCIEASPM_PERFORMANCE, booting with
"pcie_aspm.policy=performance", or using sysfs.

It doesn't make sense to me to decide anything about PME_Turn_Off
based on PCI_EXP_LNKCTL_ASPM_L1.

We've had this conversation before, e.g.,
https://lore.kernel.org/linux-pci/?q=b%3Adw_pcie_suspend_noirq+b%3ANVMe+f%3Ahelgaas,
and Richard actually posted a patch to remove this code [2], but I
hesitated because I didn't think we had a good explanation for why it
was there in the first place and it was now OK to remove it.

But I think I was wrong and we should just remove this code and debug
whatever breaks.

> > If no devices are attached to the bus, then there is no need to
> > broadcast PME_Turn_Off and wait for L2/L3. I've just sent out a
> > series that fixes it [1].  Hopefully, this will allow Vincent to
> > use dw_pcie_{suspend/resume}_noirq() APIs.
> >
> > - Mani
> > 
> > [1] https://lore.kernel.org/linux-pci/20251106061326.8241-1-manivannan.sadhasivam@oss.qualcomm.com/
> 
> dw_pcie_suspend_noirq() path tested OK on stm32mp2.
> 
> Regards
> 
> Christian

[2] https://lore.kernel.org/linux-pci/20250924194457.GA2131297@bhelgaas/


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BFFCCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 14:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LkRbxJhMjI8fwY/1OM4eO+Zht9LmRcqTK7fFfRKPpE=; b=yGMjZwk8MwWBeAr+xsgK7QZ1t+
	m/O89nxCMPgUKXpSLimS3iDg1Jpc5aPGeuv/YnN2LbPWmwFMDTC26M5cXKAi81/yh86QFEwEmumEs
	cVlkv5OEdbMehRVQzQEADokslK7YVX/xq/p8WIL/JLqiS6NUHDCBC/TL/NIhp7vZ5rRjRlLuTnBAS
	aKCDQ/QiuX0A1mz1yQTT5EqsSmqzLSfL1wGfMWsdWUlQbIdBhetwF7dtCJr4fZvfKq5mCXbB6vTYb
	NyZWFDGmBahCHR+1A815z4Zbn/9zrRUssZo1LCUn4DjZtf3dH/B6Zymh0lt9n7bESdbI/YfZBUX6a
	BrMb2A4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFCTk-00000007piX-2EZ6;
	Sat, 01 Nov 2025 14:21:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFCTh-00000007pi7-45pP;
	Sat, 01 Nov 2025 14:21:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 37C9143B4B;
	Sat,  1 Nov 2025 14:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB40C4CEF1;
	Sat,  1 Nov 2025 14:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762006870;
	bh=Gvf1mYIDAEuIXGTcNGdXvQgYVAM627aH5dsUdJvMLwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nG48ZwOsmf7ywyIGxFuAKUMJaoY0VGESkpv/4qfZ/KTJNA6A2yFpJYCOkpKtiQL3p
	 MwqeckBV20eo0FzheXg09WpWb8CJ/4Qkx2OAcUGcGGtx0NA1P+bi2JffRjGJmI9+bp
	 5CJcGRHKTC/tknYmstKlskizDI2wkbBuzf89hPe5acIc/W6IqYgngxX0YC0LU+qFtx
	 ZUVmaw1kczjP+C9CvW38D//14rynREuHAONkC0ZqFBmXtXikwPUH/q4ofymafDb/Tz
	 NCExRsF/0TC/fuwYqUkoC1aVQ3rIn4lxdpD0HeJHvYlr+uE1I3ogVeulX/p2qIuBCc
	 yU7Fs4Bv+fErw==
Date: Sat, 1 Nov 2025 19:50:58 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jingoo Han <jingoohan1@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH v4 9/9] PCI: dwc: support missing PCIe device on resume
Message-ID: <qlil44i7ywwxurdfovkbqvvjff7dey53uy5hzq4zbmvg7jg54o@zdg27w4q26gr>
References: <20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com>
 <20251029-rockchip-pcie-system-suspend-v4-9-ce2e1b0692d2@collabora.com>
 <dc230a62-bd31-450a-9acd-fa654f694b3a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc230a62-bd31-450a-9acd-fa654f694b3a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_072114_077050_626F563D 
X-CRM114-Status: GOOD (  26.38  )
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

On Thu, Oct 30, 2025 at 11:07:19AM +0530, Krishna Chaitanya Chundru wrote:
> 
> On 10/29/2025 11:26 PM, Sebastian Reichel wrote:
> > When dw_pcie_resume_noirq() is called for a PCIe root complex for a PCIe
> > slot with no device plugged on Rockchip RK3576, dw_pcie_wait_for_link()
> > will return -ETIMEDOUT. During probe time this does not happen, since
> > the platform sets 'use_linkup_irq'.
> > 
> > This adds the same logic from dw_pcie_host_init() to the PM resume
> > function to avoid the problem.
> > 
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >   drivers/pci/controller/dwc/pcie-designware-host.c | 13 ++++++++++---
> >   1 file changed, 10 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > index e92513c5bda5..f25f1c136900 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > @@ -1215,9 +1215,16 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
> >   	if (ret)
> >   		return ret;
> > -	ret = dw_pcie_wait_for_link(pci);
> > -	if (ret)
> > -		return ret;
> > +	/*
> > +	 * Note: Skip the link up delay only when a Link Up IRQ is present.
> > +	 * If there is no Link Up IRQ, we should not bypass the delay
> > +	 * because that would require users to manually rescan for devices.
> > +	 */
> 
> In the resume scenario, we should explicitly wait for the link to be up,
> there is no IRQ support at this resume phase

This could be fixed if the PM handlers are moved to non-no_irq ones.

> and secondly after controller resume pm framework will start resuming the
> bridges & endpoints. what happens
> if the link is not up by the time endpoint is resume is called. And entire
> save & restore states might also gets messed up.
> There will be no way to recover from this.
> 

This is true if there were any devices connected to the bus during suspend. If
there were no devices, then it is fine to skip waiting for the link to be up.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


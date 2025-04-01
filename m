Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3257C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 11:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uqfSFeeqNM9FLdSr3kIbabq1uZrBy9nvy9Lt/cD6No=; b=VG8WwNTdrj4fmdodAZR14Tkzrr
	NBI0YjYtekyOz3jHs4GYFeg0e1qDAwQdHYxaGW3E0hRrn+0eG+hcq0YKJqRcahrfGQMxNFcv8cwWV
	XDPU5KEU0BQgKgs25XbbN45uPlOjXS/eh5e9O82/joK7cnpIlON/usKvxLyD3cuVQD4lOOvpOisPK
	X78LA7bLpYF/8SfDYYJKjPzYhPc/NWTnFcSn0vsOxP310y+ZBfv4ws6w/s/1TDSHoXT+QpZMfZ64V
	zRxcLcz/1oHuIqOxpSO9fqSzhQiWT+QLV8OMp9zR47NhZ+flMrfLJNtaD6ijM6fbrbv1CwlEOd2E/
	bRr4d7lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZpR-00000002mXS-2X0Z;
	Tue, 01 Apr 2025 11:30:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZnf-00000002mMl-0JvH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 11:28:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C161861132;
	Tue,  1 Apr 2025 11:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C312DC4CEE4;
	Tue,  1 Apr 2025 11:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743506937;
	bh=DaYueR7dUNDwVsECkuaNXT3p5/kpPUyydXjCO2RALyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kOLLDg30OXhbK+MphiB+Vy7bXzP49h1ihSXmPB+if7qbiGShHOuINIHjb9tM4eYzU
	 DcyX3Kz63c0TfWGqlLbmunZBbr8cfomlCkx+8wS/HNOrbQmNs5CQcw/43hjjQQA/+n
	 HevMxNXzIU3r1qADvSUNDuc0QHoT2lBql2cK/PH2HG2386R+jQ6kk0SsGKCdD2mJ76
	 sRk8NYdSX3YjtQy1xdyEyUpfT/V/3wYjs1Zz+IaGLtRQauKhHPRqYAvbjZxacMBJXn
	 NtUQlDRjrDhMIfQ8nd3j88d9gp0/ysHZnFVt1bfjSsiCx+/ASu0+QdU8oe2vfKOCFx
	 yRksKLjmWRFaA==
Date: Tue, 1 Apr 2025 13:28:51 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, vigneshr@ti.com,
	kishon@kernel.org, wojciech.jasko-EXT@continental-corporation.com,
	thomas.richard@bootlin.com, bwawrzyn@cisco.com,
	linux-pci@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com, dlemoal@kernel.org
Subject: Re: [PATCH 3/4] PCI: cadence-ep: Introduce cdns_pcie_ep_disable
 helper for cleanup
Message-ID: <Z-vN8_-HJ0K1-1mH@ryzen>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <20250307103128.3287497-4-s-vadapalli@ti.com>
 <20250318080304.jsmrxqil6pn74nzh@thinkpad>
 <20250318081239.rvbk3rqud7wcj5pj@uda0492258>
 <20250319103217.aaoxpzk2baqna5vc@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319103217.aaoxpzk2baqna5vc@thinkpad>
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

On Wed, Mar 19, 2025 at 04:02:17PM +0530, Manivannan Sadhasivam wrote:
> > 
> > While I don't intend to justify dropping pci_epc_deinit_notify() in the
> > cleanup path, I wanted to check if this should be added to
> > dw_pcie_ep_deinit() as well. Or is it the case that dw_pcie_ep_deinit()
> > is different from cdns_pcie_ep_disable()? Please let me know.
> > 
> 
> Reason why it was not added to dw_pcie_ep_deinit() because, deinit_notify() is
> supposed to be called while performing the resource cleanup with active refclk.
> 
> Some plaforms (Tegra, Qcom) depend on refclk from host. So if deinit_notify() is
> called when there is no refclk, it will crash the endpoint SoC. But since
> cadence endpoint platforms seem to generate their own refclk, you can call
> deinit_notify() during deinit phase.
> 
> That said, I noticed some issues in the DWC cleanup path while checking the code
> now. Will submit fixes for them.

Could you please elaborate quickly what issues you found?


Kind regards,
Niklas


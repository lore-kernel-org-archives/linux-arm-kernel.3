Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80889C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 18:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAnJnPC8DSxZjkwzjQoaWYQD+3Iuifg0xu+mzTEEohE=; b=luRfIu3zI+77uGBkNC7EXtHNzC
	HPFItxOAQSk5I1JTf4M+rv76IdZacFR4zeD5D9h5KaZrrNAUnsnjmzZUr2fgewkVd2shRzQykTHsp
	Ws0Mr4aNdz9CNosGBF2Ccxh43zKQjSI+NhgozZZtqMsKex3bv66ookp6pTXfWsBOJ6avrUJ7XfrY2
	a41Q1FOE/iWwYuMQtqv9NR7LGeOLyYaAg15duJbBc0cxSNca92W+mO/7avxwGQ2pjz7qs8k1Xz7Mh
	B1Sv+XIJIMy4tXHPBtW9XWqqDttxM6jf/1uOtmXv77jVSEIjzdh+QTKWdFbVM0AiFrCtCHCdaGmVV
	Tc1rsElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCN71-0000000D7Jb-14to;
	Tue, 06 May 2025 18:33:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJMf-0000000CKuj-1TSB;
	Tue, 06 May 2025 14:33:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 75459629CE;
	Tue,  6 May 2025 14:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36DFC4CEE4;
	Tue,  6 May 2025 14:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746542024;
	bh=Ae+qgp3ezP7Fi0sm8hyAz2/8J0K1eY7HWQaSgwOxXYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kAb/q3omJ8TdawZx7/zBfo/iFU8nrgajSiRkRAKoLGyhNoFexuVua01KYeTsUVwRs
	 LbmSujNuq8FtyoXVCTb0o1eOjzEc3MKmiH3vpqBlOAHh/mn0EKFCiUWFbno528dK+u
	 VRTEsZw79XSDR5S9YUyyatjxNZ3iC3YP9i7rGspz6DgW8QHXhK+wOdsVOkW0sqxE/O
	 RgLy/dwohXLWNt0fuB1QFUCgSuHr17xsMlK04MPfM6OxuMnPTtSOyqU32nsrf3mndo
	 6O+eQXI7AD3sIWLJrxlmsUbzwndhxhDKeEYfAGQy8EoPD73drEWJf27aPVY6pdLxpg
	 cs/TKa8PSCgLQ==
Date: Tue, 6 May 2025 16:33:38 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/4] PCI: dwc: Link Up IRQ fixes
Message-ID: <aBodwvmG6ENM7haH@ryzen>
References: <20250506073934.433176-6-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506073934.433176-6-cassel@kernel.org>
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

On Tue, May 06, 2025 at 09:39:35AM +0200, Niklas Cassel wrote:
> Hello there,
> 
> Commit 8d3bf19f1b58 ("PCI: dwc: Don't wait for link up if driver can detect
> Link Up event") added support for DWC to not wait for link up before
> enumerating the bus. However, we cannot simply enumerate the bus after
> receiving a Link Up IRQ, we still need to wait PCIE_T_RRS_READY_MS time
> to allow a device to become ready after deasserting PERST. To avoid
> bringing back an conditional delay during probe, perform the wait in the
> threaded IRQ handler instead.
> 
> Please review.
> 
> 
> Kind regards,
> Niklas

Hello Laszlo,

Since you have a RK3588 based board, sending a Tested-by
tag on testing patches 1-2 makes sense.

However, patches 3-4 are for Qualcomm based boards.
I'm not sure if you also have a Qualcomm board at your disposal.

If you don't, Manivannan can probably drop your Tested-by tags
on patches 3-4, but it might be good to know until next time.

Thank you for testing!


Kind regards,
Niklas


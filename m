Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEAC10611F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 11:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqeXgG0YlkIhVkSKx1066/go5LgrSNrZPxNBAAiS4aI=; b=NfYM6qnXDKPGmvfHTLzHa4Sg2c
	DqgML0DrWMrv2KzEA36zc2Nhv9qPISJDLK8GF3GFyhAsZ40fHqrHnMd97aTD7EThvrQtqoWKIdmPp
	xLOoxAmFTdJ3wlVln7ObmxeIFLFgm3gvFLCPXgQeFIa6oXh9PxjQPNGGelchJb9sX753WBny4XhmO
	46uLP/avVVAMBWo8IBKPchZI5CXk2QMubMirziwGI2f1CD6B1IRsgjTugOJyrAIF2ZOz6lJTWPx9H
	fqMQ0HdTMm9KhW9Jd0XvQtocOiq6ujBzDd9hXGulLpgDV3trLmXDB0g4hwd6MNM1QmS1i9G0Hw1rv
	M0JpVTIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0HNW-0000000BT01-30y8;
	Wed, 11 Mar 2026 11:05:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0HNV-0000000BSzs-3n8k;
	Wed, 11 Mar 2026 11:05:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E84CA6013E;
	Wed, 11 Mar 2026 11:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6B7C4CEF7;
	Wed, 11 Mar 2026 11:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773227124;
	bh=BgLuLCpNt8YikxfkQc3yHUtyj3A7U731tcqZVJqZcPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eq24ij66oMbyTp1yMVUcNGzHc65udFXi7P4njEUQUTlsmxGbZAXKzJnJ9FlGX4OH5
	 8EJdF+H5q/pNCEc9m2zibOEiho3mYxp4rAL9uS9PPqOtvTL8xHBpnRMGEbfimxABGW
	 iwMIRCPAVGeGn0VdA1SK0UaD2BwdtnTi6a4F0LutKSrnZ0AUkgwHiWqYHeq2Yo+hQB
	 BX77RFSPRFEXfbCIFMcHngXlOR7zC1ZXJuzsO2W8TO5YKYMAyOP3XiWDOWdC2AEfyb
	 Py7eKU8OcsajO4JUfyO2uBjjwKK/FMz5jqIaK34DcCF4ou2NdzrBnCexEbFUbfSP1d
	 bXzS+9ypNh3XA==
Date: Wed, 11 Mar 2026 12:05:15 +0100
From: Niklas Cassel <cassel@kernel.org>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Lukas Wunner <lukas@wunner.de>, Richard Zhu <hongxing.zhu@nxp.com>,
	Brian Norris <briannorris@chromium.org>,
	Wilson Ding <dingwei@marvell.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <abFMa6DCGGLUHddA@fedora>
References: <20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com>
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

On Tue, Mar 10, 2026 at 07:31:58PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> Changes in v7:
> - Dropped Rockchip Root port reset patch due to reported issues. But the series
>   works on other platforms as tested by others.

Are you referring to

## On EP side:
# echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
  sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start

Then running pcitest only having 7 / 16 tests passed ?

If so, isn't that a problem also for qcom?


There is no chance that the patch:
"misc: pci_endpoint_test: Add AER error handlers"
improves things in this regard?

Or will it simply avoid the "AER: device recovery failed" print?


Kind regards,
Niklas


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA44ECA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 16:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrdGR8+5+7JD9zLubC3R5Nrwx3f6rQnHI7MHAeeFjZE=; b=Jmz0peHkdiKmz4dzXD6WwvqCvO
	4K0YcUNoyNsWrB1PzSbjdSTCR0b0n9bjL+Zs6pgcxRe3BH0QKQ+civSoVToLcZsqYAQiJofOVf+Pz
	K+9yxKW2NjocrNMWpwWl2foXE50Hk/MVCFTToHZtiVpqgmyGK7vlDgIbJVJaAosJfC4HPVomA8wdx
	I1dMY50NigucEDekBAM7oEXT6ox0Gav8qiISZpl7FU700I75w7FyTrOQg/b35wQRVijARxc1L+PAD
	zmmc0IckfvjPi9dc1xddAd0J5CsPnJuna/gDQxbOz/NXUXs7NUEQJph58bbH26/15qZdrIq55Ckmk
	mu6nJscA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xErCR-00000004iTh-06sO;
	Thu, 08 Oct 2026 16:42:31 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xErCO-00000004iT0-3ZAb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 16:42:30 +0000
Received: from eahariha-devbox.5bhznamrcrmeznzvghz2s0u2eh.xx.internal.cloudapp.net (unknown [20.114.54.184])
	by linux.microsoft.com (Postfix) with ESMTPSA id 25BB820B7166;
	Thu,  8 Oct 2026 09:41:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 25BB820B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1791477690;
	bh=RrdGR8+5+7JD9zLubC3R5Nrwx3f6rQnHI7MHAeeFjZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iEZgnBHlg1T1yn8CZKhtuBx45f1+HQol4iZG3iM7TQiQXiFIlmf21T9mvH4xgbgRy
	 qUB/J1fkHFphCRL55R8CWqDa4i5ZPlrg3EWE4PLqdRgqrJtOfmoZ39QDPhyiFLR0uK
	 JIx2GA3l12I4vaoXbAFUVMUa5oGTMjpbEw8yJcIw=
From: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
To: jeffbarnes@linux.microsoft.com
Cc: Frank.li@oss.nxp.com,
	Zhiqiang.Hou@nxp.com,
	bhelgaas@google.com,
	imx@lists.linux.dev,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	robh@kernel.org,
	roy.zang@nxp.com,
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
Subject: [PATCH v2] Revert "PCI: layerscape: Change default error response behavior"
Date: Thu,  8 Oct 2026 16:42:02 +0000
Message-ID: <20261008164202.64477-1-easwar.hariharan@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001153323.1965074-1-jeffbarnes@linux.microsoft.com>
References: <20261001153323.1965074-1-jeffbarnes@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_094228_925389_CF4B5A78 
X-CRM114-Status: GOOD (  16.22  )
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

> This reverts commit 84d897d69938
> ("PCI: layerscape: Change default error response behavior").
> 
> The Layerscape PCIe driver programs the DesignWare
> AMBA_ERROR_RESPONSE_DEFAULT register at offset 0x8d0 with 0x9401.
> 
> For AXI, the documented default with AMBA_ERROR_RESPONSE_GLOBAL cleared
> returns OKAY with all-ones data for errors on non-posted requests.
> Setting AMBA_ERROR_RESPONSE_GLOBAL causes an AXI error response instead,
> with AMBA_ERROR_RESPONSE_MAP selecting SLVERR or DECERR for individual
> PCIe completion errors.
> 
> The value 0x9401 sets AMBA_ERROR_RESPONSE_GLOBAL and maps Unsupported
> Request, Completer Abort, and Completion Timeout to SLVERR.
> 
> A PCI configuration access can race with the link going down after
> dw_pcie_other_conf_map_bus() checks the link but before
> pci_generic_config_read() performs the MMIO access. If the transaction
> results in a Completion Timeout, the Layerscape error response setting
> propagates it to AXI as SLVERR, resulting in an asynchronous SError and
> kernel panic.
> 

Could you bring back the kernel panic backtrace from v1?

With that,

Reviewed-by: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>

> Reproduce the race by obtaining the configuration-space mapping while
> the link is up, then disabling the link from another CPU immediately
> before performing the MMIO configuration read.
> 
> With the error response override enabled, the overlapping configuration
> read results in an asynchronous SError and kernel panic. With the
> DesignWare default behavior restored, the same test returns 0xffffffff.
> AER reports a non-fatal Completion Timeout, and no SError or kernel
> panic occurs.
> 
> Restore the documented DesignWare default error response behavior so a
> failed non-posted PCIe transaction does not become a fatal AXI error.
> 
> Fixes: 84d897d69938 ("PCI: layerscape: Change default error response behavior")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jeff Barnes <jeffbarnes@linux.microsoft.com>
> 
> Changes in v2:
> - Change the subject to identify this as a revert, as requested by
>   Frank Li.
> - Document the DesignWare AMBA_ERROR_RESPONSE_DEFAULT behavior and
>   decode the 0x9401 setting used by Layerscape.
> - Clarify that the setting propagates Completion Timeout as AXI SLVERR
>   rather than causing the underlying PCIe transaction failure.
>
> ---
> drivers/pci/controller/dwc/pci-layerscape.c | 12 ------------
> 1 file changed, 12 deletions(-)


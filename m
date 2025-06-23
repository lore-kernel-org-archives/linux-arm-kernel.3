Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EACC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 13:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1S9ufKPeWjduqquHeh/Qk3/1qUx2ZKvjuVjP1pIJLpE=; b=o/pyl6xnRDQSmc85SJht3mj5NB
	Z9O6R4YtKZYM51gf34PIhBECMko4zO0wZviNTP1zE5KTf1yxC0S+rkG01/F5FfsrZWqGnWeOVgOcB
	evD282Q+gzZ6vhPj9M4pxfDhvf48lhh9gq0fhYfKI+PdwZhVkuy6lgBP3YiT4nesm7ylO5wqVJv6v
	4IS4ryE3Tz4HXPTizS7neGF/P8ydKQ+AVUiNE9ikRSUnpHLBCpIdNfCcPMTUxmJWKVSQMibx1WBxf
	y9Fi/YFIFkj5lkTzGZ7Qq6BCKzXHb9A7UjtRAWGyi3itTBOKsMzehkm0yFsM8MY1tXSVZYiZUxX3Q
	YpI4+7ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgrN-00000002oZv-3u1o;
	Mon, 23 Jun 2025 13:05:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTesN-00000002Sp8-0T5c;
	Mon, 23 Jun 2025 10:58:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69D646112D;
	Mon, 23 Jun 2025 10:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6401AC4CEF2;
	Mon, 23 Jun 2025 10:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750676290;
	bh=KQEP5ij24VEA8YmbYKGHIizffbrpTimsVDgCFJ93uCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOWRX/WM6ATuFay5qVBF3U6yDvYFbsL3dgLTVha1A3bEeH7hijXd05KUo/J5ZjMyc
	 rwjOiaWuHyBKQnQ5OFzoCFYklqOMIg0XNCmfSVOSdDZe+JVnHTME+pdagvTLqQipBm
	 weVAhIE3pZ52YocrXvvyhMyBG/7Z6osMkG01ct9z9wZHyApZd2gDCSn5XT+ahyD3Cn
	 LGOL9JWJfS4auNvI7mXtG6ra8xdVhbS9Mvgn2ZtLovJUoBBisQiRkVfC6lM0sEVkZW
	 UyFybkR+AX5MPihNsp9J7iIsqb2qWAIp5iih0UcoB0h1h/gP/GzL+U4rCTxrMwmMJA
	 r0qkmqWOv9qdw==
Date: Mon, 23 Jun 2025 04:58:08 -0600
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com, 
	heiko@sntech.de, yue.wang@amlogic.com, pali@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v5 1/2] PCI: Configure root port MPS during host probing
Message-ID: <qxbedjehrhddc627lukpxvxje6dze6nxfjztlbexp5hap327ac@ojo564izhttk>
References: <20250620155507.1022099-1-18255117159@163.com>
 <20250620155507.1022099-2-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620155507.1022099-2-18255117159@163.com>
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

On Fri, Jun 20, 2025 at 11:55:06PM +0800, Hans Zhang wrote:
> Current PCIe initialization logic may leave root ports operating with
> non-optimal Maximum Payload Size (MPS) settings. While downstream device
> configuration is handled during bus enumeration, root port MPS values
> inherited from firmware or hardware defaults might not utilize the full
> capabilities supported by the controller hardware. This can result in
> suboptimal data transfer efficiency across the PCIe hierarchy.
> 
> During host controller probing phase, when PCIe bus tuning is enabled,
> the implementation now configures root port MPS settings to their
> hardware-supported maximum values. Specifically, when configuring the MPS
> for a PCIe device, if the device is a root port and the bus tuning is not
> disabled (PCIE_BUS_TUNE_OFF), the MPS is set to 128 << dev->pcie_mpss to
> match the Root Port's maximum supported payload size. The Max Read Request
> Size (MRRS) is subsequently adjusted through existing companion logic to
> maintain compatibility with PCIe specifications.
> 
> Note that this initial setting of the root port MPS to the maximum might
> be reduced later during the enumeration of downstream devices if any of
> those devices do not support the maximum MPS of the root port.
> 
> Explicit initialization at host probing stage ensures consistent PCIe
> topology configuration before downstream devices perform their own MPS
> negotiations. This proactive approach addresses platform-specific
> requirements where controller drivers depend on properly initialized
> root port settings, while maintaining backward compatibility through
> PCIE_BUS_TUNE_OFF conditional checks. Hardware capabilities are fully
> utilized without altering existing device negotiation behaviors.
> 
> Suggested-by: Niklas Cassel <cassel@kernel.org>
> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Hans Zhang <18255117159@163.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/pci/probe.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 4b8693ec9e4c..9f8803da914c 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2178,6 +2178,16 @@ static void pci_configure_mps(struct pci_dev *dev)
>  		return;
>  	}
>  
> +	/*
> +	 * Unless MPS strategy is PCIE_BUS_TUNE_OFF (don't touch MPS at all),
> +	 * start off by setting root ports' MPS to MPSS. Depending on the MPS
> +	 * strategy, and the MPSS of the devices below the root port, the MPS
> +	 * of the root port might get overridden later.
> +	 */
> +	if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT &&
> +	    pcie_bus_config != PCIE_BUS_TUNE_OFF)
> +		pcie_set_mps(dev, 128 << dev->pcie_mpss);
> +
>  	if (!bridge || !pci_is_pcie(bridge))
>  		return;
>  
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்


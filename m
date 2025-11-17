Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4AECEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 17:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=gooMhowPOuyHbixsfPYvirfY5GzfuVPNuYdGKL2Yh4o=; b=Yd/4702i8lY7+h
	uBdauqJnK8svghbMuOherQ2RYSou9+wnmo+ZoCgurjK5waSkN/WCoab1OyhGwgAZXvfTizVR/fm+q
	BWg/z/uJGetF61inYJWBuj5EtNyePFTBhgt1/4oMSpUE1xU7fBszby9qqkTG64YbYde0k+wtRN9ZE
	bimkuYv5GR9PiMaj04UWoSAFEKhjWj88rao3qzmLWRqNBxRzZLX0WwXfgxx8DhPvaJh7CdqaC/iw1
	QBDN9ueN5NLMrJgcVZU32wmFCGQU7UQ5qDbpF8HQGZCUzQqupp24RiNHLZUxbvszGZz8x2YQ+Rgrr
	381CQ+PLIlj2KiRKiuVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL32G-0000000GXYH-3E2v;
	Mon, 17 Nov 2025 17:29:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL32F-0000000GXXq-2wPD;
	Mon, 17 Nov 2025 17:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AFB7160051;
	Mon, 17 Nov 2025 17:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF57FC4AF0D;
	Mon, 17 Nov 2025 17:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763400542;
	bh=JlsE1lph8w0DMhM6j2h7RraWGmZuAIqFU+0dI5wpwmM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=NGeQ9BjjDPbIlXZTF48buPSkHU3BW+jHvClesoPVMotHRkTEX5YtTu2a4msnQHZBn
	 U7+pR30mHcb3+UrpiDas9215oPGJDwBDcwbWPL9rayhMjRgkLfRovzamI0WxDZAmWR
	 ERy4qFZxO16ofbIotyielscmaIVagOGGr4gXZK9qOnwFjcl7pRvEoghMoB5ZRxqzEo
	 KaMY5tymug/UgzZtrTnzZfJuxHOUJaI+h75Vv5r7TOD6KKsgJKWNXgGbVWhS92/2sz
	 hEyDaM3YBYj6yZytFqOpmNVPPvtFzBthWMlEjsQCppWZ9fafXclCiQTZfztFwdfa9s
	 bv8t2f5tJFjGA==
Date: Mon, 17 Nov 2025 11:28:59 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 6/8] PCI: Add FMT, TYPE and CPL status definition for
 TLP header
Message-ID: <20251117172859.GA2466937@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-upstream_pcie_rc-v5-6-b4a198576acf@aspeedtech.com>
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

On Mon, Nov 17, 2025 at 08:37:53PM +0800, Jacky Chou wrote:
> According to PCIe specification, add FMT, TYPE and CPL status
> definition for TLP header.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

OK by me, but it'd be nice to move up a few lines so this is with the
other TLP-related items and the unrelated PCI_BUS_BRIDGE_*_WINDOW
values aren't in the middle.

Might even consider moving these to be just above the Message Routing
constants so things are generally in the order they appear in the
spec.

> ---
>  drivers/pci/pci.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 36f8c0985430..3a075f77cf4a 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -88,6 +88,21 @@ struct pcie_tlp_log;
>  #define PCI_BUS_BRIDGE_MEM_WINDOW	1
>  #define PCI_BUS_BRIDGE_PREF_MEM_WINDOW	2
>  
> +/* Format of TLP; PCIe r7.0, sec 2.2.1 */
> +#define PCIE_TLP_FMT_3DW_NO_DATA	0x00 /* 3DW header, no data */
> +#define PCIE_TLP_FMT_4DW_NO_DATA	0x01 /* 4DW header, no data */
> +#define PCIE_TLP_FMT_3DW_DATA		0x02 /* 3DW header, with data */
> +#define PCIE_TLP_FMT_4DW_DATA		0x03 /* 4DW header, with data */
> +
> +/* Type of TLP; PCIe r7.0, sec 2.2.1 */
> +#define PCIE_TLP_TYPE_CFG0_RD		0x04 /* Config Type 0 Read Request */
> +#define PCIE_TLP_TYPE_CFG0_WR		0x04 /* Config Type 0 Write Request */
> +#define PCIE_TLP_TYPE_CFG1_RD		0x05 /* Config Type 1 Read Request */
> +#define PCIE_TLP_TYPE_CFG1_WR		0x05 /* Config Type 1 Write Request */
> +
> +/* Cpl. status of Complete; PCIe r7.0, sec 2.2.9.1 */
> +#define PCIE_CPL_STS_SUCCESS		0x00 /* Successful Completion */
> +
>  extern const unsigned char pcie_link_speed[];
>  extern bool pci_early_dump;
>  
> 
> -- 
> 2.34.1
> 


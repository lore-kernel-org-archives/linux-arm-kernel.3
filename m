Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AD7606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OIybR1j3;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NhFfP2Am
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6T5qHszoT5KAnaMFtpj3HuHEDlbDw72PARLkg2WqNwI=; b=OIybR1j3LHihiq3Pj0wR7N0Brh
	IkxENnfl5ALm7bACNHv8DoeLL2WpQ1ghP8qogRGrBjhPSkJDKmyETft91BlJgTtBbXyu/hwMLhjv2
	R27PBnkLR+qgGOeIb6+tc9b8jRgFfjpz8jMfOqcSWOC3idT/pKa03ul9JgvDsPszq+fYRy1NSOY/3
	EiRNh1RuzetT0/jl7xLgZ5h+mKkkBYijDa7dvd0dZIhwl9F1yPnE5nY+0wKNcDuVHWtQ6Jw4Jrv51
	qcMbYE0D2+OAo/0ZL+aprWikiY7xbqDe9oNFQqwUQOD9FSE0Xf/bfEU78HHd/C3srMlo9dTDPRF4k
	JsuY+VMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgxq-00000004kh4-2VMF;
	Tue, 27 Oct 2026 13:11:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgxp-00000004kgs-0M3g;
	Tue, 27 Oct 2026 13:11:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D1FC743382;
	Tue, 27 Oct 2026 13:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4FB1F01825;
	Tue, 27 Oct 2026 13:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793106700;
	bh=6T5qHszoT5KAnaMFtpj3HuHEDlbDw72PARLkg2WqNwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NhFfP2AmkN8X7XELirt7qT1omsb7npj/zadplmlZ/ndbM/9QYLp2ZJCOJx+dWlUMH
	 WLIl9HcnEfz9gd3aqK4ZL7dj/jUrwFJl61kMEnfVFuO2eXjlv12kfExtfW8c22DCO1
	 XS6kqIuoyvE7I5lyuEi75AOr6i07VYF2vgUNRu3r4vV1u1gvqwDF2ZJeXWx3BzDdbk
	 wVX9EWBmnqqrIj3caxXblXv1sxbO8+kSSUkWMzV17NaqkEQBkQ8d4uTWltzWPvgaIL
	 D6FLOCVRYM4oXdPXNHM3BFSD/u5X3pnF+GwgfpzP9KZI3CWVnt3gWDgtHSzYZ0nv/y
	 brBln+2rf30pA==
Date: Tue, 27 Oct 2026 14:11:32 +0100
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?B?V2lsY3p5w4XigJ5za2k=?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] PCI: mediatek: Fix integer truncation and handle
 oversized resources
Message-ID: <kfnxuro5xf4mhokabg773zcyp7otcjxwpzcn3dlo6y3kpv4uv4@bne4qf3vcif5>
References: <20260930120539.4967-1-sreekuttan2156239@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260930120539.4967-1-sreekuttan2156239@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Sep 30, 2026 at 12:05:39PM +0000, Sreeraj S Kurup wrote:
> resource_size() returns a resource_size_t, which is 64-bit on 64-bit
> architectures or 32-bit systems with LPAE/PAE enabled. Passing this
> directly to fls(), which accepts an unsigned int, implicitly
> truncates the upper 32 bits.
> 
> Furthermore, AHB2PCIE_SIZE() uses a 5-bit mask GENMASK(4, 0). If a
> resource size exceeds 2 GiB (order > 31), the log2 size order
> overflows the 5-bit mask. Clamping the value silently truncates the
> hardware window while leaving the OS resource intact, causing bus
> errors when accessing BARs in the unmapped upper region.
> 
> Fix this by using fls64(size - 1) to accurately calculate log2 size
> orders without off-by-one errors and returning -EINVAL if the resource
> size exceeds the maximum supported 31-bit window order.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 29 ++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index a60d1ae076f8..639884b22ad7 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <linux/bitfield.h>
> +#include <linux/bitops.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/errno.h>
> @@ -686,6 +687,8 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>  	const struct mtk_pcie_soc *soc = port->pcie->soc;
>  	u32 val;
>  	int err;
> +	resource_size_t size;
> +	int size_order;
>  
>  	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
>  	if (entry)
> @@ -753,8 +756,18 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>  		mtk_pcie_enable_msi(port);
>  
>  	/* Set AHB to PCIe translation windows */
> +	size = resource_size(mem);
> +	if (!size)
> +		return -EINVAL;

PCI core already rejects the zero sized MEM regions. So this check is a dead
code.

> +
> +	size_order = fls64(size - 1);

This is wrong. AHB2PCIE_SIZE() register needs the full size value to enable the
whole window. Check:

c61df57343bf ("PCI: mediatek: Fix memory mapped IO range size computation")

> +	if (size_order > 31) {
> +		dev_err(pcie->dev, "Memory resource size too large: %pa\n", &size);
> +		return -EINVAL;
> +	}
> +
>  	val = lower_32_bits(mem->start) |
> -	      AHB2PCIE_SIZE(fls(resource_size(mem)));
> +	      AHB2PCIE_SIZE(size_order);

Why can't you just do, fls64(resource_size(mem))?

- Mani

-- 
மணிவண்ணன் சதாசிவம்


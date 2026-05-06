Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA81CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ip87XqR80jt83yUmNJq2gBZhTL+2Zm0472LsBd8FCnw=; b=LLXVuDWXhGtaIeHbr6hdRfS443
	IDkxFxekd5QtHD1NlhRy7/+kuPt63UpYm/Guuf/3sIRzFBYI62IIri3eYkpRY+4c7QnTmVIwa+thp
	OisVHzAyE7E0pG3E/veB6+NadLEdRVjvM7Jr2lw2RlQ7BWaBVTWPmV0Zr5JrE53W4D2talK1aSGao
	PYTyvro3N2V8a8uRSZkHILYrgva5CYlA0ksd/4AnmVo4VBR1XX+OGfWL5nA1WL+GtLlWLujWaiYlS
	4kDTpV8LxsBReGKG3Oj08oc8+dLGCi1eVIo4dFMakAyt3zrGCiehfrp7jHffQz8ziFUpb3dl6F5v+
	ZZU6rAIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKebJ-00000001QA0-3B8x;
	Wed, 06 May 2026 15:55:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKebI-00000001Q9W-3X0r;
	Wed, 06 May 2026 15:55:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1970343D63;
	Wed,  6 May 2026 15:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2252C2BCB0;
	Wed,  6 May 2026 15:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778082952;
	bh=Ph5NSUFFQWfRFBXRYCMYPAzIJbj1RVi6AHZ+xntAAFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tfEeQw/dEE9ZvynULyLEVP7NROJ17+o5Zid3jA3XxADKGiWLaVX6pA0Mc4EGbzUoy
	 grMbANHbWa/oRAll7VELcgEWxYM1xYjMAZCGhPn23K9ro5Ac9esX1ZmctTY3cGhVfg
	 O9D5dMOSkMfTQ+UkDhil5Dl6ugh5eqyCsDiS1Ex3j/XvLoqICT5jjfoh8lTugrDQqa
	 C+/ozpmkDU0zWqx1jD3zzF6TShiKT4Ug0LkW8VSyMnm2vv+99PvgFcm8CCk/ah5qqx
	 IN07dtX8NXTP1CmuNGlVnw8tIcjd8iEMKjFLibvSqWMWxVIQkkbSS40xb64aosafnp
	 8EyEtHW5sEN5g==
Date: Wed, 6 May 2026 21:25:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com, 
	pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com, 
	claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] PCI: Add pcie_wait_after_link_train() helper
Message-ID: <qryvbq7tn7gpkx63ljauddp3qxczgbzlpfkxiula7vq6f23yaz@oi2pal2ynzgv>
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-2-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506152346.166056-2-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_085552_898733_FA8A0731 
X-CRM114-Status: GOOD (  16.81  )
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

On Wed, May 06, 2026 at 11:23:39PM +0800, Hans Zhang wrote:
> PCIe r6.0, sec 6.6.1 (Conventional Reset) requires that for a Downstream
> Port supporting Link speeds greater than 5.0 GT/s, software must wait a
> minimum of 100 ms after Link training completes before sending any
> Configuration Request.
> 
> Introduce a static inline helper pcie_wait_after_link_train() that checks
> the given max_link_speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, etc.) and calls
> msleep(100) only when the speed is greater than 5.0 GT/s. The helper uses
> the existing PCIE_RESET_CONFIG_WAIT_MS macro defined in pci.h.
> 
> This allows multiple host controller drivers to share the same mandatory
> delay without duplicating the logic.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/pci.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 4a14f88e543a..a8705a2a2d85 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h

Since this helper is for host controller drivers, this needs to be defined in
pci-host-common.h.

> @@ -60,6 +60,19 @@ struct pcie_tlp_log;
>   */
>  #define PCIE_RESET_CONFIG_WAIT_MS	100
>  
> +/**
> + * pcie_wait_after_link_train - Wait 100 ms if link speed > 5 GT/s
> + * @max_link_speed: the maximum link speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, ...)
> + *
> + * Must be called after Link training completes and before the first
> + * Configuration Request is sent.
> + */
> +static inline void pcie_wait_after_link_train(int max_link_speed)

pci_host_common_link_train_delay()?

- Mani

-- 
மணிவண்ணன் சதாசிவம்


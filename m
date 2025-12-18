Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14896D68BED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0GgiwC3jIGfcZ/XY38ihfJZyfkkejY5NgsnXdIWI6k=; b=ddl2cUg373AmYopeegv+P+d3tO
	Uu3LXzDnY/m+lj52p1Fe7T0a/FOZcRkCtjoDGAw3bdHUdIZgcGD6UbYMRNS0p+TQQVFB54hZwjY+j
	uIP6nSusF8jiVvJf2is66T0yJz55kq4UjsXzClCxXgaQb6hKwrOZV90stuBOztyEN6xS75DlBYtdn
	pbAKhwoLL8ySY2bQ8HYwfNROFBWo3p59RWOgpqsStLPtwLQ4OB5fUWHxDIiDGvQgoCHWFxfbCJ6Ef
	o4kl159e9hj0hucOdUm7dUFAc2jOjZ5J+t/0P47whJq2z6AD0p+5pd4FlmZy1t+m9QOJhzcH4Ngqf
	+ju5OW7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW91J-000000080SE-2b2M;
	Thu, 18 Dec 2025 08:05:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW91H-000000080RK-2ep2;
	Thu, 18 Dec 2025 08:05:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CF8140442;
	Thu, 18 Dec 2025 08:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E393C4CEFB;
	Thu, 18 Dec 2025 08:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766045152;
	bh=vELv4ehStK9743Z/oJRveuR6s774Sgk9sYDjlKQxYHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dhcrn/0v8iolfLj1jxR1g5oRubuNyBWt96mwHJuW+kMJiY/qBzLvc86ldzkuiXcmm
	 x7jz5j8FIP3qVNfyczt+6/44EuK/H8UF3AIcHQFc/cm/5C5oyqN3yOtZTe6I3KxGpQ
	 yhdejaMoESOBd3WpOZIcd0qFj+pF9d7aAvclak0iQWTeG8i03Fbvfn1fs0TvPxWwaH
	 maePQ1k2KE2UTYaNbtbzfE5BRVynKnAbGLm44r15PkBh9a8gzr/wmqS9dc0L2ATLjc
	 JT4jkX2Eee1DRPEFhPiQqv6yYq/QU08kAAtfYMXVAD/4NmVdILXSU5kR5YrttQkEg7
	 N3p54RER5gAgg==
Date: Thu, 18 Dec 2025 13:35:37 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Johan Jonker <jbx6244@gmail.com>, 
	Dragan Simic <dsimic@manjaro.org>, linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] PCI: rockchip: limit RK3399 to 2.5 GT/s to
 prevent damage
Message-ID: <qncj72c3owrw7rvnj6jit2sbn4ojyr3kztcjailfxtdboan6sy@ddh5g7v4fcvt>
References: <cover.1763415705.git.geraldogabriel@gmail.com>
 <eaa9c75ca02a53f8bcc293b8bc73d013e26ec253.1763415706.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eaa9c75ca02a53f8bcc293b8bc73d013e26ec253.1763415706.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_000555_718670_F655322F 
X-CRM114-Status: GOOD (  19.63  )
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

On Mon, Nov 17, 2025 at 06:47:05PM -0300, Geraldo Nascimento wrote:
> Shawn Lin from Rockchip has reiterated that there may be danger in using
> their PCIe with 5.0 GT/s speeds. Warn the user if they make a DT change
> from the default and drive at 2.5 GT/s only, even if the DT
> max-link-speed property is invalid or inexistent.
> 
> This change is corroborated by RK3399 official datasheet [1], which
> says maximum link speed for this platform is 2.5 GT/s.
> 
> [1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf
> 
> Fixes: 956cd99b35a8 ("PCI: rockchip: Separate common code from RC driver")
> Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
> Cc: stable@vger.kernel.org
> Reported-by: Dragan Simic <dsimic@manjaro.org>
> Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>  drivers/pci/controller/pcie-rockchip.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
> index 0f88da378805..992ccf4b139e 100644
> --- a/drivers/pci/controller/pcie-rockchip.c
> +++ b/drivers/pci/controller/pcie-rockchip.c
> @@ -66,8 +66,14 @@ int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
>  	}
>  
>  	rockchip->link_gen = of_pci_get_max_link_speed(node);
> -	if (rockchip->link_gen < 0 || rockchip->link_gen > 2)
> -		rockchip->link_gen = 2;
> +	if (rockchip->link_gen < 0 || rockchip->link_gen > 2) {
> +		rockchip->link_gen = 1;
> +		dev_warn(dev, "invalid max-link-speed, set to 2.5 GT/s\n");
> +	}
> +	else if (rockchip->link_gen == 2) {
> +		rockchip->link_gen = 1;
> +		dev_warn(dev, "5.0 GT/s is dangerous, set to 2.5 GT/s\n");

What does 'danger' really mean here? Link instability or something else?

Error messages should be precise and not fearmongering.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


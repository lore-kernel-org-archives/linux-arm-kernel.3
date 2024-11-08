Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9850DD64070
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 17:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=GxsQs4kxONYICZCGLVXpRmgsHoURPzrRvnfd4DmBGQo=; b=VUcfaXNvgdnggT
	YI6KSz0BYvzeJCkylPW+i387cD+qfxkcqy0Z8EG5Ry/Qo7MV2xmZc38U/lc81+8HRrDoruK6HADyl
	bBOYRIvZiqFOPFGiwcCbClIwllDknUjVYzlW2sSJ423rRhGm3kacU5LdFDV7dP0wu8Jg25qirs+rz
	UoOj1b/1zmRYnLAFamxCpAdTqxgz3x5spa89t/ppLQAgKNQTDu3GDl2SY//X2EeNI0Ya2EHdk7X8E
	LNemnJDSQ+aiJ2en0kML6IMQvdYKQoqLGg2rnsNnl6M/JUVzzgrMjYRLSSg4L4UxlqJ6//26LP5Vy
	c31l771s/duktXZik7KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9SVq-0000000BL94-2dAl;
	Fri, 08 Nov 2024 17:11:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9SI5-0000000BJK3-0LV0;
	Fri, 08 Nov 2024 16:56:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 90211A440EA;
	Fri,  8 Nov 2024 16:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03DBC4CECD;
	Fri,  8 Nov 2024 16:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731085015;
	bh=hjfkk2bPDC/830gBiHBjzD5EFmbHgFIcXBwd1zE5kGE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=OSDYkbbKRO+AYZUWz7Sdh/5jZPwcxOt6K+qQ3Bi8Tdh8RvaGqMn+BBlP8VKDZbEKj
	 EZCdJJWpK4DpLf1qJFLIayaGJB3IVYHCc6E1uS/Qk0fNt67ztPzeNQhorC/DU6eSXq
	 woOQYbuy2hStYkSYEoNT8CAvNYWBnDAGfzOgSRWvUtNkUo+ZHI4SOOCY7hRw26qJEb
	 2eljXEp+AX/ADkBhMPlBSmj6Gywab+LA1oJMnbnvx/vBwIyruKOJ6iZLPZxbA+Kd2x
	 TVFKsr3mXTty3CPtV3FBdLmJcgfGatPWDOgYQXJvSnHY8UqMMOLyxkbxH2berrJLve
	 bgNfVoMNKS3ew==
Date: Fri, 8 Nov 2024 10:56:54 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] of: address: Preserve the flags portion on 1:1
 dma-ranges mapping
Message-ID: <20241108165654.GA1665761@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae3363eb212b356d526e9cfa7775c6dfea33e372.1731060031.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_085657_272813_B6A33E8B 
X-CRM114-Status: GOOD (  20.70  )
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

On Fri, Nov 08, 2024 at 11:39:21AM +0100, Andrea della Porta wrote:
> A missing or empty dma-ranges in a DT node implies a 1:1 mapping for dma
> translations. In this specific case, the current behaviour is to zero out
> the entire specifier so that the translation could be carried on as an
> offset from zero.  This includes address specifier that has flags (e.g.
> PCI ranges).
> Once the flags portion has been zeroed, the translation chain is broken
> since the mapping functions will check the upcoming address specifier
> against mismatching flags, always failing the 1:1 mapping and its entire
> purpose of always succeeding.
> Set to zero only the address portion while passing the flags through.

Add blank lines between paragraphs.

> Fixes: dbbdee94734b ("of/address: Merge all of the bus translation code")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> Tested-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/of/address.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 286f0c161e33..72b6accff21c 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -455,7 +455,8 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
>  	}
>  	if (ranges == NULL || rlen == 0) {
>  		offset = of_read_number(addr, na);
> -		memset(addr, 0, pna * 4);
> +		/* copy the address while preserving the flags */

Not knowing the surrounding code, it seems strange to say "copy the
address" when the memset() fills with zero and does no copying.

The commit log says "set address to zero, pass flags through," and I
could believe *that* matches the memset().

> +		memset(addr + pbus->flag_cells, 0, (pna - pbus->flag_cells) * 4);
>  		pr_debug("empty ranges; 1:1 translation\n");
>  		goto finish;
>  	}
> -- 
> 2.35.3
> 


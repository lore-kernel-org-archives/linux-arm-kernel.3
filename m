Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40D8D74951
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 03:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vpLG2xCKwKkUhQAxR9QJDnM8LdIuHlyBTs/ApoYfJg=; b=aG4wXUbt1ZcdE9279z6bjGF/4b
	E0+0hN6R0eV0wmnRgWpVcbU7ktPcmdzyieIphu2tGA7EBJrNY+s5VEeA8+odx43esy44rDwUYXZsH
	p4zy/cQ2iZ9vHCbdHtU5kJX/CWEthTyB5L6JaLjNZQyztlVXDFPFUBwZjJg0lowh4IvLDqVtvGA6J
	A4Xuw3SMg87uIwSISNVJiGn11hDkdP/g77meiIM2eS5SYnUDXRK9Bw31i1BTq56TrW4uKjZbJMC3i
	Q7iZOnNRZK4c4trwJybql497sx4aTY7TBhccMgVP5nBru3GuEI5sFsRtVBT3UgxYp/KH3kLGhiFjn
	b6v36K8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWRHU-00000009Yoe-05cd;
	Fri, 19 Dec 2025 03:35:52 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWRHO-00000009Ym0-1tEK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 03:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=1vpLG2xCKwKkUhQAxR9QJDnM8LdIuHlyBTs/ApoYfJg=; 
	b=BpdeKBz1cp7osWVKXwJgNSp1AGdJkYFp71VRqYS16kfQgnxNKJBJIAbR54B0AJTxgz7TfYexWEp
	lv5mlnmb+WTaC+UI7v/53XOGxr1SdFOsFovEPe8yQhaSQrOV0Hxgyut9jfz94a4HKH+9yORdgvdR9
	RrqWIKzuo7P64iNYGWqVEasyFu+GkABI3JFki53SakEST1ffwDbLqxDamB5Wlv5tKWzvsWS76eJ2v
	pRpLJF9sQV1/PxKp7bFN3WAwSunAOCpNx0OoDeTufJ9L68ay0AiUHI5jvdrG2CzcuKoJI/UeVuEz/
	8FxAcVv54IVioanN3PT1y++JB3fb2YdZUXKA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vWRH8-00BD02-0M;
	Fri, 19 Dec 2025 11:35:31 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 19 Dec 2025 11:35:30 +0800
Date: Fri, 19 Dec 2025 11:35:30 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: jeanmichel.hautbois@yoseli.org
Cc: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Olivia Mackall <olivia@selenic.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 2/2] m68k: coldfire: Add RNG support for MCF54418
Message-ID: <aUTIAicJiTxKHJb7@gondor.apana.org.au>
References: <20251126-b4-m5441x-add-rng-support-v4-0-5309548c9555@yoseli.org>
 <20251126-b4-m5441x-add-rng-support-v4-2-5309548c9555@yoseli.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-b4-m5441x-add-rng-support-v4-2-5309548c9555@yoseli.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_193546_506835_97CB394E 
X-CRM114-Status: GOOD (  13.01  )
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

On Wed, Nov 26, 2025 at 08:08:10AM +0100, Jean-Michel Hautbois via B4 Relay wrote:
> From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> 
> Add support for the hardware Random Number Generator (RNGB) found on
> MCF54418 ColdFire processors with clock enabled at platform
> initialization.
> 
> The RNGB block is compatible with the imx-rngc driver.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ---
>  arch/m68k/coldfire/device.c       | 28 ++++++++++++++++++++++++++++
>  arch/m68k/coldfire/m5441x.c       |  2 +-
>  arch/m68k/include/asm/m5441xsim.h |  9 +++++++++
>  drivers/char/hw_random/Kconfig    |  3 ++-
>  drivers/char/hw_random/imx-rngc.c |  7 +++++++
>  5 files changed, 47 insertions(+), 2 deletions(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


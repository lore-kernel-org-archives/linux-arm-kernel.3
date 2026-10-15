Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FC9CC6B3B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/dObaMkUWm5pUqDYuOvXJ2uzV/iakL+4bYfynFPMTA=; b=j0PCq1Wl5RnE2tmvH4xEp22Wvu
	ItayC8jJMIgMQBxN6xHrguWVova3py3hLmoVYqGrOc84COC+W1u2+SRp3ixoTlvVhPz37YCh42ScK
	Ni+6sIAWnlMIzbKWs+67ZjgvKOnPggEEJWIeH38n0LrfoTaotZTmfBo0lLOLUy5Yvz9qWNAePT1UG
	EERHwJed/FJTseMuD2JtgFyFi6nJJSQHoFn0tsIkqmkd4cr7qj488XuTlx3tYyAgG8NcYF+Itk9BG
	21IH+IIsNmcidICp0sy6xjl3OmnkB2Gl5mGVtlmiI4gLxSvSxlQJOC8CyAiw3N6hEEH+d//u3YP5L
	yGT9UAEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHxg-0000000HIZO-2hgq;
	Thu, 15 Oct 2026 09:41:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHxf-0000000HIYa-26ME
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 09:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=n/dObaMkUWm5pUqDYuOvXJ2uzV/iakL+4bYfynFPMTA=; b=VsoWz/v6Zs04d2qHXxKS8669cX
	hHbrm1SFHR9cV89wRNMPhbgxouW8htxLsre1qVCvcY5ZdsnNZd/W08Q5REhnJGgYjTpY4wmeGJKoz
	LJxBotcInOVONYE+7J81Il45tyI/6t1DOUSCUo1+W3eLBqG4unTKkoLLJSOD2sZjVQbry9xcsxAv6
	xQUj651ScQ3KAqIjVphtVdqgU/4nmavMr7RBQMv3GyszIcEm37mAVt8K0Y7sTTkt7ZkEuwHkFrZrN
	msPnT9OQfwrABwm5I3+c4kYq+tVviaaDzpo0FDA+rDJAqgQXkfxsvSk+EBXseXbiau8nVhIXol7CL
	KmY/TBEA==;
Received: from abb.hmeau.com ([180.181.231.80])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHHxa-00000000Bnc-2fW6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=n/dObaMkUWm5pUqDYuOvXJ2uzV/iakL+4bYfynFPMTA=; 
	b=AayoWzIl507yCoEfvjqfTQoiWeTVGYboAIKqziCOjo9+D1pJH3shHm2jQuig9q+R8AdT/5yHe2f
	qNVO626Q6NxguYxuu70Ckd0KoTflmJ5AMRYgBTA/3/zdOhMjD72rWq5b6pVmnBLeXfMKFCRkCNpZU
	qPNKcNcJBXHRb5Zhlyh1+ECXrFUGZtsOCl0uFZR9VBHdUrYZG445G0CZ9WK0A9ApyiL4EvdYFCcQC
	ohSUk86lI9xyB9lW+d+zPZq9mYDdFAoTfwr8CHpiyqh6Kr2itvVJzRQJo2ClqhSRdV/uSa1WIY+dE
	n450QdfRBPr4zy6msj5Pkig6LKYvBK6kJ60g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xHHx4-000000047Y7-2R5o;
	Thu, 15 Oct 2026 17:40:43 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 15 Oct 2026 20:40:42 +1100
Date: Thu, 15 Oct 2026 20:40:42 +1100
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
Subject: Re: [PATCH v4 1/2] hwrng: imx-rngc: Use optional clock
Message-ID: <atCfmsPr85oAnsJT@gondor.apana.org.au>
References: <20251126-b4-m5441x-add-rng-support-v4-0-5309548c9555@yoseli.org>
 <20251126-b4-m5441x-add-rng-support-v4-1-5309548c9555@yoseli.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-b4-m5441x-add-rng-support-v4-1-5309548c9555@yoseli.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_104114_866918_6B1A14B9 
X-CRM114-Status: GOOD (  12.73  )
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

On Wed, Nov 26, 2025 at 08:08:09AM +0100, Jean-Michel Hautbois via B4 Relay wrote:
> From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> 
> Change devm_clk_get() to devm_clk_get_optional() to support platforms
> where the RNG clock is always enabled and not exposed via the clock
> framework (such as ColdFire MCF54418).
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ---
>  drivers/char/hw_random/imx-rngc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


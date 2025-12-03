Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102E5D15DAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 17:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SLp65Uaq0Ye7WebCliU8wKV9cmtbplDxD6SowuHB70=; b=BU6Epc85jR/0ozf5d8KpfrtoMJ
	pvepwWFBpOTCDZFI9z6KD834cL+XGgaQyqEy9ON+gSuJGGst5+DwYfmhtb1fzog02MTXqH0+5umVB
	8irRJ5DsGU8Acp8Rd16pX59XJOWvj6ovWqO2fTkf8I4/2KHfcD//iKpsY02AamwJYLQm5tbbbbxZ7
	GGN/J9IpN/dqetD40s0wmOI4TIwPN5BFD30A5h36S3MZTlq69iwA87Klk41bQyZ8YAKkLz53X1mUj
	2TtLIyzOFUBZ4hdvl7RHi+vNzCCzfWbmiD1SNG6WtzuiITijv6fUVVdrwHimN/l9A3L5kuvvMWrm8
	Ixv/QdNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQqo5-00000006sCh-1IbW;
	Wed, 03 Dec 2025 17:38:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQqo3-00000006sCM-3aHL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 17:38:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B1B204439B;
	Wed,  3 Dec 2025 17:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64A7C4CEF5;
	Wed,  3 Dec 2025 17:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764783502;
	bh=RzEw6BWOmV1DouIc83EocSU3SyBmZSD/eMwaVfr2Hug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ojmrsYt4tU1v0zhscwtLSTwQuVCJPRgbn4LY9xDKbRowzHMgYmX/kab34H3TaP0tX
	 NiVCHJiq+y9dNzA7osRRr6UJSrBN+ikL/gFPazuzVFseiwGA3niS9zR7hkwtbE90fA
	 E85toTr1RNP09HBYXqEKesoc7oGLKubT4RFY+GUVXSB3hddaS0YjlRpT9ejWhs1vn3
	 A7vY9QI1vOpMP0CJq9g2hpbBDrJfIGxjHVGP5qdX+sQzkQtqdvGYR4byGnnO+W74Aj
	 eqUtTnvqt4zXbyhW9kvVuLA8tfMxgUuiRvmkepurBuqh3bTIEa43+jpU4wNiyIburw
	 Zkg6FmWvcEslw==
Date: Wed, 3 Dec 2025 18:38:18 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH 1/3] i2c: bcm-iproc: Fix Wvoid-pointer-to-enum-cast
 warning
Message-ID: <iwix6mjanmhqzuwunt3ium3cuuicfvdypvylykhm62mrwp57dg@fmuq6f7vmrcw>
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_093823_934059_5A4D1E61 
X-CRM114-Status: GOOD (  17.86  )
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

Hi Krzk,

All three patches merged to i2c/i2c-host.

Thanks,
Andi

On Wed, Nov 26, 2025 at 07:22:58PM +0100, Krzysztof Kozlowski wrote:
> 'type' is an enum, thus cast of pointer on 64-bit compile test with
> clang and W=1 causes:
> 
>   i2c-bcm-iproc.c:1102:3: error: cast to smaller integer type 'enum bcm_iproc_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> 
> One of the discussions in 2023 on LKML suggested warning is not suitable
> for kernel.  Nothing changed in this regard since that time, so assume
> the warning will stay and we want to have warnings-free builds.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> kernel_ulong_t is the preferred cast for such cases.
> ---
>  drivers/i2c/busses/i2c-bcm-iproc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index e418a4f23f15..b5629cffe99b 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -1098,8 +1098,7 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, iproc_i2c);
>  	iproc_i2c->device = &pdev->dev;
> -	iproc_i2c->type =
> -		(enum bcm_iproc_i2c_type)of_device_get_match_data(&pdev->dev);
> +	iproc_i2c->type = (kernel_ulong_t)of_device_get_match_data(&pdev->dev);
>  	init_completion(&iproc_i2c->done);
>  
>  	iproc_i2c->base = devm_platform_ioremap_resource(pdev, 0);
> -- 
> 2.48.1
> 


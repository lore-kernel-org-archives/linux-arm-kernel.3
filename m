Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E831C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cQzYgTGMFe71I5OuqnLj+6n3nAA+HM80f87TyWi/Ug=; b=Pa595OEUQTd3ajScoQ2Gw5Ijjg
	SYOy82x/dgLBZOQeqLpKu/JayX2yCbkbrXXKgnV9G30ehBoKybzO1cSqnW7pIL0JruZZK78N7fQQ0
	QirY0g3Gc0fi1X36iTb9Zy/Nni1ObIOtLqFrcxwWKU03q8jy13u6ACVtKtsrxiCWHtQgelOp2Ivcg
	avjiH5gSusyBAdyk2Ra3iwoNUaTuT77N1O7DKB3K4bEXLf19T58IMFUqPBVHX+9B5knup9EqJ7VCp
	oLFdexSbCv+imnehE8WCqxJd+riWMTWjw8gFz+TAz4Ro/Q0hS4lefkqOlwTdZUjo8QcjhwWH2/gU/
	Tht/15jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNFoe-0000000GR4b-2Qdh;
	Thu, 05 Jun 2025 18:59:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNFku-0000000GQoG-1gNL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 18:56:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CDDE049CCC;
	Thu,  5 Jun 2025 18:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B42C4CEE7;
	Thu,  5 Jun 2025 18:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749149759;
	bh=S57JYWqRIlYzccIFianGDz0QZjyJ43EZOMsNSS6TWvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQfnnKYci8teOCyjgjTnHjSquyEVxq+bVamGc0l1VLWCqcrr7P69etpEuHAllln2i
	 moIVoBMdmlZS+Ajx2Oye6jxQR1t40Aian7uTt0gAEeFC2ye3CUuMQy+lIqUI9/JdvX
	 JZYKYsdSfh6xVMPJKrNdviIrnRcy1lJwMSqWhwOkZ3Sq4JjdaC9jPxREHUFfVyxKSA
	 Q+ClJQv3lD388fR7+kzL/S8w1Wq3DU5CdVika52EFYiJvllcy0Wn6qSnow3y14ISvp
	 Ji0QMXnyi/h3iiaOxRSFSPy4a3eGfvPtBd8/YApweSXv+Xedc0mjwC6GOzGDHgLYJB
	 8bBizA6GT198g==
Date: Thu, 5 Jun 2025 13:55:57 -0500
From: Rob Herring <robh@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, justin.chen@broadcom.com,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] memory: brcmstb_memc: Simplify compatible matching
Message-ID: <20250605185557.GA3023589-robh@kernel.org>
References: <20250523184354.1249577-1-florian.fainelli@broadcom.com>
 <20250523184354.1249577-3-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523184354.1249577-3-florian.fainelli@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_115600_461128_AE6C1264 
X-CRM114-Status: GOOD (  18.45  )
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

On Fri, May 23, 2025 at 11:43:54AM -0700, Florian Fainelli wrote:
> Now that a "brcm,brcmstb-memc-ddr-rev-b.2.x" fallback compatible string
> has been defined, we can greatly simplify the matching within the driver
> to only look for that compatible string and nothing else.
> 
> The fallback "brcm,brcmstb-memc-ddr" is also updated to assume the V21
> register layout since that is the most common nowadays.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  drivers/memory/brcmstb_memc.c | 58 ++---------------------------------
>  1 file changed, 3 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/memory/brcmstb_memc.c b/drivers/memory/brcmstb_memc.c
> index c87b37e2c1f0..ec4c198ddc49 100644
> --- a/drivers/memory/brcmstb_memc.c
> +++ b/drivers/memory/brcmstb_memc.c
> @@ -181,65 +181,13 @@ static const struct of_device_id brcmstb_memc_of_match[] = {
>  		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V20]
>  	},
>  	{
> -		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.1",
> +		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.x",
>  		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]

This entry is pointless because the default will get V21.

In fact, I don't think you need the new compatible string at all. It 
doesn't work to add fallbacks after the fact.

Rob


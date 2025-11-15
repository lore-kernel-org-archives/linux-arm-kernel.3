Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26420CEBF86
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 20:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=If5xnTv8Dob243+I+tQxsKHMpUgcW+22OdMYXZGVLc8=; b=l/Nk4Ca9OhKA74SC+2QPascENI
	cccDaIwqh3Lz6VCFrlfR+zG08KHMJziSdvTHE8kFt+8MVPA0GNXn+WKhN5nI56PEe3ZoQRAKsYV5e
	/MyJVzuOFnBkldS8CsXfkkA/3fgywKovI1Rh1D0F4duotHo9iCxwGJJhLEDkYUh0uG2rDH6/I3ZnY
	haCxWfi4f5mTiXhAP95BcE6wWXXUV/wnQXCOnjrdQmTX/ucivKT5fz5OqJEoxlj4ln6b5SJTHeJnW
	OvNTPlYv11FSJmLAB4dbJd0m4vXwFqTyc2jhTrG4SckaEqXYHS0OJ1qr0PzU8fQVNioMNpLdcNExn
	Qu8tdNUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKNH1-0000000E4t5-3A8e;
	Sat, 15 Nov 2025 20:53:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKNGz-0000000E4sY-18op
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 20:53:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=If5xnTv8Dob243+I+tQxsKHMpUgcW+22OdMYXZGVLc8=; b=IZ0Hl6JD8px6djAK4EJY2/dnlD
	ZRjhX+qSWnZRItww5RN22cUkLIZiEWTnFAszdyTfellEmLJ2NngIqKYJ+wDg3umBzQCnrCsBIzyQs
	ua9FxvJ6Cg7roTZuN8ZaOz1DJsgmOmiCalhHXK8pJUz5wVAfI5s/FcUt8Ba/fn43F02Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vKNGi-00E6wY-65; Sat, 15 Nov 2025 21:53:12 +0100
Date: Sat, 15 Nov 2025 21:53:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Esben Haabendal <esben@geanix.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH net] net: xilinx: ll_temac: handle
 of_address_to_resource() failure in MDIO setup
Message-ID: <de7369f7-0526-46f5-b6c3-a98c683c7aa8@lunn.ch>
References: <20251114155519.3524628-1-Pavel.Zhigulin@kaspersky.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114155519.3524628-1-Pavel.Zhigulin@kaspersky.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_125329_314205_1C2A0907 
X-CRM114-Status: GOOD (  19.76  )
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

On Fri, Nov 14, 2025 at 06:55:18PM +0300, Pavel Zhigulin wrote:
> temac_mdio_setup() ignores potential errors from
> of_address_to_resource() call and continues with
> an uninitialized resource.
> 
> Add return value check for of_address_to_resource()
> call in temac_mdio_setup().
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 8425c41d1ef7 ("net: ll_temac: Extend support to non-device-tree platforms")
> Signed-off-by: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
> ---
>  drivers/net/ethernet/xilinx/ll_temac_mdio.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/ll_temac_mdio.c b/drivers/net/ethernet/xilinx/ll_temac_mdio.c
> index 07a9fb49eda1..ab23dc233768 100644
> --- a/drivers/net/ethernet/xilinx/ll_temac_mdio.c
> +++ b/drivers/net/ethernet/xilinx/ll_temac_mdio.c
> @@ -98,7 +98,9 @@ int temac_mdio_setup(struct temac_local *lp, struct platform_device *pdev)
>  		return -ENOMEM;
> 
>  	if (np) {
> -		of_address_to_resource(np, 0, &res);
> +		rc = of_address_to_resource(np, 0, &res);
> +		if (rc)
> +			return rc;
>  		snprintf(bus->id, MII_BUS_ID_SIZE, "%.8llx",
>  			 (unsigned long long)res.start);

I'm not sure this is correct. But it is an odd case. Apart from
setting the name here, res is not used. Imaging a DT blob which does
not have the resource. You get a random name, but the MDIO bus works.
With your change, the probe fails. That is probably a regression.

Are there any .dts files in mainline which do not have the resource?
Then we have a clear regression, and this is then wrong.

	Andrew


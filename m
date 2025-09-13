Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AE1CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 04:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMobyi7CHCAtrZXUZ+2PHke7JPIPiUB151O5SnfBnDY=; b=wI3Xa+IsbexbIkKYSx/IcIFIrj
	dd2AlNAY7sITb2id8wpiRYiUiwH8M9oW5wij+vHagFXmU/p3ak2OuO+ul/ttnnMpMUCVSTeEPZhGW
	quEFbCLQEK+v7pBTleFpUazZ7eAZrkpKVehstv1rx6OxV2HnPBzOqZOCdRPYaETUmU3KVZign1AGz
	9JUoqayOtU1yWNZejqmZALblKHVEhxDoa6xrIWvvoDHylQ9Nv9l4GqrWGOTJ3ZTckXLDS7C8FU+qp
	Ffwc1Lkrv/eCWiW1sM2YuSmvCh8midVMWD2n3ApYnHZAwSCE8gV1WkJVZQ+hM58e6psaPqNmz/Iw7
	YQy+mhaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxHqZ-0000000D9A8-2rHz;
	Sat, 13 Sep 2025 04:26:47 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxHqW-0000000D98q-1y4z;
	Sat, 13 Sep 2025 04:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=pMobyi7CHCAtrZXUZ+2PHke7JPIPiUB151O5SnfBnDY=; b=LGB7ip08oATk4jJqJ6nd/Rangi
	PARRVwJTKrt9yL0xGwqYkE/mv351unpn+EQAoS2jJ5skaKm+WvXkmfAfqnleHyBylI16cQdc1okCz
	Mnbr+9wJCoyKBA8dLh7iSZd6IFn06RGfvFH7AJCsy94lTnJ9kwdu3SODGn0SXSp5lwg55/P5mQz92
	JVCmg3L1JlrLKmZtGYIrJlJHnGeZIWKz7eI01xG4VwYaw+5Pvn0SKbPGhrcpD5p8TG5MIj7ITIXFq
	9RujF66I+8MUoynFdvSmy9pCaX4KGgIYhje5BVz3+JpORmhaW66sTyu3omRferKDBezm5NdOTRu4v
	1pOq7BRg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uxHat-0053nS-2d;
	Sat, 13 Sep 2025 12:26:33 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 13 Sep 2025 12:26:32 +0800
Date: Sat, 13 Sep 2025 12:26:32 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>,
	"David S. Miller" <davem@davemloft.net>,
	Heiko Stuebner <heiko@sntech.de>, John Keeping <john@keeping.me.uk>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: rockchip - Fix dma_unmap_sg() nents value
Message-ID: <aMTyeGTWPgsFglQ-@gondor.apana.org.au>
References: <20250903080648.614539-2-fourier.thomas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903080648.614539-2-fourier.thomas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_212644_509408_BBA28A1D 
X-CRM114-Status: GOOD (  12.16  )
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

On Wed, Sep 03, 2025 at 10:06:46AM +0200, Thomas Fourier wrote:
> The dma_unmap_sg() functions should be called with the same nents as the
> dma_map_sg(), not the value the map function returned.
> 
> Fixes: 57d67c6e8219 ("crypto: rockchip - rework by using crypto_engine")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>  drivers/crypto/rockchip/rk3288_crypto_ahash.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73495C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37rLIMLFlk5npwCc/iHhjmm772yYSs2S7drUMssNos0=; b=leM0aPFlNwbjfhZ0xVv0D3U3SC
	XP4wAUP+HEh3sROuMKnOQwzYCJNyTdOAUHr9uKo88sIR73MfC8X2DucWowuJjLC0/OLJovzTh8o3l
	Y6fGGU0EYqJLFhT0Hn99bylfdx9b3tvsHU9TP5xlz+QT1wE8HrZHHfSXuvB8liIn0UZkjYGYL5xHD
	oTQLD2G6nzHsiIHGM7bDbfIEUImwDcuPZIRJUPx6gXPDuj5O9FIDCKJuiIWE/BEnzEPT22dk8M9qW
	bNtbEsm95s+WRnHD0wJJWAUxKWZMn1WbvMNX/FiYKFyxxf0PrQmfTP7FSDQN8NiqD9p/lPTlee0Ba
	boJUFOnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NYW-00000006Auv-0lqq;
	Mon, 28 Apr 2025 12:25:52 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9N4T-000000063Me-1Gyy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 11:54:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=37rLIMLFlk5npwCc/iHhjmm772yYSs2S7drUMssNos0=; b=Exf5KlG1jNwSSx5K2CYsRXlgxz
	EIc044a7f7ZLQYKBCotON1j483aD8yfVhp235sVZHMGGQsa3YzatkM2m4sQpuk4K5HlVPZgyV70Vj
	P8e3LTcb2SQvvKKNp+p/zyMK24HUlIZW8MxtMSgmxkzohXWgdHk+yCREW2jtxHalzlEwttASUxIOh
	6L9+UasiKlZeHBjZH5f8JlMJ+mKJv9SPymYIFlKSciUSG5Yfp+z2WA92N0UISUwjZX2Q6PkqDxv/Y
	jtfeGq70DrmhfuKfQG7MVt8SRGIjKHNntSIp6uzKv6LVbw6/HaogauxOUTi4Xb6xsLTvJpUFX+2Eg
	tJqaPY1w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u9N4M-001bL3-30;
	Mon, 28 Apr 2025 19:54:44 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 28 Apr 2025 19:54:42 +0800
Date: Mon, 28 Apr 2025 19:54:42 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: jernej.skrabec@gmail.com, samuel@sholland.org, wens@csie.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH RESEND] crypto: sun8i-ss: do not use sg_dma_len before
 calling DMA functions
Message-ID: <aA9sgikONjK2ig5z@gondor.apana.org.au>
References: <20250427111236.25668-1-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427111236.25668-1-clabbe.montjoie@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_045449_342017_C5600C2F 
X-CRM114-Status: GOOD (  11.83  )
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

On Sun, Apr 27, 2025 at 01:12:36PM +0200, Corentin Labbe wrote:
> When testing sun8i-ss with multi_v7_defconfig, all CBC algorithm fail crypto
> selftests.
> This is strange since on sunxi_defconfig, everything was ok.
> The problem was in the IV setup loop which never run because sg_dma_len
> was 0.
> 
> Fixes: 359e893e8af4 ("crypto: sun8i-ss - rework handling of IV")
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> ---
> 
> If someone know why sunxi_defconfig have sg_dma_len() which always works
> even with any DMA call not done.
> 
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C590C369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 08:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoWHXtften/lUbiJBml2hBCsuMZ21wIlk4QxBfXkS3s=; b=h+lDdB4a4WTiaGX9piOXs5sqv9
	ayoKhTVV5EOtuSNi74NgvYmJ9qUWK0V6T0pZ1cscMqgN8ZO9lSNpZQdtTeWM6WDOplX9bZJMgiBp2
	9cBtvZWxTzYv5ksjcVCad6vL9sPWEMLU+IZC0/60QQaektNgZMZrIF9A+dIapbPij4ZgQHK0vo0Kw
	0iAtUdSW28Py9iV2kb2JXfsUT3Lp6y7PzjVspw+srUuJW0HuT2bQDdmXN0oOjZ9rX6t8hOv2Juqvq
	fKdS4e+H870v+j7sDddxS05rwpd4Lp72ZqWYtBPTPXokLBh6kj1g8KM6aKizdPiXLjGev+F+Aef+l
	3KQIZDEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xla-00000008jqF-17Rp;
	Wed, 16 Apr 2025 08:05:06 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xfS-00000008il3-44dZ;
	Wed, 16 Apr 2025 07:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=xoWHXtften/lUbiJBml2hBCsuMZ21wIlk4QxBfXkS3s=; b=JbKawVCgPm2re7jfhUtUt73G74
	tXPzSu7vBAi/lpfKvoTqvBuTnY76PG1u0KigAwwwYbd0M6m7/KecLK1/21GlLJOIbiBP3Y2IYTMoI
	qoV94/bRmruE7Y9qoSbJ7VELrIIWWknHuIITaWnzbEqI34drIGV7sk0QkU8FDF3gHKGkQ/DGPcD51
	YGNqiadPiGl73aueuB3ZJiIVR+TUxW1iYKDc125n1OjsVhX305RI6P3fVsh3Y9dUbPdNNIurCtSIV
	LhMHUTzGtVur/QSSCecJSnC0ENsWkqHZ9z3cPrhtjqATW0tv5gc+QPampD0aZ0jY6O3uFqeZ3tqIU
	rnJC7fzw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u4xf2-00G7tZ-2s;
	Wed, 16 Apr 2025 15:58:21 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 16 Apr 2025 15:58:20 +0800
Date: Wed, 16 Apr 2025 15:58:20 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-crypto@vger.kernel.org, Olivia Mackall <olivia@selenic.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 0/3] Use a local device pointer for hwrng drivers
 instead of casting constantly
Message-ID: <Z_9jHLmgaG7wjAhT@gondor.apana.org.au>
References: <20250410152239.4146166-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410152239.4146166-1-sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_005847_006059_903344B3 
X-CRM114-Status: GOOD (  12.22  )
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

On Thu, Apr 10, 2025 at 06:22:36PM +0300, Sakari Ailus wrote:
> Hi folks,
> 
> Clean up random number reading by storing struct device pointer to device
> context struct. The changes are very similar in all three drivers.
> 
> since v2:
> 
> - Add a struct device pointer field to device context structs, don't use
>   struct hwrgn priv field for the purpose anymore.
> 
> Sakari Ailus (3):
>   hwrng: atmel - Add struct device pointer to device context struct
>   hwrng: mtk - Add struct device pointer to device context struct
>   hwrng: npcm - Add struct device pointer to device context struct
> 
>  drivers/char/hw_random/atmel-rng.c | 11 ++++++-----
>  drivers/char/hw_random/mtk-rng.c   |  9 +++++----
>  drivers/char/hw_random/npcm-rng.c  |  9 +++++----
>  3 files changed, 16 insertions(+), 13 deletions(-)
> 
> -- 
> 2.39.5

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


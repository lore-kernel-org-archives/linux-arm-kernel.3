Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9045EC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 08:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PIpMAWLwgP8XaU0st9wLlONfCFrdoYGt6FMJeS8v+4=; b=1+88xR2NP3CpuR94ybpY3Tai08
	EX0rPz7yF9nvSrZ+98I13qKCAwzABxQgXSXybmU6CU7UQe42AeTx8e2afwMFQ2fZjhUz2BcHUi1ip
	2c8U2rJVyR6Mpy3jxs11+Ki/ZTqFIvegXBClnRf4WuvJkenGV4a7eNgeuIJy2Rt3IQdWN40tj8MDT
	D4AV88KVwXFuu7Qdy+Cuh5QnqKaol2RijlxZYXGVhhsmnKSRekNo/fgJdeC+/tyVRPEwH+40kQbOG
	JT7D87OXZbrDuisIVXrwXUD6MTs6t4l1n72EIkPm9zjRk/kDlkgSPZF76qAH8/RYVVXW73LTm6ICD
	YruQWsPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2n5v-00000009huf-3cRn;
	Thu, 10 Apr 2025 08:17:07 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mZI-00000009btU-2sUf;
	Thu, 10 Apr 2025 07:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+PIpMAWLwgP8XaU0st9wLlONfCFrdoYGt6FMJeS8v+4=; b=gCiNLKM6JXpltYkDzBoePum/5Q
	NNGKz53YHexTDwmBP3666sm6fjXb7mODxZKmzdrXB7rh3fCSavsI0pYGHqhPqY7xXthP+3K8YonYC
	nP2x0M+dr3sZkvrOaThucm4eTUHWdSJbqslO6Z2WHKonn/LetaCUfBQ3hL8du9vCbW8xrhd37nzQ6
	cUo18LZ4GB00oKVkNcsYAdmHICRPYg2AVp2lP/J7OjC7u80aIkbByWMGvTfTt1QlLSlHficnm+5uq
	KL+PWNnO6m/C5QI+XL969S3tSXhMTbuMNEQGLbeQTVMoJKlS7O8X0Dhby3k+py86iKTYR3YgFhrVE
	gczaKq4g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u2mYn-00ESnF-35;
	Thu, 10 Apr 2025 15:42:55 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 10 Apr 2025 15:42:53 +0800
Date: Thu, 10 Apr 2025 15:42:53 +0800
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
Subject: Re: [PATCH 1/3] hwrng: atmel - Add a local variable for struct
 device pointer
Message-ID: <Z_d2fcuWPiel_OnT@gondor.apana.org.au>
References: <20250410070623.3676647-1-sakari.ailus@linux.intel.com>
 <20250410070623.3676647-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410070623.3676647-2-sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_004324_722471_5036A847 
X-CRM114-Status: GOOD (  14.92  )
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

On Thu, Apr 10, 2025 at 10:06:21AM +0300, Sakari Ailus wrote:
> Add a local variable for a struct device pointer instead of obtaining the
> hwrng priv field and casting it as a struct device pointer whenever it's
> needed.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/char/hw_random/atmel-rng.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
> index 143406bc6939..5192c39ebaeb 100644
> --- a/drivers/char/hw_random/atmel-rng.c
> +++ b/drivers/char/hw_random/atmel-rng.c
> @@ -56,12 +56,13 @@ static int atmel_trng_read(struct hwrng *rng, void *buf, size_t max,
>  			   bool wait)
>  {
>  	struct atmel_trng *trng = container_of(rng, struct atmel_trng, rng);
> +	struct device *dev = (struct device *)trng->rng.priv;

Please stop using the priv field and instead add a struct device
pointer to struct atmel_trng.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


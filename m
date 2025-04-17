Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BF9C369CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 18:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBGfvkaIoJwGhIf4XsMYZAoonH7xTpDaDwc9NFgE4ko=; b=R2+EqOex/gGN+2vJdJyyTxl/PK
	vvSUw/yWIEQpg9/FborBEYFJti8g2UMcEu5Ci/0Y3UCVaUHj2uBDdbbQb+6fIlXpB1+tRn10aW6Or
	aZLQX3xqvnBr+mTSDH3AzbNRNIpAT44OwzwVRFCcAxe4AAKb3MRhOZb4ygUjfuoBIqTv7KJgsHJr4
	hvvvM/q8p/qtFlCk8TEKSWdgsISGBq2bYeOsoyNKov+vWBlchCXXWWJwqF71Z9ksL9Cko9zbsJOCB
	DEZpvGihTB5Y51BNs42otYZPogIUc/Xq0OF4CNT6039hBiEVXzDeiy5dSbJqiUr+qXhh1HaOyV1qN
	vA5D6tdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TbX-0000000Dxh5-3Hy1;
	Thu, 17 Apr 2025 18:04:51 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TA5-0000000Dsak-2bBT;
	Thu, 17 Apr 2025 17:36:30 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZdlMV4Whrz6M4hX;
	Fri, 18 Apr 2025 01:32:22 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 65952140145;
	Fri, 18 Apr 2025 01:36:23 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 17 Apr
 2025 19:36:22 +0200
Date: Thu, 17 Apr 2025 18:36:21 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: David Lechner <dlechner@baylibre.com>
CC: Jonathan Cameron <jic23@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?=
	<nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Lars-Peter Clausen
	<lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, "Cosmin
 Tanislav" <cosmin.tanislav@analog.com>, Tomasz Duszynski
	<tduszyns@gmail.com>, Jean-Baptiste Maneyrol
	<jean-baptiste.maneyrol@tdk.com>, Andreas Klinger <ak@it-klinger.de>, "Petre
 Rodan" <petre.rodan@subdimension.ro>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 5/8] iio: chemical: sps30: use aligned_s64 for timestamp
Message-ID: <20250417183621.00001c67@huawei.com>
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-5-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	<20250417-iio-more-timestamp-alignment-v1-5-eafac1e22318@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_103629_801669_DA55286B 
X-CRM114-Status: GOOD (  15.75  )
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

On Thu, 17 Apr 2025 11:52:37 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Follow the pattern of other drivers and use aligned_s64 for the
> timestamp. This will ensure that the timestamp is correctly aligned on
> all architectures.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  drivers/iio/chemical/sps30.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/chemical/sps30.c b/drivers/iio/chemical/sps30.c
> index 6f4f2ba2c09d5e691df13bc11ca9e3a910d98dc8..a7888146188d09ddbf376b398ee24dab7f0e2611 100644
> --- a/drivers/iio/chemical/sps30.c
> +++ b/drivers/iio/chemical/sps30.c
> @@ -108,7 +108,7 @@ static irqreturn_t sps30_trigger_handler(int irq, void *p)
>  	int ret;
>  	struct {
>  		s32 data[4]; /* PM1, PM2P5, PM4, PM10 */
> -		s64 ts;
> +		aligned_s64 ts;
Definitely a bug as we have no idea what is next on the stack
so fixes tag needed.

>  	} scan;
>  
>  	mutex_lock(&state->lock);
> 



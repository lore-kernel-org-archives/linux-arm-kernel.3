Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67879FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6urYhDY7o9dfEezw/AmV48WLhI771nD0tDel+wEmoI=; b=0/P9pHpup6R1Prd6JNsRjcb6Hr
	9mMF0bUnWf/iEi4Nkv9F1NHmkLQnXRq7zD2/1Pd3LNafK1agoUaFLXab0Unly87yyG/gLS2mbAm/6
	86adDj9cncHvIKibnyFAvuFKWR5OV2WuSFLFb5Hb2ekgwL4pr1V9ZzegWHePN2JZ/XWsn+JN8FeCk
	GJ2ldG1GAZTEP6MyD/5cRm9LTl7rpK5YRCdGUF4lI0HblvJZL0TeYy8PbPJOTlfr8cyICksEY4usl
	Ko1vf3EpIC1Rc1Ng6YW3N/c66v6SAF4jmC4+e9Tt4R0fUGfBLxDTzXeX7EF9kbWy55+/zJARjT/OG
	UG7vuF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl0M-00000001rlI-1tqP;
	Tue, 28 Apr 2026 16:09:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl0I-00000001rke-484Q;
	Tue, 28 Apr 2026 16:09:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43300436EF;
	Tue, 28 Apr 2026 16:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96056C2BCAF;
	Tue, 28 Apr 2026 16:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777392582;
	bh=NMCdntPrzwWMEYhbF68r/CUkWpbbMlQQ+Na88Lpwpg4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FNXy0e3P1WQyR6Pl5cW+WS7sU0Kql8FFE81jR+vUlhlszEco3BiYaVACsTybXDN0W
	 gio1jEq3f+6FuNuS+btz2wT9CiEy4aDyOmn5QD0Q8b0EyUQeb/pfDpuCKzgFBWPFBr
	 /rqwkFi6EUcGrKo5t+QkXd1mjxijXSNkqD+NjF6H/wAkuVULKeekvdz0LrOzszPW/k
	 tk4TuO/71UaIsdwzlyBMoX4pf3WHCZ4IuwRwonpH5K8ZI0v9R0Z6JPhHT4l0BEaGEy
	 jxB18tZloHxUC99YtopofSmcroq+ix1bozGFxY5jFMUCeoWYmIP8Cpq5IMbOd1xeGg
	 +d0Rmlhv9T0Dw==
Date: Tue, 28 Apr 2026 17:09:33 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Salah Triki <salah.triki@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4] iio: adc: mt6359: fix unchecked return value in
 mt6358_read_imp
Message-ID: <20260428170933.36bc8a17@jic23-huawei>
In-Reply-To: <20260427201238.20823-1-salah.triki@gmail.com>
References: <20260427201238.20823-1-salah.triki@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_090943_048930_6BE61F94 
X-CRM114-Status: GOOD (  23.12  )
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

On Mon, 27 Apr 2026 21:12:38 +0100
Salah Triki <salah.triki@gmail.com> wrote:

> In mt6358_read_imp(), the variable val_v is passed to regmap_read()
> but the return value is not checked. If the read fails, val_v remains
> uninitialized and its random stack content is subsequently reported
> as a measurement result.
> 
> Initialize val_v to zero to ensure a predictable value is reported
> in case of bus failure and to prevent potential stack data leakage.
> This also satisfies static analyzers that might otherwise flag the
> variable as used uninitialized.
> 
> Fixes: 3587914bf61 ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
> Signed-off-by: Salah Triki <salah.triki@gmail.com>

Applied and marked for stable. Risk of this occurring is very low, but
the risk of the patch causing trouble is effectively zero so I'm fine
with this being backported.

Thanks

Jonathan


> ---
> Changes in v4:
> - Move val_v initialization just before regmap_read() call as suggested 
>   by Andy Shevchenko to improve maintainability.
> 
> Changes in v3:
> - Initialize val_v to zero at declaration instead of checking regmap_read()
>   return value, as suggested by Jonathan Cameron and Andy Shevchenko.
> - Update commit message to reflect this new approach
> 
> Changes in v2:
> - Added Fixes tag.
> - Re-examined the entire driver for unchecked regmap operations.
>   While several regmap_write() and regmap_set_bits() calls also ignore
>   return values, I focused on this specific regmap_read() in
>   mt6358_read_imp() because it leads to an uninitialized variable usage
>   (val_v). This makes this fix critical for reporting correct data
>   to userspace
> 
>  drivers/iio/adc/mt6359-auxadc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
> index 6b9ed9b1fde2..1d9724ef0983 100644
> --- a/drivers/iio/adc/mt6359-auxadc.c
> +++ b/drivers/iio/adc/mt6359-auxadc.c
> @@ -497,6 +497,7 @@ static int mt6358_read_imp(struct mt6359_auxadc *adc_dev,
>  		return ret;
>  
>  	/* Read the params before stopping */
> +	val_v = 0;
>  	regmap_read(regmap, reg_adc0 + (cinfo->imp_adc_num << 1), &val_v);
>  
>  	mt6358_stop_imp_conv(adc_dev);



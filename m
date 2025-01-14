Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA02CC02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 15:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYThJmbcOREv3PsHgaHEbArEjAKoBFWcy4BkZMOVNJI=; b=E5rX+ozZdbi3I3tIOQpOlBkBuS
	SBjt8w6+IW2UU9CKfV9bEelSzcrUOdMxv0/r31VWZClA7yZMJKaoBE6HQF5rppztnt7IgWQS1mgwf
	7sYm7uGYKEv+KTe4cIUh0B6hfflf7Px3qAC1Cp9SOuC6JxsaBgXQ3lZiHWCtJYbAFWav3wiVf58O9
	RpgYuj7VOTxV0k1e4xsClVsOFyy8scKv3DQ+d2ixUnfPvxsgr2iXtc9CW47vkRc4Lrt2gycQvwOMt
	MY6DDBBOt/QO7vqwDALnUgW287iN5UvpF/jb+2Xmt5XyLQPoMKd4+es4ENULINOyf7OR6LX0nu/bH
	qqkUqMMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXiah-00000008oaK-3ql4;
	Tue, 14 Jan 2025 15:12:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXiYJ-00000008oAO-1GB6;
	Tue, 14 Jan 2025 15:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F2EA5C5717;
	Tue, 14 Jan 2025 15:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC181C4CEDD;
	Tue, 14 Jan 2025 15:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736867397;
	bh=pF75XEhCKXfa8xLX7BhBkgUQunabFzT49vPHGlCrxp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y8BAvFB9wyfMPoiWJw529UvoYSB6t2kMT9i/2h1HSI4JFMtvWoxIsXQ3GcbgJ9oK6
	 VH0lVO2wZk9/6yQZ5BLvJBD3yi0IhFH84jdw2+29r9kZodDMMx2P/99jEiANO2JKwf
	 CK6WrnXksNSX1/HcrvXFyZpplL6njbLq/6Uoy9+FHkpk5vrUZesIQg6KgVULRSitMq
	 ZNw23DEjnUAn33zZvbr/Dg7P3XO1fwJwoqIkeIg7yqnBpnQ5tdDbyqvZiRqZflndLy
	 5KhYZ0/sbtdcaH6MVKDAph8GpK/xF6W+jlxnbJUmtQis5udz5Q+7tSA6YEtdFYYlsq
	 8AC0XTwA+RNWQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tXiYK-0000000079j-0bFX;
	Tue, 14 Jan 2025 16:10:00 +0100
Date: Tue, 14 Jan 2025 16:10:00 +0100
From: Johan Hovold <johan@kernel.org>
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] gnss: mtk: Simplify return variables in mtk_set_active
 and mtk_set_standby
Message-ID: <Z4Z-SJZIekQ3SjP4@hovoldconsulting.com>
References: <20241117052501.1138926-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241117052501.1138926-1-iwamatsu@nigauri.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_070959_429114_69B6D965 
X-CRM114-Status: GOOD (  16.38  )
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

On Sun, Nov 17, 2024 at 02:25:01PM +0900, Nobuhiro Iwamatsu wrote:
> Simply return directly instead of assign the return value.
> 
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---
>  drivers/gnss/mtk.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gnss/mtk.c b/drivers/gnss/mtk.c
> index c62b1211f4fe4e..be20f6d6470736 100644
> --- a/drivers/gnss/mtk.c
> +++ b/drivers/gnss/mtk.c
> @@ -24,25 +24,15 @@ struct mtk_data {
>  static int mtk_set_active(struct gnss_serial *gserial)
>  {
>  	struct mtk_data *data = gnss_serial_get_drvdata(gserial);
> -	int ret;
>  
> -	ret = regulator_enable(data->vcc);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return regulator_enable(data->vcc);

The current style with separate success and error paths was used on
purpose (e.g. to make it obvious from just looking at this function to
determine what is returned).

Johan


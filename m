Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B5DC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 08:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nActGH5X3rYsSJc5n4te1fJegSfTeLgxpgzK7o2cEc=; b=w1HRz6Pqww/N+U+Uod5GJbBmEb
	QwCyGcSzEX8D1sFGXFokQtur7mxXY2QmjU0v+kgKB2B7CP0HPSrnw0PAm9aXgu42iPAsO2pHNQCfa
	tUytHKbRVjUhlvq5dy4iITSu9s4zI6UKoOkUjvGNMyviPRnFlVwgiJBL/rsxxZkctT0atoqAqSOMb
	WXGgcPsvYsdcPB7Bwa5s23j3TfZ30m3ij72MkNtWfGx16qBYp7upA/VT/Wb9cgMHxU69CXV1UN9Ff
	iXbx7krgMQom84UqPSzVDxOmEurv9PzroQKchvy1xIFZjokKK0fdeBIKLZLsUfStfvqIug/riL3cn
	hKaw8LWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trYxn-00000001z7N-0s8M;
	Mon, 10 Mar 2025 08:58:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trYw9-00000001yrE-3STj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 08:56:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 52351A45182;
	Mon, 10 Mar 2025 08:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF69EC4CEEC;
	Mon, 10 Mar 2025 08:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741596996;
	bh=C12mkxyY7Tuz4k36lFMWBiBskfY3UsSgTUDwu4ymK5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VS2GD8mC3KF67GsqwrZolL2PJC5nV8QLxQyAj07n3f39prZtkH1iJvEM60yAG3gQD
	 V6plRwhAVbOW7QKUgyQAJHRX8KqkzSNYtqJVSaCbMIZFHBfrzwotEzdTyBf7nahb1F
	 ulw5xmNt1ZS0/aH3skbKsPmqAglFS17CXESwCPnsNYfVvt5TieC74ADPeUyUBP34F1
	 pDsXpTVlIpEGb5v1s3vkFszlbLMYeyG2K7k5dPXep0ShufS8ewpYY5j+8DCkBkiobB
	 dcRrEG7RKtdyu/gY2i+79yqPKgi/ec7BtqCYNCz/r78UnJa0FdyBemgkAxkJvqs9vk
	 pVW7xYFBa9f3g==
Date: Mon, 10 Mar 2025 14:26:26 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v6 01/10] tee: tee_device_alloc(): copy dma_mask from
 parent device
Message-ID: <Z86pOi874jfJJSOv@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-2-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305130634.1850178-2-jens.wiklander@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_015637_925855_16E6B567 
X-CRM114-Status: GOOD (  14.91  )
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

On Wed, Mar 05, 2025 at 02:04:07PM +0100, Jens Wiklander wrote:
> If a parent device is supplied to tee_device_alloc(), copy the dma_mask
> field into the new device. This avoids future warnings when mapping a
> DMA-buf for the device.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/tee_core.c | 2 ++
>  1 file changed, 2 insertions(+)
>

Reviewed-by: Sumit Garg <sumit.garg@kernel.org>

-Sumit

> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index d113679b1e2d..685afcaa3ea1 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -922,6 +922,8 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
>  	teedev->dev.class = &tee_class;
>  	teedev->dev.release = tee_release_device;
>  	teedev->dev.parent = dev;
> +	if (dev)
> +		teedev->dev.dma_mask = dev->dma_mask;
>  
>  	teedev->dev.devt = MKDEV(MAJOR(tee_devt), teedev->id);
>  
> -- 
> 2.43.0
> 


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BD5C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NymQllFGW/d7T1ecbWk0XQBpiDM3En0PKGwwReZs9hI=; b=15IshTZiMnPKg9blrUk7bYNRfM
	RNajHXak3/6RG5pTxibCIadqlUhUyno9RcopZ/1cIPIRUKPmqb52KCGHRP2pxeKy1/nRUnIb5mUz4
	xU6T0fob/5KDD8QLpZjrS9riXkbZxCa+xttZ+hUhO4Jz9LCFQxmo2ZEjekrOl/mV1Zeu1K30TxNRi
	1mRF52jEyHHUf1s8f+NhtB/qaWqx76KkVk6cAt6TZL6BI2HQrYCDfWma+qlxbS318ik6pGBvbsP/Y
	fhDfiFI3jz93unsvbjQuBE9BHb4IFzZ5JlRXcn+dc7vVL1tUl2Ekg7ep6N0dSEoWr04gGkCEMqnEp
	LKSj6oAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gFP-00000002gar-2GWK;
	Mon, 21 Sep 2026 15:48:03 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gFK-00000002ga4-1y34
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:48:02 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso3054528a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 08:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790005678; x=1790610478; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NymQllFGW/d7T1ecbWk0XQBpiDM3En0PKGwwReZs9hI=;
        b=DIy+Lp+ETwTxGw8iF/cJHgwDYgDGkhdfpPFExqwWHOzX6A2finhufpeHm/xRNQYgE0
         DW8dZ5H5fWqoks4Oo4t3Ia9subpVV0HLnH3PtE/fGX5GxUIFiOAUnez7pTdBixWG25p+
         Prth+M0iDL7c5Dqsy4WgSVqV9C1zQq8CWZDAeFXKoN6ikKCwSqE6x2S8ISx4FwxAriFj
         cfXOHUE+tz4eqo/OpY9vzSLlafpTBi9m/e1Z6hbEmmvtEXSbpClvBj9G0uXrrOn5f3zB
         GJ4zrb69p3LPPgybduh9TDH/vshcaheAPLSPuUITxfDs/397jDDLGXihG1Wia1qcZh+e
         TspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005678; x=1790610478;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NymQllFGW/d7T1ecbWk0XQBpiDM3En0PKGwwReZs9hI=;
        b=grnY6uMhqnEPY98C/toLeN0wA3/iv8YlBM3UGiXxH496lUx2oKxutNRDMHvCU4nE44
         TsSQiS/mn35Rw0Az3yCTOSmgYOfrV+jGjwjVoN82unnNUrh6dtmZ2tqS8s2xcXde/2L6
         qBUS4lIDY/PUzHiTPmyrFtCz1ckeExTv5i2XbcQSiHihLyrmi8mjsyzsacXxP2u60pyu
         xkTxKIaRxYc+LSBzE/b4y/uzksMIso+ktfLWL819Mab7qNAAxtpSqfkO7ow7QX2ycOW0
         SOxyEbiqtuxhvUpQ+rhKAkftp8a/vT+vacD4k8N+iOdgNGn0U1ELyBlMZE+JUzKw15J3
         DHGw==
X-Forwarded-Encrypted: i=1; AKwUvBxj23j6o5XOqQBHtJWY15an1cDQTkju+/uqRGRIZLs1OXRrNcb7SFyV8RQShranqRke3wHtUuGUSbEw+gGcMOAW@lists.infradead.org
X-Gm-Message-State: AFuF++kmRFAfh8pwI2b2TeNlmqOgxIncNV15cauarpI6HBlkbISf0lYd
	6oLUa4cT645uZNM+0w8SPs+PSS4LsyopGAeQZrQnMn4CNbBwgMUIPAqdtOkQERcez/I=
X-Gm-Gg: AYBFou3XFxCB3fbi2gwSvZnkal+EJL+ubuZk4K0VWFAN6N2gimvzke5xcz+rvwuFxiy
	Up5od1cL85ch7WY8IlNxe9vUREDDWzEBK2grWZ5qw1EBXoRxRgLorgwsJ9CZgNsUFQsTptTlk3S
	zelLgiQ7GQPTLYv8ahhIELDqDFJp9CZxm56lI8AxNIx+hFzv6cdai2wEZC5Lnzoys4Wg+iLKGnu
	NWq+2OPWY2GatHa3GdJX4+1rhk75WqmNk7WPa1mcm6O7NEoic33AiNJWzb0WMwowCwpSwFLCV1E
	fK5dSbrAOlfZ9hGQFiSJLAInfqwM7DTpoAwzGZaWsaWEjDruf6g8+X/KBd4Z+TXCch30EvlX79k
	EK+xxuzm56jWzKbEsg0a8UbfYpbliP7n94esQHu8q+fv9rSg3ntumFMcKFkmmMEeo5uKqbqc7fS
	n6pCCDURideJrqH5hFH10FMR0wS5tjPDSWjmOFoPkCjhAtLjvGiSLDnFsoOVvekmk0tnpxhFniy
	A==
X-Received: by 2002:a17:90b:2750:b0:39e:6c69:776f with SMTP id 98e67ed59e1d1-39e6c697934mr11058030a91.24.1790005677565;
        Mon, 21 Sep 2026 08:47:57 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:a714:d1ef:56ba:be47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55c9cabdsm7471419a91.0.2026.09.21.08.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:47:57 -0700 (PDT)
Date: Mon, 21 Sep 2026 09:47:54 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	imx@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 05/12] remoteproc: always report VIRTIO_F_VERSION_1
 feature
Message-ID: <arFRqopkkJf7Nlq4@p14s>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-5-dac8c5eb4aa9@valla.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-remoteproc_virtio_map-v1-5-dac8c5eb4aa9@valla.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_084758_518277_DDD2125F 
X-CRM114-Status: GOOD (  23.50  )
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

On Wed, Sep 16, 2026 at 11:10:50PM +0200, Francesco Valla wrote:
> There is currently no way to report the VIRTIO_F_VERSION_1 using the
> resource table alone, as the per-vdev feature array is limited to 32
> bits.
> 
> Considering that the VirtIO 1.0 specification is now ~10 years old,
> always report the VIRTIO_F_VERSION_1 feature, as some drivers depend on
> it.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 74e0da970f1d..cfd66d9d1c9e 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -249,7 +249,7 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
>  
>  	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
>  
> -	return rsc->dfeatures;
> +	return rsc->dfeatures | (1ULL << VIRTIO_F_VERSION_1);

I understand this.

>  }
>  
>  static void rproc_transport_features(struct virtio_device *vdev)
> @@ -275,14 +275,16 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
>  	/* Give virtio_rproc a chance to accept features. */
>  	rproc_transport_features(vdev);
>  
> -	/* Make sure we don't have any features > 32 bits! */
> -	BUG_ON((u32)vdev->features != vdev->features);
> +	/* Make sure we don't have any features > 32 bits except VIRTIO_F_VERSION_1 */
> +	if (WARN_ON_ONCE((u32)vdev->features !=
> +			 (vdev->features & ~(1ULL << VIRTIO_F_VERSION_1))))
> +		return -1;

And this.

>  
>  	/*
>  	 * Remember the finalized features of our vdev, and provide it
>  	 * to the remote processor once it is powered on.
>  	 */
> -	rsc->gfeatures = vdev->features;
> +	rsc->gfeatures = vdev->features & ~(1ULL << VIRTIO_F_VERSION_1);
>  

But I'm having trouble with this one.  

First bit 32 of vdev->features gets cleared and then bit 0 to 31 are assigned to
rsc->gfeatures.  Why bother with clearing bit 32?

>  	return 0;
>  }
> 
> -- 
> 2.55.0
> 


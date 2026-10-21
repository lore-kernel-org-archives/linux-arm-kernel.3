Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60288606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oz5SjpFl;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hjQkMejx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1m78tWGGeDJIH1O9K2lE2ESdNUNdQQcLVxQs2dYVHn4=; b=oz5SjpFl3Nti4GaSgVkICNqXMe
	dFD6rdKyXq80ACFADpUhT9YRWgn3DgcJ0SUCVAkISo/htw+xcEe+bp6hAPYk90ADHYohMqIHhIpAO
	K31PaMxDomIJZoaVJB1kQBRiNKaSVvOJFy8LRbeI08sUhjI7tCMgspUSx9Hgju3gamOOtXl0fzQpO
	4SCxKFUhAm4fz6rhLiPz8KwvseZeL71MEN6hfjkAGq6rrV//hVaa2hkfEELLC2nH9pwCDhMzTZedI
	U0fNx39syFaWyg8Cc8/MXeCvRmC54+KhmYrmHiW6LtpEzvM74tdq5fS8QNiW/JsDOLTj5nT24OCKv
	bsKcD4dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXU6-0000000C7ew-1ATI;
	Wed, 21 Oct 2026 14:40:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXU3-0000000C7eT-3dDM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:40:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2D3B2880;
	Wed, 21 Oct 2026 07:39:57 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B01FF3F7D8;
	Wed, 21 Oct 2026 07:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792593601; bh=QRNpGsebJ+fw8gymcaKJxQJyRKlhooI9CG4j2vpkYXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjQkMejxD6ErdyhS8yadWEEQeMWR2Tjn9W52QMOWm+Ng9DG6zxtgT5xsnwpiaMU+f
	 3pnKhlIsV15kzsr17226O0yToPuV0g6AvFm+R/UCoWlVjKY3sXLMtD4nkEJ02/VDLP
	 vF9VO3y/nOTKObHpp+Wn30wEtpCELCWIvd2sO42I=
Date: Wed, 21 Oct 2026 15:39:58 +0100
From: Leo Yan <leo.yan@arm.com>
To: Amir Ayupov <aaupov@fb.com>
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] coresight: syscfg: Match feature capabilities
 separately from device class
Message-ID: <20261021143958.GH26205@e132581.arm.com>
References: <20261012230527.750567-1-aaupov@fb.com>
 <20261012230527.750567-3-aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012230527.750567-3-aaupov@fb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_074004_037463_4A2916CF 
X-CRM114-Status: GOOD (  16.85  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 12, 2026 at 04:05:21PM -0700, Amir Ayupov wrote:

[...]

> --- a/drivers/hwtracing/coresight/coresight-config.h
> +++ b/drivers/hwtracing/coresight/coresight-config.h
> @@ -30,6 +30,12 @@
>  #define CS_CFG_MATCH_CLASS_SRC_ALL	0x0001	/* match any source */
>  #define CS_CFG_MATCH_CLASS_SRC_ETM4	0x0002	/* match any ETMv4 device */

It is good to introduce a marco:

  #define CS_CFG_MATCH_CLASS_MASK       GENMASK_U32(7, 0)

> +/*
> + * flags defining device capabilities a feature can require. A feature loads on
> + * a device that matches one of its classes and has all of its capabilities.
> + */
> +#define CS_CFG_MATCH_CAP_MASK		0x0000ff00

To make the mask explicitly 32-bit unsigned:

  #define CS_CFG_MATCH_CAP_MASK		GENMASK_U32(15, 8)

> +
>  /* flags defining device instance matching - used in config match desc data. */
>  #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */

Not an issue with this patch, but CS_CFG_MATCH_INST_ANY appears to be
unused and could be removed in a separate cleanup patch.

> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index a816c22c87bc8..1545d64afec01 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -172,7 +172,21 @@ cscfg_alloc_csdev_feat(struct coresight_device *csdev, struct cscfg_feature_desc
>  }
>  
>  /* load one feature into one coresight device */
> +/*
> + * A feature matches a device that shares one of its class flags and has all of
> + * the capability flags it requires.
> + */
> +static bool cscfg_match_feat_csdev(u32 feat_flags, u32 csdev_flags)
> +{
> +	u32 caps = feat_flags & CS_CFG_MATCH_CAP_MASK;
> +
> +	return (feat_flags & csdev_flags & ~CS_CFG_MATCH_CAP_MASK) &&
> +	       (csdev_flags & caps) == caps;

For clearer comparison conditions:

       /* Class type must be matches */
       if ((feat_flags & CS_CFG_MATCH_CLASS_MASK) !=
           (csdev_flags & CS_CFG_MATCH_CLASS_MASK)
           return false;

       /* No required capabilities miss from the device */
       if (feat_flags & ~csdev_flags & CS_CFG_MATCH_CAP_MASK)
           return false;

       return true;

Thanks,
Leo


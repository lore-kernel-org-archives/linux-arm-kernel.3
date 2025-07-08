Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABBDC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 13:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3jJ8BMukDKm1ntMLDCU6/IXiTPsV5zOI4ZOEY7XVrU=; b=0RYUZBQk0+UlGWLEqW1pEqnp+g
	QDdWMyXCSXF/8CdVUwlc9M57u1LcEvDK2eAAC5W6lnGf7KwK3f8pIPTZHFi+u4GD0mf1Czmq6P4dH
	GENz4z0KgnTKsBa5iCivPV1NcOamOA0ZWxsJ1GhxnJ7JMvylqgB0G7Z+ttPTI9RDH+SU3uYiJw6eg
	axFr0Dz2OgmORkQnuDjm2z1wtbhQq150/6dDGxjrfrnzHqFNnXLqg57u+Pkd63IWotjpsphnyxMUE
	NC/tKSU+6P9RdHwKvMwngnGsVAUOtlzXHIFT0oMTKve3w9AbBS7mi3tbkqw1a0Jzthk+qrwiTzThb
	WuWHoQ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ829-00000005Mtl-25rX;
	Tue, 08 Jul 2025 13:06:53 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7u9-00000005Lm2-2iIe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 12:58:38 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so2919209f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 05:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751979516; x=1752584316; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S3jJ8BMukDKm1ntMLDCU6/IXiTPsV5zOI4ZOEY7XVrU=;
        b=XfCgP3P+F2xpijDtUZiMD9ijFrY2bXUF4l0IjdKZH+Kcfw8Ws6zZka9WZxfUNStet+
         sbQx8Es8BeZ63FrJVhPplWjR18I4paXzITj4LiJhZqVYIGYf0X+7z75nj8Vj3JzSqu3w
         e8BRxiDX9M+JEodYKw1eE26YNd09Ae1T9hchk4Md2gZHjRWaLyKWzjIUARQoXZoHOqqU
         6ivK32z4/gZP6ojdeosP71NWwbpGqv/uqrEx4s+ifpVSNVBCif5rF8ZFSlrPCV7rIeAX
         ACYlERbFNYlezaF/yvM4fJrO54szkwmmGeqedEIJrggVMorvwTHqLkdfYAwHr58kDCa8
         i8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751979516; x=1752584316;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S3jJ8BMukDKm1ntMLDCU6/IXiTPsV5zOI4ZOEY7XVrU=;
        b=Gxf+SStj0wxgZQzGeaPbd7pmNVf7x+0QcPCyaLTC5yeUvGep18pe6OfSwWpjikMBfl
         4Rv1v5Oxs9buvoaEMUGGEDg57j1L4rrx0l7lVen4MTC5XYDSgNF6LZ5UoRV+OHbttPzf
         7syaJUB70LGrjooDO1sKlYwKFcJcYRzM+gmOWeKqke6i+hF5yhvZc3uKK1pok9SzGgEH
         oj9fvEsf3BdYqMH83nmriiJf3KYupkWAejBSuybI3PvuPtLl3vSbZS92HkOanJH3oVCb
         blWUgmgGETRbuCUIaMiSMje2PBqkZ4QPsniQOHLzL1k6iCemd2xqGB/fTDPQN/yDQQIV
         Y7hA==
X-Forwarded-Encrypted: i=1; AJvYcCWKJygpj5MPzzwxs7nAYd0YZ2u7/crVnI0SSuNMSf+JaGHSMGm/822yW+AWK7TmFF8AR3OtljnnJkIrqtz8E3/1@lists.infradead.org
X-Gm-Message-State: AOJu0YyDNIpk7mxaQJUGIRVLNBF0CTjVBOphxGXcjYgP8rew79s3HFga
	5aZZIsYoMxUa8y/cGpnEKRQeTKVIQSkSOBNeikRJIyltpPIQq7iC6ECf
X-Gm-Gg: ASbGncs40HQ56T8QSFJxc5aZLKSaO4NFB/7z1EZI47d71DGN0JbGu1N9jqMCDwVd4dh
	AUfnlzvQQA2r3UI2zOy8fTp3J5jhJixc657c/0X0ZDLoF/WfunvYc4bvztpC7IO3jJiubRbYTDa
	TfvmUIS/oM3LZOsXGmsf4vcG27lPiumlu6l9bRe4/k6mc7WLSEfS8n/eCH7MXNnAWIMsMZohpib
	6wJE/+5HtgmZSAlpvOb5NAmWKTMBtV/ive0DJPTrophxyzoHleXL5xuXFJAVCRjF0TDWfYsMATw
	FQLEFOSx6lngFThKd21tnaRw3Ideewr8JS3CCkYcsAneXStaC4XWcMevJg2dd3GGLvgc7a4GIQ=
	=
X-Google-Smtp-Source: AGHT+IHN7LDQiiQu3mRLFgDwPBd6uS5/8IY+itp6iFFjd+pue4GlyC58MYxMurBFSzPsD4KJPUtVaQ==
X-Received: by 2002:a5d:64e1:0:b0:3a3:70ab:b274 with SMTP id ffacd0b85a97d-3b5ddfcea37mr2397438f8f.12.1751979515491;
        Tue, 08 Jul 2025 05:58:35 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454cd43f0dbsm21985665e9.5.2025.07.08.05.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 05:58:34 -0700 (PDT)
Date: Tue, 8 Jul 2025 14:58:32 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] crypto: sun8i-ce - remove channel timeout field
Message-ID: <aG0V-P_Zvlzhi2i7@Red>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
 <20250626095813.83963-2-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626095813.83963-2-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_055837_681771_AF07322B 
X-CRM114-Status: GOOD (  11.53  )
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

Le Thu, Jun 26, 2025 at 12:58:04PM +0300, Ovidiu Panait a écrit :
> Using the number of bytes in the request as DMA timeout is really
> inconsistent, as large requests could possibly set a timeout of
> hundreds of seconds.
> 
> Remove the per-channel timeout field and use a single, static DMA
> timeout of 3 seconds for all requests.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>

Yes, timeout was strangely handled, thanks for fixing this

This patch is:
Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Reviewed-by: Corentin LABBE <clabbe.montjoie@gmail.com>

Thanks
Regards

PS: I started to review all patch one by one, sorry for being slow


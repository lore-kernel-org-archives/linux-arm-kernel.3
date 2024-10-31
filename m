Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4931E6895E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 08:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUDcheiK8JhqH6/QyyEKBcuyjmkqcu9I4AhzOv/eO7M=; b=Q6Ivioz8F5hkU/B4kfWZt5c1fD
	ecvqbzUIzQS787nOyzBX4cYzaCZv8OiALdNtDg3O88nTkrktr0nER8LhS9f46xNcB/WTPIdiL2vcl
	FeOGLaG/qb1NuYwPJVkND23ZzwscI+xGq8EHw0bmd/22YTM71hlzt0HwMVwWFXL2p7ZX1rDWJBBtv
	cWoCZBqY8eqSNhzZPK0b18E+XTTZuVtHVUotG5kfuxqRTJn4kleLnjUmrpPm0AnXugecEZEnTFjM2
	7sA+x8gpCT9FQk5QmwaNQcWj5rpJKFiMEk19vfcl7xJtPbUjjB+bloZL9o5eWasirWwZysXCdJrzf
	Veti5imw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Qz8-000000030eY-21SV;
	Thu, 31 Oct 2024 08:56:54 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6QxU-000000030Xs-0Uj7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 08:55:13 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso9090931fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 01:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730364909; x=1730969709; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FUDcheiK8JhqH6/QyyEKBcuyjmkqcu9I4AhzOv/eO7M=;
        b=NFI/LzW6qm4y6TVDpEcGWPaJdnWpOzkrMdUwI16nqV2WxsJk3pQSryKcwNOdYxk31N
         pg8T8z4u1ES1roZEJ2W2D7EJq8hHYcK8E0g0AuwvpUrjqd6w8F3VtJXSg1MqFpEmpBuc
         3O04FjdMltOGraRohXAULF7RsdBaUw01iJ+3t0Ze25/PyJe5wdKpEnGnf0i+nNETovgN
         2OIqxR5KyUV9FU0yZEcpIOxE5wwnh6FgUspWR08/4pLYQ4n5vXjHBbSD9jpRd/z0yW9e
         ecNBL9P5elR09ikb9N8HcKn0XbRN8LQu4yUpftCS2/rtDFspGsVStwAF8GfJQqRCd0jG
         AP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730364909; x=1730969709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUDcheiK8JhqH6/QyyEKBcuyjmkqcu9I4AhzOv/eO7M=;
        b=fYZFcR8zsrJA0ICvIxiE8AOszpLbSrcl/Ga9i3e5D5+lNvr1FtYMaajFFDRgA0SuOu
         0lGomI9p/ru2BIRPeyOhlkGw8FzlGl1KtCDElx1m0IoRVdbp2mkE2o0knWYNdnE1FOZ8
         eZ+rYkxb4WBKJdYa59pZ0Kj6f0yPoICzHz0n5IxuN0EIAdsTpaEKGeW3f8kv551jPgI+
         tTQSXNIaHYYACuVSZKxoSylM2XxrqKOq/uBH7pkI5gWgZWZJ5itPpGo7yjOBfQJlTLox
         2PeyvKv4Me16x/PzdgkvCpfOX62LnShzxC9egBNA6GiN1MffioNQrMMgfQRejadXgTcD
         Gr/A==
X-Gm-Message-State: AOJu0Yx8Ue2RzRbtJkHpMeNUvEcKsanciKNeWJ0gv4Krj/R2V8Yp/89J
	pn+sjkPXRNalKrdSWCqMW4HN0hXfmP7JJVgwkyVzAvQDJqltFH4GrtEXo5O52DA=
X-Google-Smtp-Source: AGHT+IFBFiCfVxYlwTElhQ9iaN5niEh2RqNjHdUElsmI/f4MFMMrn30OPEc0CN4b5u1SgxFe8qNHmw==
X-Received: by 2002:a2e:a984:0:b0:2f7:7be8:fd89 with SMTP id 38308e7fff4ca-2fcbdf61db9mr168289041fa.6.1730364909453;
        Thu, 31 Oct 2024 01:55:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1189123sm1440859f8f.115.2024.10.31.01.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 01:55:09 -0700 (PDT)
Date: Thu, 31 Oct 2024 11:55:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	lkft-triage@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: next-20241028: gcc-8-defconfig : ERROR: modpost:
 "__aeabi_uldivmod" [drivers/media/dvb-frontends/cxd2841er.ko] undefined!
Message-ID: <456c79d2-5041-47c4-bed2-44d257524ddd@stanley.mountain>
References: <CA+G9fYvvNm-aYodLaAwwTjEGtX0YxR-1R14FOA5aHKt0sSVsYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvvNm-aYodLaAwwTjEGtX0YxR-1R14FOA5aHKt0sSVsYg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_015512_190692_8DB4AEA4 
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

Is it possible to tie this to a commit?

This is a u64 variable getting divided somewhere or maybe the divisor is a u64?
But there haven't been any recent changes to the driver so probably the change
happened in a header file?  I looked the differences between the preprocessed
.i files from before and after and nothing jumped out at me.

I don't have a copy of gcc-8...

regards,
dan carpenter

On Wed, Oct 30, 2024 at 06:53:01PM +0530, Naresh Kamboju wrote:
> The arm builds failed with gcc-8 on Linux next-20241028
> and builds pass with gcc-13.
> 
> First seen on Linux next-20241028 tag.
>   Good: next-20241025
>   Bad:  next-20241028
> 
> arm:
>   build:
>     * gcc-8-imx_v6_v7_defconfig
>     * gcc-8-defconfig
>     * gcc-8-omap2plus_defconfig
>     * gcc-8-davinci_all_defconfig
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Build log:
> ---------
> ERROR: modpost: "__aeabi_uldivmod"
> [drivers/media/dvb-frontends/cxd2841er.ko] undefined!
> make[3]: *** [/builds/linux/scripts/Makefile.modpost:145:
> Module.symvers] Error 1
> make[3]: Target '__modpost' not remade because of errors.
> 
> Build image:
> -----------
> - https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/
> - https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/build.log
> 
> Steps to reproduce:
> ------------
>    - tuxmake --runtime podman --target-arch arm --toolchain gcc-8
> --kconfig defconfig
> 
> metadata:
> ----
>   git describe: next-20241030
>   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   git sha: 86e3904dcdc7e70e3257fc1de294a1b75f3d8d04
>   kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/config
>   build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/
>   toolchain: gcc-8
>   config: defconfig
>   arch: arm
> 
> --
> Linaro LKFT
> https://lkft.linaro.org


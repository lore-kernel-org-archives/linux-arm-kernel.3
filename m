Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2E2C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 18:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMs0KQ2xoYfGwipz0GcDyzvKZDx/2Bps5YmVJfONNew=; b=oaHW5IF5bIZsWmUDU8dT8ToVDZ
	DczsJUv7e+ecsJ3119a1mSpBhIrryFJvoNrLQYXBMq8nqvJWJi4B1kVzzsNB4sucmTR+ReVTBr2Ll
	EaL7E+IMKLJLaAcuS+9uOkM+0gYhHWPU5uf/50XgXHcwDuMbNlpIOlUCtk+z4TkyQV322sz2gy+4i
	s4bQx1u84aACCCJ0eGkMFUgGJDNuFHu0FxGudgFnz85DdSDqUMmu1z62MU25cZfIBnIbJ0MGuB+iq
	BAHs6sU+GeyX3RyaW8FnosNceNwzOc2BWrQKBzF3T7xup6B4h4bpEBbTO3E65YauUP8oSjhHswwaT
	/3vMy4nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEwg-00000003eSP-1Rwu;
	Mon, 17 Mar 2025 18:12:14 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEok-00000003dAc-44mT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 18:04:04 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ac2a9a74d9cso969930166b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 11:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742234641; x=1742839441; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gMs0KQ2xoYfGwipz0GcDyzvKZDx/2Bps5YmVJfONNew=;
        b=Nd3OmiNGyAE00NASWYm2JZecCO2AOCg59UdDw9aoi/q74Jdmka95Jhrbbj2HyLLciM
         kCPgEg4LfVS3mDwhqkhcLFMhK/faWjWlAqIoA6X7VCLoTni6xIIfLHzpkXXjsJZQz2RG
         1BBWkmo21GBZkiAoKKMrO9IPmU1ElKN4goxww3RQHcBkPOKbmOYvOPPgWwK3Alb3Zr9S
         oPb5mK5Z8n2d406e0bGCbv1dPL7gQjQq/zCJRAAd3mwoSrLSSqmqur/Lg2nfXfKBwW7y
         /dlOFxZ53nozSuTYsg206m6X/QrdDUAfCVbrHqb202jDysdVqLmnUkB3X1e6rG6WOTn1
         Fjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742234641; x=1742839441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMs0KQ2xoYfGwipz0GcDyzvKZDx/2Bps5YmVJfONNew=;
        b=btoxXjqiw9KnEWuBEr34mvOmG+9GDqp9n6S2JWfUO3C/Uy2QyaZbuf9xE6b5qtNLnf
         rlQ5byfnTQsEFIPQRVhzzsQfskL+rWlW+OF5+wzIv7Z4BZa7oSB1GlrrJJ3YQjXTk+sv
         Lbmf8JQQL/gADodYbQp4Rcu2NmdLGwFruQHMmsi8E9M+qTVR4c/ybgaBESMUtYpKPUyM
         9VKdvU2WQHvRV6vO3BHosz5QnptqqXVwO68Ev7eqnABi5m5zs09xnEkiLVMTvIZxXWSq
         wtbCdOpj7hlTJSY3foUgyie4bW5SeqqfGnbYzvGVETCzAfKs01WdKtZ9e9WHFgPvb0L6
         qx+A==
X-Forwarded-Encrypted: i=1; AJvYcCU8/gLNKDwKhVka7OPLvij0TuqoF3Kxwz4qfIuUlM50LB6YBZgs5llu4OsnnTLdLbKdp6/PDNPrOuB/VyOHSYqC@lists.infradead.org
X-Gm-Message-State: AOJu0YwIF2P+Lwy85E7GIGa6gEATDnjfkf0kQi3eMUF9YFTu8Y9hJ5x2
	6Q0cDwIoliYzesTeopJp/3/1iLWh50fpDsAjRH0U7nr83zDrC9SefuvsUQ==
X-Gm-Gg: ASbGncvXvenZr4bqHUZdiwDE/ewTKeeJDAl7kgcblXBzg6FA0IcC/83kMAXT5xENszO
	ByOazjArHrrGzp3hQhGrN0ukuJYeNy6dGN1BZGndj23smz1WyDVCveS0AepTo1CLC31fasw8Dpu
	MfaBGisZXxBqP8DA76nqJUxwoiaYQZayYYo/J4JW95fgXnGI0nRWCoklh7o+ngDmz7qnclsFcsU
	Ci1bqtLQBSkIsMg6rI7gKGuhuU3+QLetV+jRzQuDdK8NYr5SPnSPonP+QerM2GFJEOMfFxjxXRw
	oC3vl7DtsPiNggYA1pXZ4AVCabJ5baeMDyeS2hxfQd2c79rs8PaTW219Ov/sOp3rAQHRnu59/sn
	UFB8AEgT4m/i2v9TF0pXTX7YT9G1LWdL5V0jBPXZSf/wsgMoqUTnKAQ==
X-Google-Smtp-Source: AGHT+IEqHcYMxvD4RWbMqL7gZkeMlgl4L7sidotxxKm051Mjf5HVCCNTwf97wRSQF+aZjoUe1nGS6g==
X-Received: by 2002:a17:906:6a0a:b0:ac2:b414:ba2a with SMTP id a640c23a62f3a-ac330376bb6mr1524996566b.37.1742234641045;
        Mon, 17 Mar 2025 11:04:01 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-95-252-211-62.retail.telecomitalia.it. [95.252.211.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cdec8sm705009766b.112.2025.03.17.11.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 11:04:00 -0700 (PDT)
Date: Mon, 17 Mar 2025 19:03:58 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: shawnguo@kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: OCOTP and DWMAC builtin modules are needed for imx93-11x11-evk
 kernel dev via TFTP and NFS
Message-ID: <Z9hkDqcKG1xOmIB5@alb3rt0-ThinkPad-P15-Gen-1>
References: <Z9fhuVltKwqgHdLp@alb3rt0-ThinkPad-P15-Gen-1>
 <935028c6-ce56-46e0-96ff-46fa91c8f66a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <935028c6-ce56-46e0-96ff-46fa91c8f66a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_110403_013154_17DD0A88 
X-CRM114-Status: GOOD (  15.94  )
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

On Mon, Mar 17, 2025 at 05:07:26PM +0100, Krzysztof Kozlowski wrote:
> On 17/03/2025 09:47, Alberto Merciai wrote:
> > While playing with linux-next and imx93-11x11-evk via NFS and TFTP
> > I found that the dwmac-imx, nvmem-imx-ocotp-ele drivers by default are
> > not builtin then the I was not able to reach userland. 
> > 
> > The following configs were needed to reach my goal:
> > CONFIG_DWMAC_IMX8=y
> > CONFIG_STMMAC_ETH=y
> > CONFIG_NVMEM_IMX_OCOTP_ELE=y
> > 
> > is that something expected?
> 
> You mean they are disabled or you just did not put them inside your
> initramfs?
> 
> Best regards,
> Krzysztof

Hello,

By default they are enabled as external modules, then until we don't
reach userland they are not loaded thus eth and all the mechanism behind
that are out.

I'm not using initramfs just tftp and NFS as follows:
setenv loaddtb "tftp 0x80400000 imx93-11x11-evk.dtb"
setenv loadkernel "tftp 0x83000000 Image"
setenv netargs "setenv bootargs console=ttyLP0,115200 root=/dev/nfs ip=dhcp nfsroot=192.168.1.3:/tftp/root,v3,tcp"
setenv bootcmd "run loaddtb; run loadkernel; run netargs; booti 0x83000000 - 0x80400000;"

Do you think that initramfs can solve that?

To be honest I was expecting to have a builtin driver for eth by
default, so that NFS and TFTP can be turned on without caring about the rest.
But for sure I'm missing something  there :)

Thanks,
Alberto


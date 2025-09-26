Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC684CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 15:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7Baoif17kvHRJvWC6HYyOG9IuJ9PffDdtqs0FozkFg=; b=bwFt9C/Vn7a/cxW6F+APd9E1jJ
	BYhvDw+jrCJkOj7VMf4LRKQbWMDgY3c5eFi3301GMWdfigPdgRQwfrq+0eTXTaCkeLJ9xC2mHkCL8
	lGBzxXQo91mZiMHbXjHTbXbB41LHv35G9EE9xTbEGnlBSYnRmW08LLmacfE4SCHJwU2htFxq1UHC1
	u8TDMZt9es3/bhqNoq5zRsfr8CkBw3SeC2KAoFDSCfMGSQuTboQsdz+f49SkO2uOS2++MsO6eBn1J
	Bbo+sLNFqp4/rHTirlWRpTRNuP9UjACY0cfFOeQXSlQS/h2Q1jeRfMopy/7rUnOUrwYL5P95FPwgS
	KekH7OVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29xg-00000002FDy-2Hl7;
	Fri, 26 Sep 2025 15:02:16 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29xd-00000002FBB-483C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 15:02:15 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-46e2b7eee0dso64615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 08:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758898932; x=1759503732; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s7Baoif17kvHRJvWC6HYyOG9IuJ9PffDdtqs0FozkFg=;
        b=CvhyGr+OjUi3EEGv+8XVcklA3vhXgp/lwHwgAPYk0pVRoFwZ9gAI+4SJxTAroXd602
         RjXdlXfmHCWfh46zaMs3Erz2wA2PC+jBY65d/S1/vpQOlr1BdT1P/b24dhHWlNVIZ9BC
         tW73cfNhCBPtXZnEn6zszQ3L9GKkdRfjhZMbS6SHdDJb1f+TcUAge0dbku8biuA63fC8
         jGTUuvVTCINO2ZQem+vjA+JVvCPGvVOl0QzXzLC3tRtVFbbA5bXmYo9aD8XsmMuIAzJK
         y9aXjFTtme2A/gy+OkHS6L3EW3oxNLLh0N2ED9Bfm/y9pRQqw/5pa2ouKcHvYNfqTzPg
         pLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758898932; x=1759503732;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s7Baoif17kvHRJvWC6HYyOG9IuJ9PffDdtqs0FozkFg=;
        b=o3soakYYBJe8u2/OWB6MzFjnJsxJthTAfdVu4cTWkkfEiheiL/ZBrxxWub9Xt/3y/S
         JtI/iJFJ7CDJ7CkJBNVSTlUivzbUt9sXtt49PV21SoQS9el5AlunXsh93nBgK/wN8P+g
         JxuPO4zKfHzsczSFdN3nGu7M+m83aJuvOz/XJY2AYgtACHg7wskD86VmtXmp2vq6dAIO
         8XB2DXr5RdT9gFdWmg1XHlArmPKLdpZ0y1z6lIbubpk38w+qLzhnP8lZ5pQ0kikxcvS7
         RYM0qq6c/ZRvPkoRW56i56Hes1vyMEyjeCGY+JWDSuSVarF4wHUfG655+8w2c68Z+IsG
         prEA==
X-Forwarded-Encrypted: i=1; AJvYcCUV1WIZJr+Aktm0gpDGILx5zfBXqEx/DaWwLQf7TrfEYHCwrFUGFxe1NpZC7I5YgOK88aoPGY2YkE04Ax2e6b5D@lists.infradead.org
X-Gm-Message-State: AOJu0YwQhGpt2y3jh3jtofmxEdeLxg0dKGXRV2JdjzesybBRKS0Fo8Dc
	tHsjR1kR+kuAybPHkErTgEXn9LYYOFRUjfXDPpSzHrdWH8NJBiFixHij+iYLImsVuQ==
X-Gm-Gg: ASbGncspyjPuDBgqfR2QaXafzhhfMWU+WBC/k0VHZjheUZZf6Wy1xdD7URYat/HFTjB
	+eVzURN15FV/M1rHCCvkpdDWf//s85fNAtWFHRO7LThIA5AFvLfADq7nz0wSv7uE33libgjX6jI
	a3vH3WzIkFrDKiL8GAPv9rmUt6sm1OtK7WibaXJjOQLleVhUVCXdqTipkm9cwTr/OYO09cab4Km
	bJSb0ytFWFUjsMO1CmH/h+tzYcRIjViw4FDAFPOY++IP+M6McZTUMEtoBaOxNL/r0UZzGpdP/TK
	K4iWdFO2EUaz9ls600qa6NuQfZApR92mnAhqek75zPACp5o6JF5c3kfNnctFqP8xqNutHcgchuh
	0heciQxFdJT/wnG2u0VEtdc0D7YC0oZCk6NeASHqauw3dQXrdRDMpmdipBdjk3TewS03oNYVONl
	YL2w==
X-Google-Smtp-Source: AGHT+IGGXmNBTu4UEfqjidL+GDIizhadTfvXaAwFgVVLBzv8UsZYzurqe8WWNcR71jr76VBG7flshQ==
X-Received: by 2002:a05:600c:40c4:b0:45f:2e6d:ca01 with SMTP id 5b1f17b1804b1-46e3b009830mr1290175e9.4.1758898931549;
        Fri, 26 Sep 2025 08:02:11 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a9ac5basm141572865e9.7.2025.09.26.08.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 08:02:10 -0700 (PDT)
Date: Fri, 26 Sep 2025 15:02:07 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: devicetree@vger.kernel.org,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	linux-rockchip@lists.infradead.org,
	open list <linux-kernel@vger.kernel.org>,
	Rob Herring <robh@kernel.org>, krzk+dt@kernel.org,
	conor+dt@kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: Re: Support for Rock PI-4b
Message-ID: <aNaq72xKS4QaNjwx@google.com>
References: <CAFgf54oYjUEg9KkQUzneYTZH1Z8cX56va5M0853eWPFaYT+Z2A@mail.gmail.com>
 <638b9565b90714f56caa9535b7b9b96cd86100d6.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <638b9565b90714f56caa9535b7b9b96cd86100d6.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_080214_060445_DBE2A955 
X-CRM114-Status: GOOD (  29.36  )
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

On Fri, Sep 26, 2025 at 04:28:48PM +0200, Sjoerd Simons wrote:
> On Fri, 2025-09-26 at 15:07 +0100, Mostafa Saleh wrote:
> > Hi,
> > 
> > I am trying to run Linux[1] on my Rock PI-4b, which I see is supported in
> > the kernel in “rk3399-rock-pi-4b.dts”.
> > 
> > However, compiling “defconfig” (ARM64) and flashing my Image doesn’t
> > work,
> > It just hangs before any console (even with earlycon), I tried to also use
> > some of the vendor configs with no luck.
> > I did some research and found that [2], which indicates that the upstream
> > support has been broken for some years?
> 
> We've got the Rock 4b in our automated testing lab as part of kernelci and other
> efforts. Upstream works just fine on those boards, so it's likely an issue in
> your setup.
> 
> See e.g https://lava.collabora.dev/scheduler/job/19978558#L525 for a recent
> upstream kernel boot.

Thanks a lot for the quick response!

I can see some differences between this log and my setup.

1- My uboot seems ancient
   U-Boot 2017.09-00026-g2431fa34678 Compared to U-Boot 2024.07-rc4

2- The board model in this log is not 4b as mine
   Model: Radxa ROCK Pi 4A while mine shows Model: Radxa ROCK Pi 4B

3- I am using LLVM not GCC (I don't think that matters though)

4- I am using MMC to boot and not TFTP

I will try to look more into the differences, and update this thread in
case I was successful.

Thanks,
Mostafa

> 
> Regards,
>   Sjoerd
> 
> 
> > 
> > Has anyone tried to flash a recent kernel successfully on it? or any
> > tips are greatly appreciated.
> > Otherwise, maybe it can be removed to avoid misleading other developers
> > (I got this board to do some upstream kernel development on)
> > 
> > [1] base: 4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4
> > [2] https://wiki.radxa.com/Rockpi4/dev/kernel-mainline
> > 
> > Thanks,
> > Mostafa
> > 
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip


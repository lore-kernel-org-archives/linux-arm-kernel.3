Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FD2C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 19:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQDBp5VUuXQxeHvKepRV8hD89886c1C3X6r4opw27cM=; b=37oG/M7gA/d0/I6/+TtW2PXO4o
	KwCI68TJQn3hGn/YeGGneGTJ8SpqeV5NPt4UR4pGZx6QzxqLPLPGvMcavKSZ7ss7HEY2sQ5TMXhI4
	j9w5bOdsr0Jbtpy/ZAdRmOyJwDk1N4jWahSmW+X3bFItpZ1Owr4fe/t72O0e56oIlGzdHgI9BZZ3V
	yRe23GWDt4DUEoc5LuZPCQtSjQKB310xHgT1jx2F0SHEL07GKSonN4lzU3KavclkyYAhCKw21yGsy
	LFLdVy5V/I4+TSz/e0eqJViSvblGgyVZfE8HPP4vnhxRL5VV4Ud8eWYx445u3p+Vkzmj8vKY18HzN
	n46jtZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFia-00000003lvz-0V64;
	Mon, 17 Mar 2025 19:01:44 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFgt-00000003lc4-0bAL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 19:00:00 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aaecf50578eso885944066b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 11:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742237997; x=1742842797; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yQDBp5VUuXQxeHvKepRV8hD89886c1C3X6r4opw27cM=;
        b=YYTA8iH5C8xhmsMxFfRHl/dN06yNZBZvis5EWyoz64blUu97XzRQ0XrHv25JsWCA1L
         bb5lqwEZZHX/MALRDe4s2PVRCqH2ixf7W/1hMnBm+datFdOrYJBh4JILa3NFN1WS7bPC
         JhZLzNynTw2eGQBF1YizgP3cbcTJRMUzvd/ucThMNJic1wuq/QIhp0iWYne/ziv50HSs
         k/k64LJi5QOZOqC3UwATBCV0kKlf45LOrZ4v9tBm1aK8ulz26RRq9/FqA2WA+rjtMLtz
         bsF3doQEkvD90foF6vvhMFd/nSk3hsJ5O/TeSfwMeKmNyh/epztp3MpaJiyvHPtqNYTK
         onFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742237997; x=1742842797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQDBp5VUuXQxeHvKepRV8hD89886c1C3X6r4opw27cM=;
        b=TFkL8MH4Kft8Bn/k/RZlDkPeYVk5YwEy3cTcR4r+g7JLgVmwTe5glWi9zXMeWNzpeR
         yTu3QbFsJkaFciQJuUKluIrjBVmsF4AuzDACkJY2iy0fv0dUeB65nU39QLya4eUTWyn6
         KqogJHmpWTUNdOeHyN8NbOP2mwkMO/EeH0U89NJCh57UFS6cHaPw8iDB6xQcR9LtqmHB
         vXNfRWcbt1x85k5sliLhSrWeaQITjkBifjnvs3MaF/7MGqZR1kNcX8NDnE0uAcALMV5+
         XB6sr/cNmUpgY3unOfk5+ScOjVqVERueOr//u0Y6zDa6Ef9QPd0sXGMiB5Xr8N3Hndod
         ym+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuGeLKc4R+wRHoeFD/EeagBv+Fh9f/hSl/NE1csBRRzlKhI0UZ10Yoc+bQWvt696kbETakKdJLlupwsMklIkaW@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkq/3/mMJfLysmiKK2mW4CrJco0kYWiTjG6rQEItYwX6O1+R2U
	tuSWmCRUZmzvruloI9hHsMMr0T1NicIjGpK0m9aPQIz2n3nztuai
X-Gm-Gg: ASbGnctPXtVtkc06dCh71BEAlcXLgERpQ6eyUmMejFSwj+Myxq+oJYz530f/En1kJIO
	2tpRP3r61eWToJt43meKT63F8L/xL/SjAFPvTT9lnudhkvJjSQj8eZvjUXHzwEyzm+LYGjCrRfu
	uNWTvdW+ooGK6fDpBjlnzpitwNAyEoWl6jfLoSbmt+svQEAYOEHdVpyeXCxYHAQOxAzlXrE99I2
	CbvA8QWtIsAPER8paFFlL5cR3iy6mHJDKulvvVfwGKBgQtjIO/48ZUlXtohcZWWLUvJNcny07Oc
	IHa+7IC7zIsBv9wOlMJCjIEMDRnXu7ZsUHSYn6DUZcvuJUoEBbU3Vl5nJqaOzlL/QU7k09sfq1F
	gl7rJXflTnN0EdaGkNHyRsZvVJydPUCTvdhrYOYGKzrw=
X-Google-Smtp-Source: AGHT+IFI1RWc9drtLC1fsHugfGd+lXgvlP4qcKYD8ut0s0vnKJhFgSJfeW2USHvPBOFlVUHFJkS8tA==
X-Received: by 2002:a17:906:99c4:b0:ac2:b8ce:90d5 with SMTP id a640c23a62f3a-ac38d514ff5mr69895366b.44.1742237997088;
        Mon, 17 Mar 2025 11:59:57 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-95-252-211-62.retail.telecomitalia.it. [95.252.211.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147e7f11sm704655566b.42.2025.03.17.11.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 11:59:56 -0700 (PDT)
Date: Mon, 17 Mar 2025 19:59:54 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: shawnguo@kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: OCOTP and DWMAC builtin modules are needed for imx93-11x11-evk
 kernel dev via TFTP and NFS
Message-ID: <Z9hxKlrrqW4QyzdJ@alb3rt0-ThinkPad-P15-Gen-1>
References: <Z9fhuVltKwqgHdLp@alb3rt0-ThinkPad-P15-Gen-1>
 <935028c6-ce56-46e0-96ff-46fa91c8f66a@linaro.org>
 <Z9hkDqcKG1xOmIB5@alb3rt0-ThinkPad-P15-Gen-1>
 <ef163f08-35f9-4d1d-8082-c826c6cd0aa0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef163f08-35f9-4d1d-8082-c826c6cd0aa0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_115959_184848_7AE75741 
X-CRM114-Status: GOOD (  24.42  )
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

On Mon, Mar 17, 2025 at 07:12:55PM +0100, Krzysztof Kozlowski wrote:
> On 17/03/2025 19:03, Alberto Merciai wrote:
> > On Mon, Mar 17, 2025 at 05:07:26PM +0100, Krzysztof Kozlowski wrote:
> >> On 17/03/2025 09:47, Alberto Merciai wrote:
> >>> While playing with linux-next and imx93-11x11-evk via NFS and TFTP
> >>> I found that the dwmac-imx, nvmem-imx-ocotp-ele drivers by default are
> >>> not builtin then the I was not able to reach userland. 
> >>>
> >>> The following configs were needed to reach my goal:
> >>> CONFIG_DWMAC_IMX8=y
> >>> CONFIG_STMMAC_ETH=y
> >>> CONFIG_NVMEM_IMX_OCOTP_ELE=y
> >>>
> >>> is that something expected?
> >>
> >> You mean they are disabled or you just did not put them inside your
> >> initramfs?
> >>
> >> Best regards,
> >> Krzysztof
> > 
> > Hello,
> > 
> > By default they are enabled as external modules, then until we don't
> 
> So everything is as expected...
> 
> > reach userland they are not loaded thus eth and all the mechanism behind
> > that are out.
> > 
> > I'm not using initramfs just tftp and NFS as follows:
> 
> All arm64 platforms are supposed to use initramfs on defconfig with
> necessary modules.
Thanks a lot, I was not aware of that.
Do you have any reference?

> > setenv loaddtb "tftp 0x80400000 imx93-11x11-evk.dtb"
> > setenv loadkernel "tftp 0x83000000 Image"
> > setenv netargs "setenv bootargs console=ttyLP0,115200 root=/dev/nfs ip=dhcp nfsroot=192.168.1.3:/tftp/root,v3,tcp"
> > setenv bootcmd "run loaddtb; run loadkernel; run netargs; booti 0x83000000 - 0x80400000;"
> > 
> > Do you think that initramfs can solve that?
> 
> Yes, that's the entire point of initramfs.
Let's proceed in that way :)

> > 
> > To be honest I was expecting to have a builtin driver for eth by
> 
> No, why? We built as much as possible as modules in defconfig. Otherwise
> it would be impossible to actually boot that image because several arm64
> platforms have limitations of boot partition size.
Cool! Now is clear.

> Best regards,
> Krzysztof

Thanks,
Alberto



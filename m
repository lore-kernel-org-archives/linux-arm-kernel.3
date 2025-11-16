Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D522CEBF88
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 02:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkXB0RiOx00wRtlBivyr40k1pXaqD5wN/4yTU+LCQbk=; b=M9S5l1EkhhiACJ9cYm5vV3YW9h
	igdbZqFEMnzFmsglJ04w+Wdvured2yoz6dlW/7I3kfdGxNHCtkp3SSUdnGC/KvnkrRnVvRbQ6bhDg
	z+/lUPodSxrnJrR+5qN7H7M48f4Ka38tb9JP81jNqJn/PP2umAhTb7Y7bEOKVGZbXqrYoibHA+Ajo
	ImHbjKzhlWgp5bvyj5+TDPmcPPqCImHBYxy/niavqQEfGSvHtxPPNo36ykf9tfHXir9UNsXdzYHdl
	7CgRZronlIkghrYPmJdoSBFjuIBl2VDrL6WOzmLi0LNkJtLSicMkxT3ytOMx6P3amCkHUNt9cYx3p
	hvdu5JMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKS6L-0000000EIOh-2fPP;
	Sun, 16 Nov 2025 02:02:49 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKS6I-0000000EIOJ-2A0q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 02:02:48 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8b2dcdde65bso106649985a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 18:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1763258565; x=1763863365; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pkXB0RiOx00wRtlBivyr40k1pXaqD5wN/4yTU+LCQbk=;
        b=iSUoO2F2/F0hRluom6udzTj9bQxxOASoQi4CPjl/NZMihRgNvAy/FLP2aVoKqxUaLD
         jahtJdMgdEN83IIDpw9jVnW0XbXFHwMVAeiq3783UuPdEFknL89/wgTCfJrOAfYkYbAS
         DT9abcqYTs5T8u01F3rCjnqDFBSxqq35PlhC4mMkqNq8n++ox45bRSIFtQnM0iZm0Ksp
         OyMDFYWHzYFiWrmRxO7wgxsSLwA835eGmRP6MXY2DN1vJF/reM1CcRGtxc/77aNNICkz
         qM8cSuZpICQUksnhb15dvyirQfD24PRFeG2VMcXnQLn0SsI7vgHqd3KlWLOsQPmV8A8Q
         yv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763258565; x=1763863365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkXB0RiOx00wRtlBivyr40k1pXaqD5wN/4yTU+LCQbk=;
        b=A/LJKEseuEZWz3vpUZWyANueB/au7vm/TNnwTmJ/YxEsAbNgxgGGBjFX8P5WdtY74l
         6N/7XEY7L+vdvfq8/h2M89nlko+LS/qaf1Rar1pFgAMREh/6XR5eGXKdJghUF1yC/oBB
         gHrK+CyqFDe3ITpdg/+jC1WONH1k8z09aIXqh+6I3ENLJVTLq2NfhOIpWj87lJb8tcZY
         +rDUKQDB12zf66OybYK9PuoAnJVAnXFew2J4Jhw9ChuEtVQzLdIPuMyx554xCOOYytNa
         MEEYNweUBY7yLUqu6p6Ffe49dC+LtLunvlrSturqkDqaiaJxuqXv3ccYd4ZmVoBXPWQl
         z7WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpdacyYY3wPiknY8kMVE1AZVMxee3Qnu415Jn2Xht3JTJ1eSHGx8Y4Vvjk3ARHHOGi2601XEKAezFNSn673h4Z@lists.infradead.org
X-Gm-Message-State: AOJu0YzqMwM0G60riNEHds5BMBRoEHhsapKN6yuYRZVyvdwoUbXnoEVf
	/zRvF+1kodtOQbLuQd3oL7IBasbwLE01nkDUrNvP67sK13IgDsLqfjTxW0Z26bgDbQ==
X-Gm-Gg: ASbGncsLMFN37xXGBlIIAcLSbL9PBXVSveUlcH5nV+zhBGmqHSqYlF80at5tbq2Z6yv
	7W8Ixhmm1nDr648ZnUu0UyTvNct7Fuu0+hi48XX34p5BFexwg4iYj44EJd6HL5QLFDxFXp08LOx
	s277Z3MsflGx8lwzsv+koO4Kks6YylAyWsc6mDdVW0YiVZjT3E3MFCExi/FJEpE34L0NrWO9dvC
	IuI8/DT5XT4T0MksdT3VaHEdHx6lhG4KpLIIhZmMoQVAcRzC567T/Kwxj4MHk7wdZXAn/CISBug
	NMzlWNdxq83tNtY8GfCVpF5mB/yNtemoqq17IQJ0l+8Ct0he8rppPQe71BzrkO7zGMpzR6N27kZ
	uCLs9PPQLoX6//KP44hiQngdwl0ANOxG+rIGzGuhlCzrpEet/gXL4SRLN1jjh/xLXRokzshRNZF
	7SYQ==
X-Google-Smtp-Source: AGHT+IGadHCqqKWDl62JvuYVsXnkpYDC3mZv4xvz6u4dz1J6qc7Ey4fFE9duNHKyg1jQsybJWUGC9Q==
X-Received: by 2002:a05:620a:1aa5:b0:8b2:5649:25ef with SMTP id af79cd13be357-8b2c31585a3mr1026069885a.21.1763258564892;
        Sat, 15 Nov 2025 18:02:44 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::db9a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aeeb4afbsm659488785a.14.2025.11.15.18.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 18:02:44 -0800 (PST)
Date: Sat, 15 Nov 2025 21:02:40 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Ma Ke <make24@iscas.ac.cn>
Cc: vz@mleia.com, piotr.wojtaszczyk@timesys.com, gregkh@linuxfoundation.org,
	stigge@antcom.de, arnd@arndb.de, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, stable@vger.kernel.org
Subject: Re: [PATCH] USB: ohci-nxp: Fix error handling in ohci-hcd-nxp driver
Message-ID: <69b9818e-7db3-4c2b-80f2-29b8170a95eb@rowland.harvard.edu>
References: <20251116010613.7966-1-make24@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251116010613.7966-1-make24@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_180246_926146_11FC9746 
X-CRM114-Status: GOOD (  22.52  )
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

On Sun, Nov 16, 2025 at 09:06:13AM +0800, Ma Ke wrote:
> When obtaining the ISP1301 I2C client through the device tree, the

What if the client is obtained not through the device tree but through 
normal I2C probing?  See the isp1301_get_client() routine in 
drivers/usb/phy/phy-isp1301.c.

> driver does not release the device reference in the probe failure path
> or in the remove function. This could cause a reference count leak,
> which may prevent the device from being properly unbound or freed,
> leading to resource leakage. Add put_device() to release the reference
> in the probe failure path and in the remove function.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 73108aa90cbf ("USB: ohci-nxp: Use isp1301 driver")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/usb/host/ohci-nxp.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
> index 24d5a1dc5056..f79558ef0b45 100644
> --- a/drivers/usb/host/ohci-nxp.c
> +++ b/drivers/usb/host/ohci-nxp.c
> @@ -223,6 +223,8 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>  fail_resource:
>  	usb_put_hcd(hcd);
>  fail_disable:
> +	if (isp1301_i2c_client)

This test is not needed; there is no way to get here if 
isp1301_i2c_client is NULL.

> +		put_device(&isp1301_i2c_client->dev);
>  	isp1301_i2c_client = NULL;
>  	return ret;
>  }
> @@ -234,6 +236,8 @@ static void ohci_hcd_nxp_remove(struct platform_device *pdev)
>  	usb_remove_hcd(hcd);
>  	ohci_nxp_stop_hc();
>  	usb_put_hcd(hcd);
> +	if (isp1301_i2c_client)

The same is true for this test.

Alan Stern

> +		put_device(&isp1301_i2c_client->dev);
>  	isp1301_i2c_client = NULL;
>  }
>  
> -- 
> 2.17.1
> 


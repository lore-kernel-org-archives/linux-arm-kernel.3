Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C09EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkQH6lR076Cv3HChv/fjJLbF2dz8iGJz4V6MPQQwk2g=; b=saQ4rnZW/YgkU6isPH4vEZUyPY
	CQG0CCwSwqNm9lBp/0JQ2Li44/GNAHkFue2pxWdeeLAYlQOzuyAPgBfStTTsZZM12PXp2sEMihzXE
	1J7TwsKOuvur1tXxAWLU6VipFY0DbiVLekp3d0nh/NPWYHwjDYceRcNmjq4NQAsMTYv7HjRcKO7E8
	B7+BqqMsvMV/0A3oICWf4HCc2GtsFxSrC9ekSmcT/GN2hkm+dKZ95CmkBk4m9qLdAMy145Pr14qq8
	AP58Y8w3hjDX4y1iobk4jzJ3XG6ldR8TYutKNZ/yYYj270qr2WxvlaZQwzAi5Q2/vNMVG6wTZJ2Eo
	iLujyXNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNHg-00000001aBo-2c6S;
	Thu, 12 Feb 2026 03:22:28 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNHa-00000001a7W-1Tsh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:22:25 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1270be4d125so6919119c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 19:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770866541; x=1771471341; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FkQH6lR076Cv3HChv/fjJLbF2dz8iGJz4V6MPQQwk2g=;
        b=OSbWMBgkh2X8vBoDpsmWBqayAWkeo087dU2M8l261Kb9hldaS4GEyY9JfmYf2Ww+ho
         FeJzWFI/DPiU5THBWqS9s1vqIR+qDvWG1dSpUgohgv6InROdBSjhkBOdwbEUnQtdLZNe
         PlJO1ZcmMTQ3S00Wb2UqAcFUaXZyxumWdTJi3osuj00ZznBMcWG9utshIdluOXet2qfE
         qR0e/btZYr2p67/TPJ0kpzqk8gcYPvhSV+0m2x6g+EZoHD5L7kWC/HSOqI5oiiwuIkaw
         XR3qpAa/umH6st+14G+A/bboNhoMsrFTIS0mmpfCXJn+6TftD24EcP/W/6WdHnJSNBdC
         RCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770866541; x=1771471341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkQH6lR076Cv3HChv/fjJLbF2dz8iGJz4V6MPQQwk2g=;
        b=oK6fi/ovsYhc1t8sTI2oEyAubCKL2Mc4tai8Y6xJ1XMshLu3fXqH3pkDD5BilU5uby
         3d+5uAkL1AmCQTVmLBIbnI1FG4FMvand56kNyU30jdvWqcnuxMiYUIfeUY0o0SB6qnRx
         FXJ4wjsn97360WsLRx5G8eA+EOnyqrTZeLQDgcMS6UCLwXokQJPnI6N0RFZUIYb+Ymhd
         lAQzv1EZmmmRH/AxSltykY45mlGDucXY6WSu+sj5rr17Ss7SbPWm2i9uYI/gZ0RNePrB
         4l84CqIPjsdIIhKm02O9RxRGBod24+NyDCkDAywJTcOHznE2COK2Ave0ZvbbnKKlRskk
         iLLg==
X-Forwarded-Encrypted: i=1; AJvYcCUAhbY1S5ErUmuzxSRg/qGr+mKojHLiiIt0Loz3Zwp/vJVc7ffCCRjHSwLsMvlm8g2Ph2bs+Q7TD90XY7N/iVex@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk+ByToMkdsUd6snMYVy5AxFm1Iu67W/L+xGeE4H6spL7iMwnd
	JGoJzTsxaJbChft7YRZ5cTNJIAiYmJc+RsSvBb77hqAzuqR/hoOQPlIpJpLexA==
X-Gm-Gg: AZuq6aKHGmfP2h3W/bT610rZvTPQCG5L8CU6aWSbMSo3QIlH1OGGWU4goFkDevBiBDj
	ixLyuJb2AScIYCgepvNF7Nd2epGotoWf2Xghz/OlauO2XKggRxcVJadYKJTYZOgEr9bo+4r9Aj3
	WK7/p+je1hmHsTb5zbqeoNd7E8OGlfH32OgBuW7PHki6YxlPOP3NsQAE9LHRwiscK8BcAfrbVMR
	UYT5y15Ob83WmFBmmTOl073Cowf8bKJyju1mRb+0ZnsCWFY97+uc/JLtIDKFkYJmDDWC/2rNLP2
	uZ/LRKpkmN5HOqTm68aCcb4igI6qopDQToZZmviGcu+5fpRorZyhcz8CZQQY3oMUxfeuW8Ita8y
	h+W+j6qf1+BDM31wn2vXcX1+3BTJt2jh+K5nz3DNc5gRa1d+P/AcrnJ6+KaOrT6ThxgEjJ28TJV
	lDT3jhY69tpwGuKp/oFGXS4EFVRxfEuUb/ps2PfozTOWwg2UpnR4Qy7CC2GoLBBlM=
X-Received: by 2002:a05:7022:513:b0:11f:1e59:4c2d with SMTP id a92af1059eb24-1272f73b92cmr628906c88.7.1770866541220;
        Wed, 11 Feb 2026 19:22:21 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f5e:c935:ddee:63d0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1272a6fe357sm3507870c88.16.2026.02.11.19.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 19:22:20 -0800 (PST)
Date: Wed, 11 Feb 2026 19:22:17 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: tegra: paz00: use software nodes to describe GPIOs
 for WiFi rfkill
Message-ID: <aY1GZQJLKAF0fsz6@google.com>
References: <ZnzulZBukibZUXKM@google.com>
 <171958889447.2435101.5942373221568313704.b4-ty@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171958889447.2435101.5942373221568313704.b4-ty@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_192223_732580_A9C42347 
X-CRM114-Status: GOOD (  13.94  )
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

Hi Thierry,

On Fri, Jun 28, 2024 at 05:35:08PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> 
> On Wed, 26 Jun 2024 21:46:13 -0700, Dmitry Torokhov wrote:
> > Complete conversion of the WiFi rfkill device to use device
> > properties/software nodes by utilizing PROPERTY_ENTRY_GPIO() instead of
> > a lookup table.
> > 
> > 
> 
> Applied, thanks!
> 
> [1/1] ARM: tegra: paz00: use software nodes to describe GPIOs for WiFi rfkill
>       commit: 47ac458bb229f8c4864081d173adbcfc55c34880

Do you know by any chance why paz00 does not simply configure rfkill
switch via device tree? The driver (rfkill-gpio) seem to support device
tree...

Thanks.

-- 
Dmitry


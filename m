Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302F5CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 14:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ojUaTpvSXrb1YYw6X/ClOYy1t7RbcHRqQubeSVaCHY=; b=TKFARtuoPLCfIuBwa1mUAKJFJ7
	AHH1BI0MO4qZ2DIq4krMMA6NAMupTXWioaKyVS+xS+fDBtDmWNxy7lfRptgDvWKyvRkGHFinMf/hJ
	w0trGz+u6cmpM9VPGxKZ+TH/zACgGyZ3khIi2bEaYYtqHP9kKuro8kDtx53urKVkinlpqLo5zlwdA
	ToZkojPc9mGMbBA86QkGzL3JiSOEP2to0+W+gXlHM+n2LGmRQe4WrgpmySZ1WC0kfUxFFKoWLvmXb
	X1KfFHqyadDs4j3L+l9SY3u+rcu9+88PAwbAXKqP5U3wctgdLp3Xl5gq6nNk7B1/tAmhSDKzCvVDx
	g8xRdeSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5tZ-0000000HA66-2oSN;
	Thu, 21 Aug 2025 14:04:01 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1gP-0000000GPPU-3kX4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 09:34:11 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afcb7a7bad8so114249266b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 02:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755768848; x=1756373648; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ojUaTpvSXrb1YYw6X/ClOYy1t7RbcHRqQubeSVaCHY=;
        b=aNDQaLbhHlMc0uf//bmYRKmfIWbUtZVDFmj9Xnzjrdr4x7V6MgGzLuo9cmjU4cu1CN
         aG2PESsHW0mlq8dc4E6sjnVk5jjDJ3qwaZVhmKA2FJ9BMAZ99HUhQrrke8UupGCmXEuF
         OHrRPQ085dWmrE/rAK0vbVkRvXd7hqySo4OpWLCNSqC5Opdp25LasIoZYJRw43quW8Yb
         RKnClBGYcIf9kTDKyeAIIayICo6Q43B3mKyFh8Q45AHxfZKEeNlaBFqdL99iR7JO5MQG
         UP4Ozb6FYZtoWFPbMB8QdigKeNIZbjVb77xaOqBDXxr9k2DD0Cmi0voFZIizCTKCj8LQ
         EMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755768848; x=1756373648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ojUaTpvSXrb1YYw6X/ClOYy1t7RbcHRqQubeSVaCHY=;
        b=DHg0LMwF8bfnPDgw89QjvvSY6CsOwBuoPDvhPBrmN6YyYSER2ApHsbHirdF2kZpppe
         AOlM9fX1BeyAZKkKo+jFJLSxNI8HNCOym/f02A4M/pIB6PrN8H5VWvb54n3S5TSqs24u
         R3EG3SC7AR1s4mpZ0rKehRXERN85dTh1DR/ANIod5gJilI51ob2oxmcdkrQDenJxapT1
         6IaxTeatfmx31/zR+wGVdJzSbWMB2V5RaAa1gioGVgk3m5pz1ssMHQ2c2E/N8Bx90qvp
         YQu0N1akubDLggLvjAMJveqJrTKRaVH7YwyHj4aFPtniQHugSf/+hVa6U2uE67z+zJKl
         HXCg==
X-Forwarded-Encrypted: i=1; AJvYcCUSfw6if16RE32eq+qENUccF7eR/MTkfQLJh125HDUyClFkYx0iwLxWKcLK6xbe2z5UYBZcNSPbjsaHvVlgGhyZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwSTOjUzbL6FDq2oUvwaCX6x7ln19+W/yfmZWS6mQNHf845zQwE
	B7qKjfDjWKojliDOVDlvvmO4BaL9q65YnOA6wYZFdmj52LRZ7406AS0Cj77CSKwPqSNzhqlg17H
	rOhuxFh8=
X-Gm-Gg: ASbGncvFBhdEZxxfShZwOke6IRmjxIKJSORKku4KOeNcw7s+vTdIj99jd7cseSX1CvS
	bkZOwCXEsIopX4INTumtWYgvqmdTWV7zi9ZuCjlp7ayIPDEnh5hSf5cFX8phCHHmXx2PgQbw5fY
	uVTAwOJqowd2cNOU/UufWcsJy9MqkFCOHYH0BS2V56JiQWXlYCRqdt86HndGWsyGbVFOf0q3OTW
	KcufOpnp6BYZMNE6mvo54bZyx7SI38pIFwc4WjFYbZzZXMbNu7kjEoHqe3H7CFhkHJ78ZrrPJ4t
	pWKrUQa0H25M/fI/hnhTLuN4HgQKBCOKy6AbnOs8igmaG5UIoSHra9EkYfVshI60hej6D4wU+0s
	SDFbekjItGlwGWmX7BrsNbkJgzad/O0HB+lU9Uh2XfaTUUBBdQFi95OX4DsHf
X-Google-Smtp-Source: AGHT+IGPCUQP85VmKt4U/J+vg5UYsiEcQk49TrIi2gpsuaTBNikjE5BQOCAgsWj7wUzO+PxhtVD0Ow==
X-Received: by 2002:a17:906:6a0c:b0:ae0:c943:785c with SMTP id a640c23a62f3a-afe07b35df2mr161258766b.35.1755768847653;
        Thu, 21 Aug 2025 02:34:07 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded2bc305sm350000666b.18.2025.08.21.02.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 02:34:07 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 21 Aug 2025 11:35:59 +0200
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v3 3/3] arm64: defconfig: Enable BCM2712 on-chip pin
 controller driver
Message-ID: <aKbofxfSKO4oGKHG@apocalypse>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <04c67a8fc50f2688fd3a6616bc03b3ac4d4977fb.1754922935.git.andrea.porta@suse.com>
 <570088fa-2861-487a-a2db-2d1d87d700f6@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <570088fa-2861-487a-a2db-2d1d87d700f6@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_023409_935584_500BA359 
X-CRM114-Status: GOOD (  16.74  )
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

Hi Stanimir,

On 10:25 Tue 19 Aug     , Stanimir Varbanov wrote:
> Hi Andrea,
> 
> On 8/11/25 5:46 PM, Andrea della Porta wrote:
> > Select the on-chip pin controller driver for BCM2712 SoC.
> > 
> > On RapsberryPi 5 devices it is primarily needed to operate the
> > bluetooth and WiFi devices, to configure the uSD interface
> > and the power button.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 58f87d09366c..fafcd7851eb2 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -592,6 +592,7 @@ CONFIG_SPI_TEGRA114=m
> >  CONFIG_SPI_SPIDEV=m
> >  CONFIG_SPMI=y
> >  CONFIG_SPMI_MTK_PMIF=m
> > +CONFIG_PINCTRL_BRCMSTB=y
> 
> Have you tried as module and part of initramfs?

Yes, it works.

Thanks,
Andrea

> 
> ~Stan


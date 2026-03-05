Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED89F30946
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 13:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IxpxVkGnClS/pzWnTPcTEx+bl+pPZR21vGpLksfVXc=; b=CgEDzJWOhzljqvX0kwJnRAbPsT
	wyEfR56nmpJa2arFIbQOfj7T8Sr6idB5jK4XCWG+blhQbxfM9L2JgWNlZrCe3nZWLbbDpuMAQz3XM
	HgnzrxFpDa9SSzq6cXhd1vNwgOn7o3LVbYejwm0lqgDNS935c4UReNlHNdwQ5i2/J6SFWGrXqgZuI
	wFGEbp7dqge3gmyQvOy2bffGDiGrrqAkS2CScBF4Cue55A4iUrpRsgPTHgf2BKEjZlPJzO31TvkW3
	fi02ifcuR7rXyhzzyeRjPoF/PChNwAnjTHUskJ2LgvJ/Wz0cgXTFd7Pv9zogocv0AujZ8eqjcbYY3
	RcTOZbgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8Kx-00000001q9r-3bD9;
	Thu, 05 Mar 2026 13:01:55 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8Ku-00000001q8T-2ymU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 13:01:54 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2addb31945aso58280785ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 05:01:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772715712; x=1773320512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IxpxVkGnClS/pzWnTPcTEx+bl+pPZR21vGpLksfVXc=;
        b=IxEvCnVe4doqzPJlSK9JeXdVan720dVNTT6eF68KZVLLiSEM5mJsF2q1GymnJDeNkV
         DLGOVDv6CKp8hXf795KTwVNFV90itQyaxe2EBuvq9IYk+hIcdHOgw0wPROL6ri6wQ8zc
         frNXY56L2jszdik+mPJFZKg62DtMKS3xJLjzuR3A1BNwfTdHVjo/9Tt/+8KPQANfDtwt
         27XXTbYoH/eyfVd5y6Z+TR/Qs3u5b41Fqd8QJQAosgn8SwmoDC/qWaaQxZgVNwUODAlt
         RGiAOn3Oh/xFYzcqvSsEFbN66/rk2T4rGM5XnwcKitmAR8gxklATUei2b4v6YHbcSpvf
         lZTA==
X-Forwarded-Encrypted: i=1; AJvYcCXoGprOlONUYRTFyvJkEnR70K2NVl87QLmY2tRuoiH2e9m/W27qYlfeQS7jxo4RRbEESceSesimF411IutX1mup@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu5lTo1BA7ZwCTU6E++RUWuoHfiAuXpJtCF68Bg/pvruSXT4uH
	DTIv6Web6UVNkKNihL5VXmVMnn4acb3C9AefC+Pf/tq24pgrAU+icv4l
X-Gm-Gg: ATEYQzxo6UllG9/a83DKSW6Zc9UjwZxrgLQPBZsS71VMFUpt0+uy6mkoMhVbpTZx3op
	MVgwZl39v4L79USK3xVBmvfI5zOPzicdvUD0yrIJdV9jW1Tznt1gbbZbgf4j1nxslGwYmpUDRnr
	v1Cg1DX4NaqWUIu98x8XpwHBWPGW9yhEgKfbwQCPJVSYG4lR95FY1u+QxoMllqq0ymiAeMW6V5c
	LNyzo6IxSmz8re9lMrs86Ikvnv+skTON800TEG1xhmdwTY3zxb5RyifpTAYHiKBqq+oqyU/7Msv
	n+1r5ySBWekpJwrYRFOwEqYrDloWVLM/w+3iTxl95T+ZzsAOEm8KtXV6ajCatIa36KXidRwMBrR
	iUU5rusnGlr2F0f44tKliUsd8RVT0fjYOK+LU0Rpm4Jkkdt+CRmNr+8ZD6rVhEp2gIdXEloZVgP
	hRO+U7jQXGtMApb/6NhOlv1rmOY1r0QC+Lf8ukc05x07wutIh3Y438hp8SpUI/cEMVv9dGnghYQ
	55/PWYZE+A1NmtCZWK5mNSKDBNeilJSgRFHs3VLzBFvWopWu+2A/Lm05FYOGQ==
X-Received: by 2002:a17:902:ce03:b0:2ae:5b52:3818 with SMTP id d9443c01a7336-2ae6a9deb2amr60551085ad.8.1772715711782;
        Thu, 05 Mar 2026 05:01:51 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae54136b28sm115696425ad.73.2026.03.05.05.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:01:50 -0800 (PST)
Date: Thu, 5 Mar 2026 22:01:49 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305130149.GA1659133@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
 <20260305122957.GA1652563@rocinante>
 <20260305123956.ojkt4k3ly64xz7fu@skbuf>
 <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_050152_748737_0522FC70 
X-CRM114-Status: GOOD (  11.43  )
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

Hello,

> > > For content match, it could also be:
> > > 
> > >   K:    phy
> > > 
> > > I believe this would match everything of interest?
> > 
> > Yeah, and way more. Think USB PHY, network PHY, etc. Don't want to drown
> > the linux-phy mailing list in unrelated patches, either.
> 
> Also phylink, any memory management / DMA stuff that happens to mention
> "physical", and probably numerous other examples.

Makes sense!  Sorry for the commotion here, then. :)

	Krzysztof


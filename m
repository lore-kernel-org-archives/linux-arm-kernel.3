Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD17CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 02:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skyS+Cuyodx+9RItDMBTIU91z9/i7AQUnbc/OyIR+As=; b=AGS4GfDKSkBiVbq+C2meo5Uhnm
	ntHkj/yeEeorAsnyxD6bNtFv0mExbZPUzW656SCZ3igaVfyurL40BHirQS++aAgMq3Sx+W2XnySub
	AtRsudtFYI6Q205DSk2ojjFI/lrjMJYCEhv90otFMZdaPTgXcbyFLpbRyhqZpTI8WtIHgCRZ3nGwj
	p6OOBCoF41BklpwPgYfj1uZNzyi36dBpn/XNw34ChdsDeE1CxyjrBJlzii9ypMIj9k9osKyIUDIxi
	DdbG0FJcIEriKC4/mBOX+DxkusaTVKWr8nOfgN8Ce1wrOUT7DwgP77NiBGinAAMhB6D8AsZEhN0H1
	UwMahWTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEIDL-00000003Mks-37r4;
	Thu, 30 Oct 2025 02:16:35 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEIDI-00000003MkS-3j3O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 02:16:34 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-33f9aec69b6so683938a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 19:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761790592; x=1762395392; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=skyS+Cuyodx+9RItDMBTIU91z9/i7AQUnbc/OyIR+As=;
        b=A3M4D9TkyfpHoEhYIVAcI/DUZtl/eqILopzdli3Oe0h9NL45+izpRnjdBNNv2UOryJ
         j4I9YPOvayMOZJ/mfHeZicOKbfTs4F7c6cXbtn39nPBskH8bDt2qVZ3M0NcGIDiHBf8d
         bebO45k8qN43LTNtZoO0IqadrwSUnjtVDU/FflG1F2yS/xV6EGD3c4lMbHMoT98Hwob0
         G4KRHqcNKHd5vN8clFOCfMv1XhnuzfZueO6eqtLa+SFA7YceHzxEF3ylqqAnl4WKbIhZ
         +2eDvPbboFom5hStAytHoDh1w0IkaYNYA4lyzAmIF9f7Xy/ocDYt1Esu9lxlIU5sEELQ
         rc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761790592; x=1762395392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skyS+Cuyodx+9RItDMBTIU91z9/i7AQUnbc/OyIR+As=;
        b=N3RTDP7tlOEb+yG3PvAJQv4zu80OfSkXMfeyybI+N1fR9VZzEYwzWkQ9gb2O2WC+d8
         Aa1H8slSbQWA+x6e+E48AOJt1i2LSS9zLP5aJWFmIrKJcMZsGGdgqoUO/qpUpk0d+asG
         92vEPCpSEdtgJeGkAiyfkZefvZWjpbMJpGK0n1z8lLvLifXioyD1tfjTCCI/QBnMWUjW
         EVoL5Sw/L6wGSckholsCwH+xLfNeT4A1wveZrfwEjKQp8/cMrA0Z8h2Eqto7mRimjZrm
         W80zDTvyUhmvkbdCwWcT8q7Z1TmmHo05S8ra0a+ZuAX2IUOcg/AgAKZWQehRXfKjrhLe
         K9kg==
X-Forwarded-Encrypted: i=1; AJvYcCXxboPRX1OTLfBq3tecFCQ2+Fe7XYji/Z48j1pgWsutXSotFTu//pXnFjNWEhSpJ4E6vgNm3nSODWoTV4xniiVS@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6DfaCBZxcnjsRYVt2qjSJky4l7HgG2z+eHXiQj7tGPSDKwd1v
	tucmzpH6ktWkWSL9IdYdO6A4Y8PWTU9zhtig/vNWlHkSkxOvj/8MXyHY
X-Gm-Gg: ASbGnct4m4LnGO3IJPvKvflEXLFXZQbozJbtl8nIckp3CSm9EmK5UzbtHmcTzYi86dJ
	kdO3X1TuOKy6WP1VpvREfysZ2WsUPIfyR1vyFbI2YK3OAzmtNMDsVN4P/OHkPS0Iv576j2P2Jl0
	ihwpuUkyJZRl1H/vy0gEojEa45JD9ThrV5tN+YXKbHkDc8WVsbl8Ahf1AbuiUxjsJ9ocKhWb4IU
	1wElnRYTV1xU2Qn+qMFWkYdgovNjiXoN0mIQs21hlggDawSiOoK6iU/NEe69ZH58J6kV2E3e71V
	mahEZZL/PGlm1ky1iPzD2ZlTGTpJ+DpYV4KHRhBIm4PcKbrOQjYT7p+xdmrjwhc7cI4H2SYygQy
	fdFP192cfYqeQ6dW1QxNFdQvHgnaekBCqOUx/8rYx/tiEbZUECRkrU8DtyyQc3XwHLycgFSg352
	8=
X-Google-Smtp-Source: AGHT+IFhl6dhnMtg2Ql5+VRs8APrxjowbgOu4JakifHuDRZCkhJocdr+tQp+x3ll8cCXsnDbLGKBuw==
X-Received: by 2002:a17:90b:2d8c:b0:339:ec9c:b26d with SMTP id 98e67ed59e1d1-3403a25bb3emr6580820a91.8.1761790591601;
        Wed, 29 Oct 2025 19:16:31 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34050ba1472sm580887a91.17.2025.10.29.19.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 19:16:31 -0700 (PDT)
Date: Thu, 30 Oct 2025 10:16:22 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 3/3] net: stmmac: dwmac-sophgo: Add phy interface
 filter
Message-ID: <kvkmvw2a7n3zils6rx3casv7slgzvli5cwlukmixly2loju2aw@vsuigze4wgwu>
References: <20251028003858.267040-1-inochiama@gmail.com>
 <20251028003858.267040-4-inochiama@gmail.com>
 <20251030004948-GYB1549833@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030004948-GYB1549833@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_191632_949219_50B48C00 
X-CRM114-Status: GOOD (  15.61  )
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

On Thu, Oct 30, 2025 at 08:49:48AM +0800, Yixun Lan wrote:
> Hi Inochi,
> 
> On 08:38 Tue 28 Oct     , Inochi Amaoto wrote:
> > As the SG2042 has an internal rx delay, the delay should be removed
> > when initializing the mac, otherwise the phy will be misconfigurated.
> > 
> > Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Tested-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> ...
> > +static struct sophgo_dwmac_data sg2042_dwmac_data = {
> > +	.has_internal_rx_delay = true,
> > +};
> > +
> you forget to address in this version? see
> https://lore.kernel.org/all/ljyivijlhvrendlslvpo4b7rycclt5pheipegx3fwz3fksn4cn@fgpzyhr2j4gi/
> 

Yeah, that's right, it seems like I have forgot too much things.....

Regards,
Inochi


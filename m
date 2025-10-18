Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88249CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 00:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3QafKpBA9ev9tZ8RtBiTe7ilN8YrDWJs4uzq+MACIIs=; b=1Bj1z/w/jIVYQg6cJdtFp/XpLa
	4bojCWi2qxXpX63PFKUW7hqHBDWew8HQ1d/cERKOkLk1vNy6bZMx7ODUFZTcm0TOmRR+jI3Zdn86a
	4iIOULTzODecDwNDrgXgk0T7MM+3vHt9AD6xjosG3fpo5OSjxoylcq4PDw+bF887Aiy+I3UAHdYzX
	eJZ6HQrEjaR1S+0WY8XEYaS6a1tP/wWLO6XYUrLigyw15wtJs+Te0iQo+LkH5HPu8Jc8cl3hWONGq
	Q9LJcARE5wswZvNA//74EZmbILd83epjedY80fjWjSsb1SLMXKT/zPNb6uBUIA+v1O00F7vcF2yAk
	6KfqSztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9v3p-00000009I67-1eYY;
	Sat, 18 Oct 2025 00:44:41 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9v3n-00000009I5j-35AX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 00:44:40 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-290d14e5c9aso17913615ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 17:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760748279; x=1761353079; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3QafKpBA9ev9tZ8RtBiTe7ilN8YrDWJs4uzq+MACIIs=;
        b=WFp3osaPZzF7kb8w56tz1KnmtoudJ5Pm6vVR20mLW6eDL5OYjCN3xG7IYdiGBQDNmL
         bUtxlhBY7v93o/R8eHX5J7v3phjon8y2eVAdnHxpDmJqJcIdr6SUAZ6CauaN1/CFsmbp
         ftJ97uNRfAW9FztmkTV8FLnpi+xgLJd56F04SVM5QpfaOGdukm0nzuD6ffsEfL4ix8xI
         s0Q3JqDL+VZvey+nQ0Ahpv6ZexubZV0lcsd0vWpT9e+UE7CKnyv+MR+2um36qwjvEfFz
         ODA9j6F6iaw9Z+EuFai92c1NYdbdqH1CPAgrfX4O3lmm2LsEB0Q1sR8w9TofFd6cbA4q
         Sulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760748279; x=1761353079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QafKpBA9ev9tZ8RtBiTe7ilN8YrDWJs4uzq+MACIIs=;
        b=lwTiLah8FjslcneESSBqCD1hZNMwTHQsYU88Mho0DtfKqVd1PHTpP9ccTnsEKrci4/
         557j/FazGjL//XOVvgmGVQ1A0RNQIv6sBMeJljCluMV75KBNJsRIBzHbBLku6EsOyy0y
         sLFk+YJymQg8RIqpGRlGjjJygSoDRj5G+JYk49yJW/fbtOu9UxAF9vUO6sLyTr9KxwMB
         QELhMF2NoABpk+il/RaykHhSdsloAleztKOpmr31UTND5IkAGVsrg6vjLZ1KDqpTZVXv
         JxYf+/tg6UH2vHgfWaBu0H28TzE8lx/gLyqsB2dp31JcQ0N+q8aQWmkZ1PjPOCbTG2OG
         2sxA==
X-Forwarded-Encrypted: i=1; AJvYcCVNz0xic8huy0xt5qclkSwHA4b4PmqiL2xq+8ryCXkxI7I4ln4MdJ/X90XT9q56Q2JPHnuK4rV25KBxyBdEHspq@lists.infradead.org
X-Gm-Message-State: AOJu0YzgMYbSKrXQeaAh9QzpX5VrBuovvW+0TcUaOJhXpWQqb2Zhcs5q
	cPveR+OLD8v/XAdh73a6ZdxBw5BvsbSzmwC5ide4lllzoW2tpdZqBcdc
X-Gm-Gg: ASbGncvkO2310C7Zneh7jtyeIoRj0z2Yqt4qBLIQHXQ3jcXUKDo1Dg9nt6f618uktDn
	FZSC9XiD8gWHffzCNuQ2XdI5yI8TUJxAgz/CFC+X8FIE92wNG/Gk+GwJFRijRoLMghaD46SBt4r
	DE8N4J4b1JRJUSwFa+ikMGglzaDQNI4IUtYHUnV9WBY0Y8tMMWwvPLAGk0W56TMBsqBMzFaogQr
	3TVZbemry7JDc9tBwXmbp2SvKb2q7SKuLhOr7BSJqldQCIv2EU665m1PMJtw7zXi61+IqlgpbAp
	ZQsU/lMtg5feZU/U46eT3OGFeXFTHoRL17hdnzD1Ws6pVExrf1vKlM9QsqYpN+kS8r7v+MzU4w/
	S1ihj1d+56UCPdmk19fS9i4md28ZxCi/7kOTkrLqDM5gIx8F0zboIDWgdcDwmAQkgnofruBwea3
	o=
X-Google-Smtp-Source: AGHT+IEJHzKpBZuNZNa18WS/ADFtdVavA7SE/dNX1ygVUM8SyYneHAxGCurSyYxg3cW6a8KtgONCXg==
X-Received: by 2002:a17:902:ea01:b0:267:d2f9:2327 with SMTP id d9443c01a7336-290c9cf2d88mr81827755ad.27.1760748278692;
        Fri, 17 Oct 2025 17:44:38 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2924721b6fdsm7874395ad.118.2025.10.17.17.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 17:44:38 -0700 (PDT)
Date: Sat, 18 Oct 2025 08:43:47 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, netdev@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] net: stmmac: dwmac-sophgo: Add phy interface filter
Message-ID: <hmch7csqotxt42snddksce2mpnjeglbgvoxs6r5qlu7v2ayxyk@zctj7xhugeln>
References: <20251017011802.523140-1-inochiama@gmail.com>
 <20251018000548-GYA1481334@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018000548-GYA1481334@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_174439_777905_BD5B3B1F 
X-CRM114-Status: GOOD (  25.27  )
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

On Sat, Oct 18, 2025 at 08:05:48AM +0800, Yixun Lan wrote:
> Hi Inochi,
> 
> On 09:18 Fri 17 Oct     , Inochi Amaoto wrote:
> > As the SG2042 has an internal rx delay, the delay should be remove
>                                                      s/remove/removed/
> > when init the mac, otherwise the phy will be misconfigurated.
> s/init/initialize/
> > 
> > Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Tested-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >  .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 25 ++++++++++++++++++-
> >  1 file changed, 24 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > index 3b7947a7a7ba..b2dee1399eb0 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > @@ -7,6 +7,7 @@
> > 
> >  #include <linux/clk.h>
> >  #include <linux/module.h>
> > +#include <linux/property.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/platform_device.h>
> > 
> > @@ -29,8 +30,23 @@ static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
> >  	return 0;
> >  }
> > 
> > +static int sophgo_sg2042_set_mode(struct plat_stmmacenet_data *plat_dat)
> > +{
> > +	switch (plat_dat->phy_interface) {
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII_TXID;
> > +		return 0;
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
> > +		return 0;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> >  static int sophgo_dwmac_probe(struct platform_device *pdev)
> >  {
> > +	int (*plat_set_mode)(struct plat_stmmacenet_data *plat_dat);
> >  	struct plat_stmmacenet_data *plat_dat;
> >  	struct stmmac_resources stmmac_res;
> >  	struct device *dev = &pdev->dev;
> > @@ -50,11 +66,18 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return ret;
> > 
> > +	plat_set_mode = device_get_match_data(&pdev->dev);
> > +	if (plat_set_mode) {
> > +		ret = plat_set_mode(plat_dat);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >  	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
> >  }
> > 

> >  static const struct of_device_id sophgo_dwmac_match[] = {
> > -	{ .compatible = "sophgo,sg2042-dwmac" },
> > +	{ .compatible = "sophgo,sg2042-dwmac", .data = sophgo_sg2042_set_mode },
> I'd personally prefer to introduce a flag for this, it would be more readable and
> maintainable, something like
> struct sophgo_dwmac_compitable_data {
> 	bool has_internal_rx_delay;
> }
> 
> then.
> 	if (data->has_internal_rx_delay)
> 		sophgo_sg2042_set_mode(..)
> 
> 
> >  	{ .compatible = "sophgo,sg2044-dwmac" },
> >  	{ /* sentinel */ }
> >  };

Yeah, I think this is a good idea, thanks.

Regards,
Inochi



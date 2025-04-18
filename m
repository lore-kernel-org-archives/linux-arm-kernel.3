Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50E4C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 13:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVpxnI/29mpkrDRARmH1s8IOVcoXlXa8dMGnnZK1EKQ=; b=3skn8LmJUROQ879WzYeytfUX7E
	Fn4VR8qtPhk7W11c0BABItzYYzdX4GT7Yfe6/IL1G4j6Hb1zhZU9GhJijqw2aUioMgiHbdOHG4TVy
	VpgiakC/3RyEanC5T5QZQT6R0r0VMsI//If3z7CHDZ36K7OoH+zNrtrtEQJ8LDArQKzuGNFrXvt9T
	v1cX2XQB1Z2xuw1EJ56UbC/B7xagzvBzz523BKizRm9+xdenX13T7h4iB2gYg4fjhMFILq8NivjqI
	aPG3lWCH8i3F1iAUMmSeCXZvgKYgqXKRsBFQAP2Ohz/PIiGwDwK+ykVXQzGA8DyxYu8bQfg+o7UME
	pok7e5jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5llu-0000000GEem-2DRR;
	Fri, 18 Apr 2025 13:28:46 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5liX-0000000GDoA-1xJj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 13:25:18 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5ebf57360b6so242116a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 06:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744982715; x=1745587515; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pVpxnI/29mpkrDRARmH1s8IOVcoXlXa8dMGnnZK1EKQ=;
        b=CTVEjmi/aQOSHMjcYT7XRgrlzNpetlylFAM0vgoTeYpKyk3cSrCmaAG/iDQ1lV06ca
         uxw0bzd+sJ87UE3sHcDAE4gkECroEYcE6QmrtTd/px0szy5mtkXGiiNa0fJMNvSvXjAE
         MzqXVJI5z1YjrJN1mg8kePX9cryzzn0cWkLwcKtgV3IT9gynaJF+zbQxReBxPg+DFVlk
         2qpvNSmiLlZVCfHsuODa3iGOz8hDXdLFoRqFYapDpCdyXGCrRquxXpK7aR8xSXO8SQW7
         fJMsX3iPGjc1Ipg5W3umd/1v8sHSgO+aJcDRKZAAwGKuImnjrvGx6dKth6Gsrdy8dY7A
         1zhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982715; x=1745587515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVpxnI/29mpkrDRARmH1s8IOVcoXlXa8dMGnnZK1EKQ=;
        b=W+SUtK2IQGBTNq0uwH4V1ThEROYfUnIOmfFQNWSlkYdQ+yIwB3TBiF7UP7XYrvJ7iW
         jtL/kPM95N54qwY19VfRrqEF048SclESm4R6hH+xIMHuUa8Q78ooKurmiqpRU2s/zWCE
         T+61lRo2g89ODHSd6QZdlrxaDSfuFVotuBNzUzscZ1r9/0IWFBYooz6msf7//LxYCb/t
         mA8pbNET1aDDVdCZ73PQgYYZ7Lw1ihADRZ1zuBLJYkQQkIozjlUZjHs3llddLiytpg4l
         8A8v8ks/dx01csuQUMND0bNVV7wFWC8yJUPfuGUhJuO3VDOXkNj77swbk+T7Nk4yfdpm
         850w==
X-Forwarded-Encrypted: i=1; AJvYcCVeoJ27uCKMpKc4lE40tC/uqoDoOT+VLWPCjFfKk1Qo9ejT9nYcXpe1r7EDmUhDYok9CF3kLO/KsmCfeb5Fubh/@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw8h07lNrwShXFkFPim4EX4HCnflVxvqHqUIHOhlh/JdXC3Oj7
	XzdNBRT8WxsA0TlOqBPM/PuqTLxmF1O/PuOOBP+pXTRth/gpxBWN
X-Gm-Gg: ASbGncsHcEtyedYA83swyZx0nyJvJRtaWSQ5tHXQxp2JdoPIVxCajunmcoY/eWnsYp0
	BwDMYuZ9GPXVej+hrpwoyckjmCrdh3KQruy+ZodbFa5Djv9aACQfqIxTEBKnsSNJKG6c7INubrQ
	vAK8XUMAiOnB0zhW4xLnpCCS/B0+W4T6sjoI66A1bfR06sPasJp4qLPkXWqQpB0NIHISAd/OXA6
	DL+sVjaRzb+S37tBK0a+PZ8G5HkNeE00B4eQjxxDr2pwJktlOqb7zw21yEM9pXUucWA2N7QhvSf
	/d4W7/jt2SYloWsykfd1VuTs37Rr
X-Google-Smtp-Source: AGHT+IHY8YYl+gLe7z4XbImJlTJtfNKJ64WGJaDAJCdf8mISh7qKy9awk9jjoRAY+BWRqWp8cGMOBA==
X-Received: by 2002:a05:6402:350f:b0:5f4:5dfa:992c with SMTP id 4fb4d7f45d1cf-5f628536df7mr802836a12.3.1744982714460;
        Fri, 18 Apr 2025 06:25:14 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef45779sm118202566b.127.2025.04.18.06.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:25:13 -0700 (PDT)
Date: Fri, 18 Apr 2025 16:25:11 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 net-next 02/14] net: enetc: add command BD ring
 support for i.MX95 ENETC
Message-ID: <20250418132511.azibvntwzh6odqvx@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-3-wei.fang@nxp.com>
 <20250411095752.3072696-3-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411095752.3072696-3-wei.fang@nxp.com>
 <20250411095752.3072696-3-wei.fang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_062517_520269_3F64038F 
X-CRM114-Status: GOOD (  17.29  )
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

On Fri, Apr 11, 2025 at 05:57:40PM +0800, Wei Fang wrote:
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
> index 20bfdf7fb4b4..ecb571e5ea50 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
> @@ -60,6 +60,45 @@ void enetc_teardown_cbdr(struct enetc_cbdr *cbdr)
>  }
>  EXPORT_SYMBOL_GPL(enetc_teardown_cbdr);
>  
> +int enetc4_setup_cbdr(struct enetc_si *si)
> +{
> +	struct ntmp_user *user = &si->ntmp_user;
> +	struct device *dev = &si->pdev->dev;
> +	struct enetc_hw *hw = &si->hw;
> +	struct netc_cbdr_regs regs;
> +
> +	user->cbdr_num = 1;
> +	user->cbdr_size = NETC_CBDR_BD_NUM;
> +	user->dev = dev;
> +	user->ring = devm_kcalloc(dev, user->cbdr_num,
> +				  sizeof(struct netc_cbdr), GFP_KERNEL);
> +	if (!user->ring)
> +		return -ENOMEM;
> +
> +	/* set CBDR cache attributes */
> +	enetc_wr(hw, ENETC_SICAR2,
> +		 ENETC_SICAR_RD_COHERENT | ENETC_SICAR_WR_COHERENT);
> +
> +	regs.pir = hw->reg + ENETC_SICBDRPIR;
> +	regs.cir = hw->reg + ENETC_SICBDRCIR;
> +	regs.mr = hw->reg + ENETC_SICBDRMR;
> +	regs.bar0 = hw->reg + ENETC_SICBDRBAR0;
> +	regs.bar1 = hw->reg + ENETC_SICBDRBAR1;
> +	regs.lenr = hw->reg + ENETC_SICBDRLENR;
> +
> +	return netc_setup_cbdr(dev, user->cbdr_size, &regs, user->ring);
> +}
> +EXPORT_SYMBOL_GPL(enetc4_setup_cbdr);
> +
> +void enetc4_teardown_cbdr(struct enetc_si *si)
> +{
> +	struct ntmp_user *user = &si->ntmp_user;
> +
> +	netc_teardown_cbdr(user->dev, user->ring);
> +	user->dev = NULL;
> +}
> +EXPORT_SYMBOL_GPL(enetc4_teardown_cbdr);

I wanted to ask why isn't netc_setup_cbdr() merged into enetc4_setup_cbdr()
(and likewise for teardown_cbdr), because they sound very similar, and
they operate on the same data - one is literally a continuation of the
other. Then I looked downstream where the netc_switch is another API
user of netc_setup_cbdr() and netc_teardown_cbdr().

Do you think you could rename netc_setup_cbdr() into something like below:

struct ntmp_user *ntmp_user_create(struct device *dev, size_t num_cbdr,
				   const struct netc_cbdr_regs *regs);
void ntmp_user_destroy(struct ntmp_user *user);

From a data encapsulation perspective, it would be great if the outside
world only worked with an opaque struct ntmp_user * pointer.

Hide NETC_CBDR_BD_NUM from include/linux/fsl/ntmp.h if API users don't
need to customize it, and let ntmp_user_create() set it.

Move even more initialization into ntmp_user_create(), like the
allocation of "user->ring", and reduce the number of arguments.

In my opinion this would be a more natural organization of the code.


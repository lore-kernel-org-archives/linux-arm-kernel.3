Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F537C4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CiqM6HQnEYGFM1tqwPiFklMvqyJPy7ipNoK3CEVhAc8=; b=TkMps8HQ2q+UFxA9cQLBwGAQ3x
	ux+iPhFHyNaOHrr/pnO7Qa34tD/+exZXKtjN4KpQR3dhcgTnplBTbqnOJKpA6R4mHrQNRqrkDUEv8
	io5qE/fYv5hSnmUvML+pU3+C3LPGqQtpOBtuVJ1a0WPd4acIH6bNtDMns5ajOP41QoMsNrvBHfNOf
	+u0y7qT2q68ALRcX2aJx8Pt8N8ajaSbW47z6pnHaP5DdZYE+BwIl5pe6nMHY8lvm52C23vU56NCBN
	8DoXYHeuX9BzlLaYbC/PlANIjMm77Z3yPGOGD5J58RPTWSD/J2j3/xry5gWkZuWh/DFRpn28PiIp9
	vKrF5qRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloJt-00000006s4x-3b33;
	Mon, 20 Jul 2026 13:46:09 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloJr-00000006s4C-0DHv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 13:46:08 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8486ac3f347so3071606b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 06:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1784555165; x=1785159965; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CiqM6HQnEYGFM1tqwPiFklMvqyJPy7ipNoK3CEVhAc8=;
        b=TJIyJHK/NrCGZpKStyZ2DTd1C2JoCCbs2I/+wV/NeQXjBhbxcAd7I6euc8nbFHw1ZI
         ji4EGLyVHfBhk+WrWPjgcdFmd030vKeFiQ50ZNkAnVPJ96nF2XHPLz7avvOCCPdvtZLc
         XtfqwO8Z1B2Y4ENMNzGkObB2NrDxXUO0gMEJ2OfHJ/iJ4YAe9lr+xWQZbz5Omkb0BkF2
         I3Wldg9C+9Wji/NvGJAmWff4KF2CsqPK0M3Khkp+TPSJSUSbWLNgtWmgH6n0BI9HmGfO
         e3eHNK8l57/d6QuT81ghRaWKfJiEOAnIWedRldEkwkd8cliUDM/PBXHdoCS9tXO3rTFy
         QZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784555165; x=1785159965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CiqM6HQnEYGFM1tqwPiFklMvqyJPy7ipNoK3CEVhAc8=;
        b=RWga4b1vPDqD6zIwjmNjaQCk3DUnRG7Av14dlRB2lbuUDh6hNUNF9XLYjMCuddqLtV
         0Tt3EXz+fulsWpNSwYe5SNmb3ZxkumncoPF7ut/twBdRt3+cXDrMReM27HleMS0kAiiF
         EBkBvIHopmh8k99tYHRCWdNVfoC3eCPKiFlYSAm2kN856t1pVE2lcGNaNzGQGhnyNEBO
         3CBSGggJvsDz4Yp6QClQtRIAokgMhquAoyfUJH178kCudzfIMz0Lem9wOGvLCgk9Prqq
         xUm+cAw/HzIEkyYJ57r/jZ9mar9pVnnsj5Udqh+IL+jkp7rHy9mLEwWK2QKCun/POhFE
         ehCw==
X-Forwarded-Encrypted: i=1; AHgh+RrspMqvo8ARHwC3kNBpnsU+34NTELQ+mxkjPb7+V/6xG+eHFdBjZQBlqs4VFpU4BGD6Qn26VocO4LH7vxKIglUg@lists.infradead.org
X-Gm-Message-State: AOJu0YyuQIU493U8Q+hk8YLUQvbBUPIaHoIvMku0iAadpfu+q+9HYNnH
	QAnj5HW31MZY4k7WNDdx4u8Vl5DRBgjnvpaSEcRxZ38+w0cTvfaZYC2l/1bFv4VJZdg=
X-Gm-Gg: AfdE7ckV1zlTq4bfkXjQOBAJIoVz8/5WuOjRPiOztrGaD0lTOkliisAxHUv66TDXJ70
	8qSqwrkJq4uFKet2ctCKpXzg7h8qGNbkt0JHM5sHKO0Ge0aJpaUPFglW/pgzRuDGjelG30W+GIo
	0spf3OyboyEfZB2OHZJvLBLAgk/nhJbC1f6caTPF4ZIV41vpOwVv29KTBmuxXRgDpP1jb8S4254
	WhJpobLObNHlvN5r71+PDwi/QYWHlf4vKVPRkJIb/LPNikORQPZ8feftnU+KEX3OfaM9bj0Dcss
	RnZgO+BefRxQrtI9LwoX0MvZ/R1HjtbW1uqzAP/cIQvJVgVkWskOjDtN+hyUsYHE4tPKLV9eF+R
	TaMu8IFJ63FyCGEVnZE/pyPm3tS8wYFqFMbsdYy8NhBYiceSwFpMX7jkk/HG2ZtRc90v1VA==
X-Received: by 2002:a05:6a00:1390:b0:848:2f58:e1e9 with SMTP id d2e1a72fcca58-84beb54b717mr19266604b3a.36.1784555165506;
        Mon, 20 Jul 2026 06:46:05 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5e::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2e68e7b8sm5439737b3a.35.2026.07.20.06.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:46:04 -0700 (PDT)
Date: Mon, 20 Jul 2026 06:46:04 -0700
From: Joe Damato <joe@dama.to>
To: wei.fang@oss.nxp.com
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
	wei.fang@nxp.com, chleroy@kernel.org, maxime.chevallier@bootlin.com,
	imx@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND v4 net-next 05/14] net: enetc: use PCI device name
 for debugfs directory
Message-ID: <al4mnM58+65TQnfI@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, wei.fang@oss.nxp.com,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux@armlinux.org.uk, wei.fang@nxp.com, chleroy@kernel.org,
	maxime.chevallier@bootlin.com, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
 <20260720014317.1059359-6-wei.fang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720014317.1059359-6-wei.fang@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_064607_345848_8FCAC099 
X-CRM114-Status: GOOD (  19.07  )
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

On Mon, Jul 20, 2026 at 09:43:07AM +0800, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> enetc_create_debugfs() is called right after register_netdev(), at which
> point ndev->name still holds the format "eth%d" (e.g., eth0) rather than
> the final assigned name (e.g., via udev rules).
> 
> Use pci_name() instead of netdev_name() to name the debugfs directory.
> The PCI device name is unique, stable, and available from the start,
> making it a more reliable identifier for the debugfs entry. Therefore,
> the observable debugfs path from something like
> /sys/kernel/debug/eth0/mac_filter to a PCI BDF-style path such as
> /sys/kernel/debug/0002:00:00.0/mac_filter.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
> index 4a769d9e5679..be378bf8f74d 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
> @@ -81,10 +81,9 @@ DEFINE_SHOW_ATTRIBUTE(enetc_mac_filter);
>  
>  void enetc_create_debugfs(struct enetc_si *si)
>  {
> -	struct net_device *ndev = si->ndev;
>  	struct dentry *root;
>  
> -	root = debugfs_create_dir(netdev_name(ndev), NULL);
> +	root = debugfs_create_dir(pci_name(si->pdev), NULL);
>  	if (IS_ERR(root))
>  		return;
>  

Reviewed-by: Joe Damato <joe@dama.to>


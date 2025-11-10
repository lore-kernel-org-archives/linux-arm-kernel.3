Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D170CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 22:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLyXGRaLm6sEsE+EXjhF05M8r/IYZLjTnBThGk29/Q8=; b=iH7UWz4qsBLYiveHjobKiQzQxs
	zCP/Q4BgnCePnKWzhXbbpdkySIuLvuORuIJI4m/kaV2QNLZ4ZBcua8in9R1k8nxdg8fVTj+Snjzy2
	6ObvVauSm7+rRAMLC0KfoWmneMBJLABKShjLYEVWOgyUdWWKyi3HULIGqSp34HKKk2QppoPMSNkp5
	anVtc9/WFt+PxmBxrRJnYDq1dnHbGmwOHYss9wApQ1UtronfiBk2+WR4Yp3G0b/za+U/jprS5JA3t
	k9extfcXT2OYhlOZMl3sOcU6T9r1+ojcGbF8lh52nyhAjbDgm+xtkTPi+rqfktVhoyqramuyvcyS/
	vx9rx1dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIaLj-00000006CkR-46Pu;
	Mon, 10 Nov 2025 22:26:59 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIaLh-00000006Cjg-28b5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 22:26:58 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7aace33b75bso3654623b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 14:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762813616; x=1763418416; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xLyXGRaLm6sEsE+EXjhF05M8r/IYZLjTnBThGk29/Q8=;
        b=WgjGS9qmw/gb91wPMPULvMMjn3XntzU4/pO+otUloMBWJuwP6gkGKmUy7AjKcpq+JI
         GJGu8JgXsgjC2gqL1olOHvPB/PeuMNosEO5QqNHyjYaxlCE8VBHFltFq5jHxTqXQodMm
         1L/z+itpqLneElQYiTb+6xw95kSZNuDmRGhsYZnochlIou6ex13FMZOOhSaanOgATr5B
         vvRnZwaQbvcw/13uRdQ89WJCK7zz1ORJgSzo71XUc7ErKCWqNoEqoddBN+eq8dQG9Kft
         88pYhnNno7xDqvu6v+WcjZMx4t6XgnHJzaOYVvOXMAo1abgVeLNtHuhEII98SR3s64BJ
         ljGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762813616; x=1763418416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLyXGRaLm6sEsE+EXjhF05M8r/IYZLjTnBThGk29/Q8=;
        b=SHVVk8QOshl+iB8dSB/sI4ahQwYQLUvJqk9L4ck+gMQ0R2Gx6w6P1C7j6mPN/1mRd2
         xvdeb8ovBC6I+A/YBvLhs3rz74Zg88ljy9rviH+tprmcBMPMeQDH7Ay4b/1+BZ3FyDi7
         wDu+7eNoHLyEQIhIGhuAdOPwqw+V0bO0tuCQ3fRt/cFp/kO6nRGpi4irJxY6Vx5gTiOD
         mgrp2TF0JW9WGB8JO83/ecr5SmB/JNcdnb9BFi+5FfM4WY0ZqRA8MhNWtedqUYaxEwIX
         3esDk3X5qESwEMclnEp6Msg6KOACn+HAXam3ckFZbhTagX7xcm15/JiFv+N7leOnR+1F
         RV7g==
X-Forwarded-Encrypted: i=1; AJvYcCXKyuCyURFBX9MXMFxrB05QDCB9lsa9rK7z8EfvqcSR2y853ZaGxrNCGj5y8AMyQtWUeVZD6x2CoABV5EOR2KrT@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz76RYqAs/gqfgXWYuYTIGIV75RAPEncBS24LlcwKSHxyIX7rk
	ITCUscRFc2vxlnnKDiGUopOJuh9hH5mYfp+1oETdUTiPCWjAItfVvqHj
X-Gm-Gg: ASbGncvXFfd8JxrjR8lMrpu4sGeGdVYJIDBFlx42V7b8PXHRcTJHpfWrphwj2H80pkt
	Rz4zoimWVGdxjjzd/cKjOKhVvciSqt2GgmtJrpHq//y3oBRl0YR5noTLI/6Z6kELbC4QNunAfqG
	yyiug2M1J2xvTYkhCd1C3YQ2jxzu+x1pq9d4yPpwl8CsVHFYitZ5jsbA7VX7TIYJBJyu2q8KRa1
	LyG5gFe5ze74tyVaVMoeUoIUryBGVUpfyvtMb9Ckxg7HBgKzfbvbxMTXKuORPZMHV+CWHunzHEf
	JPQk6vaoHUOQEJ41jY5f0LZzjDRtHIA/LCbkCSZEsVI23doiRDLeOflCMHGuawEZAWjCz80mmnA
	M7x3EX3xv69lk8M3E/Z7eVFTnw4AzIRP4ppiVEWkN9nT0McjP9rqxER6KB9q3Y5hkfWgKvZAjCg
	Lt/0I3vbrnMg==
X-Google-Smtp-Source: AGHT+IEk3kYn28lJz/C+AXXcRWMVZ9b5FI05N3tJpVXS4fy3dE0avtehbQZNj/cOBXS8KtnzWEvWzw==
X-Received: by 2002:a05:6a20:e605:b0:357:be83:d026 with SMTP id adf61e73a8af0-357be83d02fmr681099637.35.1762813616432;
        Mon, 10 Nov 2025 14:26:56 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f8c880c5sm13710401a12.6.2025.11.10.14.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 14:26:56 -0800 (PST)
Date: Tue, 11 Nov 2025 06:26:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Simon Horman <horms@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
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
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v7 3/3] net: stmmac: dwmac-sophgo: Add phy interface
 filter
Message-ID: <g2tqvcw7ocewzbqy7txz6sumdxeelhl4jk2s3btnnijyt572di@nrfcac6grpvn>
References: <20251107111715.3196746-1-inochiama@gmail.com>
 <20251107111715.3196746-4-inochiama@gmail.com>
 <aRJGZjgTgcjZgIqe@horms.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRJGZjgTgcjZgIqe@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_142657_553400_074BD613 
X-CRM114-Status: GOOD (  32.16  )
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

On Mon, Nov 10, 2025 at 08:09:10PM +0000, Simon Horman wrote:
> On Fri, Nov 07, 2025 at 07:17:15PM +0800, Inochi Amaoto wrote:
> > As the SG2042 has an internal rx delay, the delay should be removed
> > when initializing the mac, otherwise the phy will be misconfigurated.
> > 
> > Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Tested-by: Han Gao <rabenda.cn@gmail.com>
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > ---
> >  .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 20 ++++++++++++++++++-
> >  1 file changed, 19 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> 
> ...
> 
> > @@ -50,11 +56,23 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return ret;
> >  
> > +	data = device_get_match_data(&pdev->dev);
> > +	if (data && data->has_internal_rx_delay) {
> > +		plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
> > +									  false, true);
> > +		if (plat_dat->phy_interface == PHY_INTERFACE_MODE_NA)
> > +			return -EINVAL;
> 
> I'm sorry if this is a false positive. Because, more so than Russell [1], I
> confused about how about the treatment of phy_interface. But it seems that
> there is a miss match between the use of phy_fix_phy_mode_for_mac_delays()
> above and the binding.
> 
> The call to phy_fix_phy_mode_for_mac_delays() above will return
> PHY_INTERFACE_MODE_NA unless phy_interface is PHY_INTERFACE_MODE_RGMII_ID
> or PHY_INTERFACE_MODE_RGMII_RXID.
> 
>   phy_interface_t phy_fix_phy_mode_for_mac_delays(phy_interface_t interface,
> 						bool mac_txid, bool mac_rxid)
>   ...
> 	if (mac_rxid) {
> 		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
> 			return PHY_INTERFACE_MODE_RGMII_TXID;
> 		if (interface == PHY_INTERFACE_MODE_RGMII_RXID)
> 			return PHY_INTERFACE_MODE_RGMII;
> 		return PHY_INTERFACE_MODE_NA;
> 	}
>   ...
> 
> Looking at phy_modes(), unsurprisingly, the following mappings occur:
> * "rgmii" -> PHY_INTERFACE_MODE_RGMII
> * "rgmii-id" -> PHY_INTERFACE_MODE_RGMII_ID
> * "rgmii-rxid" -> PHY_INTERFACE_MODE_RGMII_RXID
> * "rgmii-txid" -> PHY_INTERFACE_MODE_RGMII_TXID
> 
> And in the binding, patch 1/3 of this series, only phy-mode rgmii-txid or
> rgmii-id is allowed.
> 

rgmii-txid is a mistake and should be rgmii-rxid. This is because
the mac of SG2042 add rx delay, and the phy can only add tx delay or
no delay. So the phy-mode can only be rgmii-id or rgmii-rxid. I will
fix it in the next version.

> But if rgmii-txid is used, PHY_INTERFACE_MODE_RGMII_TXID will be passed to
> phy_fix_phy_mode_for_mac_delays(), which will return PHY_INTERFACE_MODE_NA.
> 
> Again, I'm confused about the mapping in phy_fix_phy_mode_for_mac_delays().
> But there does seem to be some inconsistency between the binding and
> the driver implementation here.
> 

I think this inconsistency begin with the change for ethernet-controller
binding.
https://lore.kernel.org/all/20250430-v6-15-rc3-net-rgmii-delays-v2-1-099ae651d5e5@lunn.ch/

And this function serves as an helper so the driver can only add
the delay once.

> Flagged by Claude Code with https://github.com/masoncl/review-prompts/ 
> 
> [1] https://lore.kernel.org/all/aPSubO4tJjN_ns-t@shell.armlinux.org.uk/
> 
> ...

Regards,
Inochi


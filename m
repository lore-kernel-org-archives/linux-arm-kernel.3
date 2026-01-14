Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FE4D39007
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 18:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9ken08GWaBvhZybEJhtrMx7vEhMPkB4XYNJbjZoLig=; b=PRRlBcxNo4aUgILGaw33AlaDTm
	kKNgkipi25DzWwueFbEGhOt6nwudmUuaiRqYTWxy8TylYrymGttgk0abxltTdfJyVgczIYFPLX/HO
	5IoZtBWZg4ieFhpYTkNcLp/TYL+poxX05xk6Nkn/OHB1ifQbyxzaBcxKgZqlebPbkYYxSQujnU/Lg
	9wZpS/OCPOvcy/fsAShKH+lq3jB0yu7JMEGJzVduOR6U54fXN8YFExfb5bDFodPi89XKW7Xim4AFR
	jQkroQpyfTayao31iYKmZjZo+ln/d6O19rrMGMR71f4WFgC7yDk1c85N9L0JpWp2lEsT1/NRJNU0v
	rPG3ZZTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5ti-0000000ANEb-3Ifz;
	Wed, 14 Jan 2026 18:47:14 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5tg-0000000ANDR-0H2m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 18:47:13 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-64b6f22bc77so13372a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 10:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768416430; x=1769021230; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J9ken08GWaBvhZybEJhtrMx7vEhMPkB4XYNJbjZoLig=;
        b=geWuAwJ8C0N17skAiO155plU3dmZ25fGT6bFg8Vl34br7sWkebRj/3rMd3lGEGsCqq
         SJB0PCvdLsKlmLC1y25hz8EwfAMvqX0gI8CXQem+aY8BJQeN6HcLQKAFlrSiXDpwU9jg
         xR8ZOYY75a64Tr2aHZ0F1JuQmqY6OZsRRNv/NvthKBhEnQJrGC8A9iQDp6KI2X1psVVF
         7shuBnsoQ72LMIeEgaxXGFH8tjkfhQxpG17Zj21vobm4BTW/WAUyHCsY4Cyr7i6FLWfZ
         P00rZj7XAFemuG26mQfQUjEO1fKx84W9x+Q363X7W7pRdvrf/hvTkKnEfSIu5e9zDMvp
         ZG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768416430; x=1769021230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9ken08GWaBvhZybEJhtrMx7vEhMPkB4XYNJbjZoLig=;
        b=Y+iQI9PxIbEMwV0mUcdBg48aRXcXEVxO7odTyyAQU7dKmdJ4/EEgubvl1eVyySWNzv
         FIGeDWeANrHxcY19kl/U/6MlJWPYntY6HlgX131P8nvWADHcptnuB5pyRhL8e8wC94Hq
         AWTNd5AgQbtKrX5NRdOQPBuzjrvColbdJmFWfRKUr0hS3FZwwx9wHbSahl3L8Cj3JZuF
         hTbh7z2MQHWQwWb0T9ykapsrqTrIMpRm28+XR345jbV4i1lnKtIajmcxC1sjuLp5B58c
         VQqJRHLgQTX4pUM3mCJChpzipfIy46MKH5K0ari+4JDWq1snoGQGKr1zazBxM0vnkYW2
         Mk6A==
X-Forwarded-Encrypted: i=1; AJvYcCVFrerEn9popmxMX8HR52uEFwa5XC67QGM/F8T3AirBWrpTl/Ma/HVZX5Ta3Lw5mAGwjg5fxbeuzNCrDooC9iHV@lists.infradead.org
X-Gm-Message-State: AOJu0YxU3+jTCmr1bAbsbIaP1DlUahLEGUXfgc+xVxmZaTMf78TTyQHR
	k+s+VAQQnOwiG8c6Xh3mY1IqYsN3W7hbEYgDm+TZ2J1deYp01pR4u1g5
X-Gm-Gg: AY/fxX73XpcFRgKlcCy8JVbtUs/fTwx7tn7pWa8rlJpK6bk1XRCDaxjy2WNIfji6qXT
	2WGFi8JkripSyRmIJLh3JlzQoqZaksZRFEJlHdcH2ICQe8TdHi7sG5gICsEaFdi1wdYQJQynT4l
	4sOWzAeJ0XSCpAveSkoZByuDfzoTSs7PTfsXL8tfd/Su3QyfWVDSJM0OXEIhJEXpil0DgopRMQ5
	1ZFurF9jD++2dEyaQhuTgYaD+vO1ON9e47dEdrlFls1SIPegSwmLREmcbsS+tpSKWGiGr2dnYyM
	V2XbML9S1OJ/WCmoGaJH6oRQJEQ0Whx+vYkZ+UsFfq2em9BHq3AKklTvV7iJICSCXFwkA/aFwoS
	BuIaBDKHBB8YBVy+4X6HQDEjj4SOGd5CV7IHy2ugM1bg2H2QQenoPlVj0W0drGHOJP/MvSYBEjI
	u+AGE=
X-Received: by 2002:a05:6402:1ed6:b0:64d:46f:320 with SMTP id 4fb4d7f45d1cf-653ec47b906mr1748710a12.7.1768416429553;
        Wed, 14 Jan 2026 10:47:09 -0800 (PST)
Received: from skbuf ([2a02:2f04:d703:5400:9b39:8144:8a26:667e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65411882043sm327189a12.11.2026.01.14.10.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 10:47:08 -0800 (PST)
Date: Wed, 14 Jan 2026 20:47:05 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 03/14] phy: qcom-sgmii-eth: add .set_mode() and
 .validate() methods
Message-ID: <20260114184705.djvad5phrnfen6wx@skbuf>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_104712_120783_695BC2F2 
X-CRM114-Status: GOOD (  12.85  )
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

On Wed, Jan 14, 2026 at 05:45:24PM +0000, Russell King (Oracle) wrote:
> qcom-sgmii-eth is an Ethernet SerDes supporting only Ethernet mode
> using SGMII, 1000BASE-X and 2500BASE-X.
> 
> Add an implementation of the .set_mode() method, which can be used
> instead of or as well as the .set_speed() method. The Ethernet
> interface modes mentioned above all have a fixed data rate, so
> setting the mode is sufficient to fully specify the operating
> parameters.
> 
> Add an implementation of the .validate() method, which will be
> necessary to allow discovery of the SerDes capabilities for platform
> independent SerDes support in the stmmac netowrk driver.

s/netowrk/network/

> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>


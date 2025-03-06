Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAFEC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 08:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsCMTPwBZxgkhOa7brSI6tFSY0lECBrdeb8WRKOM7b4=; b=IuwblEPxiFF5ZThhKgRd1PnEqm
	PmETprczgp+0GTKgRNwwuJRUlVbz2mpCBAEZYaGNiNmgiTArFmDVF7R+0+i0AwNZki4Nzee5B27Jq
	Zy2EWp1jgu+jTPbHU37aEjHo55Pn5mpfRTURuOkUHddFS+Deuk3u+pVpB0LrhMmE7PthcP98dHjlr
	z+5x890Ih+LCrcz20h3MeW08ivpHYxW50AJPlV3SxMy+aQ7zbcV6AhNXedQonmqFXO4ZHmMxbvvXw
	0Et+x6fDDtU4o5iK7IIc1evRDbGLw20lWpSlhjdV9P6sDydcMelvzehd4e3/yZkxoIzZpFSunL5Kf
	E6umg5Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6eR-0000000ALaA-3Se5;
	Thu, 06 Mar 2025 08:32:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6cX-0000000ALL2-2ivO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 08:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741249819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zsCMTPwBZxgkhOa7brSI6tFSY0lECBrdeb8WRKOM7b4=;
	b=GWwWf5aYRdIsYz2HF9fmKDMB5Q7Q0jCrlRV/+2BUJwj72GUfnkDc/IDBosUEfkwLoF23Fm
	EvC/DqTOCLO2J0Rtrdh2LIf3ycVeCBPaTIajq4yP0GDWAVGrrMDR+hjc1E4T8L1htUMn4Q
	PUoh79ab15yzYwhRt828HU1YMafLTD8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-YfE6WlxyMnSd3kypQLKpIw-1; Thu, 06 Mar 2025 03:30:15 -0500
X-MC-Unique: YfE6WlxyMnSd3kypQLKpIw-1
X-Mimecast-MFC-AGG-ID: YfE6WlxyMnSd3kypQLKpIw_1741249814
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43bc97e6360so1489785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 00:30:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741249814; x=1741854614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zsCMTPwBZxgkhOa7brSI6tFSY0lECBrdeb8WRKOM7b4=;
        b=wT1JLfu71u8Fa//lo3fKfV9wF7L1heWPawOjWV8Xtl4rZqu01ZPZaZM9/Zoc6vCchS
         kdu6CtkeHJnlpar9zR3MEodbTVFybWKTra9Ep3hqP7IqtzoFikhIJnJiyF82OC7UTdPf
         ABozCWzCnrPqfcIaIj4GUABlRQ67nSFktIIESmcOPY6rt9eINZ3chCT6JS0VVEVZsyea
         ekS16pK0EXI+QoT7cH5+1uqAJL7D9q1S0D1vYqfRH1Wedn/dk7zC3SfTzf0BR1kUUfl7
         uT5pBjh6+vI9tL95oeppOJ1USpHR9HiXH5f5+AzSrq9ALkXJQf21KMirrSjJPKiemOHE
         GRzQ==
X-Forwarded-Encrypted: i=1; AJvYcCViDrcD5mAZT3t4UXJ7oIq3amMNORScX0X1SDHLC7tXWTS/dO+9MUgPmkDN/LSK/JdU3+1u5YAlsVtNAEOOnEu7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3GOhMMnG6UVkX0ghzMiq7hByA+ALOJYAcbMrMVHtSHfwv6UfE
	g1Y8hrTh/PnakuP/5D9fj5LyLf7dOX1hzRd8wAQojeWoVfrgWRSvgv8L40pzGduLIVkYnAmTJtq
	MgNaigXUNEM6fsCB8/rMG+SEpmLoVLtDPoFapeO/9laxH6Yd+aBwPK79dNlFkurM8Cv5JcdSa
X-Gm-Gg: ASbGncvSY564skj7haNmrwqSXN6zQz6RFcqgfE5bkBBFZxDk6L1XVNEFjSDoOVi22Pd
	ARXmvMOyVMDt9k/gpbUi2bYknnyqr2Fvpn3ffKSxa584ZyOH/7YQMHLeCLBbjpIZffy/BN4qf+9
	iKuIonhpNCkBLtXZzH4WxNBUqhMMswjRiH6XlWyj3ARYnIYgLuXcxyVJjiCNRmzasTs6Mxs7R6J
	To94XZwHAPgTi+W/S3xZcAakLojJ6lOJFLhxNiekGohp0i2/5F9g4vEd8YrFOTNn+YzLwqlag1W
	oqdOMaqB6Oc8azwtUVaOVUYYi5/w/4AucSdrK8T0WERmRQ==
X-Received: by 2002:a05:600c:5117:b0:439:a6db:1824 with SMTP id 5b1f17b1804b1-43bd29d6c7fmr59684405e9.16.1741249813969;
        Thu, 06 Mar 2025 00:30:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeiiS7g9xPdRasKEgZd17TDJ4YiUIINUR88fvo+ijeTmx55HfEiBGbbv43iFagWinu4311xw==
X-Received: by 2002:a05:600c:5117:b0:439:a6db:1824 with SMTP id 5b1f17b1804b1-43bd29d6c7fmr59683995e9.16.1741249813597;
        Thu, 06 Mar 2025 00:30:13 -0800 (PST)
Received: from [192.168.88.253] (146-241-81-153.dyn.eolo.it. [146.241.81.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8da097sm12217325e9.17.2025.03.06.00.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 00:30:13 -0800 (PST)
Message-ID: <738bd67c-8688-4902-805f-4e35e6aaed4a@redhat.com>
Date: Thu, 6 Mar 2025 09:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 02/13] net: phy: Use an internal, searchable
 storage for the linkmodes
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Russell King <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Simon Horman <horms@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>
References: <20250303090321.805785-1-maxime.chevallier@bootlin.com>
 <20250303090321.805785-3-maxime.chevallier@bootlin.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250303090321.805785-3-maxime.chevallier@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iZ4wjZ6ccDvEpvXdrxk8PAro4uIa7BGLPZsv0UrVyN4_1741249814
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_003021_765277_312B2171 
X-CRM114-Status: GOOD (  14.08  )
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

On 3/3/25 10:03 AM, Maxime Chevallier wrote:
[...]
> +static int speed_duplex_to_capa(int speed, unsigned int duplex)
> +{
> +	if (duplex == DUPLEX_UNKNOWN ||
> +	    (speed > SPEED_1000 && duplex != DUPLEX_FULL))
> +		return -EINVAL;
> +
> +	switch (speed) {
> +	case SPEED_10: return duplex == DUPLEX_FULL ?
> +			      LINK_CAPA_10FD : LINK_CAPA_10HD;
> +	case SPEED_100: return duplex == DUPLEX_FULL ?
> +			       LINK_CAPA_100FD : LINK_CAPA_100HD;
> +	case SPEED_1000: return duplex == DUPLEX_FULL ?
> +				LINK_CAPA_1000FD : LINK_CAPA_1000HD;
> +	case SPEED_2500: return LINK_CAPA_2500FD;
> +	case SPEED_5000: return LINK_CAPA_5000FD;
> +	case SPEED_10000: return LINK_CAPA_10000FD;
> +	case SPEED_20000: return LINK_CAPA_20000FD;
> +	case SPEED_25000: return LINK_CAPA_25000FD;
> +	case SPEED_40000: return LINK_CAPA_40000FD;
> +	case SPEED_50000: return LINK_CAPA_50000FD;
> +	case SPEED_56000: return LINK_CAPA_56000FD;
> +	case SPEED_100000: return LINK_CAPA_100000FD;
> +	case SPEED_200000: return LINK_CAPA_200000FD;
> +	case SPEED_400000: return LINK_CAPA_400000FD;
> +	case SPEED_800000: return LINK_CAPA_800000FD;
> +	}
> +

What about adding some code here to help future patch updating LINK_CAPA
definition as needed?

Something alike:

	pr_err_once("Unknown speed %d, please update LINK_CAPS\n", speed);


> +	return -EINVAL;
> +}
> +
> +/**
> + * phy_caps_init() - Initializes the link_caps array from the link_mode_params.
> + */
> +void phy_caps_init(void)
> +{
> +	const struct link_mode_info *linkmode;
> +	int i, capa;
> +
> +	/* Fill the caps array from net/ethtool/common.c */
> +	for (i = 0; i < __ETHTOOL_LINK_MODE_MASK_NBITS; i++) {
> +		linkmode = &link_mode_params[i];
> +		capa = speed_duplex_to_capa(linkmode->speed, linkmode->duplex);
> +
> +		if (capa < 0)
> +			continue;

Or even error-out here.

/P



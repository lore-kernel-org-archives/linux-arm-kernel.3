Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2DFC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaVB0jzsgxgFF8kGT+Ni2eZz8vIf7WxRo6XWKmn6f+E=; b=YNdruBR3Q8kGYIp31nKDOUVSQS
	co/Nf+vp5D2k+c1brVYUoejfs7/xrPGn0wWxkfk4WM9kjiAhwaivNAnBpOqLmXx5MaeFjGmebtUR4
	CwP8kNXceaF+guGwMnRrUUVu4kJlYZKDkpisya1XFc8kdapstjCtDMrH2J/t26Q/OIeUwQifF4ayQ
	cYkQcMiMDjSLX9992EN9K6vKUcV6pG9vAW1WfH4lg6ikl11xnpdl43SsBeJsnTfolvkCx/1dXR6Uq
	MOmSWugWydtJF2zaQfJbIIEZ/UUfZl77gkfYBXXs28g0WqJca66IHnxXeNLCHpjlrbUxwuC24agEJ
	u/xt7U5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5lws-0000000GGzr-1E8A;
	Fri, 18 Apr 2025 13:40:06 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5luQ-0000000GGK9-2qE0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 13:37:35 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-acb5ad040e6so23091566b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744983453; x=1745588253; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yaVB0jzsgxgFF8kGT+Ni2eZz8vIf7WxRo6XWKmn6f+E=;
        b=nPC9ghCaf9dFfBROhhtiQDfinNIH/fOfxOPooMtBKipsXD1OlnSo4VqYkK6ZdoRHcq
         zUhqpUnuXhT4tsojE5/Jmm2Lh48XIINLXXI2GmSCJEf9dhHUbQHqvTPkFaAB8gVw0kUN
         YB0DcaW6iTQSGbrQO7zaODSHkN86TBWIPAfP5YhG/92822MenlJNfv9ucfUwxAC2SuiQ
         8LPznDMAfhpZGqbQBWph1Ymnda86MNlInrz6f0vo/ch4OQzmag5deDdylFW4zfWBDjXZ
         n8UcugjFk9ZSx7H/fBFW8QAlb8gzf/ct4XqSn+mrJO0DDunLR3Y3NDo/tHaW9BGdycLu
         7NmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744983453; x=1745588253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaVB0jzsgxgFF8kGT+Ni2eZz8vIf7WxRo6XWKmn6f+E=;
        b=vejJTxTKGE+5bpOj8x6zoTlBPGPHrofSecLuponBLuqKk7OMbBqNZdVedkAOmm3AsC
         ByVruLtmhbv2f7Ys7qwYgEigbibgyhrTuWMSooYr5gdJ7/8wyJCSBDkQty+nUqJkHQvv
         BLpGa07iKXPGPxDImHnz3Sr7d1gkwmMofu665vkHhqMAq0J5V1c29oL+Z+1FFqIE+8uz
         D2BIF6HTFVBWRLqO8Pm5udhYX2Oj59ErwTrxa9s7KJcUrp0dP6BkE6gz08NuWXiOMlic
         wSDe4cbceUCgU8UVIJIf+W24ajWJ1/hMd4tHGcg86p1maH5zigU2owkvWj1djH5crbTE
         MCCA==
X-Forwarded-Encrypted: i=1; AJvYcCWCXtfIa7kZOYKwdmlwt02FfPSYFlDoLf9HMJB7p6OhtwBX4DoMm7Q1DufQSDkQ/Q0AgAMCFUpQD1/mywd09zgJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+i5PdF+xbpPSYhmLe13ZemW1AcgOh/nbvp+abin3McDL2jCm7
	acRHNhvu52JlBT2wCc84usHvQASHiE3RNtjtaUrVUe1kdPdRxsQm
X-Gm-Gg: ASbGncuQgfpOIEhxtM7BKGIDzIzOhdFnGUBH6tUl0nU3RZMGXWLmkov+VerK3pnCgNM
	LMhyfzdFF9o1ZhSnhG3V7gZyTAz1dCXsBNFSj6TL9lSc/hZmr8gXzhosWiSA8pdcwziJwbAdIjV
	+oawG0+zCNq/w/nG6a9+519WgqfY/v6ZtujRMbejKPJDML+oE/ZrlK3OZ7OHFLJYTy5/d2NMk3b
	m53CyLdjjoCc+XjQ0UGFi5srtZNSioIntMzIxT/c3YtOCmhfuyYhR8L+jEbDXikaAUm3T62nzS+
	btBvTHLvlyhqrTEAsNnFHjQu1wXw/37YK4kdNAI=
X-Google-Smtp-Source: AGHT+IHDLcatUwVL3iYay48R00vjtUcVAnpAwx2hlm/q6/jMDb5Q5PmviuzfcY6HTPtV69wle8gO+Q==
X-Received: by 2002:a17:907:1c0c:b0:ac2:6d40:1307 with SMTP id a640c23a62f3a-acb74dba1d7mr79825366b.13.1744983452751;
        Fri, 18 Apr 2025 06:37:32 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec4f6c8sm123584966b.64.2025.04.18.06.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:37:32 -0700 (PDT)
Date: Fri, 18 Apr 2025 16:37:29 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 net-next 03/14] net: enetc: move generic MAC filtering
 interfaces to enetc-core
Message-ID: <20250418133729.ul4ocm6ie7b4my3y@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-4-wei.fang@nxp.com>
 <20250411095752.3072696-4-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411095752.3072696-4-wei.fang@nxp.com>
 <20250411095752.3072696-4-wei.fang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_063734_716014_728ECA27 
X-CRM114-Status: GOOD (  13.89  )
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

On Fri, Apr 11, 2025 at 05:57:41PM +0800, Wei Fang wrote:
> Although only ENETC PF can access the MAC address filter table, the table
> entries can specify MAC address filtering for one or more SIs based on
> SI_BITMAP, which means that the table also supports MAC address filtering
> for VFs.
> 
> Currently, only the ENETC v1 PF driver supports MAC address filtering. In
> order to add the MAC address filtering support for the ENETC v4 PF driver
> and VF driver in the future, the relevant generic interfaces are moved to
> the enetc-core driver. This lays the basis for i.MX95 ENETC PF and VFs to
> support MAC address filtering.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>


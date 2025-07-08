Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1DBC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0at4FacdZ6pma9HH5OGwEa8HPAQDJiRPxVtv3dm2mI=; b=fTxLMsQXmjxsDPeR5kaeZhAQz5
	56NehOLOVDQW2k4TKJ1D3+q6Y/bGN8THhgl4Z0KCFkrGcx3R6Lv0qzfCZkUVQq/6FTszj82T572Oc
	Rzv2nCeN+EUdxLT9w8b1rYaYLqM3XtRV19NdNvrOYiaWF+1ziBIpKNgu/+0ssBayHiAFbeL6+q7+V
	sKztyJdq9/xk9ubUJVpA79wd4D77vkWAv1sLc3ov1tHqQQwE0B6nwH2ItUpRWoaraajMpebGSjyR2
	wPNKYcJRT3Nu2vLGWZDMFbATI6VXwgkkK+zHsnsODYgerzBp0jwnv8sWPPROYpfJQahUvEtCXtrrt
	p4rDOCzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBkT-000000063Bx-0fL2;
	Tue, 08 Jul 2025 17:04:53 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBGv-00000005z0h-2ODU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 16:34:22 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso980968866b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 09:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751992460; x=1752597260; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r0at4FacdZ6pma9HH5OGwEa8HPAQDJiRPxVtv3dm2mI=;
        b=lk77O7g4t8ehGifjJSmXdZJuVmgOCQAk+zEyDmZfLSS2gDYooJsXfwm083Y5/WSEQL
         NQn9dXNnkJOGuIDnSrzZFM+iIuGKO+DbtXLFGO/XLuy8tsWmx+g8xQ8y3h01ZZuQtsJL
         4HBKoLmjacyG0P0+ZJ7d1fOtHtYFn22NgYvVWMbZlgt70RrHlblTN0CO6QRh4bDcksti
         lZOY6/EXXX5p+40NzcJzttxobYuVb/zvpEnVX8ZsTC4Xxlc/+EPUuOX7vybVq4KRQQIj
         sslo2FCZHZ7LOgB2u7SDQIjUTtrxwYZkifGXueuz14TdiIMui8+jZrkSoT7K4TtX8vK5
         KCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751992460; x=1752597260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0at4FacdZ6pma9HH5OGwEa8HPAQDJiRPxVtv3dm2mI=;
        b=TKTFhm++yUnlHlz7QZd/tcJ6lVed8wXPlkslLN02yo3rzxc3hpw+o3k9Fuz/vWrFyT
         Xc+VWqlRUOBfmP1EywUz6mSeqOwCD40R/1+XInd09E7AmgZ6eLDfNmoBwtenMr0Ctxee
         TuILTObLE3mCRQSgzBEC9u8m0MiULmkDOI1ajItY9Egch1LuedCEpLXPb9k2jeVSd+HC
         Rxk46uG63SkiWxavuDKK1znU/1TlucggdyPXP+aPSRdR2MfkfbqMY2LtcO590bZUmQXM
         u3pmH+gZEuHJGwUAVPd3Da01a1jSA5e+isePR0vCH+KitTxZfBUAsfpSsgMDCjAyKcng
         maBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3po7HQM2/5iH+p682a6sffQyX7gkanj0uRiHELSH/yRNtRE6plthl1/aBCaYWQQMWVbKKw738ODbCKUEHWGkp@lists.infradead.org
X-Gm-Message-State: AOJu0YzXVcVsuYVNqXGhWHSzbG7ebg9/EqH15UpBtN2SOAf5V0W+zRpw
	admHKjvHyfI3M5HPM6VxzFTARpFod30oBedDySCPHfgL3qMEB41XFeIjG5crveSnmco=
X-Gm-Gg: ASbGncvu8dr3CPU9OEYQK/bHF+PmoP1Ab1iviI/ljPNL119J0dfbYtdWXvOeLQvANBA
	n0HqLDdZtpYJWm9ydwsSsBVGJAjwA3S1ZMIw99tsIaSFo8RGl1328L4qZEoF4kXxE/n6/NkFBYm
	5Up7hY94BFpVl9NJPcQfi08wuJME3qdZwy3fjUvNOBbd+7vQUZrJyF8ws3fn/SBUvqZG5vr2O1z
	Jat12vHSBotsbrYnqa8eI9HgCnKI7DsjLzn84wnVs0aFn4Z6jbX4cjRZH63kN+o/u8PYXQElDJ6
	BFzHqqnr5TctF76aINOeY6s1g/uhRxiY3LqCt+Oyo97dQSFq7hXeCRh6lvQ=
X-Google-Smtp-Source: AGHT+IGKBE0r3i/OgmjaRqVmGAN5LyHLg8zBEZZguDeNMFqqfCLNiGPwn8x/2LgZv96cHHN089ljmg==
X-Received: by 2002:a17:907:9496:b0:ade:422d:3168 with SMTP id a640c23a62f3a-ae3fe6fa77cmr1690286466b.37.1751992459765;
        Tue, 08 Jul 2025 09:34:19 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1effsm934223466b.175.2025.07.08.09.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 09:34:18 -0700 (PDT)
Date: Tue, 8 Jul 2025 19:34:17 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] MAINTAINERS: Update i.MX Clock Entry
Message-ID: <aG1IiVXZSl+/4+Xg@linaro.org>
References: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
 <20250707-imx95-blk-ctl-7-1-v3-5-c1b676ec13be@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707-imx95-blk-ctl-7-1-v3-5-c1b676ec13be@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_093421_606203_AE698CBA 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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

On 25-07-07 10:24:41, Peng Fan wrote:
> Update file match pattern to include nxp,imx* and fsl,imx*.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>


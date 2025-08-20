Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F460CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 22:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y70NAvFqmHqQ/QHVWzEdqMxMN+9/pnnsuJyiP3UY3H8=; b=rezDo+PkfqETW2ISssPrIVZTNl
	1LRZ2TMvoSqK6atLEMQRVj+98MYDJSkdiWuxN8wXdMg2SPKBFJ7jWDIRRBnn+wgfihhGu1RreW0P/
	ejuI1r7LwzYFt/pYW3WEOcj4DSz2472XYs9qxyro+G2/hR9zP6BT4FEhdKjTGxmEsJEN0pbtL4pnN
	ccpAjg0orHg9E//lLhTnUCEV9d/GOAclgT3xn6VLkfD8Xwy4ezQJwXEmyVci9+iWUykR2ucI3uGK/
	BZwADA1crzzqnoFbc14ky2/bD/ENqow5kC9b8uYR+JqAYsiNFj/DoJTbikTu/EvT0aJK9AML42r0C
	RykVWWhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoquh-0000000F3RD-0KYS;
	Wed, 20 Aug 2025 22:04:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uombJ-0000000EXsR-3T2W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 17:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755710872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y70NAvFqmHqQ/QHVWzEdqMxMN+9/pnnsuJyiP3UY3H8=;
	b=Ruj+qky1TjKcom6RBL9L1Y4aT5TaoHwAkDttdO16EsMflwn2JWD421RKXNnwPSt2ggN7mw
	AobJvdKk23FfINNFYmo2AMUg4U4UhuIB+3fVBFWiBf+Lq8XQCH4aD7DvYRBXMeP4KFgRzx
	7K04kd+Kmxk+9enXszpw0/vK2iyCrPM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-bp7F4-j3OVmF8TsC7oivDg-1; Wed, 20 Aug 2025 13:27:48 -0400
X-MC-Unique: bp7F4-j3OVmF8TsC7oivDg-1
X-Mimecast-MFC-AGG-ID: bp7F4-j3OVmF8TsC7oivDg_1755710867
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a92827a70so3857576d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 10:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755710863; x=1756315663;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y70NAvFqmHqQ/QHVWzEdqMxMN+9/pnnsuJyiP3UY3H8=;
        b=GJ/j/ZZ4+g5aSq/Fsi0oZg9fypISGKsNdeWk+nnHnEs7wsSeYbINe25mkCTviuHlit
         Z/POHExkexXx4OeF0uhMouQRnGY+GBGlHpsJkbTaFL2bnCjk2TyonK3EnsWZeEDAOsel
         vN4+phLUZykkHrAuLHoJWKElMgYK0MBRQ+MabpHlGOHMMS0Y0lsVskScj34dmsT5slRJ
         92aRMaXHuR09fwOYurjR0ENvPrwA4GbGDbv3dNycrGlo7nXZpT41+BYSLdNbQFpOs0A9
         rQY9ZZgN+Fxzn3VHMIfb8EeeRkpwZbZ0BEQhCCpN9AN10MPZQOS9/sOCkcJj4hfd42AI
         /Ayg==
X-Forwarded-Encrypted: i=1; AJvYcCWagG5bc8ibCXpjXamimjOl/BvOunaDZy55kKNQ448SQBXimL5keKDKWhE6lP9qVEFONF3NDLfQPijrqqJ1j7R+@lists.infradead.org
X-Gm-Message-State: AOJu0YzunUvV5qR/RtvgSRSWkqujINQkSFocwBNARNmZEjX6mMSDygti
	ZElEfKjt+rx53igzZpkfAefKFU5jL8Reu6REoc76fuzFbLrVmYzAGrkroaXWeHLCYLB6+c+EjOc
	Rbmb7W+sORB4PfwRP4GKqI2Qkeat9kfh9jX0ncVwAuDg93ja9K6ENqfEBRDKvL7mzYEUxPyiTTi
	jJ
X-Gm-Gg: ASbGncvYHXDTORxWFsmiAJ13H9t7eyYNEb+VsCd5Hwq7aWdTEXfZj8hdnVrVxgfz+2/
	0AJZeMp+ekdoinzxo9aV8dW8uB41o6GCOmKtHMWvjOwbWCEUWtD8c2I2PB4mNT8ioPZJJo4Ba+B
	qk1eJ/CFiaOrZs+PamRUv1CBg9TBCzEr9GSyEiMP8CzAbILB5DZopMwRHrHQi6x6pH5dZ56xCjL
	hhlSXlNXyCD/TBRnBlxnCbcIC6l2J5R2t3zvHAKQ8U2u7ZrmAJFp06BbDuaK1wOQ6nMJM/hs8SB
	Px3IQQjk5CcXXsjHqGkyQYZCGf/K+9dxJwBbF3hhIz1a+HGQ2varJSslmb+u9P4=
X-Received: by 2002:ac8:5dc6:0:b0:4b2:9ac2:6857 with SMTP id d75a77b69052e-4b29ac27162mr22632751cf.78.1755710863380;
        Wed, 20 Aug 2025 10:27:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBHjmp0EQimLUiSVjKdx79ljrj20Q8jlRYnemWAhO0v2X5MfDUxphjoE81Tq8MZ5J1pPp2Eg==
X-Received: by 2002:ac8:5dc6:0:b0:4b2:9ac2:6857 with SMTP id d75a77b69052e-4b29ac27162mr22632391cf.78.1755710862940;
        Wed, 20 Aug 2025 10:27:42 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11dc5aeaasm87927511cf.19.2025.08.20.10.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 10:27:41 -0700 (PDT)
Date: Wed, 20 Aug 2025 13:27:35 -0400
From: Brian Masney <bmasney@redhat.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/9] phy: mediatek: phy-mtk-hdmi-mt2701: convert from
 round_rate() to determine_rate()
Message-ID: <aKYFh5YI9j-MHKH4@x1>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
 <20250810-phy-clk-round-rate-v2-2-9162470bb9f2@redhat.com>
 <aKX35U4jX55W3W61@vaman>
MIME-Version: 1.0
In-Reply-To: <aKX35U4jX55W3W61@vaman>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8s7bu2mx5_B8lDFHra96epPFbehVPd3M4BjbKQz4rYw_1755710867
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_102753_929112_E76AD13C 
X-CRM114-Status: GOOD (  25.74  )
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

Hi Vinod,

On Wed, Aug 20, 2025 at 09:59:25PM +0530, Vinod Koul wrote:
> On 10-08-25, 18:45, Brian Masney wrote:
> > The round_rate() clk ops is deprecated, so migrate this driver from
> > round_rate() to determine_rate() using the Coccinelle semantic patch
> > on the cover letter of this series.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
> >  drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> > index e51b2d13eab473dddace48c75c2a8d73c8c65635..b0b6497e7eedcb6867541b573d22156ded29a4d5 100644
> > --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> > +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> > @@ -90,10 +90,10 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
> >  	usleep_range(80, 100);
> >  }
> >  
> > -static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> > -				    unsigned long *parent_rate)
> > +static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
> > +				       struct clk_rate_request *req)
> >  {
> > -	return rate;
> > +	return 0;
> 
> This does not sound correct to me? should this not check the requested
> rate?

I can't speak as to whether or not this specific driver should have a
rate check here. I've seen in some other drivers where the specific
frequencies are managed in firmware, and Linux just passes on the rate
request as is.

Some other phy drivers (most notably drivers/gpu/drm/msm/dsi/phy/) only
makes sure that the requested rate is within a min/max range. Assuming
I read this driver's set_rate() correctly, it looks like the min/max
range may be 64-192 MHz. I'm not sure to be honest.

This change keeps the existing behavior of the driver as it is today,
and just migrates off an old API.

Brian



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FB5CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuUSi/wMj/deuFTckhCe0po1wpou4UMuleZXZpAya2o=; b=hbPllyhkYIypI65fu9OedQI58O
	yuAo/f/egzYvZ1d/YjFagM7jVlque6hgEF938EtCyy1gvYsrqjxBf0CyIgfByEig2IB1fVj9c8GHu
	KPvoZtRR2FnbZQvYODFplldxKOKrK0aj1GKpVGnisi1msvREOSY41e9Fo8mn0PgCtkOHwETAx4W2z
	02/ZA24boAlcRy0D+aJz/9XWcDImIji9UuR/73jdgV1qjoJDsux0+hEu/hG3bZyGidQ1ImKYfOoGg
	GS9oxU1X16wWT7PdaW6m1wh8MfDkG4l40wqb7TcmY5T4mu5PB3cNJeo/hCXH+Ipu960A9iHZSFUEz
	Cu+iO1Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw20Z-00000008vDd-3fcN;
	Tue, 09 Sep 2025 17:19:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyfQ-00000007Ulz-405w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757425551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KuUSi/wMj/deuFTckhCe0po1wpou4UMuleZXZpAya2o=;
	b=ZA8mATe8MEWGDAT7FgOEJfCfCxhJ/hpbd1yBqxg1wPv/Eyvsik24cUU/BZh0U+Ma6NGOWi
	eMrtAhhWqM7svqydPaub90hJZaxrE93/JqDrjdbZMSgT1B94Q+JeyrmFHDSghZO1qLcnXe
	8jqvkKZjvkuJpvz8lLRJyJZWigF/WzE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-vgZ_PLcwO5WBDJgmLvkQNg-1; Tue, 09 Sep 2025 09:45:50 -0400
X-MC-Unique: vgZ_PLcwO5WBDJgmLvkQNg-1
X-Mimecast-MFC-AGG-ID: vgZ_PLcwO5WBDJgmLvkQNg_1757425550
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-72e83eb8cafso89846216d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 06:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757425550; x=1758030350;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuUSi/wMj/deuFTckhCe0po1wpou4UMuleZXZpAya2o=;
        b=jESips2CE3h9WRC48iu6QugunjWDDbW6HYyixeM+zR39WLqsgs7Zd0OiUhk4rDpbOl
         +Yi0r71rC+V2ZamJaFNSK4dyS5CUp19wFp2P6SKDx7kwGW1w/NAWdn7Kha243EQqajlR
         CYE7rQelLATeOswHn4juWAevDZ+BMM6o26PJL+tWPeJBR4fPONsmQnNPoogsdEz/iHdM
         8k+TIxFH+CrRwgvs5y612B8+wNghCQi+Bb8sYTe3JoByYbRk7r15D/gxBAYkqwv1zXlV
         tLQsh8o/ek+mdetjwB5ohvnC2Y8cc1RB8DFaG2fy4bkkm/+IOz5sDEJ2eUCaRPJN/iXu
         IekA==
X-Forwarded-Encrypted: i=1; AJvYcCVcQt2CDW3qpGzlKbEoz27gNtntp0J/kydOStKtXe6pcKEazTdigmd2edwp1WPGZbtGLfrSpPya1fjD3Qaz5F6P@lists.infradead.org
X-Gm-Message-State: AOJu0YzMRGNnIRDaaJjwuJy2fmF1qgKayWqgFjFuX2xlEb135zibBw8c
	ph+Nxmd5k/Mab+hhlEq23GpCYuiSKvundtD8gQX6U+Q0eKiZCSHlDdUiNWT9B2xFj7uqF5yAbis
	+Xcws6yJwg8LA+WV9UhHJqbrpJR4NYaKxLmOB3KtXeePLCqKzC+dm0ojYFNs+GW5NFA8P0grD8W
	ok
X-Gm-Gg: ASbGncuve5ByQxIgSRALDkTRyJvL6q73Vz55pqicHNije8p+JNj/t5inEt5xG58s7E/
	AgvcjDwkAqwH6tENdYbESdDHoEfMmv6ZZ9c/7E4gS4gs2X51OpqwDFp6p7x0WXkgdDi4LWtdNvf
	V1pVt4q4p71oDlMIRhRrta3oN4tgybOd0cWHOO+idDwiQgrzKRP4Rc7njl4BI9s5O152zy4Hhbm
	DFl0znVnqdZ3Z72jz8sAr0NFD/EZMyOy3TCOsTeYJG8F1UKTjbrRfh1AIZBCxZhBVsmfjfHhmKC
	A8TGylaPr+/+L1zGAzBBvhqAyM2RqycNBTNSUkpHPfCHs/Ni13/F6oEQFdHCR5TbnGCWu+xK4pC
	yphQZ5LqExPf7Nke7AnE=
X-Received: by 2002:a05:6214:624:b0:70e:3e:6304 with SMTP id 6a1803df08f44-739435cc42bmr94853996d6.65.1757425549562;
        Tue, 09 Sep 2025 06:45:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmp4FTmcXOP7+RMzS1+U7HWsbh9sfiIsI3KOLWl/uwcWgSrIp6/82zb9nfnJx9VJ/Da/CuPA==
X-Received: by 2002:a05:6214:624:b0:70e:3e:6304 with SMTP id 6a1803df08f44-739435cc42bmr94853596d6.65.1757425548985;
        Tue, 09 Sep 2025 06:45:48 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b4665fcbsm138866926d6.37.2025.09.09.06.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 06:45:48 -0700 (PDT)
Date: Tue, 9 Sep 2025 09:45:46 -0400
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
Message-ID: <aMAvinQ4nn38E7tx@x1>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
 <20250810-phy-clk-round-rate-v2-2-9162470bb9f2@redhat.com>
 <aKX35U4jX55W3W61@vaman>
 <aKYFh5YI9j-MHKH4@x1>
MIME-Version: 1.0
In-Reply-To: <aKYFh5YI9j-MHKH4@x1>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yG6Fsq9DwPap1xn1aswwQ-O6vEY6-qhUPCbjHB60MIo_1757425550
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_064553_069591_EE8C8508 
X-CRM114-Status: GOOD (  34.18  )
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

On Wed, Aug 20, 2025 at 01:27:35PM -0400, Brian Masney wrote:
> On Wed, Aug 20, 2025 at 09:59:25PM +0530, Vinod Koul wrote:
> > On 10-08-25, 18:45, Brian Masney wrote:
> > > The round_rate() clk ops is deprecated, so migrate this driver from
> > > round_rate() to determine_rate() using the Coccinelle semantic patch
> > > on the cover letter of this series.
> > > 
> > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > ---
> > >  drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> > > index e51b2d13eab473dddace48c75c2a8d73c8c65635..b0b6497e7eedcb6867541b573d22156ded29a4d5 100644
> > > --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> > > +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> > > @@ -90,10 +90,10 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
> > >  	usleep_range(80, 100);
> > >  }
> > >  
> > > -static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> > > -				    unsigned long *parent_rate)
> > > +static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
> > > +				       struct clk_rate_request *req)
> > >  {
> > > -	return rate;
> > > +	return 0;
> > 
> > This does not sound correct to me? should this not check the requested
> > rate?
> 
> I can't speak as to whether or not this specific driver should have a
> rate check here. I've seen in some other drivers where the specific
> frequencies are managed in firmware, and Linux just passes on the rate
> request as is.
> 
> Some other phy drivers (most notably drivers/gpu/drm/msm/dsi/phy/) only
> makes sure that the requested rate is within a min/max range. Assuming
> I read this driver's set_rate() correctly, it looks like the min/max
> range may be 64-192 MHz. I'm not sure to be honest.
> 
> This change keeps the existing behavior of the driver as it is today,
> and just migrates off an old API.

I'm just checking to see if you have any questions about this series,
and plan to merge it for v6.18. I'm hoping that in v6.19 to remove this
old API from the clk core once all of the other subsystems outside of
drivers/clk/ have been updated.

As I mentioned previously: This change keeps the existing behavior of
the driver as it is today, and just migrates off an old API. I don't
have access to this hardware, or technical details about what should
be here.

Brian



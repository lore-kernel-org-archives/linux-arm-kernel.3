Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40138C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 15:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VT4GMCV34NLKfagWcQH9V4qPrMyXYT4pruyMrAm0O/w=; b=4l/5vp+aer7Nz8x+he01UtAspt
	3QpuYiTag+pKfelwLbRgvCzfiL7r6socycTcTQQXFBX3EoJOmQU8vuTWIuebF4eUjX2A0DHOFsZJO
	JBbJlzdaRoJ80ZS91oJS/eHhJmY93657KBn5WzSPzrrJW4NI6OOFPKsziYjY98cB7RSop8tCnn+Ex
	Ilo0nTG/17Vu/9u4ptAF/egPOHfclQl2yGl1InazVpw8rh4t/OtrOSOmlPXJKCzin7/yhF7c+dbAx
	fGY8LkcqpsYoBlaVBfZ6rBG9jhOuNPV71LWocgutfVfr16e7QPQABWoqs7Ucg3vLlKhcvws0XQqVw
	lsIrlngg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpokf-0000000CrbJ-0W8E;
	Fri, 31 Jul 2026 15:02:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpokb-0000000CrZg-3pJD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 15:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785510135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VT4GMCV34NLKfagWcQH9V4qPrMyXYT4pruyMrAm0O/w=;
	b=dxVjT8AYWUogqCHzWskruCmgKW0NvKc8ZC3hQK/nd+SBGBzoaMofg2vWVoNTvUtmAJBmN1
	nqWyxl4brh4hF2PceoZEBp2YEb+N5+OO+8e4kRMkXG7Q3Bc6XheSN4NpqaHZP+2koBExY4
	09UDObjDBqTQ7ZLImAtZfCkAUSETboY=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217--kORc8P-ODKJof7nnDrSZw-1; Fri, 31 Jul 2026 11:02:12 -0400
X-MC-Unique: -kORc8P-ODKJof7nnDrSZw-1
X-Mimecast-MFC-AGG-ID: -kORc8P-ODKJof7nnDrSZw_1785510132
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81ebbbd60cbso16177107b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 08:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785510132; x=1786114932;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VT4GMCV34NLKfagWcQH9V4qPrMyXYT4pruyMrAm0O/w=;
        b=XXj7lRro1a2GPesgVexxYbLw4eBsBaWfiJKdrRHXbOx93OHWhyiKbs67QGq7X4b1jE
         l+aCOxboTC/no/VrJsKnY7GGVaf0h7WI7kQz6+ZUdjMY7ceE1GY3TXMi7qdEitX5I5tB
         yLtCQIzYGcDyn0Dic7yAZE6h3sJdjBJQLXq3rEKPKpbPgIY25Ggw/G8Jj7MaFFPt8iCG
         KTp5SWx0xAPddysYd1KbMb4KG00Q389+hG0q94RliIp+mdO0bF/QGEQs8rmM2MvTAvBz
         p8WShw1b8Rk9KdM6w2xsIr7zxdXf7r8wlwPizdGshsAkEj0bdlUC7i8IXGLsxEeOMLiW
         OjOA==
X-Forwarded-Encrypted: i=1; AHgh+Rpo+msVZ9VM3T2oNcT6qPwQ9Lpl2PNquybHL1Pv6xqNW1rwvQqczy7+YwEiTeYH5Z4W7IeWuOpMOHzC7dg6eEFX@lists.infradead.org
X-Gm-Message-State: AOJu0YxFGnDdNLZ8GiCndvqTASCRMu+FHZSZIEZsXbJXqA1cy69AITBb
	C1zY6VLFrAdLEoFCdZYD+Bokt4CzkETQ60BaGHdBU0qonOCDG1yLKy9hPAgPuXxxQncoPsXedNh
	9XvDZdwWozaxI+jEk7x7D/nr7MQ2IOc1cofapH59IKg+5WW7FUjec17kQzmD7MU7P9A9KWuIs/L
	92
X-Gm-Gg: AR+sD13Deuvr4yy9dR/pD3EcGK9nrG8yMZB6qK2gn8zLkCUwjgXkF5lkO8kjVmslEmF
	4DIRw8IyuLoeXTE8zoNW8HC23EbcTiXObBL2Q1SsZVdLCKaJIYUZJpMfV9FVTXlKzrKFBDHz5k/
	i4hpfWaSX4pfktjYJK+5GBQK6icHUB4hGRKtXv0MLyGx8G6pRH1pB8vO481j8Oaxo+pNm9mPXgy
	GTAXBw70kwwTU2JCgTH1YnMtER2y1f0uteYwtCRu5oMjAvc3Az8IXyquNzg4y7a4boXIwaEIC1s
	IMwL5ME0gWjm5baD0rsN6CA2P0GzhOEad9i1qQfETKNQg7iANLbYcMCEOZwfKKbIg2oPmdWQYQu
	42zb3tkQ2rWOeQOa8itBuCtwmBLmSfTegJAo=
X-Received: by 2002:a05:690c:3705:b0:7fd:e030:23db with SMTP id 00721157ae682-81fd4bc5fbamr1315697b3.31.1785510131724;
        Fri, 31 Jul 2026 08:02:11 -0700 (PDT)
X-Received: by 2002:a05:690c:3705:b0:7fd:e030:23db with SMTP id 00721157ae682-81fd4bc5fbamr1313677b3.31.1785510130851;
        Fri, 31 Jul 2026 08:02:10 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd11d08esm7875547b3.37.2026.07.31.08.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:02:09 -0700 (PDT)
Date: Fri, 31 Jul 2026 11:02:06 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin =?utf-8?B?W+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	Edgar Lee =?utf-8?B?W+adjuaJv+irrV0=?= <cylee12@realtek.com>,
	Jyan Chou =?utf-8?B?W+WRqOiKt+WuiV0=?= <jyanchou@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>,
	James Tai =?utf-8?B?W+aItOW/l+WzsF0=?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	Stanley =?utf-8?B?Q2hhbmdb5piM6IKy5b63XQ==?= <stanley_chang@realtek.com>
Subject: Re: [PATCH v11 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Message-ID: <amy47how40BJnHsn@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-10-eleanor.lin@realtek.com>
 <amuBqi43ce9bYbir@redhat.com>
 <577a6882b25e457fa94fa199e66f3197@realtek.com>
MIME-Version: 1.0
In-Reply-To: <577a6882b25e457fa94fa199e66f3197@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LFaf052ZW4JF9YRxgVcYo4wsLvUB5vre_xI62rZ7eec_1785510132
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_080218_022355_C69493B4 
X-CRM114-Status: GOOD (  22.85  )
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

On Fri, Jul 31, 2026 at 08:17:44AM +0000, Yu-Chun Lin [林祐君] wrote:
> > On Tue, Jul 28, 2026 at 10:28:04PM +0800, Yu-Chun Lin wrote:
> > > From: Cheng-Yu Lee <cylee12@realtek.com>
> > >
> 
> (...)
> 
> > > +
> > > +static int rtd1625_crt_probe(struct platform_device *pdev) {
> > > +     const struct rtk_clk_desc *desc;
> > > +
> > > +     desc = of_device_get_match_data(&pdev->dev);
> > 
> > of_device_get_match_data() is deprecated. Use
> > device_get_match_data(&pdev->dev) instead. You should be able to drop the
> > linux/of_device.h include at the top.
> > 
> 
> Ack.
> 
> > 
> > > +     if (!desc)
> > > +             return -EINVAL;
> > > +
> > > +     return rtk_clk_probe(pdev, desc); }
> > > +
> > > +static const struct of_device_id rtd1625_crt_match[] = {
> > > +     {.compatible = "realtek,rtd1625-crt-clk", .data =
> > > +&rtd1625_crt_desc,},
> > 
> > Add a space after the { and before the ending }.
> > 
> 
> Ack.
> 
> > > +     { /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, rtd1625_crt_match);
> > > +
> > > +static struct platform_driver rtd1625_crt_driver = {
> > > +     .probe = rtd1625_crt_probe,
> > > +     .driver = {
> > > +             .name = "rtk-rtd1625-crt-clk",
> > > +             .of_match_table = rtd1625_crt_match,
> > > +             .suppress_bind_attrs = true,
> > 
> > This driver is listed as a tristate in the Kconfig but then you have this. Is the
> > intention of this driver to be built in only?
> > 
> 
> I will change the Kconfig options for this driver, as well as the related
> config, from tristate to bool.

Keep it as a tristate if you are going to use module_platform_driver().
You can also drop suppress_bind_attrs unless you have a specific need
why.

Brian



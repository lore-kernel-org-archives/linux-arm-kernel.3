Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A34FC55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+6btDPNM97WzMYH5D23AWn86cOtGDouehBPODye2wE=; b=YE/YQkZ6SuwQ4j9V6nhD4mmDG6
	DLRMO9QmdKTSoxRqIr02n1sXJoanDRxI9hPHLJqTl41Er/0wcqt3v48dRBrXNxFyRHSqJGzz7xek4
	qjNNEfB4xMoxQWuQOP6cDLuIXGDHEMuCzxSDiTHwal96IJLv+iux23DF+vYWOd66GYydccLDZfsoD
	lKCcj/pe4xDmIt1QnTOhtgCWivhKRmzkcAMvdaafYqeWWdh8sM/UvKBhtUP8L3zC0O+mgNP3EO0Vv
	72BE9rmHJ91tyEoxgiZ1lSgEl5zfP5eOZcAiD02gdJISyFHAQLbc1I6VEBPmt0do/XB+lFjOUtl6V
	1xb4kF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTOp-0000000Axg4-0BDq;
	Thu, 30 Jul 2026 16:14:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTOl-0000000Axdm-2CTI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785428058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L+6btDPNM97WzMYH5D23AWn86cOtGDouehBPODye2wE=;
	b=VXYZ3VEKNDUFHo6RuungshOHBlZpwRGevAfEXH18VT4rgiRWGC+wvAritE3iRgf/v+wdMP
	Yi1BKb9DvAF5Wwmea8UZQgST/Fk7GtryKCdfSwd9Cb8jBFD6qLZRTW/0D2TDfwKYrf3sZt
	Hi9Aw9Onv6l5p8a9gW84Nu67gUENHLQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-0FAwTXM5OHiO_aNVeaDDKw-1; Thu, 30 Jul 2026 12:14:14 -0400
X-MC-Unique: 0FAwTXM5OHiO_aNVeaDDKw-1
X-Mimecast-MFC-AGG-ID: 0FAwTXM5OHiO_aNVeaDDKw_1785428054
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7f5b54da461so36723527b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 09:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428054; x=1786032854;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L+6btDPNM97WzMYH5D23AWn86cOtGDouehBPODye2wE=;
        b=qBJpyB9q9XqGoh7+35yqP0C5aBNcHnroexwymn3ES0syw1IDgQ+qcdJ5z/HjtoYmDJ
         DGAHWN8umpbJCyjhGQ3WKw7ZYPE33C5GxtJt7pmjAg8nYytbKYfrDT/QMBq8S6iOb4qA
         RokbNH/qePm8C7KzTL724Fa6IPLdlFiYgxjKbbdnRQs4NyW0UEZmMzl3IaAnAAtEVXqq
         NoV0y6VBPB2X3uQ3/JK8pjmE9/f7qnIDCN7TpYXRSOWt+YiuI68+EHl2IkNkJKhrqejy
         Ky87lOlfHt4Toh5cMNLoVle26v0mA05kfdBiw6KM5kp2VcC83MlRa0B15EZkDnjT63kt
         pjBg==
X-Forwarded-Encrypted: i=1; AHgh+RqZQboJ/ccsbSvI/34nJVOxmiZD2ZX+rbpdqnvi6Su2iuWeBE2Gx+C8rHFcXx3uDQ65Dq6XTFASIsGjk8OSfGgI@lists.infradead.org
X-Gm-Message-State: AOJu0YyvgHI5bflMcFEtnfTJSt2oSzIdOqOf9Vq0IQ9eZB77eVTjfTvX
	jd4+UbwRoB1FlvdkluvwLy/vkSpptNsq9G7zAZDJv7+wDRvA0FcsyaZKAH4Xy7bO30vLw68sYEY
	R9+/jun4Vcc/LRerwWCL+bSwxV6Xi14/HatsrCUHGhQuaEH0rx4+awuxkxNgMjhZJkzHH8KGjPS
	KL
X-Gm-Gg: AR+sD12r2zlvRY5AfbBW32IfNWKt06CuAM4Y25QycNpA1K2WnmfdOTkc/CYxOPy9YJU
	a7fu2CF0gU8pkQLnn3tSIZiMxTuBesGGxMBIAGoYRhP62ZmXuCFpwZKqYGjsUtbJ9+yOUW7coMe
	BXn0TKgUGRaGCCMFeXXYIAW/7MSHJchsCvd2C5usQuiX8WtLAewYVu4SPtlY9gVYEcCxoDZQUFM
	Yovl2XBO6EmChw4CAm4a7EHwjHDs161aXNusC8DqnfgpTIUElg5xGFqQlLnsr6Q1pd5yVK/3+rn
	dkbLoOQGlKylxmM/l7ge7jpsyFr2Dj51Ig4bcv5xa7TZYnIQtMgnxa9rONpT73Uw2PoV8K5nz3U
	gMSaEmmcfwE5DoepeINA9haqhnP4tq/BhUuQ=
X-Received: by 2002:a05:690c:c1e:b0:81d:bc5:4624 with SMTP id 00721157ae682-81fb8953397mr23680487b3.25.1785428053873;
        Thu, 30 Jul 2026 09:14:13 -0700 (PDT)
X-Received: by 2002:a05:690c:c1e:b0:81d:bc5:4624 with SMTP id 00721157ae682-81fb8953397mr23680137b3.25.1785428053319;
        Thu, 30 Jul 2026 09:14:13 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb8abd480sm12784947b3.36.2026.07.30.09.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:14:12 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:14:10 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	stable@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2 5/6] clk: mediatek: mt8173: fix memory leak on module
 removal
Message-ID: <amt4UpSfiMwxNTBS@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-6-akkun11.open@gmail.com>
 <amjCTJguiANLY0vj@redhat.com>
 <amja9vnEoRTstmGN@buffalo-ssd>
MIME-Version: 1.0
In-Reply-To: <amja9vnEoRTstmGN@buffalo-ssd>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pLXBXxOQBufnP5gdjeK_ObwrPye1hjtk4hGqR9Canq0_1785428054
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_091421_001052_40D44BD7 
X-CRM114-Status: GOOD (  30.88  )
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

Hi Akari,

On Wed, Jul 29, 2026 at 02:02:59AM +0900, Akari Tsuyukusa wrote:
> On Tue, Jul 28, 2026 at 10:53:00AM -0400, Brian Masney wrote:
> > On Tue, Jul 07, 2026 at 04:48:34PM +0900, Akari Tsuyukusa wrote:
> > > clk-mt8173-apmixedsys.c and clk-mt8173-infracfg.c do not call
> > > platform_set_drvdata() during their driver probe callback,
> > > but their remove callback calls platform_get_drvdata().
> > > This results in platform_get_drvdata() returning NULL,
> > > which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
> > > This leaves clk_data unreleased, causing a memory leak.
> > > 
> > > Fix this by calling platform_set_drvdata() during probe.
> > > 
> > > Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> > > ---
> > >  drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
> > >  drivers/clk/mediatek/clk-mt8173-infracfg.c   | 2 ++
> > >  2 files changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> > > index d7d416172ab3..65dc4489a09c 100644
> > > --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> > > +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> > > @@ -179,6 +179,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
> > >  	if (r)
> > >  		goto unregister_ref2usb;
> > >  
> > > +	platform_set_drvdata(pdev, clk_data);
> > > +
> > >  	return 0;
> > >  
> > >  unregister_ref2usb:
> > > diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> > > index fa2d1d557e04..8b69009e1965 100644
> > > --- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
> > > +++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> > > @@ -128,6 +128,8 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
> > >  	if (r)
> > >  		goto unregister_clk_hw;
> > >  
> > > +	platform_set_drvdata(pdev, clk_data);
> > > +
> > 
> > This patch doesn't compile.
> > 
> >     drivers/clk/mediatek/clk-mt8173-infracfg.c: In function ‘clk_mt8173_infracfg_probe’:
> >     drivers/clk/mediatek/clk-mt8173-infracfg.c:131:36: error: ‘clk_data’ undeclared (first use in this function); did you mean ‘clk_gate’?
> 
> Sorry for sending you a broken patch.
> I accidentally built only with ARCH=arm and missed the build failure.
> 
> While fixing this, I noticed that clk-mt8173-infracfg.c can be converted
> to use mtk_clk_simple_probe()/remove() instead of adding driver-specific
> drvdata handling.
> 
> The helper currently lacks cpumux support, but I have a reviewed patch
> for it:
> https://lore.kernel.org/lkml/20260304181024.738391-2-akkun11.open@gmail.com/
> (Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>)
> 
> Also, adding PLL support to the helper should allow more MediaTek clock
> drivers to use the common probe/remove path:
> https://github.com/TeamYogaBlade2/linux/commit/d991a61887ab76fd83708dffe8e48192e01023d5
> 
> Would it be preferable to extend mtk_clk_simple_probe()/remove() with
> cpumux and PLL support and reorganize this series around it?

Yes, that sounds good.

Brian



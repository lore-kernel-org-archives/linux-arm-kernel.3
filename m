Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22149C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9tbT3MmTWZadkFYtLmnXOyq2+XHjhkh1A8FrJjDKXM=; b=Jkugh4E1CNke6cgyDZrjjKAOwZ
	0tG7spsLO+bV/5rfsNf+bC3GLpegXaHvpipz+nKkEtPZYlcHmPfdb7G5yqLb62L6azX6nSqooDZi9
	qUdmZDLCHQ5S8CAzrKIGfqsaskM6JBVFIjV4dkEdZv18TzV2o3sNkxtflYuHtRtqGiOOHxqnbb+h9
	KaYe0pkV7q23CSs19NSdDEyt6RQQ4Kf4Rvwmu0PKgBJh9HhSgckFk6rvh2GcU79HoJIcLIclns4KX
	TYxJxbUAjDP8E7a4WxBsLvMCEupw4Yp10FMMhhBgIK7+HLhpk6mFNunMyw+NEz4guyZzMgiB9k/nr
	8WgzJwFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolCt-00000005tn4-1uGQ;
	Tue, 28 Jul 2026 17:03:07 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolCq-00000005tlW-2ZBf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 17:03:05 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cedda2ce6fso985415ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 10:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785258183; x=1785862983; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H9tbT3MmTWZadkFYtLmnXOyq2+XHjhkh1A8FrJjDKXM=;
        b=WyNGMJeaGfXncq6ykdni6hNIQFM79d3ACxbjJKO78UP2Ei9DR0e7r4rEN+jipbNrj8
         QEWlIvP+vsG7OrX57hRtRlK7+zu86ROtyNVXUEdszE7roprS/8+nZ/7KqzWyKY/R4h6s
         KLCsFSbXQ64A9WXv/x0ICWsylNCxekaYYMiFJkrVBXZjztnaT7UZ5qaN/iCZSKPyUHm5
         jdkGWxcpBYsZHhX8DR377THgVHowbU++jQdwGJfXc/DqHXJh8cgjn92+k4D0DfCqSf3G
         gsbcY3F9V7xjS4lhw1fCH25lzZAfOKcO+d6AZCri8lZM653IB29Zc7u7jMLwxfKiRJxZ
         R2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785258183; x=1785862983;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H9tbT3MmTWZadkFYtLmnXOyq2+XHjhkh1A8FrJjDKXM=;
        b=TqHx+mGdKujrcuEeeKr8inQMHSwGvUMLWnmXqnmZxmWOdwdbwC+9srXXnSS8ToFfmO
         B0Mp1xO0QuuGLsoJcpMDutRBjRF5u18ay5GZP7ahasYDtByaig/LvXpy8FSbO2WSyOmW
         XVLeSyc4d3Gh7+uIy5GVMcI7Nbc9a4Jk+ODruvDrNYEgjj5RQKlBfFZp31xJC2Ov+sha
         5V8yjtm7D8n9n44jtw4EVAMCgbWz1OvOpYBdTxySaW9NmiCBkN/YiWdsWTMKaRelv3OW
         OcoJQZx9vm+KFdiImkrcO49nFS9yQdW4gZFvHvaxSftiqMzy8CqmPt+GYtMx1g65x+JH
         czqA==
X-Forwarded-Encrypted: i=1; AHgh+RpciGkX+5Buajvw9zgLf1Q4yVw7tdQZMXUxx0Qd3/MgNC4PE5Xvx8s5VMtJMsa1sj+0CD/ZpbVt/F+ZOAw9+Qej@lists.infradead.org
X-Gm-Message-State: AOJu0YyO5IsOmMScfSgGe5dOaUmSVpMlEsCLJcTHiym2CFAk1icbAUJT
	zkp9gXedwsAvMN4kpfBdkEji2c7HmZtayp0RHmDikBAwA5EGFcoVuAjm
X-Gm-Gg: AR+sD13tgtrenUxQNVFrwj8RgUacFeHgYuNS58souo3nezB3zI1cgwpni9vNNvhqGhO
	DN6n8nqhNMNOlS8B+WOK9yagRpQvsfqYGHFTFW/8eWe6hD83+S/QPO96yREG5FZXdgkvzV9H64i
	s5Xiq+TZDU7WNycgzpvf7Tuq8RkjAKj/j+O6m2y59413wc9N+1w6gBH8ESD7GjwZpfE9Cjc7Nvm
	9Gw60LyJk34E5wpJsQLqzxngWV6Yb16MPbnBedB1n5o4UeSXVV2JsaYR12F029tvzYi6ZUwmp3K
	gnfJYHhcefsYYISCovmIlFtxN0s34zgnKtaDPVIsfeXJL3H5cmyizdFfp7hCKca9xF1w877kyzV
	b1CknzoFgX4hAiSglRZY+VSLITATRV78kX7EfNwJ3328+PWKviM3yUl7Q5Q7gh/E2H3k7OdLKqV
	au7jV5mQD20rOIAy3sFZbylbZn+tebhC1Dcg==
X-Received: by 2002:a17:90a:dfc7:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-38f6a33d8c3mr3853027a91.8.1785258183046;
        Tue, 28 Jul 2026 10:03:03 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f64111441sm1667127a91.1.2026.07.28.10.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:03:02 -0700 (PDT)
Date: Wed, 29 Jul 2026 02:02:59 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, stable@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2 5/6] clk: mediatek: mt8173: fix memory leak on module
 removal
Message-ID: <amja9vnEoRTstmGN@buffalo-ssd>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-6-akkun11.open@gmail.com>
 <amjCTJguiANLY0vj@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amjCTJguiANLY0vj@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_100304_657122_BD5C4527 
X-CRM114-Status: GOOD (  27.05  )
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

Hi Brian,

On Tue, Jul 28, 2026 at 10:53:00AM -0400, Brian Masney wrote:
> On Tue, Jul 07, 2026 at 04:48:34PM +0900, Akari Tsuyukusa wrote:
> > clk-mt8173-apmixedsys.c and clk-mt8173-infracfg.c do not call
> > platform_set_drvdata() during their driver probe callback,
> > but their remove callback calls platform_get_drvdata().
> > This results in platform_get_drvdata() returning NULL,
> > which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
> > This leaves clk_data unreleased, causing a memory leak.
> > 
> > Fix this by calling platform_set_drvdata() during probe.
> > 
> > Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> > ---
> >  drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
> >  drivers/clk/mediatek/clk-mt8173-infracfg.c   | 2 ++
> >  2 files changed, 4 insertions(+)
> > 
> > diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> > index d7d416172ab3..65dc4489a09c 100644
> > --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> > +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> > @@ -179,6 +179,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
> >  	if (r)
> >  		goto unregister_ref2usb;
> >  
> > +	platform_set_drvdata(pdev, clk_data);
> > +
> >  	return 0;
> >  
> >  unregister_ref2usb:
> > diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> > index fa2d1d557e04..8b69009e1965 100644
> > --- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
> > +++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> > @@ -128,6 +128,8 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
> >  	if (r)
> >  		goto unregister_clk_hw;
> >  
> > +	platform_set_drvdata(pdev, clk_data);
> > +
> 
> This patch doesn't compile.
> 
>     drivers/clk/mediatek/clk-mt8173-infracfg.c: In function ‘clk_mt8173_infracfg_probe’:
>     drivers/clk/mediatek/clk-mt8173-infracfg.c:131:36: error: ‘clk_data’ undeclared (first use in this function); did you mean ‘clk_gate’?

Sorry for sending you a broken patch.
I accidentally built only with ARCH=arm and missed the build failure.

While fixing this, I noticed that clk-mt8173-infracfg.c can be converted
to use mtk_clk_simple_probe()/remove() instead of adding driver-specific
drvdata handling.

The helper currently lacks cpumux support, but I have a reviewed patch
for it:
https://lore.kernel.org/lkml/20260304181024.738391-2-akkun11.open@gmail.com/
(Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>)

Also, adding PLL support to the helper should allow more MediaTek clock
drivers to use the common probe/remove path:
https://github.com/TeamYogaBlade2/linux/commit/d991a61887ab76fd83708dffe8e48192e01023d5

Would it be preferable to extend mtk_clk_simple_probe()/remove() with
cpumux and PLL support and reorganize this series around it?
or should I keep this series focused on the current simple fixes?

Best Regards,
Akari


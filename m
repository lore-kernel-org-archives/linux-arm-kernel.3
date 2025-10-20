Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A5BCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZiaSM2PnoC+EdbhzADV84+t+uutkx1Amp/dmBBeJxQ=; b=LnKnJSfL10hYe8er4212aVdOs2
	5OxYJKm6f8VpYU6r7QJeAjW0wTNKy9XIwIT/WNaLMspNNUeP/uOunM+oLJVoWTS6FXYEp5F7lRIRM
	EobSG3htVkVIajb5fILWcK0cz+dOagACdkUwgU68kv8Rqp1kwssy2a1Z7qIsryLkgrsPz0qaJy3vg
	cl/iHfEFwr1zEiu/OlCAgV1dzO6BMAU7fZk2GL3IxbaaqWvewbrBO5rvcCFgy/RmTJiE98TlgA8xt
	ZwTJasqx4q9dhmBEEH17QvfBWslcMug6gPhkF/OBUbEGjpPRqRVICFr143igPD2LewRBIjb7AIsfx
	vvar0pjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvgZ-0000000Enew-1hNT;
	Mon, 20 Oct 2025 19:36:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvgW-0000000EndV-3ljm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760989007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5ZiaSM2PnoC+EdbhzADV84+t+uutkx1Amp/dmBBeJxQ=;
	b=SLxKsZLeFrUy2G8+Xmcm25oAQ1AfxdoeKnnHFdmco8Nv+7eq0bxPAHWwba8weZke/YLQTH
	UiMMucZlztLQIezZDo0R9Tok/OV9lPsd/4ZkFo4Dg+a4PhnbQOzB6hCuWymH6BH0EcIqeA
	5UtiGhMzOWpA+zq+MOaGyJuaQGzkFAI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-6Z0dFG0nNw2bkeZyb6YgWA-1; Mon, 20 Oct 2025 15:36:45 -0400
X-MC-Unique: 6Z0dFG0nNw2bkeZyb6YgWA-1
X-Mimecast-MFC-AGG-ID: 6Z0dFG0nNw2bkeZyb6YgWA_1760989005
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-827061b4ca9so1487500985a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989005; x=1761593805;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZiaSM2PnoC+EdbhzADV84+t+uutkx1Amp/dmBBeJxQ=;
        b=czB/8d3aDZ/9mqtnh4kfoKRavk/nJSUSl/zK+8CZ11ZFJYHBAHYVbE17jZh0+BGrDW
         TAGV/Omv4LTknYOXFEXuNj8W9VAjGqqfcsIIX6kwGOHJT3ifKiHRph99cd8x14c5L5JR
         uj1pC39L0VIy4UIMUZ0Qvi01C756jOieikFoPMErqrVC7quhm6mtY8C6o9mfL6GmPBG1
         PtrHC2gCCCzgx8QJlSvXh4EI2ib09GNhAaarfzbrsOkj5FyEnzbxM2+BobAo8fMRHaej
         vwLGtfU2kpuyZiZg/3RTcHZ3BZ+HhX9hbzhvtRUPHjI3o6/EOisTUHnU/kIpd35KCDSQ
         sCbA==
X-Forwarded-Encrypted: i=1; AJvYcCUSpVYcC9j5KjiKIEh2vhWgJT1tbUD7weXIBtCWHKksgs7tmtmLhZxsRTWg/peihx+w7vYsSncTalc1TY3lwWXo@lists.infradead.org
X-Gm-Message-State: AOJu0YzkFRPU6PRUuu3ln5CkPfI1hR9ZbhDB4rB94Gg6dm3etvNvvsY9
	DwqOQVMKNfuwXKVkh1sVkQSejTD7AfpndQ1l+hh97++Tt2TiGIgQkrtY+WR0Daq+7Dx2K5vQhoV
	NDl47psxjIhVBjwvPoRDrYk048Nu3qqDoQBNGKCnTjAmoAsI0L1nTse9pdXe0+EN7/Q+gBRkqdr
	6f
X-Gm-Gg: ASbGnctna7EueIt95hsQT2tcXz8qshg4wp9ohrmxSuYmPc1iv7WezKnCWX84MyGa6WN
	KLrlpIi5WDM4PQzXrvcBDI5EgmrEcdI7+jmf1DNbPINq89aGUhwQCn1bMrRxb/v/Xoz5HpXDSY6
	e76bZofpz/cC55s1saIaLe21akAewwLd27btn55jy83i0wKYdruFT7BrPzH31adAj+7TKa1PjgX
	rUI2LZx7sz5roste3qFJjCfadkULmAnZGts3Ck2/nzUc65+Xc0OG/U9daD85VydrGwBSKpWlQ9O
	7kkHp1RxbTugSFWVAEou8Q14n3gs6tTGRm87apZFQAW4XTEu0/1re3+izy/WQHmm4hokpOdZlFg
	E0yBt2EG2ACs4cBMhzaVVqQL9SVRluQ==
X-Received: by 2002:a05:620a:372a:b0:859:be3b:b5ac with SMTP id af79cd13be357-8906e7b97famr1467032885a.4.1760989004784;
        Mon, 20 Oct 2025 12:36:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsNNiKmKY9peurhzlqev2tF6KISu0JNaKtgEbeRgj3Y5mOQwBz7wnSHOaZ0F5uLAZ7ugJitg==
X-Received: by 2002:a05:620a:372a:b0:859:be3b:b5ac with SMTP id af79cd13be357-8906e7b97famr1467030685a.4.1760989004383;
        Mon, 20 Oct 2025 12:36:44 -0700 (PDT)
Received: from redhat.com ([2600:382:7726:4296:a56e:fe07:ce3f:d5f0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8924e082780sm537713185a.51.2025.10.20.12.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 12:36:43 -0700 (PDT)
Date: Mon, 20 Oct 2025 15:36:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
	kernel@collabora.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Message-ID: <aPaPSeClhiq2WYJN@redhat.com>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <20251010-mtk-pll-rpm-v3-1-fb1bd15d734a@collabora.com>
 <aPFbDl_JKyDay1S5@redhat.com>
 <3342669.irdbgypaU6@workhorse>
MIME-Version: 1.0
In-Reply-To: <3342669.irdbgypaU6@workhorse>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UJXvwq5wErI7GV9w_l4L-LCw0duzUPvHEiWItrLgedE_1760989005
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_123649_010295_2C67C584 
X-CRM114-Status: GOOD (  42.60  )
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

Hi Nicolas,

On Fri, Oct 17, 2025 at 02:21:55PM +0200, Nicolas Frattaroli wrote:
> On Thursday, 16 October 2025 22:52:30 Central European Summer Time Brian Masney wrote:
> > On Fri, Oct 10, 2025 at 10:47:09PM +0200, Nicolas Frattaroli wrote:
> > > When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> > > operations, such as setting the rate or switching parents. However,
> > > another operation that can and often does touch actual hardware state is
> > > recalc_rate, which may also be affected by such a dependency.
> > > 
> > > Add parent enables/disables where the recalc_rate op is called directly.
> > > 
> > > Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents enable (part 2)")
> > > Fixes: a4b3518d146f ("clk: core: support clocks which requires parents enable (part 1)")
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  drivers/clk/clk.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 85d2f2481acf360f0618a4a382fb51250e9c2fc4..1b0f9d567f48e003497afc98df0c0d2ad244eb90 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -1921,7 +1921,14 @@ static unsigned long clk_recalc(struct clk_core *core,
> > >  	unsigned long rate = parent_rate;
> > >  
> > >  	if (core->ops->recalc_rate && !clk_pm_runtime_get(core)) {
> > > +		if (core->flags & CLK_OPS_PARENT_ENABLE)
> > > +			clk_core_prepare_enable(core->parent);
> > > +
> > >  		rate = core->ops->recalc_rate(core->hw, parent_rate);
> > > +
> > > +		if (core->flags & CLK_OPS_PARENT_ENABLE)
> > > +			clk_core_disable_unprepare(core->parent);
> > > +
> > >  		clk_pm_runtime_put(core);
> > >  	}
> > >  	return rate;
> > 
> > clk_change_rate() has the following code:
> > 
> > 
> >         if (core->flags & CLK_OPS_PARENT_ENABLE)
> >                 clk_core_prepare_enable(parent);
> > 
> > 	...
> > 
> >         core->rate = clk_recalc(core, best_parent_rate);
> > 
> > 	...
> > 
> >         if (core->flags & CLK_OPS_PARENT_ENABLE)
> >                 clk_core_disable_unprepare(parent);
> > 
> > clk_change_rate() ultimately is called by various clk_set_rate
> > functions. Will that be a problem for the double calls to
> > clk_core_prepare_enable()?
> 
> I don't see how multiple prepares are a problem as long as they're
> balanced.
> 
> > 
> > Fanning this out to the edge further is going to make the code even
> > more complicated. What do you think about moving this to
> > clk_core_enable_lock()? I know the set_parent operation has a special
> > case that would need to be worked around.
> 
> __clk_core_init also needs special code in that case, as it calls the
> bare recalc_rate op with no clk_core_enable_lock beforehand. It's also
> wrong, in that recalc_rate does not necessitate the clock being on as
> far as I'm aware. (if it did, this wouldn't be a problem in the first
> place, as enabling it would enable the parent as well). Changing the
> semantics of clk_recalc, and therefore clk_get_rate, to also enable
> the clock, would be a major change in how the common clock framework
> functions.
> 
> In my case, the __clk_core_init callback was the one that crashed,
> so it really needs to happen there, and I really don't want to
> refactor every location where `CLK_OPS_PARENT_ENABLE` is used for
> a bugfix just to avoid potentially checking the same flag twice.
> 
> Having `CLK_OPS_PARENT_ENABLE` cleaned up such that every clk op
> that has potential register access is never directly called by the
> clk core except for one place, an accessor function that does both
> pmdomain and `CLK_OPS_PARENT_ENABLE` checks, would be nice, e.g.
> by keeping the clk_recalc change and then having __clk_core_init
> call clk_recalc instead of the recalc op directly. But then the
> __clk_core_init logic needs further refactoring as well.
> 
> I'm not sure I want to do that in this series, because it's quite
> a bit different from just adding the missing check and parent
> toggling, and has the chance of me introducing subtle logic bugs
> in what is supposed to be a bugfix.

I agree and that makes sense. Thanks for the explanation. What you have
is a good compromise.

Reviewed-by: Brian Masney <bmasney@redhat.com>



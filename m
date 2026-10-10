Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AC0CA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 14:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDnCu2/UzjdlBjBG61ofGnnF+daBO265HXx+uRzlR2c=; b=hsLO0Iacuskp5A1UC/RtGt6W+2
	my7YV1tL11yrvRP6G26TfVsiTvhRVcfgD5mMrFywvpWV6H9NJr7ty0w/66F4z/P3z2fH45DqVkv0N
	FBKbP4DHmoVxV4LscmcTC6pJsKwztSClvMouQYKU5SbnpDevHiMQJrlR0n8L8wyR0Gs2ELHkxv1sf
	KxPKa2xVonkl4FvG8wvucIthk25lBFJxW53d1vkkuL8TmxlStSmLQvQd4jkOIQRhPsFHSN9MPNsNy
	vHrCFRa2kxc2t17uqb5trBC0A7gUHy928X1De9W7v+EdRBppkhTMAAc9dCrDuIjgdOBIyQc+yqHTY
	KULcM+9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFY9d-00000008Aqb-1Wnz;
	Sat, 10 Oct 2026 14:34:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFY9c-00000008AqT-0Eu6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 14:34:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 22D6560202;
	Sat, 10 Oct 2026 14:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87111F000FF;
	Sat, 10 Oct 2026 14:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791642866;
	bh=cDnCu2/UzjdlBjBG61ofGnnF+daBO265HXx+uRzlR2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JxylpYuFGD0bsDT2yhVbDIn3AI/VXQPGQBV/T2NiKD6QMdyuqDrlaTQy1jSVAympo
	 l9JlGJgJnVXPYKic1RsQDs4Gtwo/hxMbpAerxtx+iw4a8DUTCkFNHIZDipOBRdov1X
	 c8gy+SVnoZ980NxoF10HJEEAutRLV3yy5wrcR+Pcu+qtqDPFU2TaVNBWDU6V8oIb0l
	 cv5tN67XsacVP1/3VqUuOo3juyGfo1hNvCW6syIN1yhbwNVpQQ5kEtUDf8UVhOEEu2
	 2O82OS7q9ZIodA6FLR/nA/88gdNT3PjVvyeqdum1U4mQbZmbBTYvF6zJuSsTrBqRBU
	 l0kmkzoVmw4hA==
Date: Sat, 10 Oct 2026 16:34:23 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@prisktech.co.nz, wsa@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 04/20] i2c: viai2c-wmt: Fix clock leak in wmt_i2c_probe()
Message-ID: <aspGdlG2J4h6KxFl@zenone.zhora.eu>
References: <20260916070631.1965713-1-vulab@iscas.ac.cn>
 <CABjd4YzNzZ0nnO4Xgw1JsRHhj9Crc6diX1uJnWHpHvd6BcPk2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABjd4YzNzZ0nnO4Xgw1JsRHhj9Crc6diX1uJnWHpHvd6BcPk2g@mail.gmail.com>
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

Hi Wentao,

On Wed, Sep 16, 2026 at 11:17:49AM +0400, Alexey Charkov wrote:
> On Wed, Sep 16, 2026 at 11:07 AM Wentao Liang <vulab@iscas.ac.cn> wrote:
> >
> > In wmt_i2c_probe(), i2c->clk is acquired using of_clk_get(). If any
> > subsequent operation fails or when the module is unloaded, the clock
> > reference count is never decremented via clk_put(), leading to a
> > resource leak.
> >
> > Switch to devm_clk_get() so that the clock is automatically managed
> > and released.
> >
> > Fixes: 560746eb79d3 ("i2c: vt8500: Add support for I2C bus on Wondermedia SoCs")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

this is 4/20 but where are the rest of the patches?

> > ---
> >  drivers/i2c/busses/i2c-viai2c-wmt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-viai2c-wmt.c b/drivers/i2c/busses/i2c-viai2c-wmt.c
> > index 2cf3cc0165fb..74ca93b44347 100644
> > --- a/drivers/i2c/busses/i2c-viai2c-wmt.c
> > +++ b/drivers/i2c/busses/i2c-viai2c-wmt.c
> > @@ -117,7 +117,7 @@ static int wmt_i2c_probe(struct platform_device *pdev)
> >                 return dev_err_probe(&pdev->dev, err,
> >                                 "failed to request irq %i\n", i2c->irq);
> >
> > -       i2c->clk = of_clk_get(np, 0);
> > +       i2c->clk = devm_clk_get(&pdev->dev, NULL);
> 
> Maybe we could go for devm_clk_get_enabled and drop some more
> boilerplate which follows in wmt_i2c_reset_hardware, while at it?
> 
> Backporting this to stable seems like a stretch to me, though (it's
> quite old code, so there would be quite a lot of backporting for a
> rarely hit resource leak).

Alexey asked a question. Wouldn't it be good to follow up?

Unfortunately, this is becoming quite common with LLM generated
patches, where questions are often left unanswered, perhaps
because the patches are not fully understood by committers.

I think the patch is correct, though, and Alexey's suggestions
can be addressed after this is merged.

With some disappointment, I'm pushing this patch to
i2c/i2c-fixes-2.

Andi


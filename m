Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B87C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 21:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kA3ZZhBTSElNS8aKZBmn/3V+poXJbKTYV5bqqaHIws=; b=PoGywAJko7zAQmRv0un13DMPHS
	em89Qkz96H/2ulnzAzYmFTGi4eZ8OkhMP7CeQzwHkLKGFFG4XYH+6hNn3NB6hEkDq4IQCeDZ8BRAa
	qz5oQWR7v2Qv0m+ZT+pyjbS9O6E+H3GDRhaPxUWERciUTRqk6/wid/VRqQghx+NVQCRXQfp0lETZW
	4fRE7OmJ3bUvfOXYjIImBngDhATuwxqIz35GaQweP9tB88ojTrbB/whvQNyskMeq+7GD09ZsLaknx
	eoepiJwz5HFfCm4isoqBpFDqMV0oUg6995c6PCGNMOLkRj0ZHLN+4xkKtGeKqmESHpmjtR60x8peA
	GciVfmBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxA7j-0000000CCSe-0NAD;
	Thu, 20 Aug 2026 21:16:31 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxA7g-0000000CCRv-1bG0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 21:16:29 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c15e592da74so44198866b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 14:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787260586; x=1787865386; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5kA3ZZhBTSElNS8aKZBmn/3V+poXJbKTYV5bqqaHIws=;
        b=E8mcGXvaR4HRygoFpc8p6dt5lg1ImwcWBL6/jZ1f1IVaVZLVnqk0iiOxDA215084rM
         TAbrxSYmUAij9fNHJsTf0ds+lf6cf5y6HKq/b/ITgIDPp7qyEhe3xxFauZydCCroc++G
         KVMK5f1U9bsppn0kqLOljhzMQ1GqKO+1STdQtkkLmGlJo9o9FVzTgB+zJVFf7AqI5oEz
         7do8+zl3Vzmgo7k3MCJF+4GYDfEYdMTWlRQysuV91QiiIK2OaMTJ81gBbtVuKgQ5PzFX
         Gr9myFy39KzmCYcmjYtaVvbcfrbxh3e2JT59svYgkk/IgjiDtix20/prIH52qnyHUa/b
         gkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787260586; x=1787865386;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5kA3ZZhBTSElNS8aKZBmn/3V+poXJbKTYV5bqqaHIws=;
        b=NTwGVMGKTL2haEmnb1zo34CeKg9em9uHbEI7JUKxiTgsw+EZepZIyesrv0rNEECci6
         EZSjtoTjxt61HgsNWmkXhloFjMcWrwp5fQlAI+9dNPABGi4W6fyVgLywDUNO8KagsJVB
         +LbsHp5z1lsh0OZ2TRjIokxyrbbtrv0IZsaLsaq3aZGwMkqcIzaIiSqGQf2ro6TgHVI8
         XkA3K4TFeSXIcEF21yAhX5XrDXF2waZ08zD/k0ORnaf5QZ69mao042wiReQcr0oONOk5
         B91Kdtme9utGd1GCtmpYa5pN+n+craUWHjVQ0GrI4wLk61RE3PLeJt/nXsQH4rPmg++B
         iugw==
X-Forwarded-Encrypted: i=1; AHgh+Ropsm3zoHRwfEno1XXe5D/TGfsUTnNTHJg4T+/vZrAkqgMQJCbvFzYJSysM52RZRGMcpj/iuOOO3JAVfmrwZsYC@lists.infradead.org
X-Gm-Message-State: AOJu0YyPl7E0MANkbfGR7JEbTiuyCgyDDTgorZ0TpGJ5O3CukSnOZcQY
	CLj6zuyTtWndcx+mSgfww7gMZTyHwM0LrS+5fECzZPCAxjqf0slPHe2t
X-Gm-Gg: AR+sD12a2SF+/RpBnOZrzltivqR61XSsKbjyIlMQsishLL28rR8/sHWDM38e4elwmWx
	+sHA/3M6ziPcX8EH7uknc0yqranDJdzrQQkdcHoWuLjH8N5J9yGrwjEBQSz08pBap/OZwnpH2Kt
	PvSuaFK7khVN/Wqyz0WwE9V7OqSI4aw41vPTicoQXD+TET2IjP7G3w5h23vvQdf6Tx9oAJGvpYa
	HLcx7kAA4e9z/zSs+gdVSMdaCzTKiKRsPzX3e8n9a1irc030fhE171yCckXywkZwm5oEFzriQSK
	O1Iv1Ixj4PtCbwzUyA+XcicYshvlCRIggY8fjCZ4K/j09Go2UX5LjrFBeG7wNQSTWxjdYxmk2RQ
	BIKMHsxbGZGZc0nNzM/lg1tEXmcSsNn7dWc53Y8PckmTZih6lM4dLuZMg7jEaAqSIcOdcPXeUUM
	NCR1+PRMGNz4FHTePX7g7DFczmvu3n4X80DIs9gxMiYkWLROY3CxDrYO+XGNlNaO/i6ZnHInKG7
	Fv77EfzXFjdX96KbPsAq31J2OFzf+vjIIDm
X-Received: by 2002:a17:907:80e:b0:c1c:4a80:30c4 with SMTP id a640c23a62f3a-c246a6055bdmr133567066b.11.1787260585986;
        Thu, 20 Aug 2026 14:16:25 -0700 (PDT)
Received: from michalis-linux (adsl-75.176.58.251.tellas.gr. [176.58.251.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b07504sm148630566b.15.2026.08.20.14.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:16:25 -0700 (PDT)
Date: Fri, 21 Aug 2026 00:16:23 +0300
From: Michail Tatas <michail.tatas@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: verisilicon: rockchip: Fix leaks in init
Message-ID: <aodup3TleCfdxcF3@michalis-linux>
References: <aoV3LLy5hSoKL4QP@michalis-linux>
 <aoXgSKnkbWZVKRui@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoXgSKnkbWZVKRui@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_141628_441206_F525A0CB 
X-CRM114-Status: GOOD (  26.60  )
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

On Wed, Aug 19, 2026 at 12:56:40PM -0400, Frank Li wrote:
> On Wed, Aug 19, 2026 at 12:28:12PM +0300, Michail Tatas wrote:
> > if one of the dma_alloc_coherent in the init fucntion fails then
> > the previously allocated ones leak.
> >
> > Fix by freeing them in the error path.
> >
> > Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
> > Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
> > ---
> >  .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 68 +++++++++++++++----
> >  1 file changed, 55 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > index e4e21ad37323..fa77fd402412 100644
> > --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > @@ -369,6 +369,7 @@ void rockchip_vpu981_av1_dec_exit(struct hantro_ctx *ctx)
> >
> >  int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
> >  {
> > +	int ret = 0;
> >  	struct hantro_dev *vpu = ctx->dev;
> >  	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> >
> > @@ -377,39 +378,54 @@ int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
> >  	av1_dec->global_model.cpu = dma_alloc_coherent(vpu->dev, GLOBAL_MODEL_SIZE,
> >  						       &av1_dec->global_model.dma,
> >  						       GFP_KERNEL);
> > -	if (!av1_dec->global_model.cpu)
> > -		return -ENOMEM;
> > +	if (!av1_dec->global_model.cpu) {
> > +		ret = -ENOMEM;
> > +		goto global_model_cpu_err;
> > +	}
> > +
> >  	av1_dec->global_model.size = GLOBAL_MODEL_SIZE;
> >
> >  	av1_dec->tile_info.cpu = dma_alloc_coherent(vpu->dev, AV1_TILE_INFO_SIZE,
> >  						    &av1_dec->tile_info.dma,
> >  						    GFP_KERNEL);
> > -	if (!av1_dec->tile_info.cpu)
> > -		return -ENOMEM;
> > +	if (!av1_dec->tile_info.cpu) {
> > +		ret = -ENOMEM;
> > +		goto tile_info_cpu_err;
> > +	}
> > +
> 
> This function is called by hantro_probe() if I am correct
> 
> there are dmam_alloc_coherent(), use dmam_alloc_coherent() will simple
> error handle and tear down.
> 
> Frank

Hello Frank,

I did not know about the dmam* functions thanks for letting me know.
I read some of the docs about them and they seem to not apply to
this particular case since this code is not called from the probe
function but rather the hantro_start_streaming function. Since
dmam_alloc_coherent() only releases memory at device removal,
it wouldn't free them when the stream ends and a new stream would
re-allocate while the old buffers lingered until detach.
So I think manual dma_free_coherent() error path is the correct
fit here.

Best regards,
Michail


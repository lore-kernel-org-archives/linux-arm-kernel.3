Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97521EFD209
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2LJlLYDb1+QOSf2a+RA+BcJzRTj83OmLJeFRnjwCps=; b=yT1qpIvdHYHcRYKr2Qu/XPGMvX
	ToOUX50fNshYxVe8+klrdvu+7d1uLyDtFwkh+QFTSBCpYMc3cOd8SOiln4lr2AOuSogVXfIr992B2
	T8HJho4mESZ/hsF+45liiibM66/ptkTObMKq6pCq7c9qBUXeTa2lbdUgme7lzqU9HFW4ygQhrIe65
	nDygKcZNxTB30A6pJIj8cczfwpBSTLENapXYetNRWA3tRkE47IStDe+HgUAzKFMQdCeAZ38QzFzA3
	ZOwH4Lci7AOcjsIhdVbTMSdZx0bwWu5mbkpc4zqutu+NhnMf7vxJviDj/JuNR7HIWzqI9F02Y2EmA
	TbmzpTqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA4B-00000003VOd-2Av3;
	Wed, 25 Feb 2026 08:16:19 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA43-00000003VHF-2oh7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 08:16:18 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-65f92a597a1so334597a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 00:16:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772007369; cv=none;
        d=google.com; s=arc-20240605;
        b=S+QDsB4U2CkQM9YZDBtYc3vjcAUSpjoHlTJIetC0c0S3unqMFotfXD93U73BDBBPb4
         gFod5pMGRn36wYj6dS+nBM0Sj2veGoRdtUj45lT4HqlA/hLiquR6KAGQOevOk8wJIleE
         NfjAFQzr4ctlkEFRA1A9otrbjOtAccGH1FUs80T99ZnD1nMH21XfEWr8Edq+gipPMpBU
         YoBYba2dWBnztjUnlXseBnTyQ4Qd75OBRBxZiql0HS/xDiIM8bCm6FasKpilUQjfwI3r
         0vDfOjNumR+pycTRmdFOc5HrAAYhSqwZhosrLzflb5DJcHScgQVEhCEM9EY4vufRK6Sn
         CayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x2LJlLYDb1+QOSf2a+RA+BcJzRTj83OmLJeFRnjwCps=;
        fh=YJCoIutsqVJpQWsUyY2SjWLwSyIG1bJpG3xxbW7hVOs=;
        b=SMXV5FK+rmi+J9z9TZna6czFjCp8YeoIYJ/q52Y6oxvKbsSWpTZtiq21D1VtymFbsh
         yCW2cT70ZU/D8VB8jwQ4yfO1LjNufAu9omGcobVOmsVz8vOmbB/67E1u2P5wkKCzMMGu
         k4jlMdOqAhCgqU8b+3Wosn2feORoqdPWacwUoQ+Vs7aQ4XwuURcFzC8wXhqmTxgWnJJ+
         xC/Dx+wi3RJlCcVGwxE30hkkSL+k4dXSPzKUVLQDMD2eLQWFRCqDbJlYvLY9mKqlrbGK
         q1OsRVfgwvdD+HtWh0DcI07kZWRyjmCd8xaOz3XWprg2e+T69WZeJgR4jqmPyNo5sa09
         1Rqw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772007369; x=1772612169; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x2LJlLYDb1+QOSf2a+RA+BcJzRTj83OmLJeFRnjwCps=;
        b=lw8+bbiRh+baV5e5K+CRhyGp6G3FriYe2jEJVVQ9zkLHpQt88idf+ZTtH0CsbmGfGq
         uW+h/ozKE0htXULCeOSRZi+CJvfEpfVcwk1/UJLjQEX6DYjFBXArA3HMsA0U+Ynjz/DD
         kbRksaxBfFLyStzX0SM3tIrGxxWdubOjc3qmaYl+lBsipHxl2KX5dW1mJcI0GD8rNi1+
         Sw1ijGeojd4fRcTZyL896PD3cOn35w0Zh2X8DvjjBXF3UpkSji/CymmYcwtgh6jaaNYb
         08eL//15qGvAZbUyK0XCeXyHqGU1UMr4tdkM47b7c0qm7tTZPIJq4fauUNTllLBb9ClY
         +9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772007369; x=1772612169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2LJlLYDb1+QOSf2a+RA+BcJzRTj83OmLJeFRnjwCps=;
        b=UaZ1/iSQOnISewHxbOqJo0AtGYFsyoV8uYjgXLBmrDg2oc5vMgK+ehpT8J+vtYW1O7
         cbpNnig/tqG9f4Pw5JyViFO0Bn0WW1xnMYCuHFR4gpjiC3V14JVNZJsa2k7duT5UfOte
         n82bvNSJFYeos4swx6WcsSzfzecTOekhk2kSSsXLDdaY2IpUr7NIeTKvo8WOVQ4pIeGZ
         mTLQdhk6AZhunAGPO7rVkJES6Z7/oTjVxqn21bAmMZZ2KRIMeEqWvloJCubBqdRKmCnf
         cBSg71MWv0LNjLFxOu9cD57dcs9F+dOMyfeAi3bTKQ4ktjrleaYkt5EaFPkdFiZD5cj2
         /yjw==
X-Forwarded-Encrypted: i=1; AJvYcCUdMK31gykgUOo43+kF0iYu+MJCtEeLGr0a3DDmMrHzi19B/vp8oPJ+Vjsbzvvn4OZ+J0R07JI+cFUDTx+DcTw1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9N46vcZipLYq9/IbIa/AifdghgupLGhVLiWvrlKqQIpa9bdzg
	bhH52MDgO3sPxSpuX0sZW2irWEAkHPvNKRld4I7Dq8IXKfFqQzkrOQBuyNqjG30NlVkJZFwq6xn
	3T+ndNukEU89Cb7I7MoOEDP89mZJCXf+NhBBatTA=
X-Gm-Gg: ATEYQzz+psru4w8kaQeLsyVXvLHFt+OWb/Uzlgz4+Em8gbYbUp333FmLKBiTc+6bEX3
	MzRI6XdSs0qAxC80VytZi4gDGTCFduHjAzrRnIx2VvSL2yDpVMUH0ytMTOc56KJWqISMAPrUIYp
	fx0TCykWVONkQf6c1PuKSnKbQFZZACtY1WKDt2gCAuvjD9cQKZamiDXCxCelJMI4XVqXxQTEA1u
	hl/OIZsQZesyc0FbuM2grMv37Z3vZXcIOvcY3h0Zuz1TrT43qPyW23HHhID+RHBMmLi8k/oIA6o
	T1VPNA==
X-Received: by 2002:a05:6402:23d0:b0:65f:8b6e:e1e0 with SMTP id
 4fb4d7f45d1cf-65f8b6ee3eamr689444a12.14.1772007368034; Wed, 25 Feb 2026
 00:16:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1771863641.git.l.scorcia@gmail.com> <2fbf179c03c61f527e2583f9df4f97f6aaf3297a.1771863641.git.l.scorcia@gmail.com>
 <bc064717108de5ea1a8c98937bb03fd00794682c.camel@mediatek.com>
In-Reply-To: <bc064717108de5ea1a8c98937bb03fd00794682c.camel@mediatek.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 25 Feb 2026 09:15:54 +0100
X-Gm-Features: AaiRm52dJLE1LivX43DCdk6HfEogq21vfzP2R-PH1LBTeVTcW8EPNiYL5Cy5zOU
Message-ID: <CAORyz2Ki5aPNbcY5-_mRwFgwT46VN_pRV2iP7z7x3snzrbKz=g@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/mediatek: dsi: Add compatible for mt8167-dsi
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "robh@kernel.org" <robh@kernel.org>, 
	=?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>, 
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	"mripard@kernel.org" <mripard@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"airlied@gmail.com" <airlied@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_001615_260761_F8ABE647 
X-CRM114-Status: GOOD (  20.63  )
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

> > The mt8167 DSI controller is fully compatible with the one found in
> > mt2701. Device tree documentation is already present upstream.
>
> If mt8167 DSI is fully compatible with mt2701 DSI, I think the binding document and device tree should be modified.
> In device tree,
>
>     compatible = "mediatek,mt8167-dsi", "mediatek,mt2701-dsi";
>
> And this patch is not necessary.

Hi, if I understand your review correctly that's what v2 [1] of this
patch did, but the change was rejected during review.

As far as I can see there is no win-win solution here. This tricky
situation derives from the fact that in last year's submissions the
change was only partially merged - the bindings went upstream while
the driver did not, and now we have to work around this. In v3 I tried
to address the issue by actually implementing what the binding
document says.
I'll be happy to resubmit v4 but I need to know what's the consensus here.

Thanks!

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com/

> >
> > Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index af4871de9e4c..ad10e86b161d 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -1301,6 +1301,7 @@ static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
> >
> >  static const struct of_device_id mtk_dsi_of_match[] = {
> >         { .compatible = "mediatek,mt2701-dsi", .data = &mt2701_dsi_driver_data },
> > +       { .compatible = "mediatek,mt8167-dsi", .data = &mt2701_dsi_driver_data },
> >         { .compatible = "mediatek,mt8173-dsi", .data = &mt8173_dsi_driver_data },
> >         { .compatible = "mediatek,mt8183-dsi", .data = &mt8183_dsi_driver_data },
> >         { .compatible = "mediatek,mt8186-dsi", .data = &mt8186_dsi_driver_data },
> > --
> > 2.43.0
> >
> >
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com


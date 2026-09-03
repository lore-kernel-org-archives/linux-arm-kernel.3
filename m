Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA15DC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 03:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=; b=CrfsTUQ4zMlrMA20H1yK8pxohF
	Fk/8USUAQEvHtjEWuk5BFxzt/hBpnpX3fw28EXZ3GEOna1+6Re7MNDvhZqjMbecyPgw5AkF784+fC
	rouhkasGWKmBMZwqt4qH/PMIyF8tTJxCTFP8epG3QNdxeeYZCJdnedq1wqypzr8UEa/jBd7dyVU76
	IrMKJ1EWJFc4NU7tli0G5XBmG9o9wU48tcmy3FhHYfCS7gqDqgaNmhPnt9SqUbo//sQ5XRfnWeKBE
	na4ioPRwqRA5lPPn6v8Ta+3Ih6ijmu1UVt8GF1PIWxplTfvPe0zKiqURtIqW2MfFsIXdisxkhUmIF
	g5eYFxdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1xoK-0000000GFuZ-36qn;
	Thu, 03 Sep 2026 03:08:20 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1xoH-0000000GFtK-3CXx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 03:08:19 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-857ff9fef54so19724927b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:08:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788404896; cv=none;
        d=google.com; s=arc-20260327;
        b=B718ZfKVM3Jm9T1qhuE63XeYXKuDAbQJRHY0vH4+BFs5e4DLHlVJPfKdeqC02rZgXp
         Nn7DcqYqGa3vjuXJ8nXt0mU4+Bw2n+YvL/fs5O9bwNDIdAPzJAkWMDD0sOY5m4o/Jw2v
         jl/IihTMOqBXmOZ71dkuAw041G2s/FY3JOqxjskxOfGT0MIYVOQQreg1+i5YedUs+Fcg
         p8Amvyk839/Y1luIhMY4v0jzAhvb55y+J6VYQM6lfu1EibJbC6wm27BQW8wmzwhRv2Ow
         pEdLeKHyY/FfBBcrzewju3Gq4bahpMsMd+vbohFZ9wWEqhObXCfDsuKfNevgWAeqYXpx
         rLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        fh=9oiSAVqy/TN0yiSANsiGmchFfmmElnhtu8jI1ca0unU=;
        b=f02U4b6j1b9giF7ulAcwtcxUzSdGTRzcnHmzH8iw0cX3TucC96t5FRHkxnFhGIDQup
         AuqV65pZ6plIe4M+xMIPm3lSooD2T3nPxbLOn3zUgNoIKKld5zpxdFbqFR9xW6PcW9xh
         fQag+zGIqYS1ozTG0tii18jC4joWm8IvSom69BDpW2R/vNXBAfIWBbnrLksKkiLd0UYi
         PUW2O7cSNKUt7mBH6yzxcW9T4ozfOUEj7wiaMSRBWxTLeIOy5C/k2hT1rCo7Nad/KrYf
         ytdnxRKg5+6FHwRZn3jPp605Xw15YzH7u56b3RlAHiI7pv7u8IvCvQY8q5AacG8L1sgT
         6arQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788404896; x=1789009696; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        b=dpG3c5ozWNUcI6pq7zd1SEz/0oLhPINTxqfBNME8BzC4D5XixlH1h58izMLjuBtEYw
         qTys8HpNqUaN7bqCYfPzU+++qeLXsshImzLrWbWNa38gREQ1myv2wxgTK7CE5GbTtytD
         K1B+nql+tR/WJdOZTscdSkJVzdxFUtA5GY1RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404896; x=1789009696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        b=GINH5QIGiOnXs0Ly7deSYAcHwLLPABe/spL3joE449CFaBnoijFbQCADfao2AdNRm5
         3YLcHhaylUbBG/qavRb5THZ9snJuS5SvibxxltIOuIxYGpk8PSOjkk4cldNBq90tAfpm
         Pwdk7sORsVuqUVttf1n+AvcwcTyh3BiOQ+OAHaVeSnP1BoLUZuwiRY6tW08V8g+P0W1K
         0oib11BUU1Oje4GURb5bblKCnjjikv1GfVFSulOzPpyPx8XN6ui2OIGfPbVu5C0noFk9
         BYcloL7vEsbiZn1O0ovCbZpO+/kc6RVveaiOfkcfbXosftbBboQKsqlFSAnkxFaudIUN
         +AhA==
X-Forwarded-Encrypted: i=1; AKwUvBx7dF3L4gSMWyyed0SAkMvKTLSBu3dwCJS5HORNPR++4zGR4Bk/fvG3EpM3icEGHWVRCGHRBDkHFNyhCj0sfsKW@lists.infradead.org
X-Gm-Message-State: AFuF++m45d70Oy3dDZJxykaepHOMCNJMVmtlpzkBd1epD4NQxDLMgWUn
	Y1xefIpBcM869YAEGZ5r7cu+g3nQJnYR7uAf4YKmJJ4zb4ZdLTQUF85IvCwbTYoChN+MfbWHOoC
	hdDzSftZvUtZrgrHZ+W9dePUMCqRXlQB5AMBr9OGp
X-Gm-Gg: AYBFou3PPl/DjKYin7sAdHWxz9ry1f2xj1OndGwdDp67joTEU++NHzEgMsNQFGGZOMg
	a8ZtZF6mUPUg2hkCKWbTuJnofHu4rTPyTkskZAdp5icmb5+v5b5Har3Syx3tHmp7FAfsUDTZPK2
	NUvJndXiSLcgS7h18knACmtGZse5/kOUpZJpnckmyez1h0NQ7/kPdk0ZfiLhrwCs0W4hAhfegXD
	Ihkf6rjmgA74U2D3CS74ezrMZi0gfCIBrBu5/t/njb8T+fkz7J9FZLvcmSrckxCpglw4Y4Z49Yc
	e504vgo3janL7fgqt4Vg+N4fzJHA4YbOJrQ4o/P0JLOcWhNTy9nlLAK2pP8JLO1o7HEKVHTJqRE
	=
X-Received: by 2002:a05:690e:400f:b0:66d:113a:3928 with SMTP id
 956f58d0204a3-66f9bb6f3famr3574226d50.12.1788404894746; Wed, 02 Sep 2026
 20:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com> <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 3 Sep 2026 11:08:02 +0800
X-Gm-Features: AcwNN1Wn32BWTc7gvrI5NCynGubfvPlrWgUmvLkoMfGnpAB8yTnTJoIOOvbhgBM
Message-ID: <CAGXv+5E9zs7LsK=d08NB6QcuHkaPw4GcifuDuMDz0CVB6gB=8A@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
	Houlong Wei <houlong.wei@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joseph Liu <kwliu@nuvoton.com>, 
	Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_200817_806769_9F6CBF43 
X-CRM114-Status: GOOD (  18.82  )
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

On Thu, Sep 3, 2026 at 4:08=E2=80=AFAM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:
>
> Use the devres-managed devm_of_reserved_mem_device_init() instead of
> the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
> pair, letting the device resource manager handle cleanup automatically.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/mediatek/vpu/mtk_vpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.c
> index 8d8319f0cd22..557bffb2c2f1 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> @@ -888,7 +888,7 @@ static int mtk_vpu_probe(struct platform_device *pdev=
)
>         dev_info(dev, "4GB mode %u\n", vpu->enable_4GB);
>
>         if (vpu->enable_4GB) {
> -               ret =3D of_reserved_mem_device_init(dev);
> +               ret =3D devm_of_reserved_mem_device_init(dev);

There are non-devm calls before this. Inserting a devm call in here
messes up the unwind order and leads to confusion. In other words
this is a bad idea.


OOTH, the remove function is missing a release call.

>                 if (ret)
>                         dev_info(dev, "init reserved memory failed\n");
>                         /* continue to use dynamic allocation if failed *=
/
> @@ -930,7 +930,6 @@ static int mtk_vpu_probe(struct platform_device *pdev=
)
>  free_d_mem:
>         vpu_free_ext_mem(vpu, D_FW);
>  remove_debugfs:
> -       of_reserved_mem_device_release(dev);
>  #ifdef CONFIG_DEBUG_FS
>         debugfs_remove(vpu_debugfs);
>  #endif
> --
> 2.55.0
>
>


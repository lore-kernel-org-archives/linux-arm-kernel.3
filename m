Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B13C55182
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 02:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RF3fTD6VniiBpbG6B64SSlFMt6UnvATMppDDhdm47VI=; b=2aN5uE2InChgy2pF2lYVO0kmLU
	QsxOxpe2IF+Nd2B8cEnD5unQceamwCbsRxtmz3B+LaLC7aFlZBRmdoE6XCWLv62hlygky1nL+ia0U
	y+8g/WSokgTK5rysV2dXCItQG+y2vqJgRqkfjP/AdPxM4mXCj5c0qZS3bm3g6W4BMTSsXtKxDjeXS
	OSNEvlZs543JdhjD6cnUB3Hck92RwENz4QPY3NsRlP5pNAay5YdDtlQ3OhRmX77H/I+R4oqPPj8Gv
	QJjwP8hmNCtrw5n2SSC7k8/0HP0gMZf373VvTt/4zDmeRujd2oatd4KZtUuqgB3+8Q1y1syKaMXLX
	BjuSBjvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr57k-00000000rGG-2mXt;
	Tue, 04 Aug 2026 02:43:24 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr57f-00000000rEw-4BuE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 02:43:22 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-80814edb536so58948667b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 19:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785811399; cv=none;
        d=google.com; s=arc-20260327;
        b=GqAcQwzEm5sEmilyr3K7BQEUS/vjiveo4Ai11zbH4yzDN+Frf7lWOYM9zYLWcttJeK
         XvH+NyBoaVAdpvyqt1JKLdtKs/LJHzHmtuvyl5miQV4RG8vC2N0JszxN1GJUaKMjVin2
         2Vj9dXS2MHY5Z6LAmN6XbEneMRWQV2nlKczd5D+TMm4H2mKzFng4ZIxl4ONzfIUEWTAx
         eAaNBuaFvrSCerhFxjo4TiKWFc5dnOEfQ8xJuuUZ+lQLUB0pAe7fJYRhLyUFhHuBT969
         WVOqeDpQS1JdRZsEmH0aFnZ4jYyx/QK5UPKphubeBqoJ1jOSEZjVmMRuPsrfMLhr3fth
         w5Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RF3fTD6VniiBpbG6B64SSlFMt6UnvATMppDDhdm47VI=;
        fh=8HHgyRrkTPrdMSNugwEIjvjqShI7z0BRns7Oopxp4a4=;
        b=hre2B80zZQD46zwBxmybWxsWbKdkrakSPoGzH7G9YN0W4Y4ZSA2unEI8pd7XtLcH9A
         ov7Uv0hrOM36mkkJNPFax2kfKUipqwgij3eozAKvzjy2Vqy4pV/8rnp9rcTu4Fjy3aX4
         NRTKIPdigxf1GRYOFZ+qgzw7MD+TLSrq8xpYNA8v29jra5LGpenJaD0b29FA2NVOkMsh
         FyQk2JpFVk/K3LMlmuOZRbDqWtFsN45KzzmYirw0BLsN9/UNXhD+F1gB7xKD3HvpM51j
         f30V9ydsaubZbcEVeQ/v/KVemRGc5ObZ3Fp5ptgBchFzoaDRL+ZA+SdZz/lxcNsTXdJb
         e5zg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785811399; x=1786416199; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RF3fTD6VniiBpbG6B64SSlFMt6UnvATMppDDhdm47VI=;
        b=ZshOk35AjzSAJSzJLKWVWxJQ/GcfAfU+PNCx3QdmgxRZpvY9bojatB2blM9nDpkFVt
         bJVMV7Oy0aitFDMUB6xN0s9myGpC2AGpxhislFOtS30IICFzWhtZKfLk/4hDwtBROuWC
         HgMgOcTUfBQ/jI/Xxd9ZyG0bOnnw9F0jAE53s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785811399; x=1786416199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RF3fTD6VniiBpbG6B64SSlFMt6UnvATMppDDhdm47VI=;
        b=Wj3xcjKXYT27xTKkdLK+U7ddS6Wyg4VYITLVvENVDHWMniTO7X3Pyi75Orncz+a4wf
         fDOJjXGTBkKZQ8iSwa8Suv3O7ev+yAjVWU6xtIF0Ps9Ce3Y4mIFYk3vd52XA8Ly/edyH
         ledVqtQJmaGBJNP1f+Nnm1184jMaB4KSgwLWGGKkY991DLhaYyD21VVQUfJNT+ZoOIUB
         5MOLvMlfJm8pYblJ2yw6MHodIeHtnVskF2LMnz53ozWRICbzIxVsoxAQc12ZcijV8hKi
         nHxitDCVCmPI94pmffS5JG/I+Rs/df92pWbubMa85l0BDpfDNpWG58sQ5qWo42C/cnKj
         hp/Q==
X-Forwarded-Encrypted: i=1; AHgh+RpEzTDI9Y61qdSfGAq7RSNqn+dWulPswwl3esY3aACeSOBX/rxJn0x0SbFFLcdvHv50mRBomG5fk1ZaaAbqD50+@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr+NZVkWJNk64mWrJm0IBvvElQpTklyvYipXIGIs/OLyAeKxaF
	lAEb2r4mi36gSzKpLshqVrleZ+TpTlUUTOnYCK+4aKSArPtdkRZSB67sReYWEiWul/s2ykXEvQ/
	PEkwFHRXqU7KZCJTGxbA/NHJcRs6Zx0WJUfHGYq3s
X-Gm-Gg: AR+sD13pJgxfomLKuzsNB1MRnGGeEGv7dz70xfaT+Sq98NCaA3KycZTblUxCih1lSyE
	qH4r2rB/ow2F7oyMg3p8TRxEN9E0v0iB6Ztt93DQCt/6ZDQKw4sqq/q1G1PvOfDHuL2/vIMu51R
	R/pR3tTkA3/9rXxQg4iTS672hd3CqrR7ov1typGQ+4SDRd/lYM4cVyFlpMsV+eB3QuBlIvbj+5Q
	3EYkMpxG+FqO0MJLWxenWKaZIgMkl0Y6BzI4MXWeSzu1b5vuWEnFRR0+abppbw70Pp1ZsJr5Bya
	/sxvGvsz8y1gel6Ye5b1cM6ENpRu9bjngn7SuzWhCaHlfC0=
X-Received: by 2002:a05:690c:6984:b0:81e:a425:fe88 with SMTP id
 00721157ae682-81fd4bf523fmr168290117b3.33.1785811398719; Mon, 03 Aug 2026
 19:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260803141659.559129-1-akkun11.open@gmail.com> <20260803141659.559129-12-akkun11.open@gmail.com>
In-Reply-To: <20260803141659.559129-12-akkun11.open@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 4 Aug 2026 10:43:08 +0800
X-Gm-Features: AUfX_mw0ODj1uLGkUiNOBLIVs6yIxP-U-M-JHW0wgLxFKYiXjICIFii0-d42exg
Message-ID: <CAGXv+5FHSNH5SLiCiXyHDieO2rUDypAQBi5-nbTFKFzb+3ZWRA@mail.gmail.com>
Subject: Re: [PATCH 11/32] clk: mediatek: Add auto-population of sub-devices
 support in simple probe
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, Haotian Zhang <vulab@iscas.ac.cn>, Kees Cook <kees@kernel.org>, 
	Miles Chen <miles.chen@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
	Sam Shih <sam.shih@mediatek.com>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:b|_)ptp(?:b|_)" <netdev@vger.kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_194320_985685_703AA557 
X-CRM114-Status: GOOD (  20.89  )
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

On Mon, Aug 3, 2026 at 10:18=E2=80=AFPM Akari Tsuyukusa <akkun11.open@gmail=
.com> wrote:
>
> MediaTek audio clock drivers call devm_of_platform_populate() after
> mtk_clk_simple_probe(). Extend __mtk_clk_simple_probe() to run
> devm_of_platform_populate() when the new 'populate_children' flag is
> set, reducing boilerplate.
>
> Note that explicit of_platform_depopulate() calls in remove functions
> are unnecessary because devm_of_platform_populate() is managed by
> devres and cleans up automatically.
>
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  drivers/clk/mediatek/clk-mtk.c | 7 +++++++
>  drivers/clk/mediatek/clk-mtk.h | 1 +
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mt=
k.c
> index c3369a04cdec..71d70b5a9990 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
> @@ -609,6 +610,12 @@ static int __mtk_clk_simple_probe(struct platform_de=
vice *pdev,
>         if (mcd->need_runtime_pm)
>                 pm_runtime_put(&pdev->dev);
>
> +       if (mcd->populate_children) {
> +               r =3D devm_of_platform_populate(&pdev->dev);
> +               if (r)
> +                       goto unregister_clks;

You cannot use devm_* here, as they get unrolled _after_ the probe function
returns an error or after the remove function returns. A child could be
referencing a clock that got tore down in the error path below.

All devm_* functions need to happen before anything that requires manual
tear down. You can't mix the two together.


ChenYu

> +       }
> +
>         return r;
>
>  unregister_clks:
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mt=
k.h
> index b6504b3e77ed..11939e3e0b38 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -265,6 +265,7 @@ struct mtk_clk_desc {
>         unsigned int mfg_clk_idx;
>
>         bool need_runtime_pm;
> +       bool populate_children;
>  };
>
>  int mtk_clk_pdev_probe(struct platform_device *pdev);
> --
> 2.55.0
>


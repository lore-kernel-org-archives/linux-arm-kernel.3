Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648BFC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkC7eZA+uDX58TZWGGsjh/Z3xk06FWPrdqdvUqT03SQ=; b=2TbDTb4kMApQbHxb6BYYQUmPFt
	oUhST7iSlKJQsGDt5zVC27KcEIVyh8NVWDztsCqjDtAtKXyP4eRvNgQCkhzyqWx5RRC05MHTYUZCo
	b73o8WtPP1b8t2FovcRYShdxkQAEyHYZGVQgTANP4Wmsr3ibEBxwle8dS7sE+I5Dnsm2RtYYanhdJ
	3efhpbAJ/uKdAMvLmHa1rKszAwhKYIyPkA+o3tv+VGOfpTzMnSKWOc1CinbBsjWR41zg/JmJJUOfq
	Prn6Yworqj/pEQaiO3YGEUJhdXu/1m5DzUEGMaPQGgShP4RKbFTBF4BCEpAxcbWISu+B60RacPuXV
	pXQIGegQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXkj-00000004enN-0oFP;
	Tue, 01 Jul 2025 09:58:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXP4-00000004c7u-2LC7;
	Tue, 01 Jul 2025 09:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UkC7eZA+uDX58TZWGGsjh/Z3xk06FWPrdqdvUqT03SQ=; b=YOHNtF/JNfNziK/moNSUqCjfud
	UDXP+m2BbYUKNIGLJ1rsviv5DyKBiwA69NKRMkO25xsuf7DUQENiDyfABN6pRJrhiXfYkcNBIznKQ
	rsNTRdcot6N+f/+980KDQacBWltafJT58nkt2LJPldOVNO0jXIH5J8nbvJOG9m1fHIhUrOOo7ZNK4
	YLa19v3CoN1Zx/JS4WFdd2Eyr/h3u8wvLSyBIWQUj7YqtGxgNjIGfnfLh62d8XnUKk0xmaCyG8xB0
	JG13I3e6+eGP+qrolxo4ehSBkm8UoQUBiGZNVGdV8GwrTchPhylSD44i396yjT04sCzxCYWHJmb7T
	g1bS47Gg==;
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXP1-000000072mz-1o9V;
	Tue, 01 Jul 2025 09:35:49 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-53185535ed9so3931900e0c.0;
        Tue, 01 Jul 2025 02:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751362544; x=1751967344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkC7eZA+uDX58TZWGGsjh/Z3xk06FWPrdqdvUqT03SQ=;
        b=ZPeTGjtP44TUXEujoKGwunFuTPecKaS9TQWnJyUHwHTFsqh3zgZSVnv0Q+P8O32pig
         BsH8/5XnIrzeGXM9c9R+TwDSWU6RkZmVTWFJhjh+1cANIxYFOIf6bRkUgLVyTHdDGD6D
         hvPmJyFjG4S89wbVRhrZA2JhnVFEtmfeuxp3OqjXqISWaCOzTg1iV2j9yl9I40mk582a
         QQFBLTNsM+h3C8GZnVskANvb6s5IO2gkJxlQWbJJN0H7/t708bn1BRqYTGdsaichG5bm
         g9fhPMrPANMG2iW53F8krhecKTmEoYJByIwlstcajotCwSRUVLsfua4VOdG6G74bwu1j
         yrBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBlpeN5FJpKqStEUWacFgq/b8hGLlvJio5gb0rqLyoA6s8iUs75qVVQpm759Tz5p14vYSOfUVtAzv81mhwMAID@lists.infradead.org, AJvYcCXVAXEScjANHkD0EUeQnkvtNoSBAuvM2wyVDxJknB+xSvBUTFG+/7gmMh1zi7BDR1eA50ccpcm5t2o5oATsNuI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwAkhcQx0zL8l1txEN/+KII1daObAlJVpuyn02RYnQTsmvmuy+f
	NHMYmU8r57LYG+L2SEYp0Hk4XKcP1NC5oc5sCxVsDQGvhPXEzcI1EN8/YAnlFeJj
X-Gm-Gg: ASbGncu6glEQWDhkZf7pX4wNIUzJg2LHOeeOBebUNprMBq0RF6+P111gjg0Z9ytgFkq
	NEIO/qHmwe9urfxuPKQeUYhxVbCi/mY2v6odChAWM9t42CuXlGa6hlcKACyVzgwoPU498B2zpEu
	4l639ds21M+sG+x7UXCk4m+M0ECWqOuGj74MXAEH1GOiLc/vV5kTGeodMuL3LpVfvfGb9wiWssB
	R6cPu+pPR3Q7jbYIhNDq34Rxl6fi2MWFCs/oWsotsAtkNm4dtdMfrGX6c1rjV7sNITWI+VMW1ar
	xP3J6V7UNnoyMQnkqDZUrZ412iwXP4ijOpbP6yHTb8p3ynypsRv0jq0dFKtZCA8ThW+8yaPF7HT
	wVaT+TQGfo8HBvTFX3pvnqV5QCb5DN4k5pfekRTA=
X-Google-Smtp-Source: AGHT+IE2qRUVgLLrHs/Q5Y4Gh4o/QkINgqeKwWwPs1lnGjHyGbnV6CqC1zfR6ck82tfca/fswOWuNg==
X-Received: by 2002:a05:6122:3c4f:b0:531:1314:618d with SMTP id 71dfb90a1353d-534145f907bmr2145517e0c.0.1751362538847;
        Tue, 01 Jul 2025 02:35:38 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-533091bb565sm1647076e0c.28.2025.07.01.02.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 02:35:38 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5315972826dso3422649e0c.1;
        Tue, 01 Jul 2025 02:35:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtlXRFoXtNxtVYrQ0nK7T4IGZ0ykc/hSBVI+IgFelEDvlre2y+1m6CW7v8IDH5DvHE79PqRl30U3sGwWLwOWPt@lists.infradead.org, AJvYcCXEYAHwgG5fAXNYB03XRjtYTHpldRgJG276CeiDxTbs3GgTk6gzYe9Fn7iHBgxCshw5EdKZjaZDlWeZAH5YpCQ=@lists.infradead.org
X-Received: by 2002:a05:6122:811b:20b0:531:bb45:18b1 with SMTP id
 71dfb90a1353d-53425617336mr1027771e0c.7.1751362537889; Tue, 01 Jul 2025
 02:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250620160834242DDgecL4HF8b1OBLiZnnrl@zte.com.cn>
In-Reply-To: <20250620160834242DDgecL4HF8b1OBLiZnnrl@zte.com.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 11:35:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEkq_W99XuKA9KJW5Bm156ZBZowH2gmg2iY27y2fDFug@mail.gmail.com>
X-Gm-Features: Ac12FXxtXuRYLmTpc7TJbisFnd7Fe3xZafLHlyEUkNhw-qkfFhNc1GHH1T18Cpo
Message-ID: <CAMuHMdVEkq_W99XuKA9KJW5Bm156ZBZowH2gmg2iY27y2fDFug@mail.gmail.com>
Subject: Re: [PATCH v3] pmdomain: Use str_enable_disable() and str_on_off() helpers
To: shao.mingyin@zte.com.cn
Cc: geert+renesas@glider.be, changhuang.liang@starfivetech.com, 
	magnus.damm@gmail.com, heiko@sntech.de, alim.akhtar@samsung.com, 
	walker.chen@starfivetech.com, sebastian.reichel@collabora.com, 
	detlev.casanova@collabora.com, finley.xiao@rock-chips.com, 
	shawn.lin@rock-chips.com, pgwipeout@gmail.com, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, yang.yang29@zte.com.cn, 
	xu.xin16@zte.com.cn, yang.tao172@zte.com.cn, ye.xingchen@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_103547_562761_114DAF7A 
X-CRM114-Status: GOOD (  22.45  )
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

Hi Shao,

On Fri, 20 Jun 2025 at 10:09, <shao.mingyin@zte.com.cn> wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> Use str_enable_disable() and str_on_off() helper instead of open
> coding the same.
>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
> v3:
> preserve the original patch format to avoid whitespace-damaged
>  drivers/pmdomain/renesas/rcar-gen4-sysc.c    | 3 ++-
>  drivers/pmdomain/renesas/rcar-sysc.c         | 3 ++-
>  drivers/pmdomain/rockchip/pm-domains.c       | 3 ++-
>  drivers/pmdomain/samsung/exynos-pm-domains.c | 6 +++---
>  drivers/pmdomain/starfive/jh71xx-pmu.c       | 7 ++++---
>  5 files changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pmdomain/renesas/rcar-gen4-sysc.c b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
> index e001b5c25bed..c8aa7538e95f 100644
> --- a/drivers/pmdomain/renesas/rcar-gen4-sysc.c
> +++ b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
> @@ -18,6 +18,7 @@
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
> +#include <linux/string_choices.h>

Please insert new includes alphabetically, like in Krzysztof's original [1],
for which I already provided my Rb-tag.

[1] https://lore.kernel.org/all/CAMuHMdXJ57mATWW4AnBedn+D7TQ4PadkJ642daquFtAo=wZFrQ@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


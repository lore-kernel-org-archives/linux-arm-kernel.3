Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEFDCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 15:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+TPF1YkLiFTNQ8Ccb4IZIqIBMol4u9SbWTxln9EZmwI=; b=qIINihh7+uq6aVQFO/UkJZvqgr
	31yltexea3dGIb8G42XdL1vueOJGxWu/wiD5DFsX5e5tbN5RcyvoUYB+aWgGjbR6/tVnhY01vEkbM
	C1C5jqzd7A+YetMa+EeT3EGSLky1Ps7tgJPjiZhVoB2oyp9kmAoLpMZIX5x5VYKpIStLWsuwNIjMv
	gwkY8yDCQL+tS8lawI1zcGO2IwOl2TgcU7mI08yPvMJ1rU/7R1IW7yaRhH+80WerCMFreBRjNIvZ/
	0hxn1Bt4ytRFVxw1sj8qcdgtATcnegL8VzSu2d20cIeGh84gZaF6tztZXn7TqZxtvZGleCN1MC9Xh
	e7sxYJhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoO4v-0000000As1w-04TD;
	Tue, 19 Aug 2025 15:16:49 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLR9-0000000AQrC-2kIA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 12:27:36 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e94ee2f1fe2so254076276.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 05:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755606454; x=1756211254; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+TPF1YkLiFTNQ8Ccb4IZIqIBMol4u9SbWTxln9EZmwI=;
        b=X2MFsWCna+jK0bgA/7U+RXv/6eEPNwK63DRHKrQqlsk1XEj0mbtuPohNU6LOi0P1eQ
         gd17UCvbCOw7vhUPXTpUYbWW21Jk8Ox9KZ8BLYQC++0kDzVlcFUs7DKabNGFrNbBsJbw
         TSO5GhnbvjXtANKrvMdBkWyOOVA219lf8utOgrY4bh2Y3NI9ZxA3m92Gt/zfyUs/9Hc+
         XJMG0OH/+bjONseX4EfmbkZ3LFMkJEmq5JCUcUhFLiOQIJ1WEorekINDFT6kZ2s/iKpn
         1D/lCreRxgaufOloWSi5JKO2GQpQW4B3aXAak0Ar31Me7o9FcJtQKEtkvqcMsthEt1R2
         d+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755606454; x=1756211254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TPF1YkLiFTNQ8Ccb4IZIqIBMol4u9SbWTxln9EZmwI=;
        b=PnQA9srrM2ROaDzs63HT/7hbn0TYHmbYY6diPvaZ0C8ciUjOhjRX5nBzN+cA+ECpES
         CeUSDD1pNCwkBpwPhXMADT6Y0XSjSaucCC4GcJIUW49btyngJ1+6dXxPhNw1+wAmWrRN
         8M0I1kVFs0Ypk89CCO1D1MfOl4wu4psBkWRaFWLBVTrtXr3ZpkmbUy8Mg71Kp1P3ifxC
         nkouV8e8GYlqzOjCaHzavDpoc5/CrfFNnDFjDGY5Q4dhAwrhCHzXCJ5trcLocf3uYvor
         uunAX9bBvAWrxAICnYgNmp8zF0V2Zg8yeJPzkVH+TRVAEg6tCYnqUU7su67kZQd0+G9z
         7R9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOev0gz/CBJMpM0ZiFuAsW2Lfl3qwA/V03wKKizaKaRZI03YMsA1vt9R+P+oqyQH3PfoBym4vygiU4T0dvY+Xc@lists.infradead.org
X-Gm-Message-State: AOJu0YxTGF8caytSG7VD5U2g4ZIiv/tqubxZGyuJaBA6xiWvHnNYAD8U
	X3a7air1yVfLC3M6/+1VaSCB0gAJE9yOCw4qpKpXnSdaTBYdTno2BprCRIP4PYXs8BgsoBkrGl4
	6GymABOm0YKzuYtawbanCpvpXF/P/tet9BQ4vQHWbOQ==
X-Gm-Gg: ASbGnctAu4CFua/ICPiiNYiFI5HTdoFVJGbrVEERIUgDUthkI3fNKupBbby+dB9tgbg
	zAp7zqHYmn1XeTJiBSgvhV4kNN0Krb7b+5f/DH7+nrcRmhALSASkYRn2SexsW2t4bKLAN5heAWV
	R5I6/YISljH3b7VLDdARZpltZmADgwuOP3B+x2gUe0uqRcoauMgnNMOdVNtNew0H3m6yU3OPkI9
	J8z4Hw=
X-Google-Smtp-Source: AGHT+IEIU63/+GYGzAYDue+vg2X97jfjr+a6yrxDRh/QgcS+rLLZW/s7ptzQYuXL0ln6WvL4vzZQWJIIdTviE+KMReQ=
X-Received: by 2002:a05:690c:998e:b0:71f:9c53:bab7 with SMTP id
 00721157ae682-71f9d6aade3mr26181137b3.36.1755606454405; Tue, 19 Aug 2025
 05:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com> <20250813161517.4746-15-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250813161517.4746-15-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 19 Aug 2025 14:26:57 +0200
X-Gm-Features: Ac12FXzg8y3bcygw4HHi2EJ5hKpXkHEKEIKi8aknzoMhZGkielH4LokEZOomCVo
Message-ID: <CAPDyKFr=bnDZWmnBauWTZa2-2DNCP2swDJxPT1b_TK8Q2o8sXA@mail.gmail.com>
Subject: Re: [PATCH 14/21] pmdomain: remove unneeded 'fast_io' parameter in regmap_config
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_052735_691500_FDB7AFC0 
X-CRM114-Status: GOOD (  18.67  )
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

On Wed, 13 Aug 2025 at 18:16, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> No dependencies, can be applied directly to the subsystem tree. Buildbot is
> happy, too.
>
>  drivers/pmdomain/imx/gpc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index f18c7e6e75dd..33991f3c6b55 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -343,7 +343,6 @@ static const struct regmap_config imx_gpc_regmap_config = {
>         .rd_table = &access_table,
>         .wr_table = &access_table,
>         .max_register = 0x2ac,
> -       .fast_io = true,
>  };
>
>  static struct generic_pm_domain *imx_gpc_onecell_domains[] = {
> --
> 2.47.2
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBF4C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 04:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1REz7lxNqCP0vRE/ucDmbyORYxFecR0vhh1/DbBdVo=; b=h2S58e/iXwUu0jlJ6GveSdxcYg
	ZMVKDfnZ3mzxmW1fbGFNZPGn4XudZh76s6S/ZG+3BZKu/LeCY1Sgvvb1vna+P2OPgYvH06Pd4aLsz
	AlIq7J8QxWN36hcw4E+/39gPb33kVn1/FwuHMPMB6YxoAv6L+YXpSOtL0T6MWJGixL89I+Jk1isRz
	DPxscOq5Y6J9TM8fD4tymuECYzVTfVgykL5/OJATM4Io4Dk3n4FatCD9PNG6d1Qmw73CRB1VNodHs
	Al8drJ+Ijq9/auYBcke4RRN647C0YI+gehV7P9Zv7N3yAYx1d6lIhEtMgYeqwdj42jCwecB9jmqGQ
	zr0HSltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhKef-00000002rnM-1vmn;
	Thu, 31 Jul 2025 04:12:33 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhKcA-00000002rc1-2Rwu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 04:09:59 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-306b7eb492aso286144fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 21:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753934997; x=1754539797; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1REz7lxNqCP0vRE/ucDmbyORYxFecR0vhh1/DbBdVo=;
        b=Xx2l2mRoogg+qVfdCEWWEtYuNYK18ln/FJl4gQE0etHXGFRL3psxCEOheuV5fsw6LJ
         QbOBBl4FNBLpj4/wgREhCOXz0mG/Y607GtI/zRA4Jl0WwLflRVozkZrM5J155SVMlqLk
         YxOj8abPiKwlRPo3LNphgiyTXnd8hpatFZE/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753934997; x=1754539797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1REz7lxNqCP0vRE/ucDmbyORYxFecR0vhh1/DbBdVo=;
        b=NUUnKx5rIOarG86aAR+tPop6SlCJ12IoKc6IdYvrgaBztnLkwsDFhkFMuKsu/wW4vm
         hJuRDlU1w/nnMAYWzIiFkvr+urmpmA6LP+bvr2+se+IjisJtGHn4tgn4Bqs48rUUUb8i
         Z2lCmyJYH5GAQqv/tdD76yvWcMGiwWZF8gT4jFn3I4vB2/rJiVwIw1GRbjeF/u+YY0HX
         dHt8LuCimN3BVRZ+/KpKiibJm1BHzjL84F0OXUUPqc2IFoMZ8Y6Plvp5gWkKZVcZvJU/
         EQChUbaCUZ8TR7yPUtvCw8XlGwGJLLWkO55oCeAdaF5L+kqmhvtbJesU/TuQDGkY/fXv
         Njkw==
X-Forwarded-Encrypted: i=1; AJvYcCX+K0ZOY/I8tphgVouKZoTPQjys+iO0dHZLTiAuvpsvN89k8RwjwwCX3P+4X8qIeUq7AHpLMuuSu2wFqP4jhhzu@lists.infradead.org
X-Gm-Message-State: AOJu0YzEXtOgt9fFxLM03uXg0aZenJ/nc0oINcTs4C/os6ThbH+tdcOd
	hp39/6xhW3nrLudp1zjV4uAPMwv4D+sKfSPxhncKCHq5W4MEeaBBiLKQWbp7quC79QWfhfIC4Q+
	NJWY=
X-Gm-Gg: ASbGncvLEanzoRU2wRTTf2J5byUHJAx+hOXd0I75R1SCMqlgN7RSUlmKbQ5uNslzbvA
	pttudk6VLSJ5XYeufwpcin40/kjZCt/dtU9c88y88m5jU/6INr6yVKCpvZr7B/8KKm4zmgwiByl
	d+kJfLIA1udzjIKkWH13lhdVCoR4EGAFD+SPbCHLhouanUjEG5fclsbT0bknx73rjqOFuSbSW2q
	oc4BY7JdtL4CFrYgY7JPCf4dZprwEGcZRAKG8UR269uT8alxdeP0BDmco4ZfGmWXYd1wE73CoEh
	obCBGbO8XF8OjnRrnAvInDi8CyuDhzrZb+X+4Gt9+US9tQauoxMB9XAnLPTd2mrpXsLRqM1wfa+
	a/ORDlbYeW1/wKMN3BxbMrKJgOF2Piv0HIVPH1ZrCc3vw7ePNp/lJyO4HaQ==
X-Google-Smtp-Source: AGHT+IELj3KkbX713atc2MNblHwkAtOA4+eh5ZNbbg+4trPpH51AdQsu6z9uwu20ZgpR1cmqzQPFnA==
X-Received: by 2002:a05:6871:741e:b0:2d9:8f98:b0cd with SMTP id 586e51a60fabf-307aa67e16dmr371686fac.10.1753934997531;
        Wed, 30 Jul 2025 21:09:57 -0700 (PDT)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com. [209.85.160.41])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-74186dac9dcsm153142a34.42.2025.07.30.21.09.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 21:09:57 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2eb6c422828so1252399fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 21:09:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW4yBPl0vCEq5903a69MQbURJZcMBuulTtWzdGLB9Uu4oWtVvuMGhy+oisBmX1VLQJnPaSjomKTQV70Mon6+Xxe@lists.infradead.org
X-Received: by 2002:a05:6102:5122:b0:4e7:be09:df07 with SMTP id
 ada2fe7eead31-4fc100ad7d7mr227087137.12.1753934630495; Wed, 30 Jul 2025
 21:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250730152128.311109-1-laura.nao@collabora.com> <20250730152128.311109-5-laura.nao@collabora.com>
In-Reply-To: <20250730152128.311109-5-laura.nao@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 31 Jul 2025 12:03:14 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngvS9z-KOZXeV4kLiW_pDx2F+3AOMcTokaq9O=-E4Pneg@mail.gmail.com>
X-Gm-Features: Ac12FXze0WWvW6KolXpxHVZ5mr5bsteDEMGk6n5CvaPH_JsjnG6BTJ_hncHj4Ic
Message-ID: <CAC=S1ngvS9z-KOZXeV4kLiW_pDx2F+3AOMcTokaq9O=-E4Pneg@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] thermal: mediatek: lvts: Add platform ops to
 support alternative conversion logic
To: Laura Nao <laura.nao@collabora.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, andrew-ct.chen@mediatek.com, 
	kernel@collabora.com, nfraprado@collabora.com, arnd@arndb.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, wenst@chromium.org, 
	linux-mediatek@lists.infradead.org, bchihi@baylibre.com, 
	colin.i.king@gmail.com, lala.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_210958_617626_0710CBF3 
X-CRM114-Status: GOOD (  16.92  )
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

On Wed, Jul 30, 2025 at 11:35=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> Introduce lvts_platform_ops struct to support SoC-specific versions of
> lvts_raw_to_temp() and lvts_temp_to_raw() conversion functions.
>
> This is in preparation for supporting SoCs like MT8196/MT6991, which
> require a different lvts_temp_to_raw() implementation.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 46 +++++++++++++++++++++++--
>  1 file changed, 43 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
> index 8398af657ba2..6e4a35ecaf34 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -125,8 +125,14 @@ struct lvts_ctrl_data {
>                         continue; \
>                 else
>
> +struct lvts_platform_ops {
> +       int (*lvts_raw_to_temp)(u32 raw_temp, int temp_factor);
> +       u32 (*lvts_temp_to_raw)(int temperature, int temp_factor);
> +};
> +
>  struct lvts_data {
>         const struct lvts_ctrl_data *lvts_ctrl;
> +       struct lvts_platform_ops ops;

nit: I think this can also be a const struct, since ops are all
initialized in the platform data and never change.

Anyway, the changes look good IMO, so
Reviewed-by: Fei Shao <fshao@chromium.org>

>         const u32 *conn_cmd;
>         const u32 *init_cmd;
>         int num_cal_offsets;

[...]


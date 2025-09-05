Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C58CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 04:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHmo68YQ7L/duddAgclVIEvUtWdksnELEMP5v/s9PNQ=; b=4iIJafdTMQ9qBkLsGvyY4Ztn/F
	zjPqfySsxt6G6asA7MIzngYbVH6MpC3Do9PFfEi4CowT8HOb0wPujqIPb4LRyCQB65S9Fe28lfdMw
	cuu4VfZL0q+jiUB3OxIZeVdsYX0MjWUm69utSW4XkDgI6Sa5LZsHXjRer+0XsyC9BHd9HppaxMQiG
	1/sNWsQSLfHy4rqRYyk24gBx5MiKpZ69NrdhLjGlXCnJnshKxrsfojFtb9EfMEggdxzMx8HKkVupD
	XwRbQLT1QJYJhEHgi2zlhJ+9yQUJYBQu0pwMxx4e1oeH6YV2/iK4/022QlSxeOegfyhWV8SFyinXQ
	GCXy9UTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuO4N-0000000GjO6-2Sl3;
	Fri, 05 Sep 2025 04:29:03 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuO1T-0000000Gibr-3Tjr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 04:26:07 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55f720ffe34so2246091e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 21:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757046361; x=1757651161; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHmo68YQ7L/duddAgclVIEvUtWdksnELEMP5v/s9PNQ=;
        b=iwc7A4OH1+XSMtix91Rz0dRtWUrIMrn4SBxza9vzOJa403Pqpl6NdGW5QgayQdT8bs
         sc9DX/9qfvP0ztE8Y7W3BNSag+rAsZ9upI/e1WZNEeyLZakzezsrXgF+Z1UwwCFJ/b5g
         RF7SsOBTJlikgtazJpr9ubYDy/kbiCroCkCJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757046361; x=1757651161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHmo68YQ7L/duddAgclVIEvUtWdksnELEMP5v/s9PNQ=;
        b=e3WyONckinQsID5jhJCtvxXf1JRE9sIhcN5PRh7Jqdn8lnrHAyB7hAXWITAg5mnN5U
         4rn7clK1TTRqhqVsJ0bxfnvgzgpjW3jGHqDAGzc6oAdsKk5cFkp1qCoL5xpJCUhhn1yR
         moVW2ImKlX1r2IJDN9vZ4Gc7Lek2jZyDwfMokhtyl/YGU1yI43ZYBgvRMWbnwrQyTMzR
         mxSEbM1f20ChEibyjZ0C4rP5y7nJu4oVNsVvRETQaEmcih3JxZHKAG2FPjz4qLA0tPl/
         MKYLKUyKi5E3yk3NorwWDw5PC4DcIcNOLjbsO4DueQFS3Es+0l35BvNpTK6Oicdv5/Zw
         4RUw==
X-Forwarded-Encrypted: i=1; AJvYcCVtN13rIP/wV2fT0Al8bfZ6Q3zHPzbFjVYen2vYSgVfroI4yelUedVHvcO8r2jhZlT4OzPHMq02+oOTvDRttcLT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz69oooFM2rqhSYzRuNmYnr+kWXsnT5uMHfqLNCMAZAdUhvfEos
	0kyxsGfaqyR0ROkUrjFo5wifUpDihhwuMBCPwc6gnaOTHzIReVvB047PulBKd7I1wZXUirTHbIV
	8I0NtLBdFPoevU3SDPV9hvl6CxZ9WucEPtyTCISKr
X-Gm-Gg: ASbGncviMnA0TUQF9Z8FqMtVnYHn4SPiZlzdnoq2/FwJIPTjlXNXIdjykBuD09AvvT5
	RYPky2GjjsELmcvDodXLENVbZJVV4a3WzQITnlTp0sNgytqIo9kZV/iTLLD+HUKMhWNsl3ZBZ3R
	aYT72A4DGrhRDQZW2Z2ChtvBtyvj1qUVVxuBPEEXrsdf7Sx1KlPXIjlUmGI1QpmtezYTs98saeA
	Y+acYcWf4x7EdmboBnOORXSZUAA8MfOODWr6g==
X-Google-Smtp-Source: AGHT+IH5pWHA8nQf6AbDXyeEcMeTEINpq+oHNFsdmhAJKkVR1+KEZHE+PC3gHq59gfSmiiSALqCN4LCODqxkvK4xsXI=
X-Received: by 2002:a05:6512:3c93:b0:55f:552c:f731 with SMTP id
 2adb3069b0e04-56099453ef8mr666761e87.7.1757046361254; Thu, 04 Sep 2025
 21:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-8-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-8-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 12:25:50 +0800
X-Gm-Features: Ac12FXzDHpGuz6HiaGhCY4WidH-LRTm2axo9L1u6x0u8-eqIT-uiyLk75FyGJCg
Message-ID: <CAGXv+5FgKsg0sM6EXeTL=du2BY1xgH6jVmtQtb2M0kY3iix-tA@mail.gmail.com>
Subject: Re: [PATCH v5 07/27] clk: mediatek: clk-gate: Add ops for gates with
 HW voter
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_212603_891359_4AB4E304 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> MT8196 use a HW voter for gate enable/disable control. Voting is
> performed using set/clr regs, with a status bit used to verify the vote
> state. Add new set of gate clock operations with support for voting via
> set/clr regs.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDA6CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 07:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCLugtlKER5JKVdxfXmIi5m5k7cSqN7AKwCJ9L732vk=; b=K2L0HQeb9XYZhfk9hhLqQIlKL6
	iZA9tlMHed2+2YX7uIUapII+SOCfRmSasMugMCidk10nYtZ1dTpzZMmGrQvQicDXz70IQrzMlLwUJ
	QclPnJuvYeE5OGzdMauiF59zjwsNJYqlSVwlIRMiTFVKR0PvFBYHrLPXAnm+kWqeHTNN/g+ZPf22S
	Vm957uf+WGcBlgvAJVppGTiMgM0MwiINiE8QvpZ/K6Ew4hf8A690PNtiTTA46x6B5OSbiL466OWNI
	kRf1yzH3UCWgtsKV+lYCUxPn17myCps0YE8YwnZ0oIB6rRSlU4WIVeYHpbPwAyQZDmBemkzCSP0Mn
	8f9CB6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kmp-00000005KJT-1fmh;
	Thu, 09 Oct 2025 07:10:03 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kmm-00000005KIW-1A7z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 07:10:01 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-373ac916b35so13602411fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 00:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759993798; x=1760598598; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCLugtlKER5JKVdxfXmIi5m5k7cSqN7AKwCJ9L732vk=;
        b=bVwXPNLrnCtrGV70wsqZF8oI3zX2WT9cVDX8dmzAaQ28DdTu+qUooRYoJWuAWu04cR
         AYUfaqR4IuCF7qhkwEFgFX/7qqZnvNzmBsdf2GB1af6AVndWbCPJhgeNPyrspCRiV60e
         4wBz1PYcGCxZT9ldEl3/X9YwYiF8sGbwWoXvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759993798; x=1760598598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCLugtlKER5JKVdxfXmIi5m5k7cSqN7AKwCJ9L732vk=;
        b=HrrkxsGZ8iyIuHvRP60gYYWOG8HVDug2QPAslgo7CJ7Geu1NnR9InA0R/oAzraLfM1
         WxhS1szAIWvn6oHyjy9nhVTcHoTt11859I/15uGwnLHWy5dc565uQZhlK/Z6YJBrMPvT
         jtoMiA+NbFY9nN/x3oI6cHYZ4+OmY+s7XfXd0k7lE+xNdXarUvYkAjP8bcYoT4TvYGyx
         1wUiC1d3HtnLE6NaKubVgeit7NoRcRi5YgivNkSyk7UKCjWs3CwlUbivj5L68LCX5Y6q
         g4RAT3o2DeY54fgAGfyI49oAAdlCJkB9ICEleORM+ruD2qSQUJv/Nify+MJYvgBDA9SV
         kONQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiD+2ebeiNSCMejfwxncR6U7He3VZiO3B4cyDHtjl2HN7tJXWs/Dkda1yCqSFHTldDfaa4MA/40/rF1N9clZmW@lists.infradead.org
X-Gm-Message-State: AOJu0YxtDMx2d794mdKUJd5de5ED9jKDKTx64IMsKm7++HNYltnzWkeO
	QZPTs3FP37e1s8DYL7s5lT8uAs7EwHQl3wzwtRwIc0Gv7fOO6tYbzYCks+vcFOuDYimuYQOXzf1
	CtfgwEG7mjhKqEKdTyOh5peTpC9CU1f3vLtAMJHBi
X-Gm-Gg: ASbGncsVDK1pZftoZyLUjMN9sJu9m3oeHMt+E6HhjkUK03kPF9aoBqdAlX/Om3kFfZ9
	9H2Q8Ofa/A6b64opwkwLQpK4YlbeIMo7IQP0DwK7Ntd0A1REGyXcwXzIO2ghpstOA0walWGdhnM
	TcKS7FVxO3qurQQceJVtJDdHsgHTx3dXVJo/7NxhMoZLD3U5h1l6rf53+s/NsYedNJhF5xO0twa
	iB+e5R9Dp/oC3egoDZINShWjub8KwhC1ZqCqXp298vxM1RSPX9OBOI1DsCnrA==
X-Google-Smtp-Source: AGHT+IEJhbj8B5bmWohXhF9RO2rE1lp3Eq4MRp9b8SXg6OKS6nhaW5FvJnYrKALXjGj9kyLiKxmA5YOScYogDginsYs=
X-Received: by 2002:a2e:be10:0:b0:366:ef7d:bab3 with SMTP id
 38308e7fff4ca-3760a2aec91mr17588391fa.1.1759993798125; Thu, 09 Oct 2025
 00:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com> <20251008-mtk-pll-rpm-v2-2-170ed0698560@collabora.com>
In-Reply-To: <20251008-mtk-pll-rpm-v2-2-170ed0698560@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Oct 2025 15:09:47 +0800
X-Gm-Features: AS18NWBfT_0WimyLL897lV8iBPOUkT6dheJLRJo28H-RJf0AZ4JmglLtj3pPXGo
Message-ID: <CAGXv+5HAvx2uqJM7hWyBpF=wPZLWmCkKDaBnSOsPnU2+YFM0CA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: mediatek: Refactor pll registration to pass device
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_001000_343017_EC259115 
X-CRM114-Status: GOOD (  13.15  )
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

On Thu, Oct 9, 2025 at 12:06=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> As it stands, mtk_clk_register_plls takes a struct device_node pointer
> as its first argument. This is a tragic happenstance, as it's trivial to
> get the device_node from a struct device, but the opposite not so much.
> The struct device is a much more useful thing to have passed down.
>
> Refactor mtk_clk_register_plls to take a struct device pointer instead
> of a struct device_node pointer, and fix up all users of this function.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Thank you for taking up this task!


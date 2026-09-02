Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B591C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 08:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/501w4jjREjvvsgS+ZOz+uCZPO58x///HL9BUvCfOWM=; b=P4guqkoL75DG0DHF2ex438Htu/
	+UiXv0o3vCTUIDxeLl5hJa9I8Pu+jwEyhbRwW+V6eDtyfoXioEkjL36Lgosm8M4bkhQCntOxqCvR5
	kw1ACRgLXY3Fpx7bsbrpRn3Oj2FHpfwz0VQZw6Tcm0gUrx1QsX04Cl5/wHt7ASXMzZBBT4gzGCgBy
	LGN6dIGKLUysdUVjLZ52HL4lpRhuaQ7qRDAb9GEhepQIh371+mI5Q14smK4qtdQc5BVI+ckpIQSqG
	q7R7Y2y2IeiDxJqgg6uYLtflT5DwOgtd87d1HgiTScvmI2CsDyn0vbLcxghxdBcpUmVRjQtOCipCg
	A2v1KKfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gYo-0000000E81S-3Nky;
	Wed, 02 Sep 2026 08:43:10 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gYl-0000000E802-0Qjg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 08:43:08 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c2530cabcf4so114679466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 01:43:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788338585; cv=none;
        d=google.com; s=arc-20260327;
        b=gkx0rwf0DwVyy/7NfTNWHAIuQbg0otpO0su7O89ZNti0KggBkDL5Az00XvNtVXiJAQ
         0xAAXmCSgWasyXCKclrgUefgXjtDMjbvbX9PejBXF/5wsWseBn5Rc7/CemfWhRoqPVHz
         IQwRYTlGO4F99AFaknkVpaRJLQcTNXTZhOpLohPVck8oubOMZJqjciaC1QuUubujXJvt
         0nJXati5UgWmCyTkdHRE2MgyLSAoezlP5XwvowvHj8KDk70R6IoL5g+IcOCrdlqHlfbU
         hO5c/mrdWOrFsVUUyIjFrfYqnpMQAHEp7rPWX4r2+noNQ3epcbhwcYvIv0hhecHULPtC
         iinA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/501w4jjREjvvsgS+ZOz+uCZPO58x///HL9BUvCfOWM=;
        fh=VFF7xCXQtBDzH1GyEyDKCIQDTQ7CHr2yt1wlYFbdL64=;
        b=RG5mj1HzkXY9X3OK+6ZTR505z6MpH3o/ZU74e6CM6QPwlPAg19Njh2q+tTSJYIj/62
         HP+qZZ5cRX91wV6nqc/VE0wctX4gZAeDQYIHTioksfYQLlnLIboIIJBhEFobPfrsB9gu
         CbRFIOUHabWlxrWwMKneECSKbXKwIqswJZ3UfYKyGOSxNJqt80K7aSem+3J/RvutXXf6
         jUS+IYo1/QxsPSTeSf15z3fBtBmZZtSe2Ru/itHCcHmpI7wPfigMEjJI/Zs3YhdC2Zho
         8AguJnR32ygm1MjITgJhk3oUOG28B0PGaE8Cap2mWZ/eOHsMjC59WA3pYC7oap+R0lyQ
         kwuA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788338585; x=1788943385; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/501w4jjREjvvsgS+ZOz+uCZPO58x///HL9BUvCfOWM=;
        b=BAj59jbSXsd8VMCZBRBquj6eAE3fjfADPatRi+K2mGcJW8AFZQ9gNNMeSurMJvW6v3
         x869LU4cU372DbBsCienB57O3f00XQME0o1X9GTJV2gtcFRe5XEHTd9PgHVS/8ruhbgO
         tazqtqDUJFxuiB2Pf1To1ZUHeyE163IPJrZyqlpncEnrszWv5gg2RwIx1AWKCtO5XDXn
         /W+9+clQG+buv4ndf1udY04bN7Hwpe8cVDVjlkfP82sjeJZmSOROpwV7reSetneg7r6F
         qLFaG1+DgDJ0DtU0bvW/GuhPJdcgk6Us4T+zjlwMb+uchOUywyBl/4b77CgkCDWiNShW
         UEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338585; x=1788943385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/501w4jjREjvvsgS+ZOz+uCZPO58x///HL9BUvCfOWM=;
        b=ZJI6TnhO6EkJ93BfyFiSsZui19tjiwP1UGeOO6Bprvm9IYtzaZYhs57vsoQyKttZhy
         kCQukJlEM+ZeHzysg84faVF3J72b62+zZBQE6YnFb6vsRBZ8XAnZtgnccqCZ2s5m4QCm
         u4/pRpPPAcx/OCyGfGaqXtZfKiq4TTm/BZuFR5v6ulCsy+TItzsMQFp2P9nk7NgeHFAh
         osTn0hO69teyhD5HaYcS7xPjwE6Ey0WoaQrHNfpCX/Ls8co1eqYAlDF8rGobnH1kWmQX
         svpQcXB7oE0eN56WiTG4xxhnN/jUis38YTd2tbZoD6e87mTaWGKUiE1DgB3cJ9P0UCKH
         /HQg==
X-Forwarded-Encrypted: i=1; AKwUvBzNJE/KaW/8BWyV8g8hKKRGC+FJDcdHbD8IMFL8pi9KkhyZJG3ZwRukI9vurXhCNrMgX1nlvd00ZzcXIxEaWWiX@lists.infradead.org
X-Gm-Message-State: AFuF++nksPhls6VMeCmTODxovmaLMXE2i0VOZ0aQnkCmZfzwOXN26cu4
	Oc7XVrqZLe6isw6KBKplws16bHaV7BM4OvIyENgTzIY1rQVtKZFLgFxfAEB4sMiL958RvjsaFXZ
	IAZYdRNJRWF7OTEvBN4wYqyLkrbVpibMWQ8ZWZ+v1tQ==
X-Gm-Gg: AYBFou3lSoyhd3FUOQQJ3jfsPwM7pfJAIvWILVfy36UC0pUm0dLUnpetsabDuxNcQ+Z
	JzFqMhXUCLzWakr9im8RWJqBteIoOaaWgnB8u8D52lKlOTATRUMDPGrN7CBLZwG8gb3cZ0AGTkV
	y4/OIqBqit7o4kbwAqFQUfnH+pZ8cXSuyrJI42Spjtob7pmezdCtfPL6n7xrcb4zaYh2SXAKQkY
	FJgGFaJxbGAC5o6VDSXUctkGD4njJji6PHXWMPe03fsva3572KIWA5WDqTxVbVonA4RzOe1JEm1
	Wb2b9R4CLkhanVWkbSirHAFfYZCdH/YJwVQPq5ZM4uBlNPCvvj8YqjID3tTIz9Bn7C6yUPu2p4O
	+
X-Received: by 2002:a17:907:9625:b0:c25:4f7c:8ec5 with SMTP id
 a640c23a62f3a-c25d5505c79mr194261566b.23.1788338585138; Wed, 02 Sep 2026
 01:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260901234351.190506-1-anarsoul@gmail.com>
In-Reply-To: <20260901234351.190506-1-anarsoul@gmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 2 Sep 2026 12:42:57 +0400
X-Gm-Features: AcwNN1VBSx96Am5bMyza-3Z81_49VCDlB0IsZHW5X9pTU9Oq40nOjzgNhihFkBM
Message-ID: <CAKTNdwFqSBt4QVCuYJxTyEDsxkW96JbUirFNAgJYWVLHzGpk4A@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: rockchip: rk3399: add 85.5 MHz rate to PLL rate table
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_014307_167935_7630D055 
X-CRM114-Status: GOOD (  17.97  )
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

Hi Vasily,

On Wed, Sep 2, 2026 at 3:42=E2=80=AFAM Vasily Khoruzhick <anarsoul@gmail.co=
m> wrote:
>
> 85.5 MHz is the pixel clock of the standard DMT 1366x768@60 mode,
> which is the native mode of many cheap HDMI panels.
>
> Use a 1368 MHz VCO (24 MHz * 57, already used by the existing
> 1368 MHz entry) with postdiv1 =3D postdiv2 =3D 4 to hit 85.5 MHz
> exactly in integer mode.
>
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  drivers/clk/rockchip/clk-rk3399.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk=
-rk3399.c
> index c2b243d7a5e2..db241d2df625 100644
> --- a/drivers/clk/rockchip/clk-rk3399.c
> +++ b/drivers/clk/rockchip/clk-rk3399.c
> @@ -98,6 +98,7 @@ static struct rockchip_pll_rate_table rk3399_pll_rates[=
] =3D {
>         RK3036_PLL_RATE( 148500000, 1, 99, 4, 4, 1, 0),
>         RK3036_PLL_RATE( 106500000, 1, 71, 4, 4, 1, 0),
>         RK3036_PLL_RATE(  96000000, 1, 64, 4, 4, 1, 0),
> +       RK3036_PLL_RATE(  85500000, 1, 57, 4, 4, 1, 0),

There is already an entry for 1368000000, which is 16x your rate, and
the 16x divisor should fit comfortably into the downstream clock's
8-bit divisor field. Do you really need a separate PLL rate? Have you
checked what the hardware arrives at with the unmodified PLL table -
e.g. via /sys/kernel/debug/clk/clk_summary?

Best regards,
Alexey


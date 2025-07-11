Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC741C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=; b=YAEuGMXi/+ia+yGMW3kD/sVsKP
	YcoCIkoXYQNoX3s0YSi6qHhRFtyhiB8PXNng1WdGns6LFL3lUfhlfrrSSXcq4l9rc3N/Ha7+OM6Jw
	PLTTUCd7hqcoF/ZB5aJHbMzA4fzt6J/QOtalg9EUKWbYyD/kN0/Yin1ja7ea1E+9s24x6jkWq30GF
	dwkylzcttjfSL7Xvp3rl0L/LNgYLyFwYy0G88GWEcGbLkAoznjMukT4zn6r93RxBN5A30fkdxtLcL
	oFo3pvLOyTCmAFy8+y8zQrcft1V3KAX7ViWQH1m4BPSRDVEUBUtxcb6/r9Y78kP8pLfrM+koaacS/
	mu8IUDRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaICk-0000000FT65-2t9K;
	Fri, 11 Jul 2025 18:10:38 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHnS-0000000FQzA-0Mf9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 17:44:31 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-32f1763673cso31038011fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 10:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752255868; x=1752860668; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
        b=FcdM2RexdYWlhvX3vw5Gc9j80Rx8KvLjINevXEYCr7XhbVN2lrOtFJcUj25pYb4tKl
         tH4IFLCjxKo3H6HczyMy1CQ6IEcnvpjWvoyjhnIIg+3ngzJ8t/9H5ohokEi0ngbsGiF4
         s+KJ37UDmlbN+Ufu7dnr5jnJVBj8yy+g2TdkkKTlZ4PUJIjFGLDXYjfx+xIiFgJeUD+h
         gvtK0K2gkcx0/6JbZHSesPSnNbA7F4ra8sxO9n7WbftYFmGWfiG7dtDOcNKvOIPO44dY
         82pkDuSgyIJHpaZmMoyaqraIDxpZ5zKkAkXfl7GnapttfyuCQ14t9H/bwpreYO6BQabL
         bIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752255868; x=1752860668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
        b=hM9o9ywnAO4A6V2VQYHh7rbblvWbf9ghFq6S5r82k6AjMvz2R3bXW1yhdnhTW6EvDT
         5rdZnbwDtXC9fEp5D7ddxoA6q+t0ByUL6zdmYaUno+Z44ofNFZ/Mew4yowl8+Le3SE2+
         H365VgJO6aAXytt53v5uFhMtwww9P2q+1PNrnffKCbiiWR8abqLKVdd3cVUzi+Vr9wYu
         Hq29qspe6Z2VuXj8cqLxoDF4P+fFUXHa0H8y/MUwONCNpO2JBZ4v0+mrpdbspChULX16
         6OdtGFihnnXFPZCObtt4TCxUa1q6YzaRw6IGPWZ8IDVi9B3L8WiRkDI+evCT6wRyV8BH
         kU8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW2NJBuzK4nURQhqu+KLUztpmXvJ8yJz15um7k839oMGwIJiPg53MbgPVYSP+8+2OqIqae9vSTnf/YDpLWqDGnK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx//dD6qnnxn2PrkNwKp3H1z7AGlw4deDUwHSQ7UaoGSBAUTTDL
	zyWk2euCa3b0owYQvPIQ4zk11wiYCgP67lvDDlQhqsB4MCcI+q7ZsegKraf9SZFAhI+crDQ+Q0/
	8qE9nzVIiDnexACQ5W+g3d2soGrvBb6oA3kRqzPDghw==
X-Gm-Gg: ASbGncu1pQkeh6vMEGzPecHoi3Xa1+tFN8xm80KYQJgybpMnpHS1ge96oqUQYc7UAyQ
	pUvi8nXpa3pvndMscWh1Zg2smc84uHYcrJwywC8oCp0J18TVCIkr3g31gAqB8A3PYZXbzYSZO7g
	GPTRtbqfDqmtnkgZgUxfn213+RT05LfiTOaXAdihAjg+7Qlfe91aT+f6Wx1/ugRoJ7aHNmZLBO4
	xl0BZQ=
X-Google-Smtp-Source: AGHT+IHCwFbr6hM4SofCoKFNuaGsZexul62ZHJaP09xPkxTc5K3eZJNMRyy9Lqm+DJrLEpWrNm0Dt8rNW5UZHZ3ILnk=
X-Received: by 2002:a05:651c:111b:b0:32a:6b23:d3cc with SMTP id
 38308e7fff4ca-3305341163emr16031911fa.25.1752255868348; Fri, 11 Jul 2025
 10:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com> <20250710-drm-clk-round-rate-v1-2-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-2-601b9ea384c3@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:44:17 +0200
X-Gm-Features: Ac12FXy5w5LZfYTJ16GWumg6iWoXPYqfrbZ0euf79O43X2SKG618Bj4k3h1lAGY
Message-ID: <CACRpkdZus86rP1BiSw2j24eaSuMrCEorZU9Rc4ouWmmz8iaqhA@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/mcde/mcde_clk_div: convert from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_104430_125898_CFF50DBE 
X-CRM114-Status: UNSURE (   9.01  )
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

On Thu, Jul 10, 2025 at 7:43=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:

> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


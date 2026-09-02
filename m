Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F30C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d33A2cRSMy14qLiB29N4dNiBSipjfdSlz1gXIdUUM+M=; b=fiiGvvchTwLsDSduCB1gFzbSsG
	GcIeo4S8xV1tRGumU8cAWMGg9B5jZWBoOSDtR45r05BrzvOhKfzguCRBwh02EVF7Y1r/q8Bz6sFsp
	RYsJxczgFELxX6c7lYLLhG95Kzwb73+qvhtK2AKy6BMa+deSpIpHJ5qdoh+dlV6SDtcyOXjTZJTLt
	7Op6WSWcMsGYB5dYg6Ii0KCc9DtyTbypEwmoXkVoic8eD3y+hgVRYEiM/wweWINi/19gAAzzYL77v
	p3QRKnrj4dkI0rh5ifnS4SOev+8NGhuxavQpxX2h7sjfYe6E6uo/Ag1O7dDSB518OuabWyYTWwm1h
	q9O1tyKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jW4-0000000EYci-0mVf;
	Wed, 02 Sep 2026 11:52:32 +0000
Received: from mail-qk1-f177.google.com ([209.85.222.177])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jW1-0000000EYbq-1DDF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 11:52:31 +0000
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-936e393176fso81844785a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 04:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349948; x=1788954748;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d33A2cRSMy14qLiB29N4dNiBSipjfdSlz1gXIdUUM+M=;
        b=pSGowrsMhU12Zy99AOl8rzJYQA6n9lkILhy9AGN8z5mpGiHcBKNVwc/0qX5TeDQzDj
         FgUQ5ouDEABHTB+AQlpmykbHkP4LgVQT9wKfbs8GFkTKFEmX5WZpxpG3mY9kJkI2zLZ3
         xtP/UB6TL1uQNq8JTbpfPRUEoGjIOovn1ed56yU3PZP1/XcOa91I8fAiOfF+S+gLWt6a
         bU7s72/pYiE8GFFAjov4vq08P6hJviy/qUMa8cN/uCWaGLsMsl7Hde+xikQxmdrx5Ofp
         sfXmWoalF0FC0zAczabWxPfsdHixhKxFzQpr4rRmyBmFCmuS2/FmmI9KGYBYDCuOuAw7
         cdfg==
X-Forwarded-Encrypted: i=1; AHgh+RrRL0T1f4omdBUn7tQ+HQBwVzOczdYAcrEYx032boDyq3imtRrfCiSrqPs3WcjpDYuObpqEkdQd8bnCTW05qpWt@lists.infradead.org
X-Gm-Message-State: AFuF++la3D1gG1BJLfwOGi+3gfKbz54vjS38zYNl/2Go3tlofML1VEed
	C1pPKTMMMtQYMw6CQC2nupFLQCrybVm2dHjght3grYdXyPRIkUvzhZid2070tc5Q
X-Gm-Gg: AR+sD10GfHWzqz4bFp88PlYrk3aeOpzRXUwH2M5s+pTqIqlsGKhvG4FZyNOQK46VLeL
	BKBhVz/AnFyujAfMKTNKQyNnlB0Lexsx1/fFNvuA8PrWf8PSWiQ31cgUG4mRQS00o65zjgHWT6x
	zK7y2hZhI+KhAEzARqNFZZcNkBwy2QE7LglQAgI1DVo+y4DHj2yyPkbl4VL2beaVYFnLLUmPntL
	yxbVpawlfmo8KTTAsavSVEiGRZ279t07r288yYfZsPsSxVsOaD8s86JhVFilE+LBEEjz6QBrK4h
	TFKcKOzX8P7s678Q/nUkB+Ylo4xxHGykzcVLYmi/8HduBnFiTQZ02P7VVe/C2en3yL7bvAB77EW
	kh8dWy2zGXrncDL4XM06YVlSUGa8cVotCsMcQEtsDgi6PzBkQUkuKYeUsfCaiv4H1x3u/KGgzo9
	1dkx5bG4BeqjZAsPJ+hePxqC9etln6JRXOTuYTki+jlDDizP26kZMv5NSHNDOVgrDiem2jTXQCo
	8q3U0i7WHvdO1ilckwBSZppeTkdVA==
X-Received: by 2002:a05:620a:27c1:b0:939:2bbb:b266 with SMTP id af79cd13be357-93960ccd7b1mr487402785a.8.1788349947745;
        Wed, 02 Sep 2026 04:52:27 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f1aa0a3sm191112885a.17.2026.09.02.04.52.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 04:52:27 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5300bdf61d9so10425361cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 04:52:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoO7FIlhfK1sVTAHvVHlmIdiKcc5GqpfH+lu5absHhLUs8SPwwd/Lw3Q7A7w/ypkP/EEAghNryR29M88Ohqowtf@lists.infradead.org
X-Received: by 2002:a05:6102:2997:b0:784:a169:194a with SMTP id
 ada2fe7eead31-78a1f437b62mr1623913137.10.1788349475087; Wed, 02 Sep 2026
 04:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1788338320.git.geert+renesas@glider.be> <619a6e41495adfdae3e2e6c0fee97e0550a5c404.1788338320.git.geert+renesas@glider.be>
In-Reply-To: <619a6e41495adfdae3e2e6c0fee97e0550a5c404.1788338320.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 13:44:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVstZYufZWdD-ajwg74kU6pWtQE3WueCg-XUw9Lye5DAA@mail.gmail.com>
X-Gm-Features: AcwNN1UuztEnaQfQ-OMWO4Fx0VqCWe7sLpxq0iVHzvAi1AhVOPaRJUxDUVxmfIc
Message-ID: <CAMuHMdVstZYufZWdD-ajwg74kU6pWtQE3WueCg-XUw9Lye5DAA@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] reset: Add reset_control_get_from_provider_exclusive()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Saravana Kannan <saravanak@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_045229_352016_984C20E4 
X-CRM114-Status: GOOD (  38.95  )
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

On Wed, 2 Sept 2026 at 13:30, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> When stacking two reset controllers, the upper one should go through the
> proper channels: request exclusive reset controls and use them via the
> reset_control_*() APIs.  However, unlike the clock subsystem, which has
> of_clk_get_from_provider(), the reset subsystem does not offer a way to
> lookup and obtain a reset from a reset provider.
>
> Hence add a public helper reset_control_get_from_provider_exclusive()
> to lookup and obtain an exclusive reference to a reset controller, based
> on the recently introduced __reset_control_get_from_provider() helper.
> This will be used by the R-Car X5H Module Controller driver.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - Replace reset_controller_get_provider() by
>     reset_control_get_from_provider_exclusive(),
>   - Add kerneldoc,
>
> v2:
>   - No changes.
> ---
>  drivers/reset/core.c  | 37 ++++++++++++++++++++++++++++++++-----
>  include/linux/reset.h |  8 ++++++++
>  2 files changed, 40 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 8af7cd2e8a5029df..6d4c95b3edb18248 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -1141,6 +1141,7 @@ __reset_control_get_from_provider(const struct fwnode_reference_args *args,
>                                   bool gpio_fallback,
>                                   enum reset_control_flags flags)
>  {
> +       struct fwnode_handle *fwnode = consumer ?: args->fwnode;
>         struct reset_control *rstc = ERR_PTR(-EINVAL);
>         struct reset_controller_dev *rcdev;
>         int rstc_id = -EINVAL;
> @@ -1154,18 +1155,26 @@ __reset_control_get_from_provider(const struct fwnode_reference_args *args,
>         if (WARN_ON(args->nargs != rcdev->fwnode_reset_n_cells))
>                 return ERR_PTR(-EINVAL);
>
> -       if (rcdev->of_xlate && is_of_node(consumer)) {
> -               struct device_node *np = to_of_node(consumer);
> +       if (rcdev->of_xlate && is_of_node(fwnode)) {
> +               struct device_node *np = to_of_node(fwnode);
>                 struct of_phandle_args of_args;
>                 int ret;
>
> -               ret = of_parse_phandle_with_args(np,
> +               if (consumer) {
> +                       ret = of_parse_phandle_with_args(np,
>                                          gpio_fallback ? "reset-gpios" : "resets",
>                                          gpio_fallback ? "#gpio-cells" : "#reset-cells",
>                                          gpio_fallback ? 0 : index,
>                                          &of_args);
> -               if (ret)
> -                       return ERR_PTR(ret);
> +                       if (ret)
> +                               return ERR_PTR(ret);
> +               } else {
> +                       of_args.np = of_node_get(np);
> +                       of_args.args_count = args->nargs;
> +
> +                       for (unsigned int i = 0; i < args->nargs; i++)
> +                               of_args.args[i] = args->args[i];
> +               }
>
>                 rstc_id = rcdev->of_xlate(rcdev, &of_args);
>                 of_node_put(of_args.np);
> @@ -1257,6 +1266,24 @@ struct reset_control *__reset_control_get(struct device *dev, const char *id,
>  }
>  EXPORT_SYMBOL_GPL(__reset_control_get);
>
> +/**
> + * reset_control_get_from_provider_exclusive - Lookup and obtain an exclusive
> + *                                            reference to a reset controller.
> + * @args: Reference to the reset controller provider with all the args like
> + *       reset number
> + *
> + * Returns a struct reset_control or IS_ERR() condition containing errno.
> + * If this function is called more than once for the same reset control it will
> + * return -EBUSY.
> + */
> +struct reset_control *
> +reset_control_get_from_provider_exclusive(const struct fwnode_reference_args *args)
> +{
> +       return __reset_control_get_from_provider(args, NULL, 0, false,
> +                                                RESET_CONTROL_EXCLUSIVE);
> +}
> +EXPORT_SYMBOL_GPL(reset_control_get_from_provider_exclusive);
> +
>  int __reset_control_bulk_get(struct device *dev, int num_rstcs,
>                              struct reset_control_bulk_data *rstcs,
>                              enum reset_control_flags flags)
> diff --git a/include/linux/reset.h b/include/linux/reset.h
> index 9c391cf0c82298a0..09ee47b27f88d3b1 100644
> --- a/include/linux/reset.h
> +++ b/include/linux/reset.h
> @@ -90,6 +90,8 @@ struct reset_control *__fwnode_reset_control_get(struct fwnode_handle *fwnode,
>                                      const char *id, int index, enum reset_control_flags flags);
>  struct reset_control *__reset_control_get(struct device *dev, const char *id,
>                                           int index, enum reset_control_flags flags);
> +struct reset_control *reset_control_get_from_provider_exclusive(
> +                               const struct fwnode_reference_args *args);
>  void reset_control_put(struct reset_control *rstc);
>  int __reset_control_bulk_get(struct device *dev, int num_rstcs,
>                              struct reset_control_bulk_data *rstcs,
> @@ -173,6 +175,12 @@ static inline struct reset_control *__reset_control_get(
>         return optional ? NULL : ERR_PTR(-ENOTSUPP);
>  }
>
> +static inline struct reset_control *reset_control_get_from_provider_exclusive(
> +                               const struct fwnode_reference_args *args)
> +{
> +       return NULL;

As reported by Sashiko, this dummy should return ERR_PTR(-ENOTSUPP)
instead.

> +}
> +
>  static inline int
>  reset_control_bulk_reset(int num_rstcs, struct reset_control_bulk_data *rstcs)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


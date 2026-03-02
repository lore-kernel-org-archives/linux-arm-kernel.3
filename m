Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E6DE9B371
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGJIr8wFv9hr5lqBHLuRLwT5yQ6DlyeOxeauruYedWE=; b=WhfTHhZFnr6itjaZDknIPM1aYN
	I9qn/0hVSloAYnp+iePJZ09xbwMLVchXtQANROEFnJ4BOw5LDuhrzKDLjzVjKrstFTxXGcxKoMQav
	wQSPQWg83KVabz+6GjbHdd7AyXmphMcAdjaeb6N9BBIfozqHQmrDFyCF+q9FdZVU463/8KpJ2Fr9u
	3NhusqdSQ96xpkyuo5+4VvyCH6VkFzYD4gs1ZmVCiYhcM2GEeMnKE6u5PoxoQgCNuXkpcUE7H50Eo
	4Xqx8avfkT70KYamwzPHE+n2rqJw2KQcmAg/rBeeytzvCwERJ2Ww2v6p7fql6W4OkX1GPzOsP+HoP
	8Bs4uxCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2WV-0000000D0Ct-1GLi;
	Mon, 02 Mar 2026 12:37:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2WU-0000000D0CY-03x5
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 12:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jGJIr8wFv9hr5lqBHLuRLwT5yQ6DlyeOxeauruYedWE=; b=IEZ3Avfp7gjUVi1GZB6gq6xk8a
	UN8LeMQ/e/L/UxkX9hlEfkySynT+jJNsxplTPHS3qH+6ZqHchItGc81+3bqEXKqlJhdtqBmAWBlgj
	oRVC57JqmAweS6kj0wgy77+xLZDlkzLEzmE+uDSUs9Nqt89UoEnOkEVrO/EKTyRhlsOhS1RulwOjq
	paG7i7N6bDljUVCai+qpW2f5XJMzp4tgsew8lgJuOAK2x54xNU0shw7JPqQ17zyOa3ejnmslV3rx9
	XGKNJjW+DgY1blM5HDklPXNURkwqckhLI77l+ITtnj2NCKnpJEmuRFUBR7FK0RhG3w+xKkoUvsvYS
	uK8c+crg==;
Received: from mail-ua1-f50.google.com ([209.85.222.50])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2WR-000000001kV-00ch
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 12:37:16 +0000
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94acf9ce1b7so3176645241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 04:37:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455032; x=1773059832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGJIr8wFv9hr5lqBHLuRLwT5yQ6DlyeOxeauruYedWE=;
        b=h79E8G/jtS3lrrewPTEJJq5zYezRUtayTUAopZ9CSB9od7q4DQGnX9ZXAnHV9ZWG/2
         r42VXhN4yjFKeyy3EAypajrpTfSqdZw6z18fP+iTXNbN9Gild6PQoM6CaU4R4h1YIeVY
         Xj4+lxUJgSj0K+L2SpPD83jB1glexsZkSikdevFeEupWfQ5gmurRKQ0stQYk+0LLPgCP
         +P7hxw+Dt+GmvwVIM/ZvGXivIiWiErlpnqT0ctpnA+IXW2xrVhoJE1F2qkZDhHiZjM6y
         VPWR7yqTZ/A7AL2EPzxuOcengdV0/EIVAYp52D9VrJQu+4trgVfCGJ+x10CekmMIaY44
         wkcA==
X-Forwarded-Encrypted: i=1; AJvYcCUGER9S7cx/XLeieLfAOtzo8F4YhLeT4GiivytcojxeMbcZfazXlSHSqR06IGOa12gG+fV9gdbHCUSMDM+p2X4b@lists.infradead.org
X-Gm-Message-State: AOJu0YzcV5Ete/wM6xIDfkDtCesKRijkkhDaaSiSqPAR13C8sYOQoTEE
	O2A4UVz1juQAW5O7y51wybWBnQq9R86rtdzc5HrtDXQ42l5RwiMD1WAb18nvWzIg
X-Gm-Gg: ATEYQzzj87XM7MtPuEclfteMXUGo6mtRP1e51DNMJVxVN5s6ZpREVQyP0GUul1+1vAU
	yond9qPjX+jXLUgckm2PnR/PN76Yj4lY7rRHDtjCqxSQSJIO2/nOiCrIfkSBRlBJbgRVsr3Erhi
	PiBs9wJjeJ7MGg/S4xwXYpJMoKTkREQZVcENofqOZkll7qCR6JInHcEEKACHh3vAioE98fUDSRz
	B4HfBHw1HDYK40RmaDdsDo2qvStBZ+P7+8uE6T+jqpde7t3cu7F3gzdBs962QdtUNU7ta5tkmXh
	zpk2fLOQe3nESL9BG3Gvb/H1r3SYiMvaGVKNTJJXWRMQdLC1ztt5Ym69DbfqvNi6q6w3wNUsy6v
	LgI74uVVfnPIMfRG/pWFq1x7fsKGvzeAYaiKuZT2NYGkBK6IGf/u5xa8lj2AkeFatl5uiRMlMNR
	QfDB+2QIe7vp1EN+IyFfjPHgulKz4TUYXeZIGEA3WjetQg7qN1yfduj9klL8tQ
X-Received: by 2002:a05:6102:1629:b0:5f5:46f6:fb29 with SMTP id ada2fe7eead31-5ff324e81ffmr5803679137.26.1772455032478;
        Mon, 02 Mar 2026 04:37:12 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df641e133sm11749516241.5.2026.03.02.04.37.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:37:11 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ff07cb35f2so2278477137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 04:37:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZmEPS+GfGIjIlIBES/ko9LETtsfpRA4qmXVG1efL0qM7HoN+dwStGjqh7hU4Ge7S2lapNeuRc9nGyzsO0q4YM@lists.infradead.org
X-Received: by 2002:a05:6102:1629:b0:5f5:46f6:fb29 with SMTP id
 ada2fe7eead31-5ff324e81ffmr5803667137.26.1772455031730; Mon, 02 Mar 2026
 04:37:11 -0800 (PST)
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com> <20260227153225.2778358-2-cristian.marussi@arm.com>
In-Reply-To: <20260227153225.2778358-2-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 13:37:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUZjZvhifzh0W2wbMZf2DYgZjO=gXepsS2nQtSG0weCag@mail.gmail.com>
X-Gm-Features: AaiRm53-o6YuVgiLNI10tKCGvgnqzSehuU_fUzxc3DHRL4EGR1lrqXZ8SrXsMvo
Message-ID: <CAMuHMdUZjZvhifzh0W2wbMZf2DYgZjO=gXepsS2nQtSG0weCag@mail.gmail.com>
Subject: Re: [PATCH 01/11] firmware: arm_scmi: Add clock determine_rate operation
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_123715_160326_D1366643 
X-CRM114-Status: GOOD (  30.07  )
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

Hi Cristian,

On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Add a clock operation to help determining the effective rate, closest to
> the required one, that a specific clock can support.
>
> Calculation is currently performed kernel side and the logic is taken
> directly from the SCMI Clock driver: embedding the determinate rate logic
> in the protocol layer enables semplifications in the SCMI Clock protocol
> interface and  will more easily accommodate further evolutions where such
> determine_rate logic into is optionally delegated to the platform SCMI
> server.
>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch!

> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -624,6 +625,46 @@ static int scmi_clock_rate_set(const struct scmi_protocol_handle *ph,
>         return ret;
>  }
>
> +static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
> +                                    u32 clk_id, unsigned long *rate)
> +{
> +       u64 fmin, fmax, ftmp;
> +       struct scmi_clock_info *clk;
> +       struct clock_info *ci = ph->get_priv(ph);
> +
> +       if (!rate)
> +               return -EINVAL;
> +
> +       clk = scmi_clock_domain_lookup(ci, clk_id);
> +       if (IS_ERR(clk))
> +               return PTR_ERR(clk);
> +
> +       /*
> +        * If we can't figure out what rate it will be, so just return the
> +        * rate back to the caller.
> +        */
> +       if (clk->rate_discrete)
> +               return 0;
> +
> +       fmin = clk->range.min_rate;
> +       fmax = clk->range.max_rate;
> +       if (*rate <= fmin) {
> +               *rate = fmin;
> +               return 0;
> +       } else if (*rate >= fmax) {
> +               *rate = fmax;
> +               return 0;
> +       }
> +
> +       ftmp = *rate - fmin;
> +       ftmp += clk->range.step_size - 1; /* to round up */
> +       do_div(ftmp, clk->range.step_size);

step_size is u64, while do_div() truncates it to 32-bit.

> +
> +       *rate = ftmp * clk->range.step_size + fmin;
> +
> +       return 0;
> +}
> +
>  static int
>  scmi_clock_config_set(const struct scmi_protocol_handle *ph, u32 clk_id,
>                       enum clk_state state,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


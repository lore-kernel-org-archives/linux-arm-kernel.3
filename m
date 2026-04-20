Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECD1F557EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 08:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rk1cjRbAtp4GCcTi8WWTinbg9eeO3gY1eDEUp3GR38Q=; b=qIRSOGf4M8ITZptiK5fEdEmOT4
	8Xw74ICETUXQ98XOq+/ysKwCtmy3xpqSm4vdgV7MnHpLE4HKGsxSoh50/Q7dVz82Q0zGCNZ7dLixP
	rLkKUtpY2iUaIKVAl70tWJozo9BVsm/bmFjx80xfpVQShlKKZosTprKVgpNlca7M3/SK2W9u7mBeL
	GFII50AqIYNVdpuhDfqWHYZhau26rVhsk/Wy60uY9cBdHLy/Wu922/NaKtzLSkPxZ3TGdLNcisd+n
	Bx9LURzBldOmKN/nJnznA1p5/C4SqTy/Jn2o7GdLaCeJ+rRRjGVLizSRMPLbRPdnldp9oJQwV4Z8i
	tqbSYTkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkKT-00000006dKz-3j8F;
	Mon, 20 Apr 2026 08:50:05 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkKS-00000006dJy-0Irr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 08:50:05 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56f8c77ca6aso2081629e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 01:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776675002; x=1777279802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rk1cjRbAtp4GCcTi8WWTinbg9eeO3gY1eDEUp3GR38Q=;
        b=Ra7af4WSbdycZEjaUhz7cnYfgU5Pv5gBwc1xcrUjVHqkkgUlfr0EIHJ68omSPA6RTf
         4wm2G+MM/dRwAJmp4lQ0F6etV70zQTlWglyjLEj/AySA2gvDUGrwLxl+JvmxoCv6ijZE
         Q2atI/ws0eQsLvUOPYRPswvaUlDfso00MMq8oTAXHwt7WjSpEWh2p9yjvDMTtr3KK1En
         S0uFO/7CVSnrl1tekBs6iIPUNevJ+vii0xOqQAmiuvLz9K6rRwEFAwjDxeXcUsXYkL6p
         KR5YoZYMvWGygnV6V1Wj3f6Q1kBLCdqRC9B3DTnWswFMyi/TLv/ohp2SH8StqkyrCuvV
         WG0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ovugdMKftRggsMRntnGpz1xxFe+w3LN6R0r2XeWJn/emg6POosFc/f7K8B7Hpr9jkIqNk5u0JJLW9Ngfy+WQQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1zdwASjXoTHsDyMzmIIrWyZmLowyiQAOiInn1ma6mbh2HgSwN
	GU0udKMiPDwTmUW3Rm/mEWQKEdeXCy0nc/Twy9DMce6GS0R4AFybdyyggkZJwOGE
X-Gm-Gg: AeBDiet771UatKqWe+m6z2gq/PmypwpMRhqD+z41Q/7kkWZEpipkMBSaU6GFxD7Nuvt
	tQ1Sb0mWc1mCBtA8Jj3aRKTbzfJ6Eh9XXQKmS8LaNH3a2F6jtZKOU2FVEZ3Z5Egti4M0ygXOgIi
	iJFgw5DGKfmFi99nS9L+tlxzU4TN/zd9zeKOL1KdM/96VjSlQVczNNuNGI/c0VLerS1glE2Gp2O
	5G6ykoXx6yxJl341GnX8bayvOaa+t6HbHtNn7wJyQBIljXrgJTO8ViF2JPPlzES/ylnNOrGnVBR
	vTWyncT/lQ0E5WP9QwFgWsTs2An4Kk6+LhQTwxdDKTf1lOPYSSTptsqnMUauAHOy2yQURZJ0DnT
	tsCjZ/YXBAoFckDFSzJSrF2qx1wJua9mp2c80TewFHLq/uvTgDJo/afVAAybF5x0n8xHHK5Eca3
	uItWWABQAuFAH3FnKyARwyL+B6YHzdyQ3opxKY7lk/p0QH7BGS08fwEHNjr9kHjdDkRuPbrTIP1
	G4=
X-Received: by 2002:a05:6122:90e:b0:56f:6b46:28be with SMTP id 71dfb90a1353d-56fa5931dc6mr5255299e0c.8.1776675002609;
        Mon, 20 Apr 2026 01:50:02 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa91bf120sm5807858e0c.3.2026.04.20.01.49.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:49:58 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56d93355337so1873630e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 01:49:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+lfEkrelcOtjWCe4PZYFa+NjzmXCZ4Ggu7H8VdbP4tb3VsqWf8HhUQm0aKHRp25cbHHpzJplpASWeMEK+EFciT@lists.infradead.org
X-Received: by 2002:a05:6122:90e:b0:56f:6b46:28be with SMTP id
 71dfb90a1353d-56fa5931dc6mr5255238e0c.8.1776674997727; Mon, 20 Apr 2026
 01:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260410104058.83748-1-ulf.hansson@linaro.org> <20260410104058.83748-5-ulf.hansson@linaro.org>
In-Reply-To: <20260410104058.83748-5-ulf.hansson@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Apr 2026 10:49:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXzhGDjED_xaLOZnUZB4SR0KhPeWevfQvKeExEH=bCruA@mail.gmail.com>
X-Gm-Features: AQROBzCwV8ST6yM54ry_6ciPjTsOUiTBNbVImh4WgAAEBeYQh0fedrFtMJ2X8vQ
Message-ID: <CAMuHMdXzhGDjED_xaLOZnUZB4SR0KhPeWevfQvKeExEH=bCruA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] pmdomain: core: Add initial fine grained
 sync_state support
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_015004_136679_16B3D9BD 
X-CRM114-Status: GOOD (  25.49  )
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

Hi Ulf,

On Fri, 10 Apr 2026 at 12:41, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> A onecell (#power-domain-cells = <1 or 2>; in DT) power domain provider
> typically provides multiple independent power domains, each with their own
> corresponding consumers. In these cases we have to wait for all consumers
> for all the provided power domains before the ->sync_state() callback gets
> called for the supplier.
>
> In a first step to improve this, let's implement support for fine grained
> sync_state support a per genpd basis by using the ->queue_sync_state()
> callback. To take step by step, let's initially limit the improvement to
> the internal genpd provider driver and to its corresponding genpd devices
> for onecell providers.
>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Thanks for your patch!

> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c

> +static void genpd_parse_for_consumer(struct device_node *sup,
> +                                    struct device_node *con)
> +{
> +       struct generic_pm_domain *genpd;
> +       int i;

unsigned int?

> +
> +       for (i = 0; ; i++) {

... and you could move it inside the for-statement.

> +               struct of_phandle_args pd_args;
> +
> +               if (of_parse_phandle_with_args(con, "power-domains",
> +                                              "#power-domain-cells",
> +                                               i, &pd_args))

Checkpatch reports a superfluous space before the "i".

> +                       break;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7D21091914
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3OWvbRFWeHVUH+eQg7QXHsou4B24BwJGm6d8wGsTrzY=; b=UgEiT5MpkjMm5qSBdoZ0bhy/SC
	wXOXWj8ZPPXG3u9gEuxdCP/JaZ7rDWQFlVG2Lq2wde5IlQPCE5YPxyXlvWWb3/Iy2p3YmaTjgLAhG
	059hQ2yObOpo6XfgkBze4a3CAqK8YWWSTjA3vnHtcOic7j7+nUVNI7RI7iioLctlN2AVgjMLyPVTj
	xiAr1I+gy4neSUNsBfZYtG3OoZZQJPO4DIaKWGqsxtVaIU6bdrMRl+yZ+K/UZRKARLYE9gB1XyJtV
	3oWs1A2wr/KWbgIah80Bu5ss7fLsmewTFEAB1E7O9WvqczHAR3Ux37eAqK/Q4xzi0Xtz606fqxUDY
	m1D5MZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WAj-0000000CTgl-28v7;
	Fri, 20 Mar 2026 09:29:37 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WAg-0000000CTgQ-45NE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 09:29:36 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56b7fce3ae6so1662579e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 02:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773998973; x=1774603773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OWvbRFWeHVUH+eQg7QXHsou4B24BwJGm6d8wGsTrzY=;
        b=OIyeYFwj1rEIeDnGB1jIRu2F8XfFIiUbKNGjv+6bqRfWa5dTozLkOHKa5+ADI9M4hQ
         ssAh0fe1vniwFIi8Ob6EwUEA7aygnhEHEgUG3T0dccLf9P/cIc4NC/fpXUmeLRmbmB19
         eAcG0zSd891+sOtwQ0PzAl1GmZFEyiZcehT7FC4vIlyE2emeZuGRsysFMMmBbwcg53+T
         0QlNot0pQMGARABCRwlLYInUhaXrva8SRGwaLwLXkMDyBBrIqB761bGOZG5AyWfmUbvY
         qqC0mP6evKh2+rEsGpj1Rl+aqVRGazVxv0EUpqR1V8j2bYiO8/AC4+/li7ayRLpYlQ+w
         /W0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDHwhh2ppbfDmUxPF2DEZIt+6H7ayKPJkmTNYbyXyvooUEEuhRmLrNNjSCdthp4fvrIehA4JP35PE05KIGCDdK@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg2xDuK6F6UX3HfWVGzDUC8eT37MGy/QltMqQbXIrHbGWzdjht
	Igl8dY7s5NXS/Ghp5WeULIufYycFDQRDRFhdFv6tZhm+OTSllZ63LV7oRoE+bQGBkfc=
X-Gm-Gg: ATEYQzwVV1rt+4f5VuXjwJEjGGeb9T/BwjlD+EioJ/DZH3GizrQdaP9TII1s2/1SXFU
	x9XX0Bm8/ZuY0OuWTAwHAMiAtyC2tCKmTgOCPuqFL2VHHgkYOPt6QXfzG4DvlEN+tATtQotINzC
	YiAbNEJ00oW251DfqcqrfrnyQIy67vBDOG3M456U5pURDiHLPniZibJ7izV4xmPdlDnhhuZJtaV
	vE24LozBkItuM81ppY+DLR6NKAXkApFASgG/2wEHUN99gdoHtQSt3hi8d7W/gr/25CMZ8zf/oir
	y7yqowYmyndxNq2GtFwVJPLgNMW8KPvCSy4y/XAwLvGoug6t9yhKXfcXGLXQep0HRy324nCxd3W
	Ydp0jihTa9GZGeD51dpsOAcvqRF7qdNXPNFkjGEOk6VfR1qh72m+ezEFsdsHr87LCA8Mbq6Vikh
	/jB1xDycpvunnyUeJ8RecFdMU7SKECHfFFn2J2ldJB2fZgu3fy3LxwRHZv94OGsw+hQUYKY8k=
X-Received: by 2002:a05:6122:c181:b0:56b:8003:c2 with SMTP id 71dfb90a1353d-56ccff5ab67mr2556037e0c.8.1773998972804;
        Fri, 20 Mar 2026 02:29:32 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddcf1554sm1319738e0c.17.2026.03.20.02.29.31
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 02:29:31 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ffd797184fso1179139137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 02:29:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwfck3UggCen4WVl0xzKaK9o9QZvmhaOT1KcI68/InK061t3325kCPSmDyMJojKYbNsWuNPXIs658eqytLd9OK@lists.infradead.org
X-Received: by 2002:a67:f0d6:0:b0:602:afbc:ae78 with SMTP id
 ada2fe7eead31-602afbcd937mr731164137.2.1773998971174; Fri, 20 Mar 2026
 02:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260303132305.438657-1-ulf.hansson@linaro.org> <20260303132305.438657-5-ulf.hansson@linaro.org>
In-Reply-To: <20260303132305.438657-5-ulf.hansson@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Mar 2026 10:29:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZknduohmhed4dFBtXuSEowmfCJ=C8HeuCGXsCsvFyWQ@mail.gmail.com>
X-Gm-Features: AaiRm523IC3GrIsAhOOqBmX4iY-88KJFmptpIGAiC68dOGH9suDr0hQOLTqaLuU
Message-ID: <CAMuHMdVZknduohmhed4dFBtXuSEowmfCJ=C8HeuCGXsCsvFyWQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] pmdomain: core: Add initial fine grained sync_state support
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_022935_050139_05761EB6 
X-CRM114-Status: GOOD (  28.61  )
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

Thanks for your patch!

On Tue, 3 Mar 2026 at 14:23, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> A onecell (#power-domain-cells = <1 or 2>; in DT) power domain provider
> typically provides multiple independent power domains, each with their own
> corresponding consumers. In these cases we have to wait for all consumers
> for all the provided power domains before the ->sync_state() callback gets
> called for the supplier.
>
> In a first step to improve this, let's implement support for fine grained
> sync_state support a per genpd basis by using the ->queue_sync_state()

... support on a ...

> callback. To take step by step, let's initially limit the improvement to
> the internal genpd provider driver and to its corresponding genpd devices
> for onecell providers.
>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c

> +static void genpd_queue_sync_state(struct device *dev)
> +{
> +       struct device_node *np = dev->of_node;
> +       struct device_link *link;
> +
> +       if (!genpd_should_wait_for_consumer(np))
> +               return;
> +
> +       list_for_each_entry(link, &dev->links.consumers, s_node) {
> +               struct device *consumer = link->consumer;
> +
> +               pr_info("%s:%s con=%s\n", __func__, dev_name(dev),
> +                       dev_name(consumer));

pr_debug? Or better, dev_dbg(), so you don't have to add dev_name(dev)
explicitly.

However, the printed provider name is again the name of the first
domain.  This is incorrect for all but the first domain of a onecell
genpd provider, and thus confusing.

> +
> +               if (!device_link_test(link, DL_FLAG_MANAGED))
> +                       continue;
> +
> +               if (link->status == DL_STATE_ACTIVE)
> +                       continue;
> +
> +               if (!consumer->of_node)
> +                       continue;
> +
> +               /*
> +                * A consumer device has not been probed yet. Let's parse its
> +                * device node for the power-domains property, to find out the
> +                * genpds it may belong to and then prevent sync state for them.
> +                */
> +               genpd_parse_for_consumer(np, consumer->of_node);
> +       }
> +
> +       _genpd_queue_sync_state(np);
> +}
> +
>  static void genpd_sync_state(struct device *dev)
>  {
>         return of_genpd_sync_state(dev->of_node);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


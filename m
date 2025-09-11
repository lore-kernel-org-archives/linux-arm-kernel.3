Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB527CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 07:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Xz8T3amYkNV7rSzjipUYMhb6u7hBtXfStQbJ8Sahd0=; b=Aar+o146BwFncVgkl7IT2MHDpt
	2ZE2IhZblXL9zOXFwv56XhU6BAZ1aANLlsPOAZkts2a9/FSeHIzSVEBe7/wgA5JPKIcvCiNbT9jGd
	Ug0H/GFnJB8PHMcSenSMkUNpIOCl0DFyVfS9eRGoaMg8QYxD3qf0BHnsTO62OzaPon9xZL2a7o29l
	Bm9BsDVF41EQSAyhf26eui3b0VZGr/x39b105OqjD9ttzeGS5gsaA+W+4UEheklPb1hlSAMkfOXtA
	eFrTu0CtEWcJlAdz/KDaulsWUCmbvP2WS5e3JNtYqtEt8dIBbFVq8GhAy3wdqpqPl7CEwfEpcCi3H
	J6sRqo3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbZv-00000001RWD-3Xla;
	Thu, 11 Sep 2025 07:18:47 +0000
Received: from mail-vk1-f175.google.com ([209.85.221.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbZs-00000001RVO-2cGF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 07:18:46 +0000
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-545f4b31600so77776e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 00:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757575123; x=1758179923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Xz8T3amYkNV7rSzjipUYMhb6u7hBtXfStQbJ8Sahd0=;
        b=usXfyM0X1nQGC5qW4MZWIcMRacELElJXAsXc+OOFNhEwey/n2E2wOQTHo9IevI/tXR
         J2++GoDn/R8xWJ/sqMYYm3BYt1d1dYhLmecTDpDlwyc/u6B5SylOfNHpFAeln+Kn67a+
         iE5LqFOZXqroJQw6kuMY71fgRZAWYn8t4SnLpjOC7G2wYD7vLlDfkT0puwRRzbSb+U07
         EgW7Fut5WiUzHwFnw6xPAfw/iZkNn5J/gBKJVJp55iD7SnY8I2YWBVxrMOpRJdDjusjH
         GoI1/0MNdQUWgpDPDEuA4+w8gHfyrSMseXmMSuHi5zgoqshRQ8591YyAgU88ZBWgzvkK
         AR2g==
X-Forwarded-Encrypted: i=1; AJvYcCU80wZTt2b33RNAsi5p65RQyMXwtJedcoqtPx5usNch+fngTl0CHsWx1xdoxJqU0alHbXVGdfGBC/8RCfxwHGkw@lists.infradead.org
X-Gm-Message-State: AOJu0YwGP/ZK+szN7lsSSg8I9lzRMhLngkEN9kRyFV4NT+LRh7JvoTwA
	RtzMkev6pJniXtN/ytY65VkEtMFsGogNRaGa9g8LB3F/aKQ9sS5NxqrS6w7egbnR
X-Gm-Gg: ASbGnctRvcHtZIUt/NqT5FgUvVGdof6ZWuYbyYTMa4FPqMJXa4yC5GC/iJF6AyAsPcw
	9ZnYRdNEsYfP1FGrkCTs0dPRAWgtK/bMf/m1mlOsRfdWxCQ4nDeLARAY6FW2sXYQDqfEOH8hEul
	OMclmG6MsHOKAxvlYPSuB47pHZVWGgBvlXEN0mWFiwG7vnBE1+N/c3HLJwhorN9+V/782yJpRkR
	1k8L9pZHfIGrTM3i/3QmW0TZuorc2J7K4yFOdZ0seomOu7EjRjUdX+dxzSQcNLb6crNIRjOXdUB
	/5BsNDGjgWMmKr5fl2BF9DWVmmeYC4hKfnNg0ywoQbkNcXvX9Ue5lkEd6rUmXJvauxs/slRJd2w
	T4LknzLeh3wdNScj6UEtTKNOedT/xQRF52ghCtp7gOx4Zy6mNyFL0VuM5pLlUJa85V93cu4wI/N
	qmSZjOeA==
X-Google-Smtp-Source: AGHT+IGqt96m6Lz2N04gjAaoyZ9X6zafuUlGD5K/ci7EBcjduByDaU2klU7cY28a5zYPHSp3gcvkxQ==
X-Received: by 2002:a05:6122:8c06:b0:531:236f:1295 with SMTP id 71dfb90a1353d-5473aabff31mr4601989e0c.5.1757575122946;
        Thu, 11 Sep 2025 00:18:42 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a0d3f0769sm127298e0c.18.2025.09.11.00.18.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 00:18:42 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-52a73cc9f97so147669137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 00:18:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEwFAgz3lVbSEK5PzJLQXa6fr2hOR5UTed7inMA3wQdOsOvqxh4oj9HuO2ECC0S0L8mvkHEmtl20UyqjEEOC4g@lists.infradead.org
X-Received: by 2002:a05:6102:54a9:b0:521:760c:7aa8 with SMTP id
 ada2fe7eead31-53d14d8c892mr5750708137.27.1757575122627; Thu, 11 Sep 2025
 00:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250909111130.132976-1-ulf.hansson@linaro.org> <DCPDDIZ3S1CM.3DJYY5U4T6V4U@cknow.org>
In-Reply-To: <DCPDDIZ3S1CM.3DJYY5U4T6V4U@cknow.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 09:18:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxjOLZsas4+nmAkZjbJsQjxdkZvZ8tTY9pq2zz3gvFNQ@mail.gmail.com>
X-Gm-Features: AS18NWAQShHnTB-pHMrvSyt-wwqsfojP53wsm5mwBKc4qvyVjVjagRnbLu_77lI
Message-ID: <CAMuHMdVxjOLZsas4+nmAkZjbJsQjxdkZvZ8tTY9pq2zz3gvFNQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] pmdomain: Restore behaviour for disabling unused PM domains
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Saravana Kannan <saravanak@google.com>, 
	linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Sebin Francis <sebin.francis@ti.com>, 
	Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Michal Simek <michal.simek@amd.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, 
	Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_001844_676839_69F4E2E3 
X-CRM114-Status: GOOD (  32.32  )
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

Hi Diederik,

On Wed, 10 Sept 2025 at 21:33, Diederik de Haas <didi.debian@cknow.org> wrote:
> On Tue Sep 9, 2025 at 1:11 PM CEST, Ulf Hansson wrote:
> > Recent changes to genpd prevents those PM domains being powered-on during
> > initialization from being powered-off during the boot sequence. Based upon
> > whether CONFIG_PM_CONFIG_PM_GENERIC_DOMAINS_OF is set of not, genpd relies
> > on the sync_state mechanism or the genpd_power_off_unused() (which is a
> > late_initcall_sync), to understand when it's okay to allow these PM domains
> > to be powered-off.
> >
> > This new behaviour in genpd has lead to problems on different platforms [1].
> >
> > In this series, I am therefore suggesting to restore the behavior of
> > genpd_power_off_unused() along with introducing a new genpd config flag,
> > GENPD_FLAG_NO_STAY_ON, to allow genpd OF providers to opt-out from the new
> > behaviour.
>
> Is it expected that I'm still seeing this on a Rock64 (rk3328), just
> like before [1]?
>
>   [   17.124202] rockchip-pm-domain ff100000.syscon:power-controller: sync_state() pending due to ff300000.gpu
>   [   17.129799] rockchip-pm-domain ff100000.syscon:power-controller: sync_state() pending due to ff350000.video-codec
>   [   17.140003] rockchip-pm-domain ff100000.syscon:power-controller: sync_state() pending due to ff360000.video-codec

Yes, as the sync state is still blocked on them.
Disabling unused PM Domains is done independently of sync state.

> This is with a 6.17-rc5 kernel with this patch set applied.
> And it also has this patch from Christian Hewitt added, now in v3:
> https://lore.kernel.org/linux-rockchip/20250906120810.1833016-1-christianshewitt@gmail.com/
>
> When I boot into a 6.17-rc5 kernel without any patches applied, I do get
> the 2 for ff350000.video-codec and ff360000.video-codec, but not the
> ff300000.gpu one.
>
> Interestingly:
> ff300000.gpu -> power-domains = <&power RK3328_PD_GPU>;
> ff350000.video-codec -> power-domains = <&power RK3328_PD_VPU>;
> ff360000.video-codec -> power-domains = <&power RK3328_PD_VIDEO>;
>
> I would be surprised if that was a coincidence.

Fw_devlinks ignores the index cell (RK3328_PD_*), hence all links are
created pointing to the pmdomain controller (in case it has a platform
driver) or the first pmdomain (in case it has not). thus blocking the
sync state call and power-down for _all_ pmdomains managed by the
controller.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


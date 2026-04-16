Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F2FF8A145
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 09:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMhoE3dWcYEYFYLFrnzKFs+t80wEaMgHVRqoVG2blDE=; b=ixTD/mWjWOEKUE8Conkr/u/8uY
	AbdFKAnAQvqiAqJTdXLeGksawv/q3KDoU6W2rLckyS5UiJvZUWX6lRwFQgODollYz9LZKwEBde01F
	nbwRfofVM2pkzimL2nUmcPqDYVuDdxnGeAmvMxZnjFKNd4+EccvqJ++S7bdjBy4Uqo0JVrjQsxhYC
	+2/TNKTDf+1nd6EolvDRXVCt+1x8qdj8OynqHMJixgHRIUh9812KdYq9OEKq+6zaqVXJbJykeJGQ0
	VeWdKJupB4v8MF1y5M/bT/xcFt7zMdCtTetqeOXk7TEJjAawU/PH2J5C5oJzruyudg4TflIaSrfIZ
	VyLPTJBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIvE-00000002EqY-207U;
	Thu, 16 Apr 2026 09:22:04 +0000
Received: from mail-pf1-f169.google.com ([209.85.210.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIvC-00000002EqD-0vlJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 09:22:03 +0000
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82f33d28c1dso2600399b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 02:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331321; x=1776936121;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMhoE3dWcYEYFYLFrnzKFs+t80wEaMgHVRqoVG2blDE=;
        b=oWhF6cOJ7NUUgcMWFBtiGnXD4zwW9/cyY4Gkaesa5yi/r2H5RyFhVXfeP2ZhvpRgc5
         xCO1OP44iUCVr2y72R2OUQTpKKgyi7hA6+6y0G4rH50uS2+aPUxzTLU5BRnhdYJrZt+v
         WE9VVV51+gH7OnyIlz51O96vKejXcDlYnfqQthp0YXXKcCCkLG33qDDRCy/T8K0uTmWP
         kECcSg3km2BPqHRN8ImwXQhW8R1fMEvqq6F7DkDDxnVpEFknK3B9GjMK/V999s4Fl5z+
         H2RU7ht2Lzzp4gmusfVjJLFN6Stkg18zbGLHrFYLBQKuXGaw9Tpvwzp8w476jAt0m1rg
         ajSg==
X-Forwarded-Encrypted: i=1; AFNElJ8m9HKJSutwmO2x9IVotwjajgHESBwd6Z+TFm79BYWCgGXtR8sTuAFEqA3JjD54FmvRkDKDnPvK+yLUCDABsues@lists.infradead.org
X-Gm-Message-State: AOJu0YxVd/Cj5UmtoHeEmF7BsHE3W670CCgwKIPU0SSa5Uz53upgnnZR
	bFsG6mAc9A6wOMIAw4pXD3A9wFEBQ6eCyysAtdTuxbh+6xWmvH3aQZzfi4w6sBqG
X-Gm-Gg: AeBDievOedksr7XxDj32ntXjlRoa8S0h6uCtgW8GauISjEBviFNzP6HHobSpeXtiPMY
	YtI3t9yMQi54RGzdK2hVYynhudiq3DcYw0iobOoPfY6HnON2VkkpUIu2c+Id03aitIzd+WJIKf6
	jYnYcebVDxpkDlZ3/Q9UQC25GahmbPOaqaB4CLfeh8sFHaWlOgOYu/CNmcKoM86Nc5NmLYM4p26
	GFx8vcvE0wPFEsvHWn25Ft3bF1EYc3dI+BkK9+r5ZDUyZMEBR0m9pb1sAVEzR3etKsRdoueS5oB
	TDUKOdIyhesHyqYu0KMg/UCZOKMnsNqaJnqaOdzYwaV2ztNOhqjdfk+4yLbBoQ5x+kYykCdmn0l
	BzgsGU7LWYwAjt8I1JgTwo1cSic+12kDBZQGBE5WvUWUP0RdcDmrgQdExrAdB7pjI+8vZTRGx8X
	RolBVZVdfrGi7+6x/X/YxzZvcUma1TxlrpsjEqg9HbxzsX+yMGShww4yoOydk2aVFRleyrbQ==
X-Received: by 2002:a05:6a00:ac03:b0:82c:6bcc:f3fa with SMTP id d2e1a72fcca58-82f0c2f7acdmr27128284b3a.35.1776331320653;
        Thu, 16 Apr 2026 02:22:00 -0700 (PDT)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com. [74.125.82.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f67449c3asm4740792b3a.53.2026.04.16.02.22.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 02:22:00 -0700 (PDT)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12c63e942f3so266380c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 02:22:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8/mfctSvZahmlLk7LOSas9U11ut8eWOT8a/XVPBRNEPnhjpG5x7lue8Y/HVLKGS9ykcvmxnTN+i4ojEeA52CZh@lists.infradead.org
X-Received: by 2002:a05:6102:b14:b0:605:6b10:f70b with SMTP id
 ada2fe7eead31-60a01e98c5fmr13021637137.30.1776330936790; Thu, 16 Apr 2026
 02:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
In-Reply-To: <20260410104058.83748-1-ulf.hansson@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 11:15:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWHnANr4R+AW5-xHrm=D4SJLuKVF5mq3PFkbevcTz5qWw@mail.gmail.com>
X-Gm-Features: AQROBzCpQ5QUMxJI8AYAFk1dpzk_2cq3BgCM8ShBxNDhV532ikSOHTjzfwIiEo4
Message-ID: <CAMuHMdWHnANr4R+AW5-xHrm=D4SJLuKVF5mq3PFkbevcTz5qWw@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] driver core / pmdomain: Add support for fined
 grained sync_state
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
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_022202_265292_DAF10155 
X-CRM114-Status: GOOD (  24.53  )
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
> Since the introduction [1] of the common sync_state support for pmdomains
> (genpd), we have encountered a lot of various interesting problems. In most
> cases the new behaviour of genpd triggered some weird platform specific bugs.
>
> That said, in LPC in Tokyo me and Saravana hosted a session to walk through the
> remaining limitations that we have found for genpd's sync state support. In
> particular, we discussed the problems we have for the so-called onecell power
> domain providers, where a single provider typically provides multiple
> independent power domains, all with their own set of consumers.
>
> Note that, onecell power domain providers are very common. It's being used by
> many SoCs/platforms/technologies. To name a few:
> SCMI, Qualcomm, NXP, Mediatek, Renesas, TI, etc.
>
> Anyway, in these cases, the generic sync_state mechanism with fw_devlink isn't
> fine grained enough, as we end up waiting for all consumers for all power
> domains before the ->sync_callback gets called for the supplier/provider. In
> other words, we may end up keeping unused power domains powered-on, for no good
> reasons.
>
> The series intends to fix this problem. Please have a look at the commit
> messages for more details and help review/test!

Thanks for the update!

At first glance, the only real change compared to v1 seems to be
the removal of printing

    pr_info("%s:%s con=%s\n", __func__, dev_name(dev),
            dev_name(consumer));

Right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


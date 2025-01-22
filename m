Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1515C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 10:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+C2qs16toBww0G96C9iejd+wL2WWrrpbqoVaIml4Wg=; b=xnG9z04qvYJ1PeSFJ/PsPNGYFO
	D2yHyvWLJemgDeKmPoz2MMPAj25exe3VYJwDBglA4NT6J66xxw66EAJDaHxyu1FN4mgxGguRLME+f
	KLrDTzHnHFCURW0qEn6Go3uQfH40VkrJ9d5MwIfiFVDde24XvxBT0ga9OHe1aF13X97SV8XhOTbjN
	6OhLlB7o2Olt12ggnEPeT0QfQkAQ0zmrsEPxw+n4OXfzp5eS9CyL1EgV++zED/8pLgsC39I39DBiI
	Bai9OClVufaJ0SSPj1KgyydLi7vElzUiERM/v0OUtsOB7aF1ZwyLKDIhtGbU4vbP8yD3ou/2jA99V
	J0WE3Z5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taY5T-00000009xgI-3Q4P;
	Wed, 22 Jan 2025 10:35:55 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taY1Y-00000009wkZ-2wLG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 10:31:53 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-51cccafb073so2219054e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 02:31:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737541909; x=1738146709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+C2qs16toBww0G96C9iejd+wL2WWrrpbqoVaIml4Wg=;
        b=DB8mwdKSXtpEjQZ1jBkkrrhTk+4iiVGHzxziXSByc+eHXMhHcxGpOrCD+Uc4NuNLUr
         qcFDqGSKzxx9Y2HyzPmXtIdcFtK8LCpktRjRNp5Ge7Ry1xnMh3wR4o9vrJX/dgBhkaCp
         Bp37cjcyAugFDgI1jlSG4aH87qz9h0npIpmBlO6PhdqorxQJJcCf9LjQo74/BndKWiKc
         5LGlYQz4hn9oAAyj1qCoIF/DFyzDWPArj5cEVo2OzGC21UQtGe8CF7S2Waj19ITv7ojo
         cFAjPVjqTg+ywKwlZnDuh/penHY+VcQiLNUbcQAFSdeY/QgiEgb2wcZgesSRzD+K0lOn
         7qRg==
X-Forwarded-Encrypted: i=1; AJvYcCUDEK+UEgGFgdH2rpiE8o/gT12nytKke5Z6q3JGlfiu5AIcrBtZiYQfC7onZQfNsnVijtPs4keU6VFnmWvfRtrc@lists.infradead.org
X-Gm-Message-State: AOJu0YyvP8j0hPZVffZaDl3Zgm339XcVPTmuOID3+5lFEUse+XKRn8NK
	Hsx/PkgfyazHBMP0SipEfo1tYFtpcr8zD0jKHqKsw25ZnAwRM2mVlxLN+4ca
X-Gm-Gg: ASbGncvpaY1B1NB5sKGOWY6gbk0J6Swq4BSaLhJjhgLGhF+07u0sB0NvAaQV2dxxUpX
	JKLy3Arhz62ILvCos49chl+MTl0z6k9gNa9TXL6RY0LSesuoLdvnn3RpQaHmq7enL7gLyym9QaJ
	gHuesBO3/kJYtDTPrRl+eUrH9A53MSgE9cpq1oBeNzeqtLDsFnY58jpS1g5cDho4DXrZ93TYrcG
	s7hH4nOL2/5wCLUhz+Bi684atMLUWCvmygeKuWRqSEGYX9NwzmLxwWppCYLFsM5uilJydBNw6tl
	EUJTq0wZ18Ycovk/hGHt5O9rBtvbzVhJ
X-Google-Smtp-Source: AGHT+IFus05RXvi7tpG1rmO8TAbBGFK4w+F/iQXBReCPzTC+BlwBAEPpwrFDAMwsdHGhI8tPt1nNQQ==
X-Received: by 2002:a05:6122:488e:b0:518:6286:87a4 with SMTP id 71dfb90a1353d-51d595af946mr17694809e0c.4.1737541908755;
        Wed, 22 Jan 2025 02:31:48 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51cf5578fadsm2099918e0c.3.2025.01.22.02.31.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 02:31:48 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4aff78a39e1so1670852137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 02:31:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8cYC6xM6MTTD3YkhD+spTEWa+RKQCrGB6AOTz2dJmG73s+S8bAJ6EZK4j1ba+i/vY/a6ZuHQzPOTAn+f+lAPj@lists.infradead.org
X-Received: by 2002:a05:6102:418e:b0:4b2:4877:30bd with SMTP id
 ada2fe7eead31-4b690bfba7cmr16163436137.12.1737541907620; Wed, 22 Jan 2025
 02:31:47 -0800 (PST)
MIME-Version: 1.0
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com> <20250103163805.1775705-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250103163805.1775705-6-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Jan 2025 11:31:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXOGQjnqk-M4FkCjnA0n3C1FR9-yZpRPN_X3yeMr4+fZQ@mail.gmail.com>
X-Gm-Features: AWEUYZkALm3737BqRxgqu-0dwJrFaMLAXr8UCLs5074DCuQFISbzFyekc8oFgvw
Message-ID: <CAMuHMdXOGQjnqk-M4FkCjnA0n3C1FR9-yZpRPN_X3yeMr4+fZQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r9a08g045: Add TSU node
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	p.zabel@pengutronix.de, ulf.hansson@linaro.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_023152_740010_29406993 
X-CRM114-Status: GOOD (  15.55  )
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

Hi Claudiu,

On Fri, Jan 3, 2025 at 5:38=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> w=
rote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add TSU node along with thermal zones and keep it enabled in the SoC DTSI=
.
> The temperature reported by the TSU can only be read through channel 8 of
> the ADC. Therefore, enable the ADC by default.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Queueing in renesas-devel is postponed, pending acceptance of the DT
bindings by the thermal (and iio?) maintainers.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


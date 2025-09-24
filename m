Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691EECAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YeMFh8fKXfFfV77chei+2rVcM7wYWs2LWA9oczHhuiE=; b=aHzBPyaf/BNR1N99QlyYC0swwz
	3Udcfm1CCfTKOJi0gieGhkheFBdW163KLq8/3V5qr45+0uIzj3nQGoUW3NRCKhS2y6EpL4DwmdidQ
	kAfcjOONmI6h2KqnMii0ISG8s7ZPkLTG8ONxlW7hRDrCGDJX45uu/JoBv4rJlPi+i54ep/ubi/hT3
	1jDxB5Bau39eFlUe+WBYUrgLr3/9OkSn053aoVjAtcFpE4R8fKj3OxbukIoT1/QzAN1xTW6iGSyb1
	qVBj+SyNYuCLF3SF8KndsrE3dKo/tAgku6l4vvuYRQrcYQHJyHX8aiKVrJRvbdwm+Bu1rheoKcq7U
	kf+dMgeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1QGT-00000000Xqc-1YGC;
	Wed, 24 Sep 2025 14:14:37 +0000
Received: from mail-qk1-f170.google.com ([209.85.222.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1QGN-00000000Xp3-3tgl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 14:14:33 +0000
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8572d7b2457so84721585a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 07:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758723270; x=1759328070;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YeMFh8fKXfFfV77chei+2rVcM7wYWs2LWA9oczHhuiE=;
        b=Z9O2GEWp/OOREV8qRQ7Q1vB40xbrAqru+kPYLaTUx2YWJ3PgflLsHjoe2w8Ss2C6AJ
         bn0lLfUFv+WE/H71SvORE56hW8g7dkN+4kKXBm9oiJARtj76yiJbRg160Ix1I3PRoIAF
         0zia6XwjY0lCJjDzZj5eLg+Sb99TuIQhonAVBvn7DRsatascEuPcKrZSc84LFtEwLTlW
         DeUNOMGRFBx30iV9yzaLNhjq6fk9mL7e+L/F6dQp719liCTAzqXPXIehxItgc4kQW6Ej
         tEHDLoRPZByktGlbsEzsItFNh3Hbj0M/kcvOjzF1esH5q0GJEktmCz8reSVwGR3TYDGM
         9fFA==
X-Forwarded-Encrypted: i=1; AJvYcCXawxrTjQOXopqG3eZCBmL1EwLGD0Zp40qe8RLnRyrTElxhOHiln4t9TWxE0nPpxY2LOTWbXzqvmdcT+Oaq5pgA@lists.infradead.org
X-Gm-Message-State: AOJu0YzI+AwYmMFlG8ASmBqFNwzRhhYWVQg4Ov1M0wBBPEVdHtqWSUow
	XRB/g9QH1lVjueOUzIxpsq6twLyKKhjE8JANR8Jv3gvFRcYV/LrjL5ormwz+zQHE
X-Gm-Gg: ASbGncsYDywnJ8wZR5Du2XmeTJgw8bJPTTUfN7I3qhtGzxA3TFK68dCweNT1iNeuXqf
	E2NVsJo7tXt+N48h5n+/GusS4GyA3PNAr/j1aOVtT1BGbN/CqLtlBYMjj9ECkfGTRk7pt4peycX
	GCIO3i7d7T6ej9YQYYeUCf4cKyP7wzBO8iTWrruDzeOnyYfA6SAXrlFFe4u2UccE3YyulificiM
	5UYBeSnnaRgrOnqAHD+dQIM8s++7rwm7z1dPSgBBvXbmWR1YrgxjYe9wAkcj9lX9LriMgIuba07
	14cPQOhFMM7DV2R/f5PRxPQ/1Tp1Mati5okVyfYPQbv/PW1LEHG60Zu0lQgPS8ALKfADroLByYj
	RmBuNpEAYel+6BB7K/COpQZVowujcqHz8htMltmR1XSxkzktFEv32abElmN817YdZ
X-Google-Smtp-Source: AGHT+IFqNMZdlb2rQHe8HeIDM4ejr4aWg9gifiv094HO0mYDh4mZwQA47N2nXdK0Ph57NaoiYbkT2A==
X-Received: by 2002:a05:620a:4049:b0:82b:33c1:69e3 with SMTP id af79cd13be357-856e58cc260mr268725385a.10.1758723270213;
        Wed, 24 Sep 2025 07:14:30 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-852847b70f4sm271592785a.15.2025.09.24.07.14.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 07:14:30 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8127215a4c6so136966685a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 07:14:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFlZPgxpIa9nlpH0keJ9RGqoHDYZA5dRpp759FX40bSzoPJ4eTmTF3ULwJhyMnZKwWgQWqQOcAIIW3KOU3ARLL@lists.infradead.org
X-Received: by 2002:a05:622a:24c:b0:4b2:8ac4:f097 with SMTP id
 d75a77b69052e-4d85bec4dd5mr30176331cf.33.1758722832210; Wed, 24 Sep 2025
 07:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250917170202.197929-1-john.madieu.xa@bp.renesas.com> <20250917170202.197929-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250917170202.197929-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 16:07:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUw+cVtMkfnWjuO6BUNPRd=gZHhiD=KqPxugrJVLOe+Wg@mail.gmail.com>
X-Gm-Features: AS18NWDN65f91eaOSdFfPam9YAakFHEyWw7q-5E1Mc_B35_vALhwRHePhcWpJeg
Message-ID: <CAMuHMdUw+cVtMkfnWjuO6BUNPRd=gZHhiD=KqPxugrJVLOe+Wg@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] arm64: dts: renesas: r9a09g047: Add TSU node
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: conor+dt@kernel.org, daniel.lezcano@linaro.org, krzk+dt@kernel.org, 
	lukasz.luba@arm.com, magnus.damm@gmail.com, mturquette@baylibre.com, 
	robh@kernel.org, rui.zhang@intel.com, sboyd@kernel.org, will@kernel.org, 
	biju.das.jz@bp.renesas.com, catalin.marinas@arm.com, 
	devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	p.zabel@pengutronix.de, rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_071431_976543_9FEB3835 
X-CRM114-Status: GOOD (  16.69  )
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

On Wed, 17 Sept 2025 at 19:03, John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
> Add TSU node along with thermal zones and keep it enabled in the SoC DTSI.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE795CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 11:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+DvsJXG0G61gRFxkleWdib9RoQxt94Uw42byP7fd3k=; b=XSkqficX9weqAXR69jfzsSvy/u
	0w8xWAc6x2I2ixcmgXZak8ppFJlXcdWsM8tHMg9WQMTjf0GTCOeO+Q9HTl3NurCqnEELHMO+MRs3O
	WUWETbquwK0k2ZjFNTng4OSUwb0ictQX0xB2n0ELcPIrPiElx4sh9TCrdiOeYSgmxc0xb9hub66ce
	UvTrpz12ACgoVLWNPCpF+X4U8S1r8IsxyoOVp68q3/tvNWqZfVKFIgtcHYM11ywKig/5pIZFxqwB3
	b/A/xgJckQ9DVdeQHhZw2UCHDOkLvInunsEHewhUbt26m2/bdur8CUnyPoy36Iw2yeMp9XLrYpgNf
	21HB6RhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CIT-00000002NqX-1LDT;
	Mon, 29 Sep 2025 11:44:01 +0000
Received: from mail-qk1-f172.google.com ([209.85.222.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CIQ-00000002NpX-1iBi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 11:43:59 +0000
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-85d5cd6fe9fso330036985a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759146236; x=1759751036;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+DvsJXG0G61gRFxkleWdib9RoQxt94Uw42byP7fd3k=;
        b=QsSRfwyQAD0mpfcBsmY3DHSmksdoY8Uw5oy5zfwKT/ryyvBKiscodgu6UYxBl+0hVo
         UhsOneQ/NIAbaSmXXAqe74AeB/IYb/M7g0AdSz/1Bj56Eq30N55G2VukfwM6JA8lSjdR
         uFmf9SQGmRPbgpQbOVgAgSR0X6s2Ve5V32YqYrFle3oyOe7JRzlkJEYtYuVwC+y7M8Gc
         O/HmIK12FxOEI8iIlQtyY2nYekuYOb9dTBbcEGnAVNbVTuVy5W94d7oV12uznX/18/wA
         k6L3b49YSHQki2Xc5gEj1+hKb3ZMvGTa5s4ERtHmmpi/7Cyf9f2j2ICV6f39RwH3Fuj9
         wElg==
X-Forwarded-Encrypted: i=1; AJvYcCVWnpO8X1DX3KNeC0sToUIpJmp4BCc0d3rxAnphazS4F10Vg0cRsELbQr9fyTIdhdVnbbK4q5A6M/wXB5SZPfO/@lists.infradead.org
X-Gm-Message-State: AOJu0YyAjc9WB1Lhdbvh08iO6ozEer+LyMW+1LdfH+1HMKAlvpmofrSk
	MenrnzCAiedktjLt1VPOpVMdftaiHSJZh51OVj3Fce3ZzgJzuoAvCwQHSRyQDQgS
X-Gm-Gg: ASbGncsZBs3J+O6iDdtQCmmAnuqH1zfOC3fMktbjxUflogsXytkIiwAgzzIVjSqvnJK
	chTev8vQFMJ5zaJGVkYCCpRy2mE7Z8HNN2WGb3zY7g1KF09PhVVogtfMt2hRR5OQKchwvXhVYqz
	wUyqU5Q6TUbWsoFax3l/n3JCFBppwNo+BmEB1+cI289CZimpiUXyzDizz69XwMk0i/wFIMRyC3Z
	8Fpt/2s7fnAOOx29bBtsDLWw8KkutUCFxC3/1H/X9yGnArAbtxWtIgbFAbkkJoyoX3oF+ADjAwa
	1F9dinp4A1UeFMa3pG4CHpIFc/IijDzZTU6rHEh0yAcMp7+qK01yb/5dBSgNwRqxxCqlIP3Wt9c
	t3+MZxPrU1VdMZsH/Jp+7/CP9vhyosBHGsjz216jgnlN+RT4Xpu72pBWktDhPZZ4P+WYvBtLVGZ
	s=
X-Google-Smtp-Source: AGHT+IGZJn6Q94SwI/4ko6Dk8DlCSUC/Dv/OZpDVgAb9C0VhMVMqChUX4WOlK0QhpADWluc6m/57zQ==
X-Received: by 2002:a05:620a:294a:b0:864:48eb:34e with SMTP id af79cd13be357-86448eb08f9mr1022436485a.55.1759146235795;
        Mon, 29 Sep 2025 04:43:55 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c2737b1b3sm801731185a.5.2025.09.29.04.43.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 04:43:55 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-856222505eeso498765285a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:43:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjDrcZmq25LwgCrHplxk064I6fmeBg7VFp0a7hBQfijIF6lGvL64XqfhwJZHQv4cFA6u/I50lP7IVPPJmvKqKO@lists.infradead.org
X-Received: by 2002:a05:6102:32cf:b0:519:f3b6:a1ae with SMTP id
 ada2fe7eead31-5acd10ea445mr6745656137.22.1759145900183; Mon, 29 Sep 2025
 04:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com> <20250810122125.792966-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250810122125.792966-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 13:38:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhgGGYAYnR1cgWVtFCdHEQZWmfx_KY3Z3keDHxTp_drA@mail.gmail.com>
X-Gm-Features: AS18NWDeDP8x0wSmUHzwgi3zdRuByvOv6E-OXpBdrFgnvBXmf6gvI4PDDQHxKx0
Message-ID: <CAMuHMdXhgGGYAYnR1cgWVtFCdHEQZWmfx_KY3Z3keDHxTp_drA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: defconfig: Enable RZ/G3S thermal
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	niklas.soderlund@ragnatech.se, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_044358_449548_D8580E49 
X-CRM114-Status: GOOD (  17.02  )
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

On Sun, 10 Aug 2025 at 15:03, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Enable the CONFIG_RZG3S_THERMAL flag for the RZ/G3S SoC.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


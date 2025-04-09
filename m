Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38885C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 12:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLofmsDNJz6a8tN2PE/KFwLpm79s5qyqgCo17acWdOg=; b=dusDsiIzHgRzlCfCOGfqqDGgD/
	8AiNlt+Fz7pbBtF0FvDI1IJbJcLajXppBrp6lwen58nYvNQ0nej+hovff2SY9Syd4zAJ5FmhNpn7a
	n8OjbmCYN7VSTgIuQNdmcR67XRFFzn5gNJ11SMLkE0zfy3VQLH1eiMh1kqZjdHXp6pSiOnCFhgm9U
	yCjzaZMv+2eYjVUT+EFAEWg9nhlo1afxkTHC1oPRCwi2Go3cfzdzBZVsHXssutW7xNVcsYFuNrpi7
	q7LWS3yzozoZ/KchlcvaH3Qw7aHFMVpB29GooVS8MkO/nl5MveAr/SFs1KKJXzIadSMCzK5qypzMn
	pg51HraQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UfB-00000007AW7-41qm;
	Wed, 09 Apr 2025 12:36:17 +0000
Received: from mail-vk1-f175.google.com ([209.85.221.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UVJ-000000078Me-009V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 12:26:06 +0000
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-524125f6cadso6343791e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 05:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744201561; x=1744806361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLofmsDNJz6a8tN2PE/KFwLpm79s5qyqgCo17acWdOg=;
        b=IK4DL+JWRLSANSEMenyq0tiQ/UkNTnFqL6VYbRq4K+2tpYwf1PTVlUYiMuOAZVFLUH
         1r5MGVKIrVCnHOZQVVVpxs45PLA2CSsqNhXVpo/ACJNWg4GHVXpDA9r5uXdqXtTyD8qQ
         dFeu6I+/96RBkpuqgtrfbdzyXPdrJEqb+YIm5AX/8hcWhNcqIckrL4uPxIsvrIa+cRDR
         9lJtXBubBh5O5Y+sjlLv30V3Lo+ItSKrSnLYnDbnhBVjTqrRSRqBWkzovDpn6vbCybKE
         QzRvLpmqDI1HoBYKcrzC82ozxE55arJHK+0k3wS9K6PDjL0Ehvs8ERfdPKjuRjrljGpW
         LObA==
X-Forwarded-Encrypted: i=1; AJvYcCWaXjehIsxXJeeT3h7B1wlYKdPbVfMqZEWSzpqwe+ymK3JTwJNXhdCUZvYpo7orM/+d+sxlM1znwamU11d2cDrS@lists.infradead.org
X-Gm-Message-State: AOJu0YyagXdSOdeKERgXC0eIAUc6A9qzh4EPRVrnENIUKHNg7JV+rq7i
	OwE1SKQU2Btm1YAQyWJIwhPWId8iDv3iGOifN8QgP0/7BJssQHk9obVRn3wpCGk=
X-Gm-Gg: ASbGncvChBPusD3YWcChuzB9rEuuH7eyd2nlSEZ6bzZZGNfMgh97QHDzdqtkxmgkjD6
	dRaYMnOoUE13VwEckpIykb3KKJqbh707fIX2iz8WzufPHL4YSFnkDGW/FRxicHenWgtHoNWXfW8
	kliNGsV9S0ohmzgwF501SuA4F/reZ94HcfAZGER6Gttna4XYF32EP5VkKBu55a5Lz1AzIr7yJ2A
	7lyHt5SwA4+GHti/rJFMNiw2z1aD5/RH9WeDETwSd5f1OLaIu+oV2B9JE3ZAayoWw8WA4wmLVhk
	dlQyMJFmqQRg1EleAf78edEgMgg++zp81qGgvjBU1fZSfhOI2ButYpaMM1nGwl/T8rvHgo5Ns1l
	2A4J7F+Ulq1VFog==
X-Google-Smtp-Source: AGHT+IEy+KoLTfkx6lVeJpjJhppoapNbJrdV/eagBy9PFOjdndyAvZgjrhf1uMzKE7+oZavVGF/B/A==
X-Received: by 2002:a05:6122:88d:b0:520:6773:e5ba with SMTP id 71dfb90a1353d-527a9162578mr1665141e0c.2.1744201561316;
        Wed, 09 Apr 2025 05:26:01 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abbe5486sm193545e0c.0.2025.04.09.05.26.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 05:26:00 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86d5e42c924so5678890241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 05:26:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4zgGMEcyFQeRIIYftaIhFlX+AeXioZ3FkTpDlZfZWMfQrE9DcCmNtqwT6oOpICe5iIhBqNhZI5KYOtLPr8U2N@lists.infradead.org
X-Received: by 2002:a05:6102:80a6:b0:4bb:c24b:b61a with SMTP id
 ada2fe7eead31-4c9c445a383mr2092287137.19.1744201560103; Wed, 09 Apr 2025
 05:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250401090133.68146-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250401090133.68146-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Apr 2025 14:25:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVzpEJn=24HBC2+cATwKKLtDFd33JXHMugUXNAsQX_Y4g@mail.gmail.com>
X-Gm-Features: ATxdqUFJNg6w-BI8dIVJ1F4IvtULXKwQUo9xfmn0tN2_Y0EF5dzaxljN2HWD5Fc
Message-ID: <CAMuHMdVzpEJn=24HBC2+cATwKKLtDFd33JXHMugUXNAsQX_Y4g@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm: multi_v7_defconfig: Drop individual Renesas SoC entries
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_052605_033907_0695496A 
X-CRM114-Status: GOOD (  18.65  )
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

On Tue, 1 Apr 2025 at 11:02, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> ARCH_RENESAS is already enabled in multi_v7_defconfig, which ensures that
> all ARM32 Renesas SoCs are enabled by default. As a result, explicitly
> listing individual Renesas SoC entries is redundant. Remove these entries
> to simplify the configuration.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


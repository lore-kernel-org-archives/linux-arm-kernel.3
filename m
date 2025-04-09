Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBD1C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 12:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bwpqyi0C/Omv8Oxh3ieog7x4LQHMwE5JHHlM6bbhPs=; b=si12mysYAUiwTKopGbJE3xguVQ
	dIEQn4oFdhy2U8+R3wuydh51XH8hRelvapOKTyj6I+xgYKvW4w0HFfLP+SEAdn5zjyfMdjphqWT1j
	KzEiNvqJzyvFjjSIgchDF8QbCv0tYTGCCWEg4TfbADy/1VMR9qoJjhHIlmOGJfe0UWaLchvR0q5AV
	MOeIuz+f4+RxLovHarhykt54fShf4jv1HkniKb5+8v0Tu2q2qIq5zRyZwYapFSD7VbBpZA+dF3k1R
	KWm1qp61nZCaYFq17XzAd1Z2RHukgxR6z6ShRyS9Fyql4D51y2BNfZq18GglCD+pC8dX3qFZo0R1Z
	YEx07Pqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Ubh-000000079xS-20zu;
	Wed, 09 Apr 2025 12:32:41 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UUb-000000078DZ-1LH1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 12:25:22 +0000
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-523ffbe0dbcso6984781e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 05:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744201519; x=1744806319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bwpqyi0C/Omv8Oxh3ieog7x4LQHMwE5JHHlM6bbhPs=;
        b=X0rrKsjx+wxqCP15Kj17tSq6vwk8kCW1AguwQcj7YXjDi4wZwcJeP47Li9XBb7ya5w
         jxe6TR5z1BSML6pZQZbQYVM9fD/SVynq5F1C5g400GuNybNfzHNHip75cyd20mfBBeU0
         Si8xd3F05YiQxHp89jcZ8gqUUUZ5/TQeDrG9dPBNbXCYc0NRQbC8ex3Oz1ZPnREUZeKg
         fhZH3sCP+qgRzrGRCHRsUc9IaeE61EqbNCmgqysZ/voh9ZzORFZgt0+n+ZFglREobuqM
         OmYtVP0XGuHEJEpHpkNZVi8baGV8b6NP3sN9OCNrv4s7Kc+HDhjm+hhY3oWvj+5pA6WF
         CSkw==
X-Forwarded-Encrypted: i=1; AJvYcCVmmYUcjImT3ThVZrvRouEg64p2pI7MTDU3XUfDrPRc0ECG6jDmfQaDfplFvGriOWDraApmVyPhwQ2Bb2Q4jSxD@lists.infradead.org
X-Gm-Message-State: AOJu0YzcIwL/tlWbRxE3zFy1QC3T9pa4mvC850IZTOB75ZhQdtNpBkqI
	CA6s/p0quv+i5hZfNjpdy1g+T7DSy4WA/S/zrxaRH3D/OLlxskZjtkxDSpsni2E=
X-Gm-Gg: ASbGnctJCnSnUMmKBrP286XgV9zONP07ikRkSAcp+l7iZXYchOL6Tqm/dIHBGROn6lO
	5/E9juedTl8lRJsG0m6k3Ms14LyW8dGZ8JFn0iJnRVdZ06+jdrB4SBK40BxCQolYxZadB77bGSO
	OAxsMsvincWV1AeXFP1iuJuGH062FVvBiD6fCdTsdMZM76GEZ7dxG9DQIF055ZwczdfPtna9LFz
	ZR93ZJyjxS6RinqTIQxzpB3DzKPn/GDCf5vPa090Tu0G1gjyxoDXObA1fLTLsbPVB2F0EWLkxfa
	b8+JRMLyOEM25nV7z8ZDzEW8rUf/pJ5WMAmnKI8hqCcYVMFrvQvsUzExz/Jocg8wcQ7BGpdVV5t
	CVG3oZN4=
X-Google-Smtp-Source: AGHT+IHLBGkbrFjDKjGBfMvda7IFCwT8M186GohSqb2WbeCyOohnF0RfC6TC0W+WaBPHuYNEIFZFvw==
X-Received: by 2002:a05:6122:2012:b0:51f:3eee:89e7 with SMTP id 71dfb90a1353d-527a92773bfmr1443680e0c.11.1744201519585;
        Wed, 09 Apr 2025 05:25:19 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abeb00dasm183265e0c.41.2025.04.09.05.25.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 05:25:19 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-523ffbe0dbcso6984750e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 05:25:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9HSXfmwpeJM/7zGEjCtwsO/NbYfS35wOpiokp5PyJt/DYIpSoAivgMFhkLxbyx8irReAAAjpTnP9hUuE7wDZQ@lists.infradead.org
X-Received: by 2002:a05:6122:3291:b0:523:dd87:fe95 with SMTP id
 71dfb90a1353d-527a92355f4mr1715214e0c.9.1744201519093; Wed, 09 Apr 2025
 05:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250401090133.68146-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250401090133.68146-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Apr 2025 14:25:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWY+rYzPO5TmowdDvoyURVZBiXgWu7MEZE4eh7ze_tJrg@mail.gmail.com>
X-Gm-Features: ATxdqUFzwtuDtvELHopcKxYge5NHyDOHhLRTNuKkyueoCSJD1WhC4pXt_PeD_Zk
Message-ID: <CAMuHMdWY+rYzPO5TmowdDvoyURVZBiXgWu7MEZE4eh7ze_tJrg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm: shmobile_defconfig: Drop individual Renesas SoC entries
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
X-CRM114-CacheID: sfid-20250409_052521_357015_7966B118 
X-CRM114-Status: GOOD (  18.47  )
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
> ARCH_RENESAS is already enabled in shmobile_defconfig, which ensures that
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


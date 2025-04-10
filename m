Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D3FC369A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=du50G3lIjNxLx6W3pkF9CbKUDTzcKCdeCv4Naa5/YUs=; b=w3s+NT9139TchBu9kga+Lt/0HC
	wP8XfeoTKdnu4LtK3YYJ2guJBBqcTiXRFIm9dfucz9kjneWStTqePjEySwJDBL+67mA5ZqTW3WHIP
	Osk1TnzyEEAn5WNxva4MlHZAc1hNeW5Hgyf0/Vp4nH4LXFOukk9offHNGT6myectoKYNpiF1jqQ0P
	s0/UQOQqSOTJkZur19TiDSrku1EEpMdJ/2qi92LjncLy2jrHlEIVEf9UukFqfZM9gZcH4c8lq7e1J
	07g8F0Gg1vAdIQ6Q/C30zNcAHop2M3z1d9qbvU73AT+5IqRIuLbrNXqaw202FYv2f90PgjYRABVko
	/3us6awA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pw6-0000000AGEG-09Db;
	Thu, 10 Apr 2025 11:19:10 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2p4e-0000000A4yQ-0Au3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 10:23:57 +0000
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-523fa0df55dso1674110e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 03:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744280633; x=1744885433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=du50G3lIjNxLx6W3pkF9CbKUDTzcKCdeCv4Naa5/YUs=;
        b=MShRKeRcBpJfv1USRPmaLzSEnNyMRN+esJLmk3akhCd+mLPqa14vQtNL77CFdlgh9s
         eYlq9YA9/+O1hdQuqo8giTAgipuqUTBYAX8jKEJvq2wt3kkyRVx+JJzfgP7soR5L+wn8
         yWlPetmn/uqwFVP9t8qzV0gOPV7CWXVugmJlYZ4GB8cnjbQFh5+yEItNNvncYVgvnkZk
         ik6zmCQ4nNPQ8wprlKJYC64009H1WzJXaMdUd2kSXTG+TYq2WzQ3N5tNyjoY977EKta7
         VvOXl0jJ/qWkPXIh61FRq1tsTcL3vdzjK5RW4TP/heJYQMe5MJFDQD1hYD8v+xKS8y8C
         QViw==
X-Forwarded-Encrypted: i=1; AJvYcCWAlmWRrZoozBbcV2tHS3VCaTQcpXwJiGQS658yl+cPTjUc9Gym4wR7Z6qEaSPzwkbQkiWuZVNdUUAVZWLZTG2I@lists.infradead.org
X-Gm-Message-State: AOJu0YxF4X0x047J2AFSPTakq1BJ8NHm2oc7hDUfJFTpe16aG67hqtOq
	if9FfQLUh9MfcJxgGmctSvDopyQ1usG16o1FHV0ImWKIBXxcQi2mkBfPLxPcmuM=
X-Gm-Gg: ASbGncseIw5N3kIsAq5zzZv0CpEHM38SrS1c1lKKBNyo4oChW9k0LkL32lOaOdzWc0k
	t7RYpOCbByxrG5TvMfhYBB9OMuVL9PXscWpJ0k3XFX4oRzl5tRI9/6pa34xTUgRpha4tHQcjMM3
	zu2YfedsYQAwb/0Bbuj6WZym7HLmJyzkozCB5871RhLwq92PFNdKfdZIQYP5hhm+KpBAVUVqtpa
	/LEj6xPFKIb58EI0ZgiK02krRwhkYbQKIZpJsQJKq7QHh1+13eSB8GNsyy//fqXyGnzHSK8ZaRd
	s8SbcbZwtQGvd+xiEat2uu+gmfeONgLMqA2eB8cxYWtD7BB0TK9NJ/3fia+9lvk5EMnSxgU3z8o
	qEnYillPRF8mdimp0qQ==
X-Google-Smtp-Source: AGHT+IGm3KZUZscUwQ8xQPNT7rSOAiorGG/p+WXspja7wAxXnUcQQXoWFg9sxUQ8VhyYrLEv77ccnQ==
X-Received: by 2002:a05:6122:490c:b0:523:dbd5:4e7f with SMTP id 71dfb90a1353d-527b5e9ff0cmr1219903e0c.3.1744280633052;
        Thu, 10 Apr 2025 03:23:53 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd74722sm588273e0c.13.2025.04.10.03.23.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 03:23:52 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-524038ba657so782954e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 03:23:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEn5lED+sLcWizSsizcVlvffLnVAX4GDDAU9YdfqRwPLOugSlCIrVOmb+L3k65jsoUJvZW+6n4+oPKlpQDuKeB@lists.infradead.org
X-Received: by 2002:a05:6122:2202:b0:524:2fe0:3898 with SMTP id
 71dfb90a1353d-527b5ecab7cmr1028303e0c.5.1744280631864; Thu, 10 Apr 2025
 03:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250326143945.82142-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250326143945.82142-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 12:23:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWG5gPs0u-E+Q0ipigU-qXwNLt3jGE3bLP0AiYU4Po-Yg@mail.gmail.com>
X-Gm-Features: ATxdqUHYP0k90KOlJEk8_KKWCI_v7YKprTDnlrpYy60dvQGy6IKe5uQi4lW1XhI
Message-ID: <CAMuHMdWG5gPs0u-E+Q0ipigU-qXwNLt3jGE3bLP0AiYU4Po-Yg@mail.gmail.com>
Subject: Re: [PATCH 07/15] dt-bindings: mmc: renesas,sdhi: Document RZ/V2N support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_032356_079177_53DECC04 
X-CRM114-Status: GOOD (  18.84  )
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

On Wed, 26 Mar 2025 at 15:40, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add SDHI bindings for the Renesas RZ/V2N (a.k.a R9A09G056) SoC. Use
> `renesas,sdhi-r9a09g057` as a fallback since the SD/MMC block on
> RZ/V2N is identical to the one on RZ/V2H(P), allowing reuse of the
> existing driver without modifications.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

JFTR
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


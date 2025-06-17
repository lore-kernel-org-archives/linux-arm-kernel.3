Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10818C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NPFOGmKwe57k8665KU6g7tXyTNhIGu+1JDxa3K0Buc=; b=hvZ5eJSN8e01yY8Nwy+MFIdwcc
	KIPs5oonLARWIjzTJF/XesqfCNEcKQ16OJajt/8oiI0Z2sH29IK7wJNOQ6fLH8SOoasKbeMczc3kx
	fy4AwFoLRI6IGxoWKQnhudcXfkKRyUBF7sJil9HW7gQqosXiEa65GDS5F0tagFgkoS5hLj3d8hl4D
	JCddR1Qxwyh6MJh9c39TspQObNInO7DxsOxZ1NvlwIW4UXFuwq3kDo+IOJwEK+jtv2B95t6JtqVL5
	BRCAJup87ud0yVfmVaPQ3AVdhlUiA561LxXKgvuhGz2jDtaZaQBiMpfDAbo+axrQXgnyzsCYfRMRz
	MMWlsPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXOq-00000007Zuy-3RVB;
	Tue, 17 Jun 2025 14:34:56 +0000
Received: from mail-vk1-f173.google.com ([209.85.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWm9-00000007RHd-0img
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:54:58 +0000
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-52413efd0d3so1790568e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 06:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750168494; x=1750773294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NPFOGmKwe57k8665KU6g7tXyTNhIGu+1JDxa3K0Buc=;
        b=bcKH74PmNbxxpGTVws49QNx+izCGBywvViusHwNDP6ZYtQFbPbv9XVqvHlxQK+gnjB
         7U22VIZOR9K9UnCBncOoxX4gqpfUaOXOHzrzRidcNGtDGdNDytNsxXEyk4eKN5+E6lN4
         HTYtk3o/vNkMxAkzCse/qFF22H58Du0MVC5xcx9DpCreQNs/eUr3SQIoGqF7Aq/jd4hj
         B+yufRaVt1MYKHcwuNVPAZmcU2KlOKtwcIhgBVDRao7DpcM4KN11CV6fwBPg7OU9t05v
         FIHW2YvLLDfiXjDX5jWZMiVuGgVWkvLxiocqQIx1jfFIf6Ql9X+DeAwit1c4/BZDTmp1
         qXgw==
X-Forwarded-Encrypted: i=1; AJvYcCV89tjji9Kgn7USkh1tE1hsLF1cQ3iISVDoPfAtYIbGsht/Q6CAZb2iv/CepvBNQ84xK/BK8K205vZEEj77D0Pq@lists.infradead.org
X-Gm-Message-State: AOJu0YyYKhWa2S6QHMca3Rp95m36u1Lp2085Cuq/PoIvgmT6ZKIrnQGB
	Btjc8t3lDRjIj7idKYXee5ULC19R1Lekv6Y5QFUDSAsK1fKznk97u3W4MVuCe6Kx
X-Gm-Gg: ASbGncsbW9vhvoiZopqxdsk9BDma5C4xUKwPNhvPjL+vRf4YaTmIb1o2Pg5W2NgfySh
	op746LqLqzPXY78FQsmpHrfsCNgp8/KV8QFTeldJQ4WdN5k+hYa6M2a+JhSy6ca4luoRfmheGBc
	fWna6mjpUNvXN97mk7yXs1pOYEk/tFFuX20ojLojW3daqaQy1644CshGSQgRZtlSv0cJa6WVTLm
	Q7exnjsTenHEwHuM6dRazwT3VVxzjR2XvEGbagpujKxZylHhto2tHrVE0EM2X0SEJy1JfFCxHa8
	4luwMaIygNaSYuB7EVP58CxaRF8wSHwVyXVThmzjgB3qEV9J6aNA9MSL8frcwXzlmwGS05TqJMf
	CdkaXGzOWVUS0JVdH9C1jCOcb
X-Google-Smtp-Source: AGHT+IExkrUBSm+sSUtCSNdXC8Mb0RA10urCulg3v5hX3meZZmPWBF5aIj6SPcXrx3QxgdEk0WNW0w==
X-Received: by 2002:a05:6122:3d0d:b0:520:6773:e5ea with SMTP id 71dfb90a1353d-53149c507aamr8750962e0c.7.1750168494109;
        Tue, 17 Jun 2025 06:54:54 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-531401e5bfasm1575881e0c.33.2025.06.17.06.54.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 06:54:53 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e7ef5d6bffso1300697137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 06:54:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWjhrVf4Se/s6LWJZvVasv9HlunIH4xTwcfSU2NkwM1bYUStQH+VrGVYLOcJWqd/Kw/k6RLhfmEgtlWqrVNU4aa@lists.infradead.org
X-Received: by 2002:a05:6102:6f0b:b0:4e9:8488:ceb0 with SMTP id
 ada2fe7eead31-4e98488d207mr923020137.15.1750168493078; Tue, 17 Jun 2025
 06:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250617134504.126313-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250617134504.126313-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 15:54:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWuh=O5HJ1euwed6NBHWOyi_sMuKXVttVX+QzbgbHNfWg@mail.gmail.com>
X-Gm-Features: Ac12FXyhfEkegCCAJkC3v3V_yqUqFj0Dol0lfCSMeSBROmWrtxx-3LxVrYZ7Ujw
Message-ID: <CAMuHMdWuh=O5HJ1euwed6NBHWOyi_sMuKXVttVX+QzbgbHNfWg@mail.gmail.com>
Subject: Re: [PATCH v12 4/7] serial: sh-sci: Replace direct stop_rx/stop_tx
 calls with port ops in sci_shutdown()
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_065457_207154_4D07A313 
X-CRM114-Status: GOOD (  17.28  )
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

On Tue, 17 Jun 2025 at 15:45, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Replace direct calls to sci_stop_rx() and sci_stop_tx() with port ops
> callbacks in sci_shutdown(). This enables the RSCI driver, which reuses
> the SCI core but implements its own stop_rx and stop_tx logic, to reuse
> sci_shutdown() without duplicating code.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


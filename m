Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC5CCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6X2VdOjut9PuIWiMUTBESV6nSJnAJvEj2IyZk3vIzkk=; b=ipHbN0tA5Hgi/KNSuLkPY3pxVI
	UxIf2EUVyyhLzeTmjl0dZ1qeyPPU35UZrhZN151ZTHoISYmnfm7SPUFmYhtniBnDpbABOJ4Vg53KI
	Rribn+SNnoz/Ml+wIWZaGWMtywjscnMUm0kXGYxeY+YxcIEjGJsvmG7LxbykFGI6Ep7HlhouLwoU1
	O1jreDGKTpuDVjQQpmv4QUx5dbeSfxMipg0kB3DvQ6+oY5OzJ/WA2sm62vAl0tcN24O27PkBwFQ9v
	imq8UbHckPRghZ9oYMPR1X8Yj7E2aBxgQeQc9niKxpVxQE4pF/cTB7RFLTqUTVvXa3UNBJE4/2hOB
	TUzN/tiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7X1-00000001fG5-18q8;
	Wed, 29 Oct 2025 14:52:11 +0000
Received: from mail-vs1-f53.google.com ([209.85.217.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7Wy-00000001fFB-1WZx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 14:52:09 +0000
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5d967b67003so8241765137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749526; x=1762354326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6X2VdOjut9PuIWiMUTBESV6nSJnAJvEj2IyZk3vIzkk=;
        b=iI+ZyBDM9Bl7yOlMAaDGvysha2xEzH3k13pLlHxHbR+Us9JXtEcqYhYpFoiRHicYCk
         AMNLU0e/spTtN211k7JVe6bDI8EESW1EGUUnGUPE7w0mtTK5O0TqPcrPxIkk+uKx20C9
         I73suN7blthHRaylRCKgCnO35jNwHEHig6GFPsdWbR/WdgCHEGXQsRscjydh7fwBLp+p
         Fn1I0rmLjg+/LP9rAr8wo2HEWtMXeOft+pgifLkbTBhrSdBxWxBHvx3NMDAGe37VC4cE
         Ll8YoueXRM8nJw589I4wQkvZ6/WtUDrVf4hXHRgHZzkf1oXGNJ0Q/A+mOMpXoVN4JXfq
         FAFg==
X-Gm-Message-State: AOJu0YwFjWkgyXtSzgmFujfdQnyzu9P7LSfHWV3+4+CFijh/cy0ipLNG
	mbRA+dmQELfjeQDhHUDZOlOGhTFHKuQz2JoJVYIkX32mnbaDpOHcrW94ob/Dn9rD
X-Gm-Gg: ASbGncutroebH7iY0jWjSMfNqoCFRNLFpPgSTJgFuBYe37R60tSkxxG89wDBQIgq/ZK
	UQhtuddVBjXn1nRrmCHu86pLtB/AKlC+iEoq11o2kpEMHOKKGxL+OGTsQjnn9+aZdLsGJq0I0uo
	2rfskPSQXRgQQaz/2FjlVWib/sAKSdTGuis5R+2dm4lqRXeAAZhRroTHzAJ6XMuF3iBdAXtIEbF
	BieOT6wZzC58qyHVw1S1ij/+Nsmwk+ZoblKLNKUPKKIFHDguvOe37rOf2lm82AzJ2pH32WJgvUb
	JHJm4f5bItlqtMZmt+yxHlsePv/g2M/hIBjtwgE64XADRj2L6H8U0YdQmMa4s0R1UiPasPtnynP
	dROFfxlaiO5w+/9TQ6OWV0QpDjIupy+6sMRCQ6vYh/PTXBgqJtrHx5EP2Ls9meY9Bnf9mkr0Q2f
	cPsEY3VhCXaN//oiO75maFNWFraf5c5XBm2waWoQVadpU5mtCqPc61
X-Google-Smtp-Source: AGHT+IHMqZK9aZOznLoJj/Oo05yM0i8/8mqMEixf+g0q0TGDPVU1hDjRUT6F80yZ6SlcmwOJfJPMJQ==
X-Received: by 2002:a05:6102:2acb:b0:5db:37d4:1cb7 with SMTP id ada2fe7eead31-5db9066cf94mr1123086137.32.1761749526441;
        Wed, 29 Oct 2025 07:52:06 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddb33507sm5275747e0c.14.2025.10.29.07.52.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:52:05 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-934e487a957so1967274241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:52:05 -0700 (PDT)
X-Received: by 2002:a05:6102:2927:b0:59d:ad3:e1e4 with SMTP id
 ada2fe7eead31-5db90575883mr955429137.5.1761749525479; Wed, 29 Oct 2025
 07:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:51:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwXjE0Bq1KjENkN4m2h0_nN0F2S=CC8mW3B92NdpN2_g@mail.gmail.com>
X-Gm-Features: AWmQ_bmfWRMn93VJbp2i3KyknET1ZJrYFFCyir3HovrKjiX49vnsC4NYomuCi4I
Message-ID: <CAMuHMdVwXjE0Bq1KjENkN4m2h0_nN0F2S=CC8mW3B92NdpN2_g@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: renesas: r8a77960-ulcb: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_075208_425871_0572D2B1 
X-CRM114-Status: GOOD (  17.21  )
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

On Mon, 27 Oct 2025 at 22:13, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Enable GPU on M3ULCB with R-Car M3-W.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


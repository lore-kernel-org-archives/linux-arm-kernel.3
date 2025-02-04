Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A934C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 07:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0AMgkZ59v94RZ6z6SKh2pbiqGshBRpTXZyxuIUBs2k=; b=csb3Nod9ccE3/wPERbkwVIp7ZJ
	2sDVgILAE8c/eDxSZ0ae1J3ntYRu8Sm+q6Kw3R7CLRGgBqOF/qR48XmsvnWk2opNth7gj77Vq745H
	aEB5QGBtI3i0OiMPBt6ICN6ELkWlWfLb4c2HGkkBx5qyqEnZUb+uC/ABPp3kQ83RaRs/kbyE6Noxy
	wIQKzL61UDIbAkLVVMxtkJICgUbyOUqInezWVG5VEDPlESF0Ps00LLzBL+H3PhiKYe1EOwH0uoCMK
	66R43U+j5b/bKh08Y4DlXa6ZLU20sAEik2eOuSDAn+rUsUalv/n0cZ9iyifpqctUewO9ubH1AwTjv
	A/pWFaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDbb-0000000HRjq-02fD;
	Tue, 04 Feb 2025 07:44:23 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDaF-0000000HRgn-3eLy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 07:43:01 +0000
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afdd15db60so1411123137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 23:42:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654976; x=1739259776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0AMgkZ59v94RZ6z6SKh2pbiqGshBRpTXZyxuIUBs2k=;
        b=Cl4aBg+J+cWd4VkSGzjZ+hBDF+TS5YXnMTu6a9qTJ7m37krCerweDU9WS6oIGGf5vb
         ic5IOmv4l9ipoCaqavfdGne9cgfHw2AONjjOWk4ps0dKcJJjkLmasDMSpldcpRKH0mPP
         zQcTNMaX9Qepm6+XIALgK+euhckkjmWxeUhi5y4gAPbuv58jAj3xjb9mKIeG3HAnqaaE
         Odnz39MVTEllGGWD4WpyAKOqMO0PHoIatwG0GTdoGnEtt5Wvrkbzjb5RrMjs5BetagpY
         of0b0GNPXHhvTkfRqCc/wkEU0QAs09RHuoaLenfkd2h8H/PTL59kEXLmYqVZwQ85r1cC
         nAYw==
X-Forwarded-Encrypted: i=1; AJvYcCVu/5DEzxEYSL4bl0vFcCHx/P/ayLAcRI2hUiX8Z5zck7iBiOR/+bJl8/A94n+y3fZe3SWsPtKH49euyhRbHwg3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6A1XQgJaHqfHLgBCDy+2jYgWw6HZdbwV4XB1OxBaS7JD+L2M2
	XCpoSDD3QUhzLbUSKIduRUqxPd0C08fIZ8eVhjll1kYavIqG5o5L7uo3wg5S
X-Gm-Gg: ASbGncvCxviwWkGLjoySUx6VN5p49bhgJ9wdh60nkqzYaCNT+csLAx6Lexx2Enb6J7I
	kwQxZhJrgWruZNmsEXmnDKZxc4Q/pQY2bPsIkW6BoGFZMDQUAZPxloInsaC1Sj1lcXxjNBBhIRo
	Y8M6eMD4bgwxJpqix/x6Z2sZELOEYSfTqxROcUjcWK7YGZJVwJ36PXFOwk3zqsuHQPtDuOcu8ix
	fxY7E7i2O63/Rx+egY7CuJ+8bqyXvKwei4uUuzREYXJ+obhnjZr0rY5TA1lXapgpH6uGdulTBjL
	tL07CwFzzOBcAd0w7D31khl2RlsED5qeKgqhWrrZVdOX4qImIB2HoQ==
X-Google-Smtp-Source: AGHT+IFpRr90Nvkug2m0rGCNQ29UW5RkbOshSfYsn11Tjkif+Hu/4Wbd6raGifZQKdDLJRy4lZiwHQ==
X-Received: by 2002:a05:6102:941:b0:4b2:9f20:51d3 with SMTP id ada2fe7eead31-4b9a4d11907mr19320929137.0.1738654976292;
        Mon, 03 Feb 2025 23:42:56 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941da05dsm1872614241.21.2025.02.03.23.42.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:42:55 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-85b92397fe2so1192811241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 23:42:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXSlLJhvy0rU1T6PeyL/Pd8oS1jfBHsQK0s6hdFTnPDl6zHKhP17CNmpLl6LpmBL9sUeflMXbhzQelhAGMcz/zA@lists.infradead.org
X-Received: by 2002:a05:6102:504e:b0:4b2:cc94:1881 with SMTP id
 ada2fe7eead31-4b9a525bca9mr15855668137.21.1738654975532; Mon, 03 Feb 2025
 23:42:55 -0800 (PST)
MIME-Version: 1.0
References: <20250203150801.2399555-1-vaishnav.a@ti.com>
In-Reply-To: <20250203150801.2399555-1-vaishnav.a@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Feb 2025 08:42:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUOMCxfsOrUF3-6PX0ZZ_E2g1SK4bwDqZE=mWiibPFt1A@mail.gmail.com>
X-Gm-Features: AWEUYZkDgnPf76m_8qyV4BFvYG1jJH4IXxwnablOQ3R27shfCtbF4RxvzCNS7dc
Message-ID: <CAMuHMdUOMCxfsOrUF3-6PX0ZZ_E2g1SK4bwDqZE=mWiibPFt1A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: defconfig: Enable TISCI Interrupt Router and Aggregator
To: Vaishnav Achath <vaishnav.a@ti.com>
Cc: catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com, 
	geert+renesas@glider.be, krzysztof.kozlowski@linaro.org, 
	dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com, 
	ebiggers@google.com, ardb@kernel.org, nm@ti.com, vigneshr@ti.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nfrayer@baylibre.com, glaroque@baylibre.com, tglx@linutronix.de, 
	u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_234259_907742_0A5E3611 
X-CRM114-Status: GOOD (  27.49  )
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

Hi Vaishnav,

Thanks for your patch!

On Mon, 3 Feb 2025 at 16:08, Vaishnav Achath <vaishnav.a@ti.com> wrote:
> Enable TISCI Interrupt Router and Interrupt Aggregator drivers.
> These IPs are found in all TI K3 SoCs like J721E, AM62X and is required
> for core functionality like DMA, GPIO Interrupts which is necessary
> during boot, thus make them built-in.
>
> bloat-o-meter summary on vmlinux:
>         add/remove: 460/1 grow/shrink: 4/0 up/down: 162483/-8 (162475)
>         ...
>         Total: Before=31615984, After=31778459, chg +0.51%

My first thought was: that's a hefty size increase for two rather
small drivers!  So I enabled these two options in one of my own kernel
configs, and saw a size increase of only 7872 bytes...

> Fixes: 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
> Fixes: b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")
>
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> ---
>
> V1 : https://lore.kernel.org/all/20250119182121.3956546-1-vaishnav.a@ti.com/
>
> V1->V2:
>         * Add Fixes tag.
>         * Add bloat-o-meter summary to commit message.
>
> Previously both of these configs were selected for ARCH_K3 in respective
> Kconfigs, but commit b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")
> and commit 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
> in dropped this recently without adding those back in arm64
> defconfig, this causes boot failure in all TI K3 platforms.
>
> Passing bootlog with configs enabled:
> https://gist.github.com/vaishnavachath/03d8d3ce0f22219643c2f4d1dd243fd1
>
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index cb7da4415599..1f25423de383 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1551,6 +1551,8 @@ CONFIG_PWM_VISCONTI=m
>  CONFIG_SL28CPLD_INTC=y
>  CONFIG_QCOM_PDC=y
>  CONFIG_QCOM_MPM=y
> +CONFIG_TI_SCI_INTR_IRQCHIP=y
> +CONFIG_TI_SCI_INTA_IRQCHIP=y
>  CONFIG_RESET_GPIO=m
>  CONFIG_RESET_IMX7=y
>  CONFIG_RESET_QCOM_AOSS=y

However, on arm64 defconfig, this has indeed a much bigger impact,
as it also (re)enables several other drivers that depend on the
irqchip symbols.

You probably want to mention that in the commit message...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


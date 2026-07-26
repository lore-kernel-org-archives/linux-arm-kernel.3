Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B3BC531CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 11:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKU0QhAvsBejgAlbDaY2+1ClKAxRltlgTuy03z+3isE=; b=MnGFo92gB85T7mdRZVNmsXYobi
	mljiT5MHEfiw3bn33Ms3OtCq4hOEalMAUh6bIF2bsXuRCcwPeoMdzl94sXVBK2DKhn/ObTs/gMtFE
	btnjE7ugwrZ+//SB1+P3Gf8JNjPSPe3Kuv4+vq2YuhoPu8Ezbtv+O00M8DkyZZtFKAZc380nm6P8M
	RGjq+6K/86q7p+tesPVoLreQ8lJ1gUWpCqg2dW85r3VN1OZoLBtCAFpO45k6iFEtMQcKr8naXuHVA
	2B0PKZDslrT1eOwtm5tJn+HIQIaqRhQw/VqSjcjI3VP4EuJry43gppoboLSlTCKP+obQKmXIUYLEj
	6U64qvbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnwmZ-000000015ll-1fi7;
	Sun, 26 Jul 2026 11:12:35 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnwmW-000000015lN-3rrS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 11:12:34 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-43bf9548df4so1023918fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 04:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785064351; x=1785669151;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GKU0QhAvsBejgAlbDaY2+1ClKAxRltlgTuy03z+3isE=;
        b=bkyKV2/vuSF29hcAsXSNMAaXgIRm8oquHBpEbjg8qN2H+Dc35fsrZJT5xJKj4d79P3
         NJj1DrI9OTvACZVuZBiF57PHPKOGjafu5TfumvDKQ7TX2fUBy/hacTpnJieyxvYKZJA1
         M7/RyULYxXptukoKfKrgEY8+aQWJlGQvpe0zB3g+SrJBjE6wphvmGsAGYVWdL5+uVvi8
         RbfyYYjplVo31dSLf6iLQBCX4MkY1s6tx7ag5WOU+l8RJm6IFC67M3waOFzZQGcx56Nn
         RRcOi5rt/eYa0Hch6TkDPGh8aKmsbUT1SLoTjz2M1zfNpY1ZfDPSMfDiIOL9PvcqqiBH
         hZAg==
X-Forwarded-Encrypted: i=1; AHgh+RqZZgJRwjn7yVqugDt35d37xnChSc8CJnp8BAzjjLRCCQzAlyCByiHAHJLuASlXOujCU83fef1JGyMCCEkqX536@lists.infradead.org
X-Gm-Message-State: AOJu0YxnQTD8lx9T51v5yuPLKy0VxmsRdkpBQKqK4U0kimIwGKEY4qcb
	viJz8sLNN+bhkfxaDVFUm2UtP5b2r+uuAces1XU6FAgqhlpCYceWgatDwPVPKHs6VQ==
X-Gm-Gg: AR+sD13pL2kd/GXB96AqpRKoRsdQCqU4RIOBOx+soCDOVPU999eROPcc9yZdKC8GfJt
	MjT53NH3z9R1gkCF08+9jcdK7ikocwl05VHIsE2SgcmOFuro5GkbZc4pGWMqkqrA0cplPbNeHk4
	Lx/gtd5LwivjeT61U48534hcqf9ZIYUndIkjbONZc56fo4gPng2gmeHzdFdaR3HNG4yfBHcbDoW
	IMOlLv7orlk48LQIbud3JpqtbQcuHe8e3wNptpnabH1OCIbRkW0JhinJ2WwKub00Pc/1JKwWcL1
	JuBjkEbPg4ZDOWbHGJqa8kJdlUlnd9tfiZgFkD7Iysg/npAGQH1gmpDlK1uZsZzdf+a6h7yyTcm
	sMP4iOPIHY24vT4dwpyqO2H0kL6RoSq4QWuyxX8LjjXPzaTNgPFfTcSdkvL0wvaUZeL8B7z0JyX
	crFLxYymyFAS2/U+MKRePmR/9bIZYflqKQxP23728RzCqnZpIW8K1KIfbrQs7cki9bf6Xu3uyC
X-Received: by 2002:a05:6820:60a:b0:6a1:19ad:7a0e with SMTP id 006d021491bc7-6aaff8402d4mr3833929eaf.17.1785064350734;
        Sun, 26 Jul 2026 04:12:30 -0700 (PDT)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com. [209.85.161.51])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45767488299sm12824909fac.16.2026.07.26.04.12.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 04:12:29 -0700 (PDT)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6aae36ea5c4so974899eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 04:12:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr6QokUWOSflewl/uqwOZk12g7eEcH3FMLPMl0VkTgDUVgj4R3qFqGd4S8kUyXJAfBcwzvTKVhowYojsXmUhn1F@lists.infradead.org
X-Received: by 2002:a05:6820:4d0a:b0:6aa:d792:e078 with SMTP id
 006d021491bc7-6aaff87594fmr3257957eaf.27.1785064349448; Sun, 26 Jul 2026
 04:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-4-fourdollars@debian.org> <al58ubdrmJpPtr0F@ashevche-desk.local>
In-Reply-To: <al58ubdrmJpPtr0F@ashevche-desk.local>
From: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Date: Sun, 26 Jul 2026 19:12:18 +0800
X-Gmail-Original-Message-ID: <CAAT15mNAKHdJTrxqctHe4o99TTN18481r+TVAL0ubA44zM1Yug@mail.gmail.com>
X-Gm-Features: AUfX_mytscuS4j8uP2M1eAMvyLvFoGxgNoXb9GjOvRAaNp-ItKcKS9Ve7cJtouU
Message-ID: <CAAT15mNAKHdJTrxqctHe4o99TTN18481r+TVAL0ubA44zM1Yug@mail.gmail.com>
Subject: Re: [PATCH v16 3/7] spi: pxa2xx: overhaul teardown and suspend
 sequence using pxa2xx_spi_off
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mark Brown <broonie@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_041232_970548_151F8784 
X-CRM114-Status: GOOD (  16.92  )
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

On Tue, Jul 21, 2026 at 3:53=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Jul 21, 2026 at 12:21:12AM +0800, Shih-Yuan Lee wrote:
> > When removing the driver or suspending the device, the clock must not
> > be disabled while shared interrupts are still active. Gating the clock
> > before waiting for in-flight interrupt handlers to complete results
> > in race conditions where the handler performs unclocked MMIO accesses,
> > causing PCIe Completion Timeouts.
> >
> > Overhaul the remove, suspend, and runtime_suspend paths to use a strict
> > synchronized teardown order:
> > 1. Disable hardware interrupt generation at the controller level.
> > 2. Mark the device state as suspended (suspended =3D true) to prevent
> >    subsequent interrupt handlers from attempting MMIO reads.
> > 3. Call synchronize_irq() to wait for any active interrupt handlers
> >    to drain completely.
> > 4. Gate the clock via pxa2xx_spi_clk_disable().
> >
> > Additionally, commit 29d7e05c5f75 ("spi: pxa2xx: Avoid touching
> > SSCR0_SSE on MMP2") documented that disabling the hardware block via SS=
E on
> > MMP2 SoC platforms corrupts the RX/TX FIFO. Instead of calling
> > pxa_ssp_disable() directly, use the helper function pxa2xx_spi_off(),
> > which respects the MMP2 platform quirk by bypassing SSE register writes=
.
>
> ...
>
> > +     /* Wait for any pending interrupt handlers to complete */
> > +     synchronize_irq(ssp->irq);
>
> Unneeded. free_irq() implies that.
Hi Andy,

Thanks for pointing this out.

Good catch. Since free_irq() internally calls synchronize_irq() before
releasing the IRQ, calling synchronize_irq() right before free_irq()
in pxa2xx_spi_remove() is indeed redundant.

I will remove the explicit synchronize_irq() call from
pxa2xx_spi_remove() for the next version, while retaining it in the
suspend() and runtime_suspend() paths where free_irq() is not called.

Thanks,
Shih-Yuan


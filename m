Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F9DC531CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 11:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ie395SkYdcDwaJTNPPgWSWv1X1WkPQvm9E70lq/i+kc=; b=vgKe/HDUUpwBwGM0imHRQv/jsA
	Aks3Qjj+gugqrMupG49EeTUSrq4h+upreum8VyjLTsMtubiKrTUJtk9DxsZpCvFaWks+5uZtQ9ADo
	Ib7eXOtGGFstR4sHdoJcGq52ahj3vYM7SngDfiB94kSJJXvEibajvfM5spGjRC1C8L0yob8hNpFeV
	g2sLSNQTZez1EaVgRNKK3Hmgllh079llamJY0qEcRhKMp59DTKUlOZ9OV2BXQZthv61tw7uEinhw0
	kBHTyrl0FJOpi9jbR5C3of2gVj68TWuKImBfol/MqCYGRScrn5qU/NkGZdX7BnyTQDTx3K49HHPCY
	XplkDwzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnxLY-000000018VJ-2d9i;
	Sun, 26 Jul 2026 11:48:44 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnxLV-000000018Uy-2q8p
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 11:48:42 +0000
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6aaf3f54dbfso715122eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 04:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785066520; x=1785671320;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ie395SkYdcDwaJTNPPgWSWv1X1WkPQvm9E70lq/i+kc=;
        b=nujrrQN0bIVb43/HQpodGEZl7ZmkOOmfOpB7zqI4rhWY8KNeww7i1U4UWI70TdJOzn
         Ol0MJqR49OQTlfV3O6vabkPXcrENK/yN0k6jh2/rwPJS9bR9UcYO6RnzITRBH2Inh4kE
         qWtmOXA3jsSABXdhTC1MS6aRsY1Wd+J3/Y8JHD+SpqzO9V2aiAnw8NPl3a8NbEk0Dysr
         N+o6JxNl/mn+LMwrNig83lvss4xEydOUS7ag7MKNcdw0bTezLX4UMQYwuilndl1kt6lC
         YpZVBd6xGUyd1eel3mpdeUNL6bgk6XgdfMbMwbgtE5J0YS7wnNRum3U42xzA3UUc4UJB
         SYBg==
X-Forwarded-Encrypted: i=1; AHgh+Rq29Ei4NhH6XrKYjqCyfxtipLeI4j88n2DuqxJ0UjyuLwdIsYUlYeM/sFjHogv1IV3qGfPIKmgwqPoyHGepZNgD@lists.infradead.org
X-Gm-Message-State: AOJu0YzINzjo2pgweI6GccJtLwwQeLro1KlLfDpOqd9hLzrR2cDfeHRg
	rGLGfZnkov5RMSdfeoRs/isjlhlt+bmpAXJN9zXKn9fHk4gR38AenH6rhP4Sq8tYfA==
X-Gm-Gg: AR+sD12isUwiGr0Wjf9Km4qSZRQAdmrX5bsygVvrYDt8LAIXt6AaypRYJnzAQOljh8W
	wZhCk8apsS3y3HC5U2IpbK0sx7Sv4ZYaRl2K9hjBofPLxoK+dSDWYSoKpG692do6ilwqlYOaXL5
	jemHmtG7KAAOa3dM9Wm4igHsvglNTxFUiLtORCMFiDuLS8GHCxtzZrW1q7D5966PGvhGA97cqoR
	mc2XwoZ3+YXE6HAZIx9V5EWKJQO1CB/R4todvMI5Q8Kyp5mEnRNxxWBgMU7Eu2Hyb+Nhp4QqOH/
	iipJIeXYOCxkrEjyjSpmegEAB+5LwiM47edx0GzYvLi6gNPaIXgLuXLrgJxZl6WmePbLOEOmfUx
	tEXIoK/CeqXm+cNRMZcbVRGJCvPGtxpgaVYReoHmDhHS7Ti+Daz1vffMzwjWLCuMh0Q3pQS7EBd
	/qs6iYSEBYT3DmdVwWzHiHv0vzHJCDjlGy7805WeO1pNrupE7XWgPF917OxltzDijCarwg/E4r
X-Received: by 2002:a05:6820:1994:b0:6aa:d6bd:f6f5 with SMTP id 006d021491bc7-6aaffa040e4mr3813863eaf.38.1785066520333;
        Sun, 26 Jul 2026 04:48:40 -0700 (PDT)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com. [209.85.160.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45804f6d51bsm3292857fac.8.2026.07.26.04.48.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 04:48:39 -0700 (PDT)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-44cd237446cso1102667fac.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 04:48:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrvdfR4YB/RjSz/i/eefbk5GZJ2ce4kHvrxxL1RZYdW9Zw3+lFJyDGv+Eh3ht4/RLjwaD64Ri+N3JMfN9SJxPq0@lists.infradead.org
X-Received: by 2002:a05:6870:d291:b0:457:853e:82f1 with SMTP id
 586e51a60fabf-457f27f3ec3mr3942113fac.38.1785066518764; Sun, 26 Jul 2026
 04:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-7-fourdollars@debian.org> <al5-JasTYF5r8A-j@ashevche-desk.local>
In-Reply-To: <al5-JasTYF5r8A-j@ashevche-desk.local>
From: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Date: Sun, 26 Jul 2026 19:48:27 +0800
X-Gmail-Original-Message-ID: <CAAT15mM_5t9YuEsEKN8UkJh_AoY_PPVkstVujdBM6QJpq7O0=g@mail.gmail.com>
X-Gm-Features: AUfX_mwb4b-EFAMFA0DQeuXV_jGYugz1ypvxdPQKNESF7_iyUWMeJ-4Hz_uawa8
Message-ID: <CAAT15mM_5t9YuEsEKN8UkJh_AoY_PPVkstVujdBM6QJpq7O0=g@mail.gmail.com>
Subject: Re: [PATCH v16 6/7] spi: pxa2xx: restore LPSS private register state
 on S3 resume
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mark Brown <broonie@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_044841_730914_347122D3 
X-CRM114-Status: GOOD (  24.03  )
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

Hi Andy,

> Is this series AI-assisted?
Yes, I used an LLM assistant to help format and polish the commit messages.
However, all hardware register analysis (such as inspecting BAR0 +
0x204 LPSS Private Resets), DSDT ACPI overrides, schematic
verifications for logic board 820-00244-A, and physical S3
suspend/resume hardware testing on MacBook8,1 were performed
empirically on real hardware.

> > Intel LPSS SPI controllers lose all private register state across S3
> > suspend because the LPSS power domain is fully removed. On resume the
> > driver only re-enables the SSP clock, leaving the LPSS private registers
> > in their power-on-reset state, which causes two problems:
> >
> > 1. LPSS_PRIV_RESETS (offset 0x04 within the LPSS private space) stays
> >    zero, keeping the functional block in reset. Any MMIO access while
> >    the block is held in reset causes a PCIe Completion Timeout and a
> >    watchdog-triggered system reset. LPSS_PRIV_RESETS_FUNC and
> >    LPSS_PRIV_RESETS_IDMA must be de-asserted before any other register
> >    access on resume.
> >
> > 2. The LPSS software chip-select control register must not be blindly
> >    restored from its suspend-time snapshot: if CS was asserted at the
> >    moment of suspend, restoring that state corrupts the first
> >    post-resume SPI transaction. Instead, call lpss_ssp_setup() which
> >    unconditionally writes SW_MODE | CS_HIGH (idle/deasserted), matching
> >    the state established at probe time.
> >
> > To resolve these issues safely:
> > - Wrap S3 suspend/resume with pm_runtime_resume_and_get() and
> >   pm_runtime_put_noidle() to guarantee active clocks during MMIO
> >   access and preserve PM reference counting.
> > - Restrict LPSS private register save/restore to LPT, BYT, and BSW
>
> ^^^^ (1)
>
> >   platforms via pxa2xx_spi_need_lpss_restore() (newer platforms are
> >   handled by intel-lpss.c).
> > - Save only the first 6 LPSS private registers (offsets 0x00..0x14) in
> >   drv_data during suspend, avoiding reserved offsets beyond 0x14.
> > - On resume, de-assert resets first, restore saved registers, call
> >   lpss_ssp_setup(), and clear drv_data->suspended to prevent unclocked
> >   IRQ access.
> > - Add error recovery paths for spi_controller_suspend/resume failures.
> > - On the resume error path, call pm_runtime_set_suspended() before
> >   pm_runtime_put_noidle() to align the PM runtime state with the
> >   already-disabled hardware clock, preventing pxa2xx_spi_runtime_suspend()
> >   from attempting unclocked MMIO via pxa2xx_spi_off().
>
> This is an ugly hack.
>
> Saving context is done in drivers/acpi/x86/lpss.c (see #1 why this file).
> If something wrong in the flow it has to be fixed there, not here.
I checked drivers/acpi/x86/lpss.c and its LPSS_SAVE_CTX mechanism.
However, on MacBook8,1, the LPSS SPI controller is instantiated as a
PCI device (00:15.4 / 8086:9ce6) bound to spi-pxa2xx-pci.c, rather
than an ACPI platform device handled by drivers/acpi/x86/lpss.c. As a
result, acpi_lpss_restore_ctx() is never invoked for this PCI device.

Physical hardware S3 testing (rtcwake -m mem) confirms that across S3
suspend, LPSS_PRIV_RESETS (BAR0 + 0x204) is reset to 0x00000000
(functional block held in reset) by the PCH, causing all post-resume
SPI transfers to fail  continuously with -110 timeouts (applespi
spi-APP000D:00: SPI transfer timed out).

I understand your point about not doing context saving in spi-pxa2xx.c.
Would moving the LPSS private register context save/restore into
spi-pxa2xx-pci.c (the PCI glue driver) be an acceptable approach for
PCI-enumerated devices?

Thanks,
Shih-Yuan


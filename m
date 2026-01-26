Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB38C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 01:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Td4QUCSFnNiGlIQcniNA/rp8ZfKnX5RqAxkcu4MfCJE=; b=p20F6BQHQg1/GVSChekQaPqV/O
	Uxf9pVVSDCPdGMx6/uMceVIsq9j11ju+uQ/579J602697YCdam4WkTp6h+ssk4XFrYAZeYRgZj+1n
	AzCU7qyw5MexvlU/1bXfjJfX11S3R3Tsd51gJ9H93ykKH8EH6qaC4KVj4NH0Ewetw/XT7xFr6JmjW
	VUbKPcuOGkAagZMT0oBbQpyxMVDRuiESzR8JRkbcEyUAzG1CrAAr72RS2+5bTaV/YNMPcyS7OBGdi
	8ozhezrtDK+HVtwWn054MYIxIjsaUVnPNqFKo395PRw5phxOGS2GGXC7KrctYzy4rzg/yvpH3qtxq
	WrqO605w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkBdO-0000000Bl9F-3Spe;
	Mon, 26 Jan 2026 01:43:18 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkBdM-0000000Bl8r-0eAl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 01:43:17 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-8947e17968eso44566706d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 17:43:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769391794; cv=none;
        d=google.com; s=arc-20240605;
        b=alvn0YBORE6rDNQ7/bUP1Ne24Tru1nXiDHHMMn8WEJEhASty825QERqxHXJOx9s2Ul
         0fM0fdXn5R1DiSXrRWnjoTlwh846vuwCpAuD057VK0W09eJZ3NtG/CYzvxb7V0/V6lpt
         bLC+tLtvrPSEu/xN3qCoeSg4FHFN6FC5rABizKG40xIFeu+iGEo73JtSP94cVKttM3wk
         +9tOvjTny+XV/ZviSj9aRVBurQnJxf2NRTWydZqDIUVLK29xtvS/6ib0U9GgOqmdmoDj
         j8dgx/WNCbQVio7kIncI6nJaPtk+n31kK2EaOBgHmJYBFLMseDoo9llkdkrR5/ViEooo
         caXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Td4QUCSFnNiGlIQcniNA/rp8ZfKnX5RqAxkcu4MfCJE=;
        fh=dRn2CSks97m2kDzowNpwYTBVGds0lIhg7Rsz8w6FwO0=;
        b=isxqD06B91Gr/3efvCbox6zBaaWCGWPFYpt9qfeCkAqEjWkOpLYqovwZYXDnGWw71N
         YtK9rtlRA2IcJos1S23Asx3eoh22u2VfiOGofDVmTea6ZP2v1jIYBNYvSUfRCvFDXMfm
         2RP3iVDnv9xeo3OcljCjbmJd4FlbzBougnRiaV0oOtT6TIkBhFXD/vbJapxAMX1A+Zh9
         UJH0e9a0QHEc0z3FCof/8xSDmRMVGN0pm9S2NdJENl1njH2eJDXFurrlFChCaPa0TFGg
         Q3wwoSHnveNRV0fF1pdK5M1Mvt2PcT3p5uDZOWvJ9HrQbpjZa2zxyL2V9LyB3fOvISP+
         n8ew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769391794; x=1769996594; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Td4QUCSFnNiGlIQcniNA/rp8ZfKnX5RqAxkcu4MfCJE=;
        b=LXbXWOyaVhZ4kpi85PugguVRzObeMYM5VpdFtN7344oMwr4GGX9Ytgq8aWOmVWex3H
         moqX8A6YsnAI4Qj+vOkzWxPHlBZJ2FlLWGKACqLyoOBUWE5xQ0GL6hzHfAqW+DBlzOIK
         DC38SSsyH1qr97dIbKE7d3LN8mKsyJyjWA2XzUEfCU2Vscor8GXiCR3JFlc6SxiqV8gD
         /rroNg9K1aq4NmcOrqptIvHePvRtU7VAFOEGU5yClpqb4+RKm6DMlO07mK+YJ03n8IH2
         i1tKTBmGNhHryfDQsJuduRWtmdKpJ7kzLmQcBN4A9CO/U7ji+lmgy8vpBUiPfan/lvAL
         eApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769391794; x=1769996594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Td4QUCSFnNiGlIQcniNA/rp8ZfKnX5RqAxkcu4MfCJE=;
        b=pU1E3cnSS6jdh2FzwoyhqQBFOz2rxn3S2miiYQfQEWu1SBz8Pfz0w6SF5INnhEkV1Z
         xviJfpzIPxG4XAsy6JjMgYRXJXkRc0TvpXeGYgGLM2xltff6IBHsJurZf90dEvHaFp9t
         TL766JcoyZCD5BkldhMm0xGwHhIZTlPBmfI4a7iZ3Cq2pexCFe2jVT6kC2jwlMLG35r2
         vSnmkRAcbmGqVZD00QwUwe+eFNaVeycidBs53ztXXNzwezEnCw9C7i3TnnYfsJJ7CD2q
         5DVbFY2u6x8lMv6T7iVb6wxy/HcnVoBI+KgLxfULclQ5xJXftgJtwk2E3QE1YrVeOQsO
         5NzA==
X-Forwarded-Encrypted: i=1; AJvYcCV/eq/yxNkL9iwn0aAYejG0jtCt1VBrksf+ZGt9+jTLY+qLFEEOiUzUktcOE7xwbscyB81mftSO8M5PZvhVaSW2@lists.infradead.org
X-Gm-Message-State: AOJu0YxbLZGD39M84SZYCoMOjx5FPmmvlco9kElqlmD7UFPkmJbVVS6f
	A+SHnwqYfx3nlwZkzgzzM+DGC0NEWLyIGjGZpRHrsd+vbkrBue6P1H/ivwg9b/lTv98kGU0fp6D
	IYjSJIkT36S8okJdniLFX1QdJqL2KpX4=
X-Gm-Gg: AZuq6aJ6sutSmeavCu5DioYLGLlTmpN+8yTQQTYwqBKzAb5hnVuh7iiRrSBZOXU2mIe
	hfeHsDA3+DJkp37bknTPJmulfk6Y3NqZ8SY6L3MkX4NcO5p+AD1mV2LYHv+l5BiGD139rqgOg9X
	D7gDxKWIsdli4749+2jy9bgHQLG5g7BNX+eJGFjSSjW2Erti3ejUWyxewTzt5o+Y6wrAtgCoElw
	d1NJOQAZ6MZspbJTztpltC6QYOp1i7KGwRh7a+UXD8BcXi8jvA74C+R+6JyNnkSTb1aHDunCg==
X-Received: by 2002:a05:6214:d85:b0:88a:4452:750b with SMTP id
 6a1803df08f44-894b0792ademr38139946d6.60.1769391793952; Sun, 25 Jan 2026
 17:43:13 -0800 (PST)
MIME-Version: 1.0
References: <20251226225254.46197-1-21cnbao@gmail.com> <20251226225254.46197-2-21cnbao@gmail.com>
 <aW90tXGtLVC0mKWP@willie-the-truck>
In-Reply-To: <aW90tXGtLVC0mKWP@willie-the-truck>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 26 Jan 2026 09:43:02 +0800
X-Gm-Features: AZwV_QjeDywrcz2eWqXN9SXa7QL5VefpgErEyUZbE549AGDu67lQKOvE9Fh-udU
Message-ID: <CAGsJ_4wDYTbuuzzfGNWqp1+ca1cAkg0XMgbgkspRGdKKAx_Ymg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] arm64: Provide dcache_by_myline_op_nosync helper
To: Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_174316_277613_0EEB477F 
X-CRM114-Status: GOOD (  13.48  )
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
Cc: Tangquan Zheng <zhengtangquan@oppo.com>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>, xen-devel@lists.xenproject.org, robin.murphy@arm.com, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

[...]

> >   */
> > -     .macro dcache_by_myline_op op, domain, start, end, linesz, tmp, fixup
> > +     .macro raw_dcache_by_myline_op op, start, end, linesz, tmp, fixup
> >       sub     \tmp, \linesz, #1
> >       bic     \start, \start, \tmp
> >  .Ldcache_op\@:
> > @@ -402,14 +401,13 @@ alternative_endif
> >       add     \start, \start, \linesz
> >       cmp     \start, \end
> >       b.lo    .Ldcache_op\@
> > -     dsb     \domain
>
> Naming nit, but I'd prefer this to be dcache_by_myline_op_nosync() for
> consistency with the other macros that you're adding. The 'raw' prefix
> is used by raw_dcache_line_size() to indicate that we're getting the
> value from the underlying hardware register.

Ok. thanks!

>
> >
> >       _cond_uaccess_extable .Ldcache_op\@, \fixup
> >       .endm
> >
> >  /*
> >   * Macro to perform a data cache maintenance for the interval
> > - * [start, end)
> > + * [start, end) and wait for completion
> >   *
> >   *   op:             operation passed to dc instruction
> >   *   domain:         domain used in dsb instruction
> > @@ -420,7 +418,23 @@ alternative_endif
> >   */
> >       .macro dcache_by_line_op op, domain, start, end, tmp1, tmp2, fixup
> >       dcache_line_size \tmp1, \tmp2
> > -     dcache_by_myline_op \op, \domain, \start, \end, \tmp1, \tmp2, \fixup
> > +     raw_dcache_by_myline_op \op, \start, \end, \tmp1, \tmp2, \fixup
> > +     dsb \domain
> > +     .endm
>
> This could just be dcache_by_line_op_nosync() + dsb.

Ok. thanks!

Best Regards
Barry


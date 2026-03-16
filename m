Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730E1F013E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 08:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ni27tE4Uc17PebqPukQD2Audc02oOzEQcH3vVp9B4BQ=; b=Z8Lta3J2dKb40QKSAJecEnfHfE
	h+19ZJlYFVewUEyyh/8azEkDd1ogz1VascgX3Y7eT3Y61mSuyN37NJoHARnIAaCxgCz/wViIVBaTS
	OnIR+10sJx+tYxICJYU+8qiJ4HV7hZSKdAi9n0+xAK/fB8fOlzs1x97xsVhwiyVI1Z8L9hWl6NT+g
	o5HcXxbojJLzd1HArVrS3AyAA76mBpwhf0pXH33xPXFGJVloB79yB45zwmgfckAcHc5tCsyw4r8ZA
	KYO8takz1DWjWCV8GHwnKnTz8ZrFLeAgZpt0f0AuZH6rxwaM9mjEHwjdApB47WL8zPnDuX9V4mgOC
	ggPFHWtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23fX-00000003a6w-3eD7;
	Mon, 16 Mar 2026 08:51:23 +0000
Received: from mail-vs1-f48.google.com ([209.85.217.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23fV-00000003a6E-1liO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 08:51:22 +0000
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5fff18d44fbso2771203137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 01:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651080; x=1774255880;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ni27tE4Uc17PebqPukQD2Audc02oOzEQcH3vVp9B4BQ=;
        b=P3tCGlPG+kEywhcej9/BTgrKTiCRGsfOYSy43nR2Cggvb8IE6VxgPLwYtobk+/OqYh
         H7bXVk0gpQ1HE919JpshJ97hlZDWL7vUlhYq+Y0xiLQ+qJppocDLrYs/yxUhV9SZdKp/
         FhXPdwW0osd2uvO8srkbFkZvMEeBhH1A4sseoJ53JlC58A610vYg5EJ5Y08HpInQ1LBF
         qAvXU+BeIME7O5p8VGSe1wny9ggotTLWOymRmlkIctoPsxG37asmEekLveZNGY0U3bIo
         34Zm1HJecBlnDDsGUfLWNcIZ25i/RJH8GSJ4caiocASLzodjrRGAUXldAdWAgZ+Vrqk8
         +YPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB9WoWzg01eRJYwQOzyQnBOq0uCBrtFU8NHtYa4UoKZ8swsH7cbHsacL3GJMscTSkXiiCeYaXtr17nVD1LVZgP@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9LZqx2vjTjSJyiVdHScd1L8s39uo3uXmAgzAOvSIVQCkVdTqW
	LHKq0VdWrr70nMShsP5tNuCVfB8Y+76Q2q8OBcCqpPmUN/xvC+ik2ib/P1GVEJ43
X-Gm-Gg: ATEYQzy8BPVzzEHOAnS7ksZP+B0sElSz3O6ykFS7uashAFH/RsZVJWVFO6G1BQSJPlV
	WA+Qx278t9Rg5HkRy2CU9vEocepgPJNoj2pLST9+oVGSTgHd6xyupyRAszHCH3u/t0VwHv1I7DM
	iYpaUMwnmegpxof6Ijg2+dl9sB3/ajoP9EKkzs3PZDaciQj8JuDnVvou9kX4ijOPUEJeKQCwi14
	/UiM6DIBCvsMm8Iufp0PmvdCwKdEFNtcjXiUIlHG3M94sC8KhCmPOe7TJ3+6f7PVjVWs3WNlHVe
	QP43e9lANbhktq0afkhCD9JdH34PwR8472SR2GsSVys3CNlD7Ygcq6NzECL0yxm15shAsGMjhOc
	3OsHBkTkqxReKydsltO2PpoGzv0SFdUXDWEhHxbeQF0W3XsvaGo1dN8HkOCDsZ+ckDrm70+h5gW
	WMqsPjjZTCWk5zpxCMiHBE1MuXlm5SHbYh1ZaOa2wc05o+iqqLtzs5RlS3jP3K
X-Received: by 2002:a05:6102:32c3:b0:5ff:e58d:4dff with SMTP id ada2fe7eead31-6020e2e3c45mr5186183137.17.1773651079894;
        Mon, 16 Mar 2026 01:51:19 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ecff69249sm5550266241.12.2026.03.16.01.51.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:51:19 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5fff18d44fbso2771191137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 01:51:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXyNJCjwjtz/WvilgHHcNBq4aOetIaX2++oMz9a+2AqtsOoWBCj0amnXUpWZlRegAg1MR3nsoy+qEuFU+Pb0Oit@lists.infradead.org
X-Received: by 2002:a05:6102:6cc:b0:5fd:f2ad:c653 with SMTP id
 ada2fe7eead31-6020e2cde73mr5380780137.16.1773651078892; Mon, 16 Mar 2026
 01:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773399669.git.geert+renesas@glider.be> <cover.1773399673.git.geert+renesas@glider.be>
 <20260314-quick-gray-saluki-0f96ff@quoll>
In-Reply-To: <20260314-quick-gray-saluki-0f96ff@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 09:51:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJx14SDXq7oQ-m-576GRQztRybs1HSinzf03ttvF3c_g@mail.gmail.com>
X-Gm-Features: AaiRm51SoosmbfwaefU6BPqSHDNLBprafGmdntJh4QZy8XCfS9j5Er_XSACDcgM
Message-ID: <CAMuHMdXJx14SDXq7oQ-m-576GRQztRybs1HSinzf03ttvF3c_g@mail.gmail.com>
Subject: Re: [GIT PULL 3/4] Renesas DT binding updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_015121_470106_CA92762C 
X-CRM114-Status: GOOD (  25.93  )
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

Hi Krzysztof,

Thanks for your comments!

On Sat, 14 Mar 2026 at 12:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Fri, Mar 13, 2026 at 12:12:59PM +0100, Geert Uytterhoeven wrote:
> > Renesas DT binding updates for v7.1
> >
> >   - Document RZ/G3L SoC variants, the RZ/G3L SYSC block, and RZ/G3L
> >     SMARC SoM and Carrier-II EVK boards.
> >
> > ----------------------------------------------------------------
> > Biju Das (2):
> >       dt-bindings: soc: renesas: Document RZ/G3L SoC variants, SMARC SoM and Carrier-II EVK
>
> This is DTS branch patch.

It is a DT bindings patch.

> >       dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3L SoC
>
> This is drivers. Splitting it into additional branch is not making it
> easier. I don't know where is this supposed to be merged. I will take it
> to drivers, but in the future, please do not put DTS bindings into
> driver bindings.

This is also a DT bindings patch.

DT bindings are soft dependencies for drivers and DTS.
DT binding definitions (I don't have any this time) are hard
dependencies for drivers, DTS, and examples and DT bindings.
Arnd merges dt-bindings PRs in the soc DTS branch.

> See also submitting patches in DT dir.

So the second commit is subject to II.3:

  3) For a series going through multiple trees, the binding patch should be
     kept with the driver using the binding.

In this particular case, I could have included it in my drivers branch.
Where do I put SoC-specific DT binding changes that are not picked
up by anyone else (I don't have any this time)?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


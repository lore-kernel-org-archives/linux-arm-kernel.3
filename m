Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221C5CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 14:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QcsqXGndiQDiWLX9BqUSUdSKEoXLrcy27ADWxumaXQ4=; b=E5/MrzOd91tMs1/kVjVZzSN/8r
	Mol2T3k3XgRN1tNXVvv+sZQxDTfH3t1ZeEHCwu/pl627Wj9z6Tf0JmBah9wIBTwiTQDGA77kpDmje
	QiL1qSvqRNNpeT6DNV9feUub5cWC2Nun91uwHbo5HhZ3v0iRJrhSi7YOmY7yXF4Uy/VsBJYY48B71
	GDF0w6y7nfZ/rioWCGwYDbfi6KjrfeTIorkfbe/7hT7aOdrJlWOG4sA3rsbklGec+SJTmxpDHpHnc
	PArwuV/pqaz1nehdTrVNB+O/4YkUt4t4bGooRjRHHNyVwPcAfB/XITgmqLkg0Benn1iCX17cm+PVH
	pPxqZBng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbfmI-000000055KD-2xbG;
	Mon, 22 Jun 2026 14:37:34 +0000
Received: from mail-vk1-f174.google.com ([209.85.221.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbfmF-000000055JT-2se3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 14:37:33 +0000
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bbc6c99c3aso3281987e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 07:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139050; x=1782743850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcsqXGndiQDiWLX9BqUSUdSKEoXLrcy27ADWxumaXQ4=;
        b=PtOkt42QhB/7lQNukaKt+p+qkRvqs4mK/XkX3nCIMiMIdIDiNCO/zeqt42HORyeHxk
         mCgN0KAVjvFki/BgnCq3GGrEP4XfQY6c0copuLSDEdX8LlqQgoNuD2//+5OT/nCh0FM7
         UHLzUmLXpZ4gWJNXaMcLoI9vSmlKkq6cc7EzMgOfQVO8kAZ4FUoBFGOqKhN6ve30GNjS
         NGhYsu3os89+IDh0lLgMnb5SciV+xtS9B14z2BCd5YFzR0vCAwJLlhZUcWPZzcAozKtE
         xP8Om+ZVxILCWfW7bOjwCMaVx3PXFXLgSlbSgR5mP9+lzP+0duG3v2OP0EDKnBlrmaL+
         zncg==
X-Gm-Message-State: AOJu0YyRMquAcxDhZWMp+4oJeUEHU1K9VnbDPmm3FPpzHow4gQhT4PIG
	32TVTRdoGcX9ycRmNhUDnCAa9xiiaNUBxzQ/EFvlBgjIyFFWcIaAFA821VxwcGgT52E=
X-Gm-Gg: AfdE7cmV389rMpbpxxg7mpIg0Wv1CRGH0EOj3ukdvFGb9fWupSlgCIcC20nrh57U8K9
	rmrDzg7lKZuWA6Q/2g/AICFG9TZyMDDUIJWSDh4p0nXJ9kY4eL9X/H/i6pM1azuNKTQ1UgWT7EX
	eDEhMa7obzgk3gowgx5DxDoQZN5plyHgq8aAF/+8OAvv6+cjejEUCKwLgjtnhAtOpeHFGhhuDXy
	ZxgSb8FBerD63rYB2+Q/va1bALYTFYDC6zF0yV3r+C6XKmXl39aZYFdIUU3ydlo35wJZNJebEXZ
	Z+awh9ebEmRgYFlnqHcUDz+6AhPrN/coBZIzKGEvl/twmoEBgwin9LCcpzI5VayI1gJ56zRQiEj
	ZJZMRDerQfR2WN+gm5N5K+lIuoHpTH4KSTDSTZj+4oPG3BCgnpDgBWnRnaoUYkVo4w3eGhe475u
	orSYw+jbMUfCykYGLqQBpVjtwWgM/3bBDXyeTc/jPhMl4oGkyE8A==
X-Received: by 2002:a05:6102:2927:b0:62f:3abe:907f with SMTP id ada2fe7eead31-72a0154ea53mr10027764137.4.1782139050200;
        Mon, 22 Jun 2026 07:37:30 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba543eabcsm6288981137.12.2026.06.22.07.37.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 07:37:29 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-96710629eb1so1669505241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 07:37:29 -0700 (PDT)
X-Received: by 2002:a05:6102:4415:b0:726:cd42:d039 with SMTP id
 ada2fe7eead31-72a03fb3994mr8954632137.24.1782139049133; Mon, 22 Jun 2026
 07:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUEPR0xWXRwLjBt5sF7i4HxcDLHCQGmc=gGvFmHRDv-Jw@mail.gmail.com> <8cb1c3cb-3d8f-4e76-99e9-ad78ee149556@mailbox.org>
In-Reply-To: <8cb1c3cb-3d8f-4e76-99e9-ad78ee149556@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 16:37:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX2-=47ZKP4MsXsVecBoEeEF6=e86nOUAYoA=Vbvi+=Hw@mail.gmail.com>
X-Gm-Features: AVVi8CfRVVXR2FXSKJhSl3yxE2bVY1oBSZbcvDardGByw-FE0lPwGDdOQ4zidqU
Message-ID: <CAMuHMdX2-=47ZKP4MsXsVecBoEeEF6=e86nOUAYoA=Vbvi+=Hw@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm64: dts: renesas: r8a774a1: Add soc: label to soc node
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_073731_727430_37FE1885 
X-CRM114-Status: GOOD (  24.33  )
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

Hi Marek,

On Mon, 22 Jun 2026 at 15:56, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 6/22/26 12:35 PM, Geert Uytterhoeven wrote:
> > On Sun, 21 Jun 2026 at 04:51, Marek Vasut
> > <marek.vasut+renesas@mailbox.org> wrote:
> >> Add soc: label to the /soc {} node to align the DT with r8a77951.dtsi
> >> which already has that soc: label. The soc: label is useful in U-Boot
> >> where it is used in U-Boot extras DT fragments.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >
> > For the whole series:
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v7.3, squashed into a single
> > commit. Unfortunately there is no cover letter, so I will have to add
> > all nine Link-tags.
>
> Is that why cover letter helps you ?

Another reason is that my scripting turns cover letters into empty
commits in my local tree, serving as separators between patch series.

> If so, I will start generating ones ?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


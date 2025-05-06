Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC648C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KktmeAFh0iInvvBLcrYESanNohFTS/OHe3yXdSHV54=; b=QrmYHGm1Mdurw34XYjpTBh9CkO
	17Mxw6e/pMNuviC4nV0vr+NO8ZZ0otuTU37CFUj5b8r4H4+YLhoWDbiLscu9hv68Gm6ARGWYdN46b
	CUkzRAAF7JbO0ViWkp9nX0W3hfHhpPnNrc0BdcrIx42ELsQ4hQEWjjZeQuSGvBhhu3fiDUjqZzEnn
	dHbh3cHQaqJUCaJTqahv/mJJguy9R96eVh/S9R7Anf8E0Ic6y8WuQzArjQkf56Nn8ZSkODSv17zJC
	CuEAMrmQpTMslm5+K42qx1l1akPLCVy74tMSTLCV2xcku/dm52Q2bGwtaBi4g9ZqyR480qtemuUm/
	hv8bfLgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKp9-0000000CcT4-0lOO;
	Tue, 06 May 2025 16:07:15 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHcu-0000000BxBG-0Re5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:42:25 +0000
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5290be1aedcso4616110e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 05:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746535342; x=1747140142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5KktmeAFh0iInvvBLcrYESanNohFTS/OHe3yXdSHV54=;
        b=JynleIhCwO/UDC4wH2bTMutzDqUiWF8LwaNU03czZpLfIb4Jr41Pj34W/08/dw1MRG
         5gFFy03uSsu9G0smYk5y4dILoskmwGr4/BNvAcEPR2Uc8IMc5E7hR6gT13CuXFJD84fO
         qxgbhaelGdsEM7mU2vBjJDtKqEl+tMeG3UjlAkM2hh9Vs0B5Qdj5otfPWF4g7VK6yY+M
         mxl1dGgGu46tbj3oyjCyRosUnpctcNOk4eICzYXvuIvKxbVevSt6Y+lGENcTsgnBSVYu
         62MtAqF5IKJ8SdQ9xcCMTKmgPubZHkuvUpYaW+Rntd4MnC2ySMsuONZi+l+iSAn7Z0WF
         LrIA==
X-Forwarded-Encrypted: i=1; AJvYcCW0OIPRUlZ7g+ttbcEG5/jcPSckcetW3MpQce1jSKY9aMzNDs2KDeYfhZKmQ+5VjcnmqWm12b9ksOb70OQin3zu@lists.infradead.org
X-Gm-Message-State: AOJu0YwsYQkI7EHhAYqmi6/+kHdJKt2FfEs0YFKLM8cXEiDAHvDj4KD3
	sXYKdBWr3h5n97L1qC6+8u/7ME4+wyhP2xzS6I3J8VqMM1p49Q+UKNIrVrW2
X-Gm-Gg: ASbGncucDkQg4AyI5RKNhfGoJOnwQiJRJSF1bJKp0PrVxgccmNoyFiHvoRM62T1S5Ay
	fqbfeLnLzt7k1veG4Rpiw/xacvoLKHSq7SOhe46RuBt1W0uUae/x7ejOowa/05Zbbn3U3+t3JqE
	pCPEV8NoTHCRVpNxtdXGyB5Z8qNEvZGcUR4aIzNJW+1FK5ZTIHLYKx2imQ9rvRoPzwrM6u/UlRB
	zw7x5RYEzsqnOdRGuoBAAInC3bPOnQ86eyccMhZ0Ngapbc1sdHWCVEOWXlNXgZ2eTN0B9PgaFN2
	qBDRY2AZUsURf60/WJSMHdgJLEQYjqXE4xJ12SGXyi+eWTGuVnWnn4zuOVw9ywCWV1DkKBbrfvy
	WFyGUNS8=
X-Google-Smtp-Source: AGHT+IFkx6aC76OvwS+dQ8A6ij79HZHYFnUG/Bwdpmsj79byWSRFdwPxrnb3k8Ppw0fVZj1x5YWJXQ==
X-Received: by 2002:a05:6122:44b:b0:523:eb47:2884 with SMTP id 71dfb90a1353d-52b2649a914mr1704676e0c.6.1746535342136;
        Tue, 06 May 2025 05:42:22 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae401e0a4sm1904185e0c.11.2025.05.06.05.42.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 05:42:21 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5290be1aedcso4616095e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 05:42:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXr0zGk5NwFjEYpdoj/48l4k4G9SrB+rlL9YseL8JFWVxHApFNPO5nUmxbJeKRdL+qiJMEbaosqFUoHlJYzCS05@lists.infradead.org
X-Received: by 2002:a05:6122:3663:b0:521:b3ee:4970 with SMTP id
 71dfb90a1353d-52b2637e2edmr1645488e0c.2.1746535340941; Tue, 06 May 2025
 05:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <3a11ba8a-a9f4-4829-8bcd-56f1702bee8f@linaro.org>
In-Reply-To: <3a11ba8a-a9f4-4829-8bcd-56f1702bee8f@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 May 2025 14:42:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWmvHZPwppQR5OxB7QB9NOWxRWoVkiMFS-6ScdYw=ywTg@mail.gmail.com>
X-Gm-Features: ATxdqUHw7Q2NW_6-Xmvb7jxJeESiwPHSgjGO1YW2JZ65Esp2QlMbSSehpB67yV4
Message-ID: <CAMuHMdWmvHZPwppQR5OxB7QB9NOWxRWoVkiMFS-6ScdYw=ywTg@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_054224_150281_068579BF 
X-CRM114-Status: GOOD (  31.12  )
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

CC arnd

On Tue, 6 May 2025 at 12:52, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 06/05/2025 12:47, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`m`) to
> > ensure the Ethernet driver is available early in the boot process. This
> > is necessary for platforms mounting the root filesystem via NFS, as the
> > driver must be available before the root filesystem is accessed.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Same comments as for previous patches like this (even the same?): you
> are supposed to use initramfs for your arm74 boards. Even armv7 boards
> use initramfs, so network driver does not have to be built in.

Are we? When has that policy changed? Why are lots of network drivers
still built-in?  Making network drivers built-in for systems where
development is done using nfsroot has always been acceptable for the
arm64 defconfig before.  For things not critical for booting, modular
is indeed the preferred way.

arm64/defconfig is for development and testing, not for production
(which famous kernel developer said that before?)

> For example all of our setups use it thus we do not have to populate all
> other vendors with our own drivers.
>
> Sorry, but I am strongly against such change. Kernel is already way too

The kernel will grow without this (it will just take a few more weeks ;-),
so that is IMHO not a good argument.

> big and with KASAN it does not fit to boot partitions in some of the
> devices (and I cannot change the boot partition size, at least not
> without big effort).

arm64/defconfig does not have KASAN enabled?

> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Doh...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556C7C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 13:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPt+qXySw7ZEMaJVxGkIVNj27tNOPdt+uw4OFj4bA+c=; b=b+XfEy8Os+b7uMMnCtqIKhrxDd
	iUgVQnYdrBmcjqef3im8XeJd5rkTwY4sVknx2cluwiyiujHJdZSGB+NYFSPfpJiPSmxsxqcRkccH0
	w04aiq3X8F/MEfwCqxP70a83mhvxIGSuZePRyQl+abxTcGR0Bepd3TXIoNihULg1q87OcLjaJKzAA
	KbIxp+oHEXGE38y5dd+e+xh9kPpS0i+dE5AYT+suEMfLeWOTXjFT1QRPs+fd+YHuS2u6lP92neS5w
	LSMrkEFs0mJYCZ92mrD5uoo/IXzGWpABtrDY7m9qOr4EjsUve+X0eH8CcPN28PJSTr8wJ3eKj5Ngd
	EbbbGczw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEq4A-0000000CXow-0srP;
	Tue, 13 May 2025 13:53:06 +0000
Received: from mail-ua1-f51.google.com ([209.85.222.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEprM-0000000CVrm-085F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 13:39:54 +0000
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8797ade0b5aso3154699241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 06:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143590; x=1747748390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPt+qXySw7ZEMaJVxGkIVNj27tNOPdt+uw4OFj4bA+c=;
        b=pK94XGMZ3ie6Urotjo6NvD07N5KHFZkaiFoj5ZooscgvkNMX23x1P13Ami2fvNzm4m
         s6GVRmnEhc49LFVDAMUdqSOiyMoJHl7zs4lQ5Ua6zeXFkt1MldLcyF9wggoCuGVGnaDJ
         JNcT52nS0+h6C0734r/ohIUz0lFvbdhieu3J4eqkfJgdsy8ArixPTKuw9UFcn3c0JDzR
         OsLtLg1JYgCmiYqxF6iDFBSlfsTuAY43jQMBi0xv9H7NjLnhprn2bJmVIDIb+P9qX+0z
         QTrsEGcEbmZcqNI1V2rN8UhffJMbtAPQ1a1JWg8ZOY/N/mO6r0yAAlq5Db9vz790RLH6
         MfKg==
X-Forwarded-Encrypted: i=1; AJvYcCXczihMMpfww5tvD2zyMHSZgqNaFOaUWHb55C8H1UB31Yu+kAF2fek1+HF9GLDXL6Bmg9ZPsSWRpc3Jm99LCvG9@lists.infradead.org
X-Gm-Message-State: AOJu0YyLcxtrvElLTMF1GFWHenyqxe6DoWGdHGhIOjSihiD4KNYnWEwT
	wCj3St79VftA4nCDbJvCjkCYFCQ8FNT/wdrzxIxBsCvswOno7avuHaZanbTc
X-Gm-Gg: ASbGnct3HZJtIbwnG0DuFmWEX6u0c69bQHH0Jl71NTubSVZC28lbNSGoaUoFTMQE6zW
	TsA3zLDDpz8RwZUEkixEbNj6gfgwMFg2lmR1D2T56SLbjG2vXebRVydSMhidyh8K7f9LcOg7EQx
	TFV6p+3K2WiZci2DcniBhuqbH3nPj/tq8umenm6ikEShKE5bEHYWl1adsbRMJ6DNdLGU/VB8fX+
	dDLwlg6tCUSusRQ5Yks21E2SmXdH4oPLthAQxJP7gUFQNoZjkB1IqT0z4pR+XCXJfPFGJz3BZo0
	kDfiQC3aV/OrjPccybKMtdNwuTQ3XM1Wyu8vTCXuusgHUBD1Iu4kp5TnF+woQUXhiymXK+XhidD
	CpxcFZdU53gmFnQ==
X-Google-Smtp-Source: AGHT+IGbp1ErzpNSkAV+dQggcjGNod8YIM78iBnBHJmt5364TXRHWgh6PNQJNNQVIEGK+BUjpoMxXQ==
X-Received: by 2002:a05:6102:1502:b0:4bb:c24b:b658 with SMTP id ada2fe7eead31-4deed3cf84emr13139058137.18.1747143590037;
        Tue, 13 May 2025 06:39:50 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f6139e8csm6832301241.2.2025.05.13.06.39.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 06:39:49 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-878af63c5b3so3275442241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 06:39:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmCxQ9aZB2vSMf+9l3wj2wnox7RvipzeGd2NDn+l3hk1brNg+PSdnxkykGLGBpjpcrlrYxluY86ELATX6ffV+7@lists.infradead.org
X-Received: by 2002:a05:6102:2b99:b0:4c4:e414:b4e4 with SMTP id
 ada2fe7eead31-4deed36da70mr15522546137.11.1747143589629; Tue, 13 May 2025
 06:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com> <20250429081956.3804621-12-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250429081956.3804621-12-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 15:39:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUdCGYrUaMPdNvzD2Lcp2RJFMzwmN5tb3wasVa2DObKRQ@mail.gmail.com>
X-Gm-Features: AX0GCFvMLa1kXPZnWuwR5TOMI1wbgRjuUFZJPPmXlHQ_ypkloLtkrcosTv73jQk
Message-ID: <CAMuHMdUdCGYrUaMPdNvzD2Lcp2RJFMzwmN5tb3wasVa2DObKRQ@mail.gmail.com>
Subject: Re: [PATCH v8 11/11] arm64: defconfig: Enable Renesas RZ/T2H serial SCI
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_063952_070445_415E62C1 
X-CRM114-Status: GOOD (  15.69  )
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

On Tue, 29 Apr 2025 at 10:20, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Selects RZ/T2H (aka r9a09g077) SCI (serial) specific code.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


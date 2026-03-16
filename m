Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76671F013CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 08:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EmTefij6xVk2JRb0OyDr5LMzX/ACr1ha2wKgEcc1/H8=; b=LGHTlNn806x+DyN37O6ec9aeR0
	yizIjgnxnNFZnlur6pAs8c6/mvGNju5GGsvCyh2MUeBi+ickXID+aV+2FwFPlA2V3te8hjONdi+q6
	Vm+6BuesVYp/w8vYJIsk6kOqQVMTVutjgNVte4EYeBedXYarAwDNjWbqDMNc7gYU9AE+PG1w2GbBI
	RlUWCYN9McED8LnIW4ARQ3YPQuCVmEW+iSF/+awZh604AatMKM3/2r0W/YmPUiZCb0xtE6UD1+EDp
	8ZopqK8weJyoPdrAWUZV+Z/UgtBRmCybqFjbPOkVgonZf0WQzd9nrFpVEsOo2S9joidH0RUP/7v3A
	oE2Phcbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w237P-00000003XA7-1xNn;
	Mon, 16 Mar 2026 08:16:07 +0000
Received: from mail-vk1-f175.google.com ([209.85.221.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w237M-00000003X9F-2vbb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 08:16:06 +0000
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56af30dde0cso1596177e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 01:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773648963; x=1774253763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmTefij6xVk2JRb0OyDr5LMzX/ACr1ha2wKgEcc1/H8=;
        b=YjcNc4ftV0I23ePOs/i+OxLrTd63u94W7D7tcwFgwNaALjDjtr4P+tfRd62pobYdjc
         Gh6GV8pjUliXcp4vYoc89HMBIiIVJ4dV2w8Vu2QsX0LOro/jkbyAVhvUaMqex76MsAnG
         S2SsJUlpzvHoODizARBaM3kR2rciAgDMKcI8etgmtKvxlxPzXM6FH22qC91XygTfnqmV
         lkgyBPGq57IXV+SiN+ekiysPIg4td64LzpgEMitjwZyNa6ENdRCmprsR7M0xd9jRhNHW
         ohrnKMsME68bDjEoXqv8jlpKxrfK2u/9oiOAZaMFlbHW5kCUBo0ikZ767Cmm9zR3nTZW
         n3hg==
X-Forwarded-Encrypted: i=1; AJvYcCUutZSWDUdqhcS+pE8rlplC/IUd2tNDk7ZTArbv8mGkCjmEh85Cx9XE4qpV/L3wHbrSMIFZRtZru6wcxT5kCpv5@lists.infradead.org
X-Gm-Message-State: AOJu0YyJyTzjObMjPE69vLsZdjNo1q2rXohfB0J5d9fg6a/xpZ4dO2KI
	flUIeDrOU8vDgkV+8OXib1itGdVyT9rRz6D7uej+0hgKhLcFRhUG1XGYkNU7L9MI
X-Gm-Gg: ATEYQzyg8xpscKlyA3FM9GhAzrHscNmuZrlTBsvT/ivQTWxC+30QgLbBoq/qOpIQjcB
	9mCHeQj7Zm47Lr1FoDfThSMuxCsCP5YapzPlKwfrZ93gOtUMri++YxvxYO0eecvncZi8DtJvsbc
	VIazJsgFuTKRjx2Ytr8xRuBYRWZfEMMTFYz3LCMSdisZ2aTHUUMnGP51bb+5QKchU+BeuFppItD
	frhp3voLaOX7HM+efe7wny9Cp/s9bmuPOJ/78QpYnnKJHmMoUtDO6t1F+chiiTJscrw7O3RKVTJ
	ASo8PeIGLciiHEv8ISQRsasBTjYFOILAIFKie54Azk4KhAsFGyfdXKxjNnffuhdyU8dx502prEd
	guZerXUFPMCt7064OnB/xr3tTkwQGXtvG32dQZ4lx2yMdW9h1dBWX2HLVPfuaeO0JEApMp8T//Z
	lA14crZT68YCkO2VBxpJG/ONFZmIowRmQvAztfoWSJdNdZttZA67nZAU1+df/qN8h6
X-Received: by 2002:a05:6122:2087:b0:56b:814e:d35a with SMTP id 71dfb90a1353d-56b814edd7dmr1352087e0c.8.1773648962620;
        Mon, 16 Mar 2026 01:16:02 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b8cbb4835sm586084e0c.0.2026.03.16.01.16.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:16:02 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56b7043c97eso577497e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 01:16:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXlzibEadEivgAhiwxI96yAS5Z4rkAfokjEH3liAGeM+YqTBWZ6vMdV/ZmTR1MulnEzF5oLwfDTA9MhnEvhqFvN@lists.infradead.org
X-Received: by 2002:a05:6122:659e:b0:56b:8d2a:8c8f with SMTP id
 71dfb90a1353d-56b8d2a9d66mr528332e0c.11.1773648961820; Mon, 16 Mar 2026
 01:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773399669.git.geert+renesas@glider.be> <cover.1773399675.git.geert+renesas@glider.be>
 <20260314-arboreal-bold-vicugna-cdca27@quoll>
In-Reply-To: <20260314-arboreal-bold-vicugna-cdca27@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 09:15:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVg_no3Y65D=E9pmPZ=vxOfcJ8hKC2Jd7W8J2Bxrt8V5w@mail.gmail.com>
X-Gm-Features: AaiRm53Rv5kBqmNlsxPfaTacL6gnOFBZ2evKRoyLQgMqcyEYrLLjn0WDPu1UeIk
Message-ID: <CAMuHMdVg_no3Y65D=E9pmPZ=vxOfcJ8hKC2Jd7W8J2Bxrt8V5w@mail.gmail.com>
Subject: Re: [GIT PULL 4/4] Renesas DTS updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_011604_745345_6CD75BC7 
X-CRM114-Status: GOOD (  22.92  )
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

On Sat, 14 Mar 2026 at 12:13, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Fri, Mar 13, 2026 at 12:13:00PM +0100, Geert Uytterhoeven wrote:
> > The following changes since commit 85c2601e2c2feb60980c7ca23de28c49472f61f1:
> >
> >   arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers (2026-03-06 13:15:21 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.1-tag1
> >
> > for you to fetch changes up to 0928a28daf017504e14920f4131bb99e3bc39dba:
> >
> >   ARM: dts: renesas: armadillo800eva: Add wakeup-source to st1232 (2026-03-13 11:00:48 +0100)
>
> Next analysis tells me:
>
> Days in linux-next:
> ----------------------------------------
>  1 | ++ (2)
>  2 | ++++++ (6)
>  3 |
>  4 |
>  5 | ++++++++++++++++++++++ (22)
>
> Please keep non-fix patches in the next for at least 3 next releases, so
> you are sure any community tests/complains reached you. It is
> unreasonable to expect that community will test your for-next patch
> immediately the next day.

Sorry, you are just soo much quicker than Arnd ;-)

> I merged other pulls but this one I will leave for few days more.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


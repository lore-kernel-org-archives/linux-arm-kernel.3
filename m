Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7B7C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 08:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FD+nL4yd2I4+cbDko5AOqUkYfXfG+wQm1GId2A/CBdM=; b=mtGclOLIxEB2AMo4AJTq80vey1
	DxaIF7pRTLEIyx/oRLmt2zwBjWm087rRdWiDRWnBCjBo3RuI68QPvyCt3di/qpVGpOhkIEkohthvz
	OrIFNegBen6/z5wlzYHuFe9pijWRjM2FKsQL4d7iPkAJQmGwjko43xft3QI/Tm03FP/Hsi1ZgnGjg
	HKsao5Zn02ErOylcT98YwsKaowStdnK0xzmceY9dsrCotDeA+/roPIqZrj4ibuKHNLXkM7UzAWnbp
	X+emD2N+i3cjKPjm+SMpUmGeUpsiNMOaSWHa2Ngs0L1U8dDxiUNA+vO4kD+m6f+GlzvbB5nMLYdvh
	5Ha6ZBxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIO1T-00000003Ka6-0OtY;
	Fri, 23 May 2025 08:44:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIMsr-00000003Ccu-28FN
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 07:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FD+nL4yd2I4+cbDko5AOqUkYfXfG+wQm1GId2A/CBdM=; b=Y2iAYPBx+yoEKqGbXri+unNBjD
	FZNqPXrox4psRVPYnIP3WLd+DXoSMUK19uZo3XWRpW6q+8wx+orzA8SZFApgLgMIe053rfM8r1CWr
	1YsYjjYUMME4Am/1NZHpDCIBKK2iEuYKDuecdBwYM2DjLxaUk6Nb7tC4SZES7KD4IsuXuAUv3YwBu
	r2s5q3XcvCXPeQDkjO5V4Rw98w2L/aEWxwSO2gQ8Zhc+LPTqvYNsUo9rxG55U650f0/7fg4UPMXRY
	XjkZOBK8QM9vTz/JOFTcxaVqSWJBJURbveJMLp7d8r+iTHNLXggTC8EIDZXtO0u9GdE7h0E/LC86K
	8hmWEX3Q==;
Received: from mail-vs1-f52.google.com ([209.85.217.52])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIMso-00000001CHN-2vP7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 07:32:00 +0000
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4dfa6818db0so2501183137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 00:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747985515; x=1748590315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FD+nL4yd2I4+cbDko5AOqUkYfXfG+wQm1GId2A/CBdM=;
        b=WnRarN2rxtoWjRSzXKEU2gcD6GngmtZXRGBO8kADjqFVeWZokrOQ2tehCFxtUUdbFo
         FEF9IQUmUnm37517v1KGpTG7zNqz7IIMq/5RGZ2T3kvHOTSrke2eWWbR5fgGlm9JFTl6
         XZyr6D4QEb2VWPafWJWWR7q6ulAfGBMxvgyazSvw/SEV0cNBLETWnG2xa+g4IYk0h1fJ
         Zo2RMPEVa+we+mU+zEUsEftdHAR2m/3EQ0OJOZ2IGBtapfUDJa0N8+Ntn3LS+7G4ZQZx
         8r530UnnZzRA471qDGOy1TdYxHdtfTZtEqZe+cEpxT8cp99ugPyGNnBdLwp6NQQe3rKo
         irng==
X-Forwarded-Encrypted: i=1; AJvYcCXwPp3+WBJSs8FszxOKgH6EIkxjsVW6GejQwWIDIyZeUifCf+VE2wZL68EiBPyTR5V13nCLYUMHNA/TbWJYggV/@lists.infradead.org
X-Gm-Message-State: AOJu0YzHk1eb0LW2JadjLwExFXyOvSHDejnnYPxoZv62SRyinUcHaWOy
	8pgeD+UTdSvdaagZY8oYHntXbqBPa8cxUwkiXNImcREuhk4jnPT5ceoFCLO7Gsh+
X-Gm-Gg: ASbGncuk5gjXlL2r0csTJEW4CaU6dIHcq5sI7ClurNTIgKUIZEpzytOu8gieYFHB8Gz
	LdOlcr3FkaDemgrvp8Fm0u4yymnvRqGH5SuoRUqQ9u2rzavc1sL2DOOYUjv0Liz3jLGbhTGq+q3
	dVbnCwVQezTQKfzplD1tTsrsY2pZ8ghkD5MPIh0xQaHitEniYnkobkyZQjHgFEqwxLwN4qTla7E
	4U/x1MY5MzHAYxD4ViV4vViSUKCQH2jTVPADtyqp1E+lisxD4kyBK22LcUmK9RFCiIUf71I49RZ
	JTtgVsRFhe4sfKqhpJMY1onkQIo88fsktjyXT+mztG2Z2gUE05GAGTzKcwzZVeVEH9hxktJPHf9
	Z9Q/+DXgSfz2rSA==
X-Google-Smtp-Source: AGHT+IHwnj4Fyw2qoxaczJpd34hoE0ukaX38q6RFnOr0vzKOk/Re44J0IO8f7B1vhhWIAC/xhyNKHA==
X-Received: by 2002:a05:6102:15a7:b0:4dc:81c9:13b1 with SMTP id ada2fe7eead31-4e04155594cmr28351590137.0.1747985514739;
        Fri, 23 May 2025 00:31:54 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e2b21b4a80sm4787301137.8.2025.05.23.00.31.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 00:31:54 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-87beaae0d45so1842573241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 00:31:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQNe6QJIyuez9YxNwRmphQRhflUx+VymhdgJO69El82o0psQgAnNrmIpmKjy6hW54wDvAhRnMztlHAth1CEgYc@lists.infradead.org
X-Received: by 2002:a05:6102:8005:b0:4dd:ad20:a334 with SMTP id
 ada2fe7eead31-4e049d57331mr26428808137.7.1747985514143; Fri, 23 May 2025
 00:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250331190731.5094-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250331190731.5094-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 09:31:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmQ2uGR1ntERG7rS=VtNNZ734BMCQu=GaYgQ3sOMpd6g@mail.gmail.com>
X-Gm-Features: AX0GCFtFv5fcH5b31peoUctAzpCxkK7VzeLvAUvdWARN-L5YJkESt2RHNq335aI
Message-ID: <CAMuHMdXmQ2uGR1ntERG7rS=VtNNZ734BMCQu=GaYgQ3sOMpd6g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: delete email for Shiraz Hashim
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, Shiraz Hashim <quic_shashim@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_083158_845155_3AC1A082 
X-CRM114-Status: GOOD (  24.87  )
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

CC the address last used in Oct 2024

On Mon, 31 Mar 2025 at 21:09, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The email address bounced. I couldn't find a newer one in recent git
> history (last activity 9 years ago), so delete this email entry.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9bb1db9979f1..32f15c2ce531 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22627,7 +22627,6 @@ F:      drivers/accessibility/speakup/
>
>  SPEAR PLATFORM/CLOCK/PINCTRL SUPPORT
>  M:     Viresh Kumar <vireshk@kernel.org>
> -M:     Shiraz Hashim <shiraz.linux.kernel@gmail.com>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:     soc@lists.linux.dev
>  S:     Maintained

This is now commit 3238532ba55c9bf9 ("MAINTAINERS: delete email for
Shiraz Hashim") upstream.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


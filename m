Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB79D5E378
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 14:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=re5YBOZyD0Zj32H+1no6aQeFsI2W9h+rLAtav/Y6K64=; b=F3T5fm9TtSKXlsLE0rFBLpIm3s
	c+1lkOpEgLE3167Se0HYFBYazNdp89+UYAjJDtJDuA5qghwZgYV6s5o0l04+XAy/20QA7ns3/h4aJ
	yGE0nbFBIiRe875LGOHtLP5Xv4tVJlTUAFtwPXU9e5fnNpkX+xBz1ZHmUiDVdpLUPco2aK8WCODG1
	Y66n7I+S1gBfkQxKoSXTjRd3Yjp9KN25XqI1mH+Zb/9U9gw1JJ5MjeYGUUWdc0y4nlFPh85Q3qUBf
	oQYZmrPwHwcZkCvkd6wxMYhszmx48BS6gAHQq5KKsTEawFhUteDvXlXImfhqMFPa1sLqDMQFHJScI
	YRhCLIcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVW9e-00000005Lm7-0FUN;
	Tue, 16 Dec 2025 14:35:58 +0000
Received: from mail-vs1-f45.google.com ([209.85.217.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVW9b-00000005LlT-3lE9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 14:35:57 +0000
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5dfae681ff8so3132558137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 06:35:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765895754; x=1766500554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=re5YBOZyD0Zj32H+1no6aQeFsI2W9h+rLAtav/Y6K64=;
        b=fAbe0nb0nMkEIQ13twKGBfD9QCDfPyKoX76Co5EFv5QliT6yqm/n8yuN76foDzXvvX
         KmP6zC9upR/iQnzPR3ah8BP+4v8ypG3ajcBNgTLKJre6pkGl6by7iVCqEqVVZ8KVRzm0
         CzwIxUWbBn/9rY1mlAmZTL+T2b7DiMQT3bp81vCDFALRHfsHBMF2Mpeil6+HanA8zWI8
         /UmwtAa02xFFQRXf5gTDG+YA39gqu4CRApAj/v8vOaMVs77CRIzrSoUbSagPaTZZCOrp
         d2+/YIhN+ydnYppC0KRsCe8bNw/CAAIjY5JqlXCMgfyqq9zMEAr/6+p/GRM0q7YHh10S
         x56A==
X-Forwarded-Encrypted: i=1; AJvYcCWcHXkV73oNVVM9ftAUu+clQ/Jdbujhhcmeru4sDJqwas9Yc1RnidxBxgAnsVBfgMavA6wTXwSUkzQ0pH7rJVjY@lists.infradead.org
X-Gm-Message-State: AOJu0YyNfzvGD3cLTwHNrblEwXjgQxWjrKoNsgI1cmuJ8/aY7w5bE0/Q
	0VbZP98rP5Ms5p58Fw1NCahh1L08uSQt9Ei2mJEtqgY2JkssL01jP3jRayh/iMy4
X-Gm-Gg: AY/fxX5HpM9v154Ha7UvAv3TOY5FHQ8QptZNhblLy3OxWCpyeaaFN/btKb95WyT1PYZ
	GtukP9hGTNRrjTTV9KTm8gKNYX0b8xznv2e7url66Sk9g/DleIk22Tvdc2CQADjlybc0rjQeAYh
	SWtgjAlEI+iF4UZXTCR9CzZUy+HZ7ZnKKRStfs6CRcLF/9XtJBgblz7hO6ClD3paSol5NQRY54k
	McAtHXXr1H7XaA8LuLa0m7/Q5i6QEMbXjD0VW7ClSoCCzgmu2vHdE9kmrtPmmGVvT2+BsuAa9ug
	dVKBrJyoh5O8cWE+tJ5BqiBveBDaAX6hSxbUU407FLSXWkohICDx/eYDpx8hb69uWVnGOU15bOK
	pK5WUpeJr34WcHSjRCa+WP3LY6hNa935TobNZ8XuYSwAQdf95nQLUDAYAKUzvDnWaj3VPKuuzXI
	eiM/dLA1GtmsyzN5BYzErlV2E44gQkK3abtqRT8jO1CN74y2Y5
X-Google-Smtp-Source: AGHT+IGWWotoej0QVJrfu7dlp/y+1TlxgVYJceTEHjz8D7IWXMIC543Upyas1CG0vDJCZ8ghCg8wIA==
X-Received: by 2002:a05:6102:370f:b0:5df:b57a:ad28 with SMTP id ada2fe7eead31-5e82748f96dmr4701261137.6.1765895753921;
        Tue, 16 Dec 2025 06:35:53 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e7db28a892sm7134379137.14.2025.12.16.06.35.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 06:35:53 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-941063da73eso2644505241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 06:35:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXA/K/iH7RcXPydmqe0e7K8p3qcQAneOjiUoA3NkeKY6ahzx5d770c+aJuELaVAPO+mK5HJuWQoezE0e3BJ3KQy@lists.infradead.org
X-Received: by 2002:a05:6102:5818:b0:5d6:12fc:76e1 with SMTP id
 ada2fe7eead31-5e8276ba82amr4862421137.17.1765895753360; Tue, 16 Dec 2025
 06:35:53 -0800 (PST)
MIME-Version: 1.0
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com> <52068d9c-d677-4fa6-8ced-6a7fb190a935@app.fastmail.com>
In-Reply-To: <52068d9c-d677-4fa6-8ced-6a7fb190a935@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Dec 2025 15:35:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKreg6NcMUK-jvgM=R1Mt=VQPntTrwN-PO-S3fnAUw2A@mail.gmail.com>
X-Gm-Features: AQt7F2rACQpLF79AXAKKa3e1I8_5jvGUOJu5XzdjILbOotHKGddZqOAsNt9CQLQ
Message-ID: <CAMuHMdUKreg6NcMUK-jvgM=R1Mt=VQPntTrwN-PO-S3fnAUw2A@mail.gmail.com>
Subject: Re: [GIT PULL 3/6] soc: devicetree updates for 6.19
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_063556_242266_16648D8A 
X-CRM114-Status: GOOD (  16.05  )
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

On Fri, 5 Dec 2025 at 19:28, Arnd Bergmann <arnd@arndb.de> wrote:
> Three new SoCs got added in existing arm64 chip families:
>
>  - Renesas R-Car X5H (R8A78000) is a new generation of automotive SoCs,
>    based on 16 Cortex-A720 (Armv9.2) cores, which makes the the currently
>    highest-perforance embedded SoC.

Actually 32 Cortex-A720AE cores, which I believe could indeed reduce to
16 cores when enabling dual-core lock-step mode.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


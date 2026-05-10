Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E56CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 03:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sm3QoIzBAGhbdcC7wWKGSnMpeN5ZALJn3udc/iZ0x+w=; b=Nr/xk/uDi83FK9Zbcm/xDAD6bq
	tT5Mt0DuKkMY90u7E4+tkwmFLmoikzSuAVYcBdFLfyhYbJyZNomlW8jTv9N9yFBFncnYis288lGYE
	RbwFlE4WnE94BXllxHWQi7SR+fEKuMHce2D/35qNDT7AdiCvevRdCE3v5JA6sWo7iF3o4ooSNp2Am
	GZwv2qJhODnkh8gPwog1shUHJ3SCdSCKCkcG32gVeHCR3utKRCaEyR94pwsA95fK7HFG5rgMLOfTs
	e2rKTaI/uguYNULqT3H/Ijp2QlHwx8RJbb6zuT2OS5j8pzeISAV92m0w78QIPkkLN72xl0UmB7Jlg
	7B+dQJjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLvGN-0000000A7D1-0Poq;
	Sun, 10 May 2026 03:55:31 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLvGK-0000000A7CS-27Hw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 03:55:29 +0000
Received: by mail-qv1-xf43.google.com with SMTP id 6a1803df08f44-8bc3ef10cc4so37699876d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 20:55:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778385327; cv=none;
        d=google.com; s=arc-20240605;
        b=FJPDI3+NYG2QnAg1tSVJz26Qt3f2pu4SIpfb/sJaWVvdqpkmGUbL5MB3NHwgtmzb04
         06Eig2ifOqWqjuWAhy4NCACd1dhIM7fxrw1fX59HZGCh9mvRBOxL99Cs1MMZaB+Cq/Nm
         Lazw67biekTenJFZMgepP9WT8vqkHnWLjOUEMXJyZWbxymQd5fSJbUxxUSppp5J3cEaz
         UQW0HK5mLMlu1GI4xZ5czmp6/aSCE+1rP8A/ozJ5Q7t24Q4I7l+SxSHCZvE1jAkI0XzM
         g6sWFlMdFa3qlcHIdMCjGuY7MdaKOEODLg92BpI3PWQCovRX1Nys5DiQAWfV45cfbTTI
         gQng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sm3QoIzBAGhbdcC7wWKGSnMpeN5ZALJn3udc/iZ0x+w=;
        fh=k1AHEEWO8tD+o0IAqZX4J2i8CWPoo/qT0wXYhIZ/GGc=;
        b=cDRK+ZM6FbjLQHgWFbk+cMuR6uoK4zJgukOMyigXo3MZg0rnoWzQl7ZlDmDoXsIkSN
         SEwYbPZD32sktY5emiKR3U0eKMqV1AXNEgNwcKZM3iL9cu4yRdTu8vcWBtZkaqrJ+RdZ
         tixyHWrzuwntr7mz6jnsZZu2JJ8ZrbUBqlwwHYTU+va2PpEVPN0PhREQkiAyvQm30lYT
         6uBKmq/MQk6+C8A+WuJyroPuFtVd4J+KvC94RCYNq/LKjJ154MEXrxo6q0yi3ZRjUH2z
         60Nf80l7/kIsf7hoCPkTp9IBFlFsC12Y0XYtCRKRHivmeOL+ptzHLgzHsBdF4/RCQbmL
         9Z7g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778385327; x=1778990127; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sm3QoIzBAGhbdcC7wWKGSnMpeN5ZALJn3udc/iZ0x+w=;
        b=ROJUxyUBroZhFB4WvM+Jh79HsN1ej5tU5IDc+DAI1KtI+HkIek57ytbsyjIeT/Xyzf
         mJ7o+leL8tKhGvUhziu5AS0fyS4JhgnL7tBSYTaxMP0g8FNEZbKHf/WnNJRQ3mQWvMl+
         x1wSSe//TgOnOiJFVg3hDeMBv2kngqhfIGJGpmQQoSVQGOG/iA5iQZRwmAx5PL/GxD4Z
         S4UH8sbYZSeAOFbI1uYPKTmksol08+1FsWgeqSkzqteOyfjuCcjEov1lrP/Gy9KxFXq/
         ghwSF/3EgQXI8I5hpt80FgTARaLLoGllf4o18zK+Mk1GfIhQEvP0FblY20Yj7gZYDTvt
         /c9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778385327; x=1778990127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sm3QoIzBAGhbdcC7wWKGSnMpeN5ZALJn3udc/iZ0x+w=;
        b=EldvDzvO30eHV4ojkox4yGJFcF55xqqR+x5rBm/gEyQk/QwkgHYIMOGrNKu0byJh3/
         AxRS/+twx51o5Odst7NS8rxSEIt+vISrobm13bNKkNp4kiiJTl/gF8Bn+cIUHvRPrJQm
         uBGDhesST4oDPBtHXVa77TzO3YXfF8uBMEGw29K+RXTCETsdMxe5O9neK+qh3xuY9JAL
         RUkL+mncWcIilDhxoJyWeez2uGkYFJvqhbpeuOKZRFWfbu/XeyKJPlf6rmelGEdbYTht
         pCGqsT7RXBxdb5TkiumANI79wJbi5W6CPHueMUeWYo7mkOXEAFH5JZ1LAdZ5VtN74kVN
         nHiQ==
X-Gm-Message-State: AOJu0YyS0LApbLBjtv5Reztoc1t/ZEoOLn68MAvDaKYU22gK+bkrdULn
	pCzXVrrD0TZV/pGNRZXDxuJ7jZNNXnO0xybRfQxvI5F0g4yBJmAxWv9DyHQQ/Y0Ylmo4BN4Vpqc
	3G4jx8ucunu54JAx6bumWu+42kwlWFTOKSv/UHc7k9w==
X-Gm-Gg: Acq92OH/fOB1jkcYeDlas61pumXi4rsf8tx1QeLTtWDOzXrrtVTjuGrvcM7HJm6U4wb
	3JkvR7c+vqPXpj3s3KLOTF72wOGCGEAQKQ1ZDwgpl+UXecoIYlVvg08GfBQfk5bEMcbsVzLgkFx
	yp6hHCxX5lYqW3NDPy2nZ6EuviKaGugrUXkZkFyYjIRAB5EkD5vsYnQoOCSyByBwwezAimH20Gx
	nY8BE6B0a++9fnP5q42XwgqblWSnvBW7fzJk5Yvha6kgrDNKPTgnB0meup0xx9s2kHKHFA2sb9k
	3P6tVlXjzqvN+2gFuvG6/OM7nxdGuIZyxM7ADkxfQH/xqkrZ8Xe5AoPbywDPZ99NNrik
X-Received: by 2002:a05:6214:468f:b0:8ae:6d63:3066 with SMTP id
 6a1803df08f44-8c1af2eec23mr74681536d6.38.1778385327146; Sat, 09 May 2026
 20:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260510034652.349166-1-enelsonmoore@gmail.com>
In-Reply-To: <20260510034652.349166-1-enelsonmoore@gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 9 May 2026 20:55:16 -0700
X-Gm-Features: AVHnY4KHAcxaV8_IVOk9z2g6T2k_L88IWIdSF--hWqkOCrjjQZ05MhMkD9iMeTU
Message-ID: <CADkSEUhTJnHJUTtSrcKAuG2506OexCEFxVAvZ08ThkeL=rnDBA@mail.gmail.com>
Subject: Re: [PATCH] ARM: riscpc: convert to sparse IRQs
To: linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Walleij <linusw@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Weissschuh <thomas.weissschuh@linutronix.de>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_205528_557350_3AD421A6 
X-CRM114-Status: GOOD (  10.79  )
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

On Sat, May 9, 2026 at 8:47=E2=80=AFPM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:
> This commit depends on my previous submission "ARM: <asm/floppy.h>: fix
> build with sparse IRQs".

It also depends on these commits, which I neglected to mention,
because it modifies the same sections of code:
ARM: riscpc: use iomd.h everywhere and remove redundant ioc.h header
ARM: move Risc PC-specific <asm/hardware/iomd.h> header into mach-rpc


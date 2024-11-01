Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5224BE6F093
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 23:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VzRJaN+NnnqiUSxsGtBb31nGUad7BtmeUsMPMIuqsY=; b=OPizzQrBjxlPWtPmt8H1fVBzq0
	Ml0GKu2ZYCBYBUY3O1+GYpTmUQHjj6JMXZnRzdAbbxzsaejnuCkq2u6BB6k1TPdsS5idxFnnwBetM
	kENGRffSdSZmzYDh592/M/C7hASteEWpnB1uofeOPGaLl7QcGVrmJ3KnsSQ/lOdXWS1fJA1lApIHJ
	Z22Oh/w2AKjicIIEdc1epXfzeHfQRpFHPrHk+7k+Nj3sUSwTntyfWrTm6xlsW3gUJuTKQCn3TtekT
	XQr6BcKfOuim93CRe9ceiMZBtnTt821sM5GDiC/hqhCocsUX18Xylb9TablXbBRA3jtocdZN9x1IN
	Xh/IzI0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t70fT-00000008VFR-3TDY;
	Fri, 01 Nov 2024 23:02:59 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t70dn-00000008V6v-1hXJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 23:01:16 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2fb584a8f81so23294351fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 16:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730502073; x=1731106873; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VzRJaN+NnnqiUSxsGtBb31nGUad7BtmeUsMPMIuqsY=;
        b=vuY1o4E0tR6VPUfgO9ySgfl2CvsZqBY5kud12Lm/zC4483yPe5y+FNWh6u0b+TK+AQ
         SFlS8idDhQ2A2y7Kkf7dkq9J39W2ztv9aoug3RDc0tBVlZsytZwFVroeEcsbO3wQzYtR
         DXo60vDmSIgyaNE/zb6S5vJOtwfdt/WXyug4R31Bg5RvSNdvE6umDD0oGGhmujQ5YsJi
         ShDsOz36tSuOrK2+6coYPKGpXF6NfEJfbUlWq10W1Hu/QwcfFVeOQ9L+G7TLXzV1/zOd
         969sA2WbbSGUyhYlOHzX16+lHnJh8/z12NPmkeGXV8Q0xxxSU6rqkcswmNlgVxhlf5uA
         YtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730502073; x=1731106873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VzRJaN+NnnqiUSxsGtBb31nGUad7BtmeUsMPMIuqsY=;
        b=j+JyYIqVoWqeAGS6K3mg8NQOW2MLrNDPk0lZJLIH1J/Aco7KBpFVR0NaKOBKmLyCvs
         4JbLEDoZFSofo45vur7qMRspa7EnaweXsAOapH1ZG9KtmvugeIJoEfao5LTQvSEb8mYc
         Hwl0CPO5Txm9nFqawvHrFiKWSpz3NxQMJD49Tyo2k9Gld2upT62Q/ZVlYM+DjLUfQ/2z
         F/gsCe760RqJqrvvJuJgS6JXTBFpCS5FtChMdu5cvZm19018xBuYr9pM44FpyKYZGF7V
         QKiTENZZ5yTnoqv3+q+XnXthkww4D/GXLpMLaxwaOybutzmmFDJrCdYcDUo5zkktfI+2
         r2WA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ4eGgvBqTAE4tSMWAvNrL24PAoLVsCEwiRveJKPm/zYQHjHVWCNCvHLdBw5hTeNxX2j3lGvyg/wbI7MP9hFmb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8QSfEadt3d1gLTTCWfFKkXlVpbegDl1u7kjqt07u3KHXsUat5
	LoZ+lJq33pXgKzNA7VFb4pPtssguku6rbZYsgOhCkNFdhUa2Py03vKnAWTCaCKupISDFr+JViT9
	vAaj3ImE5aU8Nt7550SbpJSXzqB3jvWF42Jecug==
X-Google-Smtp-Source: AGHT+IHUrFtSs2KoJie/ag5U8LaXZwywnsQh7l2YsRqtTFXJcYBaKb8KFr8549S9dDV3k+hWD/NftGFkeCKXktgctEU=
X-Received: by 2002:a2e:6112:0:b0:2fb:599a:a900 with SMTP id
 38308e7fff4ca-2fcbdfb978emr106638791fa.15.1730502072547; Fri, 01 Nov 2024
 16:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240629085601.470241-1-ruanjinjie@huawei.com>
 <ZxEsZBvsirXJz2dT@J2N7QTR9R3.cambridge.arm.com> <Zxevfe-PZgB_Z8hi@shell.armlinux.org.uk>
In-Reply-To: <Zxevfe-PZgB_Z8hi@shell.armlinux.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 2 Nov 2024 00:01:00 +0100
Message-ID: <CACRpkdZjRpcA92FARSXLNHdSBLxaNwvG6N2ZJPg8NK8cprh7UQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] arm64: entry: Convert to generic entry
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com, 
	will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org, 
	luto@kernel.org, kees@kernel.org, wad@chromium.org, rostedt@goodmis.org, 
	arnd@arndb.de, ardb@kernel.org, broonie@kernel.org, 
	rick.p.edgecombe@intel.com, leobras@redhat.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_160115_493416_0BB61024 
X-CRM114-Status: GOOD (  17.57  )
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

On Tue, Oct 22, 2024 at 3:59=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:

> So, I think it's important to always quantify what the impact is of
> any major change to the kernel entry/exit paths - it's all part of
> properly evaluating whether the change makes sense.
>
> If switching to generic code causes a significant degredation in
> performance, then that needs to be investigated and fixed - not
> waited for until someone pops up and eventually says "hey, that
> change to use the generic code resulted in our systems becoming
> much less performant!" six or twelve months down the road.

I agree, I did some measurements for the ARM32 patch which is
in RFC v2. I ran:

perf bench syscall all

This issues 10 million getppid calls and measures how much time
that takes (on a system with some background IRQ noise). I issued
this three times (which takes some time to execute) before and
after the patch set, then compared the best performance before the
patch with the worst performance after the patch.

On ARM32 generic entry costs some 3-4% of performance overhead
(increased execution time).

By chance I discovered that PAN (privileged access never,
CPU_SW_DOMAIN_PAN) costs around 400% increased syscall
execution time overhead (two orders of magnitude more than generic
entry) Debian apparently turns PAN off, maybe by mistake, maybe
for this reason. I was a bit surprised by it, I don't know if I made
some error in the measurement.

Yours,
Linus Walleij


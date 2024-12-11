Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7380BE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOQcwnwJSdFL36S0cYmgulVJqIFn4KDwKugZv4rxk6w=; b=R7hgcYrZlTef9HgrSAZnvdMeC7
	cGvgH9FslTu+0+VJDL4HgcpnTTPBbc8aFYqZ+AUQTnGX7LQ1g+ae4vVpbXXHKdGtaH+Syr4iVupct
	Ecd+ybrXMIv5N0ejjFKhfHdDKuII1AhdyXH3aaBr8OyglpbQ/0EjVZx8VB9+dc91W98cKxwBcVc3n
	RBXZu03nMMmZYMBtV1MUDVWeQbqe53/dLhSlZBF2UjM7aglJ1qfXRBjUNLthfbr4Ns2wuPbY4pks2
	9Ck/TvwudXtU1hxB88VsJGLyK9/fr+B/nygpJu/6GXUPVXm8rOrPQWDCMzCj9ui6apeAjkEjTbpud
	sIt7hftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMrb-0000000EzkV-2nRO;
	Wed, 11 Dec 2024 13:34:51 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMps-0000000EzNA-0vhB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 13:33:05 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53df80eeeedso6423571e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 05:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733923983; x=1734528783; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOQcwnwJSdFL36S0cYmgulVJqIFn4KDwKugZv4rxk6w=;
        b=L3A9T9oBsZOZjUkARCuNBT+yKjLIYiHc02KpowKBBSo/mO7d5vmMhRq38Wz0mDWnBT
         gsuE5jt4r3Nd23VVAa9YsQXjXmrsStRMG85vjEnXUwocTJmmkZqHDSteZwxpQ/3h6tZf
         d+5/+DKjxSd0tLHrVwmW+UjEqi/Qf8lIg5SZNASWTACPFzCBitLSeNo8BQ9j7S7lrMJm
         cWK9GJzYebJJrfvMHWNDwM/hMOkdcFwk5xpnP0vAMoFRTBCqZaBjjbuI6FXUsyFg1NMx
         0Tb8FI9mazbDgSnebuBw+iFF9t83JOdMyUxcVHxFxT21KLlkq8LqDVYB8l/wvnD7NAW+
         z5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733923983; x=1734528783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOQcwnwJSdFL36S0cYmgulVJqIFn4KDwKugZv4rxk6w=;
        b=G2B/GcrW8IAnzFaOngB2zVv2Z4CSJeNft/5FHyRIZHqyisoX+HLfM0bzQ60BrYB/r/
         iQGMbF6gl7iaIkC84bOHX+Ow9owpwLt3t77030SavENHi/Ha6Qh8k2dklSUzUEEQRjCR
         Eq2xiu8QYJIsPvuFu6laztxeEC1GZTDZXRY8hyeI6XYQN7nraTrd07YZovRRevrAMaIr
         qi4ARlN9xjV34QeD/leMT9+C6Z3xCg//OLZpioECyLzq/mDu2YvNiQB6wj9JtS0mjR2H
         Z52WxXCTFQIJLBM7iaE5710Z/Z9rgdpk461dOnpSLP6VUmlRH769Sic2JvNnN0CA+Zuj
         lI2Q==
X-Gm-Message-State: AOJu0YwHMcX/xLldqID0Ke1IO4+A1SfxPxQcrQsUjLGXEz+d/G339FPc
	m7p8BEailPaarYRjXulMvRfoaWZ6x/CcQOMFg6XuSt5PrZPPdvybfxAiATvACDldUK+qDrydI3j
	Y54v0BnDyyKO4y5iyuizZA/36wXQ7MguPdGo7Zw==
X-Gm-Gg: ASbGncvUEpTnm+NkYeEIZBnzUsdA9bJ32vDQGSiF4/eQ6JPyEma8pNco+CYZ0wdlUOL
	Pt+nbUSVSJ/ysva3vdoVMiu66Y8i+pkOlxw==
X-Google-Smtp-Source: AGHT+IFSR1UjhXcHcy5k6a2CNcZJuWgxkaipEQM/YpWhqPeqodiJy0P57HJau7brIqv2XFjLP5RpxZwdcMO+4TzEqjo=
X-Received: by 2002:a05:6512:10d5:b0:540:2223:9b20 with SMTP id
 2adb3069b0e04-5402a609ac9mr779864e87.53.1733923982633; Wed, 11 Dec 2024
 05:33:02 -0800 (PST)
MIME-Version: 1.0
References: <20241210160556.2341497-1-arnd@kernel.org> <20241210160556.2341497-4-arnd@kernel.org>
In-Reply-To: <20241210160556.2341497-4-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Dec 2024 14:32:51 +0100
Message-ID: <CACRpkdZoRbJ4DwRpZQMKbEAvzg4AAdp4B+94SFLm1ssiQmjUwQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: drop CONFIG_HIGHPTE support
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, 
	Ard Biesheuvel <ardb@kernel.org>, Clark Williams <clrkwllms@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Matthew Wilcox <willy@infradead.org>, Peter Zijlstra <peterz@infradead.org>, 
	Russell King <linux@armlinux.org.uk>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_053304_268922_38ACB879 
X-CRM114-Status: GOOD (  14.01  )
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

On Tue, Dec 10, 2024 at 5:06=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> CONFIG_HIGHPTE was added in linux-2.6.32, a few years before 64-bit
> support. At the time it made sense, as the CONFIG_ARM_LPAE option allowed
> systems with 16GB of memory that made lowmem a particularly scarce
> resource, and the HIGHPTE implementation gave feature parity with 32-bit
> x86 and frv machines.
>
> Since Arm is the last architecture remaining that uses this, and almost
> no 32-bit machines support more than 4GB of RAM, the cost of continuing
> to maintain HIGHPTE seems unjustified, so remove it here to allow
> simplifying the generic page table handling.
>
> Link: https://lore.kernel.org/lkml/20241204103042.1904639-8-arnd@kernel.o=
rg/T/#u
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I'm in favor of this if the x86 patch goes in. We need to get rid
of highmem anyway and this will need to happen sooner or later
either way.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


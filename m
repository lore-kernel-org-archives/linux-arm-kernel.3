Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1AFC71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 01:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGEWNsQ5j/mjmaHh6MRpcJbmJ1LgLRm18UKvC2wuTys=; b=pQyDN1dbGnNlwlTG4QoCykOtPl
	l5EJPhV3Xz6Mk6PJuNpho7xkcDbn/h6FYZp3/XTj/IC7pdfgIztmtY+ojQ12A1XEjsB17OGanYhnY
	y0kxSgxWsNSanOCe+W34BVAryML3CAycp5UFQDIlS15/LDrAsTHct/pkfZybftOJvZjg3Kz+K/q8b
	ZHV/+0GJPdwm8n+cOma6TM6dvSKNGXY7kihcNnWu4iOpnXdAYOFEbPQZEHihVWp6pCkMZGrUg3vtA
	vyALxiIa7+0aGfS9pSyb5sYpwZ0k8pv9eTEePbSsTQS8wQA2qKDIRv9C6h8/Mz6WGVXTdY70Zjgjb
	qXbjcNuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYww6-00000003w4I-1FWR;
	Tue, 08 Jul 2025 01:15:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYwto-00000003vrF-0PF1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 01:13:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E76BB6000A
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Jul 2025 01:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD20C4CEE3
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Jul 2025 01:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751937209;
	bh=iPodmZohmSa31e+By01I1tCZZleFo6T1wFvi9no0O2g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ucErcMOWnScg0VJtBHtMIuIwnc4gOBW3HGDeqvukg4nA1IZNaGGPFoo5j2IzLE5d7
	 A5RCasoCOF1kpnM39cMYE1A112pn+BdrKaWSD9UQ5/zbOBy4UjpJcAoiP7ML8RHFUR
	 SqN0Nc5Z0RbOXylJcPiGm22m4HcMeKvYewOMdNCvl4IooVRRZwT3xKUR5aQn6iZ0wk
	 riZnsbHsyP3UH5z3ItHjfi1q9Sn9/HcwFKoljkJBCgiY3vpP8Yma1O//BuBbx366Yw
	 GQbUB3otL04evcUdkGdGFDG/bALGNDUrYRFKFlepZCS1QjaXKVvnMbpaLTDucIdeD9
	 YNitdUsp4gdQw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32ce1b2188dso36355491fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 18:13:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOX1Gvi2vcXBq8cCKXr2CE1mPlRRIVuLuMwmdOoHNgVRS9wxWJl/I2sSTKPoXNCV3nXcRF4wWetZLp894dvPB/@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu8KqGcOfPc4lLI9CDwzmxPmMrjclMJ77QXRB0KyAEL02LyIzC
	Xo2d7zP3tfHNrJvQQI7oLu/j4EjmRGo1eAJszf1w0yNecDyrkpKnbgFY6XhBBj9cwTSW9JItfKl
	/3FecO4eR+p/ceQgEoY+hAbCamnWYu2Q=
X-Google-Smtp-Source: AGHT+IHfCFdtnG1WPE1YHD1I9AO09IXZjLeoSWqh/sTSdfozG/IHbenZmNc+ALg/MxWLMeyzI2SRRpUrdsXlwPkt6P4=
X-Received: by 2002:a05:651c:41c9:b0:32e:deb2:f75 with SMTP id
 38308e7fff4ca-32f39ad0a8dmr1664961fa.23.1751937207992; Mon, 07 Jul 2025
 18:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
In-Reply-To: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 8 Jul 2025 11:13:16 +1000
X-Gmail-Original-Message-ID: <CAMj1kXEjgFarhn4FNOMfCfrh1_DR9L-MNZBiZq83pg2i=RE08A@mail.gmail.com>
X-Gm-Features: Ac12FXy70wEa8uRpKo6gT5MueTy0Q2ZIgEQp_8wVncqO7RC_E0zDip1k6PBM92Q
Message-ID: <CAMj1kXEjgFarhn4FNOMfCfrh1_DR9L-MNZBiZq83pg2i=RE08A@mail.gmail.com>
Subject: Re: [PATCH 0/8] arm64: set VMAP_STACK by default
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org, leo.yan@arm.com, kernel-team@meta.com, 
	mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 8 Jul 2025 at 02:01, Breno Leitao <leitao@debian.org> wrote:
>
> Hi all,
>
> This patchset select VMAP_STACK on arm64 by default, and cleans up the
> code by removing all associated CONFIG_VMAP_STACK conditionals.
>
> This is a suggestion from Will Deacon from another discussion[1].
>
> With VMAP_STACK now always enabled on arm64, the code can be
> significantly simplified, reducing complexity and potential for
> misconfiguration.
>
> Overview of Changes
>
>     * Remove all #ifdef CONFIG_VMAP_STACK and related runtime checks
>       throughout the architecture codebase.
>     * Replace runtime checks with build-time assertions where
>       appropriate.
>
> Link: https://lore.kernel.org/all/aGfYL8eXjTA9puQr@willie-the-truck/ [1]
>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> Breno Leitao (8):
>       arm64: Enable VMAP_STACK support
>       arm64: efi: Remove CONFIG_VMAP_STACK check
>       arm64: Remove CONFIG_VMAP_STACK conditionals from THREAD_SHIFT and THREAD_ALIGN
>       arm64: remove CONFIG_VMAP_STACK conditionals from irq stack setup
>       arm64: remove CONFIG_VMAP_STACK conditionals from traps overflow stack
>       arm64: remove CONFIG_VMAP_STACK checks from stacktrace overflow logic
>       arm64: remove CONFIG_VMAP_STACK checks from SDEI stack handling
>       arm64: remove CONFIG_VMAP_STACK checks from entry code
>

For the series,

Acked-by: Ard Biesheuvel <ardb@kernel.org>


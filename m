Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0006EFCBD4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 08:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8w1ZWnLMf6F4C87k8bElJ70YpWAqTRI9KRHLM4iWmQ=; b=Qvu+MDRJglXqMZOwoxXUFt+OUu
	ssAqQzSomCNOpE0SwG5EkJ02j3cvn/qIMuG+TSPJ2A7DVEWDErPOJMCuppURKHdF31UhfmT4hkMiL
	V92pB+3qWym18arRPFDgXrizp58/EqPJYPlymvH/yPdxM9UmBWqUgGWtRjRiFVEcYuRvZ6zD2U84A
	cLDXhuwRg9vnOljD+9I6L+tuKHbGOUJo27okK53IlY6WsOxQ5ZyNlflgBBdaSzVWP85C2wje/ZKKA
	n9goT7Jq9TKGeM4flDu/pyGEkWwIdG3tKRRRloS+oxpd8ab0PipXl4bSBThSanK6DRym9z2CkHvFp
	uN1UAmeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23Ga-00000003YPh-3BMm;
	Mon, 16 Mar 2026 08:25:36 +0000
Received: from mail-vk1-f173.google.com ([209.85.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23GY-00000003YPM-0l5g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 08:25:35 +0000
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56b7fce3ae6so1025971e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 01:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649533; x=1774254333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8w1ZWnLMf6F4C87k8bElJ70YpWAqTRI9KRHLM4iWmQ=;
        b=SRph+ksBfRZvkiDbkqiaJmKX4NoPp7gj48zw9zNx8B/I0sfyL0k8TfcF1Mcvavuyrv
         oSJ4+AKacWfeCVYpgGttaptfPRsYRFK5NW0Bi00uaATtcZkecWJfQcOhG05a6FNiV/Pj
         NVEguAqIL3VMrkvhnlIgxg5wQV8F3znWjRWvrTGL3K0buFdmLV0dT3XR8y1hVcLVDBau
         VlzkQbiVTSwGAMdM4m4x/4X1pj0s9ofan1bvG17ngLlE3QEKBzqobrgvJI9GYt+tVmAr
         8qOIc7SUklhSfqJhIXu9d9tmDplJNq/0W2znuU8VATd3fit/M3DgurYRVCg6Bcdcg/ni
         AUQA==
X-Forwarded-Encrypted: i=1; AJvYcCWV+fWuSrWy6MgcBFaD1z27Y/gcFvKa33LNDKNBq4ywbG3tMyA9HAxlAJwPLPTwlhxNz4Ur+C54+2f7hBcVX7UN@lists.infradead.org
X-Gm-Message-State: AOJu0YxD9bv4K0svcM+sn/hKKEGVf4u34uvhP0UPh5tuCZeof24+EHnX
	Qd+y59zXw/j5TytzJq4YTiR4PIeiem9mHWhpTUqgAKdJI6kEORBaYVsLALw0GiuP
X-Gm-Gg: ATEYQzxZ38tj/N9EzX6n93o75D1izk8l8EQNwFF48uwawo1BXiQjLgAsuPwpxqp1bbm
	NiEoEJdZzgXq7wMbjwUl0aSfQi40Usa25zyZr5H5jL+hK4ZxSE6p0Nmegy/Z4FRCDw7SsDytsQ5
	epKll3oUDKCNIEHNfDZ0Eek1mqzhcQG5ABP5JAxcDoZAcd1dERrV7TfTUPii2Z1yIQhTzxot4x9
	dnBs9Iu4M4wfD6oGT03x1AQmm/FjtOdzT7fUBNHLx6H9A2g+iO8M4Snvn8gO2D/J/5wWaO4JDWu
	rflJwDAUtVsq/fji6NkjvUfEfij49tviOqhTkaBxZNqs5HOGV0b/R0WaUI9BxxrfNQq0BfzXTuR
	BywhiJIl7OkyC19pr6eeJqWDJiffA72Es9NTAmKveiISZJas/nMc2n3bqE5pHP0qQI2WvSlca8D
	tSNvOXv6yVivYacHwpzGPKwuh2J0i55bX90xVN+6+kC/OAy/24dfzCahud0PCQ
X-Received: by 2002:a05:6122:6581:b0:56a:e974:8e9f with SMTP id 71dfb90a1353d-56b52830f93mr6006840e0c.9.1773649532575;
        Mon, 16 Mar 2026 01:25:32 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b464c2924sm7466316e0c.19.2026.03.16.01.25.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:25:32 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5ffdd9a6155so4402393137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 01:25:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgrJ+RQAlUlpSB7FRlkWEA0Mz9cq985p/NaUisB1kyKIb+TZyooGWg918/avm4L/1nUc9dLKFsT+23IPYB2KpK@lists.infradead.org
X-Received: by 2002:a05:6102:6ce:b0:5ff:bb36:891f with SMTP id
 ada2fe7eead31-601f4ab98d5mr6344003137.20.1773649532209; Mon, 16 Mar 2026
 01:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773399669.git.geert+renesas@glider.be> <cover.1773399675.git.geert+renesas@glider.be>
 <44491e75-4c73-4c8b-bc34-888d1e047cff@kernel.org> <CAMuHMdWLOCvKfp4bULzm6N_3u1Mh831Z0EW++8473wvs29MRHQ@mail.gmail.com>
 <b5d2f9a6-8039-48fb-8d7e-ee7823c504e3@kernel.org>
In-Reply-To: <b5d2f9a6-8039-48fb-8d7e-ee7823c504e3@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 09:25:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9dNT99N2UWbh+-YTdhafQtBRz_xE7iX2pA2O+KC-eiQ@mail.gmail.com>
X-Gm-Features: AaiRm51dZoP08rSkEPZA2qRhTlGCqYmiKD1mwKQ8Vzj_OaeTy2G1pzJ_lXZLAZU
Message-ID: <CAMuHMdW9dNT99N2UWbh+-YTdhafQtBRz_xE7iX2pA2O+KC-eiQ@mail.gmail.com>
Subject: Re: [GIT PULL 4/4] Renesas DTS updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_012534_245699_F904BC3E 
X-CRM114-Status: GOOD (  22.17  )
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

Hi Krzystof,

On Mon, 16 Mar 2026 at 09:22, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 16/03/2026 09:18, Geert Uytterhoeven wrote:
> > On Sat, 14 Mar 2026 at 12:23, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On 13/03/2026 12:13, Geert Uytterhoeven wrote:
> >>> The following changes since commit 85c2601e2c2feb60980c7ca23de28c49472f61f1:
> >>>
> >>>   arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers (2026-03-06 13:15:21 +0100)
> >>
> >> Also nothing explains me what is this, IOW, why this is not RC1. Pull
> >> request email has place at the beginning where you explain such things
> >> and I can easily locate or understand the base.
> >
> > Let's readd the part you cut, which is also present in the cover letter:
> >
> >>> Note that this PR is based on "[GIT PULL] Renesas SoC fixes for v7.0".
>
> Ah... no one reads cover letters :) so I expected that information here,
> before the pull boilerplate. I guess this depends on scripting, so it's
> fine. I will look for cover letters in the future.

As I wrote above, it was also mentioned in the PR itself.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


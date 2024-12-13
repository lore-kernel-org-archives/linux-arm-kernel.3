Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8DDE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 01:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXUuxYw/zq0YWB9TTZm2iQpmEhsWgzTOwd/QbpTSb4U=; b=tP4zX4ntRIkclS/if3vmjrXBkg
	CDUDHxo3JzXdATUmgS+NVr9ziCdKrS3D7bISvbFgVbFpmZi7N2tuqhDFATco8/DE/xAY4VT3VxuGW
	vbyd7FPUrvdecVep2OOeqjJqeAZ3htqIQJfNC9T6IqlkXUyOEeDk88CfnujtMI5VHldupw2zLQK9C
	osL7dkTdm3MBzDouMUmScQLmxnWP/j+6NFWqIvRPwvUgfvx66mZ7hpfj5VJO1rL+HxbAxhqJ/1XWB
	j7HW8r14uHwN4+z1EPuVgUfD/7Tome5x0A/7I6qrxVTRzgCKkh6JbU9ScOOC8jaXrGUBsdueE+L5K
	VsAUWxDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLuVm-00000002PT5-2YYg;
	Fri, 13 Dec 2024 01:30:34 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtWS-00000002HRz-3EmO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 00:27:13 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so1230569e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 16:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734049631; x=1734654431; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXUuxYw/zq0YWB9TTZm2iQpmEhsWgzTOwd/QbpTSb4U=;
        b=g0GGRYb7aBU3MdpNmENBUudM8e6G1+ba+X1rSJO4KbJW49lRFpxjVoWptDYtO49iGP
         w8yCRtO/7obHMCBZqEHVOWv6qIgm11zoRv0k9lLySjmcZuBrgsf5k7yY8kL0cJfN+3cu
         cJm1H3uu42BQEdbAwpMJeogM466yssZ42pW7kAtC01/omuukjjSWP06CKLiXnZ+z26OW
         ORndBgY57nyF1tSJVmZuH4k+mZGerlD3XWqxp1+G2pO+ma7Y4e+ZvVpM+gzDbiSS1sJh
         eR+dUVesZW1OxihP+YQj60DuskvjEGpaiY4/df6NPsAtmHgWVcEgMkosLAxeVH1KBXZf
         p5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734049631; x=1734654431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXUuxYw/zq0YWB9TTZm2iQpmEhsWgzTOwd/QbpTSb4U=;
        b=VlbXCLsibLrDIASKVeeZuW2Cdz1i0c+fqwjOl8qEquvgTKpNN1ELB/qqFFTGVQA/Fo
         cQ7wJBmhOOPOm5wu3vhvaymkC6hQuYUnIFlPCA0OtWMJcKsPhJgPJjaK3X4auBjgYCN1
         sah34xZq11PCZw/AjeI0xLc3UseaamgIza3BngcCDK/kJ1bbZr2eJSe3fhJiFBmUtj8c
         vPJ+s9Zj2On6cqJWg80poVcoLFpLVOZvd1L6L39NfbCEh3ORtfKUjOCKaeylakqnU2FS
         l6RGMoE9DtxRxRo7/p3RVDcyXG2M6qDdZtpjqI3X12WHPrhklGIWqXFPXBqhhnuv0RIN
         jeIg==
X-Forwarded-Encrypted: i=1; AJvYcCVqoDVtxVcnhYp0N0el815URCGUj3h9k2W9P04U6z2SmmKjImMo67Cm92BKamvWbUEPr09VoN2+wGCGPdTGiCt4@lists.infradead.org
X-Gm-Message-State: AOJu0YxgFGPX40n06FM7nsA3sHlmC70G37IWHm2zI0bNzOCOfXYD8V72
	6ig8Tn9MrnXP1bAfIydo8CXc8uumI1sIBq134a53pAfL0mBNB14uVO43Xe7PHggRwmfekRGb3Nx
	vfBEZOM+Vr8QJQXUittNadi/4YAxxJitXWySqMw==
X-Gm-Gg: ASbGncuUeZtrkn+IydvCQcFGUW2F8+j1hcrzVLMV3F5tPWAER1itXUiBmzR5ZbF2idZ
	LEhdmzYrH3ThxWbWkgb13F5yP7Y6ZbwYwtNoC
X-Google-Smtp-Source: AGHT+IERxfeFHnzWGjnXWaunMgWNYVqkpPBsLMjAfHFuRIKYyNJQAYs2iiNndqzYqxmZbY3OMdZCdjicGUrYBZW+yZ8=
X-Received: by 2002:a05:6512:1053:b0:53e:bedb:867f with SMTP id
 2adb3069b0e04-540905aacbfmr97792e87.41.1734049630826; Thu, 12 Dec 2024
 16:27:10 -0800 (PST)
MIME-Version: 1.0
References: <20241210160556.2341497-1-arnd@kernel.org> <20241210160556.2341497-3-arnd@kernel.org>
 <CACRpkdZaoD2vqbCi1AFUa6mF2_=c3Nu4R0CvxFAep0VMgtMtOQ@mail.gmail.com> <20241211152257.Igx3aT2Y@linutronix.de>
In-Reply-To: <20241211152257.Igx3aT2Y@linutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 13 Dec 2024 01:27:00 +0100
Message-ID: <CACRpkdbYU=Txm0zUWDWvNXA0JHRNGpy1ccy0zQdiBb2Ya+UBFA@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: Disable HIGHPTE on PREEMPT_RT kernels
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-rt-devel@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>, 
	Clark Williams <clrkwllms@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Matthew Wilcox <willy@infradead.org>, Peter Zijlstra <peterz@infradead.org>, 
	Russell King <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, 
	David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_162712_823121_6C6A532F 
X-CRM114-Status: GOOD (  16.22  )
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

On Wed, Dec 11, 2024 at 4:22=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> On 2024-12-11 14:29:29 [+0100], Linus Walleij wrote:
> > So fast GUP is supposed to be lockless, and should just not
> > have this problem. So it can't be addressing gup_fast_pgd_range()
> > right?
> =E2=80=A6
> > I'm more asking if HIGHPTE even acquires a spinlock anymore
> > as it is supposed to be "fast"/lockless. If it does, it is clearly viol=
ating
> > the "fast" promise of the fast GUP API and should not exist.
>
> This is lockless on x86. The problem is ARM's
> arch_kmap_local_high_get(). This is where the lock is from.

Aha that calls down to kmap_high_get() that that issues
lock_kmap_any(flags).

But is it really sound that the "fast" API does this? It feels
like a violation of the whole design of the fast stuff.

Yours,
Linus Walleij


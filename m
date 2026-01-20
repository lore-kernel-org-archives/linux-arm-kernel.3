Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D32D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 09:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zxb0bCjWw+8Tx61kop8UU9Q6FPDuxjKBr+a9QDCVakE=; b=vr8AZ5EWPfIu9kEqK1APnmdMXK
	Gxli2BiROEXLfMXA/9g90shTfjiT171YshhcmIuG50xpN9AAvaw2oI4DOnQmi5vn0Ac7A+gHAYH5X
	Kzm0kWmC03yDsfK4F2zm4KkP6YevjnINYiPjJSCZOoLUN8Qg0E/xUybNTFeWqM8wf9V1ilUERnknK
	BwhN6qyMjexkGnLri3fWiUsO/Qbcy9Xa+mS301bMwJpyeWTYpDBM5T3QDVKqM5Z7vWv9MDuuBzKhf
	hIhe+oq521j8mhJ/58ucWBU/iHzu7/3upQsa29Wx+lI9WKyevHGE5Dvx4oYS5JSYQ6TUt+3lJBDqR
	7kFQx8wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7gW-00000003VPC-01xD;
	Tue, 20 Jan 2026 09:06:00 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7gT-00000003VOq-13nC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 09:05:58 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-50299648ae9so1254881cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 01:05:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768899955; cv=none;
        d=google.com; s=arc-20240605;
        b=PjlIlsQYWwFF4DKudvGLbp6vBmMX67G1XrUGRLl3KRN7x5o+XTS7HAEKLDwwkpnMTd
         D3KKIwskyRjDe//zRzLkZZt7YQhATBZAEdXtyeJzOeTmcUWM9lBYnXVjiCKAzAcmAfKo
         OWgRc64kmbPwjh/7mU7GIjiMDtpMfbmtdEE7h00IrwduGwK0s6dlOBI2Ldo4nco5XQxu
         tSVxEI/hp0pVyGOTOUSZvVnZwTKuhYk6j7jKTBp8IAkMoZa14fIGwk4+c9NFgm+yfJ+k
         UPZtwstuFb0mjM+MaAYvR83uGf67ZDfd8knzIzs0BIsfeZzWeQuXZdTW9rG+1BND3bcz
         Kwvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zxb0bCjWw+8Tx61kop8UU9Q6FPDuxjKBr+a9QDCVakE=;
        fh=7Wsgzhez88Kz75JT8D9n+JYmJkW+0zSxyrmGtGFo4m8=;
        b=KvR/0YFJvNZLIRr+zbDgpNh1gX4UjC0NhnCkjGGIPJ7sFwYkMjMshj5m1+R7eBKVK7
         FSgD4bX6F3LxzLuKNeTceXX24fCIW07eMQcOt8/ROnsAKFKM0NUmHemjiKewWmFOPoOT
         d+4TCNeL5rMUjKNsLlujEPe24dTiq+bs6JklpTKowVxiXE4U9Rn0iXyG57aQbNtMETQK
         1cC8R6F4VW0zzWyEWmttE+AvvBENT7P6jkUlZ9m+KdjzymS629C+kfWBxk2m4o7FbBrM
         4aaXMNch9VvdfWxv2hQwnC1CLcIE5b7Am4LTupwrjPHo7L9HKpP8CACSlHTzH+QFciLv
         Z8dg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768899955; x=1769504755; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zxb0bCjWw+8Tx61kop8UU9Q6FPDuxjKBr+a9QDCVakE=;
        b=uJqkXq5/UyUrbb447ceWPBSLm85DWXlCyfDPRwGdzf71k+qYjsBLqfgv09LhJHstzn
         qhwlcemODGjxRhLWiW51g4V0KFbQJpS9GhHFOnU/u3X7CsaE1fpYKUmfIBncTM6fZVbO
         JJKf+EJw3gEGUpXUF/eYNTUL0PKpMmyxMoRfRL8pny2fG8/dhkREHLmbhzeiPK8QYPsc
         JnMaAdqUIPb7Ws4cQj2WRgV6TdGc8H3forBSricgQkUHOEtul1JP2SD9AknvN9sMFn88
         +7axBOQUxCfSLyYlauZK01JlqvfeONSjZqu+Fps5iSSRO36pEYPEO8xGk0n2ZAhfy6lc
         DRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768899955; x=1769504755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zxb0bCjWw+8Tx61kop8UU9Q6FPDuxjKBr+a9QDCVakE=;
        b=V4Bydz1j6XqScHngkJmpCdAOtz7k60D4sh57IA3Yz1ECP4SLcbAz1vGoRwFIe/n5Lt
         q2mVBFQdCeUh/JZsNywSy/XPRkKuf5R3cTnFqCS2vvSELaPNhn4/TUCQzNGM8zh0D8Sj
         CRKBM1tuR2i+XGmNrle/fvi7qUeamwJHE10+LMo6jJoCHbKNc0FGx7BLNdqpTx2A4i1E
         2mNl3KFJlykcQM4DjiObvVF+EC7CboyOpEXvQL1psKmlUSe+WnXV0lnqonJyfUCjnI2k
         aVqjwb2wxbhiT29vaoekzE8160acXfMGY1mBd4MaHUaJqUckFjD4aJo8WMJU9ELLgBHg
         wpow==
X-Forwarded-Encrypted: i=1; AJvYcCWaVJNxdh6945DJYiTF2QamZmW8cVtvfSdgGc9kNrPdTwrUmcLmMhQnqrRUmx+TBbVbT6CwK3wxHs0Dw5QLxADv@lists.infradead.org
X-Gm-Message-State: AOJu0YyHQKPZ/lon9wdR2+oLpSMR0INHGTvOks/7fYqZLnO9DqfEwhti
	3wJNaDwJOumiCOTABPhz9juZo1RUrEi7roQGxEzSVnCM9lCNq8wvx3r4HozVwI6/ZKSZGsNq5gs
	h3p+6KtjbRHFagjZTpUXqPqjHi09VuFOBWOUAufBd
X-Gm-Gg: AY/fxX60MHqB24uJ6y9SuaFodH0ULkJy4yKA6fTO7DMcw2G/F8B8bqgK0POAY2//uzv
	36xuycDEET64GSoMgAZ1wc3oPwM1GIE23pAQB981N+u9JfD3gjzG2/WbUixhnzbEeCvalxyjBF1
	OVI1Lh+G3j5TvCD4zbB6/Re9B86ZrTbp7QMjOCKOFi1jCvBPbVEy/kgpxpQWWSMaDx34ftmNaKA
	DgilmRzR041mEppRGH3B7t0MnuENNAbbgKr7FCm6yDE10gbEZ1NXICE1ZGeYO4/IuU2xwWCTzra
	AWGgEydsI6nlNucEI+/Iqcik
X-Received: by 2002:ac8:5a09:0:b0:4f4:bb86:504f with SMTP id
 d75a77b69052e-502afa34633mr27614241cf.16.1768899954787; Tue, 20 Jan 2026
 01:05:54 -0800 (PST)
MIME-Version: 1.0
References: <20251211113828.370370-1-tabba@google.com>
In-Reply-To: <20251211113828.370370-1-tabba@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 20 Jan 2026 09:05:18 +0000
X-Gm-Features: AZwV_QinPp0oM39FyUR1L7fuX3qSCH416MYXIyl6zO7KU-GMsNZIJeM6CnncU2U
Message-ID: <CA+EHjTza1LRztOLnmnwr-g9oYFQ0mLG0AvLW9FeHZHm0qguTEA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] KVM: arm64: Enforce MTE disablement at EL2
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_010557_302658_6DD9A9D1 
X-CRM114-Status: GOOD (  26.28  )
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

Hi,

I was wondering if there's anything else you would like me to do for
this series. Should I rebase it on 6.19-rc6?

Cheers,
/fuad

On Thu, 11 Dec 2025 at 11:38, Fuad Tabba <tabba@google.com> wrote:
>
> pKVM never exposes MTE to protected guests (pVM), but we must also
> ensure a malicious host cannot use MTE to attack the hypervisor or a
> pVM.
>
> If MTE is supported by the hardware (and is enabled at EL3), it remains
> available to lower exception levels by default. Disabling it in the host
> kernel (e.g., via 'arm64.nomte') only stops the kernel from advertising
> the feature; it does not physically disable MTE in the hardware.
>
> The ability to disable MTE in the host kernel is used by some systems,
> such as Android, so that the physical memory otherwise used as tag
> storage can be used for other things (i.e. treated just like the rest of
> memory).
>
> In this scenario, a malicious host could still access tags in pages
> donated to a guest using MTE instructions (e.g., STG and LDG), bypassing
> the kernel's configuration.
>
> To prevent this, explicitly disable MTE at EL2 (by clearing HCR_EL2.ATA)
> when the host has MTE disabled. This causes any MTE instruction usage to
> generate a Data Abort (trap) to the hypervisor.
>
> Additionally, to faithfully mimic hardware that does not support MTE,
> trap accesses to MTE system registers (e.g., GCR_EL1) and inject an
> Undefined Instruction exception back to the host.
>
> This logic is applied in all non-VHE modes. For non-protected modes,
> this remains beneficial as it prevents unpredictable behavior caused by
> accessing allocation tags when the system considers them disabled.
>
> Note that this ties into my other outgoing patch series [1], which also
> has some MTE-related fixes, but is not dependent on it.
>
> Based on Linux 6.18
>
> Cheers,
> /fuad
>
> [1] https://lore.kernel.org/all/20251211104710.151771-1-tabba@google.com/
> [2] https://lore.kernel.org/all/20251127122210.4111702-1-tabba@google.com/
>
> Fuad Tabba (4):
>   arm64: Remove dead code resetting HCR_EL2 for pKVM
>   arm64: Clear HCR_EL2.ATA when MTE is not supported or disabled
>   arm64: Inject UNDEF when accessing MTE sysregs with MTE disabled
>   KVM: arm64: Use kvm_has_mte() in pKVM trap initialization
>
> Quentin Perret (1):
>   KVM: arm64: Refactor enter_exception64()
>
>  arch/arm64/include/asm/kvm_arm.h     |   2 +-
>  arch/arm64/include/asm/kvm_emulate.h |   5 ++
>  arch/arm64/kernel/head.S             |   2 +-
>  arch/arm64/kvm/arm.c                 |   4 ++
>  arch/arm64/kvm/hyp/exception.c       | 100 ++++++++++++++++-----------
>  arch/arm64/kvm/hyp/nvhe/hyp-init.S   |   5 --
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c   |  44 ++++++++++++
>  arch/arm64/kvm/hyp/nvhe/pkvm.c       |   2 +-
>  8 files changed, 114 insertions(+), 50 deletions(-)
>
>
> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> --
> 2.52.0.223.gf5cc29aaa4-goog
>


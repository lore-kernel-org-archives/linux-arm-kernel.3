Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6319CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 16:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Nd/pAypiXjCztUMMddVDvIgncB2l7/bEwRVDNxfd6o=; b=fiQ/svaoumW9Yf3zlKvKbwP8SC
	C3ZnEPX6wZzVKtNptovk8ZAmbM/iB3sMBV+8oNvlQHrRM4vRJSBW2AAjbLFgrBBim8K8ZtDQS4QVB
	QNIPcVE1USQfQFbgyu8g3V+itUhiafOgE3t56haU+gAXp1FWvYPV4V/UHn+7CoydvCR4rbTS8Ly+b
	Ty00pMeLBxS2RA+Hs9/fKQW9AnSbOC9nLTcnkcO+FEqkZS/+0gtweIC2nguoT406Kipk1YolH2NR9
	+TqDI8v5or3zEnaaRkFJ0ED9BW1OyzIW9S2jZi3gwRghfai8Grpu3qDfZ3MXRkflouzrQN0kBV8TE
	BzqWZm7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5t4-0000000BWH2-2MTN;
	Mon, 01 Jun 2026 16:53:14 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5t2-0000000BWGf-0Ftn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 16:53:13 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-68ced08613aso106a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 09:53:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780332789; cv=none;
        d=google.com; s=arc-20240605;
        b=JTY5pKYm/d7dcNc/iRS3r1zRqTsGN4PHB98FKrreEyS8nAp6j7Vq2mcXNrLe7liInR
         bnWgHL1yS5Ulxb0wWZzsyX/Tz3s/l6KzlZgvEu2alxBQC4pRlD3DdIXPUuK3+X87vvuy
         ksmfd926Jcaivezu3cVSINdnyjBwWckmQ6REH80RuvJNTsi75ytclLpUWVYPMQGD4nTG
         0inH/EGC7VakDC/XMX1heM0W41wnb5u8Dr97w23wtpxpkipRMJa5yELKKiALOta3S0xE
         vy07x4zbN6PrUkOX1L0hwMhv5n7Pc0hPXJBMQnFSa/FwvTeJeXux+k+Bi/3e67+cKqun
         fcgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Nd/pAypiXjCztUMMddVDvIgncB2l7/bEwRVDNxfd6o=;
        fh=4cBW9VKA0imglyKcBKfRRqsjaSLelYQEddbal18LRLc=;
        b=ZWRUSvc9AqLvQzxc9ULRSbjIf+1A4n69r5n1NN3sZrqLgJSWOvFrJdFUbSsmW+s3oC
         S1gQN590TJ3qTOzClo5IRgSezjkT23W9DoFqguphZjvVKrRMtOE8a9IjuiZ072UHiXcy
         OjegM9yq84xH3aeROsKTn3qvczuMopoQMzL9hwxvrhnxuuPhmBsdhITCPzSirFZj6N9V
         9+lrqOaSym/gl6OCXuCEX0M39UaMOCB1QTQFmD9y9m1U+Hy0ETgdW2MpMGpWjP1n4N2n
         Y0Eh0fLuq2FIf/bcx4a66k5Rww94neTQkQ891X5yDxMFnb/zqyIlH1tULDQBVdKGcd2N
         1jmQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780332789; x=1780937589; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Nd/pAypiXjCztUMMddVDvIgncB2l7/bEwRVDNxfd6o=;
        b=fW87Omfzx6nnoSDcE0mlkCuQgKbCSoEW5I5rS+ExEbIHv3h13inQEGR+IMsf0y1xWx
         MWV6BCpYQaSjGnEEp6twFlabBV77GWxveOEMPXcrN9esxYLEP6CtI9OrDiAbyL3bH8wa
         qv/ddRx40iZoVT/3pCUC7E3NbrAqcQFe8KFQ6BiL1JbdjA2Vuy1fr/blmSciO0Ohd/nl
         5ZHW1JiOobudNEjpSC1YEL7MmCsMQuM67OdngyUMagfb5s8/t4zgDQnhCZdtV+WQKQrP
         thuiVOn0Vj2DkIDztfNcTnnxsSIE5OEXJrAlc8lacQx8mkqnJTRI75e/I0XAQfeCj952
         N0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780332789; x=1780937589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Nd/pAypiXjCztUMMddVDvIgncB2l7/bEwRVDNxfd6o=;
        b=sjg+0wdLgy5bATlWtV+4PvFOWHx55rlsIpaPjNQIuWkezUmRDekz2QUlRT8zvFuQmB
         Cgo/g1u7EKG84RVCmzB+QAwKt1aplMoeICR3YILk1MM7miHdKUoQ90hyNNrZ7HjyJZ6b
         VcZDDNzz/RP7jbKA8Q+bpNGpAIG3LnY7njLAWyEsmRABt4GE46R+uTiU9jSHxhX9oqYg
         LVVrpi5trtC2q3/9bQWkOYlwKPRpmc6vfPiBOutfjO8HIMOMW7uZEbnifUaaMGn8wVtd
         031JEznXAiFSJUZYEpdUOqyLAfMy1xpstSCM+KhR1fQWTr8qMPagZ7UxPJe0yQIxjsPv
         tJtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9SJ3NU5zNn263rnANDzefjD9QxMeYg2h6Z/N8hujZEhojDxS75FA6UafiWfBk6voQDgjPFypT/jU4ukPw8xK1@lists.infradead.org
X-Gm-Message-State: AOJu0YzgnpFD3mWkykxbMY8SCEBZ6kxYXvFpsm0DQp0p1SSCkfnxDUK5
	wIqBuBt2aIpZJIJBlcAr6YjLVH5UWlU7atQAqTPuJ1pwQRRXDV+Dyha/Hu1Wr1iz3l159/cGesj
	8tJ42vpojtRYdC5MGs1+Clc3MJqufiRfWNlOXUiMW
X-Gm-Gg: Acq92OGtx9J6K/Qt+UKOJQAhOuz+r7LMqA7+0+IreKulGdDKBKjJNOKLzFL/fv5u83g
	sz7wKryZxQbr6NZiphNTFq6991xD0bPDcn5fYAhrTgnexc/3RQJgyuO8W3WHMp0yoNH8mWFHgu6
	Ud/71lLIFVafoH9NdQO8BskMwvP51wniX9ChcbR+TqjN/SNHS9THWuGP9O+hC6JafBG778Hg27b
	fxQzJ16qfoPHkwfkNMz0kxeBSbyus35EihEf1QrfC3sKKzo+stQZ6SnSFNi3MNu0MFHGtesQClq
	ib54dURkc6jW/VqyaGzRmp/zyLPcI9o7KJ3WukacBglwjnrC
X-Received: by 2002:aa7:c64f:0:b0:679:4b60:c7d2 with SMTP id
 4fb4d7f45d1cf-68cbd53c5f4mr1318a12.1.1780332788376; Mon, 01 Jun 2026 09:53:08
 -0700 (PDT)
MIME-Version: 1.0
References: <20260527214510.3907973-1-xur@google.com> <20260527214510.3907973-2-xur@google.com>
 <178010203121.3743687.8945076194906841190.b4-review@b4>
In-Reply-To: <178010203121.3743687.8945076194906841190.b4-review@b4>
From: Rong Xu <xur@google.com>
Date: Mon, 1 Jun 2026 09:52:56 -0700
X-Gm-Features: AVHnY4JxwiS_olRFTmNrjEuQAYjfUhYP5yjBM8wq0XNLMuDFtkSKQRnqPdQGcV8
Message-ID: <CAF1bQ=S4EaOQz6QLAUzXhiMqucTxPHvXiAQ6Rvfct18uXgPzYw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] kconfig: Remove the architecture specific config
 for AutoFDO
To: Nathan Chancellor <nathan@kernel.org>
Cc: Yabin Cui <yabinc@google.com>, Will Deacon <will@kernel.org>, Han Shen <shenhan@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Linus Walleij <linusw@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
	Helge Deller <deller@gmx.de>, Ryan Roberts <ryan.roberts@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, x86@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_095312_146693_527C0755 
X-CRM114-Status: GOOD (  16.80  )
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

On Fri, May 29, 2026 at 5:47=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Wed, 27 May 2026 14:45:07 -0700, xur@google.com <xur@google.com> wrote=
:
> > The CONFIG_AUTOFDO_CLANG option currently depends on
> > ARCH_SUPPORTS_AUTOFDO_CLANG, but this dependency seems unnecessary.
> >
> > Remove ARCH_SUPPORTS_AUTOFDO_CLANG and allow users to control AutoFDO
> > builds solely through CONFIG_AUTOFDO_CLANG. This simplifies the kconfig
> > and avoids potential confusion.
>
> It is worth noting that not all architectures support
> '-fsplit-machine-functions' but I guess that does not matter too much
> because it will only be used if a profile is provided, which would
> require an architecture that is supported by the AutoFDO tooling? The
> documentation is x86_64 focused but aarch64 works as well, any others
> that the kernel supports?

Current support extends to x86_64 and arm64 architectures only.

We initially considered making arm64 to opt-in, Will suggests that users sh=
ould
be expected to verify AutoFDO/Propeller compatibility independently
before using it.
This approach allows for the removal of ARCH_SUPPORTS_..., which prevents
potential confusion.

Thanks!

-Rong
>
> --
> Cheers,
> Nathan
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A37C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 07:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynfzJ9dsAps2aTd6f/tPXnxcet4bhZr25ybz3JfD7/o=; b=J7eiCw6a1/P86ZJ5ivpoiZjolw
	2KSxjRBxOYnz0Az8Hx4JrAOSVu6k8obp3CX2vKh9Etcj67WHyXweWmbFWmKw99sSUEEzA66SfH+kL
	jk97cPPPnMB2MZ6+JvfIT0beEzILpf/kWwn5PYmpuhudVSmjTOWxLA3lRAwJuTdMm71tJASEIzq0z
	zo49GPMwXYyCckBLN+rM+WsGnVhb/eoYzSfCxwqDdQkEBNt6DTFOuSsV4dD0fedvddMK0oXR/HGwh
	3U8W3ukfl2XI8szU2IfTteEjSKfrlJxedD4idpnGwpxZj553Lc55X6Vm96ea15Tr1xqDfgJJuaaBn
	wzNUtVig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDQA-00000001ReD-0wnL;
	Mon, 14 Jul 2025 07:16:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCla-00000001Mxr-2PFv;
	Mon, 14 Jul 2025 06:34:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8B1BEA5116F;
	Mon, 14 Jul 2025 06:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3777BC4CEF7;
	Mon, 14 Jul 2025 06:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752474861;
	bh=ynfzJ9dsAps2aTd6f/tPXnxcet4bhZr25ybz3JfD7/o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kEJvLVQkjY7hRn/K87feYU0o9wfLcoFoQapbEzji/H3oVgosLIR+n/zpshU8j5xPx
	 cnTymersGd/N+1mHqJ3BKGWRQrcT85aRPAwcP/faI8e5poEh4ZkWHMwaVBKocHO+rc
	 dLlEMs5vxTbWhanxYLW+okfeFmBQsBMdx563LZdcvTyj2iv+aiVsVXtnqPaTwDI3J5
	 Ad4wSY0s6HRoT9uqxSgF5lXh8e2IN8+z1k96CRC4nfbcNwzS/6YDJxQqc+sBU8hMEi
	 vOLX3wP8hDRXfWv7ELSL3IU03zRlrE1pWJntsOZb60EXxyqcIuI5/EbVfSlwDO+8oX
	 OGL6/yKjUUb0A==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32f1df5b089so33911491fa.3;
        Sun, 13 Jul 2025 23:34:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZMy0Df+AdyhSW8FAkfyDl5Ama67s/ZiXm1uWwrGLLMJP0pH0fzcGdP810LL/NzgLQM8dFs0Se2pdns+wUslVc@lists.infradead.org, AJvYcCXXz7Ix7O7ou/kI1w4AKs7CKwtrpi/pOudtzA//Gz7HUcLDTzyVYZr9r/PhIrHuM/hmN83IxNPky9ZXTz4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0svefdwUt2J7wROsrTAsBibzdK4SPK8f4mB8q7t6N/DlGUdFs
	vlmOrYmb0ugx+KynCdzEvus/EE+kL4Mq/o/1ZKShXmVHUKAVJwCQ+3eCmnT9bya01KdhCrCcv+j
	jM3+pJYUYRPX426vPjM4bE0nEGF7GPh0=
X-Google-Smtp-Source: AGHT+IEy4x7iRPRFME+dpdQyQI1jtmLIqNYRLMk1ojNaRg715rzBCM8Q86llYRAXa+twgNvvkR8qSO1icXiwfjuZzv0=
X-Received: by 2002:a2e:a7ca:0:b0:32b:80e1:300d with SMTP id
 38308e7fff4ca-33053186d88mr35999851fa.0.1752474859585; Sun, 13 Jul 2025
 23:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250714060843.4029171-5-ardb+git@google.com> <20250714060843.4029171-6-ardb+git@google.com>
 <dade7d17-d45d-455e-a43c-01e9ea95c3b4@gmail.com> <CAMj1kXETDd+19i+awMx1v1sE4RXhF-r2a-mTa3rWfus5s4HMmw@mail.gmail.com>
 <f538a1b9-6a7c-474f-af2a-d87c35b82fc5@gmail.com>
In-Reply-To: <f538a1b9-6a7c-474f-af2a-d87c35b82fc5@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 14 Jul 2025 16:34:08 +1000
X-Gmail-Original-Message-ID: <CAMj1kXGG0Mi+AT7ZeoHLTDhVbbahP-PLRgY1=aSZMVQEgWz5sQ@mail.gmail.com>
X-Gm-Features: Ac12FXzYFywZb16ZKDUVBGm4_KFbnsnrDO10Xk4vWwqGRcRLn5B3XWIM87WiCT4
Message-ID: <CAMj1kXGG0Mi+AT7ZeoHLTDhVbbahP-PLRgY1=aSZMVQEgWz5sQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] efi-rtc: Remove wakeup functionality
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Bibo Mao <maobibo@loongson.cn>, linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_233422_740290_85C8C030 
X-CRM114-Status: GOOD (  23.40  )
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

On Mon, 14 Jul 2025 at 16:22, Demi Marie Obenour <demiobenour@gmail.com> wrote:
>
> On 7/14/25 02:19, Ard Biesheuvel wrote:
> > On Mon, 14 Jul 2025 at 16:13, Demi Marie Obenour <demiobenour@gmail.com> wrote:
> >>
> >> On 7/14/25 02:08, Ard Biesheuvel wrote:
> >>> From: Ard Biesheuvel <ardb@kernel.org>
> >>>
> >>> The EFI rtc driver is used by non-x86 architectures only, and exposes
> >>> the get/set wakeup time functionality provided by the underlying
> >>> platform. This is usually broken on most platforms, and not widely used
> >>> to begin with [if at all], so let's just remove it.
> >> systemd uses the underlying functionality: a timer can wake the system up.
> >> I have no idea if that is implemented in terms of this function, though.
> >
> > To be clear, you are referring to wake from poweroff at some date/time
> > in the future, right?
>
> Yes.
>
> > This change does not remove this functionality from the RTC subsystem,
> > it just ceases to expose it on non-x86 EFI platforms that claim to
> > support it.
>
> Do these platforms generally expose the functionality in a different way?

On x86, the CMOS rtc is manipulated directly (and this is officially
condoned by the EFI spec).

On non-x86, this functionality rarely works, which is really the point
of this series.

> If not, systemd should probably document that the functionality is
> non-portable if it doesn't do that already.

Not sure what you mean by non-portable. This functionality should be
exposed in a generic manner (using the RTC subsystem interfaces), but
only if it can be relied upon. On x86, the RTC subsystem will use the
rtc-cmos driver, which implements the wakeup routines in terms of port
I/O.

If removing this functionality altogether from the EFI rtc driver is a
problem, perhaps it would be better to implement an allowlist based
solution that does not attempt to access the runtime services by
default.


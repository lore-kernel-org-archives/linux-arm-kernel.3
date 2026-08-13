Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0732CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 11:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fm+CeLKS/2B3l8wNfarjP4MGGPunmU90uKBggPTChU=; b=O3HYVSTH63WEfuXH8DVSoGHkP7
	0nI7Z2aRvqojRJG1jAS7hWAauvYt9+vWiuhrmv83wCW2K+57jlErgBd7UuaatTTaJVtN41csMBkFf
	il52LkS+cpzG9T1hY9jRfqe+rHmvvxnVxpw4pzfJAgt5LA3ZYoctLAynJZZktNWaDie32DYSAVmXb
	DU4J6ixl5c3mXoZxRElN3AjNqBK1oxed/JjQTiiI8QUaKp1hl9f+3MRfuRMv6AjF80h12DgD/NBDk
	SUY3old9bHcWPF6sL9fTc/8YKu/PVsCbXH9O3upS5wd08dHEtjfGRLktieHDmfX3B6JEp+vyT0vC2
	IWHq4wog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTzn-00000000af7-3HKc;
	Thu, 13 Aug 2026 11:53:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTzm-00000000aeo-3Hcq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 11:53:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EF804402F
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 11:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A8F1F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 11:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786621994;
	bh=+fm+CeLKS/2B3l8wNfarjP4MGGPunmU90uKBggPTChU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=UgV2RCTFFoe8cwLWNUIuifb5WIdiXPPM+iHiuDr5ZPq8ELyvYb68lIF4yk9xDAscA
	 RRj0FaaUn8MtYxfa+3KL2YuVm6AsqYRCy0ZG+CpE6kqGLweRa3LDBkpFmgYDBpahX0
	 COJKUDCse9eswFdo0/fPFyQXIIIRh7b2tL/fE+pPvrDgTm4vgcnfevykwbaAzms+eT
	 p+yBX+2wruAjjBivWwkVjbw1EsLyqzbTDL5CurY53cakXLv1EqeWhohDod/i5G0aSN
	 oWYmg+o6xU0KnpUo7Phb6BpL7s7np2B5/FHrLup7a0Clf+Qpwin9W5YszwqKIbhUMF
	 wfHDP6vh85i/Q==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c9452244aso15445761fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 04:53:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp/cyzot0OCe0A0IaeL93O3yK3Yn7pWutaBuUanboUXbsdOEWyNqjBK5EkW2SjHJUKuk6IC4pDHTPhoav2MRnqo@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm/LFavRT8GZcvd/NcToDmxcCHX1Ejn3+mmQwr8MrvovctFIhz
	Gyx+gFnneyOZsCkkx58Zojlm2pZYtceDvTR7yI11OkmlXx1tbuAaz5gnNksn839RayEzaIEV7yY
	568gIZmxxv+ZUBzFtIEhDyMaMGJ43bROlobLFLpv5Cw==
X-Received: by 2002:a2e:be05:0:b0:39f:bc94:eba1 with SMTP id
 38308e7fff4ca-3a11a6b7762mr7298321fa.16.1786621992909; Thu, 13 Aug 2026
 04:53:12 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 06:53:11 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 06:53:11 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <bc95e0b0-2cc5-4ad6-a319-ae4e159b92fe@gmail.com>
MIME-Version: 1.0
References: <20260731050838.158825-1-ebiggers@kernel.org> <a28c2903-0976-4559-b870-4de5553ba9ab@kernel.org>
 <3ba57269-3305-4d80-b3f2-aa82fa59b59d@gmail.com> <b9b655a9-c683-4c4e-ba0d-f98577dd2912@kernel.org>
 <20260801162900.GA2021@quark> <e7aeec9b-11aa-4635-bde9-fb8c7ca38260@kernel.org>
 <20260801171242.GA3567@quark> <CAMRc=McL5QQRk8C8zzkHm+FUj-SAVi5PLJr2pXo8eNpaxXuALg@mail.gmail.com>
 <20260811224110.GC1905@sol> <CAMRc=MfVqphaVsfcmUXjGmu6m+F6nJYXgAPuTVjZBwFnd48BkA@mail.gmail.com>
 <bc95e0b0-2cc5-4ad6-a319-ae4e159b92fe@gmail.com>
Date: Thu, 13 Aug 2026 06:53:11 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mcno_F2UuLXZ3ruaVSbYhssVK90m3KM=+dwskLMSp8TXg@mail.gmail.com>
X-Gm-Features: AUfX_mxLj0BqXm4Ose-q9nkSpZaIi5poNDxpaETn2wXloBBECH8QMDb1EFqov7M
Message-ID: <CAMRc=Mcno_F2UuLXZ3ruaVSbYhssVK90m3KM=+dwskLMSp8TXg@mail.gmail.com>
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Eric Biggers <ebiggers@kernel.org>
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

On Wed, 12 Aug 2026 18:33:45 +0200, Demi Marie Obenour
<demiobenour@gmail.com> said:
> On 8/12/26 04:07, Bartosz Golaszewski wrote:
>> On Wed, 12 Aug 2026 00:41:10 +0200, Eric Biggers <ebiggers@kernel.org> said:
>>> On Tue, Aug 11, 2026 at 08:42:55AM -0500, Bartosz Golaszewski wrote:
>>>
>>>> No, the rationale has never been this. FWIW it can be that it's used for
>>>> testing of the crypto module on a supported platform and that is already
>>>> enough of a reason to keep it upstream.
>>>>
>>>> As I've said before: we don't just drop maintained drivers from linux.
>>>
>>> We definitely do if the drivers are not useful or appropriate for
>>> inclusion in the kernel, though the policy varies by subsystem.  Even
>>> just last month an entire filesystem got dropped despite someone wanting
>>> to maintain it.
>>>
>>
>> I suppose you're talking about EFS? A thing that can't even be tested on real
>> hardware? This is a much more extreme case. Here you have several people
>> representing the vendor saying they want to keep and maintain it. I'm fine
>> having my own tree and sending PRs to Herbert if he agrees and you are of
>> course entirely free to disregard any patches targetting it.
>
> Would you be okay with one of these options?
>
> 1. Make the stub driver as the default, with
>    the real driver guarded by an off-by-default Kconfig option.
>
> 2. Keep the driver as is (with the power management issue fixed),
>    but don't register any algorithm implementations with the crypto API.
>
> 3. Only register algorithm implementations with the crypto API if a
>    non-default Kconfig option is selected.
>
> 4. Only register algorithm implementations with the crypto API if a
>    non-default module parameter is selected.
>
> 5. Move the driver out of drivers/crypto, delete the algorithm
>    registrations, and then add support for restricted media content
>    decryption later.
>
> The last option would be my preferred one.
>

I actually have a slightly different spin on the stub driver. I'd like to
keep the driver future-proof and avoid all kinds of needless churn when we
do get to the secure dma bufs and restricted media playback (and we will get
there eventually :) ).

Can we make the QCE into an MFD driver with the core binding to the DT node
and handling the interconnect bandwidth, while the part handling crypto
algorithms becomes its cell and is moved into a separate module? This one can
be disabled in defconfig by default and I don't even mind it being guarded with
CONFIG_EXPERT. The core module would remain in arm64 defconfig.

With that: any future extensions providing support for more functionalities of
this IP can simply be implemented as more MFD cells while we can also keep
chipping away at the existing code and use it for testing the BAM pipe locking.

> Also, if Qualcomm has customers who use the QCE via the crypto API,
> is Qualcomm aware of _why_ they made that choice?  From Eric's and
> my perspective, that seems like a very strange decision, unless there
> are factors that Eric and I are not aware of.
>

SM8650 with the QCE is FIPS 140-2 certified and apparently this makes
a difference. Don't ask me if that makes sense, I don't claim to understand
the legal aspects of it.

> Finally, would you be willing to have a group call to discuss this
> at some point?  That might be a more suitable venue for this kind of
> discussion, and could potentially lead to a conclusion faster.  Also,
> while at least I couldn't sign any NDAs, there might be information that
> you could discuss there that you cannot post to a public mailing list.

Sure, I'm fine to have a call. If you think about coming to Linux Plumbers this
year, I'll be there all week and it's a good place for such a discussion too.

FYI I've only been online for a couple days this week and I'm going offline
again until the end of August with the exception of August 26th when I'll be
able to chime in again. Any call would too have to happen in September at the
earliest.

Thanks,
Bartosz


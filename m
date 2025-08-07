Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58282C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 19:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=LFTGdFdrwPEXp/07Hyvbq3e4qPYS7VEbCtDeVMipK3U=; b=RYZMR0e/XYx3ZmfK8x9Cg6ZEEV
	1Fs/4YXZIQBZx6uLg3PROuOKf7hQtdry3BuOMdrACNDOwCGZmnfoW/VugcI2WOuJIBm35nJfeQ/yr
	d9tFiaei15tKducTQ+GbVGAgUvgX34xcVQ806ZWuglLPPcO7/ZaNcdEhlpPQMhfpckB0GwtE1A7cA
	YamiZmS54rcSd0gcTY7wmhxWBdasPcv3NNTzhA1HB9m1/ucwK2eigOjLIIsv17IUbtvynZf5UNFXW
	fdWdBVTsRBwT1Vfm4VNStJGh0ED26eEXOyJ+H/lHIv4ejd59UdvDayDrbsZL0by00xmDcoBspsckg
	5rBKur9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk6CR-00000001OmU-0mSA;
	Thu, 07 Aug 2025 19:22:51 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk67Q-00000001OME-1BO2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 19:17:42 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-76bd041c431so1401904b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 12:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1754594259; x=1755199059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFTGdFdrwPEXp/07Hyvbq3e4qPYS7VEbCtDeVMipK3U=;
        b=0WZ5Qm2UlbZJbvuhNbFT2tjCCs/SimXVKR5YelfWKLxsPhjDMDQj77i9RL075EosbH
         C/P9bstGLMo14WmVhkeP9NeM2rUA3kVikE+LNJyzDKr+FWIbwANlGEx/xTkoJ1jb8BtE
         TUbfWnYkPR8I5JSbYKZgWSYB2zM6+/PfgYLSg9kepLUwJJcvFoMAM83nCN/v3pb3j6bp
         Bc/nwvSJ+5mXXLIczFWnbFneAFCq+duJVZg1iGq5TKx/dirpC5FtKAAdhNQZnlV/tlDh
         8OpRqbp5KlHZ07sLg7q7L7ejZm7+gS1ktlaL/UuNjegOd3sY7o7ws8sOhH0V5kCxUoCE
         KxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754594259; x=1755199059;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFTGdFdrwPEXp/07Hyvbq3e4qPYS7VEbCtDeVMipK3U=;
        b=h8e239oaE0D9r9724+lYmSy9iE6AqJhdHJ81EwC9u3QF/pD78pa9sBAaUKoKjWlEaW
         O1kUQgMk7hDlGHb8OivXUKb6KEArKlDND3QxXgn0SLO+NV3leXQLyy/NRE6kwZmfC9mW
         TlcMIVoPQGA3IovXqUFt/BxOkBLYHqXyMgwvzlt68H9MGVa/BQNeix46ExVPwR1BwRo8
         59AJaeC9EUJBYXLkwBZBobwRBoLc33bBuRG8h4EjM0PuQuZDj2gC9G3AWGxyQwlKnfRw
         Ja6APxYfblnNtv5QZdoVJXsXmIsmP4cd3WNDdRfThf6fBBL/989nTQwC355T3hTeLIVn
         9Y3g==
X-Forwarded-Encrypted: i=1; AJvYcCX/6K9d41CJdoh5ci93BQTfPEPuqJnOFuIrD9Qhk6TmEm0PgDM7cu74uM+55twAZztMrSfztuyj2WtL8Qvp8oJO@lists.infradead.org
X-Gm-Message-State: AOJu0YyzUxyhVsQb/sYBOr+xxUv2GtY34Lb97sqpjJA4OmWuzx2IcVyM
	H7TXlWceeV46daLnKGtPPT8DCRtOCDfxEUwY9lmUvf0ozQ3ACLoYpD53mCXZw1LSvUQ=
X-Gm-Gg: ASbGnctxC9fT0uuoSfI4uACpfTY/2ngZ66F6X8fwqjNFqQHxV1xj+V7N1adXvKq4cpn
	3vpyouGo7zQxL/hQWq+Wtz/qA+wuD9B29glsnyz9BSfJswgR4EGJnwUCZuT/y+gAIUn/6TsZg8K
	8AgkLf2NH1sdN7IIAcAFzdauACI7hSuYpBBaq8bj49nrxUBlwwYrB9OfFqAi3t/ccJdu9TcM6Vd
	AHuLdFr9mbhpwyhx2eH0NvToLhcztB3mHxE2SRkDnKZVnFm512z9Uy4g8rah/hfmpIHTl/TkqzR
	t4Kenwog4dRojge+SGRnpaYwkCbJ5qLSTdOcxTzuVBiKo93VwtzoWCzcuDUcTXu8RBtkMzdx151
	5no2+N6cfSgU++M5iiNcPICGzkQ==
X-Google-Smtp-Source: AGHT+IHNqjBzNa6x9y5nuMTjhL/RlmBkISPYGPU0iPpiI2kbUCaUjEOs8chag9KSPSg5MZtZ2aU0kQ==
X-Received: by 2002:a05:6a00:80a:b0:74d:f997:1b45 with SMTP id d2e1a72fcca58-76c460ad057mr415274b3a.8.1754594259196;
        Thu, 07 Aug 2025 12:17:39 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:30b7])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-76bccfcf5f7sm18719092b3a.88.2025.08.07.12.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 12:17:38 -0700 (PDT)
Date: Thu, 07 Aug 2025 12:17:38 -0700 (PDT)
X-Google-Original-Date: Thu, 07 Aug 2025 12:17:35 PDT (-0700)
Subject: Re: [PATCH] arm64: Expose CPUECTLR{,2}_EL1 via sysfs
In-Reply-To: <861ppn9fbw.wl-maz@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>,
  Will Deacon <will@kernel.org>, oliver.upton@linux.dev, james.morse@arm.com, cohuck@redhat.com,
  anshuman.khandual@arm.com, palmerdabbelt@meta.com, lpieralisi@kernel.org, kevin.brodsky@arm.com,
  scott@os.amperecomputing.com, broonie@kernel.org, james.clark@linaro.org, yeoreum.yun@arm.com,
  joey.gouly@arm.com, huangxiaojia2@huawei.com, yebin10@huawei.com,
  linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Marc Zyngier <maz@kernel.org>
Message-ID: <mhng-D7782B90-52E0-44DB-89A8-70079A8751E7@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_121740_562958_4D616252 
X-CRM114-Status: GOOD (  45.16  )
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

On Thu, 07 Aug 2025 11:06:27 PDT (-0700), Marc Zyngier wrote:
> On Thu, 07 Aug 2025 18:26:29 +0100,
> Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Thu, 07 Aug 2025 01:08:26 PDT (-0700), Marc Zyngier wrote:
>> > On Wed, 06 Aug 2025 20:48:13 +0100,
>> > Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> >>
>> >> From: Palmer Dabbelt <palmerdabbelt@meta.com>
>> >>
>> >> We've found that some of our workloads run faster when some of these
>> >> fields are set to non-default values on some of the systems we're trying
>> >> to run those workloads on.  This allows us to set those values via
>> >> sysfs, so we can do workload/system-specific tuning.
>> >>
>> >> Signed-off-by: Palmer Dabbelt <palmerdabbelt@meta.com>
>> >> ---
>> >> I've only really smoke tested this, but I figured I'd send it along because I'm
>> >> not sure if this is even a sane thing to be doing -- these extended control
>> >> registers have some wacky stuff in them, so maybe they're not exposed to
>> >> userspace on purpose.  IIUC firmware can gate these writes, though, so it
>> >> should be possible for vendors to forbid the really scary values.
>> >
>> > That's really wrong.
>> >
>> > For a start, these encodings fall into the IMPDEF range. They won't
>> > exist on non-ARM implementations.
>>
>> OK, and that's because it says "Provides additional IMPLEMENTATION
>> DEFINED configuration and control options for the processor." at the
>> start of the manual page?  Sorry, I'm kind of new to trying to read
>> the Arm specs -- I thought just the meaning of the values was
>> changing, but I probably just didn't read enough specs.
>
> The architecture defines a range described in D24.2.162 (in the L.b
> revision of the ARM ARM) which is reserved for IMPDEF purposes.
>
> What these registers do is not defined, and there is no standard
> across implementations. This really is for chicken bits and other fun
> stuff. Most of them will simply generate an UNDEF, because they don't
> pass the decode stage. But for all we know, there is a bit in there
> that turns NOP into the HCF instruction -- or better.
>
> So exposing any of that stuff for any given CPU is dangerous. And
> exposing any of it on *all* CPUs is a bit like swallowing a powered
> chainsaw (don't).

OK, makes sense.

>> > Next, this will catch fire as a guest, either because the hypervisor
>> > will simply refuse to entertain letting it access registers that have
>> > no definition, or because the VM has been migrated from one
>> > implementation to another, and you have no idea this is doing on the
>> > new target.
>>
>> Ya, makes sense.
>>
>> >> That said, we do see some performance improvements here on real workloads.  So
>> >> we're hoping to roll some of this tuning work out more widely, but we also
>> >> don't want to adopt some internal interface.  Thus it'd make our lives easier
>> >> if we could twiddle these bits in a standard way.
>> >
>> > Honestly, this is the sort of bring-up stuff that is better kept in
>> > your private sandbox, and doesn't really help in general.
>>
>> So we're not doing bringup (or at least not doing what I'd call
>> bringup) here, the theory is that we just get better performance on
>> different workloads with different tunings.  That's all still a little
>> early, but if the data holds we'd want to be setting these based on
>> what workload is running (ie, not just some static tuning for
>> everything).
>
> In general, none of that crap is safe to turn on and off at random
> times. You really want to talk to your implementer to find out. And if
> it is, the firmware is probably the place to handle that.

Ya, if it's generally not expected to be sane to runtime modify these 
then it seems sane to just hide them behind a firmare interface.  Then 
it's really up to the firmware to proactively expose the bits that are 
useful, and it's inherently vendor-specific.

>> That said, part of the reason I just sent this as-is is because I was
>> sort of expecting the answer to be "no" here.  No big deal if that's
>> the case, we can figure out some other way to solve the problem.
>> Happy to throw some time in to making some more generic flavor of
>> this, though...
>
> I have no idea how we can achieve that, given that there is no
> architected definition for any of these registers.

I'd basically have some interface for getting/setting the registers that 
the kernel exposes (gated behind whatever tests we'd need to make sure 
the registers are accessible), and then some userspace program that deal 
with the implementation-specific behavior.  It'd probably just devolve 
into some database of known implementations with what the bits do, with 
some attempt at mapping them to generic behavior -- though even that's 
kind of clunky, as something like "this tunes some prefetcher to smell 
different" doesn't really help a ton.

If it's a firmware-gated thing, though, then it's probably going to just 
end up as some vendor-specific firmware widget that we go fumble around 
in ACPI to mangle...

>
> 	M.


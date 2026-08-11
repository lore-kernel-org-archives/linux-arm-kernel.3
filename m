Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814F9C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uS1uPWeUp0gwSJl4xgsxYxdmclbK2mcyeca4b5tZX4g=; b=MGA3QG2Yq708Nz8TXBhtPHMOvj
	4BUmsQPu5kNE6u7+ZE4OQBffuctEt2d2onPbcZoy8KrKtCGAoRRfyhdfEKkDUKGw4uy/D+mzAbGJA
	Y1LzCEvUlsyKWCQqHphBsae5jaQ5Ol0aXO2aM0UblzFzMoUDm6H9xtGJaZhRt08PHvDwXJeIajE2L
	oAUkMSSH5jJVQu4TPORoNmh7ynAJe4ZnAXmDxYVjP0J5QHpMoKi7ictRp7tGJnSioqQ+dhYrMA8pa
	NPsc+i7dQDmw1DgLjcKndtJp6VNLYQgk2BV87U7UW2VUfMkHdLh3rkkBeqJ0K20Q8Kbu73xsxdzm4
	gY5SSUhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpAN-0000000ET3a-1bHA;
	Tue, 11 Aug 2026 16:17:27 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpAL-0000000ET2j-0B1Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:17:26 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c16794450aeso137272666b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 09:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786465043; cv=none;
        d=google.com; s=arc-20260327;
        b=HtN74Aq6HSjrWElRGr3RVwRHZtyQmd+SQOdn1Um2NvPxi1VG79CisrJ9r+9JClQQ33
         CPTwMoZYIatgE5v8pmU4TUgkvWkZyOqXlJhcZFfVUMhlPs0L9gTX6DhRjnJM2A2apXkc
         6BagsSTvCU66/jB6BmKkU2vsAHAFkKRXFZG6qNWB0R45v+f16gKAGq0DgIcpvpa/D0h4
         aUCzEMUqYN0ie6s7Npm5VpZI7YB5mWb2cp5OJsgnbi49Kb3fHIVG59nRpkhhjwMj1S2p
         Pyf+p9Zy3xNUUSVYwXwsflomPSp0y/MEo5vengRk5UOMoquokS6s0Wg7Y0G12q/6Y+pv
         h3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uS1uPWeUp0gwSJl4xgsxYxdmclbK2mcyeca4b5tZX4g=;
        fh=TzN6eFp4/OOH9roJGDwvVNzJ8XjlKMXWwRCInYq2xUM=;
        b=VjfxNrYTeLleOJjmCs7SQLfV/cHkR0PwBLrtFo1Iw3F9AHUjMJ//V4au/Gv4Fz2Owq
         M/o9Q+l6N/yprfR8YxccUODtziGkr0ZgCFx41FJ6dLgno+Ul0i1WkQ+qtU5UyTqb2pPs
         MhXZjTA4loKA2PNUrIWKgqGmu9g+C78q8j1XcxERwjCqFZCQLjPlffqX/8w7akK4GbDN
         d2VpGZMEKPXTiKwtegxRblY9D6QkwNGF4F5Td4gicvxg82yZZfwUIGMezxrhiJlGhe1U
         0KB+y4ttcpfApbUblBxYmOI2qf5Aa4BCy1ctpay6DUcB0c9e/k7ytljC1dMRbwKqsd8s
         R5cA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786465043; x=1787069843; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uS1uPWeUp0gwSJl4xgsxYxdmclbK2mcyeca4b5tZX4g=;
        b=pKf/eXPxqrTIIRIbxSq/8Rhgym1csWsHTyBW1/P4VIG2QRcEIYgoMLLetrJpwaeKya
         d8girLm8oLPLr3Sb3pIRkIwZjJw6ALgibr/kCiM1goytjsDEF00oyoT+cxT3tnDnb34x
         s/+5Bx9cRRm0T0mMXp/eTyJMIienoBoJIM2F4M5i4MQ2kCegiZ3MDspFseqKZ46p0YXf
         cICIlZpiuZJOvFl08trOTVL5eo1ezl8z+f+OLHNtI7cQqCTQMZtIIN5gwOtlBv4v2+VT
         rKt1dH7Te9Kr5VFnWLNhvk+jISmH05ywzp5KkIgLfintmrkzZPTyv/y3gi/XdHiG2IxX
         lRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786465043; x=1787069843;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uS1uPWeUp0gwSJl4xgsxYxdmclbK2mcyeca4b5tZX4g=;
        b=PBzU5peRWLAamlo2tbS8p/zuCWOQOOnTj+F8u71M+lJJKSZFr1rj63wJrTU7C/9tCg
         o8lsFQIYjD9K4YdGBKabU4wDCBMQV5QkjIQSHWOFHdroaus7cdLWNcez2C5SaEKB5999
         nMNbEjJ+1+Q8r+R3Y/mRZUEgFAPLJdqFHXfud0bRzn5Vc44eRadAMaoAmkAg13IiS2ue
         G8y/FwuyzqlUZL9JQQPC0jFp4dsKu6yy8hp+ZpwFg4Lh7GS5xEFghNW1LkX/PKg3K4tU
         FE5UAOWXN9Yj4KZqh7LOTtQb2rim8KeYlFYOeWql9/yRBy9mjtzTcKPup3i5p01ctRTp
         G/TA==
X-Forwarded-Encrypted: i=1; AHgh+Roc15hwdt7m0NnVbhnFcMHHx5BWWNhbSh9v+jBosmN5yjsW0B9a66nU/HA1FPkvzvh+i+ZxRLO0APEZaEmmpRjb@lists.infradead.org
X-Gm-Message-State: AOJu0YxYaKIjsIs7+OuOP6V9f00vchejZK0o58hqc9zA8o7juNM2O8MC
	TdeCW49D46Vflnuwn8TNlCTm7NcraDaX7Gi92XrK2BmUfr2Rig920NLu+TOgFk6Joq2yVlf28j9
	EyGxUZ8nIgnFYPYUmCwi4jabR9v58US4EnD7meOUR
X-Gm-Gg: AR+sD136t4iW0Hi2EvKKZwqMra8FfYhhie/+rOrvUfKw0FabfO3fNUBoO7ERjYl5x6O
	98M7gxBc8BP8ULu7hwH+ef2R7EJ0sR5osBERA/KbqEroff7GATx5RAPyRVRrW8Z8YyuSewB8T1O
	P+dFP67oETjXXYoJBNb8TbZha5cPEllnUU8psz6mdRjEX9t2rzXRy/eFNtJAB9vM03eHxKdWlgj
	+wXjnKySh/fFTG4L7o6vrz41NH7n26fs9+tK6Jq2y4N8rlXl9pq99ugDc1hIkMCxVLYqAzWoqNI
	kt5AAtLW40AU+iUIv2UcFHFOw4w28CiEDR3hxdkEylb6oPXkTsb18jSNss2UkEHqpwETlmpj5F5
	o5HGeev+foVNcBZaBLGLIAZ6FFNhCQMWZ/paMGp+y9Ew4zq/SKnar6RQz
X-Received: by 2002:a17:907:9281:b0:c16:5f28:4575 with SMTP id
 a640c23a62f3a-c20ecc7e587mr83999566b.31.1786465042229; Tue, 11 Aug 2026
 09:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <ed4fe1f95071897859ec7fbe9176246cbd4962bf.1786138806.git.jpoimboe@kernel.org>
 <anmobvJXiBQqWn6S@willie-the-truck> <e5q2mvqtf6iw4lco55uny5ffhppw6vlflxguhc4gg5nm3zdvmo@zs6rw7iov5qc>
 <08d6c5cd-9924-4359-9181-a03718161528@app.fastmail.com> <kp4rvh4vxo65gipgqz4i4dnw2ueylmus4yys6xfrbngp5nefzn@4a4ekjlzqlph>
 <CAKwvOdmSVjY0TmOTc6WMmDHcLbn=tOV3R3zH_TO4zXZiYEsaBw@mail.gmail.com>
 <anrvDIWMNGIa4WPK@willie-the-truck> <4986ac98-d6da-474a-b218-b6468b68cb9f@app.fastmail.com>
 <16e3ed42-1b1f-4ddc-9d8c-5e12ee7dbe3c@app.fastmail.com>
In-Reply-To: <16e3ed42-1b1f-4ddc-9d8c-5e12ee7dbe3c@app.fastmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 11 Aug 2026 09:17:09 -0700
X-Gm-Features: AUfX_myrZCwdGci7ik12sPfl_MO6F_0C3mcZPp-3E0jT-vc4rIXwgDm2Mzga6bE
Message-ID: <CAKwvOdkVxt-90Z_Af8s63RKCY-202r_0_bgF+8-g7iKn6XM_Sg@mail.gmail.com>
Subject: Re: [PATCH] arm64/module: Fix livepatch BTI exceptions with Clang 21+
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org, 
	Song Liu <song@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_091725_098036_17B2FD9F 
X-CRM114-Status: GOOD (  16.01  )
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

On Tue, Aug 11, 2026 at 6:18=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
>
> On Tue, 11 Aug 2026, at 14:02, Ard Biesheuvel wrote:
> > On Tue, 11 Aug 2026, at 11:44, Will Deacon wrote:
> >> On Mon, Aug 10, 2026 at 09:41:35AM -0700, Nick Desaulniers wrote:
> >
> >>> Sure, but let's replace this with a link to a bug report in llvm's
> >>> issue tracker?
> >>
> >> Yes, please! I can apply the patch once we have the bug number.
> >>
> >
> > I can look into that.
>
> https://github.com/llvm/llvm-project/issues/215547

Thanks.

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106671 was closed as
invalid pointing to the same commit in llvm. What's going on here?
Where's the corresponding feature request for GCC?

At the least, I could imagine there being a `-fno-omit-bti-pads` or
whatever for the kernel to opt into this behavior.
--=20
Thanks,
~Nick Desaulniers


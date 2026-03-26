Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE6B10A88E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 17:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9olrJwKlMERMQc61vOT8vZB7QpsPZJixmRhhkJf9iI=; b=rdJkzhxGDlxjhYYBHpTSxQcXMO
	+ev0J/GJ+0e0B0D42nUND/n7okWnnwouDqiNYnQO4S+DaG9pOmabLUwjIm5uLcVE6n5npUFlhPpBo
	oLKXtjUSZs11dyeBPCNoZAh8B6gw9dR5k9vNud7QutdX097lfhjcVWU1bqlLT/MShdW8gFH5O9y8u
	+dPKraGm+LISPOmSTh63fRLV9T3RoviHQoiMYikWA5IZVXHaCeB1gw4xk5D1HfeD4CRgyTzBuGdDZ
	DSfomu8noTtxrkAc0ugeZC2ZrWDzcOkBVkbYaKwTjB04c2fFeFMY1M8Brv99fP87EZKuO7r5jUMYh
	SSFmINsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oHW-00000005vJw-0aLp;
	Thu, 26 Mar 2026 17:14:06 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oHM-00000005vH2-1kmA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 17:13:58 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2c16dc38120so113085eec.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 10:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774545236; cv=none;
        d=google.com; s=arc-20240605;
        b=G2axkEB6olpahcObzdktHMcPYT0m1ClHAWg2+CIWb1j2fowa1+o2JPbBE9mfBHDIN+
         N4CwbiQyAafXKKf63/p4GN4eT+7braTLa2gkFtUfJfo8yaeFn65SPl14dvPdvNWBysAD
         j8GQVMq3Oerx7MqA6JF0UF5bQsySjjE17AWreZuN/p32rmMbOWTxcHk1RZib0L7Hz4OI
         Ltnx3+pBaZqi7F2gG4yKUQOUgRFv0rV2TCTXc0KiLg6ac7LrQDyX4F7U9OKVrmX/IXVJ
         Tq6tAEcbts3dYii2Xjbkgl9FzhVgNlTnS/UaSsrmVC1VKC5oAF1yNq+aYTe6kDJGysJk
         vHdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q9olrJwKlMERMQc61vOT8vZB7QpsPZJixmRhhkJf9iI=;
        fh=vDTfLf8JfYO+f+30iru//T/DvY0sgMsz3EiGBBIt6cA=;
        b=IPJFbSBPdcLqAmAiNW34zpF1MR6hJhvGXhDTA/vHco/Z/VTCkCYgutg90JHF52LpZw
         Fly0EC9Wj7XKno18yvAVAT7/5JAmiyL8BN9/ZNikM09CH9yWvNgxvKHpJKwGIJgsMz9B
         +yj0zamv9DB1+HBhqSCwbRsMwwEeWY6ezySisDAC7XWUHxU9bu0Ls2LRR4krfGoIWU0i
         vnh1Q+bGaDXe9nmgtNN0qGO/fOknSWgms3gbO+bMxGQ/0e/TRxeI/uiJVUellwjuZNO1
         uCc5QivDeuL24vmKtqOCEOM0CP4blvTIw9O16oAw5Wja78/CHA5mlpU4N6kgMG0Ql/L0
         n/gQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774545236; x=1775150036; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9olrJwKlMERMQc61vOT8vZB7QpsPZJixmRhhkJf9iI=;
        b=SIPCsbssMFgP7ugk68TbRsw5fX+PMhwz18UDM9KrjVTZR/O4OXc0HZHynbNSPlOQ0i
         xWK13yQtSi0DJUaFFFggGWkjVIPq9BWDaWXkY2Kx2qY6TZ7tdUgR9fRY6eJOtsh4nV6b
         GTWZLg9+f5WR6QOWoLlXcSsP2r2i+OHlciU5RidYrXTfjSM8XEez7KBLJrTxtNnDTTRK
         a2KxCQp6lBli+zyDTJslb24P52lAqhePxAvMEfm+i/I3+eBx+3tNBAXOIDkZi42YkEp7
         0ioVaEkhNUKDZi1EBue6AAiOd8pXehcLsjrP0UvpVTTSBv4EiLRutlSALzA1rdpaOvNw
         ulvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774545236; x=1775150036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q9olrJwKlMERMQc61vOT8vZB7QpsPZJixmRhhkJf9iI=;
        b=S7oVzXy+Kb/DQZE1Hz+d+7UemnsEo/+YhGYdH4MSn0oSnue0ufySCvfkx9kGV9j8lP
         +A381L5HnqoBDPZuj2zniKEhp6jMZyFUc913YVUajDS9PZeYhX/RNpqO0Q3jrEshoDoa
         oedf6okxHumt3gOdoVlkmKr+4h7Dw1YdaYE4ExWYcZKNo/v24/XCZBRb40T1FqeZuwM1
         TEe08bJycLc6KpJVh92y5Ky+WHg8MG9HAKm6CNi4LHxVWpmLfv54g+L6581Ijxcd7a18
         Jexp1GRCRLDBE+RosVD6fg4hHctRM7NnmonNhThk72Vjk21nKyALu8ZkehKspa0fnAyN
         st9w==
X-Forwarded-Encrypted: i=1; AJvYcCX4RVr8ahjeuznMbaIQuyd6xpiL/36JKcBKITS1JHio4q6JQkjfHv+cp7G1ur3vvBsGKZKDrYqSqWE83vCSk6xI@lists.infradead.org
X-Gm-Message-State: AOJu0YxjZ4nD39XO5bGuMxFRjz5SvuHhjiF1RKivoVXlXI2i78lEBa/K
	1y6rYx/FA+BNOg33ssp4VE1s/DiDqoeSwzU2oTy/U9bXl/N3Dkt2bKnDIcWH8FXvu/Gjoqh5115
	58RjQVRbqyRZaNwVJNQ/VBU18qNCQwoc=
X-Gm-Gg: ATEYQzwJNoL3BtpKTPIlpD6cq851civ8EUAKFMa02b7TJgIza3GJrt0mkvRTVCBdNaJ
	MCU9/1lSf2OscRVmWyTM1wILiNSvp0hSUJ0KQqbY7d/Ll/uR9O5JhAglPzJzkgPeCp9TPLJAcF+
	87ASyIiaiC8akl3ilbhn5mN8vGc4JS/m9ZzplyuD7e6T7uj8x+VQgH0E35AaOhb8aWi94lfREOP
	PGNTYQUZSEmz1LHcqz/IeWZVLZXFpDw33MfVO7SLPrqKHb75ztRLTXTV1GrQwdbbTdK3B/eI8uc
	lH9dwcxWrDW0chsC3rNbrgMG374llGFxuxjqNnZGzhLw3oFhq/6+byQ1eNvHeKthqXfuRKTkD/Z
	5/ouPB4aFovIOW2+1W0MFlBM=
X-Received: by 2002:a05:7301:5f8a:b0:2be:140c:bc2b with SMTP id
 5a478bee46e88-2c15d282067mr2407895eec.2.1774545235402; Thu, 26 Mar 2026
 10:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260322192159.88138-1-ojeda@kernel.org> <20260326024226.GB2302780@ax162>
In-Reply-To: <20260326024226.GB2302780@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 18:13:41 +0100
X-Gm-Features: AQROBzCjsVmkmyxhYBQlcnjNfjk1drusXCGXl2NpoBVYAfyx4urVLgdrjE0kdQk
Message-ID: <CANiq72kyFu4StTPbobkPBSMYxNa5T0uErkLj-6mRvwOquEsgSA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, soc@lists.linux.dev, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, David Gow <david@davidgow.net>, 
	Russell King <linux@armlinux.org.uk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	aliceryhl@google.com, linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, gary@garyguo.net, linux-mm@kvack.org, lossin@kernel.org, 
	mark.rutland@arm.com, mmaurer@google.com, nicolas.schier@linux.dev, 
	peterz@infradead.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	urezki@gmail.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_101356_469598_56FB1763 
X-CRM114-Status: GOOD (  23.51  )
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

On Thu, Mar 26, 2026 at 3:42=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I do agree with some of the concerns that adding an architecure
> dimension to this is a little complicated. I would rather try to flush
> out those build problems with patches and keep it enabled for all
> architectures. At the same time though, I understand that enabling it
> for the "tier 1" architectures is a low barrier of entry for getting the
> feature upstream, validated, and distributed to the majority of people
> that would actually use and depend on it, so I ultimately leave that
> call up to you.

Thanks! I agree that it would be ideal to get it clean everywhere, but
given it is experimental and that arch maintainers should likely known
about this, I think it is best to start simple first.

In fact, let me Cc the x86 and arm64 maintainers so that they are aware.

My current thinking is that I will add:

  depends on ARM64 || X86_64

and try to land it this cycle.

My understanding is that this will be used at least by Google, mostly
for Android (and mostly arm64, but possibly x86_64 too), so I think at
least arm64 will see some actual users on an ongoing basis, i.e. apart
from the "synthetic" testing I was doing.

> No real concern on that front but .gitignore has a command to run when
> modifying it, which will require a !timeconst.bc in a
> kernel/time/.gitignore file.

Yeah, that is the exception I mentioned. Initially I thought about
putting it in a local `.gitignore`, because local is best. But another
option, with a different kind of locality, is keeping the exception
close to the rule, i.e. in the global one, which has the advantage of
showing us all the exceptions easily (and being able to write a
comment for all of them at once).

I am not sure what is best clearer, but I am happy to do either:

    diff --git a/.gitignore b/.gitignore
    index 3a7241c941f5..3044b9590f05 100644
    --- a/.gitignore
    +++ b/.gitignore
    @@ -13,6 +13,7 @@
     .*
     *.a
     *.asn1.[ch]
    +*.bc
     *.bin
     *.bz2
     *.c.[012]*.*
    @@ -184,3 +185,6 @@ sphinx_*/

     # Rust analyzer configuration
     /rust-project.json
    +
    +# bc language scripts (not LLVM bitcode)
    +!kernel/time/timeconst.bc

Thanks again!

Cheers,
Miguel


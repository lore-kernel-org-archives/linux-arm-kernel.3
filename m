Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE75C02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 01:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+nCXvcuGbP6lZuLocKajT0ORe5EGrF6T3/N8VpC8fs=; b=q6jaO7Tx1e3NxwNCLHVT7eH7jg
	BaWUkr+elkz1ZEe1OptKMwE6neLfW1QfX4Fc8SzxzjpWHj/C5wsC6raZddY9wfq9Hh5P60+Jm1g7e
	36QodUSaspCJuWzVF7C8lEh0NplYcMWLUKLRUEJTi45v7QRRG8RRLhE/GjF47OfYBl8MU0V7Xvhj/
	jRD/YyUAWbJdiZuH0OSWgl547FfyGo/pdweIipB+pPerXr/EFApsN4wmFvwN6KsxYqB2hcqiab7CE
	Sh+wpONC2Wcx/1fv3m8k5wuRXCUSGfVEWB8XGa4CX9vpYRC5qstgye/37t2fHaxfnbRZzI8m/3LVO
	R8GLdu5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNwi-00000009NPJ-0ckr;
	Thu, 13 Feb 2025 01:23:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNvH-00000009NDp-0VYT;
	Thu, 13 Feb 2025 01:21:48 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4395f66a639so2115125e9.0;
        Wed, 12 Feb 2025 17:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739409705; x=1740014505; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+nCXvcuGbP6lZuLocKajT0ORe5EGrF6T3/N8VpC8fs=;
        b=bDyWKytAWwbycc1Zq1qqCtj2y+N26a+6g0tzKEPOEiODA3DhP56PqNjQD3tgnsCT5f
         csnFE4/HizpFPZxcqzghMJ500UAYsGedsIQMntiJltUEiQttIFBtXQImLU0adTcd9mkF
         f6Y+QBdYOVjANboq438kyke7zdxgYoxBOo6FgVPevzj9abWNaYEvBhxxYVsjvpAHB9Xc
         BRI7GPTcJGzYPkhw4IsW+QvxrR5MPQiZR/jS+eiRDdzOHpP/LL1UqlP/ydJHN8jLMWUC
         /A7CdYXKq6+DEy+Gq9lFJmPkV5XhZWQXovtcXwbLUBpOnaRoknpKkZ/WCkKRvlC8StWB
         a+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739409705; x=1740014505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+nCXvcuGbP6lZuLocKajT0ORe5EGrF6T3/N8VpC8fs=;
        b=A0SPWyya2J7r2o5MbzZAWlbqEBpYmciuMiwMeYujyzqDQOlcY7/wFbQnQsA5lJJthd
         U7QVL6nFCGmVaygQZ4zzYCZEI4qdbe9Ee6kD2mdYONUPKZCQWPF/p4kAgX/AEO7dKJY2
         p38yTKUVqGVI11iOiIs0fuurcREwxHeey2/bFSd5/9H280l3GwpZ2aJ49CPfBFyM7dbm
         VaQPRlXKo8zI6wNU3YelnWf+0kj0YBEatNW29PkAQQ7Q9vcWHtcZBkQGKY9XqnUU3zF/
         Nh5oEEXoqm1u6DZkgS/nL6V/tjad2I8UOE7DIHuD87nPVeNcpjdqX5gbq7Xrnh1/7g+R
         sGaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjmH4wEyenc90aI+4/qtHKGzjpkwrzPb8ftrvgpl/afLFXhTOEFTwJpaOE51Xf+V20/RHJh5h9SBGoneA1bGs2@lists.infradead.org, AJvYcCXUeSmbBl9erxkxP+lbn2qEXjdXEm0nGzsHeQfRIOjZvPXXqqmoKeLyApp7BSoKADOmvUxdfsHVPZJopIY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7JyygI7HYSP3s3xxruCWBoNmSXnQM8YaDUu+VybPaCh7V2fWW
	7Kqi+o0txzr9kPpS6JrMRJbHW3krGzJHyGrk4pYa9k7OpxVIQtorRFgX33OtAvNBYHnduYBrlLA
	cX/JmQsMjwe8RMz3drtweB/btags=
X-Gm-Gg: ASbGncvKsUgJ4WVbJGAcQOM5fito+8XrIust8I6MAMsWVfTo/BceQQdESuzLdP81sly
	dSwVa4eX5knnCLqTtRk0Zg1nZcPvaiIS83/+xaMYJo+W7VQ4IPbWwKwaecF/T5Ju323wXhfTlFO
	8=
X-Google-Smtp-Source: AGHT+IEjJMkC/hHaotdqSukhMJQZrOiaCkGtVrbEkJiI15zjYiRvHohJ4FkUwvWx7PY95qrg/tcG6HP5nsDWETkesBs=
X-Received: by 2002:a05:600c:198b:b0:439:60bc:71b3 with SMTP id
 5b1f17b1804b1-43960bc744emr6893225e9.25.1739409704648; Wed, 12 Feb 2025
 17:21:44 -0800 (PST)
MIME-Version: 1.0
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
 <20241022015913.3524425-2-samuel.holland@sifive.com> <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
 <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl>
 <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
 <CA+fCnZfySpeRy0FCFidLdUUeqp97eBdjAqQyYPpz1WxYwcsW9A@mail.gmail.com> <aqhm7lc57srsfuff3bceb3dcmsdyxksb7t6bgwbqi54ppevpoh@apolj3nteaz6>
In-Reply-To: <aqhm7lc57srsfuff3bceb3dcmsdyxksb7t6bgwbqi54ppevpoh@apolj3nteaz6>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 13 Feb 2025 02:21:33 +0100
X-Gm-Features: AWEUYZnQToSGphLmBmZFBpfuiZIg1iWlon9vHp3PXB7Fk9evMSAokOcZX5tZFRE
Message-ID: <CA+fCnZdjTkreTcoo+J8wMhwDuAFM4g33U5BFy0OPtE0UCvyJbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, 
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_172147_219655_4EF4C0C9 
X-CRM114-Status: GOOD (  16.45  )
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

On Tue, Feb 11, 2025 at 7:07=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> I did some experiments with multiple addresses passed through
> kasan_mem_to_shadow(). And it seems like we can get almost any address ou=
t when
> we consider any random bogus pointers.
>
> I used the KASAN_SHADOW_OFFSET from your example above. Userspace address=
es seem
> to map to the range [KASAN_SHADOW_OFFSET - 0xffff8fffffffffff]. Then goin=
g
> through non-canonical addresses until 0x0007ffffffffffff we reach the end=
 of
> kernel LA and we loop around. Then the addresses seem to go from 0 until =
we
> again start reaching the kernel space and then it maps into the proper sh=
adow
> memory.
>
> It gave me the same results when using the previous version of
> kasan_mem_to_shadow() so I'm wondering whether I'm doing this experiment
> incorrectly or if there aren't any addresses we can rule out here?

By the definition of the shadow mapping, if we apply that mapping to
the whole 64-bit address space, the result will only contain 1/8th
(1/16th for SW/HW_TAGS) of that space.

For example, with the current upstream value of KASAN_SHADOW_OFFSET on
x86 and arm64, the value of the top 3 bits (4 for SW/HW_TAGS) of any
shadow address are always the same: KASAN_SHADOW_OFFSET's value is
such that the shadow address calculation never overflows. Addresses
that have a different value for those top 3 bits are the once we can
rule out.

The KASAN_SHADOW_OFFSET value from my example does rely on the
overflow (arguably, this makes things more confusing [1]). But still,
the possible values of shadow addresses should only cover 1/16th of
the address space.

So whether the address belongs to that 1/8th (1/16th) of the address
space is what we want to check in kasan_non_canonical_hook().

The current upstream version of kasan_non_canonical_hook() actually
does a simplified check by only checking for the lower bound (e.g. for
x86, there's also an upper bound: KASAN_SHADOW_OFFSET +
(0xffffffffffffffff >> 3) =3D=3D 0xfffffbffffffffff), so we could improve
it.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=3D218043


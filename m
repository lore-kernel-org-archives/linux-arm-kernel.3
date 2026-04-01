Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE071076387
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 17:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=; b=xpIxKDSCsuVhT9DwCsIk1nCRk4
	BL5ewK9uPFilOPRuVQRQYt4JXyOw5Yz75R25RfYpWBrbrHqw6jvVn6n0Wojx+e4LZGKRjiC/apbDH
	3nlZ5ooxPQ0plXPeIe9m463C4P4DCLZ1Wz/rNfL9Xv3ebeAQ8jFTZtsmGBXqbR/cEl7o2BKToJXrd
	ci/3LYrQLiXgBR+iHIiYBz7ZLA0G1NolRLhwoeOdAuONPl2jHzsqIiHTSilTnQyfhtm0RTEn1vyk9
	2hpwV/A0nuYkfa+M8+wYNcuVsyJNTjz4T9hQ7sypi0V41MHbIRn0AnDcRIGCPv6Z14jiZlE50faY7
	7fSqq2WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zXj-0000000Fs5R-0GMp;
	Wed, 01 Apr 2026 17:39:51 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zXf-0000000Fs4c-2key
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 17:39:49 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2c98928e4bfso4501eec.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 10:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775065187; cv=none;
        d=google.com; s=arc-20240605;
        b=hz5seC+ndRPSMARmEbkOqB0LhYDEgwB7OEw+hEC7vHGjXwuCR0cfScVtbzJiUfmSSb
         k/a1KBNIWPmX7RPRUkxYyNLCP9eFpJy5b0IXRKaYr2FQPOIkUJvJtHXr0IYzNbanI3Gi
         RYHg5FaSvZiCeovYWTulvIKbUDvENkZjpveSHuOD6EEIvh+qsS9YV0cp0z+19cFApWNk
         D1hOuBq76BykHEaZB4WbMtesN7an8YAWUJHg1WEzUCNi2SJxXfmToin8hD1ek1K1hT8S
         OIJcNCsVCVBWlHQlIAekBbKoZC2hgfXK9cwOC0c3SGNUD0D20Cg2lMWSY2vMh/cy7hiM
         3RVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        fh=RqrtISE5LLbqwNmNah0aNAGtd+vh7CaVLqNUaYXypp0=;
        b=kWFAXOEQfM/NW587Y2Mjc8LgmeaGGo/BfKbUIsbF4bLYHuyP3cr9Hxz49/TdZa0aSA
         SoTTbXFeEaNkvuP2yYeexsuSqWKDS1LdotZRoHZmMXM/ChMg8b+5nqu9e5TvAOb+7uZ+
         ORouLzgK1R9dmXXzddF6ZAPdKehX7lZ1MltrGzxG9aMyo7ypnkB4oAEfxO/VwOJgDDYa
         uwNnE5SZPteHMOM14qi/ze/VIGtIYaOhLSh9ZIE/Uqq7ege55RvBd7P7DsEMRXnRcXqu
         JMQK4c1RA89u8J4OebSmJuwNPObtO/I1gB9g1QfYcqpDsmWFz+kKGnDuAKaGJCDg3vIE
         /9lw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775065187; x=1775669987; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        b=rVUWDRuo6zrj2cBi/BUAn/ncUD29vRzv420zKrchwhZNHY6w2rbOwUXUUL6I0Y061n
         6c8sysQiIDemLPw5U14Q0YRiQS6/RIuYbLYZWLiH49aLUgHe/ON8oV9aOtQkkWKEBpyl
         2rLxAOzq+b5yTKcTb7MGas9Nh1GckPqyQhnN3jPObvjLOjdqlMdUqrJFhSoguFHwgSq+
         jHBrRjTNVXRuhnKY9IrFuta5+kI9ByU54HEq/kJYLdeZn7CEPjwVd+X72JRRDCuS3iyP
         /OhHGxH8tMcMd2VEdibs5kQDdvFZ8fGrdoSrku6AquSYlG5HdctW1J5kX2+3qi/ZGx3O
         HNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775065187; x=1775669987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        b=Jc9xTa4D5MyLV6hUUEeUDkbrX9PGhdu54puTnDXU15PWJ1sX+aHs1BA8522bfsUgd2
         FH78m81FH3/dwOsNqfqxI9fNZLrWE0Y0NrliHmjBq8pulhF8hCXGfkkxCuq0BVz8qRWg
         a63gurokt+fwe56+8xdDTIZ+FJizmdDZZvyRAJblKY/8cHX3GqoFQpuOHtleoWbPwTZh
         W13sQ9bCXZZRKQZ3WCzSoIdUPwQkKXC+D8Lxhk/nZ4f2qEMI7tCjI6vsU3OGG4rds48i
         hr+pGnpAs1x0rXwRVqkGMlym4U7PPwujURMzPtBAB7s+1EaqKRG56tHAwzQBNI9gSE4x
         qy8A==
X-Forwarded-Encrypted: i=1; AJvYcCUYlpwthT7Ueh+HsvUgHXizeESXyQiq1fpLLYZvsqSRPen4099AUa1TS7cB64R4ETfSQG2uaDZaZ1iZEXOklslA@lists.infradead.org
X-Gm-Message-State: AOJu0YwzSDmKCIBi6b/rrKWxOrFPHVDPX6t2JynQkX2sZcIaXCmFIyxE
	zmlCUhQKg8MkZJkEGckGS0HVzg0PV5NgtNK8Lkh/axQAi+oa0osZqrN+DEaacTOFgkixn9kSGEB
	BQljZeYb9nZDvBnCwWAMxR2yXcjF4feo=
X-Gm-Gg: ATEYQzw2hxgwWY9xCBwX9a74zhpg3tXYcb0IrYFHOcq2oPfTssYlD6QcUtM/d8asVnH
	r/2vuhYS+fefKEOISlmmmuJLP0VxK8VSiB8VtBxuVF5LYQJHiigumV/O0nAhaOS5bww9jWBMDNV
	yjllV8A/1F4a730gJwiUHJlWyijezcUBJmF2puIwBEQQnw7SK+k0mnbJhoAV8rmz7Nn0iBBHjqG
	GqkFirYsvbdEw2NKS8VuesLPLjz+Cfk132kAUhj0RgVXYpFkLTMXwNblgG/OtVfvkGcBeJhMsp0
	YHcqPehDLuzgDMAvc3xm4cD/Sk0syvqVaTEArbbnzFbp8BMyS5Wf4upIv1peRRRPG94synzlX9C
	9gkYuKEHsEN5mxf5FZ5lfA3tSuXEdHruQQA==
X-Received: by 2002:a05:7301:4586:b0:2c7:2cac:8147 with SMTP id
 5a478bee46e88-2c932cb3abamr970192eec.5.1775065186457; Wed, 01 Apr 2026
 10:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-10-ojeda@kernel.org>
 <DHHVLQAOMLWB.3FHHSYKNM5TNP@garyguo.net>
In-Reply-To: <DHHVLQAOMLWB.3FHHSYKNM5TNP@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:39:33 +0200
X-Gm-Features: AQROBzBO7Aafw_pbzha_JEZl4Ht2QE7dpytXYa0WjnL8RQv-FxGnezpSMqEOLn0
Message-ID: <CANiq72kSYFiS6zN+VLs2URhAeHy8_-aEXki1pyR0qoj7jO-qSQ@mail.gmail.com>
Subject: Re: [PATCH 09/33] rust: kbuild: make `--remap-path-prefix` workaround conditional
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_103947_714574_690A1461 
X-CRM114-Status: GOOD (  12.27  )
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

On Wed, Apr 1, 2026 at 4:08=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Okay, I see what the comments mean now. Perhaps squash this to the previo=
us
> commit?

This one was mostly to ensure the workaround was not needed anymore,
i.e. it is more "optional" than the other.

In fact, we may want to just not have neither of the patches, i.e. we
could just remove the workaround given the timelines of the branches
-- please see my reply on the previous one on this.

Cheers,
Miguel


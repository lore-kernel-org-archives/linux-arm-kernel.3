Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADB7D2ED0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 13:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=; b=EjMYi4hEobNN/weIQ3U4wfBW+O
	+7TWMH7UYn9kKkKpCSw5L3PJMkvBSY8E9MaWzp5JMeY8B9bT0XWLwiXb6tiO+bA5pvBnLu5HuUcUb
	6VhpuLRNDOcS89uqhkrfY5j5R//Zkub3Tnd4NLHsHzK5Trl+7haqt0FFh/q/gAxdHfYeXqL7uwem1
	1TI/jbHgNkXrIfJ19tYPUr6OrBwKSTlDdOmzevmvdWqxIC90Weg/jky94FoPi/el7/jlVOTNk4Sd+
	oGRMp8RUikGqQj0gevQ/sP40qQbme43iQCg9vS7j59vvz87fwwpTlGu7WIW+dVImKWwJXHxrOFJse
	3r2yZViQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vfm-0000000FJeD-0MrE;
	Wed, 01 Apr 2026 13:31:54 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vfj-0000000FJdi-2Di8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 13:31:52 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2c44547f6d5so195452eec.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 06:31:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775050310; cv=none;
        d=google.com; s=arc-20240605;
        b=eK4zJkMiRdsmpJsOWtoZrKC/hGAeJncUFilbldJuT2+kOigCr8n8Q3QXYLRIRDLt0X
         Pgkut/Drj0D/pw59UqRL/1Yq9wd8b0xsPs6A/Xr4B+k1gD3BirU2wzEJU3WeSqEbYFEO
         5nAH+mZXzkUnEDUGwJK14l4mUNKTsBlM5cEXMCgNoQZH149bfqDt4BWJZw3dgVZ2K2ve
         lEuGlXzhMNIRoW6hXr4YuNmESIYkSmbIEhOQPDszlshbnm4BFH3OV14LwPPbx7TjdQxd
         1YIioy6ZmwNfmMArEYF8WOIvLaqUNZNJwnuHP9dYFynmRvc64Kz4by7cH8T4lRstnIsY
         IArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        fh=NkP7Fp+ekcgr/6Reptzdfzej65Js0uSkaeRLCfRhQfQ=;
        b=BNGWzRPpNxfw2qvlopVewxAiQXwRRaByUhl76dIMw/a1GbecK6QUNWRAAZwUcxsZPZ
         zvIvXCGFdD/iMcS3wSnD7S0K2Q5tp9/gZSjY16uNMPZKOdEC1XxZfdRr9FYYog6Z4gWm
         grQPMqU4NbTWvUIlEHslMo8XVSFjeUsLJTDINSUjq9yxGWfm1TdHMtP8tLiHZThMi/Qf
         rOEZ6d0nFNu06MWgmB+5uKiZt6rJhwH9SqRyxBYFCwYhlNGekGeGPkfxakShSg2QegG8
         /1UOD6HIN+AqIH9s2hBPhvHkt6bJvJ8fwx4TVRfzL2tJK0le/PAi/pAapSWCkiaslaA5
         pXSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775050310; x=1775655110; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        b=SCgR0gvuCjobaq9a9ZFi5Bsp5GabYzSyQ2nsqnL5+i3+12XIMqdV1qoIBIndTOBz9E
         UjT6ubnVI4IDJOKjgBPeLNxbSrBj7+nd00hCA0/4bYQ2mHX7FDMyRPetq9X0fDst7tjt
         fp7XV/1ZuQGhB+yiZbAxf+O5qkLjAnkzeW3oJ+OeUHYWyve+JBCJ8OvZWyyLSJgZW+3s
         syqSre9BxIapR0DD82IyMr1G4yTzPEJraEJdlgzjwxV4S5UFTlnaW1ZsWWOFq0+uwnYs
         AScAGHWhiRm3pPdwuMQP7Sv40CazaXEziCwSFy1Iw8PEC54gHSgKrt8wX6UVnCEqgvZp
         btXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050310; x=1775655110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        b=Ed04wiF3Fq2/wuSaPnLc3Y5PzEhXLa7q39hiAJKmnfVQTXNSbQPkBSRJOVAr2fMT0u
         W3OnAMjP0qkh4MW7JJvicUnygobgestCySYTq2EkkIuKAHFu8Lb2frQ71ZG6obhYWo+g
         34doILiW+emV+M5YpOUIfvWEREq+qmyY8XeCyF6UtHfWgzRzeYaz7vX2r9QYW7i/nAcl
         zg9L5lHP2RVFygr9cQvwtCgdjTn+Hfgr2is/AjoWsYeQG3Sp07Hkep4VnoJYq6PR1SCR
         v0mJg+SJa6CucUyP1yy/p1prqRXCcR0DMBSdt7O3ZKq7UyhkeJiWryMULZ8Bbb+1tRNn
         TCGA==
X-Forwarded-Encrypted: i=1; AJvYcCVVuNCL+8agaZg0RyYbM5vCjzjFERBfh47ejh8IUNoA7VhoihIB93Vtgx+Cjb0YcW2+R2D6AOzewNJlyVeRU4fi@lists.infradead.org
X-Gm-Message-State: AOJu0YwII4mizJk1RVjlUZmBH/vSiOFdYrB0ign6kklki/6gnrhqjtjy
	Jal3h5OR/wbFJSz7ceuga3RWNYTBI/Un18uF556X/iY1HkmLNm9AQLP0Wx0/d6XzBA/qx7CJIKg
	d2biae4hvOGKrbzAd3pQcBi1cbfekF2w=
X-Gm-Gg: ATEYQzwO5LIu6+8SFfNuwofu48IoTeCKMFmqSzOYGSYMjZLvjCMbgO5jOSj5ieXcG1C
	F60LEG5j8z6k+d8mzAJcKiH/baXPUua8N1nYUO3c5C6kv+KL7ABeEfhL3Jt+J2yvbWhhNlxoDjR
	mraTu5KMmayCwVaDQ37Ke/Aeu86iVava8HjHdbkntASMUVl3N+Um8J65CVq9dn1UQuIZsP+raM2
	uKjB6g/ZRsnm3cxQGP58FRS2Hwyc1V2tBFAi6WBJ6+4miwgMWAM5UQVY6ijUOTOpTxPMyI1i/ud
	FMbwvMXiWz5/aSEtZy3WUJp2N4jrPDlBj57xStPCx6R13/mST+Yhpnu/2/74rw47vGZVBQmXc6d
	C5JT7xU6AJrcPFqye3jxpelIquKTbTk1h2A==
X-Received: by 2002:a05:7300:fd16:b0:2c4:6ec:141e with SMTP id
 5a478bee46e88-2c932bab66bmr849425eec.7.1775050310241; Wed, 01 Apr 2026
 06:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-2-ojeda@kernel.org>
 <DHHUQRB9ZL54.VQZ7OUZNSYDS@garyguo.net>
In-Reply-To: <DHHUQRB9ZL54.VQZ7OUZNSYDS@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 15:31:36 +0200
X-Gm-Features: AQROBzD4KmXruNHpjUyy0X5nLhLhXQUuTTY9eP3fb4LBTyRyQ4wVkUjvlUGGI0w
Message-ID: <CANiq72=FBbJ--jrzYyKe3T56YqT5eU+0DXzPG3Ho7a+D9rfu=Q@mail.gmail.com>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0
 (Debian Trixie)
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
X-CRM114-CacheID: sfid-20260401_063151_570198_9125EEB2 
X-CRM114-Status: GOOD (  10.75  )
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

On Wed, Apr 1, 2026 at 3:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This diff fails to apply on linux-next, due to conflict with ece7e57afd51
> ("docs: changes.rst and ver_linux: sort the lists").

Yeah, sorry, I should have added `--base-commit` -- it is `rust-next`,
i.e. 3a2486cc1da5 ("kbuild: rust: provide an option to inline C
helpers into Rust").

There will be other conflicts too, e.g. in the list of features in
`scripts/Makefile.build`.

Cheers,
Miguel


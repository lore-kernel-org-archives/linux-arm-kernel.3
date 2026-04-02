Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EA8CC6B00
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 07:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=; b=zF5/qV//KNRYS+HiVqwCjePdZj
	GKDp0grvIt+yP7UxpKEWqcZoPaYa3n6eYJaSMeroHAySKwRpwWMmeRw6agB44Ar+hhgatQDNtRwz/
	6WrZf6QSBW8/az73AdtkeJzKBkcxnPhB9jKEfVakRPBB/tQBHmInlcHfJ9Sph6EkhHl7zP118ij9S
	TI4jlnHP7QHoosTbZKDj+sRsSOqUuR2As/+YKtra7VKnzQXhG9rr9X+dIKVx5EHLmsb3j0hiTH9R9
	CQzrDXqgH1G8WoOeGIhSfxvrauSpJQByDwqs9BtlHcDsHijVRJfiVSqM6j+htNQnuMmcpNcxNjMz+
	dISmN/Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CEK-0000000H0Qr-1vsT;
	Thu, 02 Apr 2026 07:12:40 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CEH-0000000H0Pd-2D9V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 07:12:38 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2c6f5574d07so14122eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 00:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775113957; cv=none;
        d=google.com; s=arc-20240605;
        b=cs3k7iaO0ij/If6IlTlqR6OwkLP/NRVY67Vy5bdNGl0Jp96WdqIgsDtBOWeGZkm9s7
         /GNsEKZzp0i/XvUZT9ls+N2vS//jJ8R3MnAwBZ61jVHFnemp+tsy1DbRyI3cmrJTixaa
         DxrLL7kdgAVI7jRPi64hWiOv9qWUi0klsNv5h2JW6cGZMW/2zrs+VYGlaF2rRkZN+/6H
         RelnQNof75mJqVEvk+l+WGEVGvhLemEOJakA/eWhayHwrWzFWWSFHU8VV2pRaY7LT4+r
         sxurAGU50tv9Zdgr0jQ79UlKSnrxzv1KWXGdBivr6JJ3tMfoahvnpX5ac/TK7cLMjYpB
         Grrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        fh=OgMmkyCtVgyQb78qJy7vNbaz1Kp0K8Hlltb80T0smAQ=;
        b=JvkfMpXo0stQyLMuPvfvktSEGppgq+qNNULRdTrg1Y6qLywy91sDSD5N4KszSvfyDQ
         37yBckVozrB6TzdlheN4jGyEpNNyp0ULw3nJ5/rd+fi6ZRDxHNKDGn2sRc9ZX2OiKzdK
         g4vr4edPNn790YcFMiGPenh3ES4hIVamZvJCYTyvWoite7B3v1sn6vOZw/UdQuZClht1
         O+uKsj2IzCy6Sc3Sd9ClkDBHyomY7VAwtEhcQKvv5YP0mFYR/FmHdEj2k8T6jRTL5pnB
         Z+IFPlcIsd4LxEk9SzTk0bXSSsR+Qr7gJ7WsE07Fl7DHD9yMGjj8uBM54ysWhq84uuzi
         mnbw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775113957; x=1775718757; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        b=kDf8rgoZBqnM1kuyvPs6jcICSWGmsT0uFJGvlMuwDTonebD0MW0nGwmnesEDboYpcx
         4Pcsv7EhgAByTirfIpIJ6S370/ysbtKuhX5oN11Rtyxjt0oErmmTLqrBoCWWByxnO2Si
         9VIBMuAYRGPUJ5ne56itIJ8tJt977TFoW7ujolt1xnve0K4EWYzyCedmuaF+uy6KtROL
         VkufVpIGAtil55or89BZzcmsgbMUAn3pYkuVueXvOAJxnW93x96+CsqJBvY0pkSGR2SC
         +AZNY7R1Mw+vQ0Ave5N0bN5tFc/xXleFxQIpH8e88zm3hcVmR5HopeTJTokNE50iHVxa
         bkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775113957; x=1775718757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        b=jaP/D20W21VdgqGI9OXJJz0w+IsmPVyH09otLLyW4uGDiLriA0owNX4/qneP0TdZIW
         TIFGnNAnXDtjS22oJiuQT5EIZzeHTsmwotWXHHQDf6lDY0uYfef3D01kpiREPZBPe6+A
         rxVQjNny/EW6nTpSyOZWEuHwiAoYGbCZWqhRz2zgPFw+NAk45A+V0UQ531cJm/U5fn7N
         R9dMBipwa6VyM5R9aIbea1eQ38M/DJs5xg9ZPhHDpSWYKu6guO97GPWgUpPlF/pVgIUK
         /DWI64X6jj/yRg7ThUWknSdxLN34yfoxzn9Z2eO/nFxc/H/gNTGYygfbx3VGpZ1eznuC
         O21Q==
X-Forwarded-Encrypted: i=1; AJvYcCXW3D0Al40HTKIE2Bgs1O4IKfGea/Xa6uTieIIXtUY4Dt1oAQBYHt2Yop666bf3ipXzAk5gIFzowdNrUB30Fdp/@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi29oEvms9yZ1xDRYNxzRJjvWMm/dU6JoVX6D4LyaOzz9wehm4
	f5ZwtJSRIUGusHLgqbeqcRQABcc6ANUKKq+psfVlmy+2GFRShxynvXRSHBD1vOWQUG0RXEBSNXD
	MA/inAWyX7pD+Zbu6DGO3kTgR0seyC9w=
X-Gm-Gg: ATEYQzy/5cdRe0kiKuKcFpCLM56WPMtqBouboj+LR7xk1HJploUIZixHFXElgYK5VC8
	RziGd+9DiJXPO3a2rNy/UcKaCtou51GoCFKgA5EdSMBuXt6B3Wz78L/OoSDmbOAn5eXSw5S9J2m
	5PFDh1rnDUvJ+hi+K+yv2TjFm2npI1MLV2dCp93DVds26irwYBLs54sfRrOB1BE+fxfTfXnQQQW
	nJk++mBDE17nJfaIl2wx/ysi5kppGWj2ByKvgzlbRDahCLjne/uy4U0dli7TZ4gPoCYMx1PZ+4x
	6jlw9nATEGTc1Aqr05akrrvzxWWJBbjOGjeduaSVpaulKxlWiejsHcZzpDGnkfj/JwbnEiuVoD5
	zGDJUYdPlWtZ6ZINAcnD2jko=
X-Received: by 2002:a05:7301:6790:b0:2c1:6416:2a07 with SMTP id
 5a478bee46e88-2c9321b7bf4mr1634311eec.4.1775113956496; Thu, 02 Apr 2026
 00:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-16-ojeda@kernel.org>
 <DHHWO582XLXH.1DU3CO41F1PV7@garyguo.net>
In-Reply-To: <DHHWO582XLXH.1DU3CO41F1PV7@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 2 Apr 2026 09:12:22 +0200
X-Gm-Features: AQROBzDaEWueCbjTzytnJo43NDIAkvyWYngeEqQLnAsLh-4PZJOJIJpad43tD2c
Message-ID: <CANiq72n4sCU=2m4Uee8Wpsv3mjkw_BuT8Sg54Gu0U68j7qAM5A@mail.gmail.com>
Subject: Re: [PATCH 15/33] rust: rust_is_available: remove warning for
 0.66.[01] buggy versions
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
X-CRM114-CacheID: sfid-20260402_001237_572227_6FFC1FF8 
X-CRM114-Status: GOOD (  12.72  )
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

On Wed, Apr 1, 2026 at 4:58=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> The scripts/rust_is_available.sh change looks correct to me, although I c=
ouldn't
> get scripts/rust_is_available_test.py to run on NixOS.
>
> Looks like it filtered out PATH but uses /usr/bin/env to find python bina=
ry? For
> obvious reasons that will only work if python is located /usr/bin/python.

Yeah, the script has some assumptions on it (e.g. it also assumes
`dash` behavior vs. `bash` in a couple tests which I should relax
too). Happy to change that.

Thanks for testing it :)

Cheers,
Miguel


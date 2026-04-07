Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538AAFB5178
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 01:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=; b=SzACPy1xpMmMDdWD9N/Eivvpy3
	7+e8+Aq6WjiAw9panNBdHAzWYtnHh0hXybdLEJzWRnsCCcIlCLHajFyRcQJOfO2dfiUHwfBRUzllY
	tvKDY+wEnlNDOfDdOkwzNDvvNU3yGXUDuYimZifCr4Fwctoykae9kkETFAm81QKKd//p+uNG6f8tM
	+ihoGLX1SNQEmkpw6PpZT9vhokFyprCgaCFIXZh8OrEEsNmCD6tG73l+9+TNa99DsoBijPXzdvM4g
	l+dKUQpD6dOHrWqlvomKOqs21nxf2t9+ptw7i+pxuQLi4ysI4TRUcNwGG8fnoA+Xn9WCMbI7tXrEj
	SXxfAvzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9v2M-00000005hIt-0MCW;
	Tue, 07 Apr 2026 01:15:26 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9v2I-00000005hIE-2LSY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 01:15:24 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2bd5658b901so266179eec.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 18:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775524521; cv=none;
        d=google.com; s=arc-20240605;
        b=K3copziIvyBUApEPaUULwvoBtyFhpDZSSmLdEreqKGRey+KZOzn0U21aL2cSt/FWpH
         +C/9o1KhUsOgA+Wz8euJ0rJpH+S6M0+JWiSL+KgNjodJBd3ovZ+CkKAZlJJ3H8tWMzsH
         woyFmt5Eq+cojb3CY8F2NlG3gTiMQkFgvEQ60zOJxFcWG6nN5zeSrNkxmzmi1PsabXL1
         0cNLUQPuVZe2B1desRLkR2PQR0driJS5sxg1qsGmYaYTNrEaptgy3O5AoRZWkwKh0RO8
         TSmzs81qIdTBwBbYg6K04WGJAPEvyPZ7ndChb5TJBGSY4AcNgQei4K9fUNoBsmcM0GCs
         IFiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        fh=p2o7xjqbFzk27J2+BZrRkR43bk7/IiXcDKKtD9eA5Xo=;
        b=Ln07apNuSnnVE6eyvtS+jxHcRUBtx0DJmstzP7wN5ippPI4lmzZllWT6IHqBYDDuIG
         4CWAB7bq1S1pOmjkS/NiQ8f2eg8owkuzB4mZKv3qTIB4u6AkaNKy/IYl8UJOl3+WTouD
         I8FNcnbue759gV9ZcbTobHD3gTtLW49hlhhVp6NSPzHrHVnDBzQvgK0NqnsRadcMhzfM
         PX3S81BMFv9BPfzG7jxlo9o7Zm9oZ3x/HJeMP79ilDdl1UmSoCwna2nxyPHBENzG5uem
         6+yrxjtji5pC9GY5cSMUk++ABN00mF4DKRIgyhQX5C8qn96+oW4KRKfCk1tDnunwpztr
         OyfQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775524521; x=1776129321; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        b=Gxu3tphWluXwFB8Nv9b6WLDCpnsm5QLhCc1EinxEdsPeYtDTSUa4SrdvIImU7qI9Sz
         HH69lnShkjhAQKY4eAJiZfU5k8MikvaiqU//tRIwHvJV/TnvRGEJUTQIw7aZp+gSSNZC
         53XykK3A2KIJhSEluEb6nqtmsxDiZ6Gh1HLwmhEQMr+H+eJxp4wscLcBL6Q4VkO492YI
         Fjnpp/n1MDdEgMihx6jv74+IXmkMMEe1wIH91gxL/AsSY9YO2zwQOhfY8H6njBX5gDwW
         NY+YLWFqmT8b7Fn5QGXxZDrP+8m63U/CNzSaDuXJll2quzeCRrgzII/LmUXle7kcLQ4c
         zfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775524521; x=1776129321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        b=R7KoUTCPgLPkViv2/W1JtxUKIuAyeLlWfLx11bBLrfEwSMxcu+H5KvpSkwFf0pgRvz
         qc0I0RUE+aAmsp/ZQsP1beg1HcettDPjLZ/Om+JY/tS1Tv9rLltfrG1msClPIyeinUBG
         7E8dHi8q6EugHn+nRzxasXbAz0sAPllIJEOeNw+F2gf2zFSqLqID8RpMPMEAOa7aQ30J
         IoeRPn8ftT/+NK36JHqbyA7lc52MIUaTd4YKb8DxOO/PNiaI1HG54oWXizRFyMXtVyBA
         7/wxJ4ZWwuxz+dXehS15xortF70UPN2htOVVFhpxusE8vIZi1/jUsREivZrjhHQbmWuU
         8zFA==
X-Forwarded-Encrypted: i=1; AJvYcCUhA7GPXs6cJFzly3OVW05gI//DgQO981mqiF7eA7lJoDop+tGKnbxoJTLz2I44AT8KKgLp79fF4N1SBuu9bibW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8UswbSqktevEXNjV7EP9tv+X10M4ctloqwBV+ahhO4h6P10Ez
	V4mX0/a0bsGQ/ueUmfkl+0hztDqtKjak52mGzOv1V1HC591h05biMktdQELBe7WB+754+QHM8c1
	9d4yY/IMNeA4YuF0+Jbq5qSrWyj+Rp/U=
X-Gm-Gg: AeBDietSWlMqBTYyDE8P5PXkfwfMuMMxlR+f6Daiy3I3ZJL7yv/yfmyVeHWjfL8avR6
	Ohcy+QCYa9W6RvTn7XiZ7VfHdiROag67xp4uEyK9k2Qr5m5hKXEavLRzBDqwRWYa48u1Tp8kpE/
	RmSCVtzEUoJcox+/ZFaBwM/NfPRjHaPn86Al+JbPPovgZ068A+hJUkH/7WYcPl62cCwi2nF9P/7
	MrK0h3vfETxlGUR7C0udEWUm48yYZCeFw/RW/l4UjZzHwtl8KVDd0hf3fKDAShgbLczksmLubJP
	JwFhCuunJ+VtyWcw2xmp7FklGjjHSOkIKi7FHWiVte9VmFzxAdceq9mtoEBLWic+XO7eeYCKNep
	49n07BjajuUFLxPp4RTmTjvI=
X-Received: by 2002:a05:7301:1007:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2cbfcf52a13mr3516734eec.3.1775524521173; Mon, 06 Apr 2026
 18:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
 <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com> <CANiq72n4tmTzqbcHCnzUBFyLVmJzB-AJng_1FgELJCWr7hDg4A@mail.gmail.com>
 <efe61810-2b28-4acd-b69f-d577042c0b62@nvidia.com>
In-Reply-To: <efe61810-2b28-4acd-b69f-d577042c0b62@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 03:15:06 +0200
X-Gm-Features: AQROBzCpjGVGSHiqD6WWW0AkLWSnE3ic7jf8UnYoPnV_5tut3XVgaNfJWwQj0o4
Message-ID: <CANiq72n84On9UxQ9CNqyFb5wpJZKrBzb1Xej9ZRqhLim--ftAQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
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
X-CRM114-CacheID: sfid-20260406_181522_679393_2EF35A63 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

On Mon, Apr 6, 2026 at 9:07=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> That's what I thought I recalled, too. Weird that it is not in rust-next
> already, though.

It is normal -- in the kernel back merges are generally to be avoided.

Cheers,
Miguel


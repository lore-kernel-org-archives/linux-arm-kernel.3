Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD041076387
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 17:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=; b=uYliXD6Qee4JloRJuli7otqSpy
	O7LAOSUmU2DmelewUsZnvj9zXDXMZRB6Qkaxz/dHGd1LmpKQbkrIhxyGf71gySnQacIBwoggyOWDR
	QNAIioPGvMDGHeVcLff9nWCq9/uC842KJ71ymb0xeIXIMwe028+exqbpD0G2odiP1xWtwKCiemK64
	mrhZ6gUqyG2uXcB74Tj5UVczWEKRK8OlpyYAYkfthrh2FR7P2sxckcpWUM1g6PLPJQQMINkvU02x1
	8X8Z7NGnMGYtkr76+pCC9fSej4O3whmXGWkuFZ501Yg4M4T2RYlMO1fu2USTPvezVRpL5/pP/wXpC
	YTRDgueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zUj-0000000FrQG-1XAa;
	Wed, 01 Apr 2026 17:36:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zUh-0000000FrPz-3hBm
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 17:36:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=; b=OYyc/+nzIkA2nAzuw/4g4tm5A3
	PvGoCH0JpCdkhq5yKxtK09dAQdo2EFIYotXoCLf4Rmnu+hoEOl1pkA6L2foI/tSAkqdLRSCxDoL97
	ZZkKaU9rgheUz/JOiT03FBvqpYvd5lxD1hkfCskoe8GofvGtLkgtu3fiQXw0Puvouol2uGSJ2R/vP
	dQUdXx0vVcKuglM1dReHenpa2d6SYIWvSqUa/YDoq6p0eMZyvOvlOAvwe8iIMg4SKngaVQeIALcLI
	//qT1f+CXCpE4uGtLvbvcYXmR4YqYl0SNWK3/Udd+6Xd+lOSuxuu7Yso1HIYbsNi1xgSvGvHpW7h+
	zfVHP+pA==;
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zUe-000000011K8-3nel
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 17:36:42 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-124a7216c9cso5563c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 10:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775064998; cv=none;
        d=google.com; s=arc-20240605;
        b=jaBeNsE4AjoE1nQxc4lVvR3EPKhfj+SuwKOugOHsZyMDTZY0vq9huaZOJRr7BIgh+x
         k3zn2cEJRDS76uHJjxFKRpMkGrepXDBRTWRtSZYmSEvhPNu1356T10+iiaAxJjnRRMUC
         tiL9/24TbJvRBfHGME4+7u5igAtxz9sxXztZ6Q6HsMb/cIXJmzpimxbYmRQFEfe6QJm/
         Z+kkfOz4DpINHcCRzYXQDs8C7wz851ne0MD/zxTSzD4hz//kVaF0yCpBzTlw/I69FwxT
         q0XKt/mNGp6GzTofBtorACRQS60CrFIJYEboZp0/sBHHqAud5LRKpZon2oYxDEBjTwHR
         Lcfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        fh=/DXue1TlYox+7fIAQkCwzPJegFsEDHeLDkchekJuuUI=;
        b=HVnrsltgCL51Yk3Qll6JVryiJuFDKHQx1pa2SV58SUueVQM4sjmZ4KtrZbeLLCbIQ7
         aDnJBV6trUwDZSG8j5XIMMaJIFymVb4yxJXFKzRDV3F+76JzFQsXbUOrsBcaB1aWBFgc
         7i4OjMotFI2r3YsJC8jfzLAWNXTHOHfjs2M5MJ68/XDMuiPaPAFI3s4vhbx577d9CByS
         skO+7plwq5MIJj6JRucex+Egdz4NJmqWfP7BHg1pwYxWmHp1CKlH9oF9rufBlVWb6gM3
         9BaaZkwOehh63PEpmvMe+MP8zrHt0zJwdldAx5dA1ThjfJ63AqxqDRJ+OY6Fx39M3bu1
         RBtQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775064998; x=1775669798; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        b=GkBCFewdTgEzJcAZ8RiLJvlTlOTXa/qqQgMztyQsMq64VdJBY4JSwtDq7Y60ow95MN
         2V2JggLro89vqIpn7oy4R47ZWXKIP9Zg5KdBGmA/F2/KsG8Kn2i93MSbgPIz29ddpyq2
         K4tPuXCJRnqIuYt2Kzwo9DwM2UYsvb6Td3mpWhX+vElyMk8PBsaSxUxY71y3wvLlBVzH
         AS4yVlVFmxjsEzc2EHNZieK5BhgJKHKZEYrAbOjztP9/GT4lg2ov4yOJNRstRUynLOmO
         K1jAwwx2I9G4cgdHyyQgBkVOqUUBWXp9dvcibI9Fk3FxK+JmK0z5PDQOZbfB4hSCpzot
         WcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775064998; x=1775669798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        b=AQ+0znM3LUdhUMAGm3NxALBawLYxWymR62X1pIx/Fldu35NpoyM+Qi5oFdWSk+EhGM
         Pxbk4HbFgREnk8hfF50/JjhzF002QgtoJrkJ9KF7srBYlhFhMVz6BDaTxRMkNKYBhnge
         c1bbYJ+GJW3890GMwMthaJ8bGn2p2CEh3xAjQPql+xA0mjDPwpJiOLJOkEts2YkfQeWM
         y+RtidY6YiULDldLxhMDudnpUMoAnkDaZuRcIsHa57hN2eRITS0bYpDiKOtVhGAxCP+c
         tWUF9b62mNeUho8NCrnsGdhyvKKHDiI2BDkUuSDcGuADssOd4h8jIgI7TRSbB5dduDPZ
         v5Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXCsNfMB7uUuuFl0xbyQnBwysIsg1wcy+T7oSnRIrI/xcxFVA0wMz23a/NvBiCnyu06bQGpW/qKNg5+K+FlbprV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuzqc5WqtOzhRwDAlKKZpj96YG5gAInbOKLAtiXhWP7Gss8/Ai
	3OqcWpQ7e73j42B1JtYntqQF2i4y1FL3sCENMHWV8iEMKyHTvjWsCuxJQMzYQnLq2k7jsWsZDsU
	TpMoDYvKdvMsOr/+JDpD2XKvenx1u7Kk=
X-Gm-Gg: ATEYQzxMxpHGGBghiqcf+mO/j7P3dlGQ7QYzs+LtzziT+bWq9Hneud0/Cec0pVQv9de
	pgBLIQVggb2VQO5a4IcxoWTE6jMo/s/G6P5NsDuEI0Q5MNWCuJ+Dk1pVutbf5hIzIS7LznFU8vU
	PocWvKQzNY6yWiNK3w87EP0rEdOjwCNvgPydTRlD5aO02WRuEBzdb57A90xeagq/leU5z9HNroT
	pgXoV8TXLjgZyuuKjp1esNOipLHkAiGGvwSMIc0hlGqTfO5cMxhTSV04namS6f5pkEZFxT/C1i4
	2Q9cUHmruwYhFs91cGb6XRNstcWyK8X93qPZmp3ykbhjwP4pizrfUWNex7DWMisLmlGgBqzYwhz
	IBMtNSag5rft6IvJlYcRt+j0=
X-Received: by 2002:a05:693c:2c97:b0:2c7:2cac:8162 with SMTP id
 5a478bee46e88-2c9326aa500mr1010168eec.5.1775064998156; Wed, 01 Apr 2026
 10:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-9-ojeda@kernel.org>
 <DHHVEPJHLGDW.1E6KDP9BUFG5U@garyguo.net>
In-Reply-To: <DHHVEPJHLGDW.1E6KDP9BUFG5U@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:36:25 +0200
X-Gm-Features: AQROBzBeO_yfCUmMruxpBPrHPRt9Z-RBtWsQqT4MIRVUyc-eOkOj6bAx0WG8aNs
Message-ID: <CANiq72mnnro6UD3SYgTOG+kipwkTBvbEAGH+jXUa3kLTUNje2A@mail.gmail.com>
Subject: Re: [PATCH 08/33] rust: kbuild: simplify `--remap-path-prefix` workaround
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
X-CRM114-CacheID: sfid-20260401_183641_035407_30A69EBE 
X-CRM114-Status: GOOD (  19.64  )
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

On Wed, Apr 1, 2026 at 3:59=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I'm not sure that I parse this. You do remove the filter-out completely b=
elow?

(I see you saw the other commit)

> Looks like this is going to conflict with rust-fixes (which adds the
> --remap-path-scope). Perhaps worth doing a back merge?

It would be only a couple lines conflicting, so it should be fine.

Having said that, when I was doing this, I wondered if we should even
consider keeping the workaround. In other words, locally for
`rust-next`, the "normal" commit would be to remove the workaround
entirely because there the flag doesn't exist to begin with (i.e. the
workaround should have been removed back when the revert landed).

Then, when conflict happens in linux-next, we can just keep the
addition of the flag from your commit -- the rest can say as-is, i.e.
no workaround needed, because you only enable both flags in a version
(1.95.0) where there is no need for the workaround (which was for <
1.87.0).

It is also why I added the second commit here, i.e. the "make it
conditional", because I was testing that indeed we didn't need the
workaround anymore.

So it may just simpler to do that. What I thought was that perhaps the
workaround is good even if we ourselves don't pass the flag, e.g.
someone else may be passing it. But the chances are very low,
restricted to a couple versions, and the error is obvious and at build
time anyway.

Cheers,
Miguel


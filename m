Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856D8EF4EC8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 09:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=; b=o5vOtQzyNfOWHYAzg4tgKULA2f
	3johMj1OPQvdCcYWhY6GMZCNmhLTNu5cgUofOm60tgAAvtMj07wrr2phYijcM7mXov1ilemmJxlHx
	xavlsTiFYTht2aFCDAnxwQ0+1rsIzrOiVUIROMrRPkZ5zUnUoNaTbieL8+sshiPF5J56gyns8N2Cb
	IlCFJAfE+HuhftUAzdnhx2yCaabQr08uSp7+ZiGEtvcvG5nijbul2FXC8E9BugeUlUkYa6nP088XJ
	H8gmCR68EVYXyO/ATXoMqU0KzDzA8oi04T7g/ObZsczQyavRgPq51dF7xIsjA1eMNzUY2SU+UcqiQ
	7MOh5z+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9frj-00000004w8d-12QD;
	Mon, 06 Apr 2026 09:03:27 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9frf-00000004w7u-2D1i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 09:03:25 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-2c7e5f38a69so203265eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 02:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775466202; cv=none;
        d=google.com; s=arc-20240605;
        b=JdwU38Mwv374nShKCYOJiizu1AB1oPJv1/sxugHjFv8Y1VJZSh8lb56uEjvkjQHul9
         JVGUULbSsTGknOBtM6v5A4i33Uw/zUvpZkXw03CA//X791Q/6oB+IVm6FAgstMznYNQv
         efPe30gqEtwK52xnH5S9Vdub4anhazyEniz1yuNzNj78rwWXCYYN8K8ce+HsaeWqxHYA
         519oy8AnTAiJ6W2Fz5bOoWNCUKKqtN1LSw5xmjiUpY8EOYFgB18TNFVY+bfWKkWIBfY3
         +YOFrrtboKrMg+mKuLRS0CVHp+LasQVwT8iWeyqkZQdryxyU5Bow2BGEX3vKFk08NAqE
         EpXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        fh=KexuzSri3LdgBUHgwygagg95dezQQq4LfNfUD2l5vbg=;
        b=d9Osj7nsPuSgijIvf2hhpW34Om6Xi6HjUn5svFwHY7qXz5k5tIa6hwacGZhKjTKa2z
         rRI3RR/rUyScW7MwTOY4V3tVBqw8wymj+/J/zRx2ExudH1+Z7wZ/PL60qdOV7/pAGhNb
         HFGBLv0azNV67zlrMyuJNBsFgjR++XLZ1mHtoXmcHAWRYmsCXaFkePJGu4E2r1osXNRu
         w1xSh30WSkJilMHZ4uMI7VeEMoRXXjmHMdw29XRNtNTT3ohRMfKFS8vwYIH0u8A/IlsQ
         MH7ysJeP0OjGqXRfQojSyvsGY5dBuWjHT2xb1E0+SnrOC3KbtHYyy3UH3YJohMvVA52z
         ym1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775466202; x=1776071002; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        b=WVb0YmubS5f73RkPSPTdZ8cMH8GO6C9mKR5Btst55eHjjdjXsR6RrDbUpph0F5/gXw
         4Rselm/e5/5KTFGVSRCR/5RMSWuB1NZyU+38xVP8gclRTE3Bx/wE0dW8NuV6fDlzmARk
         81ALQrWiToS4ad+FuOFbGwwxc97enZ6nvyjGGzYTYDFGkoyKyBU7cBIrvkQeN2KQu6IN
         13bNcxfYjtFphMnAP+oqm90OiDJoZHvxxntDoICjtpGg0/np3q5TXVa3Pf4WvF4c0Hhq
         QcQ606Zbu+nQVe3vc9JtxDpSXU3qukywMSnAulC1eIr9BA/kesPITyeIRT8BPWJney/5
         +W5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775466202; x=1776071002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        b=MK6C8oPrHr512b6ZBKMU2fxDF/Ak9tDN9zxaiSs0Ke3lwI7JOgBTFDZrseXyvVtfQT
         5ugaLiA8nUH07AOWbBm+7Kgw3URCEij3vtGBwULx+J98QJsL5oUA4xnWpu674JkocXn4
         OMB1kOImuB8C3M9xdcVASutiSLOcj40lVBztKvWYaLCrzTTysTJnNxck9BVaHDe7Hav+
         eKtHkWZooGNneQT1pMoZSINVKxUq5ic25C6vfgGewEdQNlunb82mlr1Z647lnFMVkfKe
         /agw6aID9O7eI+NoytKTVxGlpOHRA+FrHWSu2xlOKQzkseehWEsfBSRY6a6+1ZhmezGu
         bGzg==
X-Forwarded-Encrypted: i=1; AJvYcCXk9Uy0k8ejtIj32xnNoMH/HyWpALt1JuCnBYkWal1oQBG9h8+aI131TGEaSSefhVet+LFj8nfa47VzUfcvKTpj@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9eesC2gw1naGpvYMcezov4+ufi7ZWvZiCJcg0BwcixvBJCMC4
	PiOp1/LFV7kr2VXiAGmYDya7HzkbEtzCjX+/XIDBnmd8p9fbw675WP0tbPNAcy0kI9AcjYlZkXz
	4Wi36tKt8Nww5Zgpk+1Il4PELEt56ez8=
X-Gm-Gg: AeBDieuDD3eEiHP0xj628la5y/CpofsI0dCqgsIFKakhCro5oRoOR5lPrE2kC0I29u4
	DBK04R7oxfbKQGCp/ePD5fbQBm460oU3E3uH5Dp6sl2RC/VG9hRsGHs89+hLriB5P/iD9kMDtIv
	oMXn0p6mRSO9G+qpSX+W7ehPJVu52LQT7w8dD59AKJi1y+LAoHiUB8pHZF4ZcuQCh2RhFlxGVk0
	2EgqqDsoPCttd4CqrdI98OYOJLYljkFWpXoHYXfKNkr+vNsCdveAwCmsWbUFWXVWjZGcEO3U8BA
	UDxMdM8y5elrasEkfqscPHnMws6V0lkNc7YvVQgw2Pr/8ItPxVU3CNgZqzOZWsO1moLEub7o3oy
	SPWJwPHqjWJzYuX7XTPUwLkE=
X-Received: by 2002:a05:7300:2315:b0:2c4:76a3:bdfc with SMTP id
 5a478bee46e88-2cbf6897126mr2280931eec.0.1775466202269; Mon, 06 Apr 2026
 02:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 11:03:08 +0200
X-Gm-Features: AQROBzDwpcCEtASRfptsJ0WJ2jdyaJlOCl6SPsL-e-w0TnWmNnUbHOjTvtft1Wo
Message-ID: <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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
X-CRM114-CacheID: sfid-20260406_020323_663417_1730E7C8 
X-CRM114-Status: GOOD (  17.13  )
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

On Mon, Apr 6, 2026 at 1:53=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
> we are going to follow Debian Stable's Rust versions as our minimum
> supported version.
>
> Debian Trixie was released with a Rust 1.85.0 toolchain [2], which it
> still uses to this day [3] (i.e. no update to Rust 1.85.1).
>
> Debian Trixie was released with `bindgen` 0.71.1, which it also still
> uses to this day [4].
>
> Debian Trixie's release happened on 2025-08-09 [5], which means that a
> fair amount of time has passed since its release for kernel developers
> to upgrade.
>
> Thus bump the minimum to the new versions, i.e.
>
>   - Rust: 1.78.0 -> 1.85.0
>   - bindgen: 0.65.1 -> 0.71.1
>
> There are a few main parts to the series, in this order:
>
>   - A few cleanups that can be performed before the bumps.
>   - The Rust bump (and its cleanups).
>   - The `bindgen` bump (and its cleanups).
>   - Documentation updates.
>   - The `cfi_encoding` patch, added here, which needs the bump.
>   - The per-version flags support and a Clippy cleanup on top.
>
> Link: https://lwn.net/Articles/1050174/ [1]
> Link: https://www.debian.org/releases/trixie/release-notes/whats-new.en.h=
tml#desktops-and-well-known-packages [2]
> Link: https://packages.debian.org/trixie/rustc [3]
> Link: https://packages.debian.org/trixie/bindgen [4]
> Link: https://www.debian.org/releases/trixie/ [5]

Applied series to `rust-next` -- thanks everyone!

Let's see if we find any issue in -next.

(If someone wants to give tags today, then I am happy to pick them up)

Cheers,
Miguel


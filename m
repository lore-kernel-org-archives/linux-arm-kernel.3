Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E803C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tvLXhbUj3btoVOLnjJSvLA3iyBL9Ok27em6LBsQ+Xo=; b=hCTbWQJcOlMBPi5QC9ftbDowmd
	IiXgZHgqRgIhRXqDw42b2V6uW1bhPn3lXwOTVAH1jLuu5kYfUJWiJvAKbVvibuzrlNVGtlOsRlxqt
	JLUZcA9c9Bfb/4bEj1HAyzXBzP9TydWzQl3lkReZF09WhmW/64k+tLn+RL+ABP9Er0NnJlGKEixRg
	RpCauMxGFylbygPkFxo+qkLOwVQYSDxKgqt2DBJTXQRtXSI1Q3t8GyUCGLGmhNqNHssZTUDMOkpeg
	Yx1S/sNKhWhzhmDBVaxQcO+sv/RnY5DW0jC386QqkT2OzGEn6HDeMpmmYiFWw8GbOyZGDamyOOeRv
	RZrnHY8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBx-000000062FC-1k21;
	Tue, 15 Jul 2025 19:19:53 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubjnn-00000005qzv-2KlL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 17:50:52 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-31305ee3281so1014012a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 10:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752601850; x=1753206650; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tvLXhbUj3btoVOLnjJSvLA3iyBL9Ok27em6LBsQ+Xo=;
        b=jZrJKRkoA0crX2JmEjN3boJ5BmrYKqFSP4j6A/DaN5G40WOtMIOB2F7X35svxKOxIc
         xAr7ehFemUh7yd2cjlDCb1qU5SQEXB1GX99qL4N/TvKsgHtkGE+kg4+f8hoA07ve1OqL
         h4gzicCZjS6xGCWyXXOeO9SBZBMNiA+MlejqurkQZlfayW9ESzkw997WFRXMuOVrVNes
         4KUsXQ1Fmh6ZVs/mSn7jjl8shk7DFPLOrl9kAnNmDTWQbM7qBPNVZPrkZ7MHR3crcXUD
         lukYjzfLHYJiMrmuFJ+LKD1r73HFYguFWacGjOfFfxGDuVj/G4dM1/eI9UQHxslcjmaB
         O78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752601850; x=1753206650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tvLXhbUj3btoVOLnjJSvLA3iyBL9Ok27em6LBsQ+Xo=;
        b=RPM7hKZhY3o4mc+a8jRvsULNseJLzu9WVzwud3RClHwO5EfHf/XzD4KJahFUa8vcVs
         6SYLk9avar6BBB3omKhRmWZofCjkN2AHOlxoo0KlatFI5GktcQxoEJpBqb8aliUWyWRx
         074c7yQm1BJeecwU9CJQpIUki69FOtcBxodnIsG39+7JAjTlxf3Xles8nwm0Vep10CVe
         TClarl81lJVVqa7a+64k3tz92GCv2twBA3kI551jbdwFAcopfUZSe6HsWlhgIFtEcwd0
         esc+V4saJVQP9/dgeihO3zumFf9E/7r9En0mMYjB6sE104k/uvESidfr2gKxRQyNW9Kd
         c+7w==
X-Forwarded-Encrypted: i=1; AJvYcCXIPSINGDsD9dRnt/bg3eoWyg+SVf1BLs6FerPTVpIPitdBk8cFkMnpaKfrnXr+fr4nzOUIjuqSLyD0n4KgN4uE@lists.infradead.org
X-Gm-Message-State: AOJu0YyHKgCO4iBBCaPhpKoEEjpvC1juUxNR+tlwyUiiSHMju0JK5g4h
	SPIlVaL14uTRE2Om3Lv//CLgeNgz2mHgGfcSa8+yoEGM+mByDbntqR5UdTxQZEgGFNVXOxN5pTV
	jmN7tNx+s6h+zKby/BagOGO1VpUbhgns=
X-Gm-Gg: ASbGnctg9kjCeS0/yxT/sAr1jg5oenuLqNKr83SHJbNrM8GBV5A1NGf7MML77WKxexJ
	NlgpUF9UoXuUpFrckAwQ99KGcyB5dm7YI1VWVP2UyDuNQbr1QCBO9pe8la7YlDg+Vvx1AJy0Ya5
	aik8zEIG1ceDKWJNOb1N66/U//FFOKrWiDnf/BBfs0hCEMeJWeNYwt8GBBuSu4QJmo3AKPgCYwb
	AZzLcSr
X-Google-Smtp-Source: AGHT+IEA0bFBiiHMjFaFp3NgiucMCohNFKETTnLQbvfhvE3iygihLpBxFCLZbywabbuZf9zk5tx6uQatd06iDKa4cK8=
X-Received: by 2002:a17:90b:518d:b0:312:ec:411a with SMTP id
 98e67ed59e1d1-31c9e76ae7amr42706a91.3.1752601850205; Tue, 15 Jul 2025
 10:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <4c459085b9ae42bdbf99b6014952b965@BJMBX01.spreadtrum.com>
 <202507150830.56F8U908028199@SHSPAM01.spreadtrum.com> <c34f4f606eb04c38b64e8f3a658cd051@BJMBX01.spreadtrum.com>
In-Reply-To: <c34f4f606eb04c38b64e8f3a658cd051@BJMBX01.spreadtrum.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Jul 2025 19:50:36 +0200
X-Gm-Features: Ac12FXyoQ4fNoRKEvC6GhXGS-MiKTOay0FzcQVu316wRZ_qnU2L3B1IndxZsU0Q
Message-ID: <CANiq72=v6jkOasLiem7RXe-WUSg9PkNqrZneeMOTi1pzwXuHYg@mail.gmail.com>
Subject: Re: Meet compiled kernel binaray abnormal issue while enabling
 generic kasan in kernel 6.12 with some default KBUILD_RUSTFLAGS on
To: =?UTF-8?B?5YiY5rW354eVIChIYWl5YW4gTGl1KQ==?= <haiyan.liu@unisoc.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?B?5ZGo5bmzIChQaW5nIFpob3UvOTAzMik=?= <Ping.Zhou1@unisoc.com>, 
	=?UTF-8?B?5Luj5a2Q5Li6IChaaXdlaSBEYWkp?= <Ziwei.Dai@unisoc.com>, 
	=?UTF-8?B?5p2o5Li95aicIChMaW5hIFlhbmcp?= <lina.yang@unisoc.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	=?UTF-8?B?546L5Y+MIChTaHVhbmcgV2FuZyk=?= <shuang.wang@unisoc.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	"kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_105051_596866_54DA0BA8 
X-CRM114-Status: GOOD (  10.45  )
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

On Tue, Jul 15, 2025 at 11:41=E2=80=AFAM =E5=88=98=E6=B5=B7=E7=87=95 (Haiya=
n Liu) <haiyan.liu@unisoc.com> wrote:
>
> The commit changes the fragment and diff is:

An Android engineer should know how to handle that, but if you are
reporting upstream, it is best to try to reproduce the issue with the
upstream kernels (e.g. arm64 is not in 6.6.y) and provide the full
kernel config used.

> Only two rust-related global variables in fmr.rs and layout.rs have this =
issue. Their asan.module_ctor complied binaries are wrong.

I am not sure what you mean by `fmr.rs`. As for `layout.rs`, that is
in the `kernel` crate in 6.12.y -- isn't there a single
`asan.module_ctor` per TU? Which object file are you referring to? I
get the pair for my `rust/kernel.o`.

Cheers,
Miguel


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10683CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 22:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEQiOQ22rYAZhHJ5F5hChKykmBsdSQ9Mr5OeL3gCArg=; b=LCbvXVWwYT2VnFQYyoDyAWFKwa
	GfMv6rlGJXNtbRn7PhzKUbGJpPn6JjqWuCIW+0fT9QY+JHW3SaotsKyE9hSNca6HqrrgcLcMq2OEt
	2bW4BPSJr9M2ZCddyLEIxttrAp/eqXiFkubIzQ6aYdQFaT0DQt3QWIHsJ+jEF6v7cvTOc+yu71v0k
	oWyvKYXxtAcT+kGjh/kJ9KSJ2CWmve04GJ0k5GRGN60VOLjHLVjWkPrDHjZGbUFFy/eZDG8oUgdcI
	ppDpDcecTiWkLmTbwb8oUo38ykKEXu6gmAvgaz6gycBqwT1++tWK9LCKSaNQo1bf7tzYLnbbrb4sz
	bUp8UEtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw6lh-0000000Ae0L-1n0Y;
	Tue, 09 Sep 2025 22:24:53 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw6le-0000000Adyq-2hxa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 22:24:52 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b0428b537e5so988982566b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 15:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1757456688; x=1758061488; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fEQiOQ22rYAZhHJ5F5hChKykmBsdSQ9Mr5OeL3gCArg=;
        b=hUN0H10Bhr1FHYDVYw1i6VgHctc5rYeAZO+1Q2Ap5X4P4/j+bWmWAqJe9xUCbOUsSc
         +tV8E9rH5xa/IsM4puYAJZcInI1GgKCdloGTL6VEHY6ebkvc8/aVzDOme0k1GEyKnrfs
         aetI+jVQw7Lbz0OTJBKtFtGSR0FE71ldHWcRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757456688; x=1758061488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEQiOQ22rYAZhHJ5F5hChKykmBsdSQ9Mr5OeL3gCArg=;
        b=Od3TJEKVAkdg3ZhigNHAvcbRebi309d8BgCKTx3g5liB2N3DjtPs6ejJhgdowQt2sI
         dtMEcqjaO1yQ5ld1kxqo/uxtlmvu8OP4cb/0efjg5UFFNAuw3TUvUTOgdwkJ3LPuZhvP
         zwWa1AdrDaoIJhDay5Q52So78i13i8oP3SUPUfEYL3anprEnSLgakViKSwKKzaXL0QZB
         TJ7SX1c8hz33mwv1in2PoKIM6gJKxu6k4s9/yLE/gs3M2hDpYfFCji0tf9DUWwqEtUXG
         l3nCo6m/iaQ2YkpecdHz1Vfre17z6AKCM3J1iP0CRvFE0xocq+YePb9JyiJXKsGnrIDX
         64KQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0yJFTaw6PGd6dnLK3xKAM0uAtxRwstSQ1N6kMHg5fHQbZGc+ZI8UKuVgfoyjlcMkpFQzxDXKz4FtpjrhVpw5U@lists.infradead.org
X-Gm-Message-State: AOJu0YxsHAPQPPQNEkhbHgV/LWX9FL/fRLOOSehN3IhBGtNBzA/DSBgg
	xmsbpk/eyKNo5g1hUeyKGJTxibld8S24cK53TmJdKp1cIJTyMmyRRw4ITuw8Z3N3dV2kx+tAZcc
	LOdhGjFs=
X-Gm-Gg: ASbGncslHmwOsTymxbWHeyLylvgvg2IhhChQBTeRpM+F1oPMsNgdJCgnhI0NJb4prCp
	W70V22J5m0mNEc6fOqPEVza85kZpjOfqny/YaB/zV5b08l3LGsKsbjK1ePjRW9jQXHSphEmxbAj
	9RJT1tsGBXb4BM8GNMi4UTU8xVAlmG/ipmRbHC7cxsJtl+tT3N9/LEygypeZcY5Ch79OrhMEPGp
	zMck+vQbctypj1+6EkkBHMuDoe4lQa5VrLbhqnmhueqWRtpOOFKOJtkvTeshw8nlkNPCK58nbOW
	3CPlXrtUnZOgNIReMmHAHk4SoIx5MasPqU2jNvLU0XuNW46r7wsp4lxUwmKpeXDfWCVpy6+CqKl
	JxGIjvFLFlaagjs5mOQOxwL7ecOdGtXLYMeNx9FOgmyvxdjVQLOqfhM8JnkM0yOiTiEWzWwt0RT
	HriiErdC0=
X-Google-Smtp-Source: AGHT+IFYucOwUrVuTrqFmGdOIt04ftABRcL8kAkcbjzn1cyCaw89YAT2vtrpyFrT8n4cIKBuKi7iyg==
X-Received: by 2002:a17:907:7f8c:b0:b04:76b5:739f with SMTP id a640c23a62f3a-b04b140d29fmr1343607766b.23.1757456688514;
        Tue, 09 Sep 2025 15:24:48 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07830ab345sm58024466b.25.2025.09.09.15.24.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 15:24:46 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-62d1faf1d8bso569639a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 15:24:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0xjMnBk8JhtkYw3YyzZuaTtpeIrCTN3Xqg8K6xZdS/uh0d16ilZ53X8kWk8+DzeW2ZlLHnbr8ZaLqpHka4cqT@lists.infradead.org
X-Received: by 2002:a05:6402:4412:b0:61e:a13a:27b8 with SMTP id
 4fb4d7f45d1cf-623729cb58cmr11071027a12.1.1757456686093; Tue, 09 Sep 2025
 15:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <C85C32F4-BD58-460B-ACCF-F0569ED0941A@zytor.com>
In-Reply-To: <C85C32F4-BD58-460B-ACCF-F0569ED0941A@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 9 Sep 2025 15:24:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
X-Gm-Features: Ac12FXyoXbbHUJtrfKhAFeDlVJsB9IiUaRxuYQBQJQyqpHDKK1GQ8JtkX5zx-HA
Message-ID: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, 
	Lucas Stach <l.stach@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ankur Arora <ankur.a.arora@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_152451_054884_01046C0B 
X-CRM114-Status: GOOD (  13.39  )
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

On Tue, 9 Sept 2025 at 14:39, H. Peter Anvin <hpa@zytor.com> wrote:
>
> 1 GB systems used highmem too, sadly. And 1 GB was the norm for a big chuck of the late 32-bit era.

Well, while on x86 1GB systems did use highmem, they'd typically not
use very much of it.

IOW, they'd have about 900MB as lowmem (ok, I think it was 896MB to be
exact), with something like 120MB highmem.

So they'd either lose a bit of memory, or they'd use the 2G:2G split.

Or - and I think this is the main point - they'd stay on old kernels
like the ancient museum pieces they are.

I'm not convinced it makes sense to have a modern kernel on a museum piece.

         Linus


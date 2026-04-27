Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED30FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 21:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=; b=AM3rXUP0KX6WlDP2txH0yTLdQX
	QaC222RXC1nkhzBW3sRbEzfLDB5SNOZA8aaB47yZv/7E3mCU7bq2xumSisFOFyRTIBnhgOIrlYuPa
	kQIN3zyWLxUb1NPz6TkpqghzkTAxfAHjHNJ4VYSlZJvyFcdw6ZcTzhl4WaNo8yLKHIIQBNNf6Iny+
	PQ0s/7/jlnRvOGx8ypbMBVmwc+zrOlAhU92jGPwzWiuEMyHsZiX/wYYNUYG6WzrZLQZJTVsFeoGjW
	mtQ+aNjG8/2W9TCiMult4GASTZlbuhmOBa+d7WKEV3VZEwfDiSPkQvprq1Esv9ji9isuQa4kygrCI
	UB1NNBQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTsQ-00000000CeH-3is3;
	Mon, 27 Apr 2026 21:52:26 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTsO-00000000CdV-3DZX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 21:52:25 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b9c3a9fe80fso1581249966b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 14:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777326743; x=1777931543; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=cMVisAXm5geUgP4tMWJXy4EaWMOTaKpFg8Z5Y2VvOGXa3oxNPr1LlRSk0Yj2xudbn1
         gH+C3FG2s3jDM+fOCGwSUNpERWHlylEimePlrFqcRFosPc5pwQX3X1zSgnPLrwl00Btj
         nd4Vu1V+vbu4RSUDqLRZuGbhQ2PtGjFXAneyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326743; x=1777931543;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=rsts5RTdQYOQO0gk/9XJjMQl4Enw8pODIBYK5xlzUUTzD5cNQjq+s/jYHzaA+yU8c9
         oB15LoKChoCCII0sZqmpjRARwHslmVgiENQVrj93D1tK7Meb0VNarKiID2acW2Ih8F7N
         rss48Cimt6eiSHKFPm2YBSZqlnSRoDh7IY3KFhYW8oUP6YV7n/yzq859B9VjcD8/q83m
         REs6ESA/Su8s+0gJP2QFinXsWqqnQkimy/dtiaInE9Lettx5u+APVw3fUgnZcjsWMeCL
         P1uvz3kFyBzhkLAzWfuGTOWyTFzDDvfEXpflMlsju2tnnRSlLUIWV2iAmGezQ7p0vejP
         qMsA==
X-Forwarded-Encrypted: i=1; AFNElJ8KGx2GnD9jU9xHfbWj7LuG5p267NfKRnZCpxkhzfTMuBlSkGi4eV4NhsBAJ1M23KS4NjI9ou3U9bwiEBtiXE2a@lists.infradead.org
X-Gm-Message-State: AOJu0YzWCKnf9Dow4RSA3ewt7Dx3ZcymP+u3OmP+FUc1i5dKQ0rRF9Z7
	lmjcyl/2KoBniuISGpMWJJQ8Xn+Kzpu7OWWOUXdGcrEnzEwFoFulbvu25RI7Byq9zAlnRkrzZQW
	biTW7IDkoxw==
X-Gm-Gg: AeBDietedOCOZrxJiFSrYIYCvSSs65DZUTxtS+t3nHZhTdkEig6/SX/k/eeclQlgJc+
	aD5JznDXSOQKfrF8AtfH6I3FiTkcKo5MnJc6o9RwWrEwEXhtDu4mA1KaM+DfQLoGVscbh2NNS/S
	0DCQGU8a6e6HOehRQoUnrpDSxdRdXic/t8zJEtaAwmPGLct72Hx7/Swy2IZtjbZHtlUq6pL2+WV
	FSToGz1CeDD1V3GMGFm9Xgvvh5vd0odADagchdMtOI8nMC4uD3Xz+LoKjwRzzOWXLY3BDCbidvw
	fUfs10iadKb9PtNmrx+vwVzmiWDHdz2G0IMrWXZ0YtsrL8sD7WWzbNJTS4gEFYpI0WfjyT2D3ah
	0KfkbrH+WtnHlr0kxpdfq8VknzJLVeSXLu1HkcEaeFc8jQqYsYXr8u1OfcR8I3RCk4xaH/Zj97Z
	CVcjx9+G6sx0+SVUNXICUHB4Il7paynnDEvAlxcqoiBnVJpN+bVbcTBZvcljRHNe+lHtRA32JL4
	4mN5q76zkw=
X-Received: by 2002:a17:907:3e1e:b0:ba0:d58b:6045 with SMTP id a640c23a62f3a-bb803778202mr30240566b.27.1777326742660;
        Mon, 27 Apr 2026 14:52:22 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb808632f40sm10782966b.7.2026.04.27.14.52.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:52:22 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66e8cf72a93so13200509a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 14:52:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/d+vyuDTd9HTIJh1vV6e9ccUs8J2fxpkFs/3bk6tE6IrMTEGsZVB+CJk2flXUJq6bXRDAcZmISum8rl8Sb0p4q@lists.infradead.org
X-Received: by 2002:a05:6402:35c2:b0:677:270f:6f4b with SMTP id
 4fb4d7f45d1cf-679bb04a8a7mr185115a12.1.1777326742385; Mon, 27 Apr 2026
 14:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <0ee46bb228d97163fbdc14f2a7c52b93d8bc34ce.1777306795.git.chleroy@kernel.org>
 <ae-j2_QirCySZD02@yury> <63a4d0f6-0eb3-48cd-9f98-bf7b223b2606@kernel.org> <ae-2yLWSGnfeTvh1@yury>
In-Reply-To: <ae-2yLWSGnfeTvh1@yury>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:52:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
X-Gm-Features: AVHnY4LQUFWo9ODz4M3q2vZC9Gn8nsdYr95Nd4ky5ERVHHxIyN_9ZXY5zjebfdc
Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 7/9] x86: Add unsafe_copy_from_user()
To: Yury Norov <ynorov@nvidia.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_145224_821478_2694EC39 
X-CRM114-Status: GOOD (  11.93  )
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

On Mon, 27 Apr 2026 at 12:19, Yury Norov <ynorov@nvidia.com> wrote:
>
> This is what Linus said when added x86 implementation for copy_from_user()
> in c512c69187197:

Note that some things have happily changed in the six+ years since...

>   That's partly because we have no current users of it, but also partly
>   because the copy_from_user() case is slightly different and cannot
>   efficiently be implemented in terms of a unsafe_get_user() loop (because
>   gcc can't do asm goto with outputs).

now everybody can do asm goto with outputs.

Yes, it's disabled on older versions, so it's not *always* available,
but all modern versions do it. And if you care about performance, you
won't be using an old compiler.

             Linus


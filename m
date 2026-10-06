Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9930ACA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3le0LRoIEqiKvYzrW3hqwYXLg+E5AHVO4iOgQS6Y7Y=; b=teWoQDJMhX2+PegEA6x3K0km71
	5n3qZwYBJO3mtDtjXp0Wvm4kPBs5McMdQKsWDJ5dqq5fzzz3AoVLyv5AQMdoEEcX078EqyU3bECYF
	uzsLpkb5/BxJSKQS6VAYV56shBxzaDwxHlT6yezD+OsuHMFO/smsGIVNCmpUWujvqqq/bEAsUS21i
	YekpQtv9U2iZXRwiVh4Ua0LVHn23oPzPkfeectBWitHGoqZoRR6c1NCO7uUNOhzeVpLt+Nh/DwBEN
	PqYBERvpNv2qRBgsuw0YWA+H4oJIrfjDjmSvYRTjZYhkiSExmzH/8x/wSNZAUEyPqDJDrT0QPF50l
	HSAlbErg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Co-00000000TQR-0tD2;
	Tue, 06 Oct 2026 10:15:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Cg-00000000TON-0KpN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:15:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 630356022A
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Oct 2026 10:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5161F00893
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Oct 2026 10:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791281720;
	bh=m3le0LRoIEqiKvYzrW3hqwYXLg+E5AHVO4iOgQS6Y7Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Dhf+YsEln3vVB4wzsSmjgpeVi3x2X4baGjRWCX/BAuNnzlmOVkT2NGlj2QOR3PvvA
	 V6V5V41k8cFwlh+c2v6UMl0sjgu2TMkIgBP6FWD58e0qts+VqDsL0O1F69t6bGlyUu
	 9jMSAvsQ6HVZ6Gwx+5Gcp1PQJ29VVHipPF2fVWN47aFmnpR8oN5moipOdAgBVH0aYz
	 pAkx73sis9dtuJzAT0J36uXYFvHIHoZoNIlXZaJ0/ANLly980UoEhFcjRwBSlO9mGi
	 FmD7cfazHfwmG7LBsKlxDNuLM/pcf2CI2ww0Ai6FWGC9zzZj4i6+rSxT81uzqXRcID
	 q3oSmvuZ0Katg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a75f960be4so2996241fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:15:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwjPUdBqWVIyFysGjSsorSfhpgVSdX+GJq231MEDJs1SWhB/KVsAxLTTe9zAdiRM0t0vXCu6CXihuVwjuU2xxaq@lists.infradead.org
X-Gm-Message-State: AFq9FYJGcHitJaW6TJbOpUmJayOi2vRZFSiqqIc5ZP3WKv3VFdyTaZGk
	5XNr58NObxSwtHLwEyxhQGRHdBa6v8wAoLaJUkskl/ySmYWV76MHTT6m1nXhx7qPv8bivpTOSDa
	6d75iZazmSD6+/gqGWzjRwTzNKAwTCOk=
X-Received: by 2002:a05:6512:b94:b0:5bc:ca67:c338 with SMTP id
 2adb3069b0e04-5bccc6f0982mr427514e87.18.1791281718870; Tue, 06 Oct 2026
 03:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20261006055223.9299-1-kmehltretter@gmail.com>
In-Reply-To: <20261006055223.9299-1-kmehltretter@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 6 Oct 2026 12:15:04 +0200
X-Gmail-Original-Message-ID: <CAD++jLmsvaNhEUM1e+zvk-s_r6s6h=b7dKn0k_kA3y=GVuBFfA@mail.gmail.com>
X-Gm-Features: AclHuK9Kpq7WO3g2iO3espGL5Ug3bTlQit7RXbcEmcKP4KcWJvOiVVHvmmiRJnQ
Message-ID: <CAD++jLmsvaNhEUM1e+zvk-s_r6s6h=b7dKn0k_kA3y=GVuBFfA@mail.gmail.com>
Subject: Re: [PATCH] ARM: mm: compare ARM926 cache range sizes as unsigned
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Oct 6, 2026 at 7:53=E2=80=AFAM Karl Mehltretter <kmehltretter@gmail=
.com> wrote:

> arm926_flush_user_cache_range() uses BGT to compare end - start
> with CACHE_DLIMIT. Sizes of 2 GiB or more are treated as negative
> and take the cache-line loop instead of the whole-cache path.
>
> Use BHI for an unsigned comparison, keeping the line-by-line path
> at exactly CACHE_DLIMIT.
>
> With the default 3G/1G split, unmapping an untouched 2 GiB
> PROT_NONE mapping flushes the range through tlb_start_vma().
> On a SAM9X75 Curiosity board, munmap() took about 1.3 seconds
> unpatched and 20 ms patched.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Ooops!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Make sure to put this into Russell's patch tracker!

Yours,
Linus Walleij


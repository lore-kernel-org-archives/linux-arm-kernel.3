Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4289FCAC5B3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 17:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ak83w47Un+0YVkw6h4ejJTiciQnGZqbDFJcToiU+0xQ=; b=brxf0bsK/M5YiGPmw3NIrdiVHq
	67AMppRD3pWTWTG1yZU9g8WvakW1Ers0p1kWiW6x3Bd6wliaw4A4KrXPW2v55mz6Q+SkyJb/osPK9
	Syy0fBHPicKBU9XxJBe/uQJuoEPjMJ7svDHQ54PswilwsH728yHZX+z58Iqt5zcjmDsukQXaVipFV
	pveRk/PfX6A2b53FY0C6A6NGUflCHAGIRzeRcNsoUrxh6nOdNOi4EsdZVnaJFPUy7nAV7VOt9c8/u
	1zl/R8w2FamuJUeE1Vnw2Q6/MM7YxHmxndEONR0No72L4kMOv5MBuWY6E5Gpk0xl6314bVLmdofPW
	9XSVe0uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v178h-0000000ERIA-3C8r;
	Tue, 23 Sep 2025 17:49:19 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v178e-0000000ERF6-3fBt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 17:49:18 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3ee1317b1f7so2920021f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 10:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758649755; x=1759254555; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ak83w47Un+0YVkw6h4ejJTiciQnGZqbDFJcToiU+0xQ=;
        b=Z7raoLH3/yTKAwr7ZGoTmFV28FZrI29ssO0qaspLKLHIgvIGWSxm3LEHM3aHcZS59D
         GPKDd6dthjhGuAs/Ei/qvV50wBsr0e/wQl29nfqQDwT4ixBWwXBgqBrVfZbTPKP82Mwr
         pfDVV9hv2P4rzCLLGGEDlJMZjTDO3F0jhio5EXBUew5g04zGEwDJWbaz1sUt4pVaS9I4
         0TAfwuypGetpRAhhDJpOMWjaaH+GGZr6JuikQL4PLWx5+Qg5VK85IZpuFwoo8QmlhDKu
         EbdlcjXadxwEDAqww8+npJcoH0MwpvOzrFWmU3B8AhoPSEiMfQdFC994GlZKU5FRFYBL
         a5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758649755; x=1759254555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ak83w47Un+0YVkw6h4ejJTiciQnGZqbDFJcToiU+0xQ=;
        b=Gs8rneYUKaFVdXjl3y8G1fpvHgX5f9u2Yp8vZkNxuub5uQBdfwaUDUUH42ds0XfFL6
         XbDvyleSHPgKR41qJf4yArgV4zRjttAk7RCGD3AHOo/OxgwCLJSgsu+wRgYoBusZ8TGr
         3sEBLDNnutL4zRp5IN4xFDJzxsEPQ+seCjirpvjWuFuxpEPdy24FgrYJ/I5l9S9hov+g
         /BZrr/p8RxWoKuC3H2+WgbLGj5rFEY8LJFvyvF14FQA4g600SGJzMP6qprZdA+5kp62Z
         BRigyaEzuxNi/WT6Mu6EA7WyrYtTtncSmL15YP/zH8LP7TJJKCg496QLtDVHAKidu58p
         mIDA==
X-Forwarded-Encrypted: i=1; AJvYcCXKV+2QNVYyL4DVT3D7sUVvteL4EkJw9nrtMD0pgRKP62jUGw0eovyzLmRwFrhsIjUyUGV5I5spb7r4FF1OfA89@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4BmuVZygwPcZWVlL5Epg/dJSnnc5/uK26aHZNNjv+o1n5p7JA
	4wfdUNPcv4MSudZKjBwSpPzx/fK1viU69P8CMcC+hd54zvJTZtBgIJNlNwY3JtUirgRgnaiQbsT
	tc87Dt4kxw7hFOqxSmoHLvLdtNf/WvWs=
X-Gm-Gg: ASbGncvXW0fA9Ec96Nq+2SB2azs4wrFD+JuAHdtHtSG+//4JxQ1Mnvh3kyaCOeyiSMx
	0AuvR2lF5LVsSI/iq0GiQOWk12JJtzlNDuhh/b14T9EiAtwpWJ5Ipaeeo3Lo9ITJLerV0zgAbnA
	1iLMxRXeuozsXB4G00l+pnq9Ip1/lH6LUjuYjquTdlVTOgBS5lYxnyQAAKMyZ7iS6txZ5J4FvVT
	MILbuiBTw==
X-Google-Smtp-Source: AGHT+IFSBc+NBD1jZsd0LSs+Pw95eV8L2vwpY4rCb+CqA5TPaGXD6Axn8yxp6z29u7E5i0MPRJJiZRdC/VoVJA9DlfM=
X-Received: by 2002:a05:6000:2585:b0:3ea:c7ea:13da with SMTP id
 ffacd0b85a97d-405c4a9734bmr2645479f8f.9.1758649754815; Tue, 23 Sep 2025
 10:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250810125746.1105476-1-snovitoll@gmail.com> <20250810125746.1105476-2-snovitoll@gmail.com>
 <CA+fCnZdFp69ZHbccLSEKYH3i7g6r2WdQ0qzyf+quLnA0tjfXJg@mail.gmail.com> <CACzwLxh4pJOBbU2fHKCPWkHHCuLtDW-rh52788u2Q6+nG-+bTA@mail.gmail.com>
In-Reply-To: <CACzwLxh4pJOBbU2fHKCPWkHHCuLtDW-rh52788u2Q6+nG-+bTA@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 23 Sep 2025 19:49:03 +0200
X-Gm-Features: AS18NWAo7UnIsKkvCh16EnxIlUsef04XXrIh6VHPmyIq2HZ6eh0cMjqVLlDuPQw
Message-ID: <CA+fCnZce3AR+pUesbDkKMtMJ+iR8eDrcjFTbVpAcwjBoZ=gJnQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] kasan: introduce ARCH_DEFER_KASAN and unify static
 key across modes
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: ryabinin.a.a@gmail.com, christophe.leroy@csgroup.eu, bhe@redhat.com, 
	hca@linux.ibm.com, akpm@linux-foundation.org, zhangqing@loongson.cn, 
	chenhuacai@loongson.cn, davidgow@google.com, glider@google.com, 
	dvyukov@google.com, alexghiti@rivosinc.com, alex@ghiti.fr, 
	agordeev@linux.ibm.com, vincenzo.frascino@arm.com, elver@google.com, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_104916_961678_776EAE25 
X-CRM114-Status: GOOD (  22.73  )
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

On Mon, Sep 15, 2025 at 6:30=E2=80=AFAM Sabyrzhan Tasbolatov
<snovitoll@gmail.com> wrote:
>
> > Why is the check removed here and in some other places below? This
> > need to be explained in the commit message.
>
> kasan_arch_is_ready which was unified with kasan_enabled, was removed
> here because
> __kasan_slab_pre_free is called from include/linux/kasan.h [1] where
> there's already kasan_enabled() check.
>
> [1] https://elixir.bootlin.com/linux/v6.16.7/source/include/linux/kasan.h=
#L198
>
> Please let me know if v7 is required with the change in the git commit
> message only.

No need, but next time please add such info into the commit message.

> > What I meant with these __wrappers was that we should add them for the
> > KASAN hooks that are called from non-KASAN code (i.e. for the hooks
> > defined in include/linux/kasan.h). And then move all the
> > kasan_enabled() checks from mm/kasan/* to where the wrappers are
> > defined in include/linux/kasan.h (see kasan_unpoison_range() as an
> > example).
> >
> > kasan_save_free_info is a KASAN internal function that should need
> > such a wrapper.
> >
> > For now, to make these patches simpler, you can keep kasan_enabled()
> > checks in mm/kasan/*, where they are now. Later we can move them to
> > include/linux/kasan.h with a separate patch.
>
> Yes, I'd like to revisit this in the next separate patch series.

Great!

But for now, please send a fix-up patch that removes the
__kasan_save_free_info() wrapper (or a v8? But I see that your series
is now in mm-stable, so I guess a separate fix-up patch is preferred).

I don't think you need a kasan_enabled() check in
kasan_save_free_info() at all. Both the higher level paths
(kasan_slab_free and kasan_mempool_poison_object) already contain this
check.

Thanks!


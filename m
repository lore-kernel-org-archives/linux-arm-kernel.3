Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC3CEFD20B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7sum/s14S9A39h5WhsYyHQGLKHSNdWj+CJqlksp3Dg=; b=wim98ETQsGOuXTgryNaw3RDpr3
	je/3bpPLM18JG1129vQVui241mz6LN38THptQJTEUqTVBBUYXHdrMmxnz0ccIuUdaYyOSoHtRYy7I
	7hMUAar375Ybay91D8baMoi4SiR7wQeMP2J9aiDQA7TXdcgd+117blkl1bQ6VDUiVlyOAiEOiHrDm
	xVurAvmFoIk1jfgAWRLDnIkGMaLONeACLTVu5gaqoZk/VyN0qI1eJ1GTAJK/LeOtoAH9ax7naENp+
	fVf7v3MH3jygNIP48SREpVuCzXkfo7Igiw/o+yZhcqkvGqGbKhxh5ltxUjHt5F1gC9RI6ABuvL6og
	DMfLYl3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAsY-00000003di4-2JWv;
	Wed, 25 Feb 2026 09:08:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAsX-00000003dhv-1cWo
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Feb 2026 09:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=n7sum/s14S9A39h5WhsYyHQGLKHSNdWj+CJqlksp3Dg=; b=idGGbt3LjDe7keI6+kX2K6ShiA
	wNi9j6H+pzdb1hh8KFB1Rr7ATxEH3b1F02Tcs9RRDc155RSf+sslnO71hg8L4/egK/svGo0IiUK95
	Z7AUsA/oC04Pz4I6HelzzKhqSN3DL3mLBh4Y6rSLHoWdDSv6p6aPmwfM2W3jMY6xCF3QeHgIGa4UM
	GkzCp94cS5wmCFQV03NYMWZDaXrr+9scyid7xDRpE0FIGtCTy6xUIs2elM9DJdDFch5mJUVjXBsT4
	jPw22yVeU9xWNPllH5VaarfkBGQuX9/Sh1uMSo72Mk8WsbMwx1MRLJ9fV5R8smIHjgs0G2TBAtH+z
	8oHDovmA==;
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAsT-00000008ddp-2sP8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:08:20 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-506a355aedfso363521cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 01:08:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772010494; cv=none;
        d=google.com; s=arc-20240605;
        b=QnEdvK81L6JK9C7cxy8kr7NKeWFYmiSrRsaG39XXbHH+UXDAsg04YOhfi9OHaoDrz3
         HaJQ0/EHZFNWJ/zSi3LNDVG/YQGaCYj0KeWaT+xq5ikbUWIWUD0UoymUZXNIaQl2B0zo
         Fk77tNOCkaNF6RUk4za8jTWZ0OyZ+msGIzGxAVSbu8Bw1HkAGAZ6U1vTSSwZOV0mWUys
         yARdsmuks8A1ToVDdOEu2MTw6rSjUCWP0VpI3wKtL0TZtJ5e71gedsvqh2OmKTbmZJVB
         GlzHpJ3cbE8U517l6EvXoxSor4msroj99K/WHKCsMxGsP7yW7oKKU3g0xKJpZvwG9gFt
         ym2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n7sum/s14S9A39h5WhsYyHQGLKHSNdWj+CJqlksp3Dg=;
        fh=JYHZj11WEJpWOuU2Q1pj5r5tBfKE3es6WC1GMHSVrSY=;
        b=DezVIJ11AUhOs/p110KMAAy6NxeYUrcXhZ3Bfbdp1kQmK21uSJNU+KuEu8dHagBXjI
         2UL7nIDr/GD66BtvIoiH3Y0YtPWrf95ZoLEX0FHqhRMS+bnxcGBV6CrDH90Z56vzEYiv
         pafkeveNJWZr3J/XXgfVlosmo3Ef+fRLHQtw6xngRivK3zyKDxirNnlKngQHVG2M+6Rd
         0Iw59G6+OW6WFHcmm2mhDVIoQyTsIGgKkrw/PeVyLPO1X/vTlUhB1F+ACtHvx3mx/60j
         NVlfL67btLz5DPys62pQ7aI9uJ0nxB7rYuNicjAO9MT54F+O1cccY49lbZBoKuLsQsJS
         aKzg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772010494; x=1772615294; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n7sum/s14S9A39h5WhsYyHQGLKHSNdWj+CJqlksp3Dg=;
        b=hOT2axzHOpzuSy7+yGdFkGKHQ1P7ljUMF35fTQ00eLMfy9SkVkWqLFB7gP7T5Ik69y
         9K+XZ0IUwby6pxHl3HVZcW5tYh2EqOAvu55tl18/dzNZLjfH2ZO6UlS0XKjySv8boP0E
         WGqHfxSaKTmR2WPKIorYKnTcHROQr+8mY++GFGc87a6j3FSphzaYNd81c824qB7n/GLi
         A6S8FTXhhK1GaLP2lmAQe7YZ6+63+AbnblqWd15qf0+pbMWqtDZAIZrJtEXFJoJR1b/T
         Q0I81dln0gx07tk2XjtFpw5oPu4mYH3HXkxagKnijL+srTX12uFQDjMJLyA5gABnAomU
         WCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772010494; x=1772615294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7sum/s14S9A39h5WhsYyHQGLKHSNdWj+CJqlksp3Dg=;
        b=q4OmM1ON5suBMf7kNxcnft/qvS+4RHly8DoYaf+ErDXjc4AGwThoucxZrk9hz/I8C0
         XKitKd7F8OywpcLXQ8Dax0047B/nTc9jLlHOeY9aVBH+sBA0/ReF4o9imyUZaz/mVwFD
         7O78Q8/hKkGdHv03PS8UEL9MGy7g0DA1KStPVvmqEKICgTa098kklu71eYukrsgA81qs
         vV5gA0Co8qCE8enrELsbNQ8yNvVieWxjQpiBeEqyq+WmQcWX04pSdxhn3QVNCevORu50
         r0Zbz7mGSTJldo7OJ8py764+pheKxYXRCVxpWSZ3LPwBp0IM8JAsHdc+DgU5ucpYPNgx
         gq1A==
X-Forwarded-Encrypted: i=1; AJvYcCWPKDEIZ7i0SfqjftYvr7SUCzhSsORxPnG85c+cor3Kcnh6+0KdMGuotoLhQgBbaBQJPplkYBKIJdnAPVxYr3si@lists.infradead.org
X-Gm-Message-State: AOJu0Ywda99hrsJ/ImxKmU+BRYWZH4yf7Ng7wcGy68OYL8NS2I5lTrxe
	E4zIsJR7PBPBpsiNMZMInEatVrnEoJRaXoYJLzGPes3HJe4yVhL2XKC00JOiMI38ov1WBj9n1l1
	GaoyH22D8bY4lWyWKBwJLmM++fh/GlI86SHTFjt9L
X-Gm-Gg: ATEYQzz47u5843QYBukfEO1M6XZnq0Ir5oex71QHV5+NnLqtYE3bkvbRA4lNzTJZj8W
	Q7jBIbXPR3RHketrcmqa3PTe0jCgrrS/W2sHWkTm1KAo67rWRNBHDf43PI/tq/P3sqeHsiUo+Dy
	b4cBm82iiMsIIOAGXvK+EMJCJwCd/cqMuuQgVR86rb/hD1XdVV6XMpZZ80yXvVZ8BmXXFfVE4df
	Grxo3G8O58j4qnF8PHMBEsby4ApdNEzOEumtvBE0p7P6w4SCrZXgxhGJj8R7WJsaWBTnqPUSuP7
	RnZJAAtH
X-Received: by 2002:ac8:5854:0:b0:501:5180:3c90 with SMTP id
 d75a77b69052e-5073a358678mr5124481cf.15.1772010494111; Wed, 25 Feb 2026
 01:08:14 -0800 (PST)
MIME-Version: 1.0
References: <20260224092915.1925488-1-tabba@google.com> <aZ4iBlzQ7kyxByg2@willie-the-truck>
In-Reply-To: <aZ4iBlzQ7kyxByg2@willie-the-truck>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 25 Feb 2026 09:07:36 +0000
X-Gm-Features: AaiRm51o2vG5gfthjDXQ69EGaenridJm3gKmj3QSL0jeWsHv3kFjksydnvzOM5M
Message-ID: <CA+EHjTyF-0NMrfjX48epH5cjhy=TsDAO23TBU5MRe+0TPCtQog@mail.gmail.com>
Subject: Re: [PATCH] arm64: bpf: Fix UBSAN misaligned access in BPF JIT
To: Will Deacon <will@kernel.org>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_090817_815831_1E801E23 
X-CRM114-Status: GOOD (  24.71  )
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

Hi Will,

On Tue, 24 Feb 2026 at 22:11, Will Deacon <will@kernel.org> wrote:
>
> On Tue, Feb 24, 2026 at 09:29:15AM +0000, Fuad Tabba wrote:
> > struct bpf_plt contains a u64 'target' field. The BPF JIT allocator
> > was using an alignment of 4 bytes (sizeof(u32)), which could lead
> > to the 'target' field being misaligned in the JIT buffer.
> >
> > Increase the alignment requirement to 8 bytes (sizeof(u64)) in
> > bpf_jit_binary_pack_alloc() to guarantee proper alignment for
> > struct bpf_plt.
> >
> > Fixes: b2ad54e1533e9 ("bpf, arm64: Implement bpf_arch_text_poke() for arm64")
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/net/bpf_jit_comp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> > index 356d33c7a4ae..adf84962d579 100644
> > --- a/arch/arm64/net/bpf_jit_comp.c
> > +++ b/arch/arm64/net/bpf_jit_comp.c
> > @@ -2119,7 +2119,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> >       extable_offset = round_up(prog_size + PLT_TARGET_SIZE, extable_align);
> >       image_size = extable_offset + extable_size;
> >       ro_header = bpf_jit_binary_pack_alloc(image_size, &ro_image_ptr,
> > -                                           sizeof(u32), &header, &image_ptr,
> > +                                           sizeof(u64), &header, &image_ptr,
> >                                             jit_fill_hole);
>
> Did you see a functional issue with this or are you just trying to squash
> a UBSAN splat? I can't see an issue with the code and it seems a bit
> over-the-top to over-align the whole JIT buffer just because of structure
> alignment rules that don't really make sense for the actual PLT.

I didn't see a functional issue. I was debugging something else, and
ran into the UBSAN splat.

> Does marking 'struct bpf_plt' as __packed help?

It does. It drops the compiler's alignment assumption silencing the
UBSAN warning without touching the allocator, and the generated
assembly is identical. I'll respin a v2 with that fix instead.

Thanks,
/fuad

>
> Will


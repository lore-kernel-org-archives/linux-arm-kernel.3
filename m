Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88125FD0047
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 20:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jB/XXPWSS4Vb7E8KI5vsQ0OyjX/VbHAJPkU3Kvm8KQ=; b=DNMcOFJ7vOeO3S2edEUN0H4kBn
	+83EwmPBBvQDKJBEuUtDffvcZy6NMekKsSz+v1ThFRx42JWj+Ruh2aROlx1wOADO500OKvZ8KrqEs
	AHDmbaUzOPPsuPcU/wtsHUIX3DVytYN1rZfLyX/5JC5ucUBXKOVxzktZJ2wBeMqdugW7kWQ+aXSNG
	CCZFIRmLYRvzWpfJr/7NfzVbYY/PC714MrrJK9cFPKYVvbDyZNZEjE8602qei3MEnaR16a9RaX7+s
	bKE47pNu/Qd4zT4MeXsTMPJf9Ga0K+nOj9crsSjM5f9URRFuuTY40M233WNGXqSpzBP0/JcuPfn66
	+vA7gEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwmyq-0000000BqbN-3s2g;
	Sun, 01 Mar 2026 20:01:32 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwmyn-0000000BqaE-22a0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 20:01:31 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b934fdced05so494924466b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 12:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772395287; x=1773000087; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9jB/XXPWSS4Vb7E8KI5vsQ0OyjX/VbHAJPkU3Kvm8KQ=;
        b=iJrT8bTahQEjKr8HDJG+7LmZzYlcCRJA4fI0ig2cIaIXZW+n6qAVtUiPX+pJZPgsT6
         N9NVPGXkIedKtmzrrRrdMzOyZUF0slX5Tp3J9Kpfznqov6tOCFUIDUwZjSQc/6zqntS2
         Kr7wJFVAw1WbbjsyYTl1nOc78m15xY4xAAQHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772395287; x=1773000087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jB/XXPWSS4Vb7E8KI5vsQ0OyjX/VbHAJPkU3Kvm8KQ=;
        b=loty0iFD8tnjv2CuTa1t5sMaKeRUQJ6WJsuoSWl2lRrGmQfArOr+qm2pMFcuMvCU3w
         Ox4eOnA19asOkxisc/lez4Yizqz6IB2b0MnIBN67ArYmurInwHkHA07qMSQDAtt/e3K5
         RWyKIBsXORdu7IJ/hCQGsRCvZHV3vD03L+pjMdPT9DPeprmlHOK2Tg9MPA+RsEpLgRLX
         DvpAWb1fKWimbuzJBr1ijMvmHYpzBkJacinkaInNgG7FiBiO7kjJObOSjjW6Pi3q2Ick
         e5yLal2ycAFix/5xpdJBGXqhz/x0MUtYXJQvkcMvhnDwyBBVC3S5ow99Ps4ujM8+A/xP
         n+nw==
X-Forwarded-Encrypted: i=1; AJvYcCXHeHOyiu/z5Hq6Bl8swMc5VafPeHd4P83kz8A59kCHfcIlXib+oX11Q5OfUMq/6IFZciMmBVGkbHQNnO4ZBd0X@lists.infradead.org
X-Gm-Message-State: AOJu0YwrpiCOhkjSbvDfyAgUOpMFnEgqE+CRKaxQiWPg2BZ3/hM9MIVW
	YS1IqXuT8ZXGsIXZNTS+MiZyBabJ1QohAXo683vaeIWAU3jRtyALsGAa0zkEE+lzLVunxkAbfRH
	Mz00KVJj3NQ==
X-Gm-Gg: ATEYQzyLNI3aBHTw+7aVD+AqeFFqyt2SU7aYOlKVBekm6FheoWaA0HZ0eufyGgyznx0
	yBkGMKYSocAG7WRBI/jZVVs/zM/h1tGLl1/CFRH/oC5SIScM9oNJbhgHpCf8shNq9gon6LWUoa6
	hPtcNRsTKWBLoToEsiNH9VrxlEEXFmZPXv4p0n0kqEYcAQgm6fEc4gEtUzdFGkD2FJIkIVIHeE6
	4U42Vi51BtYUSdKzwWdhcJrMIPJ2I4zGr16wo70AtniCbTgm9hG6he9XcpStL7sJLRyqSy9wSvh
	qORBMpyatxvveTJUmZO/06PXDfApUgbtd/MFTTvzbK60zjwU47eNFMN2Z9pM+qkpsdqrUhCpjH9
	KvV2NpHAiViK2wve1L4Kt3WszTUgnBLK1ajt29jCGS+zyCqOWNklWFYHhIhCHzXVH4RJkuxQ+IG
	Rfc1Wwxj+HMlMqinJ2iCDgoXBA4T4SoODXHAHY6xEMUA6uAtTCdL8S7j2qyNkEWm0mHiXhTs9u
X-Received: by 2002:a17:907:7b93:b0:b8f:ae35:cbde with SMTP id a640c23a62f3a-b937659c169mr659627366b.54.1772395286699;
        Sun, 01 Mar 2026 12:01:26 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab146bdsm389000366b.6.2026.03.01.12.01.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 12:01:25 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so446422266b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 12:01:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdIFRenf+n2GW7eV4saO0Yko899ZLdSGKAC0W02orJGj3q5DTsUn454DCU5wVoxZSLk+7L8f9VKMbKW13IyatY@lists.infradead.org
X-Received: by 2002:a17:907:3f1d:b0:b93:5405:9260 with SMTP id
 a640c23a62f3a-b937c64ef77mr572433266b.30.1772395284743; Sun, 01 Mar 2026
 12:01:24 -0800 (PST)
MIME-Version: 1.0
References: <4e994e13b48420ef36be686458ce3512657ddb41.1772393211.git.chleroy@kernel.org>
In-Reply-To: <4e994e13b48420ef36be686458ce3512657ddb41.1772393211.git.chleroy@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 1 Mar 2026 12:01:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wixyP1mzyVcpZqQZd_xbabZQ873KVph3L-EkrNZGv3Ygw@mail.gmail.com>
X-Gm-Features: AaiRm51s3eNxZj_25SK_rlwxCS0TV1EUyjNISFnudmurbAezRL6om8RwkB99_8Y
Message-ID: <CAHk-=wixyP1mzyVcpZqQZd_xbabZQ873KVph3L-EkrNZGv3Ygw@mail.gmail.com>
Subject: Re: [PATCH] uaccess: Fix build of scoped user access with const pointer
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel test robot <lkp@intel.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida <andrealmeid@igalia.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_120130_438064_F88DF2FF 
X-CRM114-Status: GOOD (  13.00  )
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

On Sun, 1 Mar 2026 at 11:34, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
> -       for (void __user *_tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl); \
> +       for (void __user *_tmpptr = (void __user *)                                     \
> +                                   __scoped_user_access_begin(mode, uptr, size, elbl); \

Why are you casting this return value? Wouldn't it be a lot better to
just make the types be the CORRECT ones?

I didn't test this, so maybe I'm missing something, but why isn't that
just doing

        for (auto _tmpptr = __scoped_user_access_begin(mode, uptr,
size, elbl);         \

instead? No cast, just a "use the right type automatically".

That macro actually does something similar just a few lines later, in
that the innermost loop uses

         for (const typeof(uptr) uptr = _tmpptr; !done; done = true)

which picks up the type automatically from the argument (and then it
uses the argument both for the type and name, which is horrendously
confusing, but that's a separate thing).

Does that simple "auto" approach break something else?

                   Linus


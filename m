Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBC0EB3625
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 17:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhM0U/KytZp1XoP7N4M9fAB7JNIxjdmFkfjBUQb/l8Q=; b=n+dcnB3x2yF17ey+0/zFZWbsuh
	xDMJ1RBfqInNlKJVy1yq+U+9mWQ+KPRb3JJeWXFDDNx2vS95/SAYACzXbO6OBbisaJvJTGkWTOPLP
	vYQD93bpgrEWn57uCJJQPkc9MDPoL1po9hbPUhTJKl2XCMPJ7KwLDYwNxCkvyiP8zaTKyfpFZQPi2
	zlz3a0+WmOSmJEfigY8krXAqCm8QKE6X8y/Hy7jsXd3FrOLb+7guDxPXlIbzRmHCsueNnyTmD2/aS
	G94WPSfV1l7Vobg9mMTt/whDvt8bOgEW/OPLNGCUCT33jGRTS5g3EesJaSJvCnJIz4TUbds1jp1nF
	eZ7hmhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx72j-0000000Dabk-0VNa;
	Mon, 02 Mar 2026 17:26:53 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx72h-0000000DabF-01qq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 17:26:52 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-65fb991d7e7so6885150a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 09:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772472409; x=1773077209; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NhM0U/KytZp1XoP7N4M9fAB7JNIxjdmFkfjBUQb/l8Q=;
        b=N+Q+IiTdAV3fxY7RHhUr/Slt/1DOR29/UupdDjw9B3UEsmXH7T3FBarUVxzALEG67c
         RaqV2sbQgNbHk9kroLG08vdWbRNB9rg769angoE7jJEHqzL0PioWVISpXgMc+V2pW3ml
         2X47H3QsaMpxfLziqgL2EENzHn8ht74iW+NoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772472409; x=1773077209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhM0U/KytZp1XoP7N4M9fAB7JNIxjdmFkfjBUQb/l8Q=;
        b=H+nxrYA+Yu+z7D+eHz0Vl3/9Rd00MRWZIOjuZIdTmJ6oYoMb357IoHJpzLJ9sQoFu3
         M6l7RLVaE5e6bfmgXo/a+KUT8g53senaNlHH4sNoBDQbq0ISK/Cvg7gbIyLBOlIYvKk7
         gacxchjagdE7sZAnfgPi5L4Y5mdY6IzWHvxCugqpRKb9Ak/Kf0ZOELBuGFpvHaBOA+VQ
         PKEkDL59/eWFvxRj0B7Z4oDogr9xBIWUGPLb6k0597ec3mdo/MH1pXnyKgmGoxgbLC/P
         lrR241E0caAtLWQhc12jiHDFTZkYmCQRkhwuPSvaqiTqYs1CAA2RWkGOM/GEeeO2eBK4
         8GPw==
X-Forwarded-Encrypted: i=1; AJvYcCVLzLEnSPUpjpPvDQHMJEuIKgQGLXNWSDKvErZ0K7DSjvCwpYAXCZ9SXAV4K6Edo9mrUK99Lz6qHHKYm9es6ugH@lists.infradead.org
X-Gm-Message-State: AOJu0YyEzp6NyfieI6JHMuckXmHcfdPHfclzXubkDkwFketPdeWtaR6p
	hQGbY+54WIhqy7iuWcs6ZCWWMupyjEi2oSONAao/mEGbKSJ2gdUoxAOf5OLwW8co4rjACo4YhsR
	jaI96dVJtZw==
X-Gm-Gg: ATEYQzysrrmc6wxpGJg/AehkTr2HvqlCtuVqd0eFnR04cmjUgUnSOj9Y5Vk3FAndni9
	FWyTzBBe9QXkaaP1jQzDTdjzmLYUmh6JGv0tYZSc5aPc8J3z2kQhl2+9lQWwDeL8I+6+hTDr4IT
	yHyipamOq7cH0ISi68b4dy6wHcg6zlvm2XwZvwfqUTmMsI/+Em9XKNFmlsFiPjBjZ1cdwCfnJM6
	Lp4dRT5M27LpJ00GmdPX7IfZR5NxIiJvEyM4dRVS/c0VcJiIFi6ieapQN6z0MyBWzLaApWVA4UU
	qJp5fYRrf43eZ4gtSp5OF6Ij1YF5bzunHeFMOxeOD70PzP+vjigS+KjJECoVwx0KbNBqDrqQGPk
	Hc5gLX6Z1eeNcfkAt2Zz41UF7+1Z/S1BA8hDbtySkPMAtdD4cgLd+xML8ykgU14GeSH2TW428mG
	+FtFxWwndE79DgEFt3jpPGaIVFB7oX0Edj82bfrVlxZXqUTSFKkUABBB8r9VZXakoR7RepEEm3
X-Received: by 2002:a17:907:60d6:b0:b8f:e46f:8079 with SMTP id a640c23a62f3a-b93763ab9bcmr847880266b.22.1772472408916;
        Mon, 02 Mar 2026 09:26:48 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b93c9fc1808sm22743366b.62.2026.03.02.09.26.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 09:26:48 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b904e1cd038so631156266b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 09:26:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcZpbIJYjxK5HKktO+EWQtFCrBZlMStLrz2YJlme79x7p5/Zs50JABr9+Ay4y+gBzGq1kj78V85vpGxufXJvNT@lists.infradead.org
X-Received: by 2002:a17:906:6a17:b0:b83:1326:7d45 with SMTP id
 a640c23a62f3a-b937b42886emr757779066b.32.1772472407269; Mon, 02 Mar 2026
 09:26:47 -0800 (PST)
MIME-Version: 1.0
References: <20260302132755.1475451-1-david.laight.linux@gmail.com>
 <20260302132755.1475451-2-david.laight.linux@gmail.com> <e8a688b3-97e1-4523-9a82-8d9dd16e3d90@kernel.org>
In-Reply-To: <e8a688b3-97e1-4523-9a82-8d9dd16e3d90@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Mar 2026 09:26:31 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjKWi=j_xcMBAi2Hkuut6aNeqXTwOFoMGkHfDA+3WXsgg@mail.gmail.com>
X-Gm-Features: AaiRm52zcwSKl-2ZFc2XJ2K-Xgcl3ar6vYfBBv7z9Nop6yBvMYBvRXM6loWQHmg
Message-ID: <CAHk-=wjKWi=j_xcMBAi2Hkuut6aNeqXTwOFoMGkHfDA+3WXsgg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] uaccess: Fix scoped_user_read_access() for
 'pointer to const'
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: david.laight.linux@gmail.com, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andre Almeida <andrealmeid@igalia.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Christian Brauner <brauner@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Heiko Carstens <hca@linux.ibm.com>, Jan Kara <jack@suse.cz>, 
	Julia Lawall <Julia.Lawall@inria.fr>, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, 
	Kees Cook <kees@kernel.org>, akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_092651_066703_61E749D3 
X-CRM114-Status: GOOD (  12.56  )
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

On Mon, 2 Mar 2026 at 06:59, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
> Can we get this fix merged in 7.0-rc3 so that we can start building 7.1
> on top of it ?

Applied this first patch. I'm not so convinced about the others in the
series, although people can always try to argue for them..

              Linus


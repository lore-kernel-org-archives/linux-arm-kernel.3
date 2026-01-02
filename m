Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A760FA3751
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 22:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StGZh5UIhFdeUEf/ngmSy2NSY5Z+LAPTFt5BciOr9oI=; b=sPjmPL3sUraEh/pA8wRZ85AkTl
	P7tdrrSorjlJKKH4oUJMNFEStQKtJdnnNzreAmal1rBGM5pS/yGv/c6O8bYgitwi+OGzd+EOTUZV7
	jRjTixiew16XKmEK7FqT73uACrq7M1b11qB+M918wSSLivlzPz6IL3BhgeBzaBFJuoY5vYy8TsXyY
	/1jVVXIduKUy48dbzvv3i+hwOAzYVlaxW9Q4hm5yFfk9lViN9cqQMah5LcqNagzrSnjL7ZuWtxhrJ
	i9itQ0Z+VY99/FOhEoVgtitOY0Qdlu+e/2m/6igVcw3GSt4wnylhy2jDJ4twv8Lk8cGRi1aqGfENp
	hjNEcHUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbo2B-00000008lZi-2Gup;
	Fri, 02 Jan 2026 22:54:15 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbo24-00000008lYr-11N8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 22:54:13 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-42fb5810d39so8032392f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 14:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767394446; x=1767999246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StGZh5UIhFdeUEf/ngmSy2NSY5Z+LAPTFt5BciOr9oI=;
        b=WKXP+dusyiXr2HpiwDKr/rj0U6VekvJkp99psk45kXDMvG+8ParsnA8Vuu1FNyyr0+
         +JIJVtdE+XjLJnvfH8G3YUs0kCtGeHP77NVqqxXukhVIi7/mAhgao8yKTMfG6yJHihY0
         ghQoXMPQ87LkkiuQehNEEU67P302yiR7Pq9FwXL6oK77XR+PUpDmVq9l2rj0axZDG+ow
         EJjYvB0uI0ae1TDyVf2iZ4xW1EBkZhp/BD6olkjSv2hzNwQ7II+PfIXQHkKxVm8mAmM4
         9K5YufbgVemdsyYBEwLyY00bT8O4AKdm5mhY0wirp5vjStDHoHO/XFtER43K98CcmbPa
         kniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767394446; x=1767999246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=StGZh5UIhFdeUEf/ngmSy2NSY5Z+LAPTFt5BciOr9oI=;
        b=wBmM+kI3DTC9Yc9cyerExGX7fX5Sg50zzsz979f56RPCYm9Ks2FnM3FMHvjX7ZyOxB
         QOrrbLnIu8QUhhMd0Mfpkjvi2TEsIoVYPY+AW5YoWospqda6vHzMZjxrNsowQrgXGx8U
         N+5Tiyhn+nDOqtDGH7+SD4ssXxAQ7JPfCggi1V5OjdtczrWe8ESx+HfmenRnh/owGa8j
         vrHi+AUCw2VeiS3w7b5rl/yCIAdSLbBfLG6LhzHBOt0V/C8xptmDcm5nKyTKeDMxHL3A
         HdXB0h0Q0qV2O1pRydRlV/8KW4bs2r17LQx06WMjnGSs1l6QiAOYlCEOpofeBBsLf88s
         xTKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFQF1kDmueH+2A3HIF3pPbMMUnxJ5Aats4gwWNRiLeUSGx3IRr5WDRoHksnPOgxeZENFwMoZwOyATIDw5ZnwAT@lists.infradead.org
X-Gm-Message-State: AOJu0YwnOU9diS3WlIkKSo1xpJkiI4rirHp/k7l6GEpvDuqXvTdObR9/
	TiFr7sTEVxXaTuLVYZqYabM6cs+eRWCk95kXEnpEQeoGwuR2DyaqPEye
X-Gm-Gg: AY/fxX4Bl7XBBNGclshsmxtt5liSjKmCpHuCmuDvy9ogvy5FoMsi4O+uUPTGbHXU/Ti
	VwriWVs0rUe5pU2+n4rubILefsd7uTbZN+pyNRJmXhET/rk/M+pmhfsU8DV1JYt1k2XD2qYkHaT
	9fF05+6K/NbqF3hnf13Vs/8cfyAN0Qlow6jAkyi3KXhOodeVDI+Ch+XjTWDNESVZB9lApQ2mVZ9
	+CQUy9SQS25xKXAWRboX3g4jNGEe8Zunzrt/8l9Bx9pTmj+tSve6ufgYkC02siQJJaZJqEvo8qZ
	JH8ee68j7FreKT/D/B8IIeWAHfxWZzR77bzz43yxVjn0xh4kYUMvf8EGE7dtQ6hgw8SSRVXv7GE
	a55vFTij4SfczZKpvfcQHFBhPe9ANuq7hY2CBqsOxTp7Oin0tYJudyeV7kb3979MXX0tWphsM3H
	sKMw6soH96mAuNd6RZCUc47H0R4ZGQIafgGl0gNihxYhWkTVu+hfU7
X-Google-Smtp-Source: AGHT+IHhZlcstoHojBz97OFk5owjy0cbb1cp4fYnQEbcnWo+WUycqSneA9mdGDNlnSrZ5xQclO2tXg==
X-Received: by 2002:a5d:5392:0:b0:42f:edb6:3642 with SMTP id ffacd0b85a97d-4324e704c03mr44422531f8f.60.1767394445433;
        Fri, 02 Jan 2026 14:54:05 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2ebfsm86000586f8f.40.2026.01.02.14.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 14:54:05 -0800 (PST)
Date: Fri, 2 Jan 2026 22:54:03 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton
 <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 2/3] prandom: Convert prandom_u32_state() to
 __always_inline
Message-ID: <20260102225403.78e26214@pumpkin>
In-Reply-To: <CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-3-ryan.roberts@arm.com>
	<CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_145408_343692_44C985FA 
X-CRM114-Status: GOOD (  14.24  )
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

On Fri, 2 Jan 2026 14:39:21 +0100
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> Hi Ryan,
...
> > +static __always_inline u32 prandom_u32_state(struct rnd_state *state)  
> 
> Why not just normal `inline`? Is gcc disagreeing with the inlinability
> of this function?

gcc has a mind of its own when it comes to inlining.
If there weren't some massive functions marked 'inline' that should never
really be inlined then making 'inline' '__always_inline' would make sense.
But first an audit would be needed.
(This has come up several times in the past.)
But if you need a function to be inlined (for any reason) it needs to be
always_inline.

Whether there should be an non-inlined 'option' here is another matter.
There could be a normal function that calls the inlined version.

	David


> 
> Jason
> 



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50C5CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 16:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOlGULRRBESS1B6FKAmb2SdwU8XK+0w4GrnM3lfwOWQ=; b=e5b/LT4PVl6kM4+jC7MU+xsaio
	zOrolwuWhdzZV5zoOpk1Fr6Y8pumItxDLLddAJ1iAgsfvV2bPUD8QOnHzn7z01dZ9uL0H4Nl+xGuA
	WuRDPsn4vE01LqgzjVAUUT87cPuB/oFg59V6fUv+Nz2nqVI315POmrtoCAfh89LML49VadgyljhHD
	9hucsI3/GAhJamTRjWGxs1bkbWT5g/tN19C9ndY0qdgHfEghTKIlovX0ng4hmi2H+PsFTm9MN3NW+
	1MSMZugcvlemfWt+aWioYLtNWS0ASNqkS0A98Lqg9UnN8r+U8OvnbDknEGUPRjtiMT/xf1OaaBgtD
	0LglywoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1s0-00000006NYA-3tbK;
	Fri, 29 Aug 2025 16:22:32 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uryqs-00000005l3A-1NGc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 13:09:11 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-afcb72d5409so347893666b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 06:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756472948; x=1757077748; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOlGULRRBESS1B6FKAmb2SdwU8XK+0w4GrnM3lfwOWQ=;
        b=HBnosfwlJFVA3noOjMdzOvEM9ATmm5ri463wVzMgugA0bpReZuMyhz/0jwyks7zEYO
         E3qcSV+b0k/Hh0o96y9JdYosCKWhbUKu2w7+Aq/lRRwjecwwMDDumz25sfnNOf+RFXuy
         sEuGYRh67gcGO4ugCIWqWAqDQyfHdtm7C0mz5KMRrxdxzDcsAEfBeUpI+VSuF8oD+TFX
         lMQj6UHXX7sv9YEoiO/rHse+jIY6Iwg0NihYQmCArX6BKFeXFhCZFu75TN1Bzxg3dzvI
         MS54x7FkjjXjlhfOwGAqkPT4rhEV2H4IV35k8SpSGDvLWwAzTTGxyj6w2d8FIq6aiTc7
         ld2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756472948; x=1757077748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOlGULRRBESS1B6FKAmb2SdwU8XK+0w4GrnM3lfwOWQ=;
        b=G0Tobm+8dUh3iTQykjHgIs1DpWA21fiIxDt+mIsqWhNnLROkWEuK/kFb4nejnlTaLX
         iekh3WfG9hh7p1xjGAqAbLlhZZtvAdmA9/BJD0rtL3SlouYscD5osjZf1ZLqBRosoVo+
         0VHYfytgTGTFnStJEOJXeBcbpcS9U4eCbAtKLg/cJ+YXl1Y5jF4H6wSYlMuCCQ4nOjhQ
         iW/cV0VFtfqComM+35vu5P6IjtqGjxN+85bRlQAL4wDS+blOCbWxjJ5d1ahXYzUL3Vnc
         4agl1M17E3YOmhytWTy+kp9/VR5fs8BFYxZs6WMKFYVb3PhdLdMjpR8MeaF1PkgMWcIA
         oNSg==
X-Forwarded-Encrypted: i=1; AJvYcCV14xuEYQ5oAP2x2y8nEZRwpjfZ5+mW0lVjK7O3ko2W9pF3G+NLAckWnrGrWC7s18aYjIUwzy5YSXrWcqxVwZCf@lists.infradead.org
X-Gm-Message-State: AOJu0YwTKvuBLr114mcumC/WKWcXRSKXZCaUKs1lilbUdKVkViJ/PDqj
	hCVmUkmB93c2KCZxbVYlB6IB9OXVfviDR19zne0JXKMn8OPVS0Dc08C38g+LZxt0GnyVwYjdycF
	WEx1T09UptuGjIS1FdfqlrrQKse17ApeA5ORC
X-Gm-Gg: ASbGncuqLqEuMbNXhNwLhjEdKeA16ckZeecczXDR5RBB1grTET1qffPiiO/N2/XHjOM
	QSaAvYVgW7vHnZL1J3lp52W2T5KvKnPo99magL/07IhPQUjs8awj7PfzjENVq+drEf30TF3JPS4
	UudBwU0oXneoSO5aRUrkV9fYedJlWhpNJ4Fz2AxBysaq0tJ0crhcemQfjXXdbnKAwdi9b469Y5/
	kaes1GJielxXmZu/9qCQzmHEFy+2g7e30oeQwNGkG4B9hA0mmH9ybUBKuwbbFNnXLqzslgRtX+U
	OQRDfXTpUOtAZnLMT5EVs2mRuxbeF3I/CxpmUwpA3krgqYMbUQMZ5R9DpI9MuAjuF1E=
X-Google-Smtp-Source: AGHT+IGID0Yr7NzhLbvdcJDd5PR7loGNbghiuTkZejFibNh1I3F9FhGziJlTcPTrI2a3z865+5IAXbKTbH+jTM98IOM=
X-Received: by 2002:a17:906:4ec3:b0:afe:74a3:f76d with SMTP id
 a640c23a62f3a-afe74a3fda1mr1537152666b.16.1756472947953; Fri, 29 Aug 2025
 06:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250827151131.27733-1-ebiggers@kernel.org> <20250827151131.27733-10-ebiggers@kernel.org>
In-Reply-To: <20250827151131.27733-10-ebiggers@kernel.org>
From: Honza Fikar <j.fikar@gmail.com>
Date: Fri, 29 Aug 2025 15:08:56 +0200
X-Gm-Features: Ac12FXzP7AMNvKr3rovHU6ozQ9uIXQuWW18zjeyPmWZydBzIv70_f24LOqsCh7k
Message-ID: <CAEH5pPY98CaSm+EXiuOzo6EuWzGu7rEQjGa3eojk18HP29Rs7w@mail.gmail.com>
Subject: Re: [PATCH 09/12] lib/crypto: blake2s: Always enable arch-optimized
 BLAKE2s code
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_060910_362501_978A0073 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

On Fri, Aug 29, 2025 at 2:54=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:

> Currently, BLAKE2s support is always enabled ('obj-y'), since random.c
> uses it.  Therefore, the arch-optimized BLAKE2s code, which exists for
> ARM and x86_64, should be always enabled too.

Maybe a stupid question: what about ARM64? The current NEON
implementation in kernel arch/arm/crypto/blake2s-core.S seems to be just
for ARM.

While the upstream BLAKE2s with NEON is both for ARM and Aarch64 (ARM64):

https://github.com/BLAKE2/BLAKE2/blob/master/neon


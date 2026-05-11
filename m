Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EC2CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z170Amak81rqK1Z7ArZ4RiigKBxs4M8ehBqJt+giuPU=; b=GtCtnTFhHBaIBCgqjq4xHFOHvA
	60HNlYPdWlRFWtXUylR9Jy7QFA3XZz5JrM1Ng++3g+A0wlDqYWovA4wHliZqNNLXkx5J5fiNkd3Tf
	WwkjsSs7pmOh1Fk7K1RklGBdwEhlKcyXCW+j25UFLQA9ywNcG8WWOM+jEe7OkIPMCmY+zh1jfDJLf
	IiUpJbpw2eh+ZsIa8j8V5B9rU/WZ07ImHFgG6H5LsacnCzhIGFN3yGPxsQREtMSpE4MGckhRy1C7M
	KnCpYAaop6dtkMnKFXA7fHhvOLAtNmt3qPr9BsTxFAmOBqodJEmIf8a6muQ6v4+SL5rLyiIObOwvD
	BpkKHfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRpC-0000000DvwL-12He;
	Mon, 11 May 2026 14:41:38 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRp8-0000000DvvZ-2mQU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:41:35 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-671588ab0cfso315a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:41:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778510491; cv=none;
        d=google.com; s=arc-20240605;
        b=enDtGx51g/DHjFauToQ6/lFgBDop5LjPO6tKuwOQEK/V+w9JsZlaETV7P/2epfB38E
         K/4Fg20bp+gmMHRGlFppNCD2EtG/5465f0oQuIuahjkWqbubV1zuuMx93fCE5ElPcX3o
         Bx9pah6z12KGHYtehActqAwr+B0GCXeH+b7b8rtEMOcFnLbzFetMZSPmZsyO5kBD4ju1
         c4nXQ3GsQ4XaLscy15Yb+vmjOeoSze5PeevoUXbpcESnHMzbIO6KqDvh4MHcCYw6MGfG
         WNq1vvxP3XL/pKtnnGToJK+H8bynD9WBd2IRHAdU9jvnRyh0uaVfuLMJbBuYvArZGz1c
         vgbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z170Amak81rqK1Z7ArZ4RiigKBxs4M8ehBqJt+giuPU=;
        fh=rV0ajtWdujtinJxD6HdmqL7+/ocLXZ6j+maPLIDyjA0=;
        b=k5KIGVGliaH+VG27sW54E0SWrfyxAeBE5ty331fxzx5U9Oh2Fb7jHCaqb8+vNvRvTx
         Us2uF7GnsLm7TOBLKb8i+8+pHr1p+yhklh12ftqMeXGgiWI8MfMpeHQAiRz58RCGvrq9
         RAZONk6aXEnR6C0XJUCjQailBXVIUH2+kRVH3ARCJEyMOMZOhyi8U2lzhIFqf5Srvowd
         YIJIsBi5zYkvj7oopLGV21B20xHJZvjxCwECiiBov7xQoHvfQMYbNGkSb18FmM8bvIYA
         78hsxBni/v8YAFqtNyCUh2u7lwIDDZ8GGvADU7jjPn8l742bXT9j2zqEzid38HhcJhM3
         1prQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778510491; x=1779115291; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z170Amak81rqK1Z7ArZ4RiigKBxs4M8ehBqJt+giuPU=;
        b=IapQeh3G9kjvF2reOp0oFEZFacpRcN3yPgbF3ICKX6mq3Fp0dLeP9Vb8Z9TOg8ExyD
         AhwJYAzviHUGzr9w8IYcdjh2C3B+nlGKpc1ijXivpt/MJlioB09Mf5CjYaG0ErdDXhkD
         +Mwf1TzaIvv3PKplts9IP7VzuHCWk9MI2Jem8c5/TOdvM4WuMauFdTEWWQtIWhKpc8pD
         PGVmyPTX8tY0fPb5//1qEHzIl9TbynLCt12h9hy6AZSasJwNn/rwUilAgIVIzW3TgbtC
         sI8RlVBVUu+e8UaAI1A4/RsAck3kTGPaA01Tt4lHWLfOT0ydhcHO6KAPAcsV0S04CyHr
         ZG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510491; x=1779115291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z170Amak81rqK1Z7ArZ4RiigKBxs4M8ehBqJt+giuPU=;
        b=LZlX9n3UNJcX7A8X9ft2hdLs4JstTPxDmiBwCs4dhuWeZrRZuesezS4uAIzkIdpv6U
         SFmPImccEpB08lYLoLmdNcpimNx8CYX/d03aj8CaJFK6NxU80KDsuvsHmNVC3PCXKZS8
         eTTAMkPOIneYCG+VnieRogNQBBplnr/61JWUkuUciEFEgutjCrBE1shPdL2iDHRsxU0+
         nIVZd8rHpa4nsk+kW9ctyg7YeXUI0ITxOb0RyMFHe/yZV4ULiBv9i2ps4OaeCWqwhZjL
         03oMywV/iBEyxiqbUjX4JR8kjE8L1jgd/hLMTMJGxg1mhKaY2hYgx9/ipQXDCqTVE6Et
         r+XA==
X-Forwarded-Encrypted: i=1; AFNElJ/lh0wrHeJmO9uvUZl6HguAwajscjuvtPjI25Jz1wUdEsVOYcZy4vf8v1A+nosH/tjZu5MnNIMrKxxxtpXOUMyR@lists.infradead.org
X-Gm-Message-State: AOJu0YzSlS4H5CsPTMnFdXcVZ4omOf1hPjDEEox09zb7meZo/AfCg30B
	yn4v0O7McOlHUU3qgAKXDsc5E5nOtJ/Limhk5l6AW9tU3oY80twwi3mzPazO+SmQkaUL3wFYANA
	RtxGkolMeBQCxSs7y4Fi/dizB/Oy/I5qx32m8f39b
X-Gm-Gg: Acq92OGyEuUbXq1FHCzpujk4ro5GiFUoy/gaBYC65h4r8SzQAF2xSaSDhkInYtP31ME
	yxKaRG17IZSjPgzQ9ZZDFQsJu7EA5eKbZhiYLW+cyLqsUj7x47aLW2fc6cNCw2nuIEwDa+E14xL
	N06nh/lm6OPhrxC5ZQC3LuTCkG4sVCsqmciFuZtgHDyULUvDgzQ5I1RX18El+GifUg+vOmvYl0K
	UMN9IJkxW82R+muXbz7iBeVg+io66Mr5WJsH68YStB1meVZab7ovtfRvzZmbJ/bGF0O6gMZYUfM
	cpEElLwEBPOAbWR2wniIODZq2MW/y7NYDsNvEFayr6JpJ32n
X-Received: by 2002:aa7:d702:0:b0:678:a5c3:4d12 with SMTP id
 4fb4d7f45d1cf-67f67ef588bmr85386a12.3.1778510490891; Mon, 11 May 2026
 07:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-19-ardb+git@google.com> <CAG48ez1DJ88a0pBCE-Q0VXyDuJgng8zdunb38g4b4JPU88exww@mail.gmail.com>
 <31252c1d-a98d-4635-ab61-ce5b649e256f@app.fastmail.com>
In-Reply-To: <31252c1d-a98d-4635-ab61-ce5b649e256f@app.fastmail.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 11 May 2026 16:40:54 +0200
X-Gm-Features: AVHnY4LoyjasIFmS74GQZueVkF8l7m5tKta7HqO6wHGgS7XuvrG5_IpYer7LdIM
Message-ID: <CAG48ez2xJwJDgxSH0u2G==9dOQJQxQ7WsQfU14O1H5hEWic1eA@mail.gmail.com>
Subject: Re: [PATCH v4 02/15] mm: Make empty_zero_page __ro_after_init
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_074134_764307_EB35D9D4 
X-CRM114-Status: GOOD (  17.22  )
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

On Mon, May 11, 2026 at 10:59=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> w=
rote:
> I think we should simply do something along the lines of the below,
> considering that the size of a data object tends to correlate with
> its minimum alignment.
>
> I do find it rather puzzling that the compiler emits empty_zero_page
> *after* zero_page_pfn - ideally, we'd combine the below with
> -fdata-sections so that the linker sees all individual objects, but
> I suspect that would create some problems elsewhere.
>
>
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -452,7 +452,7 @@
>  #define RO_AFTER_INIT_DATA                                   \
>         . =3D ALIGN(8);                                         \
>         __start_ro_after_init =3D .;                            \
> -       *(.data..ro_after_init)                               \
> +       *(SORT_BY_ALIGNMENT(.data..ro_after_init))            \

Oh, neat, I didn't realize that's possible. That seems like a nicer
approach... (Assuming that it doesn't cause cache efficiency issues
somehow, I imagine it could be possible that source-code-adjacent
objects should also be located next to each other for cache/TLB
efficiency... but I have no concrete reason to think that, just a
thought.)


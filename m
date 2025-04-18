Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B75FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 18:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d22YnNj2bvvH91hnPGqpeN3Ca1vvKu4PX7YmTnLd3BI=; b=zRplDhMfCr5/1JIsuIvzy4ocHJ
	/i0gHKx6aOg/3UjTUSEyIgIxndVyAi3nBd8TRYmDoE5Gib9UAQuaUu0qVXcPqXn1DpDDIcY2yLoKo
	en82oKtMdYvSOHKraNcu9Vwv2TKheJzWutledqN8DcU1EHgsIt2fiT9jh0Oiyrg9pw2Xl700mvY6a
	mie9NyJq8+UqEHBQhnCgG4GqqRjQesIyv++1lojlpjf2vxzt2yDMAFCW/EtH5OVJlq+XNgxsNalzC
	EkQaS153vrNKHrN3x2kOohb+F6WBQldwqrrWEqGYK6WbpUnNFHpzp4pIa5uuFds+hFRz5UCVKRuxx
	dmwLTTmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5qKo-0000000HRPX-0rYh;
	Fri, 18 Apr 2025 18:21:06 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5qIs-0000000HR9U-3WF2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 18:19:08 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b0459668101so267570a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 11:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745000346; x=1745605146; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d22YnNj2bvvH91hnPGqpeN3Ca1vvKu4PX7YmTnLd3BI=;
        b=T4hvZ4DPii9Y6lsS4tUn5AvOH62AGeu/XJMuaQOoRz8xnw33cZNtKkTkZU4IU7kYXq
         751md8fAizLQ6FMJVNd1oaaWib4w803n2kcL6HeX3i9eVxRFH1vGrLZTn+Vm75s8HHwy
         K7Rgz2eDqJLoteqSqQEn5to5DUgs5gQwIqZSXs4WFjm1QCoHXoe48NcDohGqZli503sp
         ocBFuo2FLB+tWCsCXgTJR6wXeL8VpSq7sgbyYjYPFrJFgadBb68fjxiI+vfw2p4O7zlH
         IrDlpqhyWBxvm/WhgmFlicd5/dF5hmzDub4/gNb8GfTqEoORD5va7a9cCg/8USs08lHz
         H5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745000346; x=1745605146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d22YnNj2bvvH91hnPGqpeN3Ca1vvKu4PX7YmTnLd3BI=;
        b=lKhOhLGSuN1+kL+heqMl3dkKLZWRZMFI4/0e6VdPpCXmHvKKurF7nM1GyPY6B6Blbr
         3r7OlBe3AlHZKtxUmFZF/iFulHz4VV57gnyFA9t9raqjDXOXGxuf1hE1dcB9RJW/Y5ea
         EQYmo/pHDap1PdTYgMaS7gG3PPworDnOyYc8XnAjD9U/54WkTecwBQts8zhS1XawEIDD
         tDzTwEtB7iiubF5+vw5cR3FrDBeNhwEW5UuBTljXsphBs9Bh+0AirU5f5ymahGd9CA7e
         ISVEOQtfoXUmMu0c/crAO86fSQlRm5PSP70MF1CPAuwAelyZEQ03C2x40QGIcebL7dl8
         dTEw==
X-Forwarded-Encrypted: i=1; AJvYcCWJrCmT+Z9Q/7SVLxyYA0a/L8BlYlvVr3Nd4l4zn7U6uj7EXVbvm7TKPmgXDp7V3LOAAeZ3VHNiCrH2aa53w1FD@lists.infradead.org
X-Gm-Message-State: AOJu0YyWrTDkqHagsv0ddO/gk5ISBbtLplFZztK5FzKqv2NFYhAJGtpV
	dVwSQFMUmiRv7Fa5AIMLvV+4EVzhWwZOqVwe3VFGncz9ft+ezVjOR75snqYvZqo/vXiQC184O0F
	9KN3F4vocq/hWol4KOEYOzwVnerw=
X-Gm-Gg: ASbGncsPkB32ROJ1wTn3IY/xepqv9yHNl3GERSMK1AV3MdcYzyaLTxK/rSPoRK1d1lS
	l1cbBjaMrr6SEQq0sSdaicLG6YyliKJ2IUzTk7+Rr9LHxMDBDpPmY5fleQnGS7gFhU7mwjcCSZb
	uRPPgGhMCKzNyVnH65V2I2oQ==
X-Google-Smtp-Source: AGHT+IFV4p50Y316WvC6L326TQ06DuzofFaE8ATLtfwiWvN0aeHQqLZuaNb8xpXTzoUb4z2FpJVX3YSLno6jad/7bKA=
X-Received: by 2002:a17:90b:3b8d:b0:2ee:acea:9ec4 with SMTP id
 98e67ed59e1d1-3087bbad9edmr2033817a91.3.1745000345670; Fri, 18 Apr 2025
 11:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250418165059.560503-1-jfalempe@redhat.com>
In-Reply-To: <20250418165059.560503-1-jfalempe@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 18 Apr 2025 20:18:52 +0200
X-Gm-Features: ATxdqUFNvn4gbPVQIz8Iq_5t6yfACtcQqcpNAlWXdLLoUUoWOhcu7yBY9nNqBOM
Message-ID: <CANiq72neXsmmYQXQOYxndFWkyp1NKa=x3skekZZJOVE-wMZeuQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Paolo Bonzini <pbonzini@redhat.com>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_111906_874613_FF436BDA 
X-CRM114-Status: UNSURE (   8.02  )
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

On Fri, Apr 18, 2025 at 6:51=E2=80=AFPM Jocelyn Falempe <jfalempe@redhat.co=
m> wrote:
>
> Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rn=
xxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]

Thanks for fixing that -- some tags for your consideration:

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rn=
xxKvx+HvWdBLopZfrQ@mail.gmail.com/
Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")

Cheers,
Miguel


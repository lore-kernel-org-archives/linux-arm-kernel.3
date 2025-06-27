Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D16C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 11:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1Owfq+XsKZjeFo4Rbc6Jmea/9OoeGFSrEDZpKoNuLo=; b=EOH9ZQhbQEvCvdPBaJbqCSwyTT
	6aE9najSW65s+qslApV+gpNrSZwtgfQrbPwWVybmDRftOJ/lz17f+HoDWKeVvIUa1JUMVD4pRCVYP
	47W70OVlos5ieEHfIMq4kprjQ2lWEhN1efi4LF/iv5lr+s3C/m3+Z8xaFaBLnqKvIdZbRx99tUb/a
	W4weLV+SSHJltu3Tzi9Duzi040qUFDPoAG7E47JJY9XizNYa23o/Kn6nWp9LaDqiDAO/OUK4HKYUX
	x/RQDzZArVOqJyCj3kXeA7hl4NbWvh9Wh5RVXVq38lCtrvy0HO3f4zWXplnkqqY0OoQ/E+Lobou4c
	31UQkGag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7XH-0000000EXYb-0cMy;
	Fri, 27 Jun 2025 11:46:27 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7SZ-0000000EWW6-1JSJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 11:41:36 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-313862d48e7so283927a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 04:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751024494; x=1751629294; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1Owfq+XsKZjeFo4Rbc6Jmea/9OoeGFSrEDZpKoNuLo=;
        b=SpJNb+l/I8hkm/cppJxJS/bzXYjeyoeuNgJGZpaoyq/xL5GylV1l4p3n6c9sB+mn9a
         2kDYwCRuZc7054avQlD+XtBQZdGJP7pLTLzW5iOAxOp2pJo4TWnUkGvNseT84nVdEYpd
         qx+QTT4jnW8frTqy+hx2/L/z+ZHg70jej3IiJ9Up+TLOODNJXSDcRl6fpx/54DSqxiaY
         GgPKEZqJAXJpqRygNBamIRe974r+/S393/MT8I7OKqwfnXfYJFSjVdSq6Evp+2/H4ekh
         yhbo+ecx0Cf2TJGbQae+qqzH0C26lVIrI4NgLcOOY6sYe480F/BDFgX7xU+iXNtrj172
         C8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751024494; x=1751629294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1Owfq+XsKZjeFo4Rbc6Jmea/9OoeGFSrEDZpKoNuLo=;
        b=XH/cwD0M9N5U92s2/IsCePPO1TxeG7WklRIlCpjSPCJN29J5mxPdF3EiDzJY4hLXoO
         yBhVOj+0I6rpRoUkUq5FcvAICRWO+bUchL5MryZHu3BZpSIXaTjHU/Cg0lpdwZIzAZwK
         vRTTHkN8gM2LdjQKSFHd6/myw93gYCqDoE8AUvBvtRQ1hPtDepqEj7vEj7CDtiUhXTqI
         Rt7J+rqo1G7r/k2M4jGXca8HBfvyqKpr/pPIoJPuzGFyrIZTU4+3ENm0icPoPLBpsSZL
         3pSZMpznIWn2NGye1OeBYeumH0URjX6/RFEZb0qYfqhPcTQnUWSer+xdx/NXFRCmkxau
         0Q3A==
X-Forwarded-Encrypted: i=1; AJvYcCV5uXFIOUP6FK3te/1QuthEeD4yhNqKyj+wxZql1sckjyYbv7LLF0SZUYdKx2udujvdswHPL/jwyF62kXPazu31@lists.infradead.org
X-Gm-Message-State: AOJu0YyTRCdaLz65lANZ2d30DPGydfJ0jgi1MxDK8TMnOxig+2nIWlO+
	hDytd9hW191+Gc6u18/XHByItQ7SXZCcQVoWud7ivIiHgtY486l4Fq83B2Lt0Ev1onixUhN4OlO
	7VsnFBok7ewbzjYK26BFHVBRINtrDEOc=
X-Gm-Gg: ASbGncv+xdNZY05tWUoG8ELgAS7OA9ouLY7vHq3EybUbmHdUwnCQTRz4SOtfjuEJXV6
	5VzAVnYjWl6WkJfKt6veCHK/FwZoz25RpACfr0/vag742QnwsaAh3smjrq8CZt03nhdQLa9dhRz
	oaVRgpHeGKiL9Qkyuv88l2MjQkpEufyyxRPBJmjAT1agQ=
X-Google-Smtp-Source: AGHT+IG8n1NOnknKBTekE7vnR1XZkOXx0mEMZtruOLeNGcJGxu3gdqRfXX3Z5Qct26maroyKX+owpGbM/jJPtPBbXcc=
X-Received: by 2002:a17:90a:d603:b0:314:2d38:3e4d with SMTP id
 98e67ed59e1d1-318c9287ef6mr1305213a91.3.1751024494204; Fri, 27 Jun 2025
 04:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250627094102.770689-1-jfalempe@redhat.com> <CAH5fLgimktQmU6d24o3QVDBX90OD5E4wdnvLoNhk_gtpbUhXMA@mail.gmail.com>
In-Reply-To: <CAH5fLgimktQmU6d24o3QVDBX90OD5E4wdnvLoNhk_gtpbUhXMA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Jun 2025 13:41:22 +0200
X-Gm-Features: Ac12FXyNnLJjU7yVipjpDFcYwETTceoP6829PBNtIQGzkhDaRmCtl_5xyFpFqGY
Message-ID: <CANiq72mmX6Bg8WhyMteuv5jnv9QwkfsypReZhTKp_i=bV+5hjA@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: Add a u64 divide by 10 for arm32
To: Alice Ryhl <aliceryhl@google.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Andrei Lalaev <andrey.lalaev@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Paolo Bonzini <pbonzini@redhat.com>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_044135_381481_45737185 
X-CRM114-Status: UNSURE (   9.67  )
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

On Fri, Jun 27, 2025 at 1:37=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> I would get rid of this conditional and declare another div10 function
> that just does input/10 on other arches.

Yeah, please keep `cfg`s as local as possible, i.e. inside the
implementation of the function where possible, so that we share even
the signature etc., e.g.

    https://lore.kernel.org/rust-for-linux/20250625051518.15255-6-boqun.fen=
g@gmail.com/

Cheers,
Miguel


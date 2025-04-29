Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8F9C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 17:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DNabiqJSEcQkh9nBnZEWj0zKXe55hJFmj4xlJbnTaw=; b=W2gSHFZohx0MDo8qTlfV82aTS1
	r/0dwuLq/Mb28+dquOjEapNQCj/j7GSV42CAfXy5dkyUeUOqgDNOorsm+ydRPXHn5Q3bM0JwNBeEz
	kI8+ZJeVBwUddCRBmb1FybxHfY+wY/PI8SeZKUIFDAQdEgMYzKkQQGmmkRng+YUO7Ewi+FjHnukd8
	7407ErawWVlO5284nZsRlRwjVzF+bAUmbxRPHwQYZba7VlHZWIF7tfI0jJMWB3pqp4KrakjPw+b4I
	L9dlpAJp6EH4o7nUoihX1TkT3trCzNUgAXg7InZVajbI+FuTScUp7RObpDy4a/OBwjh3xTf6kHKVT
	tHY8SMqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oKb-0000000ALRo-1EXq;
	Tue, 29 Apr 2025 17:01:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mjf-0000000A6Ld-3IvI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 15:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745939941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+DNabiqJSEcQkh9nBnZEWj0zKXe55hJFmj4xlJbnTaw=;
	b=TubSnbXhVHdM99EOvgTLPIBuZnH3cu20nNTAMzaqh+hIiltFNLB7wdB29J1IrmXp2gFdFp
	qZL4DaBZ9YcgF0SPmgYHhGqA7Yw//I+B6ZSPaoTMlAt9jdn+eP2F8R2bnbMng45FuU45jX
	I+pzQZtzsReNYi5TayjCiekl9ccajXk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-NO_YkJJUPliVMMiIGx9g7g-1; Tue, 29 Apr 2025 11:17:24 -0400
X-MC-Unique: NO_YkJJUPliVMMiIGx9g7g-1
X-Mimecast-MFC-AGG-ID: NO_YkJJUPliVMMiIGx9g7g_1745939843
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39ee54d5a00so2061900f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 08:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745939843; x=1746544643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DNabiqJSEcQkh9nBnZEWj0zKXe55hJFmj4xlJbnTaw=;
        b=KMXI7P2dIoVhMD8XyKeV5oPUNzHfzWKKBh5s3Ld0sqa54iHD5smROfZbX1PkH9vqIt
         mmHZlvNbMCaG4WYye7cSL+4jsHIQu7PBtjFkmvoqSrIZSldCGk/lpco6Wf8rfeFXmTII
         uICbDor0khRzzG/q6Ycz5o9zmEbzwDGaljlIX7McwOOHHZugQgSOMV5N1j889/8UBofr
         zMbT8F6xG3kk1KH4KyyUILUmMkv13iPDd20R2P7yIXNKfB3sFhX9HQyGDSLUxtHFQYJI
         jzI3is7XdcS6Rg3XFfcr7I8VjX0cz3xC5jO84sLZQ/iGLi0itWVwDBSmOTLoWaZHK6Vm
         vq2g==
X-Forwarded-Encrypted: i=1; AJvYcCUxPaZeWUXShkUNkw/Dp2TMuVZ8dvwbGPU4jzUAae7jcxQo1xRqndzZNJ1cSlt17eAZWE2TXcMCbjYXq0sD2znZ@lists.infradead.org
X-Gm-Message-State: AOJu0YynYAQvSgfbKKHqI/LS58/aaZtMwCZAf0f/s7TdWfQ9NYRkVinD
	wt655zVJYs9npf7v2peKqzU4YmGp5XPrWNl2u8570TZy+9gkPLVvUORDOZzTs8riAqXWsukJLef
	0Oq5ijN5XPbUEQJXgoxwDbFWMswLA2ET9LE+qL7hMrX34al9FenO6dtPAWUquU1kTy4wVLdocJ2
	bG3TbjwZ5YOkLIIG6Nshf8SfIsnHH8Mdc8JjhLqZrO2rGg4V8=
X-Gm-Gg: ASbGncu9bQBNZdoeOGM7vvn2DJ+p3AaOkDYZ4/9UdwmsIqgkWzYmghJ4092fdAEcT0z
	SmRufQE+Tp7ykDCsEVfbRukdXHMsEzuArXqPdT4oT4X8Y4GHG/Fj2bmLcnXbsTYY+UdA=
X-Received: by 2002:a5d:5f82:0:b0:39e:f9d8:e016 with SMTP id ffacd0b85a97d-3a08ad775e6mr2599202f8f.44.1745939843441;
        Tue, 29 Apr 2025 08:17:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVx/tpgOJ/jJ7aMny2+Jz5FC/6rqMEhTN31tII+xhKzH6NF09234DlTjodrjGY6d6Z3aQUBGd+/q980+qErAE=
X-Received: by 2002:a5d:5f82:0:b0:39e:f9d8:e016 with SMTP id
 ffacd0b85a97d-3a08ad775e6mr2599166f8f.44.1745939843017; Tue, 29 Apr 2025
 08:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250429-vdso-absolute-reloc-v1-0-987a0afd10b5@linutronix.de> <20250429-vdso-absolute-reloc-v1-2-987a0afd10b5@linutronix.de>
In-Reply-To: <20250429-vdso-absolute-reloc-v1-2-987a0afd10b5@linutronix.de>
From: Jan Stancek <jstancek@redhat.com>
Date: Tue, 29 Apr 2025 17:17:06 +0200
X-Gm-Features: ATxdqUEmCiOac4IJ7RKz2Dhq5OnDaOX2ymoBqKbKJma3cfUvvvKhrZqkCZgsg84
Message-ID: <CAASaF6yGT0pDythQ9nTcn5=MHmLYD=gCNVc6dFXhWUO_iXJXqA@mail.gmail.com>
Subject: Re: [PATCH 2/2] vdso: Reject absolute relocations during build
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nam Cao <namcao@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S8kcIsBxUC4cFchfU8dv2zjnzTVpqrAWG7FLT23ctO0_1745939843
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_081903_895379_81A41139 
X-CRM114-Status: GOOD (  19.91  )
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

On Tue, Apr 29, 2025 at 2:56=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> All vDSO code needs to be completely position independent.
> Symbol references are marked as hidden so the compiler is forced to emit
> PC-relative relocations.
> If the compiler does however emit an absolute relocation this will be
> resolved by the linker and break at runtime.
>
> Introduce a build-time check for absolute relocations.
> The check is done on the object files as the relocations will not exist
> anymore in the final DSO. As there is no extension point for the
> compilation of each object file perform the validation in vdso_check.
>
> Link: https://lore.kernel.org/lkml/aApGPAoctq_eoE2g@t14ultra/
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  lib/vdso/Makefile.include | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
> index cedbf15f80874d4bb27c097244bc5b11272f261c..18fcc94e4d6bf7abf374c7a95=
3349e7ad75f8a18 100644
> --- a/lib/vdso/Makefile.include
> +++ b/lib/vdso/Makefile.include
> @@ -12,7 +12,12 @@ c-getrandom-$(CONFIG_VDSO_GETRANDOM) :=3D $(addprefix =
$(GENERIC_VDSO_DIR), getrand
>  #
>  # As a workaround for some GNU ld ports which produce unneeded R_*_NONE
>  # dynamic relocations, ignore R_*_NONE.
> +#
> +# Also validate that no absolute relocations are present in the object f=
iles themselves.
>  quiet_cmd_vdso_check =3D VDSOCHK $@
>        cmd_vdso_check =3D if $(READELF) -rW $@ | grep -v _NONE | grep -q =
" R_\w*_"; \
>                        then (echo >&2 "$@: dynamic relocations are not su=
pported"; \
> +                            rm -f $@; /bin/false); fi && \
> +                      if $(READELF) -rW $(filter %.o, $(real-prereqs)) |=
 grep -q " R_\w*_ABS"; \
> +                      then (echo >&2 "$@: absolute relocations are not s=
upported"; \
>                              rm -f $@; /bin/false); fi

Should this check only some sections? I'm getting lot of matches on
debuginfo related sections:

# readelf -rW arch/arm64/kernel/vdso/vgettimeofday.o | awk
'/section.*debug/ {count=3D10} count {print; count--}'
Relocation section '.rela.debug_info' at offset 0x4fc8 contains 524 entries=
:
    Offset             Info             Type               Symbol's
Value  Symbol's Name + Addend
0000000000000008  0000000a00000102 R_AARCH64_ABS32
0000000000000000 .debug_abbrev + 0
000000000000000d  0000000f00000102 R_AARCH64_ABS32
0000000000000000 .debug_str + 3b3
0000000000000012  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + 0
0000000000000016  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + 27
000000000000001a  0000000200000101 R_AARCH64_ABS64
0000000000000000 .text + 0
000000000000002a  0000000e00000102 R_AARCH64_ABS32
0000000000000000 .debug_line + 0
0000000000000031  0000000f00000102 R_AARCH64_ABS32
0000000000000000 .debug_str + 2d5
0000000000000038  0000000f00000102 R_AARCH64_ABS32
0000000000000000 .debug_str + 7f0
Relocation section '.rela.debug_loclists' at offset 0x80e8 contains 3 entri=
es:
    Offset             Info             Type               Symbol's
Value  Symbol's Name + Addend
0000000000000504  0000000900000102 R_AARCH64_ABS32
0000000000000000 .debug_info + ab8
0000000000000b3a  0000000900000102 R_AARCH64_ABS32
0000000000000000 .debug_info + 1111
0000000000000bc5  0000000900000102 R_AARCH64_ABS32
0000000000000000 .debug_info + 143e

Relocation section '.rela.debug_aranges' at offset 0x8130 contains 2 entrie=
s:
    Offset             Info             Type               Symbol's
Value  Symbol's Name + Addend
0000000000000006  0000000900000102 R_AARCH64_ABS32
0000000000000000 .debug_info + 0
0000000000000010  0000000200000101 R_AARCH64_ABS64
0000000000000000 .text + 0

Relocation section '.rela.debug_line' at offset 0x8160 contains 27 entries:
    Offset             Info             Type               Symbol's
Value  Symbol's Name + Addend
0000000000000022  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + 38
0000000000000026  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + 49
000000000000002a  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + 60
000000000000002e  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + 7a
0000000000000032  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + 98
0000000000000036  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + a7
000000000000003a  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + c2
000000000000003e  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + d8

Regards,
Jan



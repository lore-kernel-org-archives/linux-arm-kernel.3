Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8FBC02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 10:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MH62dPG8Qx2NOdEQyz+qopTma+UfkmuG4FC6VlOsB4M=; b=MCoXQQMiq9jvPdf+BPNGvDxt18
	YVZPZ0It5hwON99kTs5+XvJbWGp7ig7w+U0KQRU7QdxjwD+1UwwMZKi3AHskbCS8z7FsE8U6fAVwS
	YfiRzTqxDfrr0D6l78Zrf985YCmOcOdoXnfSGeBKMVOjQbiDZ2FjQ2+HapuQUoIEktkGo/awmfKbK
	2+vhEL74aEevyyU76rXXmf4ZThRYnj3Wsmxf8iHHQnq/plCSwqJwzU72I3rp0ESIlaAi4EuUkeeZi
	soh0rMQfbwO3wuPYDT+JF04VqqWgD5vLkijrH+upIFatkPQGsjZyTX0Qk1RHoCROyDGsRxL5gZWMP
	52Kgr86A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th4w9-0000000EbOa-11qI;
	Sun, 09 Feb 2025 10:53:17 +0000
Received: from mail-ed1-f44.google.com ([209.85.208.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th4ti-0000000EaOx-0c8R
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 10:50:47 +0000
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5de51a735acso3456487a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 02:50:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739098244; x=1739703044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MH62dPG8Qx2NOdEQyz+qopTma+UfkmuG4FC6VlOsB4M=;
        b=L8Ja1GnDTCyKups8dUTG2cdvl0ZUdE2/x9zFPCkKZwFvOfi3Rt9MMMfeeGVHvm5jKY
         r5nQhCllQpvedNFEZZtrl8fG4e1OfaDOdqsoie5OacKLK1cZP8i6wG2eQ13Fgl3XOmd4
         fVYvajnaBzY/1rHQDlAj7sgsxpaT4tC+g2Juq1mdQZjdYFnFljtiHoPlZyaOEqhNWXQ1
         YWuT9j7qt3wW91rO30Sx8yVYR/VDuZOJaGQukQolXdM57foKhFdArgu2Y08N/i3bWf8r
         jB+lZlJK8iM6euQHMe7eWdHhtGfaleY0jSikDpNfSuuv0D6SG6md1VwWJFXzr+nhHE6p
         2cFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6wTstYDXJh/TS7RM0iy22eslPHU17k4f069o6f8XwIF8Ey0xaLVeKsV0VsQWI/r0lNFOw2IzisID5k3hBWdbX@lists.infradead.org
X-Gm-Message-State: AOJu0YzVMLTYIiJEYIH9qlxd1b2o8oh4uWDmIGl3OLwBwqoy/zh+ci5v
	XDLgqkIuWejI18DuXespVnvGO+YWzO7bz8zd4EfvV5s+gn8nLizecycS5FCNmhI=
X-Gm-Gg: ASbGncsMppCFzjLGng+FT/dV6oJg1So0QzE8HpQb0VrWcl+rQ92UBT/tGV85xuiXim4
	Mp1Py8oGpFCgMm6MGeXmtO2W1M/YwFLtSYkvJi8B2or86JpNrmRBRMogjhI0ZaiURHwaWfDjPKJ
	svu6XZuQzvbJmd6gWAeJOq2ijSIXQdq008x0YiwmPbK+XeNFG4NUqBah3AfmV0vZEzsL5tx03AR
	eCHVeodDzDkIHu9bLDevVf0Nbpjwcx7PJaP3WiUwtoInRlphxqMjXeHqeU8XmjLkMDo10ZQRqHQ
	ARZhey+N1slZloItBgSu7hOuXO3Zy2qfPmME/YydJnh60g==
X-Google-Smtp-Source: AGHT+IHD+/N7DpoHbuAfv17VIO2WWEsDXqvl+/Q/Jrsh8SVIxfDoSa8e+dHYVfLe62MfVbDvwCJE3A==
X-Received: by 2002:a05:6402:5290:b0:5d0:81dc:f20e with SMTP id 4fb4d7f45d1cf-5de45029631mr10545591a12.17.1739098243392;
        Sun, 09 Feb 2025 02:50:43 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de3f04ae59sm4900127a12.1.2025.02.09.02.50.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 02:50:42 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5de3c29e9b3so4592164a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 02:50:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVcNrO/ujam3EttPId2sbp+I2g3efLbVtUobFA0/xvMp21w67dZtuuPfqVxrn5/w8CaNTzEmS2JAey9ltY7uqHI@lists.infradead.org
X-Received: by 2002:a05:6402:a01c:b0:5dc:72e1:63ee with SMTP id
 4fb4d7f45d1cf-5de44feb981mr12484432a12.6.1739098242289; Sun, 09 Feb 2025
 02:50:42 -0800 (PST)
MIME-Version: 1.0
References: <20250208-maint-soc-apple-v1-1-a7f7337baec0@jannau.net>
In-Reply-To: <20250208-maint-soc-apple-v1-1-a7f7337baec0@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 9 Feb 2025 05:50:05 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9jsvunbpVm9GsQ_wpFUgKyH247AZDmV+p6_=1ZkGvFLQ@mail.gmail.com>
X-Gm-Features: AWEUYZkzBEpN98q4APsDMBtXemAu5dO3ythzUVqUMjRkDuNKl2rdcSvtKwaJNsM
Message-ID: <CAEg-Je9jsvunbpVm9GsQ_wpFUgKyH247AZDmV+p6_=1ZkGvFLQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: arm: apple: Add myself as maintainer
To: Janne Grunau <j@jannau.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	soc@lists.linux.dev, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_025046_208035_0E24ACC3 
X-CRM114-Status: GOOD (  17.78  )
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

On Sat, Feb 8, 2025 at 4:22=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> Sven and I have agreed to share the maintainership for the ARM/APPLE
> platform after Marcan's step down. I'm handling the downstream Asahi
> Linux tree since April 2024 and worked on or wrote several drivers for
> the platform.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f2594c2300f9b054a6d57ce069120df0bb451d88..9987cbc4d14b2d2be43f25968=
8c7791ecfd10423 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2210,6 +2210,7 @@ F:        sound/soc/codecs/ssm3515.c
>
>  ARM/APPLE MACHINE SUPPORT
>  M:     Sven Peter <sven@svenpeter.dev>
> +M:     Janne Grunau <j@jannau.net>
>  R:     Alyssa Rosenzweig <alyssa@rosenzweig.io>
>  L:     asahi@lists.linux.dev
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
>
> ---
> base-commit: 7635a78a95dc3bff39e9c49b34108f81a9bb62db
> change-id: 20250208-maint-soc-apple-8d2498e75509
>
> Best regards,
> --
> Janne Grunau <j@jannau.net>
>
>

I've been engaging with Janne regularly for the past year and a half
as part of the Fedora Asahi Remix kernel work with good success, so
I'm happy to see this for the upstream mainline tree.

Acked-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!


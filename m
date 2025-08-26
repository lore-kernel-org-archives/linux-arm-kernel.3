Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0475FCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 21:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlR2W8sGPsNFxVXAPLkKkhjl01WcoRvDHaUyBoigeGE=; b=xoXy+dsS4K2J3H8Jmwkm45QQaT
	iS98xUNVxRZg2KGU1Z3pZFWDPsT4kd/obuYX4qnsAVhed/pdHjBrDd6oybKHQYc0dV/bge7PS4FDU
	23IRzD6+0wyJ++bUlhXy1iuSjeHnQGmjVxm42PrRAjidn47e1BnTJL3bxi0kMX//lKOMGOxFgZVuU
	JZfPI23KcXRUeY7TGs0grNiG6bWPsxPbse/SOSM2uXR0ASLL7ccBB/ZPfKBVmTZsIbW5ffo+ajlQB
	8Il+C6eecrGsXERHINmJ0kWvVDVQkdgKq+NS2MIIyh4vrUe4Xa9/5J/tC4GLR+FIsey4V9Acivrjw
	h2MlFYJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur1aE-0000000DDJx-11GL;
	Tue, 26 Aug 2025 21:52:02 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur1Ur-0000000DCml-3Foc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 21:46:31 +0000
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so822399366b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 14:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756244787; x=1756849587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlR2W8sGPsNFxVXAPLkKkhjl01WcoRvDHaUyBoigeGE=;
        b=Z0hKEp7vHfRtqODNY8McLaSv3qj8VqFdXd5QIlH3T8aG4AxYpix9xxjXPzcBJ6Tc9f
         vgZyLw1KyXQbyLsXPFLlxW7c+9lgGwdBneSb9R8XZmyCB+VNjaXDwwUet+IlMvS/q5su
         azJ+wlcGRqE5bMiZUjMo/iVvV/vLOOQ2d2hUIUQSlMQgWHDOL49fsJm3tvR9eIs4QN8n
         wNLFYoc5kEUQgc+Kxy9JAmYVZ/k+u4YofcgJPOn15+w0ADlF8g4Zos/MlUY52pUgVvat
         9NvtSN84x+Vxmxw6ERrW8IfQTEnJZVP3WKfom45U+aS4na2q8Uw4fvPZgjn+U+kFyLOg
         XhyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2apG2EJYKJhvDnbiS6cItla7NMl0IcWjfoSq4BVpdaDkI54TpC72Fk4lyvQ+H7OlB2j7qYeNZjdrkTqm88MDt@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq39maLXn1D+oRMCsyvCBxRV1VrD5aZBf6kDQbKHAIv9MxpEX/
	fp/7DCXDqqeXa0TcPUibegI02WeaiMHAiS1dKFK5drTG6g6zBJaL3ECXfIXdtz2x
X-Gm-Gg: ASbGnct3yoTjJACvn7xkovw0KlGe9bdAdugb/ufMeCR5+oKYKg5we1hERFbcez7Eg+D
	SSLa/EucqeOgwgzyda2en6QWon7KAAabI4KcT2Y5tnmRMkwUoFwuUPcXtMkFTM73zyYVGzXucCw
	9eZBeh0IrNiGOnEzxz8O+7UzDb6WuqbIzLit0XIHsM2371uR8w/LJS1cgJjDhPJN/0ifRfPctsW
	wIMF0oQIjiYEM2V7IrfU+7NRkE3KvE1aUXakBBDD2mQzkoOb4hA5FmQKTV0zopDRs2kf3/QZUtV
	SSIraiL1I04Oovl01382Ch0VdAi2uMjJtJyhvMJ/LOvBeFAn6ZkxnynI99669ZGSRIDwaFkOTan
	ScikoWmNjw5yU8X4M+LPTB2+79XZ3UvOva2qVSwMr8D10r+HSlaGyFBEHiynstes9GZHXDhkhIL
	vBHjoOAKK2
X-Google-Smtp-Source: AGHT+IFrWGUzZ70gWni6yVPxtLDL7yqz1ovikHhuHSVIj7AIFNeGM5fo6FVH00lBn7mcxEEacemsXQ==
X-Received: by 2002:a17:907:968a:b0:afe:6000:14cb with SMTP id a640c23a62f3a-afe60001858mr1094866766b.45.1756244787091;
        Tue, 26 Aug 2025 14:46:27 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c3172e21dsm7605990a12.40.2025.08.26.14.46.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 14:46:26 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61c4f73cfa0so5366855a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 14:46:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXKTQCyGL/obF145utMhk7zyHc+SUT+BkFjRlX8UeWyPxNbqRGbUyxXYmvVqInCFxjCYdQxXTbzJ+YpMrDTupMr@lists.infradead.org
X-Received: by 2002:a05:6402:34d2:b0:61c:979a:e7a1 with SMTP id
 4fb4d7f45d1cf-61c979ae911mr2475028a12.16.1756244786336; Tue, 26 Aug 2025
 14:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250826-dart-t8110-stream-error-v1-1-e33395112014@jannau.net>
In-Reply-To: <20250826-dart-t8110-stream-error-v1-1-e33395112014@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 26 Aug 2025 17:45:48 -0400
X-Gmail-Original-Message-ID: <CAEg-Je8F_n9J5aBsTBm6RgAL9DdXKTgyMNxDo_aPOR42GzGUkA@mail.gmail.com>
X-Gm-Features: Ac12FXwA-HRfgwtoditQ_gzG_vHw6fQHNUVW4nCA0dkeveZIhrlsxxZOpuqsYBc
Message-ID: <CAEg-Je8F_n9J5aBsTBm6RgAL9DdXKTgyMNxDo_aPOR42GzGUkA@mail.gmail.com>
Subject: Re: [PATCH] iommu/apple-dart: Clear stream error indicator bits for
 T8110 DARTs
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_144629_816366_6358BF4F 
X-CRM114-Status: GOOD (  16.69  )
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

On Tue, Aug 26, 2025 at 6:57=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> From: Hector Martin <marcan@marcan.st>
>
> These registers exist and at least on the t602x variant the IRQ only
> clears when theses are cleared.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> I've overlooked this change for the 4 level page table / t6020 support
> series [1]. There are no dependencies to series so this can go in on its
> own.
>
> Janne
>
> 1: https://lore.kernel.org/asahi/20250821-apple-dart-4levels-v2-0-e39af79=
daa37@jannau.net/
> ---
>  drivers/iommu/apple-dart.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> index 190f28d76615159527649cd288df395a50d950ef..8b1272b7bb44a1ebc03ca4ddf=
3be43a1e42c97ed 100644
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
> @@ -122,6 +122,8 @@
>  #define DART_T8110_ERROR_ADDR_LO 0x170
>  #define DART_T8110_ERROR_ADDR_HI 0x174
>
> +#define DART_T8110_ERROR_STREAMS 0x1c0
> +
>  #define DART_T8110_PROTECT 0x200
>  #define DART_T8110_UNPROTECT 0x204
>  #define DART_T8110_PROTECT_LOCK 0x208
> @@ -1077,6 +1079,9 @@ static irqreturn_t apple_dart_t8110_irq(int irq, vo=
id *dev)
>                 error, stream_idx, error_code, fault_name, addr);
>
>         writel(error, dart->regs + DART_T8110_ERROR);
> +       for (int i =3D 0; i < BITS_TO_U32(dart->num_streams); i++)
> +               writel(U32_MAX, dart->regs + DART_T8110_ERROR_STREAMS + 4=
 * i);
> +
>         return IRQ_HANDLED;
>  }
>
>
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250826-dart-t8110-stream-error-1c2bbbf4fb63
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!


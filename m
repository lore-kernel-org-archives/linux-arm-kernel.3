Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1B3CF5365
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 12:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqbz9ghi25MyNM796HfNIo/wGiHciMSp9xBKYdZMdzs=; b=RF+qxhsCIvdS2ds6s/wHaw0ml6
	4GCsqUffyfIThEd7UW0lLbqykn6ARu+cxzF2SFuDPRYoJ4BwlYebdiJYyuONh+Bm/XwzTP60Q4wD3
	JrSCwRsmLM2CALAdR0KOua9M9dj4//0qWxw5v2EuNg6o2ZHPk4sNetuNbM41QbC4SXZY7Ydn9k84o
	AmfMG2nqjxlXF7lr8YFyO0ZJ3cOwV89QVYAVaSIxaD8qVeDNe7xc2AhTMsX42CHyCugbLvTsmPQ7v
	5+a+eZWqBazEyPuQ94NX8JdgPsgMMOgpkCS4PiWes7UKLQzsi3vvfSKmU9vR28/02PAOpuHzSmHs+
	0PB/Om+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3aLQ-0000000EINE-12aN;
	Wed, 23 Oct 2024 12:20:08 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3a2u-0000000EFVt-3beg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 12:01:05 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53b1fbb8be5so181903e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 05:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729684858; x=1730289658; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqbz9ghi25MyNM796HfNIo/wGiHciMSp9xBKYdZMdzs=;
        b=qzIR22GM7k+O8hOzrji+sRxnCij1RJ9hnvPHHm9f0c13rd2MC8/XJbAa5ZVLLVIerK
         IdZyOhCKktRv0kVj5OUaB0RuCGmYhgULzTrO9XMWxMSvgQcHtNrG78CVVlT46EqMQTuj
         yQlphXhoY9yE8v26IF8PUkEB1WR+XvK8SrwGUmjqS1kgmBAI17SDuS0P/Jnp7rIDExPS
         bbTMsUeyYAZtqOW7YW1H3b3ys/3EWnn2/covhgSD5D634idEv43LFxWrQgJgqnJ1pUJ2
         occds5RJ4cUkCd1z87XCHHwJvQSg0n+bT1VQUzb8muoNvBXA8gNkpS+mdbJ/Oq2tfMjN
         cY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729684858; x=1730289658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqbz9ghi25MyNM796HfNIo/wGiHciMSp9xBKYdZMdzs=;
        b=pqH1rTiibaAKjYG5Z74lHtBlpPG8BGAywTu2WTiHZpgeN8NpD1ex/VNk2jnzQTqFUL
         rS1qiAHqOVFODIqO/0LOS7FmoI5Ay00w1AZd8VKBuc4eNNtQjGFXbjHxwx7GYKw/P6et
         VkHaDXrHQnMJsvu6VM8EGY406+fcG+PT4S462Oez+SeGnvKmkNCvxDe70KJX0VzzFhqV
         RQr6r7Fy5DWcPo+7Mz0tuCH5ClBkHWWuAxrxnfEh30C8s3yllAvI4t8/cW9ktB/kvw4J
         QjljlY2sUvZkpN7xVb1FIWitROqS6wdbA0Z0KJ/++wiP1vsbys6ckwTqsEYybWTkOojL
         wqKg==
X-Forwarded-Encrypted: i=1; AJvYcCV/uZE7g3X/YHjtpiQwrX2wuMdfEB+CZHhdF8sJKdHuKFoednxUM3XvhB2i4cjNryhUXPAUjeLvOdh1bdTJEqN5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8BMAv1aa8AQvckvUxiuhz3/ztI4EOIgzmXhfo9Rh/aXBGA/YY
	9sYmk7H3C99A87dea3rl15O8o4rVhC04r0FQRKjxR3agc9rHMwAAjhUI6Q4aF6Xj1V2ni0Ufl/y
	MvlNkqhM55OXqFGgpkxZ8j6bujHgK+vu83wJy8w==
X-Google-Smtp-Source: AGHT+IE/UAzMY7V3eb5pkqaftwZ38vfA7061nJlGo03pDJqYCoLAKz73v+E375hMTpCsOw6OHL/EGlBNyYbkCpt8l/c=
X-Received: by 2002:a05:6512:3992:b0:539:f1d2:725b with SMTP id
 2adb3069b0e04-53b19c41fbamr866738e87.4.1729684857664; Wed, 23 Oct 2024
 05:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241021-arm-kasan-vmalloc-crash-v4-0-837d1294344f@linaro.org>
In-Reply-To: <20241021-arm-kasan-vmalloc-crash-v4-0-837d1294344f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Oct 2024 14:00:45 +0200
Message-ID: <CACRpkdZfbjorFjZ9P7ifYO4mVa7eVdviyqO8+KjJXW3bhOq7aA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Fix KASAN crash when using KASAN_VMALLOC
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>, Russell King <linux@armlinux.org.uk>, 
	Melon Liu <melon1335@163.com>, Kees Cook <kees@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark Brown <broonie@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_050100_924357_3C72620C 
X-CRM114-Status: GOOD (  15.87  )
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

On Mon, Oct 21, 2024 at 3:03=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:

> This problem reported by Clement LE GOFFIC manifest when
> using CONFIG_KASAN_IN_VMALLOC and VMAP_STACK:
> https://lore.kernel.org/linux-arm-kernel/a1a1d062-f3a2-4d05-9836-3b098de9=
db6d@foss.st.com/
>
> After some analysis it seems we are missing to sync the
> VMALLOC shadow memory in top level PGD to all CPUs.
>
> Add some code to perform this sync, and the bug appears
> to go away.
>
> As suggested by Ard, also perform a dummy read from the
> shadow memory of the new VMAP_STACK in the low level
> assembly.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

As these are regressions that need to go in as fixes I'm putting
them into Russell's patch tracker now.

The 9427/1 patch:
https://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=3D9427/1

Need to be avoided as it causes build regressions. Patch 1/3
supersedes it.

Yours,
Linus Walleij


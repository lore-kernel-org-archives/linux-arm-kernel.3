Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15918E937E6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 13:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDdA9vu4Fz00bgurrj0mXlyC2hJ8rRfiuCUxuR8xwe8=; b=F2feJgSSdHCYG0NLaNzELdSymi
	ZPTWzGe5ZzGkwXVXZB0QdvnsIY9YZDMrBDMhWKfJLXbwopEUQxmWftkM3tv6+z9JIPNXc9Lhj7CpI
	xgCIyJVWrk/JPYFvYBvr8bmhNv8RK4Bg3ZfvjQwcoai+ksfqdCYOln7o4dCIhqHyuxZF+w9bgf4XR
	9byOWLTKtZWk6eoncg170T1y9hyOM7YFaizlRWik3ydDpiUi8SRq+h+8l+Hm9DnkAao7iswUpJlNw
	smMwIx/xxTkyfspMcRXRK1LFfIkZGt9Z9Fh+94BgYe4Koeu609mDrrWlKyjJWTkPa0glG5GU3exqe
	KDfFNTfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBumK-0000000EKfB-3kY3;
	Sun, 12 Apr 2026 13:23:08 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBumH-0000000EKe0-3B8B
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 13:23:06 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6717ead1d6aso229990a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 06:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776000183; cv=none;
        d=google.com; s=arc-20240605;
        b=NbqDU3tRvv23fQsbeha0HdQTGKYQnIUpb6ML3erHuPYiw/1nzXzB8ONPW0xLnEhnFR
         VPNUHx68Qcge+syphVSfVDyErN3eBKZQzk8v2LjHVtrHopCY5RBczBUZQqzyj0CSICzO
         3ryZ9I9Rz9I3YhxXxsg9unYDSPvBgUi67JHhmD22iLuWfmE9Pk3u6kttWMclnua9NRam
         d3vRE/W/zLyfvadPdWuEnmkC4qhze5TwCPywPlaJx1mon7Y6wU6OSl/abyxN7BxUINbg
         wTFzE4Lsrn4QBu9QjID1M3CYRsfqU8ZnqbsG6GPFe6Ay/mGB0ws7E46XVMrtCf5Xc4/c
         jiEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gDdA9vu4Fz00bgurrj0mXlyC2hJ8rRfiuCUxuR8xwe8=;
        fh=dZYKzoLX9qdw+WDhu2+WEW0auW21g5VwifhC9TgTDms=;
        b=iepHZpZHKOjsJFJF8I3MsvtIZbo1dLoO46qv6mA137DqePk8M1SajH4ZS4e1kdmnlS
         WSXJJKXTH0oWBd6/Vkc4J7pimSVztMBsezTh4TRBcK0jMP3VZvE5aEB1TjJocypwu/Fk
         QnVCL6FwUTGG9pstwU5IJbFRR/39hmy0IyUSZdbYZgGUTXG9uT1MCZqtkwqyGSfie9mq
         56urP7+8xNtTn7JJ1TJNqt23iHul7xhkJ0q3dRLIyWy3Vlabm0xGRpVk7goIHLcy903a
         p12DAsiu8Y8Mj5KS/rmBYPvq5q7wSQlQimjSx0a2HEHdTC56fbMJcbbCgCqITY6RxBnh
         cOYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776000183; x=1776604983; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDdA9vu4Fz00bgurrj0mXlyC2hJ8rRfiuCUxuR8xwe8=;
        b=MqZTbFfViRV0axOduEEit0jAawpY/Wj3Y0jCA65x9Efzn0e5Rczc8IHlNpnqbF3TRH
         uJ2WhJq1dN1ShnqrxFtpFpHX6FVqZ0F88GdtMCUdloV4SmabvIM79hc4rdM2vKI9LMy5
         W2GJcgpQ9nKurXrGIBGYv2QQAdrtXW3XkevbSJxsG8kCnXht6QkGnKXk1dqmMcHeXOnA
         sln7xBzCdca1FnXgVBTmZ8pl8wTGoObr6CYYrxXXy9ClQ7suzqW+CJdi6WejAlR2TK85
         b22Qsb/Nh7MDQ9kQK9T8o1dwyJaERqEBw5S67rahMD66dHk9rKvwf/ca5S+cTZM+xjoi
         Rh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776000183; x=1776604983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gDdA9vu4Fz00bgurrj0mXlyC2hJ8rRfiuCUxuR8xwe8=;
        b=hZ2U6lpCP5VUwz9neXCn3Kr2Ucbpb+R4fdSHVYALxZXlupVaq2xjAhgn0em2KuorR8
         qgxBXropgxBesus5uTKxwNtlnTq6aQFR0N8zy8jAxOm2wxdxXv9CLYt1TGoDFnvvQATd
         yBQ5T2YRlnevb8rBrQ6FE3yWsAO+Zlzmd9WdCS6MqMs1mo1sCDgCo5jaWYBUjUUglFgV
         Mtws21ni4SiVGkcxehc3lf6hAMe6/novKt32i64EaO7AKju8F6PJTXz/fRr/Sge/X3lS
         1vLmKdT6Uzx/y+39y6mGYtmGwTk/RCSXtEaonnym/APgSGq/1JWXWZl0jugCLNsyTm9A
         4SpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/YgQZwbjq3/g07eUbdr1bYC6nBhYsHYw4rmHBkTzqkJi69ryXDM3y+Wr2QtaQ+dEIMO3kH+cxJmsNyS9uSffc@lists.infradead.org
X-Gm-Message-State: AOJu0YxR03gytMCXYplZpAaczDB2ACtKtFXvMmGa+Vl/8jtCqsSgd2wT
	alsVH0EGeE3LFeUnxthCfyomybDcr8gkbrBZMEYUdmErFUdj3T3AFT/GS8mNmD0f65QWgns2TQx
	y3kjQdp4LCkbf4VwGsj/4bn+U5hnnbI8=
X-Gm-Gg: AeBDietycf/EDAJOvFeyc7Cyi0j75mfasF4ydF/OENPxLgveF9Kiuxs3IU0Ozv2Yock
	HKhgHRmWwCuasDTYgvVkhvOy5Tf446ufLwPeOBBn3NJD+QqMPHdIep+/Mc9e57EJCHV8bNxBc9Q
	tUVo7E9jvwIGNKc5+9B8Gf09oAGhtqGRg2GfS59cAGGr02V9idFTDKsBb1NehYaahQ7HCPTJXcu
	oO639xWaDD/6roZZ6MSFtQJDH/41EMJFEdpP2zmFtDrqYW2U2AULtlGE+AhlHEmCgh0fdIG5oHw
	yJHAZgCq3t5SJrl6obLssBVO+av21pYndih/j+yZ
X-Received: by 2002:a17:907:e113:b0:b9c:6ef1:ed18 with SMTP id
 a640c23a62f3a-b9d727aa4fdmr352963766b.25.1776000183133; Sun, 12 Apr 2026
 06:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.131582521@kernel.org>
In-Reply-To: <20260410120319.131582521@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 12 Apr 2026 15:22:51 +0200
X-Gm-Features: AQROBzAeMsaeSVePCJ__tEd4f2rWAY6MixXzp_fii2b8vyUpLt4xjSbtYzENFaw
Message-ID: <CA+=Fv5S68wZQapeaYTspOfsuGk=nBj60sx-ojHBSqrxV59Q+ZA@mail.gmail.com>
Subject: Re: [patch 23/38] alpha: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, 
	iommu@lists.linux.dev, Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_062305_816274_FDEBC574 
X-CRM114-Status: GOOD (  14.86  )
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

On Fri, Apr 10, 2026 at 2:36=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> The only remaining usage of get_cycles() is to provide
> random_get_entropy().
>
> Switch alpha over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY
> and providing random_get_entropy() in asm/random.h.
>
> Remove asm/timex.h as it has no functionality anymore.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: linux-alpha@vger.kernel.org
> ---
>  arch/alpha/Kconfig              |    1 +
>  arch/alpha/include/asm/random.h |   14 ++++++++++++++
>  arch/alpha/include/asm/timex.h  |   26 --------------------------
>  3 files changed, 15 insertions(+), 26 deletions(-)

Hi,

The Alpha side looks fine to me.

I've applied this patch on top of v7.0-rc7, built a kernel successfully,
boot-tested it on an Alpha UP2000+ (SMP) without issues.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>


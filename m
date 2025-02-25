Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26498C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 04:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZFgfWVq3JrlH4OafkiYcHz4ovfUUtYZmFSfUfUeiJI=; b=BOE91bK+26/jv7uh68PoYK4enV
	J/IAuV/XeKa+l+hiqK3atTCsxpPwCTkTpB8frs9gatZfHPWeYahC1h1+jJ0a8UE/M58olCeq6RMgh
	+2+l81MuTAKloiES3glLJHphFuX5Nf1167siHeSrRREElumHAAzCpV5fF+KHIC/B7JtgXvqaftrOo
	6af+kwcTFInDTAV66Yye0HsMsq9HiTxWsM6k66spvDuYJAEHq8Xq3Rby8Cl7zfwTCrs4qZuFuYYtz
	Ul4YxBW8+YBI8th9lSXS9qSKQ5UECinYCOTALKA+JiR1PaI6bY85a2XKgd6wMzxH4Sd7vAkSSfMP5
	Mmx1PUHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmmsz-0000000FyFj-2DrU;
	Tue, 25 Feb 2025 04:49:37 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmmrT-0000000FyAX-2GCx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 04:48:04 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-220f048c038so98026235ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 20:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740458883; x=1741063683; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZFgfWVq3JrlH4OafkiYcHz4ovfUUtYZmFSfUfUeiJI=;
        b=NcUROyiQPs7lR6MyCHGekhBH4iuUZcKzLXaFW2gQhHA5zTeb7Moh0UIWf64vKla0R1
         TyUHjZYuOC3r7919MiFBrbn0/40bXgYGHIOKDYk4kORsVI1OkTbr+FSD4vYjm7jY4Oux
         /iQ6koBVnBcN6PrYxHpDCCF/KyhfqXK4uuX7Jy7N87FJMMkOG05df0liXIZIrz5P6JRc
         JKoHQffaRdC9+/688UyyQI2N2SWdlt+pjopMFyIMuyrmaNiBwNPt8tixYe5Zdd1Dgk4x
         IDyu82AOvsJ78AhdsmnxNaLfh8f78DAvLfR/zisRdbqOFAh3J7JPcneZaQNXJz/Hn3G3
         cfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740458883; x=1741063683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZFgfWVq3JrlH4OafkiYcHz4ovfUUtYZmFSfUfUeiJI=;
        b=HDD/ca1VYxp+ckheE99ceDAuzMAFAoVKZyArkaNe2cgi6HjiYpgKdlbcFx/3Db2l66
         RMv2lq+Z8uMwEVxOXOpDlW/xgW8pB0+GqmiRspsMeX1k+Nefq/UCnjSSLixCN/Fm/MOu
         gCoDyl9JuC4fav/ezNR6AdU/YtXYW7ZKwWe6mE0fxbQTpDMkKRQJVHPGn/PYwV0+6OeP
         XZ2QWiw2trOfN6vkr4/+WC5Hl+nRk4aH9P38atGu/RvSGDnWCz7m7SdwNV9NmM15vMbP
         l43BpzDJ32OuttJhrqv0pCRCcxfwNpJempZloAuN5U7aOU8oYCYjTxwUn1kAJfVg7reH
         mcLw==
X-Forwarded-Encrypted: i=1; AJvYcCVqx7JDYC5hduN2+Nk1MBFb+72dx6IGmrDA31z3ZP58Sk+WhuhfQ5+LIIovCTHJ7N2jxhedQ8w3srxyd6bbC5+Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj3qJ3XCL4nLSdR1Q+J0OxnQzG5uXoSJ/uK/HdhG96JWW2xT/U
	bWMVWTeeps+lChplYceLBJMWM4kRKvtlKXb+FWg0BL2y7/vH4pwi0Oxazyh8W5yOL1e8HW37zjK
	hwdG41Ywh6P1rbKKj7tv5csTjeooP+F7eMJ1dig==
X-Gm-Gg: ASbGncvdhJHWSy38EFnczaGrXpnZOgfAgZV35xW2tHvYRiPw6GVoqQ2XwePwTWr4naK
	33N31F4pauuX6UZUge9lLTize2z3fpo3Qhj9INBGFpN5ahsU2m4F2/BpcPgStdK1MCyZG/vljiF
	RwWtfheeg=
X-Google-Smtp-Source: AGHT+IGtKRsvMjcl3Jhu2UIJCTw0zZchMAxmZVjqkNQRuFwmh5kGabwMC7qluebfFQT4Cl0trp5EgzVHOC8K2rw5HSQ=
X-Received: by 2002:a17:902:e742:b0:21f:dc3:8901 with SMTP id
 d9443c01a7336-22307e65ab2mr31758665ad.34.1740458882716; Mon, 24 Feb 2025
 20:48:02 -0800 (PST)
MIME-Version: 1.0
References: <20250224062111.66528-1-kpark3469@gmail.com>
In-Reply-To: <20250224062111.66528-1-kpark3469@gmail.com>
From: Keun-O Park <kpark3469@gmail.com>
Date: Tue, 25 Feb 2025 08:47:51 +0400
X-Gm-Features: AWEUYZkEj-Hgod8sidfdA4vrlUHr9QszMINTXEX7_AJcKmskwZM8_U-h9Ec0W5k
Message-ID: <CA+KhAHYujgeC2kAd-vs0N0zwprpeqtD8G-8DpJ0w2RSxzZ5SQw@mail.gmail.com>
Subject: Re: [PATCH] arm64: kaslr: consider parange is bigger than linear_region_size
To: ardb@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, 
	Keuno Park <keun-o.park@katim.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_204803_581992_BF907CD4 
X-CRM114-Status: GOOD (  23.59  )
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

On Mon, Feb 24, 2025 at 10:21=E2=80=AFAM Keun-O Park <kpark3469@gmail.com> =
wrote:
>
> From: Keuno Park <keun-o.park@katim.com>
>
> On systems using 4KB pages and having 39 VA_BITS, linear_region_size
> gets 256GiB space. It was observed that some SoCs such as Qualcomm
> QCM8550 returns 40bits of PA range from MMFR0_EL1. This leads range
> value to have minus as the variable range is s64, so that all the
> calculations for randomizing linear address space are skpped.
> As a result of this, the kernel's linear region is not randomized.
> For this case, this patch sets the range by calculating memblock
> DRAM range to randomize the linear region of kernel.
>
> Change-Id: Ib29e45f44928937881d514fb87b4cac828b5a3f5
> Fixes: 97d6786e0669 ("arm64: mm: account for hotplug memory when randomiz=
ing the linear region")
> Signed-off-by: Keuno Park <keun-o.park@katim.com>
> ---
>  arch/arm64/mm/init.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 9c0b8d9558fc..2ee657e2d60f 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -290,6 +290,11 @@ void __init arm64_memblock_init(void)
>                 s64 range =3D linear_region_size -
>                             BIT(id_aa64mmfr0_parange_to_phys_shift(parang=
e));
>
> +               if (range < 0) {
> +                       range =3D linear_region_size -
> +                               (memblock_end_of_DRAM() - memblock_start_=
of_DRAM());
> +               }
> +
>                 /*
>                  * If the size of the linear region exceeds, by a suffici=
ent
>                  * margin, the size of the region that the physical memor=
y can
> --
> 2.34.1
>

36bit: linear_region_size=3D0x800000000 32 GB
39bit: linear_region_size=3D0x4000000000 256 GB
42bit: linear_region_size=3D0x20000000000 2048 GB, 2 TB
47bit: linear_region_size=3D0x400000000000 65536 GB, 64 TB
48bit: linear_region_size=3D0x800000000000 131072 GB, 128 TB
52bit: linear_region_size=3D0xf800000000000 4063232 GB, 3968 TB

The problem happens only when linear_region_size is smaller than
BIT(id_aa64mmfr0_parange_to_phys_shift(parange)).
In my case, SoC returns 2 as parange value. (va_bits is 39bit, so the
linear_region_size gets 0x4000000000, 256GB.)
#define ID_AA64MMFR0_PARANGE_40         0x2
BIT(id_aa64mmfr0_parange_to_phys_shift(parange)) =3D=3D 0x10000000000, 1TB

                s64 range =3D linear_region_size -
                            BIT(id_aa64mmfr0_parange_to_phys_shift(parange)=
);
As a result, range gets a negative value. 0xffffff4000000000 in here.
So this makes randomization code bypass as range is smaller than
ARM64_MEMSTART_ALIGN.

                if (memstart_offset_seed > 0 && range >=3D
(s64)ARM64_MEMSTART_ALIGN) {

In most cases, the hotplug memory code will be working the same as before.


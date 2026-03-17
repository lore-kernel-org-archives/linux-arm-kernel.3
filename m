Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6126EFB5EBB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 04:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NEZIoIL+p9WYNIWM8eip/yr8eeRSa2d7nrT0z5B5yM=; b=js8iDtm5HECwmRiZfTRr0fFDBV
	wpO6x8t2hK8drxGTS8zzUTxK/Jkqt8PH4QSJb/MjIeEihowmB8tq34G2IqwsiLSE4oyx+2LjQDlVk
	mrLsv5DSb+exeCTZICF90t2FddsWdVEJ6namKqWghY1EP6jNdmFgdnfJtmTsPA6OmJ7o4K4lQ4yv/
	ZcBSk4aqD6LMSkAtKQaYrqnKwWfjjpXEeAVZZq5Vd97Ix1QtzJeG1hQntBWHZCDVVbrAZpVWcqp0w
	M8xSw6j580h8395y7RnBHqvcSV+z3WMwvXzk2MX/lqIJAJ+PAeiYpPAAPh/dBVcgWWNJM+Hy44enJ
	i/uO6kDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2M7Z-00000005Oro-474a;
	Tue, 17 Mar 2026 04:33:33 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2M7X-00000005Oqd-44Sv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 04:33:33 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-509069a7a7fso342991cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 21:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773722011; cv=none;
        d=google.com; s=arc-20240605;
        b=V4E7V+MtTdznrp6KCmQVzczxYAZFy5SSnwPSZ81sCooDEb2bluU+uivbIdOhkosICi
         pYNobBQNU5KcadbUXwtMiNBcByrgYzElBf4u2sWtf/4AzE9QA147iFAZAVTl5tKHkFti
         ecBGDQH7kc6pssqE0JgvDsjrvOhLabCcrw9j5jeudsu5Z8CBgGn98M7hGuKoNua9pktb
         IjNTm4zMkOISFMydjR13Bw/N9ZVNL/i55MaWNEQ/GAyOeGzpQPhOfW1xiKf5Ru/NVqqk
         HcltFdwXDDKUZtjRVT8rLcR3D5r8AAyv9pe8WmsnhAc4060oJSlqeK6yTMT9tySuSIZC
         WPzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/NEZIoIL+p9WYNIWM8eip/yr8eeRSa2d7nrT0z5B5yM=;
        fh=BiH3LyLvuxcXOqX6iyVxV3scedYVIGnEbUAocTLd84Y=;
        b=IkS5LBK5xCBWHfcouVEW/zyRSa7yloxQF3uXrIkU+V9x/xY1ie+nBM8AahwJ3E8eUI
         9wXNHheMk3K+B/7S5foy0Ve9a86elXFAIqpDIdWYUUNevONfbgAMjBpV3lyDoR9rVSJe
         l/hUnh+lSbZJHL/mZm/EXHMzIqrXSi42UG/71SumLuXSJZRLWhw49Njmx9jr2jwXAQgo
         nl95ThmMvXKGXp7574QZGKxPEgpbQ/uF1dTjiwnbBwfHk74oHRZYZweiNj8i60Z4U6Hs
         Iwdxnb1qE8me0Z4UrF9jUb6nq3n3WlRHgKBytJjFj2wggV7H5Wp53Y0vxHADtV2HqFmH
         osAg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773722011; x=1774326811; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NEZIoIL+p9WYNIWM8eip/yr8eeRSa2d7nrT0z5B5yM=;
        b=IVP0q4RnyZEGTC9qt1wxtsP6tVGTbjcG10IQWUYeuJQQU7uJklLQ87VLgCxJSGyiBm
         Wzs8ml9cBOG8lu3n3nNFCP4jb6/W0HOoJ/GKWd6Hj3MLqsKupDVY4mIFXYDiKdTowEvr
         UkJXieyKW962YMmnGPd8lPnAyVL9OpuJhHvA+VmKAv4riJJwrrSsLoDSvPWopIcO53oD
         qgbIVvfc8pA5S+o1Rxxd9/14UUWTaanKJb93TFNSFXKsj+qwZTc3Vdaol2r5Egy+NO2I
         nSGrYQYd/uouNXSIuLq/WZZVK0Ls/sNBTiJ4urWcgn0ws626Qb3Jrvc6ADMbRWvaxE2i
         J9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773722011; x=1774326811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NEZIoIL+p9WYNIWM8eip/yr8eeRSa2d7nrT0z5B5yM=;
        b=G+8mXyUke8ng1eh+lTJOXAlBGyoMb4vrpuQTb+MrhWQaxb1/JnX3ubw/bKq8Hoj+zs
         yndScqinQY56IQcR0W1w1+yL70QA70BFFNRwPjijVvplCmOGLbRd5YeURfZsuja6XjdU
         i1mIbcstAPwdrsD8PGN/XBifesXreuPgOQ6p3FbFdLcQMXYK179SKanOE3JyoRlv6UES
         JLSPrLKTbVM6lsOhj5zDGZW075CyOm7GCuTR7yjf5B3jJBayMbHn/vNXgqY6LFzr7nBG
         4cqDkyfBG6HB7MOLDStddYMe26S6ZBMgHanYg+gXWwmR43kwRt06h4PaWT0iuUhk8BkJ
         UzLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy2gxY9eC6I/6yzEEfwCkgqtMQnb70MUqiJKRAu1AiwGsmNgVbsx18nD1xNVH6eR4EdBldC196ruHPCh4ODmZf@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8oSzTF2AF4XtQ8AUSkv/Np7ZPdt774EFo0r2fOAhXXVVIWpyw
	RfsvNY0LhCwmdp+ZnveNWibypcXjPdw3gXJJbsGk3vPF4u5YjfA1+PGh1Do0f7peI7k1FWhow4t
	4mcr2ikdn104W1IZd9iaEUJy4jb0NvHpi1yzRojWf
X-Gm-Gg: ATEYQzwAFuoYmGMoQNJuJLEIz5lskCWhpV2SDIbaJo1xV2a+75OhkMMuxEv1obSraNt
	d2bWwaZ4q91mH0wfHshMWi/uXwxofpNHcXuVSMmhhiRTgrK4ZV4GC4v4FFMpQUA9poXNI4v3OgF
	XU0c7ECxaH0xSD4TTC7qavuujAM06Z55abWMhuPkpvjMZYgpYnxFaH3rMC8Nc4MuHN4S6eSijEZ
	Vpay2VUy4YJm5wky2gx+fhaZuKNsyWvvqzNZvJWFWlQwPePSaFIg7JazZCqVPsAav1eBu41i3aH
	u5pRAQ==
X-Received: by 2002:ac8:5844:0:b0:509:cd7:aa18 with SMTP id
 d75a77b69052e-50998d3b42cmr9273521cf.10.1773722010151; Mon, 16 Mar 2026
 21:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <a8debbca3fc7b765937e6b5b76bd9002c66b225b.1773695307.git.ljs@kernel.org>
In-Reply-To: <a8debbca3fc7b765937e6b5b76bd9002c66b225b.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Mar 2026 21:33:19 -0700
X-Gm-Features: AaiRm50Qx7Mej7rYBXyqChXz1IjfagNMkbSFlVwOhEN7Z-gN2V6TQSUIzNbqMWk
Message-ID: <CAJuCfpHBfD0zO60tPCEeNXSRJSoDi5Azs0LzutpYFEBW2z6JJw@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] hpet: replace deprecated mmap hook with mmap_prepare
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Bodo Stroesser <bostroesser@gmail.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	Ryan Roberts <ryan.roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_213332_017716_8FF71B3F 
X-CRM114-Status: GOOD (  20.11  )
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

On Mon, Mar 16, 2026 at 2:14=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> The f_op->mmap interface is deprecated, so update driver to use its
> successor, mmap_prepare.
>
> The driver previously used vm_iomap_memory(), so this change replaces it
> with its mmap_prepare equivalent, mmap_action_simple_ioremap().
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  drivers/char/hpet.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/char/hpet.c b/drivers/char/hpet.c
> index 60dd09a56f50..8f128cc40147 100644
> --- a/drivers/char/hpet.c
> +++ b/drivers/char/hpet.c
> @@ -354,8 +354,9 @@ static __init int hpet_mmap_enable(char *str)
>  }
>  __setup("hpet_mmap=3D", hpet_mmap_enable);
>
> -static int hpet_mmap(struct file *file, struct vm_area_struct *vma)
> +static int hpet_mmap_prepare(struct vm_area_desc *desc)
>  {
> +       struct file *file =3D desc->file;
>         struct hpet_dev *devp;
>         unsigned long addr;
>
> @@ -368,11 +369,12 @@ static int hpet_mmap(struct file *file, struct vm_a=
rea_struct *vma)
>         if (addr & (PAGE_SIZE - 1))
>                 return -ENOSYS;
>
> -       vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
> -       return vm_iomap_memory(vma, addr, PAGE_SIZE);
> +       desc->page_prot =3D pgprot_noncached(desc->page_prot);
> +       mmap_action_simple_ioremap(desc, addr, PAGE_SIZE);
> +       return 0;
>  }
>  #else
> -static int hpet_mmap(struct file *file, struct vm_area_struct *vma)
> +static int hpet_mmap_prepare(struct vm_area_desc *desc)
>  {
>         return -ENOSYS;
>  }
> @@ -710,7 +712,7 @@ static const struct file_operations hpet_fops =3D {
>         .open =3D hpet_open,
>         .release =3D hpet_release,
>         .fasync =3D hpet_fasync,
> -       .mmap =3D hpet_mmap,
> +       .mmap_prepare =3D hpet_mmap_prepare,
>  };
>
>  static int hpet_is_known(struct hpet_data *hdp)
> --
> 2.53.0
>


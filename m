Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD429E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 03:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEGiPdcE8U0HMqCc8hcN09nWg4b+RmE8pUeIXB0J+Us=; b=qNW1OMgeUHdGKzU3YcnylKNHXc
	H8RbQ6lVqZ36MnOm+xlOnKHhT6ulNQX3nQPywxlOMS/JlZ2To/O1sawDE7lwXfhwzPvYVHbJqWD0R
	+f6ViqFf1Md4BTQEgYNi8LikS2dtaZ7+tSredDBfd3MC0n8z4u3Vt+vzHM/EX3p1YHJMqKq/Y8QiC
	jdKIrItcXgV87gSD1Y1ge8z9FFv2BQ8dbIDjkb1bwnToixGNOv3hXqf3Zao0ZIOv4zJcpFVf+5PJC
	ibywmiCCZSHk1FZS5z6iWywQ91mXZFxTm/V9dkfGF9lx7tBo8U2nH8ncUPgh2h2DDnG2gJ57Fp5sD
	z6u7eNMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKr5C-0000000A7nm-2UxL;
	Tue, 10 Dec 2024 03:38:46 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKr48-0000000A7aQ-44Eq;
	Tue, 10 Dec 2024 03:37:42 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d41848901bso1666860a12.0;
        Mon, 09 Dec 2024 19:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733801859; x=1734406659; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEGiPdcE8U0HMqCc8hcN09nWg4b+RmE8pUeIXB0J+Us=;
        b=gPJIc32ditd6ISBJjcoU1wmzn+EwzBht2a09C4O7Q0+wmfurablqPbnYw8PEmYz7Ph
         EJTTdULP2Llvsf1Bn+rlOKQ39O92qn0xHg+Ioz3Zb+Egq+tXxtWzCOZUeZMgMIm+njYW
         OxKR0jKZF0lQzFamH2pBTCuPfFCZdSjM+Ikj2Rbe5PjgkeBizcScK7/o55mFFypoM5VN
         amsGWfm6I5TVlyaSf3prGhw1WGFByM7wzekmWzBw4YlxAN+3064fK6wh0811DBC2l1Ay
         YIrLtqx992WXCId6y1y16aQ+31tQNwCrzO5pu9i6yd8y7bfLqsb9bY1/40ioNFp8CeT1
         O7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733801859; x=1734406659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEGiPdcE8U0HMqCc8hcN09nWg4b+RmE8pUeIXB0J+Us=;
        b=bdeTdO4a6A7Gd3bV4kHYTw3KdtARptOh+V8ugy7iRb+MDtwLYZ1h0fBaPGqvIU7WVh
         9yOlvJYqEzJ3+nBPqQOAbHuB5t5Btrdj42KbI+KHiR12GKUGdDUumv4U8/lfeP78XB0A
         ykpv5nIpsFkIq2KiXBzGnCrWmrL857oxBkdZ6R4Vfck5n3DGTw7sV7YnAnPsP1HMqd3W
         K2HMVofFsTC9sYAtPZuSUXzRDEIDJ1HDBza9zrVV9WP/mjTTUayYgCMmAhMl+pF/5ASM
         cEXnbaw4l7/UtlHD7FyscqgWNfMISrf61fqbBcqX9EQX1vE6jXx0VpgXbkKhKZisU4he
         wd+w==
X-Forwarded-Encrypted: i=1; AJvYcCW0vgZNL4fb7MSUIAJO/tockffWHLJBhJA6H6KaWKjBsaRCI1ND5zbsyd7ydSE+HpYi46gN9SgIr9Rp9egMzhRQ@lists.infradead.org, AJvYcCWlQ2CA+JyefuoEz+18mO3B0SufpsVztMb/+Bxx4Ql+zG2CRrUBDMWsd1xJdu86Mvy1jYPlHQE0J/imfs8HztU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyyXjz0nciL3GsKfy1lU75Hy5mAkKFslLKVaMedQgayTof/3mW
	39nNhdE+l5zMQy9mw/mpWHj93Y3GErBtGvEruTb/XsBKF/k62RVGUe7qwVtg+cgMSFDNiFny9ie
	TGWCzqxWIOezEqZNtc6F1YG3Hp5k=
X-Gm-Gg: ASbGncuOceBtf+QmMwGhA/Kz7h/6vmYJXu6V7ysIwTkYirU4IC/TgETLZ+vpB62DhX1
	vMNBGFtS9JXBJoBMVCWM6gyylwqOYu+3qP/DJ1w==
X-Google-Smtp-Source: AGHT+IElXjz+7x/lQGuFmHk7BJtRPsIF5Xkbrc+PaOE9soOWoyJSq8aIO8IH6O/j+TzaKqiG91uZtuFho2g8MHXawAQ=
X-Received: by 2002:a05:6402:3229:b0:5d0:f6ed:4cd1 with SMTP id
 4fb4d7f45d1cf-5d41e2b4c34mr1849541a12.10.1733801858975; Mon, 09 Dec 2024
 19:37:38 -0800 (PST)
MIME-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com> <20241210024119.2488608-18-kaleshsingh@google.com>
In-Reply-To: <20241210024119.2488608-18-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Mon, 9 Dec 2024 19:37:27 -0800
Message-ID: <CAHbLzkq2SNaqzx4d981H2QfQvtObS3X0pPL8=oqFsFbMditWPA@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 17/17] mm: Respect mmap hint before THP
 alignment if allocation is possible
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_193741_005553_6882C0D4 
X-CRM114-Status: GOOD (  27.20  )
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

On Mon, Dec 9, 2024 at 6:45=E2=80=AFPM Kalesh Singh <kaleshsingh@google.com=
> wrote:
>
> Commit 249608ee4713 ("mm: respect mmap hint address when aligning for THP=
")
> fallsback to PAGE_SIZE alignment instead of THP alignment
> for anonymous mapping as long as a hint address is provided by the user
> -- even if we weren't able to allocate the unmapped area at the hint
> address in the end.
>
> This was done to address the immediate regression in anonymous mappings
> where the hint address were being ignored in some cases; due to commit
> efa7df3e3bb5 ("mm: align larger anonymous mappings on THP boundaries").
>
> It was later pointed out that this issue also existed for file-backed
> mappings from file systems that use thp_get_unmapped_area() for their
> .get_unmapped_area() file operation.
>
> The same fix was not applied for file-backed mappings since it would
> mean any mmap requests that provide a hint address would be only
> PAGE_SIZE-aligned regardless of whether allocation was successful at
> the hint address or not.
>
> Instead, use arch_mmap_hint() to first attempt allocation at the hint
> address and fallback to THP alignment if that fails.

Thanks for taking time to try to fix this.

>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> ---
>  mm/huge_memory.c | 15 ++++++++-------
>  mm/mmap.c        |  1 -
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 137abeda8602..f070c89dafc9 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1097,6 +1097,14 @@ static unsigned long __thp_get_unmapped_area(struc=
t file *filp,
>         loff_t off_align =3D round_up(off, size);
>         unsigned long len_pad, ret, off_sub;
>
> +       /*
> +        * If allocation at the address hint succeeds; respect the hint a=
nd
> +        * don't try to align to THP boundary.
> +        */
> +       addr =3D arch_mmap_hint(filp, addr, len, off, flags);
> +       if (addr)
> +               return addr;
> +

IIUC, arch_mmap_hint() will be called in arch_get_unmapped_area() and
arch_get_unmapped_area_topdown() again. So we will actually look up
maple tree twice. It sounds like the second hint address search is
pointless. You should be able to set addr to 0 before calling
mm_get_unmapped_area_vmflags() in order to skip the second hint
address search.

>         if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
>                 return 0;
>
> @@ -1117,13 +1125,6 @@ static unsigned long __thp_get_unmapped_area(struc=
t file *filp,
>         if (IS_ERR_VALUE(ret))
>                 return 0;
>
> -       /*
> -        * Do not try to align to THP boundary if allocation at the addre=
ss
> -        * hint succeeds.
> -        */
> -       if (ret =3D=3D addr)
> -               return addr;
> -
>         off_sub =3D (off - ret) & (size - 1);
>
>         if (test_bit(MMF_TOPDOWN, &current->mm->flags) && !off_sub)
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 59bf7d127aa1..6bfeec80152a 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -807,7 +807,6 @@ __get_unmapped_area(struct file *file, unsigned long =
addr, unsigned long len,
>         if (get_area) {
>                 addr =3D get_area(file, addr, len, pgoff, flags);
>         } else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !file
> -                  && !addr /* no hint */
>                    && IS_ALIGNED(len, PMD_SIZE)) {
>                 /* Ensures that larger anonymous mappings are THP aligned=
. */
>                 addr =3D thp_get_unmapped_area_vmflags(file, addr, len,
> --
> 2.47.0.338.g60cca15819-goog
>
>


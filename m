Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2AEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 02:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ve+KgfwCf7WAv7Osnu4Dp5X81+V4g7CuHLm8wADOA7c=; b=qOeOee7pSTrS0SHN+9p4WBTjRw
	oB6Xwrijkgqp/X7KsAs2fMTxm9n3fri7k+3OMbMRcfMWPmiIpe/V0wdCnGzU0MYz+M/vfVtVEi4xz
	ujKAD7BdnavqduLwKWxxdfxYQ5pIgtfX8JhBOE8FGkcfvarPZ9J/j+OrWlQqtUtAMEtSFZzMkLktT
	Rpto3QjSeYAeuL4ML98sHqcm4BoaI6dlivutteFajhCz2IltM/+k+CzPsi6m8LV7DOkQRXCZnG8sj
	Q+We29Djk/lyoWl7jL2SOwZdsZklXVwVM7YtoRlLW8XFXksezrn1XpE4rtW+wytKBpQRpjK7Eqjql
	A6UQs8lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiNec-000000069CM-3HOi;
	Sat, 11 Jul 2026 02:41:22 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiNeZ-000000069Ba-3a0T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 02:41:20 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-664bb15d05dso2407081d50.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 19:41:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783737679; cv=none;
        d=google.com; s=arc-20260327;
        b=aYKBCwS8YU+qsnKWsZsV9Owj0A4uRaVIsw3fMhgnWuE/d3Sh1KSt7IlhchEzXhy8Hl
         quYMb25DMI1tgBnGklOIU7a0v1hyYlzXUuDmADCMG+2Arl4ZAhRe5QZsrDNKPpsuh8sC
         ccoTbiAWywYCt1meBxddT2wiEFB5EoKDziLO90QWedhJ4lloJMYUvcy4z7AGKOkQKbNW
         QqBsbdcU+2SpqYeLBf/ZA+VdDesTFXniFk5sb2Wo6bR8PTmQdUW8OQqecrZPVkFsJUgR
         Q4c4BwaBPP25FL3D7NdnTbXKWvXETEBNZP3DYnm9T9LGg4l0kamyvlXA61UfNYfggg3E
         iP/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ve+KgfwCf7WAv7Osnu4Dp5X81+V4g7CuHLm8wADOA7c=;
        fh=FVv93g6tyg7KTglWMA5fBvqfF1aRT2i6/yciT7ef2IE=;
        b=Nul6mIiox5QwqwpqXSxWX/NcKjkcu4A1IW9uXSYxsCn/MUSTQn7ShXs+krzL3xr5NU
         UfxEhqvYhJl1ATleWECJzMYymBbPQAMYwJTukZ99COAiY39MKlkbbvDwVmXemBAvyl/K
         B55xTFVDouyLw1gy3pS+MZqZZx7hoHZ59ySNw/18xn7BBBZ48ADaApDfNwgjboSEZfqo
         I/McLQx1tfNuWnQ6uM/cHJo9i7aFdWO301wNfv6bB3DJMdQZxWdIUuukNEqK9ZoSLNLe
         05hD3JECjp+39ddZKnC9INFHoxSMFdzff+kBn1qQ8q3NmKdJ7+qX1Xkn9DbMLJkdh2Wt
         cEfg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783737679; x=1784342479; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ve+KgfwCf7WAv7Osnu4Dp5X81+V4g7CuHLm8wADOA7c=;
        b=UjtOnAthHxR/pfchgH8Dpo3CsiPkaIxHFdKrvcYLXBpZTqTh7DVUB/3pgSsQSTEf8j
         M0H9hmqMHRvyCo7csOXaKMOMy3WceWPg6FsQEKfPGSuhoJZBs7PuK1LkR8VKB0ezHX3E
         QhYN94ocvRBI6YWeqkONPOhZhPN4Urt1ofthzzl3dKAN22E+qeVFS5K6hQs3bFeIv+QA
         RWZajqpzlmWAbLQBJZ6vZRSv8wGYOtQqjRiUw0Jl5eSYhs/5MPFPtE3CMPaG6sCHphcp
         CziEZ0fIIIPw8TL4rXrmhs0vrvQFWYU4m7Ikc3ZABx4a6IDfzr23POmrndPn3CioKmx+
         JOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783737679; x=1784342479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ve+KgfwCf7WAv7Osnu4Dp5X81+V4g7CuHLm8wADOA7c=;
        b=bGmTg+9fTZUrUFxt2daFwdLdZI0FKoVqNqWQ05E7f6gNMJ4eiq2DgBZB3AW7Ksm3ys
         A9M7bEKJtX6V4xz56XqTd4STTEAWaLc68vCcGBbmQYCZc9XKZ+g5PZiZgRbH5C+OTxx+
         x16o3Eyy8B9FEh2pTQC9z575Y50GH3UfZkzFj0LOQC5C5IKIeZCQRfw+nDBXljYEYmnC
         ojd0O7TQefwRMP4Mk+EQ0p2SMZ0LyFQoIox0S909QpGRq3SVPkphDivHhIP+jzU7QsBl
         rogXFlQgCEPpDNh2oFTqgR0xoGdIT1gW8kMicDWacFtJok8k3zDUg6zuxwhjTTKTfmmP
         o4ug==
X-Forwarded-Encrypted: i=1; AHgh+RpWerM6V8eu9fQOwGRqvXEUqGNvKpYKA4l9zRD6PBKc6x4PGzamYekgf1o272wyY/kaHMAviB81WJ9IsIeN0Pym@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0eIu/ZUPIXhqKeRUa/xr2BnZcFimQ6APGRmv4sq8qjx1/DF1a
	SWp+jRhEpDLbR0HtksiMW2YEeyz2Wyh4VSNcGQ1yg7iDejWAXlpX8igDRLve1uSOeMHNYK06nAt
	H/42T9jHkUM8R8sC13sbC3wzBqPemKqU=
X-Gm-Gg: AfdE7cn8MFzRL37cvdEWI9Ia1mA3S/JtN95BaL/H056CCTzgDz3AAb45Gx4YtMwhJC7
	giNA7Xk3fVOEvdZemJSWky4bxP3YEysbE2sJqhu2L8jkffZV23nF8tZAVCora5k1VzevJMfVIsI
	R4xIXsoKyIF5s5kBqvck7IQ2ltrBsMRQdFFQpM1hob7BWsJDMD7ANSI9UrMwr9mfniFFBQSe326
	1bW77V/i1Urhzy7qThEWmgoVQpAHGfVENHpNaZLGfvB1uwgPoamNw+fiHVUSQEGXirHvzKo
X-Received: by 2002:a05:690e:43d0:b0:667:b2c3:f047 with SMTP id
 956f58d0204a3-667d7aa0516mr1048576d50.9.1783737678571; Fri, 10 Jul 2026
 19:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260710-btmtk-first-block-bool-v1-1-3602688ec523@gmail.com>
In-Reply-To: <20260710-btmtk-first-block-bool-v1-1-3602688ec523@gmail.com>
From: Miles Krause <mileskrause5200@gmail.com>
Date: Fri, 10 Jul 2026 22:41:07 -0400
X-Gm-Features: AUfX_mzQwDtg2H8ctSQPFDjQKF1EMJLy3qdwid6_YX5jZy6Z9FBBhv1W9Y4YqwM
Message-ID: <CAA6QAMJBJ11YcKKdXxuQ7MZidtta-VAw5EJd-N5_Y-tQDA0FLg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtk: use bool for first_block
To: mileskrause5200@gmail.com
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_194119_926260_E9890EE6 
X-CRM114-Status: GOOD (  20.24  )
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

Please disregard the duplicate submission. It was sent
unintentionally. I am sorry if I am doing anything wrong. This is one
of my first patches.

On Fri, Jul 10, 2026 at 1:16=E2=80=AFAM Miles Krause via B4 Relay
<devnull+mileskrause5200.gmail.com@kernel.org> wrote:
>
> From: Miles Krause <mileskrause5200@gmail.com>
>
> first_block is reset for each firmware section and is never used outside
> the section loop. Declare it as a bool inside the loop to limit its scope
> and make its two-state purpose explicit.
>
> No functional change.
>
> Signed-off-by: Miles Krause <mileskrause5200@gmail.com>
> ---
> Compile-tested on x86_64 with:
>
>   make O=3Dout allmodconfig
>   make O=3Dout W=3D1 drivers/bluetooth/btmtk.o
>
> Sparse-tested with:
>
>   make O=3Dout-sparse allmodconfig
>   make O=3Dout-sparse C=3D1 CHECK=3Dsparse drivers/bluetooth/btmtk.o
> ---
>  drivers/bluetooth/btmtk.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 809762d64fc6..b809eb82fc73 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -63,7 +63,7 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, con=
st char *fwname,
>         const u8 *fw_ptr;
>         const u8 *fw_bin_ptr;
>         int err, dlen, i, status;
> -       u8 flag, first_block, retry;
> +       u8 flag, retry;
>         u32 section_num, dl_size, section_offset;
>         u8 cmd[64];
>
> @@ -79,7 +79,7 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, con=
st char *fwname,
>         section_num =3D le32_to_cpu(globaldesc->section_num);
>
>         for (i =3D 0; i < section_num; i++) {
> -               first_block =3D 1;
> +               bool first_block =3D true;
>                 fw_ptr =3D fw_bin_ptr;
>                 sectionmap =3D (struct btmtk_section_map *)(fw_ptr + MTK_=
FW_ROM_PATCH_HEADER_SIZE +
>                               MTK_FW_ROM_PATCH_GD_SIZE + MTK_FW_ROM_PATCH=
_SEC_MAP_SIZE * i);
> @@ -132,9 +132,9 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, c=
onst char *fwname,
>
>                         while (dl_size > 0) {
>                                 dlen =3D min_t(int, 250, dl_size);
> -                               if (first_block =3D=3D 1) {
> +                               if (first_block) {
>                                         flag =3D 1;
> -                                       first_block =3D 0;
> +                                       first_block =3D false;
>                                 } else if (dl_size - dlen <=3D 0) {
>                                         flag =3D 3;
>                                 } else {
>
> ---
> base-commit: 64b5c4c8e79c131fe8f135bab5e5dfaa245c5776
> change-id: 20260710-btmtk-first-block-bool-bd047b970821
>
> Best regards,
> --
> Miles Krause <mileskrause5200@gmail.com>
>
>


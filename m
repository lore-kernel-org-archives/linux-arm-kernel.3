Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5CCCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 08:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JD5EhU3dMvt2TzDGGngYx4VWjKCENlPlTrXXievwr0=; b=08L6igV9t0ThIsCIwY+aFctM7j
	q1+d+8K9Wp60HzCQHWO9ve6nXUlNc8jh3WeQmlA4KwxJajQVEpd8SAWq+74GjkOOFZtyl6SJcWglE
	L8znMY2t+rlvblOc4eILADmPLIr2Gf7eK5RKpswafCI/6HfWij8KW402R+vKfUriwimfDCa5OkFpB
	Vb2a3jcExdC3i+1Dnp2YDivxh2Wn8Fkw1j+5U0yYrZ5TWwu/XBELLB2wZjJHdj9Sk7C7EmDvWguEB
	Ywq55yB5Oq3zHCENKWVeWYP1LQtq3yKZPIObCpzIqEw4ioom1z1lYCNEDs58IGFy6JhApw+n2axA6
	B2MzeIzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAOVN-0000000AoJX-0GWT;
	Sun, 19 Oct 2025 08:11:06 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAOVK-0000000AoIr-1g2N
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 08:11:03 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-780fe76f457so38487127b3.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 01:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760861461; x=1761466261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JD5EhU3dMvt2TzDGGngYx4VWjKCENlPlTrXXievwr0=;
        b=DRbr6tJmyVy134flu/law9VA2jMwuYUc+ZCnFOoZ6LjDoXQ7Dr7NT+knztI3D/37m+
         csOEPkG3JblE5/NpCz5KFr3+Tf/91zS8dl0mG1hctcRN+DGCwiio1tldcFrqShSV2wTq
         YVZ4XmjXlbVZlwM7nFERTogm0nWaC6uI9uYI2FO67Yxn3lxRbTPPO6EIeRuE0h0FwO57
         arX0cNZgbnsmQwjBYGtlocMzMQayHcLAa7MH6A+hOhYsjltUHQGPTiEMYXerSo4ttEp9
         scba6C74MP8AsNxMtXxCJvB2Usu0Zc1/rH7SNS4tqZfHXt9zIz8/m76XDreLCbZyJnUA
         ILvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760861461; x=1761466261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JD5EhU3dMvt2TzDGGngYx4VWjKCENlPlTrXXievwr0=;
        b=VzQlapg2vfKjkuIyEHzba3SEnudlAryP7uPNcrFoX1PI534bkQ/AvpTqHoVw/dVSGp
         HP4cRgL7G0QKZ87uhSHdICKlzNCJ/ZUL+UKpWeO+e2ARCahJcuS69GhaodoP81OHGSEp
         l8x1eT6i/6Tmeu5sIxQx+OZy1zD26LrYVrsIj/ptIgI9JpKBJnsPg61878OmMJH6DhfY
         96Ra10f7eRo2hBJpIKuvwUaCDdoIXSECnsXrnMgDH3NtUI1WnAA2GFoSpHrXi5zl3VcE
         fH342dp0zmzE0wvtxjEvmQG1C8Ogo+rHyr9apRPcy80ErOO6IpmrWdbe5FKgauGglFJI
         ooUw==
X-Forwarded-Encrypted: i=1; AJvYcCWn6j0BNOxYwGpxELwtWg+cua+/hE3bremPcHRXDnqp6LMxhR/4AId+YstzMxdL2r9OysIHeevzjBQdVmzXGLih@lists.infradead.org
X-Gm-Message-State: AOJu0YxNYBMjQ/nRsw40TXYo6EvlyhxWbWOBuqR1hdf60YEljwyXo+6D
	Xp2cQGSmfzbKukfuGb4uqGOGuIP9gsr2Cq/Ts3W1JJotQ4L7ozxwWr1/Dz3d2ZrCJQCb5uu5rv7
	hK6d/5QYSKGPdju/RQSKapJr34rBfZK4=
X-Gm-Gg: ASbGncsSirczKUtSS6qfdkdLDOewjqWlbznBrOFArUhS5EI26DpN3mXTarFI9KM8BYH
	DXgvFiTktfgeu50vtkfO1mUOniqsHQvqlmi1iP4nCr6F25pJ8xt8oBuYksx5s5qRJDSK2SfZGsn
	WwwBt+mRDjAebCw6yliOpjCiJKLudVCFM6dzipGNs3/VW1GrMEse3iBPsNOR3o/DxFJ8MoPTCvV
	AV7OOng11znBtNmNRgoojjcheV0IkiDBxazLe+KNEEeZGqfn009TYvCnNH9XygtlP/noDAq55M=
X-Google-Smtp-Source: AGHT+IEDp/usYEtVSaz10lwwm2/rh8YYcBuxag2F0nuBjSfSMoio/EijPl9t2f1PGKCDHr/mRoxnx6oC2CKJ7h3r2Ic=
X-Received: by 2002:a05:690c:31e:b0:782:9037:1491 with SMTP id
 00721157ae682-7837780ba2dmr109813007b3.42.1760861461100; Sun, 19 Oct 2025
 01:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20241202010844.144356-16-ebiggers@kernel.org> <20251019060845.553414-1-safinaskar@gmail.com>
In-Reply-To: <20251019060845.553414-1-safinaskar@gmail.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Sun, 19 Oct 2025 11:10:25 +0300
X-Gm-Features: AS18NWAhDVf2aU8hB0qWERPwO9zi-ils_dPukaoQchmqqRauvEb3B93Zz-69KFg
Message-ID: <CAPnZJGAb7AM4p=HdsDhYcANCzD8=gpGjuP4wYfr2utLp3WMSNQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/19] lib/crc32: make crc32c() go directly to lib
To: ebiggers@kernel.org
Cc: ardb@kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_011102_459628_38ED0ECF 
X-CRM114-Status: GOOD (  11.69  )
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

On Sun, Oct 19, 2025 at 9:09=E2=80=AFAM Askar Safin <safinaskar@gmail.com> =
wrote:
>
> Eric Biggers <ebiggers@kernel.org>:
> > Now that the lower level __crc32c_le() library function is optimized fo=
r
>
> This patch (i. e. 38a9a5121c3b ("lib/crc32: make crc32c() go directly to =
lib"))
> solves actual bug I found in practice. So, please, backport it
> to stable kernels.

Oops. I just noticed that this patch removes module "libcrc32c".
And this breaks build for Debian kernel v6.12.48.
Previously I tested minimal build using "make localmodconfig".
Now I tried full build of Debian kernel using "dpkg-buildpackage".
And it failed, because some of Debian files reference "libcrc32c",
which is not available.

So, please, don't backport this patch to stable kernels.
I'm sorry.



--=20
Askar Safin


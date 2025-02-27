Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89E0C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 23:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HlklntyFMEqSXsC3eULyJeiHZfsmoGMdS5ODYrUKghY=; b=HGJvgvLd5xWv+jjXB9njGy3IC6
	fnLWtQ9kbRGAI+9rBEdgMqzFIH9W7WRC5EoMk2qVdqW5tgjiSKm85ocMg56b0Nz31GlpfXwZ79PmL
	vTF00AMY2sN59cdrGuo26RF/ufT9W8MFM15btmmljMJeuiOeR7uPO1lW1SVcuzzVyc2nT/F9ILHHm
	JF9YSV6ng6a5cd7Bua6uwlfH+3WXaTwrYtsDCBl6MXJTDRup9Zi/rwkkxXgqkNrDGafyrOWvKGC3Y
	XbvBPAU9x1HOHb/SxqqDCox6pQe+39A+KoDO3YvSN0gJVb+nbiBRKIosG5Rh0xlC66wvzuJVqR6pU
	7ipADntw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnQG-00000009Bnz-2pDw;
	Thu, 27 Feb 2025 23:36:08 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnDi-00000009A8U-3oXC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 23:23:12 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-548878c6a5aso1577487e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 15:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740698589; x=1741303389; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlklntyFMEqSXsC3eULyJeiHZfsmoGMdS5ODYrUKghY=;
        b=ugot3d9Rrn39oXenGvfBs0m7C7xlANIg8t2OE9UPe8fT7bPPu6G2B1nukx3YorNh+p
         +kbp7TuIFhr0FvO3SbGET/LNaGujn+ZECVV4ca8J4rqjLFWzR9SJDpXMhmwqHSuOnguJ
         Mlq13VAopMkCjAUIqhKixw7X3nq3CagKYd3BtRKD12Xr0Qv/JaKeomOaPd2StXkc3Lix
         Trmk9uIFo29/IEPrus7S9ll911ZDxQyZf2kOM1aaKbBss0OzmK41si42OIzH4ZKDXBe7
         1DKD09m/FoywX9PSYIUVTYlyB0aVcktsVleqzQVcRY2qdpjZTmf4FcEpLy6AN0sYRJzl
         LEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740698589; x=1741303389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlklntyFMEqSXsC3eULyJeiHZfsmoGMdS5ODYrUKghY=;
        b=KOTiVMnCMt/Q1X8SletuZJ3hWKVLli5HaKBjI25vG+gWk3kZJX5s1/lHKe0v26ztAN
         MFjqaOwdDR2ebmR74pKSQA0w57NGAQjCbJoGaxb1QQufQCIb6RV15DyK8xK7QBmHVX7D
         gVZcr3Xvo/4lQp6rgvLwce5cVbQNfSR4/Lt8qHjYUTIHBQXrARhfkX+d7IZ2ymQixOV3
         k1HKy42IEI9lf+rN9c1TcppwVDRWdGcrYjABW5t6hZkVzkMHhl192ERtWbeJaqqXrDjI
         VMjfRHqbks14YvkpRxYhGSc1DQPY0FiyDZyaNqYP7YZQBhy1bqyZNBHtRMYsgNwsOYyk
         tzVA==
X-Forwarded-Encrypted: i=1; AJvYcCUcSQEFqzD8O1ftOWGBhltGoxbqg4lT05NH3Kzx3DnkdPPCVRMV0L6NYwor61+IictywoIBUel3WmzTWuZt9+k9@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjl5XZudW/Ia5HH4C8/knmCQvqXiVXaMlxf1bjLqZth1aizSkp
	Z7bMwKJCEDa0eOQdy79fCn2aVbSZH6MqTAShxy77aoeuJ1ZGOCyPOZZgGb3vA9Mm9gBMFkAhfCU
	hZ+PWzsBdLmBHfOVl85SYDv+ZuCP/KiEdmvZuyQ==
X-Gm-Gg: ASbGncuUXqz+B4mQbrBZjz8rlsYnqRQBWh4gO2otukOt1bVXTM/zV/4qpHOxXbJvJCm
	aEuESZXceJ2qRRR2pr3tK64TUg18oG8dQvPjdh5Gvksray8mkFGZyydKdEWlq/OMExZoQKxc+EW
	FpzRY5qhQ=
X-Google-Smtp-Source: AGHT+IFDwS0trh7wVv751/LNhm0ayEYAE6zWRl6h4UBlSzx9IILpD5bXrhXjg2DoYRUQ5K7XRe7cIuqbmqjCkUb809I=
X-Received: by 2002:a05:6512:3a90:b0:545:441:52d4 with SMTP id
 2adb3069b0e04-5494c33089emr429126e87.26.1740698589257; Thu, 27 Feb 2025
 15:23:09 -0800 (PST)
MIME-Version: 1.0
References: <20250224125414.2184-1-ceggers@arri.de> <20250224125414.2184-2-ceggers@arri.de>
In-Reply-To: <20250224125414.2184-2-ceggers@arri.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 00:22:58 +0100
X-Gm-Features: AQ5f1JpP5no5eM0Ohbj9j2qqCMlr1sH-HO2M7itlp2WyMF6MiNode8u_9sdDNZI
Message-ID: <CACRpkdYZmC7yg7fcYEyVhxioDObRX-RR35skGBxxFxzHHOnt=A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: avoid that vectors are removed during linker
 garbage collection
To: Christian Eggers <ceggers@arri.de>
Cc: Russell King <linux@armlinux.org.uk>, Yuntao Liu <liuyuntao12@huawei.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_152310_946315_724C40C6 
X-CRM114-Status: GOOD (  10.02  )
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

On Mon, Feb 24, 2025 at 1:54=E2=80=AFPM Christian Eggers <ceggers@arri.de> =
wrote:

> Without this, the vectors are removed if LD_DEAD_CODE_DATA_ELIMINATION
> is enabled.  At startup, the CPU (silently) hangs in the undefined
> instruction exception as soon as the first timer interrupt arrives.
>
> Fixes: ed0f94102251 ("ARM: 9404/1: arm32: enable HAVE_LD_DEAD_CODE_DATA_E=
LIMINATION")
> Signed-off-by: Christian Eggers <ceggers@arri.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


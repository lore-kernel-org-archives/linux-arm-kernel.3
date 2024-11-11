Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275A6D3ABD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 17:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZbeLLseB5b8+ehFZfsw37ALHDLGBMJMLyk1xIdLiNI=; b=s9asigJKyx6JkoJP7GOQxmbuVF
	oU6DF0Ew82Len5jh3DixaG5RDKBREgcLK74JAbR8DvVEvCLJ0SLLWERT3Xe8ABj79C2IdW8pCb6B9
	m8qoTGSkTh+O528mtGnnkU90yIa2vU84prsTXVzFdFwDqBf+r8QFZ3olrBtQjetwLlq76fbOTwQr6
	/4Ot5rWu8pMVtgmlO5egOTMvg2ZnfvvyoprKhWAqlrFh0OLBePEe+0LJMSIA/a7wDPdNTZynjDXY3
	7iueCtgrGhNJL89Nh36k/8B+MKwF5BF0UYPnqoRpwezfO0GOKapp4K4ArJxoBy7SINUuVZqP5JuUY
	Owq1dm8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXxi-00000000gH6-1mcb;
	Mon, 11 Nov 2024 17:12:26 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXvt-00000000ful-0yox
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 17:10:35 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5c932b47552so20504a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 09:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731345030; x=1731949830; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZbeLLseB5b8+ehFZfsw37ALHDLGBMJMLyk1xIdLiNI=;
        b=YGt+Bz+ihpXUC1VfV31+KC3tEDzzHC+BPmX4tlD2OoUrHs7gJfwnoflnw0yv69oGqt
         zc8fB5/i4Whd2BsVb7T0bNUot+A/wX3q3a76zux+65+pL5xiOYmfD+Yx7Cqo4yOUEzXf
         0UZzGcCmMi1KAFWp/essGP2FJiDBMExmLS31I2c1cSTyDnDq2kBAaOW4plR/GOHnCuyj
         Zf92HwYToA26gGEYohLamzCHQ3JALHBlmf9+1p/cUFUP5sA+YQyJsoiOorkwbUD2pKww
         JS9ljHkqZGmiKsPi88RjiUV3up3Z2D1MC636n0lgeYiY8XFlGY7xQfwtx5l2sQQSzoJn
         1Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731345030; x=1731949830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZbeLLseB5b8+ehFZfsw37ALHDLGBMJMLyk1xIdLiNI=;
        b=Ihc5yQAsLoQnPGlJmHwpPs8yJAP8NB0h/Va+PIaKux2goV9nm/Bt4eFgZNeog0pT9e
         Dr1ZJlDdF0r2NQROBcdEf0TMEEjsvYc9pMXcjONINYXCDOPvz7sr35+QHX3Sq482xd2O
         4Xf/r5rbrLOaatHVzTCJr2W+T+c6LH9oWi1FSNq52m+u/Hg5z6n+jIohkHu82WaIqAjH
         LbP+QujsN6R4LlJJ0P7MDFbQe3BlU3g6HCgxrpyJBRJaiV/U5FV+W3dGU9pYSoRZrt01
         Hb6qbKYNF/pVrV2myEiO+v7p/KuEDFIkfFZoe6HeUYD7P+BR58yQJewv81oLnceuVi8S
         z8AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo0ykHs+73tKwlq0MUu32USherzohJcAZ1ZAlpht8aYcxca1L8G9hT5hwgsU0aWYWpgwBO4/nNhEpdowamP0vM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5VMrNRGxv6LvU+J2XN+VfPKyHlZpfJ7te/cegUvrDrao/Wh8x
	yXPHS8k3TWz41sJUgyfBeepRoz0wyrOJ0cNkAsfOLReAgyQP2Y0/WA+5fR5id+UFYsgydP94kUl
	455IXlzgs026Tbn9+ey7Us6LYT8TUj9ibAIyh
X-Gm-Gg: ASbGncvjs2LBIEm54+WmIa/3Lm/IL7Mhv8Ck1udZeVcyv0RvxjonkmOR592XAG6VBCl
	OWiFYSWbgtMKyj5rJ4mWd6QvRRQHMsIeD7jJmURZihJUePnRqII1wDut57rby2g==
X-Google-Smtp-Source: AGHT+IHgerBC9h2YwDfKDijAh6osZ2kMh3HmOgZnIMcMCgU4EDXSlgxbGcjXjle/6Rd24wYQJ071PNSrdzccO67zBYI=
X-Received: by 2002:a05:6402:7c2:b0:5c8:84b5:7e78 with SMTP id
 4fb4d7f45d1cf-5cf1c83cea9mr353370a12.4.1731345030142; Mon, 11 Nov 2024
 09:10:30 -0800 (PST)
MIME-Version: 1.0
References: <20241108211446.3304809-1-kaleshsingh@google.com> <86r07jz6uh.wl-maz@kernel.org>
In-Reply-To: <86r07jz6uh.wl-maz@kernel.org>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Mon, 11 Nov 2024 09:10:18 -0800
Message-ID: <CAC_TJvd=fNRx2VOcEEgjdkY53MwpR0Xa4dX1KTy=nNew7dg9Mw@mail.gmail.com>
Subject: Re: [PATCH] arm64: kvm: Make nvhe stack size configurable
To: Marc Zyngier <maz@kernel.org>
Cc: will@kernel.org, qperret@google.com, broonie@kernel.org, 
	mark.rutland@arm.com, keir@google.com, vdonnefort@google.com, 
	kernel-team@android.com, android-mm@google.com, 
	Catalin Marinas <catalin.marinas@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, 
	D Scott Phillips <scott@os.amperecomputing.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Ankit Agrawal <ankita@nvidia.com>, Wang Jinchao <wangjinchao@xfusion.com>, 
	"Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>, =?UTF-8?Q?Pierre=2DCl=C3=A9ment_Tosi?= <ptosi@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_091033_296505_CEBC38FD 
X-CRM114-Status: GOOD (  21.14  )
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

On Sun, Nov 10, 2024 at 3:06=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> [that's an impressive Cc list...]
>
> On Fri, 08 Nov 2024 21:14:00 +0000,
> Kalesh Singh <kaleshsingh@google.com> wrote:
> >
> > In order to make the nVHE stack size easily configurable,
> > introduce NVHE_STACK_SHIFT which must be >=3D PAGE_SHIFT.
> >
> > The default stack size remains 1 page (no functional change)
> >
> > Downstream vendor features which require a larger stack
> > can configure it by setting CONFIG_NVHE_STACK_SHIFT.
>
> We don't let make the stack size configurable for the rest of the
> kernel, do we? Why should a tiny portion be treated differently?
>
> Making this configurable means that testing is harder, and bugs harder
> to reproduce. It also seems specially designed to allow badly written
> code to run in hypervisor context. And once you allow two pages to be
> used (up to 128kB), what prevents the "downstream vendor" to push this
> to 4 or 8?
>
> If anything, I would prefer to see this (obviously out of tree) code
> isolated with its own stack instead of growing EL2's private stack. At
> least this would make the problems attributable to the guilty party.

Hi Marc,

Thanks for the comments.

I tried to be conservative with the configuration only allowing only
up to 2 pages. Your points are fair concerns, I can see how this still
may not be ideal for upstream. However, I think introducing
NVHE_STACK_SIZE as a refactor still has value, similar to how
OVERFLOW_STACK_SIZE is handled. If there are no objections, I=E2=80=99ll
resend a v2 of the patch, dropping the configuration parts and
focusing on the refactor to introduce NVHE_STACK_SIZE.

--Kalesh
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.


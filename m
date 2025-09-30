Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037B1CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 05:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2SilRqMKI8+ZzKW7Ww1+IsfzrGbolVUm5PAEYWQE+0=; b=lV7W3JzJjgpdfeg78I0Jg1kWRt
	KAJFVxlEk7HXi1j5AQz08ZxmT3TrxSsWXVN77LSh8IjDxLC2iBrRlA2klRMY0Ecq4f1ktGGXAKcaY
	H1XQwYLoZ2Q8/7MT35tmBEclUe5GIssxWoZ5594iJmf/kBEEW8no5dJE4MP+f6EUr6Zpzgzy9WcmJ
	GgzDtvsLcL5oCqYaT19mlgc4uTa/YxSdOzocOVME0KFYlBvgbcFYXNZ9ulMeouyxJFQGRCvLmXkVH
	6gBtgInT4w0b3dzqOju9t9Ylg6ogoAQmvp95l21bOIEQCGIUf7CwZC8j6nMMrJPq1G+JEuVJdeBOY
	8bFGlbhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3TKQ-00000004K1Q-2X3T;
	Tue, 30 Sep 2025 05:55:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3TKO-00000004K06-1WoA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 05:55:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 666DC48861
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 05:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F31C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 05:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759211707;
	bh=xjANxMJTM9LPC3RWuEeyXQhzfMnAjgHK8NXmc9aojnI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZB0fMYa9XLkbh6rVUDgMHx3eQeX6PR4zSoPKI8u9xbuliqw9mfG4vwkZ3vND3le/Q
	 JPQrWYdQUO6pxbODiHiLSkfo/nJLphrgwsstttU/by2x23vwH3kT6S396YvdyOhsVB
	 AGVq2hZIajauw2YLR/W5NS9h5SfuUFqEkDUte8AakA9H1YkVpK7KD+/Qhqj+CSMPDX
	 botGEtmtgW2kJrZLIhdPE9QJ/8oR6wIQp70d8BfB/FqU0tLY4nu96ob6hl/nkxp3Iv
	 ZYPixFUDAaHATPyDWhq9Wx00NSCGQVkAwxGKvoJsiWHUYRlJhojrlM3Iyc+znkCn9W
	 mL7tGx1KTXr5w==
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so3841793a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 22:55:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUcnVh7iLwhg1XQV10S9je/rJc4a02nE1Ljci4Lrx6b4dfN7Dw6lAsJso8g2h1iinSq83bpVXCkkBzBbZP9rvNv@lists.infradead.org
X-Gm-Message-State: AOJu0YxhbBB+8/W9Mz+IQhdOoEa+uhM+aCtqznu3xG24yMBb7xdgmTc3
	ZAyTXFHTaXFtgdkogUZ6b9KonPLEE+tJT4NbbYvg3x9RatyP2knE5keBbeJTJ+d/pMsjZZ4rurz
	URhmx+rQunfQwxmDQui2UT8Gjt7H3/ms=
X-Google-Smtp-Source: AGHT+IGmdGRI0LMi5UqhtfOWw2y8t3L5Y8DIOORexgZS1OILavNgX8DdiClZ3me4wlwwJibUM+KIj1389jiCcZaA8L4=
X-Received: by 2002:a17:902:d2c1:b0:261:cb35:5a0e with SMTP id
 d9443c01a7336-27ed4a74481mr236897635ad.57.1759211706568; Mon, 29 Sep 2025
 22:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250930035551epcas5p4ee7cb5af08eadb2f5ed6e5eaa06a60a9@epcas5p4.samsung.com>
 <20250930040348.3702923-1-h.dewangan@samsung.com> <20250930040348.3702923-9-h.dewangan@samsung.com>
In-Reply-To: <20250930040348.3702923-9-h.dewangan@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 30 Sep 2025 14:54:54 +0900
X-Gmail-Original-Message-ID: <CAJKOXPecLREbEDM4yfM=WD-EFfuBqPDXNZceATLeWQRj0X_w7w@mail.gmail.com>
X-Gm-Features: AS18NWA-eQpZ7RgNI6Y84_mjkYb4V1iHJZQyw43DMe2SjRnOaTW2ugj0GBT0nqU
Message-ID: <CAJKOXPecLREbEDM4yfM=WD-EFfuBqPDXNZceATLeWQRj0X_w7w@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_08=2F29=5D_media=3A_mfc=3A_Add_Exynos=E2=80=91MFC_drive?=
	=?UTF-8?Q?r_probe_support?=
To: Himanshu Dewangan <h.dewangan@samsung.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com, 
	alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com, 
	ih0206.lee@samsung.com, jehyung.lee@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_225508_446789_86FEC36E 
X-CRM114-Status: GOOD (  14.50  )
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

On Tue, 30 Sept 2025 at 12:56, Himanshu Dewangan <h.dewangan@samsung.com> w=
rote:
>
> From: Nagaraju Siddineni <nagaraju.s@samsung.com>
>
> Introduce a new Kconfig entry VIDEO_EXYNOS_MFC for the Samsung
> Exynos MFC driver that supports firmware version=E2=80=AF13 and later.
> Extend the top=E2=80=91level Samsung platform Kconfig to disable the lega=
cy
> S5P=E2=80=91MFC driver when its firmware version is >=E2=80=AFv12 and to =
select the
> new Exynos=E2=80=91MFC driver only when VIDEO_SAMSUNG_S5P_MFC is not enab=
led.
>
> Add exynos-mfc Kconfig and Makefile for probe functionality and creation
> of decoder and encoder device files by registering the driver object
> exynos_mfc.o and other relevant source files.
>
> Provide header files mfc_core_ops.h and mfc_rm.h containing core
>   operation prototypes, resource=E2=80=91manager helpers,
>   and core=E2=80=91selection utilities.
>
> Add a configurable option MFC_USE_COREDUMP to enable core=E2=80=91dump
> support for debugging MFC errors.
>
> These changes bring support for newer Exynos=E2=80=91based MFC hardware,
> cleanly separate it from the legacy S5P=E2=80=91MFC driver, and lay the
> groundwork for future feature development and debugging.
>


No, NAK. Existing driver is well tested and already used on newest
Exynos SoC, so all this new driver is exactly how you should not work
in upstream. You need to integrate into existing driver.

Samsung received this review multiple times already.
Best regards,
Krzysztof


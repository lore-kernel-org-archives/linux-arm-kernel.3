Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BABC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8P9yRldB8efdjVI/GGOevnbpBNvIMbrliEBkXndufro=; b=QqiBhkKqefQXWAjSqevGEktW3b
	Uvn/QQCRcgSmP4nxWjUr9ored68hhiK+en9X7Ul4OW8Yg+nyJ/HxLcMggo9pQeRivxFhVGm16ohYW
	F15wPdS3YbBmyKt0oHW7afcSNvHVEhYwMFrXqjOO14WZ4LW0pMGY8m16ljMiiIE4SrsflM1Oet6dj
	sSswtB0Dhdi+5uFjdSNJ96fTbUoBuchq/vJYno+BKogKh13ody9PnKSk50wv3fx4ip5KvhdJP3Y3x
	yk5A5EmmtYbdqKUYagjJiQEKNRyiTs7MviV1sNEk0baS6dnWufiDJXz6ouepjlKsuzVQYWWRnSCNp
	5JmQdwmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAE1-0000000FXgO-2IYj;
	Thu, 05 Jun 2025 13:01:41 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNA9k-0000000FX3l-0FLd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 12:57:18 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-70e1d8c2dc2so9048467b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 05:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1749128235; x=1749733035; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8P9yRldB8efdjVI/GGOevnbpBNvIMbrliEBkXndufro=;
        b=x4iF4ygvHjVjs3iEkZiugJO7pdwJO9IWww4CjepGJ5Q3DmDfrAg2wwrYBFAfm87KUs
         ZOyx9dWDhI9e4ONlsN/o6KUsu0gwPcsHfrO6tbxczgzdBrYnbTirZCGB+1l52sevT2KF
         YOncMeH6PnGpAwNKJkmLKZ+aZljVWrlnWCUEKYzEvekRjEFvnBxt2/zYuGCtz6x8mE7m
         pzWN0q5cKXoGI2fJgU0ozRfFkXTt2aIdHvn/nUxgSZj3UXu8dEim9D90B4tbyX5KDgUt
         gOBLf0LAGMA/xFjOnMCFP74fv6tmRqlW9J09U1jKEYcNhA0iosfOsF75/vmzFTZZmoUt
         APcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128235; x=1749733035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8P9yRldB8efdjVI/GGOevnbpBNvIMbrliEBkXndufro=;
        b=KOXbAS4MgkzWCuOjHtooeRSm5oUAv7RN+l/wkgDkbdy4oibzcK5n9xYdROX9Fa/ulf
         7OMW6PACVg5uTl6Jv+86Se+MMurJYNml9NPFP3kXYtODFnSigDK8SE9wXq5GbB/eL3EI
         9kRetcYARcagFItUH0VWSLzMukRTgnUO/UDEi2U+OTODchM2x2UyGlZ/HIpzmXINHiAT
         WZzsN0kV54w+yflFrtGAoyV09lD03xqmOzz9j9v3MonlGZyEpvrP8StyZpIEfvHPb2S5
         W+ff+C+30soI0NT70QxNsd/zemHysFDs/ZIo+aRP3ueE5bJaIGZTPtxjsMlInTrLNEji
         nW/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsJvJ4zgIK7H2SxUHt82I8L+m5C/Hawhe92RYRQ0GtkXVfkCrM8zsuyg3dYY7lTsdjS3GZFpAevDEaztknP8zu@lists.infradead.org
X-Gm-Message-State: AOJu0YxTY9+jmn9s3bCwz4LnpobfXtRcZw3xIiiduwcmwnOrxMJRobIQ
	iMUt5JIeJmvbFMGsaXDs5YmVTycyvB7OR1kOTX6iqSylcYJyqrrrIyWksvNSyV87pBkiOTDxAXj
	K6M4M/7foIw==
X-Gm-Gg: ASbGncu4gJvqBI1ccJryH5WB+TYqg09w3iCa18RkZHu3RfRBi/ZRi8MqDfUnPUpNB8G
	CiOjYBmAm8w7ihIbDyIRkpSRHqI6Mckwk480ackpecxt0JJE0sthG1/2zISYIjjG36f+mjjBNk8
	fnDpCop8+X5gyyfXtzGn2s9g7FimEJ6Znb+kji/r0/Tf4V1VDCJwia2vm7rBPN+EZbD22YA2n6E
	ozrrNhoxDVEVGBMSTTBsxF5notq6kZ4dNQw86O1YIQwgzBub5j5zJ3m3Mt5eUeXE4dF5MrVJRQW
	/AUvC8VnTMNn4tE7TSjeS2AF4cvCUds9l954I3oFIKWi/3ase9slXhWpDTJWrR07laoCfWH5EKl
	lsePmB3JfkuzCKSZ+z4eYo+IKpbRCuQ==
X-Google-Smtp-Source: AGHT+IGP1JTjNBKOAVz+On1yDAptBCNtZ2lHBDuV58ZFk1R3I6KXOmSz6cp8vZ8zMbm67UAhowdYhg==
X-Received: by 2002:a05:690c:630d:b0:70d:f47a:7e40 with SMTP id 00721157ae682-710d9a707b0mr85304827b3.16.1749128234998;
        Thu, 05 Jun 2025 05:57:14 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710e4aa7655sm5213437b3.46.2025.06.05.05.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 05:57:13 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e817b40d6e7so917681276.1;
        Thu, 05 Jun 2025 05:57:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUnvjiflQXtiCHGdWPrXuFodo5Ct5V6aruf9/XeQbZ8KW78OvkWS7V11QdTxTR1CH7td+zcjqt5OiYkYpTF2WU=@lists.infradead.org, AJvYcCUu8iJZ6OcYyMAmeIsDlK7rPpBrW0V1sExXaA5DdT8alCu2sEqluB6N9VMlbZGSHBpscWVKWzK/DC44p3XrORN8@lists.infradead.org
X-Received: by 2002:a05:6902:1245:b0:e81:49ba:47ef with SMTP id
 3f1490d57ef6-e8179de2e64mr8284874276.27.1749128233149; Thu, 05 Jun 2025
 05:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net> <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
 <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com> <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
 <CAPj87rOKGcufM0xB+uMCxhs0SdXCHpViyTd+jQ0+=B1kSihvVw@mail.gmail.com>
In-Reply-To: <CAPj87rOKGcufM0xB+uMCxhs0SdXCHpViyTd+jQ0+=B1kSihvVw@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 5 Jun 2025 14:57:02 +0200
X-Gmail-Original-Message-ID: <CAAObsKC2UCA2gfcS5M6FHodOGWh-D8_+ia_VJhp5K64wx8F5cA@mail.gmail.com>
X-Gm-Features: AX0GCFvkLrhe0xTjkvrmlzVcmcIDMHbj0V1goAH3SY_Lo_zCTT8XJB_kX_AKtNs
Message-ID: <CAAObsKC2UCA2gfcS5M6FHodOGWh-D8_+ia_VJhp5K64wx8F5cA@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Daniel Stone <daniel@fooishbar.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_055716_334375_E8C87A49 
X-CRM114-Status: GOOD (  19.57  )
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

On Thu, Jun 5, 2025 at 2:29=E2=80=AFPM Daniel Stone <daniel@fooishbar.org> =
wrote:
>
> Hey,
>
> On Thu, 5 Jun 2025 at 08:41, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> > > Indeed if you're using the IOMMU API directly then you need to do you=
r
> > > own address space management either way, so matching bits of process =
VA
> > > space is pretty simple to put on the table.
> >
> > My impression was that the VM_BIND facility is intended for SVM as in
> > OpenCL and maybe Vulkan?
> >
> > Guess my question is, what would such an accelerator driver win by
> > letting userspace manage the address space?
>
> I mean, not a lot gained, but otoh there's also not much to be gained
> by using the kernel's range allocator either, and it saves userspace a
> roundtrip to discover the VA for a BO it just created/mapped?

Oh, I just map on creation and return the VA as an out arg in the
creation ioctl.

So it just seemed the simplest approach, with the least custom code in
the driver.

Cheers,

Tomeu


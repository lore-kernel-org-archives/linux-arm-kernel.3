Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9379DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95fC/C95p1+hJwvVm5h6wvO5Q4omEjar82baF+zynPs=; b=kwWykLuWEUAsfVtX3oHyMNBDdb
	dH6RWvBZRoz3TGuKW0hAwPFDct1LuM3QT133/BhcJjdBgq5/B+Wu/mrWK8PKU9t8WTtdiMj2qixeT
	YdaGlE2O93tHe1Z2r1kzpSQDhb0RKYejkXXHxzBlDbsA4KcN9eLW38vrPCzPizGEKxCk3PRg+Ev4p
	nlsFcSIVxvyNFltbxlrhqiRHyY28+fEQ1h3kN03CT/RYIGxnrufQ70YuWdXnIEirQSjh8X7KB0UMk
	1rQdpaa0anf9gBHd2YQrjImM1qvsFDpbkuhPOZ5dhgFvCLaS+VQD+aSdB+skMLmOrj02vQ3YUyDy0
	tLzC034w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZnn-00000001E5a-1kma;
	Mon, 10 Feb 2025 19:50:43 +0000
Received: from mail-ej1-f48.google.com ([209.85.218.48])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thZmN-00000001DgN-13xk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 19:49:16 +0000
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab7c07e8b9bso239996266b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 11:49:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739216953; x=1739821753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95fC/C95p1+hJwvVm5h6wvO5Q4omEjar82baF+zynPs=;
        b=Aws6TqXJeGjuWgAr5sCem/itpYqJckbU6CqRfLE+GgjU5W0DjQ2qhdegpqSlhmc9tR
         sjliKz6aUvgdmQJWCijcsZqe1NyYwthVpSaHH9O38cmtAsL18MIET4dVmAJLfH/c+pvZ
         yvUe94AkGtwajd69QM85Ha2EngrrLDVCxucYexF34W5AOw+JqHc17kedEf3kkw4CuvVE
         FGcWxSf5xd7rrlBD/RVwOte4oTAOyZ4Mc+XOb8E9ILKv1iiARN6F0llDAd5Tb6ND9afH
         wrZeMao5dijeNGavC9wjmk7y7MrG5OROk1IZ43nitqzlqymM5L5iCpfeieTuT5xooraB
         Fz6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVk3AI1v+p18uRYZ7lYY/EZgG1dGdjwa5oRk9eEdW944XxKrhfJP21NAfEuqvAYl4Xb0fjKlgM/b/wALkxPL1+P@lists.infradead.org
X-Gm-Message-State: AOJu0YyRKzh2C2xnm4De5NaKbs+lkyWBqYLE+UO4K2W9eJYT3PqXi2mh
	p3e431/rHAoBPsmQvitzY6Rje/W5a7NOm93fmqAzQClfE9h3evoSVtdOljN5ZFI=
X-Gm-Gg: ASbGnct2fxFJd+PeDfhwsiD2OqRJWMC+6IeaDNq9oko35QynPmjVJDCNkGh2WgNsjeQ
	DZA7wfp93hsRh594SlpOVJYhEmk1Oo+vYc36D8cf2BAQKRRyB9cCenKvZ+6/G8moy86Wn7xPNK1
	PMPJI8ueX68i/mzqjwQ+ljNkARxsGAbXQs2E9TOGbctF0PLJ7c+NbIGXgRGOZt70zPRfC8q+t9p
	UWhO5HZRU6rtACfmw1d0PSVl+qSIznCs2KW/1CX7jGeepFx8lb1a53px3ft2B1gU3VVk2GwRMaf
	gfgt85rSNflkqz10iakhBUV7LDUoZna20C3MPAkL3Ok2iA==
X-Google-Smtp-Source: AGHT+IGC6TzQw5hLLI5xdeG4JgkLzWAGdpgM2G5mZ5w952Fx0X2p67D4bzGFpCMzGcd2KSgS8k7o1g==
X-Received: by 2002:a17:907:86a1:b0:ab7:b0e4:aa93 with SMTP id a640c23a62f3a-ab7b0e4b16amr739977866b.13.1739216952394;
        Mon, 10 Feb 2025 11:49:12 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7d72ae04fsm56679466b.46.2025.02.10.11.49.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:49:11 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5de77a5d2a2so2777992a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 11:49:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW5bTpoaWNg8D4QPrX24Os524ZGOtJCGEL43BwqoYM8IfbkCb96b02qErpdSgkgX7c+ITM/VDgq1r/2ikI43wGP@lists.infradead.org
X-Received: by 2002:a05:6402:2106:b0:5dc:a44d:36bd with SMTP id
 4fb4d7f45d1cf-5de4500274cmr13498767a12.8.1739216951504; Mon, 10 Feb 2025
 11:49:11 -0800 (PST)
MIME-Version: 1.0
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
In-Reply-To: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 10 Feb 2025 14:48:35 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9BskhHuehHLES=5WNPk2jjd=38207XsfEmFDMiF=b0bA@mail.gmail.com>
X-Gm-Features: AWEUYZnvFQWMfElhV3JVfcrxv5vOkguawqzwZra2J81VWXgm4X-CWu02f7-pmbw
Message-ID: <CAEg-Je9BskhHuehHLES=5WNPk2jjd=38207XsfEmFDMiF=b0bA@mail.gmail.com>
Subject: Re: [PATCH 0/5] iommu: apple-dart: Support locked DARTs
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_114915_291500_04672B49 
X-CRM114-Status: GOOD (  17.33  )
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

On Mon, Feb 10, 2025 at 2:44=E2=80=AFPM Alyssa Rosenzweig <alyssa@rosenzwei=
g.io> wrote:
>
> Some DARTs on Apple SoCs are "locked" at boot time, meaning we cannot
> write most of their configuration registers. Currently, we refuse to
> probe locked DARTs and do not include any in the upstream device trees.
> However, the DARTs used for the display controller are locked, so we
> need to handle locked DARTs as a prerequisite for a KMS driver.
>
> This series teaches the iommu/apple-dart driver about locked DARTs,
> preparing for a future upstream display driver. It has been extensively
> tested downstream with our work-in-progress display driver.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> ---
> Alyssa Rosenzweig (5):
>       iommu/dart: Track if the DART is locked
>       iommu/dart: Skip reset for locked DARTs
>       iommu/dart: Set DMA domain for locked DARTs
>       iommu/dart: Reject identity domain for locked DARTs
>       iommu/dart: Assert !locked when configuring
>
>  drivers/iommu/apple-dart.c | 47 +++++++++++++++++++++++++++++++---------=
------
>  1 file changed, 32 insertions(+), 15 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250210-locked-dart-d7ece05f19a8
>
> Best regards,
> --
> Alyssa Rosenzweig <alyssa@rosenzweig.io>
>
>

Series LGTM, having looked over this many times as part of kernel
maintenance for Fedora Asahi Remix.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!


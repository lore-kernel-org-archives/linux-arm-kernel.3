Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B85CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 03:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GpKCLLWQN5UvJoV+eBAMVrPx3wPOuNvj43v4OMEG1XI=; b=qYJ124fFLbxJwZK8mXWywxOp8h
	RIew3eKz7GiXNAEFc5tF7TwipVJO1L6hYC1g0YMNvdh+Gosvk31wnLFZgQ5cBg7teqxEvxhz6pPiM
	QoVvnqU7+J6KyDWyh5eVxWLDXyT2jDwXZ8SYGRfEfnwPYlI95bB146M2p52H7bk3Ju/AiGSqixYOn
	jc9CrC1JvEKsCNkZ6dDp4DW370C/AQsndiQ6cil3Bj2cegaSHLxBacor6voTPm6E3GErRtAm16Yfg
	HKCVCJLj7RRKLttwB0PpimMQBwNltr0f5x2spyosJd1mvG3FqdKljtKLg6dVkzEjsph4Sr37AprvZ
	ANL+lHDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urStu-000000005cm-194M;
	Thu, 28 Aug 2025 03:02:10 +0000
Received: from mail-ed1-f50.google.com ([209.85.208.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSr9-0000000052w-1it0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 02:59:21 +0000
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61cb9f6dbe7so804260a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 19:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756349957; x=1756954757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GpKCLLWQN5UvJoV+eBAMVrPx3wPOuNvj43v4OMEG1XI=;
        b=qalFEq1bFOW4LogMRdLj2F/AvKwS7BC0Q2nnB85keMUD2UvQ9rZuPEii27VByK99S0
         +kTTBP4pZL+ggVWH1+p+ga+F8xYmS/wgCPMxZIp/pWOL3wv1jORtnIao7YqL0sQb2M5i
         QgllVnPYwgN4aXoE6lxdQqzgQWN+6Zjp006tIrjQDgUnmeu98JwQDoOhKol+RJ/ECgho
         0kJKQH/8+LfOfBlGcsWjQzElMv+o0bWpUuvJOnFhgmSIhvhj98OiKTGoPoLhMCBkE8TB
         UlbWbxV87ZRGMNuTh1R4LmYg0pWgfhIH0pGSdxmAMrq94ir3a9AF0dN6SosAXBtX5Jml
         OA6w==
X-Forwarded-Encrypted: i=1; AJvYcCU0nm5ibeff/07KES1/s++CTb+9DuNXSz0okS3LwgiMIci+JSSHNcmJ58bme/aIYz1XesUMQJr7PzyhdCLqPf/R@lists.infradead.org
X-Gm-Message-State: AOJu0YyWTSbMCe9wHpvHMwF3kqkXwJgOXrXtYohraMMJxDFaEZWjQp/f
	vs/jg4tZJ6RBwdwXpkidKbJDcXHO2VS+S+wrQtylEBTflEA6NOexBkTGWdDWHQgQLXI=
X-Gm-Gg: ASbGncuG/BT6uPZgeK+57I7z+YxomHZzSi9REk4xVpN4wtI3wT5cKa3scAIvGolwIW9
	dS2H62cdr9DWpr/S82VzBETVOshogmQHbJ/SVZkxglCRChwQvl7ZkIj/YZ133q3QcmTqpsDj9Mv
	uISTTaAbM0C4pPEToRORMi7xEskupS4Ymtf6/W4mPAkWU8L0JffExgjDBynriNwm53KtHcorn/U
	cNPSGRP3rAXpyaCC1IGXoarfaFkYjIgRFH/x5eK0IkC+bG3KCnU+DA3SJT6dnkhLZ99U+WQfzVc
	XeeZ5MDmJ5pzRrMZZY13fO2xtVUgZvfNm4twuuN1FyW4m14oHLviakmktUvo16gurheMc965RnB
	uJcm8T88WNRf6xX6yV4zCazU4oBpvNHIh9VmWns+AlkHFqMCQlKwUs1pUfPsvGyuJa6xcculs0P
	AL98Iclvwv
X-Google-Smtp-Source: AGHT+IElF/T+Q0FRSbaf4vIW5bhX8C6ff55S6JhSk25qIcq1w7h43dVawEGNhIiUvV2A+8nhwkz6JQ==
X-Received: by 2002:a05:6402:52c4:b0:607:28c9:c3c9 with SMTP id 4fb4d7f45d1cf-61c1b453182mr19602307a12.6.1756349957145;
        Wed, 27 Aug 2025 19:59:17 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c312c4f88sm9979429a12.24.2025.08.27.19.59.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 19:59:16 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afec56519c4so52162666b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 19:59:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXlcnveEW9eVyI0v3vfFHs0peTaCJqd2gGF8SeHUF53eK/vk2Q4XiwWIqdLPIT3gTqVF0RDHlUKs+Df/fR4zVwu@lists.infradead.org
X-Received: by 2002:a17:907:2d0f:b0:ae0:d1f3:f7f4 with SMTP id
 a640c23a62f3a-afe28fd46aamr1873427666b.13.1756349956549; Wed, 27 Aug 2025
 19:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250821-apple-dart-4levels-v2-0-e39af79daa37@jannau.net>
In-Reply-To: <20250821-apple-dart-4levels-v2-0-e39af79daa37@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 27 Aug 2025 22:58:39 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_mgErxSHk_OaBCwzNXwPcwNsAQuAutAUNdJK2AU88w8Q@mail.gmail.com>
X-Gm-Features: Ac12FXyrolpUKa4Qy_Ohl39WRoR9hhvgyebGLIK4Y-M15o_j00lBGu62bGVkdGY
Message-ID: <CAEg-Je_mgErxSHk_OaBCwzNXwPcwNsAQuAutAUNdJK2AU88w8Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] iommu/apple-dart: Four level page table support
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_195919_450414_40B4824A 
X-CRM114-Status: GOOD (  13.87  )
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

On Thu, Aug 21, 2025 at 6:16=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> The DART instances found in T602x based SoCs (Apple's M2 Pro/Max/Ultra)
> indicate an IAS of 42 bit. This results in alloc_io_pgtable_ops()
> failing as io-pgtable-dart supports at most 36-bit IAS.
> The t8110 DART design supports 4-level page tables. Implement support
> for this in io-pgtable-dart and mark DART stream with more than 36-bit
> IAS as 4-level page tables.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Changes in v2:
> - simplified 4 page table level use in apple_dart_hw_enable_translation()
> - use "iommu/{apple,io-pgtable}-dart:" as commit subject prefix
> - added Sven's Rb:
> - Link to v1: https://lore.kernel.org/r/20250814-apple-dart-4levels-v1-0-=
db2214a78c08@jannau.net
>
> ---
> Hector Martin (3):
>       iommu/apple-dart: Make the hw register fields u32s
>       iommu/io-pgtable-dart: Add 4-level page table support
>       iommu/apple-dart: Add 4-level page table support
>
>  drivers/iommu/apple-dart.c      |  50 +++++++++-----
>  drivers/iommu/io-pgtable-dart.c | 143 ++++++++++++++++++++++++----------=
------
>  include/linux/io-pgtable.h      |   1 +
>  3 files changed, 121 insertions(+), 73 deletions(-)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250811-apple-dart-4levels-8f9ae8ac1347
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!


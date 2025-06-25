Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A9EC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 17:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfGTcVvQA4QV7t/B5E/h74PebrSqIHkIgMNL94El15A=; b=raVD1qcLF+gAaaK6evB/YAp9C4
	7tPBZzKmF3Bd5F6IfnSa5VvAMZzhQofdnc73ce4niKZhTR8falL0Xg3XBPBe8u5mBqdOABYQeLvy+
	ZFkyd521Dv8RkWwNoCUTED3dEN0V/Cz7NUk1D9V2iu+OB75uIsnugBM+24TzOY85do4nbgGXg3eT2
	f3W7UkEEZP+jI9MhEYXkQj5suuv6qkUCiJS6SGZ9ZdmoPUSH2ZCLtwThELszSVbaUMVGhMh2Bktzt
	mHnkx2McqvwgFpAneDnm0NxNkC3WKvXMTr7O9BJQ/mFST9VBnjtp21gl9AU4SiEqF501Q9dGVOS/W
	ir0aoADA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU2z-00000009Szl-2ITA;
	Wed, 25 Jun 2025 17:36:33 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPPk-00000008eRe-1nXS;
	Wed, 25 Jun 2025 12:39:45 +0000
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5313a2566f9so937162e0c.0;
        Wed, 25 Jun 2025 05:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750855182; x=1751459982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfGTcVvQA4QV7t/B5E/h74PebrSqIHkIgMNL94El15A=;
        b=Z2XvhF1O3yTX+k+QYw8mr1F2hsqAkq+BhGH5CA4D9IWOLgcNjQF6uLGoyVNXJY8lZ7
         yG+Ov25xBT+1p8hyR5Pg2ygtB7rRWc+k2AW2KdKXASl1oyc5I9EqBaE/tjJCAiykcuDW
         +pyddIXPVRhyhruS2xT6hiVau5+xDvO1ofP1zZCkF18vTBJlEpGOrEhDSqrTMOD5KebN
         14bmAO5+OY4P5G5ZnJg5up/+XH/zAi4Ongz/kNssgOGqVoPewZflUbBE5q97IFrE7wTZ
         OSxuB5SbpOmppAtmGCCpm7SOKreY5DqaoNU2Qb7p5H+KZC1DPw5OKR8l5qXN9b0l/Q2w
         o8PA==
X-Forwarded-Encrypted: i=1; AJvYcCWAy/jRR5x2zloOa7WNCO5Z+YiH8LqmpoYcaUYtYUObEb+w5ffpb2rZzv9IguRgfqN9GQ7ka31hVkaJCYc=@lists.infradead.org, AJvYcCXA2H/IB6rzP3VgXYvPJDdJlKWx9xWhHYfA8w3R+eQ4ADziWHbHlst8uG2j4e6vCcVNEG4wLaibyf33Gumh9gvd@lists.infradead.org
X-Gm-Message-State: AOJu0Yz35JOIgMdghlvyoQXG9FemleIzRcpCmso2tVrbSABRKeHOTPvk
	cQxMgyS/6PDFu8MFB9MbWmf6d2n27mZKGmA6sbq5t1XIW3belP/cX0F4CxGgDVmD
X-Gm-Gg: ASbGncsajbmASM+XdwFLuSeorlLX12205+DidOK3P//sGqs7SwqWd+Q3m7tDe0mO+aA
	n7b/1WwQzoLz79xrrFk2Aqv7PNoH4oXhNFg+oyu4F6jbiom4zS5yfqX+yGzHfOwB6MuqBK3MFia
	zl77Xcu/P35Ok9BhqtQe0iEiZLvU/tc253fyVWBAeQjyP0/tgWr8T5rIHh8aT1yco2+bNGc8YMd
	QfrUafMgcl+OyWAtCq9TTACNGyvRaEUwWJpe7gHUJfvY0npT3aNKGzHNe3RqE8s1e21NSwQtRJ+
	4vOrRVyHumNiNaX/Rmc5kHX83B/SXu/7PSIGWItUYQ9b1li5/4VzgwVdJ6gsvQQzZsIB6gyQD94
	f5DlxRTjIcpMCVG1Fz0FPSgq7
X-Google-Smtp-Source: AGHT+IE4x3p7hO16RcqoOv45KW6ncPyot4pXb41AVVts65j/J3f6Tr7vW2rkNVXyx3i9oGTfjMm76g==
X-Received: by 2002:a05:6122:280c:b0:531:2906:752d with SMTP id 71dfb90a1353d-532ef6c4e6bmr1801174e0c.11.1750855181793;
        Wed, 25 Jun 2025 05:39:41 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-531ab37885csm1926408e0c.32.2025.06.25.05.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 05:39:41 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e9c3d752a8so963344137.2;
        Wed, 25 Jun 2025 05:39:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUp/q0q36GHvJUVIU7X4QeMsaYV3fa6gy509qRKXd4PlvPjmvb3KLX/bdgVSnv/RzGry84lWQ8rYBwTj9I=@lists.infradead.org, AJvYcCWGNoA0KKiapJzVKPEUCdXtK6IPO4Tk45/NPNuyo5Qh6KV2LbuipxnXR6asrUA+LZSdvvT249UcwCrUKJq8KmMP@lists.infradead.org
X-Received: by 2002:a05:6102:390a:b0:4ec:c513:f3d with SMTP id
 ada2fe7eead31-4ecc76b5c72mr1424726137.25.1750855180432; Wed, 25 Jun 2025
 05:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250625111806.4153773-1-maz@kernel.org>
In-Reply-To: <20250625111806.4153773-1-maz@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Jun 2025 14:39:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMgK0rQgVsUa6VhwkgtDp56kKnL3rOQJyw+zOCaruHMQ@mail.gmail.com>
X-Gm-Features: Ac12FXxK6cNyNoyRBhl82L6AsapcQAs6YOl3OFDtLzqdZ4Opz860a6cw_SA705M
Message-ID: <CAMuHMdVMgK0rQgVsUa6VhwkgtDp56kKnL3rOQJyw+zOCaruHMQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] PCI: host-generic: Fix driver_data overwriting bugs
To: Marc Zyngier <maz@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Rob Herring <robh@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Janne Grunau <j@jannau.net>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_053944_465091_819C6430 
X-CRM114-Status: GOOD (  23.69  )
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

Hi Marc,

On Wed, 25 Jun 2025 at 13:18, Marc Zyngier <maz@kernel.org> wrote:
> Geert reports that some drivers do rely on the device driver_data
> field containing a pointer to the bridge structure at the point of
> initialising the root port, while this has been recently changed to
> contain some other data for the benefit of the Apple PCIe driver.
>
> This small series builds on top of Geert previously posted (and
> included as a prefix for reference) fix for the Microchip driver,
> which breaks the Apple driver. This is basically swapping a regression
> for another, which isn't a massive deal at this stage, as the
> follow-up patch fixes things for the Apple driver by adding extra
> tracking.
>
> Finally, we can revert a one-liner that glued the whole thing
> together, and that isn't needed anymore.

Thanks, works fine on Icicle.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


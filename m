Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0834FC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 17:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjQJD5B7v7ISL8KgAt5xpogoImBvFhfkxB9L3kpUJiM=; b=rMR/AXkqLkrNC/NXHz7yGQxuPv
	BOzWt3CPIsOxSrTery1kQsVvm2ed6OOebszZRslEttmq2ysC9150eCv+X1ygbl116GlOv33wJuScO
	aBM/sDo8GAykQc0NNzRnfBNr5U50kBJ+ZetmBf2g8ZFGcgVF6ck19fRE5dwqXr5pq5+1w/DZhCEd7
	IfboSmynkYEBAQ/4eIh/zRkr67xGX4hJJqn7fpo8MbLxg31Ru8vFGikGzZDlDTmUybCt/nIEEbXmp
	QANCmWTOSAUz8tBpELmH9yAfnscU4tH1ssZ2bJ90yl+H2P99koMcGuINRRAbDQrDMzJdmswmtDUm9
	deb9Nbhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNhR-0000000C8PZ-3QVL;
	Thu, 03 Jul 2025 17:26:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLJJ-0000000Bja7-30ml
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 14:53:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5695F45C3C
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Jul 2025 14:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388D3C4CEE3
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Jul 2025 14:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751554393;
	bh=DYtPFjKsBRMKz/l5D/t4ZCOdW4ZlU0pbxZxDlephea8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p1w5cXibIDAhNVjtLQmdEwa2Ytv9ciyjyG1naJxm3QJ9haNeaXPF7TgVrOk9MK8PZ
	 q8NABLCgkGxo/K+NlGfxmpv+PAF8mh6VlgHOSY6brq4yfZieF3zhxW6GTZY0nKboHq
	 3Z9CBTYcStEFUTnvgyOEBxfisunhbBwfqSYo5golA9ibkFTyyd5K4ka0kgK9AeN73J
	 eb4TRQ+dyo57/jRPhs9GTDJucL67RmINNHy3O+xptglXyNF7JGHkOFX+t5rxidYFCh
	 kgAz3h7AjtPqsriWHCsFnFdnOE7X5i7NvuYnxupi701uvWOeYgmLhuNCJaSmxW5vPC
	 edAgFNQhHGBnA==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae36e88a5daso1140970566b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 07:53:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+fbdKwZw0KtPKnfJnoXRumJxoUblzigj7JIijw77etaX7qIyMdxl3zXN96QUIGGikHnqS1ErC/al7Fdsd6AdV@lists.infradead.org
X-Gm-Message-State: AOJu0YxoqZdVS9WphJbckXmCqEpqyzdTvybPq3fDbOexqIB/SH9Ia8XJ
	RmcVPqhucHyT0XoKyW8mKLp6YitNixw7LjNP8mr1D0zifIItfBbP64mK0AjzcP/HyhXrJb8vwst
	1wCllVtK/KfC5xuggynfiP75epVIaMQ==
X-Google-Smtp-Source: AGHT+IF6/W7R/MdVdKSm57lSvwfhmuwesnrXaz+1Ouf3Kgia+HRQDsPWXxDpsPtXTQ0Z1Gxc9bSEIcQnIrE3MFEps0E=
X-Received: by 2002:a17:907:3e24:b0:ae3:aa8c:e8f with SMTP id
 a640c23a62f3a-ae3d8337789mr318025466b.2.1751554391802; Thu, 03 Jul 2025
 07:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org> <20250703-gicv5-host-v7-24-12e71f1b3528@kernel.org>
In-Reply-To: <20250703-gicv5-host-v7-24-12e71f1b3528@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 3 Jul 2025 09:52:59 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKejEoHhFNfybJVpimXwCGyc4_hqM4w8F54fFnEdMFb0Q@mail.gmail.com>
X-Gm-Features: Ac12FXxFUu74snwLufqalaVhV3WIbBJAXXqbS-UUZMip9gA7bEBFm5gd5gAC7P8
Message-ID: <CAL_JsqKejEoHhFNfybJVpimXwCGyc4_hqM4w8F54fFnEdMFb0Q@mail.gmail.com>
Subject: Re: [PATCH v7 24/31] of/irq: Add of_msi_xlate() helper function
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Sascha Bischoff <sascha.bischoff@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_075313_775747_AC7D7BC4 
X-CRM114-Status: GOOD (  14.03  )
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

On Thu, Jul 3, 2025 at 5:27=E2=80=AFAM Lorenzo Pieralisi <lpieralisi@kernel=
.org> wrote:
>
> Add an of_msi_xlate() helper that maps a device ID and returns
> the device node of the MSI controller the device ID is mapped to.
>
> Required by core functions that need an MSI controller device node
> pointer at the same time as a mapped device ID, of_msi_map_id() is not
> sufficient for that purpose.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/of/irq.c       | 22 +++++++++++++++++-----
>  include/linux/of_irq.h |  5 +++++
>  2 files changed, 22 insertions(+), 5 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


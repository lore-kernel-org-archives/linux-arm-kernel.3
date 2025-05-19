Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE039C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 19:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zK5nIPF/0gbJ8aVna8ILvsLahrjnTgQt/3wJwhoSzZM=; b=wIb0EO7VfBDeLC1P+tG/F3ta1m
	Op9rDlb0ecGB/Wi/EhZ1iEUBT9FSRpDBysQGi6ybhLsu7otQ93EPFckj28RRLidovLiVmrm5INjJ1
	OhozxldpD4/9o8+kfN+q+tY6wBSCUOltIqaRTcLWEx1yySPc437PlXePYpVx7qKIMvuNIG3IyXj+B
	vskDxdx39xbujA8LxkJw586e89iJorzgmBSE9Lc1QytloYkHCpdTiPxNAyCXPTrhLkbZl1DRLLAuO
	yswesJzcXszIpTbUcf7RDUt20djXy9d85WOGXdudtoegdE1opMQJgy+OYc1euHj71/hxNZDSZGZTR
	Gg5y1Jqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6aD-0000000AHpQ-3wDO;
	Mon, 19 May 2025 19:55:33 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4tK-0000000A5Km-0o9V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 18:07:11 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-550ee1cb0a3so4412219e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 11:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747678028; x=1748282828; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zK5nIPF/0gbJ8aVna8ILvsLahrjnTgQt/3wJwhoSzZM=;
        b=SxnjAEyipZmmXylzOOqUutUHoDT3WX2gsvKPrT9vqGD8/2N3LBM5boYYI+1PRwjtSP
         3CIAs2cBAY2ydZikdFHdA2m98NyjT/OmB4A5TKSFrgk2YICwbYc2hniADFx0bi+ZZrPp
         /wKfYRSsVFG5l+VEC6+jVtmEdFNbA6vssdEq8+kfYpJsNl3pS4dW4hhBCdSfUgfjNFC8
         d6vnq39r4Vo+dHbPqYtd0CIKkypyffEokqIunQXSnzkgGpRfYs6aD4EgyUEIarPbOHUj
         TzrBzSwJnKyY6MoyJjRSOL8Olcu4J9emCH5HFCfa+Cs5PsmlbIs0YVqNSoSwfMKg8ufy
         fGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747678028; x=1748282828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zK5nIPF/0gbJ8aVna8ILvsLahrjnTgQt/3wJwhoSzZM=;
        b=LerGkOe89qBP+9sJGofmijNQiIESJhTb3QuS+jwSiEmQOLGEpWAfj8+oq1S/NtZLyc
         7xOHW2fTU2OVdzkE/6aB+Ltm+/aT8gsXhgoc0snnyAI7wosnJ9K1UeuV2TGtT4DUBb6M
         lkfT3wjXUZuMmGbdfOBy/zgsS4Pc9FJJJ+R/uls36lQRXDiQiapZpFhY+GUUEKN49l2K
         IxyLxHIgHCOX3RqBnwZfprtfqF3MKmAuntAZ6kWffSMGdZc/yeCri+xaf/3HpCtOrkGx
         sVZYEq29wYGZAZg6EtN44/tOJJGZbyCBxGC6fQ6cVGXrP8c3ddZ+A2dz9GC4ULMpyVnA
         szIw==
X-Forwarded-Encrypted: i=1; AJvYcCWOw+DHdp9q/UJprLP/+wncKbCsYorHQ3MKm2dOt7h/zvciB8u/U8ZPcAABRU+y13J72tE3PkLuMXDBscSBdZjA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd66uuqsznW3k50j/zXLT2Q0u47pE+5pZWS2FMwRDCTGxB7402
	bcI/ET6coPNXk+J/GaQFmoZPD3LQhc7YvZpV6qODPsvxEq0AKcruFGD4Ocifw5HGlUq3K24orkq
	6phd62BfDCPrQKchBnlsdazcLldmDnOxNkabu
X-Gm-Gg: ASbGncv6j/G3zLhbTvVoTGq7qVPE3xOEc25vHAXHTA1Ie8tjIg2uzYPje1U7QpVoqnF
	jioEeKg+rAHGZ/ormEQD9HDiYvJ0CIg2YNuF8dnifmvWRdiBIt6ea8eCihu5STbEvmwpP/xKsYl
	T8BSUf9G4goc1EUm0/a37Nx1H3BXFrFf8KSqHDG5ZUHkVqPdmnJyTF3rrN1mp4+WBC
X-Google-Smtp-Source: AGHT+IEsSwerskMF1f0teqna3+W64qx/F+SHnETSbfNu4VgAGrNqP/iI7wOGAZG3FONb2MQddBp41/ErEDylJVM2fuc=
X-Received: by 2002:a05:6512:6289:b0:54e:8172:fb6e with SMTP id
 2adb3069b0e04-550e7245433mr5044522e87.54.1747678027829; Mon, 19 May 2025
 11:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250516183035.685914-1-festevam@gmail.com> <175cdb8a-4fcb-4492-8d64-e59896b2448f@kernel.org>
 <2c72c0a3-6b30-4525-b27f-6627f6a078c2@kernel.org>
In-Reply-To: <2c72c0a3-6b30-4525-b27f-6627f6a078c2@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 19 May 2025 15:06:56 -0300
X-Gm-Features: AX0GCFtgNbJvBkLBJhWeCag0_i7WeLTSB5s2uo3e3mQxSC2xrjXARxvge8DDKzg
Message-ID: <CAOMZO5CZvjrXV3k3hHWCWo2CRsOvR7Epw+RW8=Q=Y1qjGctVmg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add ARM64 defconfig to its section
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arnd@arndb.de, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_110710_227143_6946D332 
X-CRM114-Status: GOOD (  10.26  )
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

On Mon, May 19, 2025 at 2:37=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> P.S. We have it explicitly documented in maintainer-soc profile, so with
> this change probably you need to update that document (with its own
> rationale).

The reason I submitted this change was that Arnd asked me to resend a
patch that touched arm64 defconfig with soc@lists.linux.dev on Cc:

https://lore.kernel.org/linux-arm-kernel/ece2df8d-acaa-4554-8c82-24ed45f3a8=
a4@app.fastmail.com/


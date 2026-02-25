Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F09EFD207
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWgvuyyKOdHiamZL9D4cj9vV0r+h5EBYUsOqhsdXzTM=; b=l6/PIYuBux1Vu4AFXBsEAetkLm
	EWSXq0Gxr6KMHJp8qYQweQUK2oO1X2ctqjvmbxyDhEYVP8+HVyLCCKFbK41aCRgvG+ahdNH1Fj4Jn
	227XJSq40MB+Tp8JeRkizHRvC92iYT4EnN6f+1jS4C6B0mPBCbrBwwHCF8g8gQOthKqKXOtEHE9Iw
	AXRA0DIhH0UXSRswTiT0HEsEz3wAFMtV/5z54fIGcNunFtWDEyDuV7qIIzQNBtnrntp9Ca/FARaYl
	Je5azRi3DBzhANI0SLi/Hsrs459+hdQENDpl/lqWZtB/1rYkVd7rr2HfYioxIsNdGG37Q2HOD+S8R
	uOaT2XNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9zY-00000003TZ7-1sSu;
	Wed, 25 Feb 2026 08:11:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9zX-00000003TYT-33H5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 08:11:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF34760053
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 08:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846D7C116D0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 08:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772007090;
	bh=usaysjS0gpHIFyZHKJqEeInHs9jknMQNaMJew5h1pqg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=YYc/RIttJOjCfXUewXc0JG8muvoFbg2hfl3g2yQ9Ch/KYy+WqwclhcPEbkZgrYv/J
	 LCuzuzOCSgB1psAFoEHbVuOCsmQ+j686d/ofMNUVUKWqE9YhiFuX3b/ez1TLeJwpDJ
	 FQOpMeSxcDM1tTIQfNG+FkzE1MIgHOoK8ZNdlkI5PwZdbvxY6b+WO9a6Hgjy8XP+/J
	 /djEwSr6Kk6YMHA/jUDEYzomg72N3j0XmY4WDsWp9yGt+VvRXCdNjwfZMrrY8G8srz
	 As0q4z4TITTCTLtw8GONuAgTQQcZms3oQsVn2fvW1kSspwmA/YBk5CpS9M3gKceSXF
	 HaozfnjBTLfMA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38708180241so49940281fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 00:11:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFtqFED3uJl4Tnef8lnpP0PWMjr8zM0U/wngVgjA8dTiRvjNf4oINDNOT7FUgrunrOFPCoHJ9rnuOSTuvDjJRO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9rZXtinlkBgdjOs9WLURJOV4DGfghVoXJvFMiAXRkEjBsExK1
	bLC4yWJC3NCoqTxfOZ6rmlPfax959vSv3n7dyrwa1PREHvTHWqx0PTTErPB14FpzCJpOdqEl7QG
	yj+l0i+9v/0nR/PmJCUmsrrdVQQ/+5dMxgsdARpsCpg==
X-Received: by 2002:a2e:bccb:0:b0:383:246a:74ec with SMTP id
 38308e7fff4ca-389a5cddb2amr51858551fa.18.1772007089247; Wed, 25 Feb 2026
 00:11:29 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 00:11:28 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 00:11:28 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260225072225.3345307-2-wenst@chromium.org>
MIME-Version: 1.0
References: <20260225072225.3345307-1-wenst@chromium.org> <20260225072225.3345307-2-wenst@chromium.org>
Date: Wed, 25 Feb 2026 00:11:28 -0800
X-Gmail-Original-Message-ID: <CAMRc=Mc79ex9Sbz1ThVf62JEO3G-KY6LRS0EyBGvvJwxrzSqww@mail.gmail.com>
X-Gm-Features: AaiRm53FAfXDI6zI7HqJU4aTyz7YrJdL0-41-67eGZ5k3Q4aiUw3d0tcyRAeQOs
Message-ID: <CAMRc=Mc79ex9Sbz1ThVf62JEO3G-KY6LRS0EyBGvvJwxrzSqww@mail.gmail.com>
Subject: Re: [PATCH 1/7] PCI: mediatek-gen3: Clean up mtk_pcie_parse_port()
 with dev_err_probe()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 25 Feb 2026 08:22:18 +0100, Chen-Yu Tsai <wenst@chromium.org> said:
> mtk_pcie_parse_port() in the pcie-mediatek-gen driver has a bunch of
>
>     if (err) {
>     	dev_err(dev, "error message\n");
> 	return err; # or goto
>     }
>
> patterns.
>
> Simplify these with dev_err_probe(). The system also gains proper
> deferred probe messages that can be seen in
>
>     /sys/kernel/debug/devices_deferred
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


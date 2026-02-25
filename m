Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98776EFD209
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izXI3LMXbG6SsuVnD2N0XUXouX15pyDqNUn3MzXcNkg=; b=buXg4ioJFlzQu3JvdDFXgnyLTt
	oxzbsJcnk+orpznjQWmyMNNnQXMri7WFsbbw8enI6jFW50+5Ais+pHbDaclSG7E4X2tBNGbMejSAs
	ngl2KQ1laQ1Z8Y5EkUMoXCqrEDT9+5kmimXMZCJua7EE5juNd+dinTFnDU4vbzJdOVlzjrpvn3enW
	iinyi6d77MtlWwUNcm2zPbUD4F/AeWmeAHjynTOrRdcH9tN7S44/NaHFPqhcTTWD6/D3I4crUoZ9v
	UkzmbrF6jicr+ITtCD87e/aSfSTvbuA7TH2yl3cra2D37+v88T3xq+d1gbqGpH32+QCJr3dPNijUz
	X06BVIpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA7V-00000003Xqs-05Ia;
	Wed, 25 Feb 2026 08:19:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA7T-00000003XqN-1V4K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 08:19:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 84198600AD
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 08:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDB0C19425
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 08:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772007582;
	bh=izXI3LMXbG6SsuVnD2N0XUXouX15pyDqNUn3MzXcNkg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=nkoF+QGtHikINmdkO+WRITa7gjp5vxoaDZ28534DqKhZv7NtsLJqwRShUxCdnO3jk
	 udphkiXx0bZvUj0nmyHDG2dMr9POE3NeLvmBYsv8L+Uuuml8ssz8kpiHkrUmHakMAz
	 oSYAU+r8aAmb8tReB6AmGiIDGLDPL32tgjaRESAJpSSJryOXpEk3kephw4Kr2xyD2s
	 xvp5hN7pCNdZ9oMPYBU3AtSsVDWHdOpA3jO1TsWjElTex6cWKGuTEFn9VeYZVLJCam
	 TBFGQ8oxg1r17xZJJvkwp2nG3h/frmQfl8qDPEHdMrKpOOu4Ie9wBYgZjd2hShHHM1
	 VX6X+WPjsHjDA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38706f96202so40233481fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 00:19:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4Ejhdyh7dbEfqTC2gKpKriMtgEhX/26uM5VyFcYuMSbw+ygEvLH5c25CCCUi+QjStIIsZnVBjqO2ITh+oAb82@lists.infradead.org
X-Gm-Message-State: AOJu0YyHHSKW8wd104kL82+t6tKXmpjPtDhJeUXToj04vB5ob5uuFhh8
	wtWzq1/2zsNwu5h0kpqjo0gg5OH+7pKTm9v1vkzx4fZ0vjdkmlrkcU+cb8BDxilpi12s+Fba8h0
	v36MulGgXFM4bG3ZCqFNAzbO8c2+htSAknhd+7Zs5Aw==
X-Received: by 2002:a2e:9a12:0:b0:37b:a955:d497 with SMTP id
 38308e7fff4ca-389a5cdd726mr40354431fa.17.1772007580872; Wed, 25 Feb 2026
 00:19:40 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 00:19:39 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 00:19:39 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260225072225.3345307-5-wenst@chromium.org>
MIME-Version: 1.0
References: <20260225072225.3345307-1-wenst@chromium.org> <20260225072225.3345307-5-wenst@chromium.org>
Date: Wed, 25 Feb 2026 00:19:39 -0800
X-Gmail-Original-Message-ID: <CAMRc=Mfti5FqPsC02zrvY_YnrHrXj68SLDA_tCc0q0qAzRQawQ@mail.gmail.com>
X-Gm-Features: AaiRm52KsedqHnZlertAD8iUGS0ywXhPRvuHDAYeVDvIELIFM7DO1igrITzeqTk
Message-ID: <CAMRc=Mfti5FqPsC02zrvY_YnrHrXj68SLDA_tCc0q0qAzRQawQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] PCI: mediatek-gen3: Disable device if further setup fails
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

On Wed, 25 Feb 2026 08:22:21 +0100, Chen-Yu Tsai <wenst@chromium.org> said:
> If further setup fails after the device is powered on and link training
> succeeds, we want to place the device back in a quiescence state to
> avoid unintended activity and save power. This also helps with power
> state tracking and balancing once pwrctrl API is integrated.
>
> Power down the device in the error paths of mtk_pcie_startup_port() and
> mtk_pcie_setup().
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


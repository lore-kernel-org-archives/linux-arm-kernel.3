Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B161A1090245
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sn6G42C6ms/Cda1VII3wEKGhH41j/ZPchSciY2v4JFk=; b=y1lAPCWW9KXf65o8EYqBAnT7R4
	sKx4jzLJtYvS0mVeY/kpdYsiLYcdlVvcfwoYbkAMKGnH9ySiX/7yE6Fr0XCyAxR0qYdIBaZNkGDRT
	R/yfanUnXLgUFicBrfuqF2Gd268fTRrfbQzS6xl5LeFgIOXLyOi0YxnbulPJ/22ozONIZFx+RUeHP
	qMwiqZNQ1hdmVh2UZB98FOvaFIuwBkLPD4aWCJfQF0l4eOpNA4yRuUWhPjDg+d9G6YfBWTvsuOrag
	ew3QeS0GX8wAAQ+Gyp7wwWruD+Mv9fcwSu+ohgyM+aesKQt64bkE3cFhpKVFcGrzN/GB27h0ujEu1
	tfGztvtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Faq-0000000AwNU-18nH;
	Thu, 19 Mar 2026 15:47:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Fao-0000000AwN2-0RsI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:47:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF30143C78
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 15:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CACC2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 15:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773935245;
	bh=sn6G42C6ms/Cda1VII3wEKGhH41j/ZPchSciY2v4JFk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tS/NlSKvAa7qYSbyogmwp7UKQP+DhxdUI2KmdFzwlwG/50YDtxyd4qUHAySbGfb1a
	 cissTZ98fHnVSdmJb2zXqt3iOR8TVBx2DOjhuJLjIzsfdDEr2yEjs0FStxkuYg9ijM
	 ATjqKiPLwrW/uenVCRVeZfx+vSLX4gvJKCEEb7saWn5ywwmi6KRbW65EluzfjGgJTQ
	 iENopa1kYS2KQ7WAdGM+rcf9wgbGS4szwgTt1P/mu0jKJsBfaS/jnrWgmNUsuWve7d
	 YyacUmGsRUFcgd4PyqJGwvKxCQBB6KV2FC3DkuZPuQC9ll2ucn3b6fsIeOLh3BEnL+
	 wB3ny/8yrq45w==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79a40fb9890so12918417b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 08:47:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkcWo7rSEexBfIx8B5DvKLJBfGRFyf7BJW62fCSLQF5r0q2PYWT85cItRy9Ig5NQUemR0E++EaHwP9eoKzP/QM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh9fNMYVRrOLySNtz0tzen5A00Wi+VBTSHCQQcdKoe3dMGrbVy
	4s7oR7TAnelHpVOW+ZCpezs/Cq2l8nnNZItco532MVxBRwklzAY1R0V6DyL5wblFDbhxPHqVMSC
	JPPdXJsYw6nw8quNIx0wwV1ScW+VGbnQ=
X-Received: by 2002:a05:690c:698a:b0:79a:2ea7:36b7 with SMTP id
 00721157ae682-79a71c5eac1mr75575047b3.51.1773935244913; Thu, 19 Mar 2026
 08:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260317-pinctrl_stm32_hdp_fix_dep-v1-1-3a6f6f02eb3e@foss.st.com>
In-Reply-To: <20260317-pinctrl_stm32_hdp_fix_dep-v1-1-3a6f6f02eb3e@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 16:47:13 +0100
X-Gmail-Original-Message-ID: <CAD++jL=pnQZ0JGCGcQ+onSNSoyDRGZNbF+Xb6fc4SRVCb0EMyw@mail.gmail.com>
X-Gm-Features: AaiRm53Xw7sQVazNFteoei5Van2VALJ94JUtdNLzjJjiUVYFFb7707DGpRAOz0A
Message-ID: <CAD++jL=pnQZ0JGCGcQ+onSNSoyDRGZNbF+Xb6fc4SRVCb0EMyw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: fix HDP driver dependency on GPIO_GENERIC
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Antonio Borneo <antonio.borneo@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_084726_166750_05679534 
X-CRM114-Status: GOOD (  10.78  )
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

On Tue, Mar 17, 2026 at 11:07=E2=80=AFAM Amelie Delaunay
<amelie.delaunay@foss.st.com> wrote:

> The HDP driver uses the generic GPIO chip API, but this configuration
> may not be enabled.
> Ensure it is enabled by selecting the appropriate option.
>
> Fixes: 4bcff9c05b9d ("pinctrl: stm32: use new generic GPIO chip API")
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

Patch applied for fixes. This should have been there all the time
and not specifically related to the HDP as far as I can tell.

Yours,
Linus Walleij


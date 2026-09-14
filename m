Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0335C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPH2yTaJN2+oSe3I3KJ+8QZMneaPEyA++eBCEmtFrho=; b=Q+A70EM5bp6iU2U7rW+6LvajSe
	0KmdCrzaSpfj3+NxpEZV1qqUu6WZFKhIuZBy+q9GKJu3ZNSsq+M57AI9/cG+3Ma7BpeRXV1mGsbex
	fyiXtvQm9d9/Xq5DScuetcs3kCN1+LpPRuOeRq4UlXtPEYHxa1RNMayLQllP/HennHnIfSCDWzQg7
	4fnoo0T86D0wExpBSb7L5vet9uLzHK0/EQAVGyxJI6kCZ6H3lwyYojjeH0hlvAJElQsZ8DosDqsmF
	PqLgan9/mVQlcLQsApBY4HU75zRwgkcqsVDIpn+L8ilKSRq9D8APDY747GQDK4h2VXNzyzlgpKyoB
	+TfIDlhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6E3U-00000004i6m-484C;
	Mon, 14 Sep 2026 21:17:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6E3T-00000004i6R-2EPj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:17:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AE21A60252
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 21:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6857C1F00893
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 21:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420654;
	bh=SPH2yTaJN2+oSe3I3KJ+8QZMneaPEyA++eBCEmtFrho=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fAA1t5PR6uytt7TO/+zRxHcBsR89bCEzrRFsItHVGQ9TxKajyM3spHG+5sijP19OJ
	 t1zWQodK7soN5keOj0OF2PDyPrLqTz3IIIVYVgyjyitTzxm6zqyCnQde7V0vQU6FDC
	 xuUQR0iZ7zWz1Tx5WUoUYh3mR8oOHyfQbDU7G3T15qFWH0szwx8nqwaWC49XlRhF8Q
	 qAWd7oY4Wyv4/8AQED7TGy+CDw+jeXMhyzQQuAfIVPkxEreL8GcwZc5pPBhSTMzY9l
	 rfMVDPdwNKQcCvQ+aMvWAErD138DKFtfRRZfKAE+1khUpRmhXGhlYjbKL44dsLMWlD
	 2z8C0hCDy4s2Q==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso293963e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:17:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzm+L+a6MjAKlUXIydHVgKLJkJf2uVrLIkg2t14366HoB4qVkZXHzizBu+43C3wD5YbJ5icV4gFmvBLrzSXkx/P@lists.infradead.org
X-Gm-Message-State: AFuF++nG/L8CmeOJyVdX8QuYK5WANd6Lsjj4pGLmQ4daMl0sfQul4PHE
	VeetQ+DJ74dVriJkIiIH1U3IhykGV23bnk9IAdaIfcAkaCEYTgZDIeHsdoQaK3YyixCun4Ohz/K
	wOxZnkoEQ0qYeOhvUEwvm1DDbkmj1gN0=
X-Received: by 2002:a05:6512:1053:b0:5b3:f8b:b714 with SMTP id
 2adb3069b0e04-5b8b2a8671cmr211409e87.21.1789420653140; Mon, 14 Sep 2026
 14:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260907-arm64-have-shared-gpios-v1-1-31af942ab30f@oss.qualcomm.com>
In-Reply-To: <20260907-arm64-have-shared-gpios-v1-1-31af942ab30f@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 23:17:20 +0200
X-Gmail-Original-Message-ID: <CAD++jL=hnRNYuGxe=T7T5aPQFve5wtD5qt5e6z7-kz92GiHpSQ@mail.gmail.com>
X-Gm-Features: AcwNN1XpyMYmDGh9l_sJ8JQBmfLBouLclcDrGavwm4fsBketM_Ew-WInKbZCshk
Message-ID: <CAD++jL=hnRNYuGxe=T7T5aPQFve5wtD5qt5e6z7-kz92GiHpSQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Sep 7, 2026 at 4:50=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Shared GPIO management provided by the GPIO shared proxy module has been
> enabled for Qualcomm platforms for some time. By extension of the
> defconfig, it's been effectively enabled for all ARM64 platforms when
> using the default configuration. Bugs discovered initially after the
> feature was first enabled, were fixed and I haven't seen any new reports
> for several months. Make the feature enabled by default for all ARM64
> platforms officially, which will allow us to continue the removal of the
> deprecated GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from the kernel.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

That sounds reasonable.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


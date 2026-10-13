Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C143CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwbHtHTp0gwZwOZd0t1ftlUDIs+ANxTV8ILN56eSQvE=; b=3FWcc5MFh7gQ+U1AB2Hgi/Vi6V
	xPkhkkTPW6b9+03OwvwgLMF88jtM+3sSTanUmNmZocQG85D2gH8b1sMcdlSkcqpco56VA313CdGr1
	oWcmUaG97peAHch+aLbn/o0a0eyQcsQp9PHqNDhxkBs2KA4skK79qRX8gxgcqVvx5AEKQC/febkzN
	BKZMNdkS4Yf0tCkJhkpwvNTBJia6hzt23XlZ7ueWOMP8Eu8gEcHthPFVGv+Kop9OpfEuPkdPuToop
	LpATBcbTWab+irHf+V6GuEu4g3WcQQ8jTUE2bSfU77vEa9RefqF5A4xE4j3927jukSOM6VQ4DxHJX
	eeqL2EsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcOi-0000000Cw56-2rSW;
	Tue, 13 Oct 2026 13:18:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcOV-0000000Cw4P-0ReZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:18:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8255A4369D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 13:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679C31F00898
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 13:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897494;
	bh=lwbHtHTp0gwZwOZd0t1ftlUDIs+ANxTV8ILN56eSQvE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=mUOf4h3UTtn5qube9iKl1gSQX3Hd7Zn+7Tu1HV/nDUxMzUVlAvuBYvicarfDusVgO
	 INeP+5xUHHB1UYpkhUKyS3dIPFzqk79yL4f8IHQIxZTpy5BgFxv8OerbErt/5ja57X
	 G3gx4dAoZcdEdUBWtqcjaAFIWHGZ9CoFcAvnWiu5q4CSrlMuZw9sneuCgEFTx19GK1
	 d07fkKc2QjC/JNcijoebWo92eB0SNzuKCo0cImuhtlTxaiVBOrdgFp5gtm2N4V+Dax
	 vX2DaocuVce6N+bCEtOhiqrsH/z0zZ6uh0VzH6wPp2iHnqXvCeV+mP5bUv6G5knwfl
	 vOenDnuYFI+eQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bb7ae22913so1816675e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 06:18:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw6+JENjzP8NfldwXzGy9RaLgU3KetzrbkPJPW0eAGZDqizYjcp3BMBd+9VW9zAhPzyI55rCnRU61zVqZKYde2V@lists.infradead.org
X-Gm-Message-State: AFq9FYKyL4QrJHKF0NZaCzk5r1PKc+hjLw9C60AozyF4BNU5yuBk/6aI
	tFl0e1KI7vpO+iJ9mzNQ9qFXRz9sS+N04+6nk+YTYBlGE7yqBgiAOiHLvCIjU3pcOqCiw/Kw+tH
	or4x8Eb0p/WHP2afWU9iJeojE1t14wMfChGKOvmUq/w==
X-Received: by 2002:a05:6512:6696:20b0:5bc:e47d:3ce4 with SMTP id
 2adb3069b0e04-5bce47d3d2dmr2367059e87.16.1791897493128; Tue, 13 Oct 2026
 06:18:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Oct 2026 14:18:11 +0100
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Oct 2026 14:18:11 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260925-arm64-have-shared-gpios-v1-1-57fed3fae35c@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260925-arm64-have-shared-gpios-v1-1-57fed3fae35c@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:18:11 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfJR==AiSOjaCFHhiY_nsp0LhNckTYZw4eGeDMx_c7SqA@mail.gmail.com>
X-Gm-Features: AclHuK8s4-NI7PYNkfIoRQUiKC4lZufEZRfgVawvM-TRXBlHCp205JIZBqlkoHc
Message-ID: <CAMRc=MfJR==AiSOjaCFHhiY_nsp0LhNckTYZw4eGeDMx_c7SqA@mail.gmail.com>
Subject: Re: [PATCH RESEND] arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>
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

On Fri, 25 Sep 2026 09:43:17 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> Shared GPIO management provided by the GPIO shared proxy module has been
> enabled for Qualcomm platforms for some time. By extension of the
> defconfig, it's been effectively enabled for all ARM64 platforms when
> using the default configuration. Bugs discovered initially after the
> feature was first enabled, were fixed and I haven't seen any new reports
> for several months. Make the feature enabled by default for all ARM64
> platforms officially, which will allow us to continue the removal of the
> deprecated GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from the kernel.
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Gentle ping. Can this go directly through the ARM-SoC tree?

Bart


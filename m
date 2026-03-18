Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFC410775F9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 18:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQ1x2ihDMnnywua4CVQQdfzwfLUYhJP99revvTgTk0o=; b=i01P+l3HcG4iOKCnYKe8npQUtq
	rCZqXXw2kFITntM4NXGYCbaB3XpP95rs3dzxm+QtVsxLEhp9xeMv+RQCXmR4I+QU+tnvYpReWlbZD
	MnhLLC/UqSyMKqELqOpGRLGQ0D4SV5Quy60sKy5bTwirHDNsLYtpagKyQRbbDi5LdwsuSjftzl3z5
	ryFWCWVhbG1MiTg9UWloukwTaz5YIN0fKozrqQx0NjksMhUC1WCVR+IhI4QrO7sPAUzwVfa0sNDFX
	QAoH44f0q5YwLqC/jV8RLOdEl0tADsC26BjTD+u8Yqy5p3nz6rb76vzUNutnAMKXFcrEOaRPfTzV2
	vUkZ153w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vVR-000000099ra-201Y;
	Wed, 18 Mar 2026 18:20:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vVQ-000000099rG-0P0C
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 18:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iQ1x2ihDMnnywua4CVQQdfzwfLUYhJP99revvTgTk0o=; b=LCKeDgJMXPkQxr/bBowyxXQkS8
	yfFb/5qW6ci8LM0WjfG3lL8ut4y86c58O6BseFcHXgY4CaBCO3KbfTjOs/ZB7q0Is8EBoAyCGPDAO
	PiY0hHMN4wxDpiYRPa+3mV7CRRSwP70erNluhrA/l511JWBzKzk3N5gGCvxdd8KiyxkOD7LUaHrdw
	EGXHmqTFy9EqfJEt/gYmc9fwJZ3JKoWarMPLXQHkkrMwzW0BmGRvrSPIPhRr5JxQSVPx0CiW08ndB
	b7qpActgiECKou83Q/jYIP+1JULVYDkL1SD5UXNfDypx9KFcEV7Pqkv+W1gPsNKhaHDI0ql2qTsqp
	ZZYbZjCg==;
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vVM-0000000C0m2-2RQg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 18:20:30 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a12c310e8aso150340e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 11:20:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773858026; cv=none;
        d=google.com; s=arc-20240605;
        b=juxJ2lxyqF/h04y3mdB9VOiwDptpOXBUsSqzgdesNDGhSwOGIDHfshVmwNIrkrkgkO
         bW++C3PbcazBOPhXkzVtkhdVNeadxVhX67Jji8b946n8NAav7Xq++4RxgAw0HlCtOa+v
         q01cy+fqflYbh3aYjFsvFc4L37/VqIYuyHAfGhiJaaRyNZbH/kplsJ98hYCE310neR3p
         CUBzRIYr2nVTxOBT88w2tYcPJVkFQ/Ga2vqyiXPF6JWoGAIxR7lPW4hWmO8C1tzZ2S/n
         jb/Qb8GEdeyinUd5aIoDum1lfpMPucUGDTQCo9141wpIFwdwOT0Oan4W/zk1Ixgk7Lv/
         AS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iQ1x2ihDMnnywua4CVQQdfzwfLUYhJP99revvTgTk0o=;
        fh=l6Gz7WT54KJZuh22DoZCCUc/7houdIwqTYk+zKKv3I0=;
        b=ZevdO5rezmhnjCBIDZOKiBkKVOJWk++GaA8j7PSf+B+b7+M2mnl+5EZCp3/QGMI7FP
         TIZviIFdIA3tbIwXXMbzseo26X4xcqTlDPtiNuZeU+J2N+JHzInGVAJy9EVlrO55Mm0f
         re3znjtd3ieDlRUBpUGPnlMcdFlVbX5m4uOteXWc8GJaZgfRJR/tikPs3GKYrggL+CgY
         wlrz9TiEgO+RRzuikytr75aliEaU/bP9h+k7PIj00x4Fqs8Yz7PUk85si8gonsgLqax8
         FZmCNPm5RBEBKRs95+8013PX2NBhGAK93ivO9D8pyxGxFlJnYOb8I2I2urFic3vbttQj
         z5fw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773858026; x=1774462826; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iQ1x2ihDMnnywua4CVQQdfzwfLUYhJP99revvTgTk0o=;
        b=VF3dDyzYvgnDLuWXrH47v9JtluQCwmeiFrtLGS9zaj4gKirLuTFQ4rMtRkWmouOxgD
         qRJrt/wfll6JgpIzEF5qNbcCDRyi2psYzkCpnXk+v5lnv+LFCJQUdMIaSKhrNU82Cesw
         KBfjti3MCVXn8F/LqDeKIYVy0YnBz1QcDgSzS6WvUU6nPNJTEK7tp19Ll6QkDIzBbm1o
         I6LRmUcNEDC78QW/9RhVU8XnYFhW6tRN0F0Ic5Z8JLyNwsKHtuOuMSR5SLaUF+UhqdLG
         VN9z6jsNueYYYgjjQoror8hdhgeguQq0+eO9MR1M7zEx12y+Fs/7EsGrRh3AH0R7MVV9
         S7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773858026; x=1774462826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQ1x2ihDMnnywua4CVQQdfzwfLUYhJP99revvTgTk0o=;
        b=edGGhYZLXOhOXZsI0KcoTsiPu4y/FL2lgRG1DGgVn3LUl0RShnMHLwDalO2tB29e5s
         JMqNj+1VMU5HLwU7vRbAylqexaii3FdTs9NrAVSeYCU9fwNpRG2jIDHi/MhOAOpB0WCs
         E/loO3KCv1bqsts7O0od+h7iBNsmcyYv85PeUDxKpKw0fK+Dk/i4q6FrYxQmEOwlpAgO
         /7MBLulkJTTDWcBnSGi6FrkW9qymzq1wg3i9fb6HqGo7ovkxzsqCSn373BjvxEGki0dE
         Pw23hOXTbU/gPROCebMXNjrlRv3Q/htJ4CsSkjEBwVhY/AR2fBUia3tZV19ovt6Jupm/
         uijA==
X-Forwarded-Encrypted: i=1; AJvYcCV7/6ex+AwIMcoPiDI5NNxDwFrwY6suPqANivS0bXarWW2Ld94zxh1I2e5e+t+GiiJiEwPSrV4vAz04Zkg0QKg9@lists.infradead.org
X-Gm-Message-State: AOJu0YyOzIP+3RNf8V8PppHIuEiE7+BJ41I/qT1sYKbj5Smt1L63F5y5
	N+6OL47vEqMra1FKVcT/22f4s/MfcNbFaH9AnvtxtTNnLGbpac0676HXDTFkKqle2HmorNOdK6O
	VhapzGAAnySreGkwiHhqR5r7EnAN5EDt0xFuA6Xc7jw==
X-Gm-Gg: ATEYQzyiPZZ7dPjF58r+OUmuu0R0xmIJIK/znoDs4cYSBVkuGhqfe+vYL/NLVZuuLrr
	Zs/qgnW93xwrp/INuNpMfyrXRKnniKvH5vibtu2q2xVQ2BRfHaNPfKcQhmfcZBgd05ZcDmZBuGo
	ipn1l3SHkhp4TfWsffkVhv63UzY6yfPnqW6EHbwX91RWxBHhnpUMkBUJqZ+M0jMI7o6aGwSQnY4
	NUbSEba6zYLonorsOkIJxDVIgPL/9DmaoZP6JJRvlMtujY0bFfkimlnkJQC3FZCvGwBf8W0BBXC
	EAvIx86u
X-Received: by 2002:a05:6512:24c5:20b0:5a1:37cd:7f10 with SMTP id
 2adb3069b0e04-5a2795903dcmr1158473e87.10.1773858026058; Wed, 18 Mar 2026
 11:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260305-b4-pck600-a733-v2-0-ba6bbed7d253@gmail.com>
In-Reply-To: <20260305-b4-pck600-a733-v2-0-ba6bbed7d253@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Mar 2026 19:19:50 +0100
X-Gm-Features: AaiRm50uzOde_q8t8Y3YJeSNhx4Hb7KPrmeaUA5JiLmoBH5vpeZt6VfvtJkYLuo
Message-ID: <CAPDyKFoo7HXuS1OQtt6Ku4O23pvFOvaG3g1_N7SPV8uB+ckt-Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] allwinner: a733: Add A733 PCK600 Power Domain
 Controller Support
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_182028_761398_EAC99687 
X-CRM114-Status: GOOD (  18.21  )
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

On Thu, 5 Mar 2026 at 04:34, Yuanshen Cao <alex.caoys@gmail.com> wrote:
>
> Hi everyone,
>
> This series is to introduce Allwinner A733 PCK600 Power Domain
> Controller.
>
> Allwinner A733 has this one power domain controller, PCK600, which
> shares the same BSP drivers according to the package provided by
> Radxa[1]. Unlike A523, A733 does not require the resets, and it also has
> different delay values. Apart from these, driver wise, everything else
> is the same.
>
> Add support for A733 power domain controller by making resets optional
> on sun55i-pck600 driver, adding A733 sunxi_pck600_desc and dt-bindings
> definitions.
> Tested on Radxa Cubie A7Z.
>
> [1] https://github.com/radxa/allwinner-bsp
>
> Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
> ---
> Changes in v2:
> - Fit the pd_names into two lines
> - Link to v1: https://lore.kernel.org/r/20260304-b4-pck600-a733-v1-0-2f54efdb8cc2@gmail.com
>
> ---
> Yuanshen Cao (2):
>       dt-bindings: power: Add Support for Allwinner A733 PCK600 Power Domain Controller
>       pmdomain: sunxi: Add support for A733 to Allwinner PCK600 driver
>
>  .../bindings/power/allwinner,sun20i-d1-ppu.yaml    | 17 ++++++++++-
>  drivers/pmdomain/sunxi/sun55i-pck600.c             | 35 +++++++++++++++++++---
>  .../power/allwinner,sun60i-a733-pck-600.h          | 18 +++++++++++
>  3 files changed, 65 insertions(+), 5 deletions(-)
> ---
> base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af
> change-id: 20260304-b4-pck600-a733-1790e0e48d49
>
> Best regards,
> --
> Yuanshen Cao <alex.caoys@gmail.com>
>

The series applied for next, thanks!

Kind regards
Uffe


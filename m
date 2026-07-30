Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E96DC55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 11:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWIEEQjaHeHJ5fxTgr0YOB4InTHJrKcidKplWWfbj8A=; b=v0WCdgTNrcsdSSG8Fl5i95eQM3
	bubqfMwOXDEcgk6+iHoghy8X8BL/NgqWU3F1g0189Q0D2+kUSrWOr3BhMYoE9KYcEkt4WMX+y680M
	sWnD6dIB82GcuLTleZcodjMa+Aw4iHJLM7wby7UEoiG/inlnsEgztN34LSD3aJHSS9qrPjTO6e0vX
	REkUF4jdG552Ml+RYjrD4kTGaKTNXZnoL8phURVHYTAAmStOIcJo838dKKW6aep4qEaVqTao90g6g
	uKVkz+BoWurIGaAJT1XSXgyIFtWfs/U4L7ltec/a0Y9DTfwfdHjW3vEU3yg2QjbX3gEanhqfUN7zC
	n1Y6n/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPKz-0000000AObe-3EJs;
	Thu, 30 Jul 2026 11:54:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPKx-0000000AObN-3JAL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 11:54:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BEB3409B1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 11:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED711F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 11:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785412447;
	bh=PWIEEQjaHeHJ5fxTgr0YOB4InTHJrKcidKplWWfbj8A=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=cbouM69YhwFY7cVqNT0XzrbRgTNiiIO9oCsC3AYShqoH7eLFVreZvRWImtxQ1uQGi
	 UJqrHNEGxO6LRIRVVnWkk+fY2Ej7dOdlMFQuZunHjhkMP0ba5p3Jyr4Ub8chJtYoQi
	 SbPZrgCfl1jDJmPFMinCryZXIWpr5pM3aIrpgfyDkMxtVCPn6mJEJhxrfZOyyAhMxt
	 k0pC3ikW1cuW0DinPbGsdykwhYkPxYh5w6YG2OPdbxXMe2e93h8MDbGfftToYppNr/
	 n5H0hBBnqk9oRdYxx/QqtVRfZQdI04Plu27MkrHZxsHe5DqGrRLvYJ8aNJaXR68m+B
	 EadthDyHKAwYw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b013084dc2so1681064e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 04:54:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RruksaJZSJBIjBDsZZYgyXtSPKrZb2+88SAXW0C2nsawLeBUoL+e3AyRuy9Fc26GqQ9p0BgUaZt9TAVekq3NuIh@lists.infradead.org
X-Gm-Message-State: AOJu0Yzry+1fnWBt5qgj4UXQLCRTa6mNUiW9rBvVd7eZPQSM7s+RrH4K
	O578tE5R0EZ2HxSEfqKnQzNnYz6BYECncokQls82PLzfTd+QiG4I6G/+f4WVCnGSOCDYJZxyqWX
	rFcMLJbnjC/ocwyTHvzmkqk3/le1VE4X0Pb5x6XBZzw==
X-Received: by 2002:a05:6512:6690:20b0:5b0:197b:9811 with SMTP id
 2adb3069b0e04-5b2db373c5cmr282662e87.53.1785412446192; Thu, 30 Jul 2026
 04:54:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 04:54:05 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 04:54:05 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <30b3f278a10b46252783458c81dc438df176f86c.1785405882.git.chleroy@kernel.org>
MIME-Version: 1.0
References: <30b3f278a10b46252783458c81dc438df176f86c.1785405882.git.chleroy@kernel.org>
Date: Thu, 30 Jul 2026 04:54:05 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfmpq=Lb8yUqUAdvP29VzXO+FzF1m995Mwsh+dnnW6f6A@mail.gmail.com>
X-Gm-Features: AUfX_mzScc3M9rGBw46jkrwGJk1nYV1wT2PFySG5uBLlIaqWgjEfkCdTsW4Lf0c
Message-ID: <CAMRc=Mfmpq=Lb8yUqUAdvP29VzXO+FzF1m995Mwsh+dnnW6f6A@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: implement get_direction()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	RAGUENES Jean Noel <jean-noel.raguenes2@cs-soprasteria.com>, Qiang Zhao <qiang.zhao@nxp.com>
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

On Thu, 30 Jul 2026 12:09:40 +0200, "Christophe Leroy (CS GROUP)"
<chleroy@kernel.org> said:
> The lack of get_direction() callback in this driver causes GPIOLIB to
> emit a warning. Implement it.
>
> Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::get_direction()")
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


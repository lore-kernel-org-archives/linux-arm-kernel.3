Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D7CC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 07:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnDfjy0gxmr2Cbj6LcfLZcNzLV1wsZsbYNBRZJUebR0=; b=n/QcKrDBxm9ZK+Jb5yHoE8r4Qo
	23U+R7TDHJVXKmDhd+9a7BRxgdntolBFtqv9CKMqTwDK77gKwdgoBTScIUbVSeldMzz6hoquLQRt1
	IUPbuXtX36rcPzKUQqvTlIqTrmGcNGpKZTtyilnuZpelauPmV2ZgOYFU2iVVf3wwbTrA8oo/ugK92
	jQEWHTT5pmhnvSAaynUX5VH8Zy+8rVU4jFXXIM3OjB41mNDXGHrNHo7SFWB+Nh43I2u2S+CxTlyzF
	lR1pk9hYGOky+VoOnS7YhC3z5M+tDfdszIs6JllTltpo6nmScOeR6RDZ5XeNxhdB6w7B4X6wALz99
	mvjqwE8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woz0E-00000007A2t-3ZJY;
	Wed, 29 Jul 2026 07:46:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woz0D-00000007A2l-1wJB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 07:46:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A46D4379F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 07:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FBE1F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 07:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785311216;
	bh=CnDfjy0gxmr2Cbj6LcfLZcNzLV1wsZsbYNBRZJUebR0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WGgyo5g0P6oM+zvZ7jMoAzErZdJUVVjpA+j8GT/Q/LYb6QbknoBCh44P32vpS/wig
	 1JQdITrCnegvoQ9VOtpwyz+SWxd2AwmpPBBSUipobSdVUo5qOa+F+o7FsmGJ1I6uVi
	 SB0Fw7f3OiMDr29m33K5RbkjHLfpk7+6CWaaGMqCS7zdgHGJZN8VDNdScRuV/r89aj
	 TbnDkkA4hHl5rkgMShmuwEYdiXXP/o4wmTJ3r3lN+KYl+2Tq92fZTWFBI8YEK+f31T
	 pcPG5co9FMGSJHrSErxRam34rpBECpzoEFU5eAOk2OXvnsiUaClriCU1dHlkKJA0/2
	 qxagxr6IFp1PA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so758160e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 00:46:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro/7Zqnks5stTRXuCgDGSH2igErkM9kdKeKrtBHZQ3lixkqcgvwq56NksO+bIGnlZcFAetPVG2WSwsy5IDJIQwT@lists.infradead.org
X-Gm-Message-State: AOJu0YwxRER5NL54krN+xWwIBdkVZgzyrsWgxo1bi8dJxX62Cp7GKhzm
	9vit4Nea/buUxLpS0MPFXeLCczIPDMAEAusFbcOGVIIgGSUHXKF317d26ldFsxEOOQkvKpLnKrg
	2DHQueenxX6ccn24rkAc9F8zqGPj/oos=
X-Received: by 2002:a05:6512:3d28:b0:5b2:b7f2:f7fc with SMTP id
 2adb3069b0e04-5b2d0274201mr1124477e87.59.1785311215686; Wed, 29 Jul 2026
 00:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
In-Reply-To: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 29 Jul 2026 09:46:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLkRsHTL-vy0BcKL80onEocp3Js7UKgx=kKqFn8DEH8H8g@mail.gmail.com>
X-Gm-Features: AUfX_mz6x0cLcw53qb2d4v30_RvCZ1PIlNE2O6iglWvSmm_YIQGxQudd43yM1KA
Message-ID: <CAD++jLkRsHTL-vy0BcKL80onEocp3Js7UKgx=kKqFn8DEH8H8g@mail.gmail.com>
Subject: Re: [PATCH 0/5] Support zinitix touch modes 0 and 1, dt changes to
 Galaxy J6 (j6lte)
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Srba <Michael.Srba@seznam.cz>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
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

On Thu, Jul 23, 2026 at 9:24=E2=80=AFPM Kaustabh Chakraborty
<kauschluss@disroot.org> wrote:

> The zinitix family of touchscreens support at least three modes, called
> 0, 1, and 2. At least some digitizers (including, but not limited to
> ZT7548) are able to support multiple modes. Currently, the driver in
> linux supports mode 2 only. This series aims to add support for modes 0
> and 1, accompanied with necessary architectural changes.

I wanted to test the patches on my hardware but didn't find the time,
anyway it all looks fine so it's OK to merge.

Yours,
Linus Walleij


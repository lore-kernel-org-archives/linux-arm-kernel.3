Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DDBD2D8C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43+5PkYSSLecE9SQrt5AZOxblPUn6fLI2obB0pdB7Rg=; b=Ck1DWFkrAyQZGVfg/+23GQTAjc
	MjgvCsXrm6VpO+ZjOJx5nJ4dXobv9L7C/Zstq4ZZXMwsVUbtRdd2UtVIzAmhjfisxZOCrsr7jvme8
	sHX8jTVww5f55MC8ML/OlkQ7DhxkX9i7Nw9FjsFP7/FcuYB8q2zo3h93hhD7MRS2LVhZWhDSFxHj4
	/uCYkiW7vfQ1g1a9lScE/kQRYDmwpDqL+hhHkksqu6Ix+3mdtsN0FKSMXPTrZeli6O92ixrSVQiGq
	j2if1YBH30ngY2rfjiBXonqton9srq7dfLnAKiw3eWlhFweFkiD9QMPtlXSSaauctil3WgvoFTug2
	1/O+x5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfbv-0000000DypN-1ndB;
	Tue, 27 Jan 2026 09:43:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfbr-0000000Dyoo-2eKF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:43:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ECE2444255
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63C1C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769507022;
	bh=43+5PkYSSLecE9SQrt5AZOxblPUn6fLI2obB0pdB7Rg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=natD1mSetH8Dli+imFjbLI90gUdb/Uv762wLtvqt4msRA8kIpu+wi1zlQ/E1mLo/p
	 PpN9ufEgR+Z1bka8eFPaaifhWJcdtNZxjytv8QNqgAlrUCXi6s+msBLJfqPaa4nPo+
	 m02QBKjg5EEqKlLS3may3ZtWyYl4g0/uGjoz7nMvS74PWR1B2egQU4udeLA3appSOx
	 c6jczh98DgRCNdn7hB/8mdsFo9lIVFDW/C9liBwPoPXrSzNzZv5LzbEUbc4+yGtdRF
	 nkWZjUjvcto7yX2g47h92jC4C4MgzGnOwgPbi5rCem0DLV7bBNXFYZq7+J1A8Vyn4q
	 AR7BJkpfnIelw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59dcdf60427so6453567e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:43:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXQvCot+MUtfO4qNIE4Zu82iAcTUA000tOKngsdZBNezTgYlbzRKfAe4tH6bKjyra9ywG76o/X591rN4rDuYK3V@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkj8Pq0hg8NSgvltuAb3hwEZW3n2P5ssbUDET5l2C6xt06yUYa
	+u1M0/7iyeke3IC9UsGMAffzu3paq6jgBMf6IhO9R4UukMee3mCdh8nByr62rjPc8QhSOrkNa0H
	WV7z+w1ESXat5/50h97copLRVvUDDIdKlkoYbTa2pOg==
X-Received: by 2002:a05:6512:a8a:b0:59d:d64e:b3d7 with SMTP id
 2adb3069b0e04-59e040343d1mr474018e87.46.1769507021467; Tue, 27 Jan 2026
 01:43:41 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 01:43:40 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 01:43:40 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260122-sound-cleanup-v1-2-0a91901609b8@nxp.com>
MIME-Version: 1.0
References: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com> <20260122-sound-cleanup-v1-2-0a91901609b8@nxp.com>
Date: Tue, 27 Jan 2026 01:43:40 -0800
X-Gmail-Original-Message-ID: <CAMRc=MfDP0PHTm9_vzSArVr7APK7qPiqZQERkPpBFKoPQrw2rg@mail.gmail.com>
X-Gm-Features: AZwV_Qh39_2kP-cSLOqOUxaAXibtQvi4PDbgUOq2L_s8-r1mjDdVrjD7WkEZ9LU
Message-ID: <CAMRc=MfDP0PHTm9_vzSArVr7APK7qPiqZQERkPpBFKoPQrw2rg@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: codec: Remove pxa2xx-ac97.c
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Peng Fan <peng.fan@nxp.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_014343_687220_038A98EA 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

On Thu, 22 Jan 2026 13:44:58 +0100, "Peng Fan (OSS)"
<peng.fan@oss.nxp.com> said:
> From: Peng Fan <peng.fan@nxp.com>
>
> With commit ce79f3a1ad5f ("ARM: pxa: prune unused device support") and
> commit 2548e6c76ebf ("ARM: pxa: pxa2xx-ac97-lib: use IRQ resource"), there
> is no 'pxa2xx-ac97' platform device created by machine level code, so this
> driver could be removed.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


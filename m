Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30393E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8hZa0shBeOvBBhYcCnxg3/TvPld1ws9Sgpa6d41cfU=; b=REKhLQPvEVWcxSj86B2tCAXtUO
	uzFyPqEYJURRukHyGlb2Vc8EmAgNP2u36f3i4T6VRtlUuhOjQP2F0DzcLCXD/s7AHNl/neWDbPmMu
	JCo/NL7gS7/kgK9rsz6by0KJise89o7SADOZk9cSe3wqf6LmjRYoILB7b0Jdw4kORFoNncV+PSW8T
	PnBSFFDUEUqvESBZGQ5QmJAAbRYuxTQssjR9OkTK1q7yszI1Iqm1uwgqH/9A5tumqvcvPtSQrGk86
	88xQ7HZu+ONKCMPEUj9KgVSY3WveiizWHps/BiWpkv/iLOyGza2MP3xE1T2nmsRa6HTCfPJlKuRMp
	rnx7Msrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNY0V-0000000Ddy4-23JB;
	Tue, 17 Dec 2024 13:53:03 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXzQ-0000000DdqA-1t27
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:51:57 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54026562221so5448370e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 05:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734443514; x=1735048314; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8hZa0shBeOvBBhYcCnxg3/TvPld1ws9Sgpa6d41cfU=;
        b=cVro4A6aq9lMasH5q+Gkh9Fb5+Rw007o+ZDEiAc+efwde7il5cBb63U9RKGWmjxmeF
         tfKfoewIE1QxaSSloMiUbD3XmluVNkjVHNueDiGf0v8oSYz4Ll6MH6Jx/Yott9yG3ZUk
         otCM8HXEC10EVaBhJqpk6A5mH1hX0ZDZKMubBuzQNPE+FJ+ytELVdV/BETKrVqOiEfJ5
         zAaET+TZfhJsnMjlYWbsD7FwIFYUM6K/EJ68qhVYeOgHeFiZy6JNErnQhx7XQlkWMYa0
         OQUXiyo2JSFz7sD7CWRsjocjpHz0GoDG5umLjDk7m8/hLJ6WyURHDy4frn0t+PvprsLb
         ojPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734443514; x=1735048314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8hZa0shBeOvBBhYcCnxg3/TvPld1ws9Sgpa6d41cfU=;
        b=mmtoIU02Vj2mV75Wq6TCbuoIZaDl3Jy9X5GuEdvkSZ5Xi3abk5SQAnq+41BYK/qB+m
         ibsSwTrKQgttw7P90SBx9L+hIhk+W3K7nQ7gXg+VMwCizjZLbMqyXDuF6P59kgXNvM8t
         thlYIKk/wxge0UqiuQ3iurZwD7b8Ut2S0n18FMOCz2uOw0Zmc7i6GhG5DaI89pvZVslu
         HmvU9H2tqNb/XxHpt//hvKV1nEoFYwgUxXyqgL8944X/G/QV4nWCBXOV/8ka8VSsZJaA
         jGDcMV+pLoz7MPGGAU6EX5/9xoqrFhO9Md+BqiAivbIUKwzmoaWAmjj6AxGw6oISJb4u
         DLNQ==
X-Gm-Message-State: AOJu0YxebFRnAl9jDRIeQvKdCb//559XGRxYNQGPk5MdcXyrO5vQlWxN
	56mPmRDdI4Z/GXztJSDblhtDhBgrPgXIcujxnIiSqRG5K16+dPudYBl+23k9NtMCk9eSo4mdUZS
	w29nYCbHSN+417p5rJLBbwMkj47kU3mgNAsv47GWl+0Tyg1r/FEM=
X-Gm-Gg: ASbGncuYkOAGo0qAOUM8d8tLoLK1v0PfV00GDbaBLNht79wEJEqUJdcenGjY3Z3BGZZ
	USobYJewxC86p5euTaKLAXR+D2vzr/9Ctb1uhpw==
X-Google-Smtp-Source: AGHT+IGEoFk2/Y9yrHF2fZnMacxBmdTscNpmAK7EbqwQBtmcHIHv87leDmZg8DYb1oBejBKphi50861qTul7AFls5Aw=
X-Received: by 2002:a05:6512:4005:b0:541:1c5f:bf83 with SMTP id
 2adb3069b0e04-5411c5fbfbdmr5399848e87.35.1734443514494; Tue, 17 Dec 2024
 05:51:54 -0800 (PST)
MIME-Version: 1.0
References: <20241205042214.2410982-1-zmw12306@gmail.com>
In-Reply-To: <20241205042214.2410982-1-zmw12306@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 14:51:43 +0100
Message-ID: <CACRpkdbcn8FD8v8PYv9g5JObC3ty+6xvKKCpS2uc3WKYXcmLiA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_055156_515216_C06A6852 
X-CRM114-Status: UNSURE (   8.43  )
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

On Thu, Dec 5, 2024 at 5:19=E2=80=AFAM Mingwei Zheng <zmw12306@gmail.com> w=
rote:

> Add check for the return value of clk_enable() to catch the potential
> error. Change return type of nmk_gpio_glitch_slpm_init casade.
>
> Fixes: 3a19805920f1 ("pinctrl: nomadik: move all Nomadik drivers to subdi=
r")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>

Looks correct, patch applied.
Thanks Mingwei!

Yours,
Linus Walleij


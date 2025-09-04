Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA484CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wWeqZDwihsnWU5fR8qAMJR8kBNuhg+2Et/0lB5o0RQ=; b=YWnpvJPX/wGPZD0+iPIv/WA7v+
	T8tVOllB0NQMvuOzQ5Y189xXNZ0oFpKTTIqqsNhU2BBIpXQEmW6c03v9DlnhZbz7XfzuDwMfEgx/4
	slnCtGe/x8jaQG0G2ykBbMwzq+j+q5npc1UmFwOn3i1yDPqTVNoacxT/I4fsRnvqbA6/sKpZIDP6e
	yCiebSF4oT83vykpcoRbLIHe3OlRjfgUDdcxg8BQZXM4syI03d7SCgoBwCgyHzgGBkRl5068eTNVC
	uoxLnBoggdS5ASKxaNlafkTyFGkgn/MGWE6rfyq3S31rvF0o91M0RglvyI/JTJBIjoc3cJ0YuslRR
	4cKyndrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM23-0000000G0A6-3vUO;
	Fri, 05 Sep 2025 02:18:31 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFd2-0000000DuMR-1X8e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 19:28:17 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-337cc414358so13098241fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 12:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757014094; x=1757618894; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wWeqZDwihsnWU5fR8qAMJR8kBNuhg+2Et/0lB5o0RQ=;
        b=Qnnfg0ZmGxhhpJ2n4UxapPoIVxhZgGDSKax4kDSWQ4BFgRrUnaIAIxIQX+gMaqedL4
         KL/NO8DJGxxMORYEo5+T3p3Eb4r0fThiJL02HSuWmSKdvmDQkPr7qYUOPrFU1eirDy2S
         LrvYGaiOmVvMdJmBatdnr2Hg4gce+DyyZWl3DXZaiKE+fUOPpkzgT/5gXpVnVwV8YjYP
         7Fc5lw5rN5zctZQAEnYglOI+Zmk/N15xGkjAsgZqBqRVfj5ZsGIoNYC1cNrzdB9zGJnW
         7/a01g8r3MgWb8/MkryAUH/HXyF2JmhivK+4NzqTY+dORJw6OfW5srrajzBqHjyKUQFE
         P5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757014094; x=1757618894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wWeqZDwihsnWU5fR8qAMJR8kBNuhg+2Et/0lB5o0RQ=;
        b=DitsbzUxNVH4eUuRIlfVsKwut2oGVF3H/qGEShSE3rWBmQy6aOft2beMjIr1PwvIHi
         /csrefPvH3zTUDdCwfYGvOANa2h38t0uj3E8dJxqaYS6ksFjFPFJ1UJ6MQB3eVPtzEZS
         wtPacrpOhZgoDjGJ9yNurQxJE+wHIQU+4bDMeECh/hWjxqvZExmgdabXzR/c4+ngCMCZ
         hN0dWdIvwQ+EztVtPjE3mczpbqlIyI0RC7Wupe/ruFQ1XDkYEpPsGORp2k4pQB2+2r9Y
         SiQ4aFF26rvhlNIvD7+yqPjSZPER/77sI+p1UKG5KSLQXmOpNE/+x6XJEnbDNAKzqZzN
         xA0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFiWv4F6uBr6mFY5BeH6uUaq0N8+QUHARIZktLbd7JHhZcQxBG8xHDTta6IHNdX7EkZDjjvt6BFhoJyX+w1QTe@lists.infradead.org
X-Gm-Message-State: AOJu0YwmysvSJforczNZNZBP9PZLxUnxKfc2u+DUZdr+7M6emvOODhNT
	TA6f6KONqdrzmKEqjbebk+5F2SCJxy28vz5fB70gN2WPhk4iwoZTkc7MZZ5tSTq5vGH+TtwTCOU
	LIgfhKhdP5NLvIh71LqgWzsZM1HSeytImV61vt4RlB6Vzx22+MIFD
X-Gm-Gg: ASbGncu0CFTuIIHAdDo8DfeXpJPczpBlvieF45rslPj+Fkt4xS/5xGN6m/ZB1ihk8Ou
	Wyc1VXcRgYla44QwpjnGXKUfrEV+D+WKENLicOs2DMKdT/DymJ9XDYthhTgTob9p9jveXcR1w6E
	SHzvFzepqbdBXrjD3yrPdKNlJ5KHzrnmtG1OUHbnAC2snyDwY1bxrFh7fh6dz/Ux38RL2o9+5dc
	+VMKu1CRif4r5MPEQ==
X-Google-Smtp-Source: AGHT+IGZAJ8b0YkPbJI6nwB9uPLeNgs9zpFxiiAnMFlzG1hMkafUbWpHwREF8HCDungZg0gtUMcuWAk+xx/lpSPuMFA=
X-Received: by 2002:a05:651c:199e:b0:337:e4a0:ccf9 with SMTP id
 38308e7fff4ca-337e4a0cedcmr45750021fa.6.1757014094390; Thu, 04 Sep 2025
 12:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
In-Reply-To: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:28:02 +0200
X-Gm-Features: Ac12FXxWk1sRNmIPIFT74qDA0maXJ9q1kB4ftn-8phhL0UCY2e53FJ6aUC-84vY
Message-ID: <CACRpkdbJ--fMu-io2ryGu3QBY4EuiR6Eya4Wvor4-wb8QZrimQ@mail.gmail.com>
Subject: Re: [PATCH 00/12] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 3
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matt.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, 
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_122816_416234_D4EE106D 
X-CRM114-Status: UNSURE (   8.56  )
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

On Wed, Sep 3, 2025 at 10:00=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Here's another round of patches converting GPIO drivers to the
> modernized generic GPIO chip API.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

All of these look completely fine to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


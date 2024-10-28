Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0398DD5B845
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 22:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYLSk03sy13DZ5QB/3NhRsbKu0MswGH4SuUJv0OP7+4=; b=4sTEqz0JaTRLjJ+ZlzrCZYgaru
	7QD31v5l3i91FGqUerfkxhQEvFZjtP0Ksf6D2WLbQ2Dk7gysc1ZFmCXOeKvLHU4Q0U1jJIfPVfP+c
	6ihRqzB8ik+VA4cYlFBxzmX8p9ZYCYnM+ZElqyPILB6WEFnGozBrjwRECsUlBeRvbwLzaST285NzJ
	t40I9gRzlwS3mVWYdW+3JOeLt5XNlr78qAoFC0O+QmHGp//bpPLTXMJZvjeJI6DjPX7uHN43bq8hc
	UJHHiGrRRvnoZ7s8McEQS6iikT9vhYgbvVknHkDS0YEbUt+uKqOW1XBNvmgXvhhe8KsMDMfWOnPJm
	pdIC3E9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5YVT-0000000CYwr-2vZI;
	Mon, 28 Oct 2024 22:46:39 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5YR5-0000000CY3C-38Kv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 22:42:09 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2fb3debdc09so37349601fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 15:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730155325; x=1730760125; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYLSk03sy13DZ5QB/3NhRsbKu0MswGH4SuUJv0OP7+4=;
        b=aBb1b/stfod6hTlgrqMhVWrdTzIpHZepUAJPHXFBZl9PTcPZXCDV+G01hkVPGJXuDw
         WSFVSdoCwKWrXE9lOQRYZ+TAn6OfoxeDly4xCvYE99HWwy0RDgFMvX6ECiE5WzN4GFPY
         bNipujHAA7efRPUO5M9f3RSKxDydOu0ki2cwedht4DuoahAHe52XUQjGaSidHTXIRnCf
         e+4DczxYKx1kryoslm4Ktg6Res/eohFvqoI+Q1Nj7FzQ4rozFd5VmARZnXGGT2xi3wDR
         BPAPiBGQslqdeT8GM5TTaEnRWJWSRGFpHXIKYmW0Q7o9Yj2dqYuqdYQKKE17WS2el46o
         0B5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730155325; x=1730760125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYLSk03sy13DZ5QB/3NhRsbKu0MswGH4SuUJv0OP7+4=;
        b=ZlSt+HpTA9fvkP3jXq93h8A8Pp25J1UBMxEqX6C6hryAq4yGU3OyxRRT6j6B7wzDtE
         gkt0W8QuY8ouOLVPf58AiDbv31fxLXlonF8WL02d+9PD0BPvXrM5duvxjeKi/p47FMDR
         YavqLGmdiHz58mnua5vFFqpSzt2f0vR+wdeb2Yurfqa7nZHdx27ImJohGL81bFF0FNIM
         8yKUmxgE69s4kRXg64NEhPjm4khGsmHD5juTcAef7wRrR8qg/C0RPhSqW5qW6VuGY53D
         A89Jdc9W4Z5TC3d+8VZ1VWlXoRlCFjeS/GVWcq3vlcpUtIQgd1ohyF1LgpUHThZUljlc
         xLUQ==
X-Gm-Message-State: AOJu0YzB8CiaJO+tqAAMJPdh363NJtz+xKK3QJMFkH8903EI4XgIsjWv
	Z5WeM84b/pfLMWM+r7B59ZGBLaGU67/KaUMk9Qq8AJzDgfi8cQ1eP2H5jq971pxy04uxu2Y0boH
	SBaLr84eqFzo8d6XAn6Yn1s0rbt8PWOOu8w7V3w==
X-Google-Smtp-Source: AGHT+IEg8JVfjXJd/ucT4jDduwHOoGxeFrwMNbyZhgEQKzFwgAbPlV0NnwUmDCq5NLL+EdCc1bSUIXxZA8jFl12JEHM=
X-Received: by 2002:a2e:b895:0:b0:2fa:d354:1435 with SMTP id
 38308e7fff4ca-2fcbddfa6admr39806201fa.0.1730155324821; Mon, 28 Oct 2024
 15:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20241028-comments-in-switch-to-v1-0-7280d09671a8@linaro.org> <20241028-comments-in-switch-to-v1-1-7280d09671a8@linaro.org>
In-Reply-To: <20241028-comments-in-switch-to-v1-1-7280d09671a8@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 23:41:53 +0100
Message-ID: <CACRpkdbo=raavMALT4JtFG7L_kT5dDdH=E1KGCG3Nu5L5NahOg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: entry: Do a dummy read from VMAP shadow
To: Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Clement LE GOFFIC <clement.legoffic@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_154207_839812_7F6B2DC7 
X-CRM114-Status: GOOD (  12.55  )
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

On Mon, Oct 28, 2024 at 11:39=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:

> When switching task, in addition to a dummy read from the new
> VMAP stack, also do a dummy read from the VMAP stack's
> corresponding KASAN shadow memory to sync things up in
> the new MM context.
>
> Cc: stable@vger.kernel.org
> Fixes: a1c510d0adc6 ("ARM: implement support for vmap'ed stacks")
> Link: https://lore.kernel.org/linux-arm-kernel/a1a1d062-f3a2-4d05-9836-3b=
098de9db6d@foss.st.com/
> Reported-by: Clement LE GOFFIC <clement.legoffic@foss.st.com>
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

This patch is already in the patch tracker in it's final form.

This was not supposed to go with the other patch, apologies.

Only patch 2/2 is new material.

Yours,
Linus Walleij


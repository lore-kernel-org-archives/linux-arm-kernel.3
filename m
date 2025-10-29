Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF3ECCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frTWN0cj1Au3rEU4gpiwgwDW+TjseVAAzDE0208pNEM=; b=rFEI9fI5N4eyfY7u1YnLftEX7D
	tVgYfLYd9ClqG9lDP5pmPKrom4qbyko1DDD/vVddJLrsVNhw5Y19Z2i8ZuugdEo4oyXlfmG2iq5eL
	Z1THffSo+7I1XILFUArq8ReqeCm831YX5Bd3CECa6RFWN6P1KWN+k36uHcRhQ0JXlwa2VRgfTbdAC
	LUhuS8K2xis9SWT8lxC8JqapTbAq7GkJSeTxCIGrA+2eanvyJnS6qr62ZxPw6k4AgzcI5w4rq30Cm
	N4qorfJOKJm9bxj2+FCy0HalhGXIc0V97fwoHAESsNBJwVHUYCgE1OFvDEOTUyHa5eozJmhv7Vath
	NF4kUipQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE707-00000001Xid-0Qbn;
	Wed, 29 Oct 2025 14:18:11 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE703-00000001Xhi-3iRe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 14:18:09 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-362e291924aso60255661fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761747486; x=1762352286; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frTWN0cj1Au3rEU4gpiwgwDW+TjseVAAzDE0208pNEM=;
        b=pl2Y1WL6293TuQVQWQOEo3kd94FTryfq7aV1KJQOQefJtzJx/sf+607EJVLVwOZGw/
         MnjPOjwQYULQMLQYe9yBEmkh2LIWFJSyPzEU5Jpc8f77h+4m8xylEAYAFNrsA8jofWwd
         /nMF7GR7S49DdQwCQMJOnC37CBI+duXmkYgZ7Iorx0GhPd+VxBUbL17PiH6l9zAPqeTp
         MA9RcFd7pZD/Y19qiIKIXGWo1bGpfc8y8vI+w5P5TPwg6lF85To29Qks4NstvJDkURjq
         ms3lng0UbJAtGqTfviEpih+R5W4ZLOD4tI1O25eVF51p6wfG6kTEsAwDwmVXeMFTWrBp
         Zb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747486; x=1762352286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frTWN0cj1Au3rEU4gpiwgwDW+TjseVAAzDE0208pNEM=;
        b=IF94Z9Lmu0cpZ93v0wtNcaTK6y0e4nFf+/FITEVgdNoAtkEK7AW8Ug5XZmZ7B6Sm+Q
         UENLm0FXp3U2R3WjJf/3arkl52z7UuOKK91+yW5SQlmR1bqFa3j72h/FBnlHsV9lpZcZ
         FRKimNSYz3EiGuroJhJctysYbS4jzsH06VpzUnT9NWRkj2oVtxsuid66h5NAzN3jGuhD
         HcemE1WFQWna88JSLbL9W5ukVrbgWMOEkUYC7s0MFDnTNacUuqiJgJXjuir2Yd258Caj
         XAS9kXRSAfLmMgKwpfRAQnoP/1qyLU8aLVCvcT+ByY7Z5I/XGKDiC6QPYP+zUNzeK6f1
         CVpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiAVCgQSjw2rpT73JY+62+/9HZG8kAwSWTbjkhnWin93EJDezgiEdpq65xs+602AEgC3X9t+r3YC8k5Xb7YqMf@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd4ps1itAf6ZGeidsLrzG+5Heo6CH1KDBRNcYZBGh+l/KAaF9Z
	t/8FVjFlZqiagdD0LXrKPfJn2NYa6m8f2Uj7MBbOJUqJLrFLid11Yr191C+s5cqKo13ZAnA/Hts
	F8ILLZMZDBiXfKVKGkSRPM2jWIFMLnXfbt+TPNwO1Fw==
X-Gm-Gg: ASbGncvIKRlL5lHhmDrFicq5ZHf9pz8FI2aF3V9UIJdFPBTvVoxU4q2JUjj+ABdQe/f
	TxzUapUZ/ND5louNOHWqLFA5aq08wzfC+cXV8mR+nH15bkvDdyEGJ2Hgj/bkTK8GxK0j9BIKT+x
	Jm5TiPcYjT4RsefX9Hn5G6jflasAHX/0YffXZcq0JOzI0wkbyi8fH6Pvk9NcisV/YHYVDYZYh0K
	HPP5aXydRWy+iA4qv0aSgCf3nzFgD8USI7anS0T0FwoQ1ajaR7M/PdKaNgwxDpS5EOWsvOhQ35R
	5OYXsg==
X-Google-Smtp-Source: AGHT+IEZ48qPNDXi/VZK0viwyJMlNZCVVeDAAKNtz0dWhXoCt8yrbWYQfSCBbIwkB65d0mwMlwxIaale+Ln0IHl2XVM=
X-Received: by 2002:a05:6512:1253:b0:55f:4efe:42df with SMTP id
 2adb3069b0e04-59412c47659mr1221054e87.40.1761747485600; Wed, 29 Oct 2025
 07:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1761576798.git.dan.carpenter@linaro.org> <82a8a4b206ec02dd27a119d7f05d2bd6c8d2d3fe.1761576798.git.dan.carpenter@linaro.org>
In-Reply-To: <82a8a4b206ec02dd27a119d7f05d2bd6c8d2d3fe.1761576798.git.dan.carpenter@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 15:17:53 +0100
X-Gm-Features: AWmQ_bkpWoC7MJl6ilguYr2pkMyaF1lhvihQmCr9qcCK8P7laPbsgsH7ZdH72KA
Message-ID: <CACRpkdZMQh2ozd_YTjRgUvVwdAwHpDz9G+ZYYHBQ456GLjPZZg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl-scmi: remove unused struct members
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_071808_684156_0636A14A 
X-CRM114-Status: UNSURE (   7.75  )
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

On Mon, Oct 27, 2025 at 4:18=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> The ->pins and ->nr_pins members are not used so delete them.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied!

Yours,
Linus Walleij


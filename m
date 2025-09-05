Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DAECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 10:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HT51jpt+Z9rLQOZ4eY3k4SmSZF2os0NLvUCHbQ66xmE=; b=BlhJEsfIF5T00Ru1oGJPPbf5SP
	wlL14GhYoEByQ8xZLrYoiXNotrKS7NyG7kYPseOrCoGno11xrN9wUOXmgMXf3240e/Hz+fgIkJwu0
	DL2lwqDr9wxL+qV0PlCRg4DhHsXopGIyzQait0qe6C+TQuMXMaCKoWLSDpSGTgj7aka2LrdF/nrCl
	KxdR6wBnMXfhrl6cG5uGAxTvIWZj4cIgoruhu3/xzr+2yCtJMjeYMkJg5BOLG7xUpLnz4AB28RQ7F
	JKc1NEnLApi5Vc+hjBXMjohHUiJYkg6LtUw4vgnKKX0u3wOGgqhqdRMmvTe/nQLUpIYe53NGss/Tl
	1E4r8laA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTHH-00000000v6F-3koH;
	Fri, 05 Sep 2025 10:02:43 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRn3-00000000M5T-1jWK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:27:26 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-336af63565dso16161671fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 01:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757060844; x=1757665644; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HT51jpt+Z9rLQOZ4eY3k4SmSZF2os0NLvUCHbQ66xmE=;
        b=A3QQ/DBmIcAyosO3B3tdsYeeA4kK+Cs+xetYr0cFWOfb+Lk0jCziCbTE/pKoLznLte
         dpj6ByAx3mh9vYq4GjQTSmekkF04o16Wf6kSY9HXWhmLz2qTUC4TmiPKMoAkPTscZIbJ
         nx6W2aJLvczLSxE5IaoU/Hu7tWHT5kpi/N3X4brzZlghs+sP6l0fF7NbLR6Uln1r/wAN
         Pg0rGZyXT2czM/D9/aU70tYoxr1GwEHMKxPY+d1r0PN9j6H9LLoK4lRET+yUjt8+zStE
         RXmWEMU82QF8tNF4GIm4FpGjLQwrUmDDuMLPwfJ/Em/6g1hTx/IpaD/M97DzvKAFZQjT
         jIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757060844; x=1757665644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HT51jpt+Z9rLQOZ4eY3k4SmSZF2os0NLvUCHbQ66xmE=;
        b=srwD37z0Gej+NmUFKt5c7iHnky+rEZDEfDNM4VjK6upz5GRewKx7iAllo1qZOqcjvy
         2YyyPkKjJSmXKXGzqTZkmClMmbNuwrJHo9FNKGIKwJzl0WIByRy+Jwca12Vwfze018Ym
         rHDhV+2PKOMDgaK+p0xAnR8bR3x2+X4ynH4DCr6SE5zf21LL9Kh84rH/oZxWllhBjTxj
         knwdNCjg4dJStWm0U80fjgt+1BlGL+V3L7B4G06Ogwva4iEKsipWutnxJqsNh/Yc/W9d
         2snWyynMh8T01VSuBDi6JhYA8ogaB/nt+kueEXF7RjUppfKY5DndMRTvfTbUgoETOEnE
         eNUA==
X-Forwarded-Encrypted: i=1; AJvYcCW+iNNpbWSyimUcfszuN9/NeL1Ci4nAy+d1Z1sRSnTtDj9vwzluXBkBLbzv8woSZYm/1IvhdKMdMJKt7LVjt8qA@lists.infradead.org
X-Gm-Message-State: AOJu0YyDJyswW6zEiK1Pamz0teP//5aY9b52wbiqjhU/UfbKst5oX62s
	7OoRlOpEShIPE9hw0ojMob0XibE6HR7qA1LCaaF0Mvg1FGB7m2/z2Mvy+9ASER6+hP6eb7FtmB6
	MBibFC+coPFzto2rSRBegvv6F0HFn9q2IRxXiN4nSLw==
X-Gm-Gg: ASbGnctluGFhly2y/f2C3pP14LNkDp9egVaVFmk39mV8SEiHKnYD5E4JwikarYfdhXf
	3J/vkBS50REOoTnbAU7RtsCp//GkgQnEdHOoxOjrwg5/bOLdMQE0IFcYop++5d4EoVV995WXHcJ
	W5AYFbwNzgM1ZiyCIHZHz+e2Vs7aYs475P0XVd/zdz0ay8cBXgLejviVffXhHB/Yc3YywOhq9Sc
	RGE+Wo=
X-Google-Smtp-Source: AGHT+IHgClXJUzKdm6E0qr03i75G/PjSbG8pXmI/SkiwOzOUXWPeDlRcSIjt3v/vZ2+YkFRuc2QKV+aPlIPjoSHluJM=
X-Received: by 2002:a05:651c:198a:b0:339:1b5e:17b1 with SMTP id
 38308e7fff4ca-3391b5e19femr3818851fa.38.1757060843564; Fri, 05 Sep 2025
 01:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753039612.git.dan.carpenter@linaro.org> <6f732f53-7e00-4f0d-82a3-480bc81497bd@sabinyo.mountain>
In-Reply-To: <6f732f53-7e00-4f0d-82a3-480bc81497bd@sabinyo.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Sep 2025 10:27:12 +0200
X-Gm-Features: Ac12FXyee60oY8WOLdfjOHFd8MRN0v_dxWT060-4JQvkwWFEV5hFh8euv1Jxz9o
Message-ID: <CACRpkdZ9EHoHiKit+T-ur0xDKMEoN_=TydzTfoggNBQGdra2bQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 4/7] pinctrl-scmi: add PIN_CONFIG_INPUT_VALUE
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, AKASHI Takahiro <takahiro.akashi@linaro.org>, 
	Michal Simek <michal.simek@amd.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_012725_463707_345CD6D7 
X-CRM114-Status: GOOD (  19.16  )
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

On Sun, Jul 20, 2025 at 9:39=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> In SCMI the value of the pin is just another configuration option.  Add
> this as an option in the pin_config_param enum and creating a mapping to
> SCMI_PIN_INPUT_VALUE in pinctrl_scmi_map_pinconf_type()
>
> Since this is an RFC patch, I'm going to comment that I think the SCMI
> pinctrl driver misuses the PIN_CONFIG_OUTPUT enum.  It should be for
> enabling and disabling output on pins which can serve as both input and
> output.  Enabling it is supposed to write a 1 and disabling it is
> supposed to write a 0 but we use that side effect to write 1s and 0s.  I
> did't change this because it would break userspace but I'd like to add a
> PIN_CONFIG_OUTPUT_VALUE enum as well and use that in the GPIO driver.
> But in this patchset I just use PIN_CONFIG_OUTPUT.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

I tweaked this patch around a bit and applied: removed the second comment
in the commit message and wrote the docs to be more generic since
in the future other things than SCMI might want to use this
config option.

Yours,
Linus Walleij


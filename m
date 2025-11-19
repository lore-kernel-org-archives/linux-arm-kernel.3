Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275EDCF34AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 13:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/za41zUvsjTNwKhGeH5ufFsQKpXwXaeXVAYiU780DDQ=; b=T87/fvV6YHpQlZOKe2Rm5T+XSS
	MLCK6hzIODgWxQKsbZgd3DmsbBIgE5zD8kdIUwhyCJlonxTdDrpaRK0T4v8D/E4q16fmLUnw992Pp
	0mlu4avjADcAAp5u/KCDO7CPDMkTUC5ueaX8Luz2pQV/XQFPMssaBtveUzY+0WSUfb1O9YeYukkz0
	tBep5DO0nrBsHHSCw6+E3GW4xPmq3gLRNADcSumar+DuZMRHGxsYAM/gfNcqAL0LGusy7lG1juiKc
	U22w30ToOMfPj8dmaArmhpN1cbHXGbHc9j/v1V0d2FEsFiZzU1WXWXm4Ro8LBPA9b7ZJCwEsbwseU
	MX8nF+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLiiV-00000003Kjd-1FHl;
	Wed, 19 Nov 2025 13:59:27 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLiiS-00000003Kip-1VPE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 13:59:25 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-640e9f5951aso1460345a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 05:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763560762; x=1764165562; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/za41zUvsjTNwKhGeH5ufFsQKpXwXaeXVAYiU780DDQ=;
        b=EikyUub3i3bqUB3Pn8gSUMv0Eo5zyQVpR1YEdf016oyXZBhwNnMN9UCqspBwlGA21n
         ra9JP7yzxkcwB/X6J6bSZRN4HLNSRlY2l12nfHrgVaEdLe7+00f6gdw7K8kGKRvT6FBJ
         ziSBMA0tqdWRxksuTqbfIm5KV0mG0RV2GzRP/1NrDDIm5U0sQ6kAdr8xiiiPdMaYy5Lq
         B5tOp2kYr7XjUq7Y6nxEA6hYIfuL6IBlI575F+rDdR8RImlzr4Nd+q7xdhIdT2CtdiQg
         NcOGc6Nne9s81nU0+k6Gp+ESw1QpPGIPQwvTWXLaNnDmWdTRiVPbj2qQB8BiP0ClwjTB
         4x/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763560762; x=1764165562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/za41zUvsjTNwKhGeH5ufFsQKpXwXaeXVAYiU780DDQ=;
        b=G7aJ5ekT20ZVzLvkVEApSX448hDlUt6TOFI6JQKOEJyLXvi1rSF40dTf52qPxR79CW
         BkJlyziiJUetFyNfRph/dGZZLqc0ijwQWxeGGl+KKDx3bC3wPWYk/rfLDHWsACSIYxq2
         G442viQFPRaJTK4TZSJJ3wBKzP/EXsTbMJfme9XllfHhtBrjUaC/xKr8skYnUTXjplVz
         s/rqrJAMdfPFvd5T+MFSbhe9TLgxLWPLkXtlvhXQmT5Mkm4v+mZKOIlsfKS2xu/uPNg6
         +WGqlS66FJH69488sKbZoGzHemc5+LTN1IDbkxZNO1SrIkKHgnPshiS05EgoyQEQvPZq
         Bktw==
X-Forwarded-Encrypted: i=1; AJvYcCU+WqWWOz7466K8EuP/Qu0VEE4KG7Wzmb4ILkS2K+05ATVNCZsjBOaD0ytA7rYx2mWyoepLNW5+IaZeXgnG+OAB@lists.infradead.org
X-Gm-Message-State: AOJu0YzoCT1hqL+bbiL+3lTapyUnhO4o7nQyjWULxTEKBAGEHYs+xujd
	lUoXTUPnCYw/c59g1t+mSBpdCI0m9TB53/P33R91raBHtIwIbzSHCqhWkAXea5zSXwk/GVYXlJ1
	w21lEmG9DP5rxCHOeMS4erSpgjdpnHU8=
X-Gm-Gg: ASbGncsCVqaVIbMf38kfMnnog/AcDZV0TCvgb0/g9iExC43RQXcDJQpQFya4d1aruud
	Tesex8aLlbfgXn3XT/A0OaHwxi9YszdJT6eQuYGgGnztE+ZgRbXUi2Algys3PbHmQoNrjOMBKOR
	wsaG8TVNc1tdC0UFNsE+LiAjbCGgnVRp2Ubm5rtUx/zqN6LiIHxxmM+lvUhN6bKtJFGquAqAPVV
	Fbyxd8ODDrAdQr05P/1uqZgTzPw5y42+a5UOwxh34mMUWixKOg1LHazhlk4cR60JsmD4YS69Z+V
	7VJioq+wlPA1E54DjenYw7HVizcT4xvnl4hAe03aj4i/EJmY+iLNKY6GDKE+RNPRWImsO1A=
X-Google-Smtp-Source: AGHT+IG8ULbZ2gakwAe+AEo25vXjOIbyjJHqtq9Z7iOt7eHBk90Bam96Us9dXGPQT1lyjruKv6oC+ZwWggEZWRjTk/E=
X-Received: by 2002:a17:906:7952:b0:b72:d577:11cc with SMTP id
 a640c23a62f3a-b7638d97082mr264614266b.12.1763560761898; Wed, 19 Nov 2025
 05:59:21 -0800 (PST)
MIME-Version: 1.0
References: <20251118003229.26636-1-jszhang@kernel.org> <20251118003229.26636-6-jszhang@kernel.org>
 <CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com>
 <m2ecpvm20y.fsf@free.fr> <CAHp75Vf=HYugUGDOPdXGaMo9tDLcji0H9ZX7NehN0NoBGYjO+w@mail.gmail.com>
 <aR28aq0xHQOOISYq@xhacker>
In-Reply-To: <aR28aq0xHQOOISYq@xhacker>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Nov 2025 15:58:44 +0200
X-Gm-Features: AWmQ_bmVZ5aFiHmgx4Eep-EcRGLL1HO2Ewhh8OL2t0SuZRjUtbzyv0Nheh72k40
Message-ID: <CAHp75VfA-N70QY4o=GbB0s0+L_o=+YKgCwdLUK56ggc-tKO+-g@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] gpio: pxa: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_055924_410742_E9F05A6B 
X-CRM114-Status: GOOD (  10.71  )
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

On Wed, Nov 19, 2025 at 3:05=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
> On Wed, Nov 19, 2025 at 09:56:12AM +0200, Andy Shevchenko wrote:

...

> I have explained the reason of embedding within the cleanup/modernize
> patch. Could you plz check?

I already proposed a compromise. I like the new PM macros and less
ifdeffery in the code, but let's decouple that one from the
refactoring of the data types. You may send them separately with the
cover letter describing the reasoning.

--=20
With Best Regards,
Andy Shevchenko


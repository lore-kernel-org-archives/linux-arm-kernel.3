Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD18CF3963
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdYmHDS2ThLvPTXgosCOxi7O/VrEkwzzajRlx9vVFeY=; b=3JDxd895wuP8PHDl+Sd8pB2eN/
	75Kr+4LSvSWGvHZWDRmhOl5x8xjyyqmvYQvPOnFkXyDOtVGhA8ti+UkKOBCaniZ2qRXEqGfFDxGPQ
	Ydot4GOkYSg/lgKXforTB0BtmVdr2D3zVVD4UAqBDbLKo8F0ssWpLGhAYtiqAY6z0WRBvtvnwReC8
	znFMuJrPczXOqTbaMACAgQIpnFfANSbKULBPeVNV//6U4aPY1vbQRsJEYVULWGCXvkQbpwvrezdG3
	6XfjU5CwPx9/ItS/TcRwSmloc3Pse//HaUNjkvYvbIZFTC2eRm+nOygIFsmxaoZShW/O5aMQ4zb1/
	8Xj7W7IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlQe-00000003lxT-0dLB;
	Wed, 19 Nov 2025 16:53:12 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlQa-00000003lv3-3pol
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:53:10 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5957db5bdedso6585616e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763571186; x=1764175986; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdYmHDS2ThLvPTXgosCOxi7O/VrEkwzzajRlx9vVFeY=;
        b=n0I1ZG91pZSw1ih1En5vZDv+usl7/+eDpTxnxS8AKFTVWCEVlBNIXFhrODgjgX0xik
         hBU6X/JC9OOEosk7VTMnRjmavwhsDDAPknbj0Mg+zYQejlCQQmYC1TIZMzEnoLD/5IAC
         yNiADp1qavYN8HuixaD++WWxj5uo6OP6XAF7BT0H1apuyX3q5VGcUPWxEu9LGVQNPnl4
         906N58KHhrGIXnrTXzzdFDdjlg/6pu0F0tB1fUZq+oQ3VAirYSjTeB9ckGrHKOnbzmE5
         ScbeU1RwB9jU3l+w2oq2JcPXgg1xf+0/assJYgKiIsnyx1npi9kmR0in8HlGYHpRk4nk
         WOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763571186; x=1764175986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JdYmHDS2ThLvPTXgosCOxi7O/VrEkwzzajRlx9vVFeY=;
        b=ZwA8FNRF6XPgi7rYGFVJmxfphNryBCdFRMbMvkWTI9t6TV3bff3XXJkd/BapvNqRUh
         pzEP7O4M75MVFyQjhraMkJCwyzlCLCK9G66uIxrS2zf3ByNy+7dS8XyyrpVQHcNDc9TX
         FHjRiG6kR5pjPVlc4+GlYBNM2Ln2oQrobAvLjKvAe0DIhFqEIVjOYdXeEH6LiCtYgS6X
         gswXj8ubQdfrqLArllXKLY/Nx51QVoSAOt2fIn42Jz+VCvudB3bpDgjA/kJwMONzm0mW
         P07UD1s7zPuzNoMZz0eIIP0x6neJ3RhPVHsq7rc3rItsY/gThgw7ZCPKHQgEdvNkCBdS
         Ms4A==
X-Forwarded-Encrypted: i=1; AJvYcCXtDLbxmAw6ueQeSIsvUjrtGPUXS1gOI7mJaTIQ19bN8O0LC76FHTxpz3kyJVAG+TqrIIXw3UwtGSqLtPLqFfKU@lists.infradead.org
X-Gm-Message-State: AOJu0YyVBzxs+eBM/he7XT0N1DMMvjbIp9KwBcQIOtf39lWimYd4Pxtm
	4B11ooxvFvMVnDlmkioGglMLL4ktgMq0VzyadRWzm6KkpB6L2E8IP5MHJ3hiqExZWSSVBc9onyR
	t31GR6eU3ffIfcVyaHyDa/Ly/yxHaYLG7I8wgSpaaPQ==
X-Gm-Gg: ASbGncuzxtLKCZQI8nN5HlG/6jje/KuLtxE0rvTZeqw0J73L8fUuijaFgiUfPRQgktN
	Czy1aMAgmgNf1fU23OgnQhmPwfDlQxinct8ox+A1Fdy5/9KrVpLP3spm9EjbH8ON6XyjyDOIdJj
	gtgmpC1h0mvzfXCbSJuu8yAKdv0fqn0HCqOvFM69xTq7RIwl6KACwU8tVEXPKgQaia2XEzSJkRF
	0l9cMZHkexqBvo9ZNlGtQQsGllZl1z1N2LalK+zDyQ5lkbo2TVVbgv254ThBKD0As16YV2OoNxZ
	Vs9iZevKFfTiBRKbSgeeH8pc1kuzTFwthPeeJy7sXzGA/1kr
X-Google-Smtp-Source: AGHT+IGJtgkXzlVHhpR54E98Q1dz300qvb2er/d0j4UVTlfL15yMaNJyTuXE0A6OJZClUybjDYS5OMsTTf3Wmd5Iph4=
X-Received: by 2002:a05:6512:1326:b0:594:2cdf:1941 with SMTP id
 2adb3069b0e04-59604e3f4e4mr1415629e87.31.1763571186312; Wed, 19 Nov 2025
 08:53:06 -0800 (PST)
MIME-Version: 1.0
References: <20251119163327.16306-1-jszhang@kernel.org>
In-Reply-To: <20251119163327.16306-1-jszhang@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 17:52:54 +0100
X-Gm-Features: AWmQ_bliEKMyampC3Eq7lBUu-gYbXMocNF0Jufm322iNWDs-qdWQZkWMYwmPk6A
Message-ID: <CAMRc=MdL0hqr=iDo4WietZ+9Cc12U25h4Uvmu8MXSCnxscP13A@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] gpio: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_085308_969747_609A1EF4 
X-CRM114-Status: GOOD (  16.82  )
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

On Wed, Nov 19, 2025 at 5:51=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards or
> __maybe_unused.
>
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>
> Almost all drivers are converted, only gpio-tegra and gpio-mlxbf are
> left as is, because the memory for saving HW context is not trivial,
> if we convert them, then the two drivers' users may complain for
> !CONFIG_PM && !CONFIG_PM_SLEEP case. So I didn't touch them.
>
> patch to gpio-dwapb.c is tested on real HW, others are compile-tested onl=
y.
>

Please don't submit a new version of a 15 patch series every couple hours. =
:/

Give people time to review.

Bart


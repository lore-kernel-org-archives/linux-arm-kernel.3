Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB84EC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 15:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8fkS7ujYdQIX4pBzwLiRogGSQ0eNgx3SFtN5MHEIaI=; b=dD08Cb75rh7u8QYKI51ta/SsnR
	BEbiNiORltuY9eq3pCv4vQuYh1IyuPL1eHiRJ5yEjgP7Fny+JcvVxZIPng+dVeLx7Lw87Ob5UYD4s
	xF7pAVBNfCHxPGjD5CM0/64ozF35NtGKXe2NYLcloTamr6/fTI9L+g8d6iiKUf8qSAc5wJVtKXEhy
	gzK7DYSVFRqJaBiZ/ug7+IcZdKkx2DSWEmE0Ozd2dm2mjXzCEFABj7CdqzPAh+Jm50fc9GFOIh51C
	hSx/4QVtTg2J6GoKNe11HR2V8DG1ml/M9flben8MA4ZeCfy7Fa9uj2HBjPMS1SOQ0gmSPU/o+Gjh0
	SvMGwF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsN9-00000004KTd-2cMe;
	Tue, 11 Feb 2025 15:40:27 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsL1-00000004K2X-10TU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 15:38:16 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-30762598511so55688961fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 07:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739288293; x=1739893093; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8fkS7ujYdQIX4pBzwLiRogGSQ0eNgx3SFtN5MHEIaI=;
        b=PCzYbEWjbIVer8Nr2XNOg+7wIBBm8spccKTarD2HBxzzf1Wb4gMaDWqzGyJsLJ/EWq
         XXPbxaXQoBgGUT0QN+2mYfG0zqpZGYeSc1rjC73R9mFXtHx6uJ7102XbPo+NiVpG5IWh
         HJ6ZYIzqswcxO1XCV8XOY8MJwEZa9/jrIKjnyBgNs1Fo5yHr7drWL7IiNjI41W3GZ/Fj
         WoMJMrkd7wcDBaRhX/LioUUJaffoQU3ZiaUjhb0cSnRcvcqbNrzBbIhcc+crMc2qC2/9
         tEz98xLGT+2pBEPmM/W+AKuloDNTJgIJgtwjmLSPMcnbaLOhrwwrLqSXuQw92/NT2+Ah
         lklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288293; x=1739893093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8fkS7ujYdQIX4pBzwLiRogGSQ0eNgx3SFtN5MHEIaI=;
        b=N0edG5Mv6lLlS/vM81ASqcSfH7XR3v2TFXlu8uXZvsUCjJurzHklIVFyX4fitZ9crr
         PBLwr6tx/R+NhlVAIUGRqrZpf9fwi6op+ioFYWdUeSvFxLfbaR7JxYjpkLP0CM11Wjrg
         OXgUb+4b8Ii2IzNmjYtaETFAmSXYeO9KNJ5kGRjmLud8xWaLXwrWMDAgS1dzMgkeMMD6
         BclGU8AdDwfVYIWwvjo/wC1zLbKnKmiwMpWMYCS4MXRqyVA/rg1mCXmB+oI5QAu6+4E1
         dS0grU0Om3SDG3PEhs/5tCmSoyijos++bnyvKrai3LkDIsahkrPDR9TbOHU6r1FI6Ahy
         YUDw==
X-Forwarded-Encrypted: i=1; AJvYcCWFN28hlzmff28KxB6+wM0T+qD0x/EIbK6NWzlbKFbxqS04QmGWDBf9hkVHkcJi8gLVrVXZBS2ddM8iIEgfIKMK@lists.infradead.org
X-Gm-Message-State: AOJu0YyMBJG126RaaNetupLJ+ihnYPU2UVdRQPza4O0XMbdR3EtUP4G7
	ND74z51Q0zQ9j1ZeBWj/JxrfdyYK9GPTnylEdRck/ilZGBo3P7P4Xl9G7cy0Hq0SsW04giCwOjj
	H4wlOhEpYKm8R1iEToBucDQygvkvF2f79B0CiFw==
X-Gm-Gg: ASbGncuUiusSnUqAl5igdCeZSKeOiOYE6khA7dWrEi5lxFm9UEQQfPZ43qnYPtCKzEO
	mjSx2zoYZw6KxHZSL5fZeeB4t9CbSk7Xjh42+Gl6S5vtdg1haJ+mrF1iYiIW1mv8iIdM0+SQx8Y
	hu3xSXUoDMG0I5eyT8WuJHEorPQmM=
X-Google-Smtp-Source: AGHT+IErfIT8Go25NkDLkQfR5NhzuzlhLOzheD8LdphohjPe9lEedbA+M9hKeD09JvDHlwEEcEqYU/xf/b/UxeLa/b4=
X-Received: by 2002:a05:651c:2129:b0:308:f01f:1829 with SMTP id
 38308e7fff4ca-308f01f1f54mr26709121fa.6.1739288292563; Tue, 11 Feb 2025
 07:38:12 -0800 (PST)
MIME-Version: 1.0
References: <20250211144300.964-1-vulab@iscas.ac.cn>
In-Reply-To: <20250211144300.964-1-vulab@iscas.ac.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 16:38:01 +0100
X-Gm-Features: AWEUYZleW_jmzFJ6vP032FNVqBGUdDWvspy9Oc7CZIhN6a5pEweY78yBo9eHn50
Message-ID: <CAMRc=Mf+yuM-g1XMVpTvOXfMvf6t+saMJYfKXuCZU8fSfzxdtA@mail.gmail.com>
Subject: Re: [PATCH] gpio: stmpe: Check return value of stmpe_reg_read in stmpe_gpio_irq_sync_unlock
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linus.walleij@linaro.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_073815_533342_E2F764C0 
X-CRM114-Status: GOOD (  11.03  )
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

On Tue, Feb 11, 2025 at 3:43=E2=80=AFPM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:
>
> The stmpe_reg_read function can fail, but its return value is not checked
> in stmpe_gpio_irq_sync_unlock. This can lead to silent failures and
> incorrect behavior if the hardware access fails.
>
> This patch adds checks for the return value of stmpe_reg_read. If the
> function fails, an error message is logged and the function returns
> early to avoid further issues.
>

Would you mind adding Fixes: and Cc: stable tags?

Bart


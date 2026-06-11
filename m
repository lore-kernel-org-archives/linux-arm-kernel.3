Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0B5CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 12:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2P4PmcnHeSIbmz3J0AKO+3ABrN1m7BkMBBGbKGlWimI=; b=RtbEUwtbEpzwZmdEgDBb7pnc3O
	xNTd72RuKeMxPPzdZpC6b4/dConGqeIN5lH1YBfO9g2pdANUWJ6s0vNVhwQuFKNrCQ3NtOepuqDBW
	u428ylFbm/fuBP1aoLvp/VUF2lEoF/rHy6umpeNHLMPBb8CbAZ+JaCgBvXz+TO5L6Z9RHSKYnDBpt
	5pH6v+Q+hp18vlueGdgfrvnl4bNbp759bWgk4XDsCyZGi8qzenx9BI9BjWXz2N7BhEjvOs4YOQxZX
	r+LUrKU8NASlTbOgGEmE4t2YhcUAvM4ewHaHuWOLbwqIB2kgorikEavK3PGRCsmgthdqoFFwF12sA
	/JVws2FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXei3-00000009QQz-2B6m;
	Thu, 11 Jun 2026 12:40:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXei2-00000009QQl-05Vt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 12:40:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD8CC43A9F
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 12:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FDF41F00898
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 12:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781181633;
	bh=2P4PmcnHeSIbmz3J0AKO+3ABrN1m7BkMBBGbKGlWimI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LgQlvCWzASZTDlq0M7janNNq4Rs04qI0YUVTvm7Pdf217QxM67HdfmkOPdgsI9GKe
	 pmQHAtyP8EbJxZP7OxnPk0Jtwb/2YZgVcAXoucTJZxfsRLwytLYqOYVut/GyXyFliR
	 ijAOJK7JZmFPRK3TdLPcUIwALIzlsX6ejpg5qBCtuXSKbiFBo2O+sg7ahouw3f41pO
	 58kz5LC91v2Ow94piAcNf7ZSRarXBzzSN/EP2U1zn4nmTDBaoy0V5naZ0bNkb+bfHm
	 g7UegBC1dtidkYnX1o1RFivL49JeOJBKvlFvSVevzxo1K/9rztcSgaoZC5cG8RE4DU
	 MVGdyiwzIbijQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa68d9d4a3so8996697e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 05:40:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+rW8kJBnVwoN0J/4HaL47Tdp06gVQCNc9YPwjnK692UExA2B/z3eSGR+mZt7Ht48v/Kz4Ye0vPnWsdo5UV5f4x@lists.infradead.org
X-Gm-Message-State: AOJu0YwoML7qBYz+IaWs7dMJ0VbJBGSspglRLIbg8XPWsanILQEnAutQ
	4ul8Syvh50R2lGf03cxgJaHRbCdJ0sBOeDBsjL8G8WfSJgE2xEqLB4v1Lqx96MjernuGPHw8V5L
	j/UqQPPm9CxXXPLYckV671scVUBFkRf8=
X-Received: by 2002:a05:6512:118a:b0:5ad:229e:3860 with SMTP id
 2adb3069b0e04-5ad27aaf3c0mr778501e87.3.1781181632448; Thu, 11 Jun 2026
 05:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260611-pinctrl-nolock-v1-1-aca022d4d60f@amlogic.com>
In-Reply-To: <20260611-pinctrl-nolock-v1-1-aca022d4d60f@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:40:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLmdCCYTKv+J09pS=49c4y19stBYmBgytc2SG_MM4D=ABg@mail.gmail.com>
X-Gm-Features: AVVi8CcK6vKj7M9lrxTHVvJAMkxnXvUH3E59BGUGT9lSHYyOacydnWB2IyiXFRI
Message-ID: <CAD++jLmdCCYTKv+J09pS=49c4y19stBYmBgytc2SG_MM4D=ABg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: use nolock get range
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

On Thu, Jun 11, 2026 at 9:10=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Use pinctrl_find_gpio_range_from_pin_nolock() instead of
> pinctrl_find_gpio_range_from_pin() when configuring a pin or
> setting a GPIO value.
>
> This avoids taking the lock and allows the code to be safely
> called from interrupt context.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Patch applied!

Yours,
Linus Walleij


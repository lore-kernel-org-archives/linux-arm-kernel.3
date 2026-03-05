Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465F0F30946
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 13:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQFjFILC5mkY+Vwv4pWWykfJ7vYhfaqzdPLfw43t0cM=; b=fHXgXRt4jIobs9pb8ob0wChCky
	4Y00EotbSniVOBW9mw+QsnZY1FejIEojYdOFOdsclKv5ZtV8H2aWWNdevsY7EV/v5enu5DaCqgLio
	L4bgAgsOqwQZBhbIsQP6LmHYjEkr1gLP3kys9ZOFWr0CriWmx/DtJ35865YGm9tm/9JS7p0mt5hjc
	ahL4/Mo+7VhQBxaxAzWwurM7uIsp5mokddNWQlC2U4pyEpcR7+Lo7PwTExajFgVkJM+mC96XDqkVB
	PJFdX2Sv2jv6vB0BLMGFXtQ3oyjeWCOsW6dOTi3Ey9Y4AJeRda/HJra5x9Rnw/I2rPVCvY8l4I9Ub
	kJ0t/LoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8JD-00000001pmP-0KKQ;
	Thu, 05 Mar 2026 13:00:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8JA-00000001plw-1bNL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 13:00:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B977C40529
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 13:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94574C19423
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772715603;
	bh=MQFjFILC5mkY+Vwv4pWWykfJ7vYhfaqzdPLfw43t0cM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mRt/V5Y+XF1IVSwG8+jgRQQyCvpXzrM2yGEMcTCtiKo92vOK/oYAOcv3PSeRo6LjC
	 4hpJ6MZp11xMwkEB9Ia5N5Lo4ZLUYuS892vquqkFTEEx5MKE0Zjypla34/hbRsbphS
	 4xUuDxfZOdkz/lUEsiGPSWi6n1d9I2BG/yFhmm87TI5WSOZcxOXEw6Ga1P/Ttxd5Lh
	 r3WNQsdzdQ+1TuV++pGiJjlLiHdiBYpVJMZbu/ZnVpgSeCMRnFVj2jq2WeGtTvL41j
	 C8Ir1Z9pBStxgl/rgavHxyBM4Bj38b2tMKwxcOAU+ND9sp3Lz98VfkZdiIW5f5RIa7
	 P8t+8Zc/xswQQ==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64c9ebd1369so7289279d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 05:00:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqZtCurrlNKMXFM+2yISNxeSZ2pklDEX5KRa4Udv/Tsbyj7PukDu0cdXNU79gIxQUtIVLJdZ1EbLDL0V7b+1kt@lists.infradead.org
X-Gm-Message-State: AOJu0YwWUjtCNqFINzQVvkBzDp3gpyPZrdP/tRJ42TqS1KWcLTlpCipk
	Ir3VZwPDeAIqciAlxSjjSEqTgqzYls7oySD2Ch1664Jczaen30qWX/nVpsseVoSNX2+nc8QK8xJ
	UnISxithCcvk4UvrMkGi86NHKmGsexVA=
X-Received: by 2002:a05:690e:448d:b0:64a:e7e0:a70c with SMTP id
 956f58d0204a3-64cf9bd6f89mr3303741d50.65.1772715602763; Thu, 05 Mar 2026
 05:00:02 -0800 (PST)
MIME-Version: 1.0
References: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com> <20260305-gpio-hog-fwnode-v1-4-97d7df6bbd17@oss.qualcomm.com>
In-Reply-To: <20260305-gpio-hog-fwnode-v1-4-97d7df6bbd17@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Mar 2026 13:59:51 +0100
X-Gmail-Original-Message-ID: <CAD++jLnW=6CNK3F8T8UHR01UfTk7CUwavB9dwv-Ug266mVcy4g@mail.gmail.com>
X-Gm-Features: AaiRm53RubGlDYUWuLep_26rBrnPyLYf-1xTz_QksBGDgogCNI444BwJT_n_uH4
Message-ID: <CAD++jLnW=6CNK3F8T8UHR01UfTk7CUwavB9dwv-Ug266mVcy4g@mail.gmail.com>
Subject: Re: [PATCH 4/6] ARM: omap1: ams-delta: convert GPIO hogs to using
 firmware nodes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Frank Rowand <frowand.list@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_050004_442018_BF92E3E0 
X-CRM114-Status: UNSURE (   8.15  )
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

On Thu, Mar 5, 2026 at 10:51=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Setup a software node hierarchy for the latch2 GPIO controller defining
> the required hog and stop using legacy machine hog API.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


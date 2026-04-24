Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAF5FB44BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 06:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJytY8WL4HMe3HBBQqeR7J9sAXb/0IxpjYcnbPquKV8=; b=AppBnxsK2K7jxyoDmLaRb9ZUJB
	21K2Pq9rAeq+GxNskvtMCXZgKXpH+NC60DbUgcwLcagbo0gsz11HxXFuF4S9ssflroxei5CNlTK6m
	JyuaKZPX9bVVgEO/udIzV7sQRN6oni851ly6id6Ml1CpcJlg2p2ozBKfUsyqnGjGbb+k6BSEZz6ei
	MS+XqPh6Jk7Zr7dGaPS4zIE/bGVfbkHjmYeNdE1Vk3CeXlot9JkEKXo0ac14BnNOy1UnFgjoZ7Iba
	XPM/mrpYceZYyjijq7buIPjE5KEAxntfpLl+Z6QbvGa7y+nxYPDAm3cAGPl+KCFAKh9NyE5YfaZsJ
	HVqGO2Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAVX-0000000ClCO-3cWc;
	Fri, 24 Apr 2026 06:59:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAVW-0000000ClBy-2A89
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 06:59:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF467600AE
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9685AC4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013961;
	bh=vJytY8WL4HMe3HBBQqeR7J9sAXb/0IxpjYcnbPquKV8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Kzywh5Z42fHQMDhvXyWb4tTW+4madIm//c1a8WPDnSRwZEeiqzJDmcnNE1BfLIaLr
	 GoyAS2IIl4zc2lk/3o57KXvQkMXLEPu0IADq5I6DCb59Q3UnhegJ/Oh6auAFhkWD4s
	 dh/QDaspJLyXs0ww0E+oAgXGOUEpb8a6PqsokVyLPrMUA7PHpkF86VQ6AKhFnKn3DZ
	 mVqnp9zKx2oivgEb+260/EOpl5XNXbEisiBBbmOCVkh1VnQddcMySg5ZwkxzQkuKT+
	 c6Di1GMHRnFRrUHQQ+KnVE6Hsxxkaz25HJZCO6iSS2Pwp6EW+bYazksWL8la+zwLm0
	 XcjTuvyVWcI1w==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a40b2d268bso6063045e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 23:59:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8K9hYVe4ZMtMG/WUBId02rot2TmBgmNW8ukVChBuGXe3qcS8YQBs/ZGu3xXyxLUiaSBx5C+yYoKcBl3ttI07VV@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf9SVlkvRbQXh+pKyuTG6cSLV2CRHRTbbZwk0wfv4c95k9q61R
	QgwU+LrvCOIi3Vu1CrDbcFpzrAXe0TfgfZRiNG9zH6E7MVENEWw2rUnzAEZJA/gv3J735TB5Zai
	gMI8qB6SVyaJaxd6A65jckbUBbH/9NuU=
X-Received: by 2002:a05:6512:3a86:b0:5a4:59:d47d with SMTP id
 2adb3069b0e04-5a4172be0d0mr11924307e87.4.1777013960336; Thu, 23 Apr 2026
 23:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
 <20260412-b4-defconfig-multi-v7-v1-3-e76de035c2df@oss.qualcomm.com>
In-Reply-To: <20260412-b4-defconfig-multi-v7-v1-3-e76de035c2df@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:59:08 +0200
X-Gmail-Original-Message-ID: <CAD++jLkWR2=6ZbLZQKzL8+bqKGKByWOR5M9Dv3Lj0AJp46r+QA@mail.gmail.com>
X-Gm-Features: AQROBzC76nTsXbrB6iGKQlywmHXe5UAMid2rCNSiTIGiO8bzyFgn1BPunTP0_eI
Message-ID: <CAD++jLkWR2=6ZbLZQKzL8+bqKGKByWOR5M9Dv3Lj0AJp46r+QA@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: configs: Drop redundant SND_ATMEL_SOC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Sun, Apr 12, 2026 at 7:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> CONFIG_SND_ATMEL_SOC is gone since commit 4f30f84feb77 ("ASoC: atmel:
> Standardize ASoC menu") and can be simply dropped without effect.
>
> No impact on include/generated/autoconf.h.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


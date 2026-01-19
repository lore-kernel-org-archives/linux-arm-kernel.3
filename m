Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A3AC98315
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 00:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77e96+tn9mecLGBrZtPY9Ll7+CLmgZeo5o+F4wCK57E=; b=Omalyrr/34urXDHyyKaayWboNd
	FuJI1tH7XPFH65w1JvjJymMo97Qw+C82HdV/vNX7NxXYQN331AWa7NZlcx2ABjrngIIgXBmRBB4AR
	fHneS6XMg5tcnsdqzhbTXLsmwq64pgqLGNDPQVwd+EivLJpmG6SgQdheckf5uaYVWizcftUV81+ss
	B6NqtHK+TwIH3VqF+mAMrFI5e6CjEXsYj1E8a8+va957X3bWhE9pvuhXb2TQl/Sq3TTW/AMzOGm2b
	bIYEKpi/e5qvRwybnt98y96qNJvmbecqRKLltETV3q/hgk4VyCnqrC9tVtenz9hDzrf+xGWlplxJG
	yfEo3iYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhcsl-00000001Bh3-1Bfi;
	Mon, 19 Jan 2026 00:12:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhcsi-00000001BgY-1bD4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 00:12:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 68BC644332
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 00:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB17C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 00:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768781551;
	bh=GM6hjWxnbx0Rs5/7Y45dHtccDdEstdeBQZhCBY29WCk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nW7h+1MyHv+XY/D+QMgQoPSEsvqC4xZS08EgMm5QgWJWAQqCzRkqWlAFfEeFeKwzk
	 uoviDMATdhhTN9GYHHY9iRFzkaxxUD9pLBAMVOYbGJeVRuCnSJApuxVhY8BCvxlQ5E
	 dgoArPak6gRs4bBLk5jVHbVkVkg4zsSs+2pVVD3EOiqYMmh34OZJEd/rJul6jkgQJ+
	 e9oaDFyyAJoQ1Qp1DeErXTf+NherfvJ7rOJgwo457Bfp0Mm6oQ9fii3A6VAYrU5mb5
	 JbGTWaIr7+xmJpWRxkx0Zf99/arNagUn4ATg1W9VXanBKldhTQJ3Mec8vROa2lsBl2
	 3o8700Mmbeq+g==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-649295a4a5bso417302d50.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 16:12:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWywlLT7QTVRyHYfeq8bE92ply10WHYhsoUBQonQrJJMGCVCvoHheibmKWAlkSNzDFrrBUGjLaM98c0uzH4frAH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/kQzpDuLvcSRgRQkcXYAtSBCObQiNq4TkbF7sV4iIm9tGqRNm
	kqpj1AxalZmnGhX7r0hajfTi+8KwOTPt2BaAuFV8fAXiPRgIbpCH/n/YhOx/fiCeSRctvgaKi1y
	rW4mdqr4yG38MQTYU6X2CQwT27Kft3tc=
X-Received: by 2002:a05:690c:f96:b0:788:989:fdae with SMTP id
 00721157ae682-793c52a3abdmr187836947b3.28.1768781550470; Sun, 18 Jan 2026
 16:12:30 -0800 (PST)
MIME-Version: 1.0
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Jan 2026 01:12:19 +0100
X-Gmail-Original-Message-ID: <CAD++jL=+MP0UZsPRAh=+1TL+7ow+rZ_VqNW=XZN1Ht82Lw88FQ@mail.gmail.com>
X-Gm-Features: AZwV_QgFwFIzeGhMFaeDXLwmJd24DRy_tYYmpsNkgD6HAMBqdqwm-YSi6s6fPfs
Message-ID: <CAD++jL=+MP0UZsPRAh=+1TL+7ow+rZ_VqNW=XZN1Ht82Lw88FQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] pinctrl: Some code cleanup including guards
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_161232_447074_BE10CF37 
X-CRM114-Status: GOOD (  10.09  )
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

On Sun, Jan 18, 2026 at 7:10=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Changes in v2:
> - Patch #9 (pinctrl: tegra-xusb) - Drop stale mutex_unlock (Jon)
> - Add tags
> - Link to v1: https://patch.msgid.link/20260114-pinctrl-cleanup-guard-v1-=
0-a14572685cd3@oss.qualcomm.com
>
> Few cleanups - from unused headers - or code simplifyings, including
> usage of guards when beneficial.  I did not conver cases where guards
> would be mixed with gotos, because this is discouraged practice.

v2 looks good so patches applied!

Yours,
Linus Walleij


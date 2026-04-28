Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7BFFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BC5O937iyiNhZiumC7m5YAaGDlwXTXa+qfnkEp1/d6s=; b=vc/7LmMoVftG2J8E3UPMk+hwb+
	OdFAxjo/J4di25N5mqSiDES72y9Ap692sw6Y+v8kCJKkEpzd4SKeIkozh0n6G3GNMFAnxV1ZEMiGu
	M7NyEaPV+2VbD2boAGF2gR1G0El06oU2tTHyXBAR2jaw3W86K8w+PHcw4IL3nLRX2PlN4iZz/hurr
	qevB8dxoEsg7eEdHNS4WOLgl3DcW7j3UobACVnx4IKV7AdMH/lwAfDDzPBidDW0Ia8dj7dtBXQUfo
	RMvdLf57Tp5ChMBXVZwCZMnYD0YFN4ZorezFzLbTVc8Un9XqtVjjcVwbkD3ngEVK/aQKmIaLqT7cL
	SEnE1M5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHf5m-000000017UI-2Vfe;
	Tue, 28 Apr 2026 09:50:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHf5k-000000017TT-3C8o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:50:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44CC744880
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 09:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A87C2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 09:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777369856;
	bh=BC5O937iyiNhZiumC7m5YAaGDlwXTXa+qfnkEp1/d6s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UQtxjLVg1H6w9ZPEXKijvwyGG6ju7AzehKsOQ6wPd0LdvjGrdaDkvh7muB/WuNrEj
	 Owd3ylY8hw7DjW84ipQ0VtocZQFcnsWfSG71KBSzqjaX78OHTdxQTS9c/FVIlBTmlR
	 yS1oagKHMkXQ62yIeEAEwgEyleo8hWIH5WVlPI0UwjC29YUoNcl3BSg3rJ366m/te3
	 3aGRWkc6UWICb2ZoUwPMq2yFFFzTpGO5Go5kJf8PKMydfWnnRadIEq3MSN8JxzKU+g
	 civbJHg8g6sdcuauwVXRPo3/efh/DcesNQJWT4nNJPPHSKqyE8PDImYcV6+ujdhYBb
	 1U8k2rq3Pju7A==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38ddd8d3b7fso86097331fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 02:50:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9xC5kGGQlyt4NrfSaRN4AZe+VT1C0AY0jG/uAJSTjPc9bAvG2LhnU/frrfD3kiDigpXjwuGDq4IuVR6plPBfjD@lists.infradead.org
X-Gm-Message-State: AOJu0YzyhQ28jHuIb/dxpRgFQQZJS+mfV6+LStCwJDk17MPQQxLxSTOU
	4E5ZLAzg9clD2b42zjZdm5A4gFr2WF6S1gJOjEOjy+5vHs3AdnmJk/MqMX/fQBkwQov/D/K2J9Z
	542dzVSPV0tj8gCvog9dLuhZpQgkw5R4=
X-Received: by 2002:a2e:bd12:0:b0:38e:d78c:b16d with SMTP id
 38308e7fff4ca-392411ffeb9mr8148211fa.29.1777369854861; Tue, 28 Apr 2026
 02:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260422-fix-pinconf-v1-1-abb4d2e0da55@amlogic.com>
In-Reply-To: <20260422-fix-pinconf-v1-1-abb4d2e0da55@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:50:41 +0200
X-Gmail-Original-Message-ID: <CAD++jLnKjhw7xhSwg-b0DNm+SF000wCFKVWsmt_5bN=CCpfP1w@mail.gmail.com>
X-Gm-Features: AVHnY4KHYfTu3c9NjEh7-gGu4G_oPSv4ZkBHrghlIhCkbK9VzyhYmoslSQdRSM4
Message-ID: <CAD++jLnKjhw7xhSwg-b0DNm+SF000wCFKVWsmt_5bN=CCpfP1w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: fix deadlock issue
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_025056_824482_DF7091E4 
X-CRM114-Status: GOOD (  11.77  )
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

On Wed, Apr 22, 2026 at 1:44=E2=80=AFPM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Accessing the pinconf-pins sysfs node may deadlock.
>
> pinconf_pins_show() holds pctldev->mutex, and the platform driver
> calls pinctrl_find_gpio_range_from_pin(), which tries to acquire
> the same mutex again, leading to a deadlock.
>
> Use pinctrl_find_gpio_range_from_pin_nolock() to fix this issue.
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Patch applied for fixes!

Yours,
Linus Walleij


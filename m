Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8B6CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 12:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Roa/R3xKoyx9d1QsB+LkhjgOO/Ewqs+tzAO6wvLC2sc=; b=jEysNU2OkfzE/Ba1bEjh32jbQl
	Y1RECU0ObJtU+kNXkES5SWpwsh6orq798Yvf1rw2+Mpp176a9wxJuq4R+GZN5GyfqGIuA4F3uxgGF
	SavF0J3O4l4Lr3yMB9NMBsAq33mUaZxNXa6RT7AWyLYopMW36t5Gw+WYO/g3ZaSCUTJCswUg7v22J
	Ac2pfYIOT6uu7BGj9C1COpZwFHDba1FTfMU2n/byQpIBhiWYvSYBYkJjzq1MIiwRzB3sqau2wvgNT
	vxwxJ8EdSQFIoP7A0cr2GG9778HvNf3RtCnZMZkYGfIIK/WKSY+9wpgbBmc2ACEc5jUDrJqefYYVP
	kOvfmg3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFKW-0000000GFlc-0MWR;
	Tue, 05 May 2026 12:56:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFKV-0000000GFl6-0XQk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 12:56:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 91D1160142
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 12:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4973BC4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 12:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777985810;
	bh=ZUs4wo3g3+7GpdmJ7ncT0CXa7bmF1VEsrvwglg4jLoE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TW8pdnz6ylCu+n5A3jS6uOFfm1r+mrh5QJj/b5ngfXVDaIb6sHGRAklRK+cd8AwyJ
	 LM4uXqHWrv1OQYhOadPOWdI0+97b/ql0+GrGkVegK8/S2QGKL5MSYZaa71wfnd8cPI
	 BtaZlO4QuaxNAyVQCaqeW8pMIP9qhv1FpLcMKgHItIIKnZn+Wc9rdz4yx5dy5wT5PO
	 t/CZudqTq/6Q/Ajl0B6O+Cp5L/3u5wVQrHWbmJYuJ7pg4XoxkaBSFzCIDYWaJm9JQD
	 h4c5Z+uVfXj3DdraDaZGDRkC9kELRIYwtQQwaE2rmuZiTAm9RtmBcbK/VRcD310Tg9
	 A8JBWqsMhnijQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38e7d984096so58805491fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 05:56:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ95pycYUdeVr1uAIN/UUOGUmTixi2zJUakwRI4MyxbKz5qBQhkP8AX69LMf1i6IbH9Si7LPopdQ3YTtUucyxMkC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe3Zj7Bt5tFm4xRHfACxNRWRi56YomR0BYwQ9obwtpQe+7WqsT
	vw0y2M1qpESScuwqnCukt5lkJKELKZF2zCkJHoavbUJSjj4FyWVWbuQc/XYePlNXMdSToJG7LQv
	z2npUQ0u27NLJGA8j2rh5rr1TBmQSpko=
X-Received: by 2002:a2e:be0c:0:b0:38a:a77a:b0b2 with SMTP id
 38308e7fff4ca-393785870femr48588051fa.30.1777985808984; Tue, 05 May 2026
 05:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260505094321.75040-3-krzysztof.kozlowski@oss.qualcomm.com> <20260505094321.75040-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260505094321.75040-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 14:56:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLn-QPagz4m6jkYU6JJS22cRZrsGA=h20JiSvn-3Pxq=Dg@mail.gmail.com>
X-Gm-Features: AVHnY4Igt9-o67zqCdCfXKKYOq79SDn0cypO6X1gGr102Z0s00tmMJ-a4onPwSE
Message-ID: <CAD++jLn-QPagz4m6jkYU6JJS22cRZrsGA=h20JiSvn-3Pxq=Dg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: rockchip: Move MODULE_DEVICE_TABLE next to
 the table itself
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
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

On Tue, May 5, 2026 at 11:43=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
>
> Most of the pin controller drivers already have this correctly placed,
> so adjust the other drivers.  No functional impact.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied.

Yours,
Linus Walleij


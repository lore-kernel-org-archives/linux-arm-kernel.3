Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CD8FB44C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 06:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1ECiro+y58ToY7WgHmDxcU+9/FZEe2xg1peTZknRxM=; b=GUK4Me8MuCtG98EJ+vtcugelJR
	892YnTLovIwdKsPa6EZWkF92bXJ87kT9Pmt5+YtSc9kzttB2IgZp2w611sorYaLawKbExg8OrPqIW
	a+ZYwU1z7BR4C0puxLel6c6JX2XOevsHumcqF0s+LnEB/cS2PZdJqt249/y6VUo+HsJ29uhLrR+Cg
	z4cuxG38MqEUZWt03bw2dxNPipvVylaLPr5gD3+qK+H496SaKmxnC8XMTRTnL0gpRkH5HW8e/HhPW
	YGhmFpxBna+hIp7+AA0sNsTuFx5gq/3GNOlUypWpeQcnV9soD/PE3Zd5Dblw5jBgBNuwfrYHOK+qz
	7T6ikUTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAPi-0000000CjtQ-1GjP;
	Fri, 24 Apr 2026 06:53:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAPe-0000000Cjpx-0fTF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 06:53:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 92ECD60121
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C24CC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013597;
	bh=5Vo3wXPhyKtM3/dyylPu8ExYPGX0PQDeds0ppBEwWBw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GCiiIHeSTEmR0j6Ib97mZN2XuXDNgvlTu74PmDDR68QcbPYet5WOI/ZoNrp5V23e1
	 5NZEJdG8YOfE98sC5lMD4gjJxQrUwYeWOyBaiNdjckIh7jQtpojYxcVhqXmY/oihoH
	 IUCZ/wn97fIA1QHUYFLWgeq4H2Uhko9eo8h2dJvMxZlTjWccr1VrCLGLrKynQrnXnC
	 TaGJks1FJOIr/OhUgwXpRv+NnjJwqGhVTRW8C17uzNELxxLf4mMst3WGF85zrYLfPQ
	 iL1zWh1f8D/l2nSbCMy+FmYb6S4/L/z5Zc3RYyxhI8CkfJFsi4eLfzzOE7RGboGQEv
	 J3HwYpjeyiXIg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a2b636b944so9769802e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 23:53:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+P4VlJyLsz3yAL+Ycl5n5o6z+nA2p/6Cw7RBPBq9tlCVUwhWocNoDRVvscPzeqKsVWtjKpaV4Xhf9DC1Vq9q0n@lists.infradead.org
X-Gm-Message-State: AOJu0YwHLx55DLgkgPNNvBTay9Uhc4JjWHgzPRcIcgMmyXk/z9ouKynH
	WylqtM5E+3jvHw8FOhhATiyNJcnBS7PUB5xBMVuA2yuXppiE/uRTHoguXILrLVJZAuNxFd2xa77
	jJw2T0zh8OXgxP/AnB1gQW6p1kUeqy6w=
X-Received: by 2002:a05:6512:3096:b0:5a4:b0:a081 with SMTP id
 2adb3069b0e04-5a4172bacb2mr9576668e87.2.1777013596043; Thu, 23 Apr 2026
 23:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com> <20260412-defconfig-v1-4-a46918286451@oss.qualcomm.com>
In-Reply-To: <20260412-defconfig-v1-4-a46918286451@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:53:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLmbk8HUppHnJkqND1RzMmdnv6drDP=tx7r20bgL8TFCCw@mail.gmail.com>
X-Gm-Features: AQROBzA06myPZXYAZ7onhAGvH2alsvnS0tmCCwvnJ3RUS04OkeMyeNAR-CX6Lw8
Message-ID: <CAD++jLmbk8HUppHnJkqND1RzMmdnv6drDP=tx7r20bgL8TFCCw@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: defconfig: Drop unused Ethernet vendors
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev
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

On Sun, Apr 12, 2026 at 6:21=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Make going through `make menuconfig` easier by disabling the unused
> Ethernet vendor menu options, where no actual driver for given vendor is
> selected.
>
> Impact checked with comparing old and new autoconf.h:
>   diff ... | grep '^-' | grep -v CONFIG_NET_VENDOR
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


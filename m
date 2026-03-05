Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50535F30946
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 12:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5are5agdAPBNhp9zXXwfI62i9NhVAzVx4EzODqm4TGU=; b=Wqqfa2cVPtv/jGv8vTvRyfJhrf
	/aU/+6qC+u32ZkuyDhW7wgtLlJBi5RfQfezjw/tRMg0MAUlIi2nafYsQOtFCz8jZ94caG3PA4Et/7
	1O8Qdmh5oYI8+xqEYpUDT/dhpo9E4a6qZLIbv2EpGE0C78JatngDNSGJZ6Nb2eOFKOzXESPwKwrFe
	xq/9nAKbwxUQ5Xft9c6/Ly6IRqXygh0ucUsCklh4YxnClFpn9ob1Z1bzffWK7/UhXQzyVtL+9oeiv
	dkJDIFpGM/8JggtZAZghKtTa3jZ0E5b8yztGwR5rFXG3ZWec44PbZbj1YiTQ6w70sYNw9OS1BP2kb
	GOK5J43A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8Hu-00000001pXx-0B5P;
	Thu, 05 Mar 2026 12:58:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8Hr-00000001pXa-3SoI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 12:58:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C1B444579
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 12:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D716BC2BCC7
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772715522;
	bh=5are5agdAPBNhp9zXXwfI62i9NhVAzVx4EzODqm4TGU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dV+iriVYRSVkaLwZWL3RYxUVzrSC8aD09FYxF5jNKwSm5Q1YyPTJsFvSzgCigsGzx
	 HTMHgHkuc6N4hI6dLH2FrL4N6624GGkh2DzGuYN82jY6oeYT+0ZZnShusqFd4BG/Kg
	 B1JkTJG72xoKJ5V5FpMaG3Mde4MvfUWAe6CEvDOvdpIy1wzvO2zDb4SjHoqi08W4+n
	 btTVRpbcLf83Ku7WUyELXiwkcystoAPidj7LlhvuXaGCjIxxaUHfn6lHoq+76cQZRJ
	 8fJ63KdmGO1rwKGTsIhQpXPFjeeJEKbzRjR4F1fnBj4tMXrZ/dSOKAtgx8OzbOSDqF
	 t6okvHWVh3vLQ==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7986d231b3cso105818287b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 04:58:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUk9wMiM9DyZGdhrCXDovLxvUfTDYazWh05j/xXee/yhndXrRQGNEpkULrNqPa5VmjFvs5cS1zbrEPz4wOSPQ2o@lists.infradead.org
X-Gm-Message-State: AOJu0Yyof/ka/8hpBnSaP5lKovR9snQrM7WDesGChCdBFYbbwaVt7ROS
	rO5izyqmR7dgWSvMHAsisS2Rx3Pinz9pcKtUekrV3YL2Pfwnp+O4eLsNbpm+I3CvFJWk7p5LhD7
	HReVjux4hroRwtHdmCeC7/djPTYX2ia0=
X-Received: by 2002:a53:e19e:0:b0:64a:e56f:49fc with SMTP id
 956f58d0204a3-64d07111ed8mr1184395d50.20.1772715522083; Thu, 05 Mar 2026
 04:58:42 -0800 (PST)
MIME-Version: 1.0
References: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com> <20260305-gpio-hog-fwnode-v1-1-97d7df6bbd17@oss.qualcomm.com>
In-Reply-To: <20260305-gpio-hog-fwnode-v1-1-97d7df6bbd17@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Mar 2026 13:58:30 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Zog5wPPiDDBp=mv1nhCgjOZkuG8NtZjvzfhc0KK5Z7Q@mail.gmail.com>
X-Gm-Features: AaiRm52DhevPDbjjg-MMnWaC2zgG9VailzGdf5hJANa7pRgxzk-RHGIdAAju58g
Message-ID: <CAD++jL=Zog5wPPiDDBp=mv1nhCgjOZkuG8NtZjvzfhc0KK5Z7Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] gpio: of: clear OF_POPULATED on hog nodes in remove path
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Frank Rowand <frowand.list@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-doc@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_045843_883373_92B1139A 
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

On Thu, Mar 5, 2026 at 10:51=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> The previously set OF_POPULATED flag should be cleared on the hog nodes
> when removing the chip.
>
> Cc: stable@vger.kernel.org
> Fixes: 63636d956c455 ("gpio: of: Add DT overlay support for GPIO hogs")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

I have no idea how OF_POPULATED is supposed to be used
so I just trust you on this one:
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


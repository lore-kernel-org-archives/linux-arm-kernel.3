Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A81C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 07:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10MqKgCWN5l5ayMaSZ3sDtzeHbQ2dyWabULbQumCxF8=; b=KmTKc/ISpa0a+MPfA7VArtpKX5
	+UhrNIhiqoca06/q84cFt7J1mm069vkDV75dLdsauDZQMzgGCn1R3IpmkhFSylFXELOUk/DSWMvo0
	fDbPxUM4SfAv75XdZLA8GyriQgrd4+PKhDYKFyiodY1cZezuGwu/EPsHwTAvmdQkY9c2IoEolwN1/
	EIspmCt+BiHSfjLLN/eulgBxe62AfvXbAYqdNpDUZKOVgPOsvmCtHoQEOhJv8Tf1o6mftbJz0Id7z
	UqmuYBP18iP79quvqWKT4To4zQkA8zqJ9KTuuDpq0AzunPFSTdRFiR2BFLATBobOg5X6HgoEIlymW
	r86GJcjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCK4-00000003n0O-14Ct;
	Thu, 02 Jul 2026 07:59:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCK3-00000003n08-0JFV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 07:58:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 35B9660121
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 07:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24B11F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 07:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782979137;
	bh=10MqKgCWN5l5ayMaSZ3sDtzeHbQ2dyWabULbQumCxF8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jhZ1mg3k5TY2A/toUrZc7lr4m+TYCytS0SkP1wublCPzlXQLqeAH8R+FuCps1120B
	 VFDOGJXFdTKqNaSTl36sT0Z0NpC8n46eZ+xfWf1eYyPBHyyperD5oYjl8xqYQEJjYa
	 O8KTiXxu/QuFM2ZDDxtTS9qSfuATqMsKvkdoZ1sHljXG4xjKv0wuYa9jm/qB1NyjI7
	 2gTqf1tVRL3QUx8HMs5RZorqpTjey+7A/Kz6sT07lhkbLoawYXzC8dLZFhW/WxYPV3
	 mTyqPiWUnssAeNUlRVhYxu0xg6GO+bzy/2oNUDf5M6zYXOefUNA1fWOo9yPhMamXeM
	 4ccAjfGh27ivw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aec6360133so1015129e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 00:58:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro5km9BKlPn73Uwkr75fNQmpEhzt5WrjHRaVeECmsV25QWNIBy99Zm7lthd3jOgnl1gBPZYcDmYn2Docu5N721H@lists.infradead.org
X-Gm-Message-State: AOJu0YzRohdVdMGR0sMW+CYZmmOZd1g32GiAWZ9uHEawjUpSVBdloot/
	ZGP05psNapnvTYdwTZGMp3KQ7e7wc4fcVHTManQnZ94511ltMsdkH/JWb/lYBowxe8ZebmtOQ5K
	h24vSUDWmh6P6qcDPuX3ModUNe6qVEwM=
X-Received: by 2002:a05:6512:8350:b0:5ae:aabe:de8f with SMTP id
 2adb3069b0e04-5aec67ab255mr919766e87.25.1782979136746; Thu, 02 Jul 2026
 00:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com> <20260701-gpio-nomadik-silent-v1-2-644d10316cef@bootlin.com>
In-Reply-To: <20260701-gpio-nomadik-silent-v1-2-644d10316cef@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 2 Jul 2026 09:58:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLm-yEb4T3T=6w5gcvoVmpQ7mAuju7LWc1vFf1LefsG0kw@mail.gmail.com>
X-Gm-Features: AVVi8CexZYamlN3uYWqCZl1ubYNYnvZZovE5XFNE2fG6ZYZkeQxg0VWkYO3ZBkI
Message-ID: <CAD++jLm-yEb4T3T=6w5gcvoVmpQ7mAuju7LWc1vFf1LefsG0kw@mail.gmail.com>
Subject: Re: [PATCH 2/5] gpio: nomadik: add missing dev_err() call on chip
 populate failure
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Jul 1, 2026 at 6:57=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootli=
n.com> wrote:

> All error paths of nmk_gpio_populate_chip() lead to logging errors but
> this one (ignoring the alloc or ioremap failures that must not log).
>
> Add the single missing dev_err() call.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


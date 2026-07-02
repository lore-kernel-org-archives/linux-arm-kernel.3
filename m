Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD97C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5zNFEg+D8ZtpeEyPbGGNU5KeLegUrcxuf7iPsC017Q=; b=wjdNxtbUeKGfz9MTWVLmpxZe0N
	DvaVxTQZYTY+b4jJw9gv3kcBsGnbOEtFBQY5f3BzyZox46S6DL/5KkCCcO0a4IZFCvlvyALBzuyf/
	LNI72mMGK7ICicjZk00vx4tvN1Weoqsz2qfKCFMUEj/0+1Wwl9sEbub/00lGZ0Zy5ift0xWYeKmvB
	cOvHpPpbMnC3lGHadncn0Mr6SfJKDnP/ubqKKpiKsv5QhqEl6QH6Ei9vMAYDGmXYUtMYCLhEDX+d/
	PnlPhfsAMOj3QX2I6//shrpQhugMJedCzTOyczA9UTJWKlM0MmI8uoaQUP+g++R7Hju0L8X1z17Le
	aJU6XJrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCLz-00000003nUg-41tt;
	Thu, 02 Jul 2026 08:00:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCLy-00000003nUY-3Bf5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:00:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FDDD4139F
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 08:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34AD21F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 08:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782979258;
	bh=v5zNFEg+D8ZtpeEyPbGGNU5KeLegUrcxuf7iPsC017Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=I0Hg0GC9mLILA1x81dAzDZnpnuxMIy1mIHlXC3C0nndWjNFgQy581ZRvefQUQpHba
	 /YSAq65D91CgmIIucDiLXaoSHutryAQJISrU7iQRPqga3khgSt8PFmoSnpqGJhPYVC
	 sBW/4NnKuKPD4iyHcpZ8YHfhQTwF43Nu93THXgvvmAi0s6znKFaL1++HEXwodlAr8E
	 E8mytCSUhSVNSHjiQY1HBe2fPkrY5fG77LdemDVR9L0jESg9Ecatw5b4yK7PZ4oW8R
	 /oOXduoKlk9ZaRI1L4zjNEwJDCqN/VNGfE9dcUeF32OZ93ju1M4ZwT0Tt/AfY3s/wp
	 LLoz9/wSmZMmw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aebbeba529so1427664e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 01:00:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp8pgbNAXsKhr2vxCkL7wmxtE4H80/CMeFoVJZxw1QJjLtTESiXusRd90SFwPs08v52itvTuAmTjaYtqrzBYsQq@lists.infradead.org
X-Gm-Message-State: AOJu0YxkCcvBOkJKFDM80INuJKNEbIKNrWRipi2xf1jsNp3tWrX1+uUg
	Ixa3Bh+frZX3cNtJBHb7YtoFYh8hXCDQtDu6qKG3A/EIMQ/stSeedg6V6Xj4/9QP7OVLBnD9KU1
	KQfgRKuiaiaZGGtuhQs2fGha7uFH5D+4=
X-Received: by 2002:a05:6512:8386:b0:5ae:b886:3ddf with SMTP id
 2adb3069b0e04-5aec67a4216mr860841e87.14.1782979256991; Thu, 02 Jul 2026
 01:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com> <20260701-gpio-nomadik-silent-v1-5-644d10316cef@bootlin.com>
In-Reply-To: <20260701-gpio-nomadik-silent-v1-5-644d10316cef@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 2 Jul 2026 10:00:44 +0200
X-Gmail-Original-Message-ID: <CAD++jLmmHXBC9ni0pcVoB2HNK+osBzgirxH7vLHZaANmoe-tpQ@mail.gmail.com>
X-Gm-Features: AVVi8CeDzqdb95Trp9mVGCMUsgcjERwSWLH6yqQYBpwrUE23KOmffYp25QhDWhI
Message-ID: <CAD++jLmmHXBC9ni0pcVoB2HNK+osBzgirxH7vLHZaANmoe-tpQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] gpio: nomadik: drop "chip registered" log on probe success
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

> Successful driver probing should be silent. Drop unconditional
> dev_info() call that is done at nmk_gpio_probe() exit.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

I actually don't generally agree, but you are using this driver more than
me now so let's go with your minimalist dmesg style for this driver.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


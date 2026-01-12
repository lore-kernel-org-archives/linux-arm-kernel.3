Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E296DC9EC94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 16:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JI2VuzUHBItC1ORh5iM9vn9gn8nD8f7zptIzIdihmE=; b=YdOxQnr4KwgQu88ud/p8OAxa4n
	nmikj7g916y8PupoL6I3BFlDkwDa8n/yPPHiI5t3ZpyF1oTT6KA+iosHfUhHBVnhi9TuVKfe9LojU
	q9VJFVs4+3/D2nwx7NRY5xuJH6yaSO+yaVkAREaDTf2bRyoIdVtZeYYc9D8cOrB/RILqmN9mzms1a
	Ajg++0Rd5ixi2aKknf2KDdk7owUhG+lPwBpvnAMErfNIirxXN9AJNDLaVYuoTRBI74+3+jirKUUtN
	oXmJOtMKJ2/EFbIiyL+Llbz0LsipFZQWT28da3ERExWCbgBOvUZ8KAyfCPO+lRaLf6I6evdHl0L42
	8zluE1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKZv-00000005hsO-3Gu6;
	Mon, 12 Jan 2026 16:15:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKZt-00000005hrh-2Tcx;
	Mon, 12 Jan 2026 16:15:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768234534;
	bh=bYyVTbzbpIwXM0uPnbgo13phUMak6kBFgj53wnMc9SA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HGZNZGy10HGBzqThshbno0nz2XaqOM/284NDxsBeH8qwpN1V29GLTrTGkqMIaH57Z
	 eCt/UsK1RYFn3JfqeapeRZUjIMwoq6KG0NiZ9fpHfB/wdloU8YJpDsMCTP6TvdXVC+
	 aDIu2tcs1/mTsSu+bTinEBjjRa2IU8uPxtXQrufCRv8oF/Qk+Hy5kuq1aVB6Oy51jI
	 KTcZdVVSMY9UpjkvRi9DErTkvZ1rxDXsxsdPQdRfkVs3zkOMXZxUK+r+uOVoTJxpsi
	 EaQtkD5NkkBrRgpZqrdBaWrC1yaPZGEBIUYW5nLdhc4WL7owtCsnmUhLJ0iWpSGvoW
	 u0Ht4PiYdBn/A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C313E17E0FF0;
	Mon, 12 Jan 2026 17:15:33 +0100 (CET)
Message-ID: <803c76e7-30fc-4a0d-ab30-ea779747300b@collabora.com>
Date: Mon, 12 Jan 2026 17:15:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/7] i2c: busses: Introduce and use HZ_PER_GHZ
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi@smida.it>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Qianfeng Rong <rongqianfeng@vivo.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
 Andi Shyti <andi.shyti@kernel.org>, Qii Wang <qii.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij
 <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Ard Biesheuvel <ardb@kernel.org>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_081537_788780_521DF9A5 
X-CRM114-Status: UNSURE (   9.09  )
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

Il 12/01/26 14:46, Andy Shevchenko ha scritto:
> A few drivers for I²C host controllers use HZ_PER_GHZ in numeric form.
> This is less readable and prone to subtle mistakes. Instead, introduce
> a well defined constant and use it in the drivers. No functional change
> implied except one case where 64-bit division replaced with 32-bit one.
> 
> Andy Shevchenko (7):
>    units: Add HZ_PER_GHZ
>    i2c: mlxbf: Use HZ_PER_GHZ constant instead of custom one
>    i2c: mt65xx: Use HZ_PER_GHZ constant instead of plain number
>    i2c: nomadik: Use HZ_PER_GHZ constant instead of plain number
>    i2c: rk3x: Use HZ_PER_GHZ constant instead of plain number
>    i2c: st: Use HZ_PER_GHZ constant instead of plain number
>    i2c: synquacer: Use HZ_PER_GHZ constant instead of plain number
> 
>   drivers/i2c/busses/i2c-mlxbf.c     |  5 ++---
>   drivers/i2c/busses/i2c-mt65xx.c    | 11 ++++++-----
>   drivers/i2c/busses/i2c-nomadik.c   |  7 ++++---
>   drivers/i2c/busses/i2c-rk3x.c      | 12 ++++++------
>   drivers/i2c/busses/i2c-st.c        |  3 ++-
>   drivers/i2c/busses/i2c-synquacer.c |  3 ++-
>   include/linux/units.h              |  3 +++
>   7 files changed, 25 insertions(+), 19 deletions(-)
> 

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



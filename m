Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87758CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 12:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgoSsRH92eS1yRwFvsrdim89BZv82py6Qk1sU6YST2U=; b=4BES4ZfUSBLBB1ascmxhtTAwxx
	8pdJD6ThH1Q6ArZLKQszdQhz5A7NsfuipaK2qp8AtnZl5ewGFOQCLtkUoJsNyaSId+gd9fklmIFAN
	wMAm05U26r8Xa2jrUkjEWjghejzCQEDqym7nMobHp/79dd0ZUal/s8xZMxIpcjC3bzThZklJRIWxK
	1rE9UQCNW+uwcx1996f5iJc6j0eFow2YSz0bUSoVSSPY0RW6+TXoMeKboLUFhlQeNKZNNeIdtZzGm
	Y1HUOWIdgcs8bjZV8nPHNYHo5iKOSuvQCgTYWLolzKZTLt3i2SyGNCW8CoD4yVa2bG2qC/FaEY/Zw
	xcTBbR8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unG9e-00000004cSA-2BIG;
	Sat, 16 Aug 2025 12:37:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unG6z-00000004cJP-33iU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 12:34:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A7F05C3D4D;
	Sat, 16 Aug 2025 12:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D2EC4CEEF;
	Sat, 16 Aug 2025 12:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755347654;
	bh=X0kaiOuEr5a9NvIWyH392M9p1jmj9WcFHXKIc55VwfM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sGiqkoMtEFdRsu4JR7tcvfUH+i6HcQP3hald1uXcvbVur531OOkeZb+M617QI+cRe
	 qD0ceXF3NVOJrk+0zkAdUv66OjSf7An7Klp6LUGSzAknCtEOLIDng9NvGercY2JtJe
	 f01C8Cxn/HwYbal9dUWa8o0fMfuAHCh/7YIYDKZNqsm5vijoleJ511u9Z7WivTzF9t
	 pFDSJp5NDD5J83L/WKLVO6Q0gIYENT6SjdQiBcgQnSo1nZJhVgGT8PrL1BwBBDazSv
	 JSmje84A/J5zB9hPeSKYZiqpx8utZMGriCa5zHt+JzV2MNtmbnmlUe0b2D5M7/Upmg
	 RqWFlCVsMOeHQ==
Date: Sat, 16 Aug 2025 13:34:05 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 05/21] iio: remove unneeded 'fast_io' parameter in
 regmap_config
Message-ID: <20250816133405.5ae57fd6@jic23-huawei>
In-Reply-To: <20250813161517.4746-6-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
	<20250813161517.4746-6-wsa+renesas@sang-engineering.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_053417_818760_71B3CF40 
X-CRM114-Status: UNSURE (   9.27  )
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

On Wed, 13 Aug 2025 18:14:51 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Applied. Thanks


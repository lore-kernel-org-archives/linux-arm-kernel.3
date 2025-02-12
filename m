Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D67C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 18:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUYlrivVsyugZVPMjqeEa50o/uftrAaXb4g0AKp9+6g=; b=MHg2xF0MCyvr/e7JZqD6PGlIIX
	L1b6GKYuSrynMGDMjDOufWDaQWsQv3EKH8Kb1oHxKn4ouqqDR9xoEomyaoWJRVUDfVV3ygLR6vwMC
	z2HdJCKF+zmjdqxTR5HKjbjQQMJs4rzi0fGgf1QfYPG2D8RiDddCtfFOt6MSjkNEYfOo+MSTK1hzH
	NVlF7qPcCKd/MmevO3zHR7tS9zQFJ2ID7orO7weQshA+iYYPkkTz1hsJ277/GaTiZB58yRA4eHemO
	el3W8Y/52JC3E1ZU9jfZzxvJq1VTPoRP0Qiqozm/G8meSOWs47bDTfWNLYp351ngCAd1XyVWqcwkN
	NQZwkhRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHf6-00000008VXx-3wKT;
	Wed, 12 Feb 2025 18:40:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHbo-00000008V2R-0q3N;
	Wed, 12 Feb 2025 18:37:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8CF67A40A22;
	Wed, 12 Feb 2025 18:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6310C4CEDF;
	Wed, 12 Feb 2025 18:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739385434;
	bh=MqYIPwPX2fN8FIm6K1ROUFQveHjsiR7V4H6VXdFj48M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sxuLxvnqYXvHV2r5iyP2hIHTQFy+b6N6Ao/6tx20f7FpDH3VwCNEm+Z4FSaBJ5mhV
	 PDJ7cG83QT9xDGGYT1VhmIChi9UVRvNmP2mmOrUOdx0N7TrjOE6xnvGdXDoucs3UEa
	 0BzshAx9HiG9rZO3C6a/ozETYKkH7x2TuPJtiSJlhyBpfJVbZLuMJhCKdpFl0VfaaY
	 exJOsphy9AxhVXxyU2zXOIyvMRT1AKDM0sAX0AqKxkSrbUAfRGctKLankRC8EzJrzn
	 hk1Cv72NdUge8xO7ycnz/7Bp/q1sM7iP029fAw4xGS8vmuMj+/6GkncpBkFHHpFvQ4
	 1GU4T1McR0UAg==
Date: Wed, 12 Feb 2025 19:37:08 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Zoie Lin <zoie.lin@mediatek.com>
Cc: Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, teddy.chen@mediatek.com, 
	joseph-cc.chang@mediatek.com, leilk.liu@mediatek.com
Subject: Re: [PATCH v4 0/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Message-ID: <minka4xfg4pymy4hjekooqyqk6xpbgenacsw32u6pdf3llcyyl@eh4u4ohccx3d>
References: <20250211144016.488001-1-zoie.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211144016.488001-1-zoie.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_103716_301084_B30089A7 
X-CRM114-Status: GOOD (  21.70  )
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

Hi Zoie,

my comment was on the [PATCH v3 ...], this should have been
[PATCH v4 1/1]. If you use git-format-patch, most probably you
will get it right.

If you have more than one patch, you can use the --cover-letter.
option to get the patch 0/X.

On Tue, Feb 11, 2025 at 10:39:37PM +0800, Zoie Lin wrote:
> Introduce support for runtime PM operations in
> the I2C driver, enabling runtime suspend and resume functionality.
> 
> Although in most platforms, the bus power of i2c is always
> on, some platforms disable the i2c bus power in order to meet
> low power request.
> 
> This implementation includes bus regulator control to facilitate
> proper handling of the bus power based on platform requirements.
> 
> Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>

Is it possible to have an ack from Qii?

> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 73 +++++++++++++++++++++++++++------
>  1 file changed, 61 insertions(+), 12 deletions(-)
> 
> This series is based on linux-next, tag: next-20250210
> 
> Changes in v4:

what about the previous versions?

> - Removed unnecessary variable initialization.
> - Removed unnecessary brackets.
> - Corrected grammar issues in the commit message.
> - Confirmed autosuspend delay is not necessary.
> 

...

> @@ -1472,13 +1507,18 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	ret = clk_bulk_prepare_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	ret = clk_bulk_prepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>  	if (ret) {
> -		dev_err(&pdev->dev, "clock enable failed!\n");

Why have you removed this dev_err? You coulde have rather changed
it to match the error. While at it you could also replace it with
dev_err_probe()

The rest looks good to me, I'll be happy if you can have an ack
from Qii.

Andi

>  		return ret;


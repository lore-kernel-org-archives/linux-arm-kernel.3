Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A641C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 09:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftRbte7T4ElO9W9tRcYR3ZcEJ5DoXrSeyHGUb8+QPCs=; b=kIPzl3pqRpt2GgWpyb41rVvWBl
	7uz+viSZX2vL3Yrg87IB3ZLLGcHec/8gKOkhA1664KZq3VuHJRLdSmt1UFbFKIXiMKwXj1o/y9uJU
	5Fq03fC4QYgE0LLJO/mrZmMUpzt4vWGJilPZACTfbD0CUltyUgz9bodXHj0Sk9hw9B1cQpZqxQ+VZ
	DgWBuZqx81rrU6+BTYUAqny3jVrC4tj6EvcCzZgt/+lYqw51DfLbZyOtpAO7W6DxW9rF+QUv/4/SB
	wgYTDq+e7XBK2YMwb4Tgu3NIvWb4YHRAV8t0wSemG4KhYjoTZiN7mkXe6zK4nA98LEISMHvzsv3PK
	HKBMJWkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWXc-00000003l4I-0t2v;
	Thu, 27 Aug 2026 09:37:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWXa-00000003l3s-3Vzy;
	Thu, 27 Aug 2026 09:36:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 49C14600D4;
	Thu, 27 Aug 2026 09:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4901F000E9;
	Thu, 27 Aug 2026 09:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787823418;
	bh=ftRbte7T4ElO9W9tRcYR3ZcEJ5DoXrSeyHGUb8+QPCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RFl7Tl3/yLatV9LE6qXyJRB4RbWbl98BsaqdGi3+7RSoUCCVi2A1aq7LiEqVYeaT/
	 +HDT/YgyH0nFRNIbMGzsbzwDfmE1q31c7ddzzAJ6VzSFcmrp/LQYERA4aJQcyFooJX
	 oFSMNAqOrTKlfYlONjuY0bRIYOCzhWdBbVL6AiDaS3B0KVB2ivK/wLcSzf+FUw5jjh
	 iz9e8AODCkrNu4/cfyhICSw1MvtDRVsfHurmuC8X3jS9WyvVMCPNw82iKw3EhL7pZh
	 VIlJvjOKtHnBLFU/cfFvDkq/khg4YObj3B6iJRdixGUZ+GBPnr4TPcWntoNwaUHRj2
	 UkdC0gXpyK9rA==
Date: Thu, 27 Aug 2026 11:36:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/7] watchdog: mediatek: Add wdt/toprgu resets for
 mt6589
Message-ID: <20260827-clever-cherry-zebu-6a98f1@quoll>
References: <20260819101853.44681-1-l.scorcia@gmail.com>
 <20260819101853.44681-3-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260819101853.44681-3-l.scorcia@gmail.com>
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

On Wed, Aug 19, 2026 at 12:16:23PM +0200, Luca Leonardo Scorcia wrote:
> According to Android sources, mt6589 has 12 reset bits in the
> WDT_SWSYSRST register. Populate toprgu_sw_rst_num to allow toprgu resets
> in device trees of the many compatible devices.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  drivers/watchdog/mtk_wdt.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 91d110646e16..f8208fb0f723 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include <dt-bindings/reset/mt2712-resets.h>
> +#include <dt-bindings/reset/mediatek,mt6589-wdt.h>

I do not see how you use the bindings here, so my previous comments
stay. You just ignored it and never replied. In such case:

NAK

Best regards,
Krzysztof



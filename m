Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BA8C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 07:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXwwW5MflXtebrops4jKjGoABUQ/YtxAfVoVUCVVlbY=; b=K6thL/I6cquCbLKB0ntd6xVUmg
	6umj3J9zFut7pZkRAkztFvHHSrsqrICCBV50qHV2rtok5XKXJNyss5d/mPFGRcL5jS86z2xTl2JI1
	7Hm/gt37316/v+GULylkMISn6cD1+EHytieX/hKO1hUcfjxfP8FmZ0qIq7FLETotJ3KFnqmvSDVvc
	7f5UdBHlbpRQLT1fbkAusvEW41tv3oHQaLlQWdufWG9o5Oy5BCfBJFG0I1RJHBaTIel2OEcFa4qS6
	r8uoGmJHHoNFpPfDxyDzvYuyUH29ko3DOWnlqDUvqHhsYas3sBwNlbWN0i+mT7/+1PDCpTkPX3dLb
	4rrEp/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x37OT-00000004oWG-43ob;
	Sun, 06 Sep 2026 07:34:25 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x37OR-00000004oVu-3ToN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 07:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=HXwwW5MflXtebrops4jKjGoABUQ/YtxAfVoVUCVVlbY=; t=1788680063; x=1789889663; 
	b=GQ4A+f37BwnBN05k6uQ5H58iNTJ5WxKB5zQIueDrOkNY1LKMdL37r18plhbDisvI9I2KvRn3Ac3
	D6ocRcmd0zBrt0rJ+JGSz3sdv1kvjLNxo30EvRRh069bSG18G0KR6+iF/n7F1MyokbnIZ3tzKosyt
	09WBGhEiNXzUf8fMOjRM1al5Yrhxs1ZKzdAm4GtHlmpsee8+yFrZ1VkvnnG+uQV3Tq7vuWYyXE+zf
	zaYuBAeXoP/G6Ia2+u2QKIk/FteIz8wNXQiApCIGCB29rDnnbgESY3Rob9/dW7Pxu7lBupKiijTw4
	QPwtfk2Ml+d2c9WK62oaCPwisnFlMVph/WCw==;
Date: Sun, 6 Sep 2026 09:33:01 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Andrew Davis <afd@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, Kevin
 Hilman <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>, Andi
 Shyti <andi.shyti@kernel.org>, <linux-omap@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/8] i2c: omap: Drop bit shift for I2C register
 addresses
Message-ID: <20260906093301.01fa544e@kemnade.info>
In-Reply-To: <20260904131252.2126353-2-afd@ti.com>
References: <20260904131252.2126353-1-afd@ti.com>
	<20260904131252.2126353-2-afd@ti.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_003423_875327_2A646C65 
X-CRM114-Status: GOOD (  12.97  )
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

On Fri, 4 Sep 2026 08:12:45 -0500
Andrew Davis <afd@ti.com> wrote:

> No remaining board device uses a shift other than 2, and no DT supported
> platform ever did. We can drop this flag and use the pre-shifted register
> addresses. This simplifies the register access.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  arch/arm/mach-omap1/i2c.c              |  4 ---
>  drivers/i2c/busses/i2c-omap.c          | 50 +++++++++++---------------
>  include/linux/platform_data/i2c-omap.h |  5 ---
>  3 files changed, 21 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/arm/mach-omap1/i2c.c b/arch/arm/mach-omap1/i2c.c
> index 94d3e7883e027..bc7828a858941 100644
> --- a/arch/arm/mach-omap1/i2c.c
> +++ b/arch/arm/mach-omap1/i2c.c
> @@ -61,10 +61,6 @@ int __init omap_i2c_add_bus(struct omap_i2c_bus_platform_data *pdata,
>  		       OMAP_I2C_FLAG_16BIT_DATA_REG |
>  		       OMAP_I2C_FLAG_ALWAYS_ARMXOR_CLK;
>  
> -	/* how the cpu bus is wired up differs for 7xx only */
> -
This could perhaps go into the commit message, but besides of that
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13A2CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5aEzpioEnVAaVyWyNZeOyoP4rfKIhvC7XDRdVAv5wyI=; b=xZpxZ7qh4LcyW0p943hwokCovh
	fDnkJRkeV7U/1N0ah4Pw62kU+0NkQ/F4FJrwFxFWxt11NWlwSQX0zabirlltyUsvpMVhsp5BDysv/
	Aj1GJgIKIaXFSNML8OykUT54dyu7iievXhqO5XuMZi9sMlcZ06hk/5AtJV6eb5/pnfaBK2drbC3Bw
	SKl2QUb5EE6HpDUnyknwf3aF+6K9aCKCT9UKh9V8TlPuNBLQe8EXxsCU2dA0/A9k+urJwxNoyr1hG
	Tga4EtqLB71b7+ct58cV7VQttXoy5BKUrKxkJzNRe7ZHgw1hJZMmci7oTbtoiXxJFqKZoyKObQgoJ
	ic35/dSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFHN-0000000EaL5-42xY;
	Tue, 02 Sep 2025 00:53:46 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utCrA-0000000E5tV-17oE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 22:18:33 +0000
Message-ID: <0a5588c2-bac5-4d9a-a726-57c6d22341ff@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756765109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5aEzpioEnVAaVyWyNZeOyoP4rfKIhvC7XDRdVAv5wyI=;
	b=KTszi41xFK5aOcCPIZ/WHGDkVYDB8Nn0oYztx9Mg4O2/Wh6EFjfUcyAHQ1D8reV1U13jm0
	6aJGFPbvPKDsjAML+vjZ+BG/Av8+/nLdirTRfy9pWDx5R8vGyiIz4izcWTYhQ1bwz6bF8l
	5K7YULnrmHNK/AfcH1NPULRd89QPAIE=
Date: Mon, 1 Sep 2025 23:18:15 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net] net: thunder_bgx: decrement cleanup index before use
To: Rosen Penev <rosenp@gmail.com>, netdev@vger.kernel.org
Cc: Sunil Goutham <sgoutham@marvell.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, David Daney <david.daney@cavium.com>,
 "moderated list:ARM/CAVIUM THUNDER NETWORK DRIVER"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250901213314.48599-1-rosenp@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250901213314.48599-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_151832_462166_174710BF 
X-CRM114-Status: GOOD (  16.37  )
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

On 01/09/2025 22:33, Rosen Penev wrote:
> All paths in probe that call goto defer do so before assigning phydev
> and thus it makes sense to cleanup the prior index. It also fixes a bug
> where index 0 does not get cleaned up.
> 
> Fixes: b7d3e3d3d21a ("net: thunderx: Don't leak phy device references on -EPROBE_DEFER condition.")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   drivers/net/ethernet/cavium/thunder/thunder_bgx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
> index 21495b5dce25..90c718af06c1 100644
> --- a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
> +++ b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
> @@ -1515,11 +1515,11 @@ static int bgx_init_of_phy(struct bgx *bgx)
>   	 * for phy devices we may have already found.
>   	 */
>   	while (lmac) {
> +		lmac--;
>   		if (bgx->lmac[lmac].phydev) {
>   			put_device(&bgx->lmac[lmac].phydev->mdio.dev);
>   			bgx->lmac[lmac].phydev = NULL;
>   		}
> -		lmac--;
>   	}
>   	of_node_put(node);
>   	return -EPROBE_DEFER;

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>


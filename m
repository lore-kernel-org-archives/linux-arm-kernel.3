Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDA6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 07:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIBtgCFszTWP1qcdbZOl4sVMRlBDgVmkXu+0qxoupHs=; b=4M5hp4AORR2vXA0U+O2SgJ+FP8
	uGAR8rgRNih+kHW4UZhvqQdiUl0bSpVgp5vUXqsEydD9GrKS5FQsSChfrX6fxuKxr6T5ZGnXP82mI
	g4ZR7DslI40UreWPJPHZpyuETDDb401rZfiytdMN3gyKM95/nIgB9pLbSdkY11pZCLLZQyeZiCXEK
	/Z0kkgD1fOMJlQMxTeBDMaHW3iR6lMvR//jmG/rfs6zKLSHE6SG/mvetFnKfS6ZyskBJGyFWj2iGI
	VkIFbWDAMutF3gqLQTe2OZxbPOXH6E1zDns2n7gRPBPbcrXEnYznuovhy4m6x52UzC0r9H4iKPHMj
	96M8V0Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdg0-0000000Bir9-132S;
	Mon, 06 Jul 2026 07:23:36 +0000
Received: from relay.yourmailgateway.de ([188.68.61.103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdfx-0000000Bipl-0Bls;
	Mon, 06 Jul 2026 07:23:35 +0000
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4gtwnV2DHtz83DZ;
	Mon,  6 Jul 2026 09:23:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1783322606;
	bh=7BcUALbaQ0crsQznMwR03L85X/3Y7vchJUpjg0YxJ88=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D6td/E/MGunn50kBB5L2rSgdnxhKTqXeXsyhhT1qHrqKo2WwaVYqou4x/lE6HcOnk
	 fKjFGrAfeq3nF1BbTfxSVF6UV9XaTYZW0pTCZZwuIpb4X0zVpb64uIjcCXZd1N2Xbe
	 vwE6FviGxplf8+jHgpbAwe7eGR1o/ozwq0UIdRneKq4si1d6hV3KjBOqwUYsA1Jyu/
	 o8zJe5gICB1t7UEbOLy/2YmRIylbDndC12k8ev4lGGny0IM3CpNP7UCVvbNQZ6Qbqx
	 h3Mkf2boyEgkabmTxLm+EzlqI9zrbVQLfp4QuhQGrK8iJs5UZNRvXMVs8rtsmtb2za
	 gvGlqB7EQdmCA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4gtwnV1TStz839R;
	Mon,  6 Jul 2026 09:23:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gtwnS2ycRz8tfB;
	Mon,  6 Jul 2026 09:23:24 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 1173E603B3;
	Mon,  6 Jul 2026 09:23:22 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <036cc81d-115a-4c0e-9542-71ed2ee04e9b@leemhuis.info>
Date: Mon, 6 Jul 2026 09:23:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next] wifi: mt76: fix MAC address for non OF pcie
 cards
To: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Klara Modin <klarasmodin@gmail.com>,
 Tobias Klausmann <klausman@schwarzvogel.de>
References: <20260630210215.400379-1-rosenp@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
X-Enigmail-Draft-Status: N11222
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <20260630210215.400379-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178332260404.335435.16724517191704331600@mxe9fb.netcup.net>
X-NC-CID: MBZYx3B8fq+hVNOQQyB10TWknSYHbMIMdxf5mTcosreFLKr2VrU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_002333_814707_9928511B 
X-CRM114-Status: GOOD (  18.64  )
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

On 6/30/26 23:02, Rosen Penev wrote:
> If seems the check for err is wrong as the proper macaddr gets written
> to from the EEPROM itself. Meaning checking err from of_get_mac_address is
> wrong as the proper macaddr has been written by this point.

By our submission guidelines and requests from Linus this afaics should
also contain:

Reported-by: Klara Modin <klarasmodin@gmail.com>
Closes: https://lore.kernel.org/all/ajRmlyx_AEGybykL@soda.int.kasm.eu/
Reported-by: Tobias Klausmann <klausman@schwarzvogel.de>
Closes:
https://lore.kernel.org/linux-wireless/30a90714-02d8-45f2-a7f1-4cfe0627d50b@skade.local/

Both of them now CCed, too, to give them a chance to provide a "Tested-by:".

> Fixes: 31ee1582717e ("wifi: mt76: fix of_get_mac_address error handling")

Given this and the reports linked above this afaics should also be
tagged with "wireless", and not with "wireless-next", as this commit is
in 7.2-rc1 -- and thus ideally should be fixed by now. See
https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed,
which contains links to these quotes from Linus:

""But a user complaining should basically result in an immediate fix -
possibly a "revert and rethink"."" and ""It's also worth noting that
"immediate" obviously doesn't mean "right this *second* when the problem
has been reported". But if it's a regression with a known commit that
caused it, I think the rule of thumb should generally be "within a
week", preferably before the next rc.""

Ciao, Thorsten

> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
> index b99d7452800f..afdb73661866 100644
> --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> @@ -181,7 +181,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
>  	if (err == -EPROBE_DEFER)
>  		return err;
>  
> -	if (err) {
> +	if (!is_valid_ether_addr(phy->macaddr)) {
>  		eth_random_addr(phy->macaddr);
>  		dev_info(dev->dev,
>  			 "Invalid MAC address, using random address %pM\n",



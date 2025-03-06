Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788EEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 23:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2c6AS1rlUDUzvA6Yu68aG7T+Ty/a7PAe/Tq0jI31fc=; b=PFebzfRhEQn+MiA50Zfjxwc999
	dfhHTmY/AZYK0p8bG/9QbzsjQKoLEx84r4CoWS4cuPdJ4danvbIr9RbYA8S14zxlj8vF3gw8cAcF4
	JS6orHOCVrrwyAoWn16CIM2KmRAa5dN/nf4b/4uRqxl/LRl9zHdWwenxlm8Euc84ZuLe6LXAIksEQ
	alFHiNIfNSOYfvzgTGXwjettMlW0Hj2qO4Nou3MXgRS+wqXMGmcXxDFBSh0ihAKwL5RflU1gdnHFa
	1e5JMhx5uSC3eJnP5h2p/pbFXQ1G2ghogFKij8cCJ45TdylDxHhJMvqgnC5gAvOOo1NWE7B1H832V
	Ox2A2mKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqKgy-0000000CUqA-22ai;
	Thu, 06 Mar 2025 23:31:52 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqKeA-0000000CUPM-0YbZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 23:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741303737;
 bh=q2c6AS1rlUDUzvA6Yu68aG7T+Ty/a7PAe/Tq0jI31fc=;
 b=tv1LwmEHL6b6OqO03H5ZgDBFbrFwURY4t6IPOqGnRRwB0gAhhNkd0CSZsaq/0TkdLdANV7z8o
 yz7+DFteQQHUOGunubrXGL/fh5AkkwQZBFS3C/vuTsF1dtWPv6Ru9WS/ylwim6oqPhkxbRcP93G
 qgNDyDfaKHIjskJWrU17gUCZgpVxaGeV1GXQDjQN67zQQ3rb4ALJgW/lwbcX5HAhpAaKROMk42Y
 n9oVWS1GH3ZVIBpMJalLXBXiGehG5FKB1dQVn36vwlJeg/O5+/REb6hYUMErIsL8OkqIR3GNFkW
 faobwQaHT1A5d07aDw6uC8ZkPmH3yKtFs2VqIYXaaWkw==
X-Forward-Email-ID: 67ca2fafc1763851c065d15d
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <624f2474-9a39-46a3-a6e5-f9966471bf3d@kwiboo.se>
Date: Fri, 7 Mar 2025 00:28:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] net: stmmac: dwmac-rk: Use DELAY_ENABLE macro for
 RK3328
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Wadim Egorov <w.egorov@phytec.de>,
 netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250306203858.1677595-1-jonas@kwiboo.se>
 <20250306203858.1677595-2-jonas@kwiboo.se>
 <d6b15dc2-f6b2-4703-a4da-07618eaed4db@lunn.ch>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <d6b15dc2-f6b2-4703-a4da-07618eaed4db@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_152858_211882_F07BF14E 
X-CRM114-Status: GOOD (  17.28  )
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

Hi Andrew,

On 2025-03-06 23:25, Andrew Lunn wrote:
> On Thu, Mar 06, 2025 at 08:38:52PM +0000, Jonas Karlman wrote:
>> Support for Rockchip RK3328 GMAC and addition of the DELAY_ENABLE macro
>> was merged in the same merge window. This resulted in RK3328 not being
>> converted to use the new DELAY_ENABLE macro.
>>
>> Change to use the DELAY_ENABLE macro to help disable MAC delay when
>> RGMII_ID/RXID/TXID is used.
>>
>> Fixes: eaf70ad14cbb ("net: stmmac: dwmac-rk: Add handling for RGMII_ID/RXID/TXID")
> 
> Please add a description of the broken behaviour. How would i know i
> need this fix? What would i see?

Based on my layman testing I have not seen any real broken behaviour
with current enablement of a zero rx/tx MAC delay for RGMII_ID/RXID/TXID.

The driver ops is called with a rx/tx_delay=0 for RGMII_ID/RXID/TXID
modes, what the MAC does with enable=true and rx/tx_delay=0 is unclear
to me.

> 
> We also need to be careful with backwards compatibility. Is there the
> potential for double bugs cancelling each other out? A board which has
> the wrong phy-mode in DT, but because of this bug, the wrong register
> is written and it actually works because of reset defaults?

To my knowledge this should have very limited effect, however I am no
network expert and after doing very basic testing on several different
rk3328/rk3566/rk3568/rk3588 I could not see any real affect with/without
this change.

The use of Fixes-tag was more to have a reference to the commit that
first should have used the DELAY_ENABLE macro.

Regards,
Jonas

> 
>     Andrew
> 
> ---
> pw-bot: cr
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip



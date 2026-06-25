Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6532CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 07:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKhlYO1rWwC1+kuhbZdMLAovIe+I8+auK56i6UqdxkU=; b=jNwlE3MslWUPPxxAb6BTfxO/D2
	/s72B2RauZss37DPxYICak5JsBg2Ldgz1AZ/rkZ14G+iYjGVePp9xoGgg0YXA3blCn9vH6euOhz+o
	Eswj9mmf4O6zk1OwGjWm5wTHLrRwskJIjuqkofq3gNDrjVlVDtiGzGFUW59Pa3RKbvyYDCQ5TORLT
	gZxTihiNaNzZgAsyhdrAchRGmBYh+EudmbiCRlqMY5tdnEDyf6J0g/FRA8Z8rnJsHdo+TNZ9FdsQW
	9u2D7No0w5ryBqcWrxlRS+AW6Fzba/DBYlpxH/fTT2J9fWUW5+Uhebjhtbjq4CvrCH3WiEhuabAtr
	zxB/anyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wceBk-00000008k73-3itv;
	Thu, 25 Jun 2026 07:07:52 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wceBg-00000008k6X-2mAm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 07:07:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C1206C5CD4A;
	Thu, 25 Jun 2026 07:07:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73EA05FF03;
	Thu, 25 Jun 2026 07:07:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82406106C84DD;
	Thu, 25 Jun 2026 09:07:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782371261; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=HKhlYO1rWwC1+kuhbZdMLAovIe+I8+auK56i6UqdxkU=;
	b=njkmDsA57+ghNCGe6eKbMng2cExlwQSFlMa2v9ma8N9ihXXLAquwJMSQW1SeP2sWl3dijT
	9penFFUrSGsFD+fdJMrDAQAr7oxudkV38rDxir3nKfhqI9chafzMDZq2d0XMA8MEr2K3OR
	ePw7YOSo/d5AqTz6rkcqcb8j54f/pm+Vv36B24KppvdfKyaR5ePLF3xLgGvMq3ZDG48brq
	YqV6EmqQUCSDa1QJf4MUAHOWyGk4Uou3HOi2qTGGO2U4bTSwJUEQ2+LEFUCqA2FjUeLQLy
	DaMXHvArxM0vlYr/QyB8PjiYwXipakxHWoZZl8iZa3JeOQQu3+PCBdP5wKPKLQ==
Message-ID: <2a92fd9d-42b3-4564-b784-ec504d4d82b8@bootlin.com>
Date: Thu, 25 Jun 2026 09:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: fix missed le32_to_cpu()
To: Jakub Kicinski <kuba@kernel.org>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260622143707.497198-1-ben.dooks@codethink.co.uk>
 <b375d36c-112e-4662-b538-fd10fa927ecc@bootlin.com>
 <20260624192205.4485cd61@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260624192205.4485cd61@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_000748_878252_0183F4EC 
X-CRM114-Status: GOOD (  11.13  )
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



On 6/25/26 04:22, Jakub Kicinski wrote:
> On Mon, 22 Jun 2026 19:51:39 +0200 Maxime Chevallier wrote:
>> Hi Ben,
>>
>> On 6/22/26 16:37, Ben Dooks wrote:
>>> The print in ndesc_display_ring() sends the des2 and des3
>>> to the pr_info() without passing them through the relevant
>>> conversion to cpu order.
>>>
>>> Fix the (prototype) sparse warnings by using le32_to_cpu():
>>> drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17: warning: incorrect type in argument 6 (different base types)
>>> drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    expected unsigned int
>>> drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    got restricted __le32 [usertype] des2
>>> drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17: warning: incorrect type in argument 7 (different base types)
>>> drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    expected unsigned int
>>> drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    got restricted __le32 [usertype] des3
>>>
>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>  
>>
>> I agree on the principle, but this isn't a fix so this'll have to wait
>> until net-next re-opens :)
> 
> Humpf, why are we not seeing this on x86 allmodconfig ? 🤔️
> 
> $ make C=1 W=1 drivers/net/ethernet/stmicro/stmmac/norm_desc.o 
>   DESCEND objtool
>   CC [M]  drivers/net/ethernet/stmicro/stmmac/norm_desc.o
>   CHECK   drivers/net/ethernet/stmicro/stmmac/norm_desc.c
> $

Heh good point indeed !
  
>>> Fix the (prototype) sparse warnings by using le32_to_cpu():

Ben, what's this "prototype" sparse ? a custom tool of yours that
you used to find that ?

Maxime




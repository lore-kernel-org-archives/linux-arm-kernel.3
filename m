Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59847CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 09:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBtkAe6H+jyGj4tt5HXrxDOSNwUiyry3aDabLs2QBuI=; b=PhYIoGt3X9VJf8iR4cVEp/rW31
	cagF5GrAKBwjaekgDmdvMBHTIGh5bZJy4F9Diq4PNsw8bLooJal2IVuvuLZKcyXovUtW+uaR3Pf5V
	C9AsKLGFyyQygiLfVO/HxO6/Lg1T2UD8JTzhyT6dv4X7XbnzaTQzX+Ngd8ET+xs73kw1Xy/L7bG+R
	VG0kDO8FudEJjTteYFxmcfK/Gmh44Neil1iLL9synwf2Nm/mCn++laItQhG+DOFd5AkojoUOu12w8
	VS3qyHO6CJkHFwyvOx4e9V3pcEfR6MFBGVUZ2ftUr+dfvQoEVxJ51Lyf8GO9uz5pJZU7j8Fi4/rRY
	lNv2YDgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSPA-00000000bRk-39Do;
	Fri, 05 Sep 2025 09:06:48 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRAi-000000008Av-3ntd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 07:47:50 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1757058467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rBtkAe6H+jyGj4tt5HXrxDOSNwUiyry3aDabLs2QBuI=;
	b=wbJMk1A9M/sLp/JYaMOxP5tGNweS3NYiR5ynw15kjZMAZ5rUMMSzHOnG1xBv+8gq4Vxhj+
	oI1zFvBrXNGizVzbHofs4WCKcyD7In5isJOgPj+8Vc8aIWO2wap9DplKViLeXEQvFB8dPm
	7gY5pnY/L4llUs8PDxJdWy3PUK7IXezT+B8lUw59CJpDwBlURZ2PzaLH6DlsQOawbKMPvJ
	guPWRrINA9tUjXJ9RppdoorgcwTpGQJ3k7WnJkAgcttp7blEXkozcrCNWGk+LIl2jBelZk
	J66iUGfBnBHmZecbdPkARyTfSWWr6SglxrlRTY/2RM77NlSX7RQ+PPrxzTIH6Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1757058467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rBtkAe6H+jyGj4tt5HXrxDOSNwUiyry3aDabLs2QBuI=;
	b=NJs6nJbEfespe8MIIJCa7ECvbrIBkCIhMite81FenHjk7bkCHnKDVUp/y1C6hXCIANO45v
	SdDXOIvxzzqVzYBg==
To: Ryan Chen <ryan_chen@aspeedtech.com>, Eddie James
 <eajames@linux.ibm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 4/4] irqchip/aspeed-scu-ic: Add support AST2700 SCU
 interrupt controllers
In-Reply-To: <OS8PR06MB7541CD16E659666868EAECB9F203A@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250831021438.976893-1-ryan_chen@aspeedtech.com>
 <20250831021438.976893-5-ryan_chen@aspeedtech.com> <87y0qx0zqu.ffs@tglx>
 <OS8PR06MB7541CD16E659666868EAECB9F203A@OS8PR06MB7541.apcprd06.prod.outlook.com>
Date: Fri, 05 Sep 2025 09:47:46 +0200
Message-ID: <87tt1hwdb1.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_004749_091658_F83EEAB3 
X-CRM114-Status: GOOD (  12.09  )
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

On Fri, Sep 05 2025 at 05:55, Ryan Chen wrote:
>> So you have two different handlers. Why can't you provide two different
>> mask/unmask/ functions along with a seperate irq chip instead of cluttering
>> the code with conditionals. Thes two variants share no code at all.
>
> I will add irq_chip in SCU_VARIANT, like following.
>
> struct aspeed_scu_ic_variant {
> ..
> +	struct irq_chip	*irq_chip;	
> };
>
> #define SCU_VARIANT(_compat, _shift, _enable, _num,  +_irq_chip, _split, _ier, _isr) { \
> +	.irq_chip		=	_irq_chip,	\
> .....
> }
>
> static const struct aspeed_scu_ic_variant scu_ic_variants[]	__initconst = {
> 	SCU_VARIANT("aspeed,ast2400-scu-ic",	0, GENMASK(15, 0),	7, &aspeed_scu_ic_chip_combined,	false,	0,	0),
> 	SCU_VARIANT("aspeed,ast2500-scu-ic",	0, GENMASK(15, 0),	7, &aspeed_scu_ic_chip_combined,	false,	0,	0),
> 	SCU_VARIANT("aspeed,ast2600-scu-ic0",	0, GENMASK(5, 0),	6, &aspeed_scu_ic_chip_combined,	false,	0,	0),
> 	SCU_VARIANT("aspeed,ast2600-scu-ic1",	4, GENMASK(5, 4),	2, &aspeed_scu_ic_chip_combined,	false,	0,	0),
> 	SCU_VARIANT("aspeed,ast2700-scu-ic0",	0, GENMASK(3, 0),	4, &aspeed_scu_ic_chip_split,	true,	0x00, 0x04),
> 	SCU_VARIANT("aspeed,ast2700-scu-ic1",	0, GENMASK(3, 0),	4, &aspeed_scu_ic_chip_split,	true,	0x00, 0x04),
> 	SCU_VARIANT("aspeed,ast2700-scu-ic2",	0, GENMASK(3, 0),	4, &aspeed_scu_ic_chip_split,	true,	0x04, 0x00),
> 	SCU_VARIANT("aspeed,ast2700-scu-ic3",	0, GENMASK(1, 0),	2, &aspeed_scu_ic_chip_split,	true,	0x04, 0x00),
> };

You have this split_ier_isr field already, which should be good enough
to select the chip to assign, similar to what you do with the handler, no?

Thanks,

        tglx


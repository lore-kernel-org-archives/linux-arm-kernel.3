Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273B8CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 01:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSAGEycEpcf5H7+zsKm3/4zBAwQ5+Zk/RKqQOluMe7c=; b=yska5yB7r8OiBChXhUuIyc7fgh
	1iy4lIWbsuyUJoweGrVOE5kP6he5r49iWwffarOqWjScGh9Wy2FflMW26RtX0fSZWlsB9Pg1bsJFu
	+2jgu0ogwxFLGkkw+hR2ure2J5pAcGUx+7zwzW6pfy0TGfpKGkytq9rafl0to7JmFNmxB4N+3TWx/
	rAS8zU6KAazxmXamTPb+fcSjiogR1DEemsEyWmQVzQ+2ZUpO2S4iBss7cSFrD7+luQTS2CJROe/zF
	jEr2/HZuITHI2yt6jilivpDc7aauMee+5MVomLEJED1mBC0a9Erm7styKOKP/cqo4ZdblLRNtlpft
	zkU8/Q+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umizs-000000011Jh-42xZ;
	Fri, 15 Aug 2025 01:12:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umiYT-00000000wT0-2z58
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 00:44:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BBCFC5C585C;
	Fri, 15 Aug 2025 00:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E822C4CEED;
	Fri, 15 Aug 2025 00:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755218664;
	bh=tCgQh7vbWR7GLS7Dvxp6J8vUAFhtzPpoYfT8KURAxSI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ql1GX3OSEWLcHuef9Y/XLmAFF8GNU+IRpSHY6fPST9UZ2gaW5ApaCUmrNuHofKuB3
	 BHILxtW7lF1O8KHMxdED1TAS+rBqswRL80IgOb+dm4vAGzHVBRx/df6Ir03mHIj0tV
	 ktDXMAoQf7sxieDkiYn72DxwZnfo8RPb9JDV8KkH22j3Ewkzv6LGA4O1VUHa/ctnzj
	 AdGzYXdM+hqWUNuklri7btaTItUT76daFmXaaQ56FkwWOUEl9AUOpKaAqlq1lWLFNx
	 gjBuU0cEcjbcwISsa2ohBLm3FUQJQH7OIq7eYQZKpzFOHmd1fwTZu/ExmdF4A6khJg
	 8X8av7VnZDnwg==
Date: Thu, 14 Aug 2025 17:44:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Simon
 Horman <horms@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>, Po-Yu
 Chuang <ratbert@faraday-tech.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
 <taoren@meta.com>, <bmc-sw2@aspeedtech.com>
Subject: Re: [net-next v2 0/4] Add AST2600 RGMII delay into ftgmac100
Message-ID: <20250814174422.17ed3e32@kernel.org>
In-Reply-To: <20250813063301.338851-1-jacky_chou@aspeedtech.com>
References: <20250813063301.338851-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_174425_791592_93CCB645 
X-CRM114-Status: GOOD (  11.56  )
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

On Wed, 13 Aug 2025 14:32:57 +0800 Jacky Chou wrote:
> This patch series adds support for configuring RGMII internal delays for the 
> Aspeed AST2600 FTGMAC100 Ethernet MACs. It introduces new compatible strings to 
> distinguish between MAC0/1 and MAC2/3, as their delay chains and configuration 
> units differ.
> The device tree bindings are updated to restrict the allowed phy-mode and delay 
> properties for each MAC type. Corresponding changes are made to the device tree 
> source files and the FTGMAC100 driver to support the new delay configuration.

First patch doesn't apply cleanly, please respin.
-- 
pw-bot: cr


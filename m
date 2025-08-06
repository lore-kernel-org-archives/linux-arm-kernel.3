Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96684C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 14:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dKSnmyZhBtsAHpcDfwkp4+zP/Y5X/HnAHpBN0o8UN4=; b=fZ/I4qBKU378C4IM2/eDtfeeR2
	Wc6xSlPFHTf2A9M0PA2nAlRlBCnkMbGX2TRBr+ob2yDXJAYsrALKBBmfF+D4zEKWrPnRUQvYNBYr4
	wR73mHCE4WCyyC8itQ84LdXtWUSzzkLbSS/14S8MihaQvU66xN1x+PtAwJUrBSt7wzGT/Xc96D1Ci
	S++Y+CQXuQs00OYfASiEPfQV8zVQdCC/ffYMPWw6gGiZyxYPOftrozrSocKxjhP6bU4uCRXdfLp6D
	YOS9g7VxZsBV323hWftkH+3+INqKU2nGH6weOTl8iZ/x9caqDNI9Ynng6TURDwqQoQScijJg1HbSw
	vfpyLFyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfW9-0000000FUiz-35E0;
	Wed, 06 Aug 2025 14:53:25 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfNy-0000000FTT4-3lsh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 14:45:00 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754491495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9dKSnmyZhBtsAHpcDfwkp4+zP/Y5X/HnAHpBN0o8UN4=;
	b=N9H4ngx68JBjI+CbEYzUEvOnNXD/Q6OJGe1uzRJazZvmOAOq21F1qC9dAupcKLSxl4q3SO
	79ebFfOGuYvCJVjSHAOz4Fb1BP2cSfdb7HwM1sOOVNmCDOpw3LPqVNsEIyzwVfiNfKzbFR
	pnHyoy1SSxeiaDdh4J7V9mi/bfHRx/GRD5W3virKQZOYw2BFY4AuUcXuzlpVsn5a7eTayU
	ALC26UxbEr4FBDdtG2IhRLh7mHfmehwyKSM37iYyYmVbFAJqE8GzWyqTGmsV2P9Z4p/ZdM
	fDorgcfgO18MHPF93cg2Um9Qm0yoZcjnun7pcBGtlKKivz6ecZvAjUVfhMX6/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754491495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9dKSnmyZhBtsAHpcDfwkp4+zP/Y5X/HnAHpBN0o8UN4=;
	b=lASAwrt6n8amrUQUmEoeShj8JgZ2xMaBO+EriCZrbtsqgS+AkjEQPlEGR8itBoqhSxEygY
	Z5pRdhqRdttGdDAA==
To: Eddie James <eajames@linux.ibm.com>, Ryan Chen
 <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] irqchip/aspeed-scu-ic: Add support for AST2700 SCU
 interrupt controllers
In-Reply-To: <5c46082a-c31b-4d12-a1d6-f315c8ce7aaa@linux.ibm.com>
References: <20250804053445.1482749-1-ryan_chen@aspeedtech.com>
 <20250804053445.1482749-3-ryan_chen@aspeedtech.com>
 <20250805153908.GA1807801-robh@kernel.org>
 <OS8PR06MB75414ECA0290018D5D113B62F22DA@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <5c46082a-c31b-4d12-a1d6-f315c8ce7aaa@linux.ibm.com>
Date: Wed, 06 Aug 2025 16:44:54 +0200
Message-ID: <8734a4ecgp.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_074459_080271_72E41AAA 
X-CRM114-Status: GOOD (  10.04  )
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

On Wed, Aug 06 2025 at 08:41, Eddie James wrote:
> On 8/6/25 2:14 AM, Ryan Chen wrote:
>
> How much is common with 2500/2600? I wonder if it would be easier to 
> just create a new driver only for AST2700, instead of all in the same 
> file/driver?

There is enough consolidation potential to keep them in the same file.


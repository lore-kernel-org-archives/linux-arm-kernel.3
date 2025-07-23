Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED86BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 17:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAN36tnPlVScqFyW8H2kecVmf43LbzR0LCpjmIdCB6k=; b=13c39U9sJgZS5PvREPW2I6bTve
	muMXTruAaQoGtHGfR1V8qeKE86A4epY81mJYppqxSGp4jGhZuqytYNDA2ojlUFNh3JbFsYU+2Wr07
	U6dvuio9b9c4Bg4CjL1qRnCrmsxqIe54jLgyXW3yetaE220+anAQ/uW2GZHvafQx8tez6iO4OIjAU
	UM25Wrq3NlRQrZiSRWeoX3fOnyBRa+SKqs4RxsKOfShnZpvPmBxsG1urToKsBROUhDm7WESpoSgtX
	Q0ZQA7uo+R3CRyDF53iMddB5C1qkOm8U1WRWXLu2dyz/x8YinqkOk5czX0/T+eiAcIuSWijUnfScu
	wKIxOxpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uedWd-00000005ebv-3l64;
	Wed, 23 Jul 2025 17:45:07 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uedPH-00000005cye-2Xar
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 17:37:33 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1753292247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NAN36tnPlVScqFyW8H2kecVmf43LbzR0LCpjmIdCB6k=;
	b=dTEoClWJpdbZ8dDT/H8RBibW5G3pXOOc7s0AFPsIuxm4wZIG3cAMH4PBg7kS9MSRq90Z7p
	mdkx7DyiIBN13jDTsP4J3u7cq80L9uQDFENlrOzvWmmllj4cYDp8CWrhP73KFXPFDLa5Rh
	ufDzvNPhC6DkMEy/jgY/NpIGpgsP+B3UQ2R+FnIHCYfKdbv+bgnfuL8jvPslRiwEdTRDM+
	auRoX4DfeM7cJO5PagYEI1rkPT+ts9Xzm58KVrqTNA68AAbhiW1Z3PZmG3VezBuwE8bywZ
	Wzlxur0f6tt0Lb1ZqpQkWyt9g+zWAgLuhXQHESNLqMoyf0QJyzB1S113gM9nsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1753292247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NAN36tnPlVScqFyW8H2kecVmf43LbzR0LCpjmIdCB6k=;
	b=V/m9EQLSeALkvLMUgne5PHhsAdv3wLFBWfmwy/iiP2pq1OL7lDqxS5TYhKlnJ2UF4PJaNs
	39ByRYfi3VRICtBw==
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Kevin Chen <kevin_chen@aspeedtech.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>
Subject: RE: [PATCH v3 2/2] irqchip: aspeed: add debugfs support and AST2700
 INTC0/INTC1 routing/protection display
In-Reply-To: <OS8PR06MB7541516DD4FDEBD72A764042F25FA@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250722095156.1672873-1-ryan_chen@aspeedtech.com>
 <20250722095156.1672873-3-ryan_chen@aspeedtech.com> <8734aotfdq.ffs@tglx>
 <OS8PR06MB7541516DD4FDEBD72A764042F25FA@OS8PR06MB7541.apcprd06.prod.outlook.com>
Date: Wed, 23 Jul 2025 19:37:26 +0200
Message-ID: <87wm7yrep5.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_103731_783945_A2FEF214 
X-CRM114-Status: GOOD (  12.08  )
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

On Wed, Jul 23 2025 at 06:02, Ryan Chen wrote:
>> > +struct aspeed_intc {
>> > +	void __iomem *base;
>> > +	struct device *dev;
>> > +	struct dentry *dbg_root;
>> > +	int (*show_routing)(struct seq_file *s, void *unused);
>> > +	int (*show_prot)(struct seq_file *s, void *unused); };
>> 
>> See the chapter about struct declarations and initializers in the documentation
>> I linked to above.
>
> Sorry, I don't see the struct "> > +	int (*show_prot)(struct seq_file *s, void *unused); };"

I fatfingered that, but that's not the problem.

> My original submit is following, it should ok. Am I right?

No. Read the chapter I pointed you to.

> https://www.spinics.net/lists/kernel/msg5776957.html

I have replied to this very mail. No need to paste me this and the pointer
to some random mail archive



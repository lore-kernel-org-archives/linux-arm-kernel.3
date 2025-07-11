Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5242EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 09:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WF9+3lnjfRQwgjXKff+rlIuGBtZEcHO9FtUjx6kias8=; b=uWF6lY5/S4p/ck1BbnuOfkMKOi
	MTWQPQl7421OuYfDxqaYtegQktT+jQYK0rn1FCAAcGVAb6hdFz60P7Qmf1ZHA78Rd3YAm1W5rLDlN
	qfFAmdhBJidvzykFVhPGuMWscSP85ASW4xd6MlSkWhasg4ZP9zKv5fvvdo4djmHDJ2HVQ4HUFLxCx
	iCKBlyNztJ/fe9J63NcpMQOupQ0CIEerOu26F7IjIyYaURf5uPxxKVoDBeUALwoBkdFSPVbpaRza1
	r1NU+2Hf9W6LnXHIrFJ09u+cYnwAw82uGEWyook3BMOFXf6pGsIP9y6fhwGdMeE8wKQ06rsm8oC97
	zWj687DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAR8-0000000ENp2-1SqN;
	Fri, 11 Jul 2025 09:52:58 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9N8-0000000ECWp-1eaC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 08:44:47 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id B79D51D00196;
	Fri, 11 Jul 2025 04:44:44 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 11 Jul 2025 04:44:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1752223484;
	 x=1752309884; bh=WF9+3lnjfRQwgjXKff+rlIuGBtZEcHO9FtUjx6kias8=; b=
	f+M6x8Y0HndHChIkB8MeA9N8XNUieosjoUTIRKrau18t/2QYFOlQWoYitW1TmEb+
	rTEhX9DgfWQ3Cyi3d1ib8e0KlG7F4/+K/hWAgh/3zLciRW1CaG+P7fMV82f9qj4F
	GRsrUGq8/egpnDsrcJm10KjBF2+mIkOyqDv85tJuQgVQWOZSpi5MMuoFfbygHZ6g
	eufDRX88veq5Yaz0mMnP0ywyLPVu35Dd1V4LLocpQyctzzYdBImDHuzDI5jas1mM
	+eeFJSDYttr1h5esvRuZQZVMQefAfG7pcAxpDSo8jQVe+pugKJ9gj4S95CHaSvYd
	znXFzkrMMQbh2ipK0G8U0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752223484; x=
	1752309884; bh=WF9+3lnjfRQwgjXKff+rlIuGBtZEcHO9FtUjx6kias8=; b=T
	Z8qZah+Cmf8xJp574+jQX3xXwYoX29M3NDYTDUn2Dnh9wSr4LxiC+ginx345EiUj
	GVomuFeA+AffIM9kApK1kcQqA3RP2LjOqCPVuqKiW6YkLqbFfEDzM3nW7cKloCek
	8Ixu0TXh7NaNQos5qmRvN7Zci4WLM+2bVNTDzfqGuCKW4Kv7xiez8tVblgZmlSc7
	/AAW2Bdk4QhjZO9ZUDMIer692BwVlW6EMwowk/wqIH3wC8/Y/7JVPgG4mvUpMQfa
	pGPqvdnYbrJrSiDn4DTuE/Fsyg+YMJc0I1iVx1fIWxt9Fo2aDj2O3dWNVRp3Q114
	6dfbC6iPQLy/+qJKc/S7w==
X-ME-Sender: <xms:_M5waMgf0kLBZEvO31KLd-ufnzkzdKZceigRcicAKX-Vy62LOAcAJw>
    <xme:_M5waFBUW0B_ADYmdYZXkA5MohRKGXfbL_E8Z54xvNfU6_EKqZ4JcSbetfhTB4cqi
    OSHDSqwIvXEu7OcZhE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegvdekjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtph
    htthhopehjrghmvghsrdhmohhrshgvsegrrhhmrdgtohhmpdhrtghpthhtohepjhhovgih
    rdhgohhulhihsegrrhhmrdgtohhmpdhrtghpthhtohepshhuiihukhhirdhpohhulhhosh
    gvsegrrhhmrdgtohhmpdhrtghpthhtohephihuiigvnhhghhhuiheshhhurgifvghirdgt
    ohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrh
    hoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrgiisehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:_M5waMWQuoGjN1oG0tLpj-JLUAa5yoEhNFbvncX31tnlEFQnhnZHDA>
    <xmx:_M5waAsz2GgojV1bHBhimTh3axof-BXQv5qfKy-t-hxJJQDWZ1e8Cg>
    <xmx:_M5waH2yQgEEGDfEMJo06TofDflV849Gz6G1Bew4f9JZRmXn4bLo_w>
    <xmx:_M5waB7txBNOs5S3ip5-OOQqV4xX1iGrbRURCimKl6Al1RKENIgU6A>
    <xmx:_M5waCU8xS5oq00KRT1drlLUekAtItX4rNohIRUt8bTEetT13qtPTEzf>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E762F700068; Fri, 11 Jul 2025 04:44:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T7965fc80e983b7bf
Date: Fri, 11 Jul 2025 10:44:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marc Zyngier" <maz@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Oliver Upton" <oliver.upton@linux.dev>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Joey Gouly" <joey.gouly@arm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Zenghui Yu" <yuzenghui@huawei.com>, "Mark Brown" <broonie@kernel.org>,
 "James Morse" <james.morse@arm.com>, "Sebastian Ott" <sebott@redhat.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <4befb9eb-96e6-4a7c-9746-286144564f4e@app.fastmail.com>
In-Reply-To: <86h5zj9laj.wl-maz@kernel.org>
References: <20250711072752.2781647-1-arnd@kernel.org>
 <86h5zj9laj.wl-maz@kernel.org>
Subject: Re: [PATCH] KVM: arm64: fix u64_replace_bits() usage
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_014446_825952_D1043851 
X-CRM114-Status: GOOD (  10.31  )
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

On Fri, Jul 11, 2025, at 10:36, Marc Zyngier wrote:
> On Fri, 11 Jul 2025 08:27:47 +0100, Arnd Bergmann <arnd@kernel.org> wrote:
>>  	if (hpmn > vcpu->kvm->arch.nr_pmu_counters) {
>>  		hpmn = vcpu->kvm->arch.nr_pmu_counters;
>> -		u64_replace_bits(val, hpmn, MDCR_EL2_HPMN);
>> +		val = u64_replace_bits(val, hpmn, MDCR_EL2_HPMN);
>>  	}
>>  
>>  	__vcpu_assign_sys_reg(vcpu, MDCR_EL2, val);
>
> This is only in -next, right? Because I have a fix for this already
> queued for 6.16, as per [1].

Yes, as far as I can tell, the warning only showed up in linux-next
after f66f9c3d09c1 ("bitfield: Ensure the return values of helper
functions are checked").

As far as I can tell, Ben added the check in linux/bitfield.h
when he sent you his version of the fix, they just ended up
in linux-next in the wrong order, so I ended up recreating his
original fix slightly differently.

      Arnd


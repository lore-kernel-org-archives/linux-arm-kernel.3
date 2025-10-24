Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4BBCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 09:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXavAEt2AdeKA50kbQrTDAxk8ooenTF+Pk8EvuBhte8=; b=pZXPvC8YgHgL+XkUZLzBFKAW1I
	jBkDTmRg+o7JJTS714UDfk5yDtdakI+67NeyIgRwJNUq4ReHkYL55xbLVPtlEwgSRhYjSv9RIY+57
	cH0mlui9LI0bYnCfngsF52VMg5qLmILpx94ghPYfCdWnQUXbsG901Bb5zRoHK7ct8JJEajcDix0Zk
	RWtl5lnuF5raMbwypTkpdEIXEZ1MWbkib3WABFJoqUCI51LYq1OspJefQxWqjqEakXDqr1fGGdOqn
	HGyswFpUSR7VGO8WHjl0ua0cnTdFn2KSTohHf1n2MNc37I/0Oq4psH1FAbg2VHMyAjB0OAoFRP5mr
	zAr4ednw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCELh-00000008uJc-3ET4;
	Fri, 24 Oct 2025 09:44:41 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCELf-00000008uJH-1YWL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 09:44:40 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761299076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qXavAEt2AdeKA50kbQrTDAxk8ooenTF+Pk8EvuBhte8=;
	b=aZDqJm3defnmzAAYbej0YfrhJcyo1IHIK3yfLYpDulBXRr+I//iKnbcW7RPrMio0WW33wc
	pq31aoDVsMIB5kzf4j31hfJGEu4Gl89tvpy7NPygc7H+mdeBpZ+mudvk7mVaKU1h0Wq24q
	SzwCOGX0oGCYnoL7jqBtjNS0PpgTPd1v7/i+tEJpTs5RjpyDaE8aeQ2k29KQAA5FKDsjHg
	wpMFxj7l9Xt16t8ffsT5KIGUHI2GkmISiRELARU72SznhYT75xpPash+YuOiaqsMiIhKyA
	VJduM/jQlI5QyGVdd5YAVObGrO9mObBJ5uxfklJg1oAUiuYAFWvOz0ZztNkySw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761299076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qXavAEt2AdeKA50kbQrTDAxk8ooenTF+Pk8EvuBhte8=;
	b=tNyuMNzrbE99rMYg5ySoCVmAPUBdyZ1Ry8ejR9FvszFxAg8QhaYLAdZdkBqYFQfZtwc3mK
	4dfYFirrzA/2bsAw==
To: Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Sascha Bischoff
 <sascha.bischoff@arm.com>, Scott Branden <sbranden@broadcom.com>, Bjorn
 Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>, Frank Li
 <Frank.Li@nxp.com>, Manivannan Sadhasivam <mani@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Marc Zyngier
 <maz@kernel.org>
Subject: Re: [PATCH v4 0/5] of/irq: Misc msi-parent handling fixes/clean-ups
In-Reply-To: <20251022140545.GB3390144-robh@kernel.org>
References: <20251021124103.198419-1-lpieralisi@kernel.org>
 <20251022140545.GB3390144-robh@kernel.org>
Date: Fri, 24 Oct 2025 11:44:35 +0200
Message-ID: <87v7k4ws58.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_024439_549222_20C49A7B 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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

Rob!

On Wed, Oct 22 2025 at 09:05, Rob Herring wrote:
> On Tue, Oct 21, 2025 at 02:40:58PM +0200, Lorenzo Pieralisi wrote:
>> Lorenzo Pieralisi (5):
>>   of/irq: Add msi-parent check to of_msi_xlate()
>>   of/irq: Fix OF node refcount in of_msi_get_domain()
>
> I've applied these 2 for 6.18.

The rest of this depends on those two.

>>   of/irq: Export of_msi_xlate() for module usage

Can you pick the three of/irq ones up and put them into a seperate
branch based on rc1 so that I can pull that and apply the rest:

>>   PCI: iproc: Implement MSI controller node detection with
>>     of_msi_xlate()
>>   irqchip/gic-its: Rework platform MSI deviceID detection

Thanks,

        tglx


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDE6CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 09:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBpIwJuz3DbYEaP26/bWChJ0cjV2K/N4eN4y5+1NDLI=; b=nR84v9NtbLo+NRLl7MGjFTDcx3
	c7G5oNssPjpNK6OiUPQxyxcG2nA5mVwCk999MAtMOJWMEVIsxOzy3XFTXa61rmVpoYCi6Pobra3Mv
	A4gFiipTe7tGQh5pkclTYerIkES7drrvYB1hQJUtC1K7nJDgVic5wd23yZUPPBoEKuBrnC6RNrkXx
	EOaS+XxxMnyZFVd4eH0d4JRD7pPVg6RA/o90p7esFTf84NqYx4Gas4VjfVpTXNUFXyM348+2GaQ7z
	5AZdMdNe2RmKGiAXtTL4UEgGqf/Hk4sbila+ennnMDpOkNjoku7aqffxCfQo4r9ChcN7Tv/iYV0J7
	mQp/fjZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq6dh-00000005vUw-0JP9;
	Sun, 24 Aug 2025 09:03:49 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq6Wc-00000005uqk-0JXO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 08:56:31 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756025786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bBpIwJuz3DbYEaP26/bWChJ0cjV2K/N4eN4y5+1NDLI=;
	b=4n536GwYkvbLwvdv+vqmVfBOP3uNQLiZzq2FL8QoNPAjnX3Tj/7xJYdHQ5dS8YUvfaX7ik
	OGsWXfFDek/awOEe+38Migkl1Nw1HRsVjivYm8xTx34tuzz2l1yAyKJgxhp2mtzdUVqVVT
	GrlFQbKPp9LaxBSjxaWNZsyfy/mz+wMJn61LZ7jH0VyDGrdbXASaS5Oyl7xVmWrC4JwEOX
	dQXCzvS+2CMAek3g8uU5g1D76w3idohRZ4gp6wCbwIz/wvPJ7Nz7YRta+N0h4+tz4z3Fcw
	raMvAnwOQv2H6cWUrSwTyicQfn8elTtZb8USiAgAkhffomfzC/mwnYgSVSerXw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756025786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bBpIwJuz3DbYEaP26/bWChJ0cjV2K/N4eN4y5+1NDLI=;
	b=vLI+jrISeoNNmvB9tfK3kDd0BuynX0VGAXpbiVVR1tOIffXrnc8z4kL8J7NE07PAzztN9r
	JHf1yQTDn5L33HCQ==
To: Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] of/irq: Convert of_msi_map_id() callers to of_msi_xlate()
In-Reply-To: <20250813185244.GA553867-robh@kernel.org>
References: <20250805133443.936955-1-lpieralisi@kernel.org>
 <20250813185244.GA553867-robh@kernel.org>
Date: Sun, 24 Aug 2025 10:56:24 +0200
Message-ID: <87v7md2j47.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_015630_257801_47A8C840 
X-CRM114-Status: GOOD (  14.59  )
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

On Wed, Aug 13 2025 at 13:52, Rob Herring wrote:
> On Tue, Aug 05, 2025 at 03:34:43PM +0200, Lorenzo Pieralisi wrote:
>> With the introduction of the of_msi_xlate() function, the OF layer
>> provides an API to map a device ID and retrieve the MSI controller
>> node the ID is mapped to with a single call.
>> 
>> of_msi_map_id() is currently used to map a deviceID to a specific
>> MSI controller node; of_msi_xlate() can be used for that purpose
>> too, there is no need to keep the two functions.
>> 
>> Convert of_msi_map_id() to of_msi_xlate() calls and update the
>> of_msi_xlate() documentation to describe how the struct device_node
>> pointer passed in should be set-up to either provide the MSI controller
>> node target or receive its pointer upon mapping completion.
>> 
>> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Marc Zyngier <maz@kernel.org>
>> ---
>> As suggested by RobH:
>> 
>> https://lore.kernel.org/lkml/20250627213241.GA168190-robh@kernel.org/
>> 
>>  drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c |  2 +-
>>  drivers/of/irq.c                            | 25 +++++----------------
>>  drivers/pci/msi/irqdomain.c                 |  2 +-
>>  include/linux/of_irq.h                      |  6 -----
>>  4 files changed, 7 insertions(+), 28 deletions(-)
>
> Looks good to me. I'm happy to take it with some acks.
>

Acked-by: Thomas Gleixner <tglx@linutronix.de>



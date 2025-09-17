Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69986CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 05:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SE80BDLp7RGmNryQ1WRS/aK8000n2rtH3W8fQeIL/c4=; b=x+iXG+WtmpKSeP50XljMXRCJTQ
	wPiTHmJgUmU9I2eOPsZrwq/D092W/6o0/QDYhYVLsigAQWVKG6K1C0JKNwp7x+2+pnDIhZbjC9gJH
	FYxAqBileFSxEQx3kd0ie2Ex6ZArZ4UWIkqbxtwhxVlmLAh11cbr+ZrE82TaOFefJMXhjS+yz9RbC
	VAf9gylNRFe8SqBmKW5y9PeyLnR20l9l3HZ0g/vt63ydu3hUOl08qxcA2K5zsSHq2Ti2EvlJyh/7u
	MxguYEIlpNmHRAVIGXGyjijI6uLkhsn0gIgCQ0R5SYVScbdzrIgmsG9CT2HGqvkcHU61NB7JHcIlC
	eVKMDJ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uykbd-0000000ADu9-32K7;
	Wed, 17 Sep 2025 05:21:25 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uykba-0000000ADte-0dvx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 05:21:23 +0000
Date: Tue, 16 Sep 2025 22:21:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758086477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SE80BDLp7RGmNryQ1WRS/aK8000n2rtH3W8fQeIL/c4=;
	b=ONlm1N7/v3ZoW6UPF24U6gmqobIOXl4WGiyNax4nAwwivsgr2dSV79bQR6u9ESl43ku3nZ
	53b8dPxD+kQFT7ZZV4ccOemciEY1RJbAohR3/ZnqDL5Ea3GGFYybmHP2DKihpSBQW81qTe
	ss43SrLNC0BFkB6kA8lhxDzWIyWJ0tA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Fix kvm_vcpu_{set,is}_be() to deal with EL2
 state
Message-ID: <aMpFRYarTozl7Q38@linux.dev>
References: <20250916161103.1040727-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916161103.1040727-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_222122_690696_B7B3BD00 
X-CRM114-Status: UNSURE (   8.45  )
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

On Tue, Sep 16, 2025 at 05:11:03PM +0100, Marc Zyngier wrote:
> Nobody really cares about BE, but KVM currently only deals with
> SCTLR_EL1 when evaluating or setting the endianness in PSCI,
> meaning that we evaluate whatever the L2 state has been at some point.
> 
> Teach these primitives about SCTLR_EL2, and forget about BE...
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

You know, I was about to say "don't we need to sanitise this?" although
that seems to already be in place. Nice.

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver


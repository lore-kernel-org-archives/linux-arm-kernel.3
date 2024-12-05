Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA532E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 00:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4U0q3vONwMwpWG5uTnFmXFqnR3IIk2M7iJ9C6Mgww6E=; b=AdQNOygZAGekZ4+w3ueMqPeCV1
	WUEuvnIKk9hZymR468s5aE9yDaPfsv0nCDAwKUp6OAIq/kqnyTS2cwgZYWqre0kRmqp6q7YSiOlv7
	/dCYy3UCbN0j+L1+AM2v/NuqAanFxaRfbYhVG9ftMdwI35RANObFBNfraXKKtIEprC4Uz9n2WXRHr
	K5uUd3vLUP+O8mi00Y4lEPZIYqRW30tMcSopV3/6xCcRe8xEge9NbdzM1AMvZKEK80pOb7du0uRRv
	OG6RLycyXjo/9YTUj8bj/TprD6H08dqFuvyS4mLrSGoxaOe1X0fjyKLupKkbUq0QsoH60X3Oi4L/4
	b2QQJH+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzw1-0000000ENvk-1kjH;
	Thu, 05 Dec 2024 00:41:37 +0000
Received: from out-185.mta1.migadu.com ([95.215.58.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzv0-0000000ENke-1OSe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 00:40:35 +0000
Date: Wed, 4 Dec 2024 16:40:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733359232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4U0q3vONwMwpWG5uTnFmXFqnR3IIk2M7iJ9C6Mgww6E=;
	b=vgOUdWhSQE0eYd15Ox9xMmxkNDh/fO2gcsBrZSUMHOoyAPiKYhiUTHQelWEMEert+Zsi/u
	TwQcgDFkS3sI6CKURjqwF5X6cNjiDRfFqfVWpWaqFR16CJX1DKyoMdb3LlsrS0+EYdVKfM
	WSs16XWSEBgEloDqpD6XZsizs3GNodg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: Re: [PATCH 00/11] KVM: arm64: Add NV timer support
Message-ID: <Z1D2ezLP7nL0TXaf@linux.dev>
References: <20241202172134.384923-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202172134.384923-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_164034_510208_77B14C1E 
X-CRM114-Status: GOOD (  23.14  )
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

On Mon, Dec 02, 2024 at 05:21:23PM +0000, Marc Zyngier wrote:
> Here's another batch of NV-related patches, this time bringing in most
> of the timer support for EL2 as well as nested guests.
> 
> The code is pretty convoluted for a bunch of reasons:
> 
> - FEAT_NV2 breaks the timer semantics by redirecting HW controls to
>   memory, meaning that a guest could setup a timer and never see it
>   firing until the next exit
> 
> - We go try hard to reflect the timer state in memory, but that's not
>   great.
> 
> - With FEAT_ECV, we can finally correctly emulate the virtual timer,
>   but this emulation is pretty costly
> 
> - As a way to make things suck less, we handle timer reads as early as
>   possible, and only defer writes to the normal trap handling
> 
> - Finally, some implementations are badly broken, and require some
>   hand-holding, irrespective of NV support. So we try and reuse the NV
>   infrastructure to make them usable. This could be further optimised,
>   but I'm running out of patience for this sort of HW.
> 
> What this is not implementing is support for CNTPOFF_EL2. It appears
> that the architecture doesn't let you correctly emulate it, so I guess
> this will be trap/emulate for the foreseeable future.
> 
> This series is on top of v6.13-rc1, and has been tested on my usual M2
> setup, but also on a Snapdragon X1 Elite devkit. I would like to thank
> Qualcomm for the free hardware with no strings (nor support) attached!

This series is looking pretty good to me, but I think it'd be good to
remap "EL0 timer" -> "EL1 timer" throughout this series to match the
architectural term.

-- 
Thanks,
Oliver


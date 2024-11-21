Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0FED75BCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 08:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYcHKE8tyoWtehGQXuSiAC0jZIaeRsKbtVQnj1j5LNs=; b=PnBt83a/rTCJo9xF6E3KKr7E1f
	uZl11lnjzlYelubJspZCQ8pcgZ72XrseCm3wPyd70lyevAYfSoLLs0iIfceHAAdT5Zboei4BktY2w
	xM0wms2FChd6dTw7aANMkltDst4RMyB6WuACvNyVQIxFudYJtik47TqVw35/ONH+pT/n8F7fIGhcQ
	rMr3pQrz8tBkZ/1xyRzqcmAew1i3S2Llo6FkoZ+xr3N+vGDBVTZgiH2Pi148xUSrwVbU1MmTZ3eUx
	JwUXaQlv46fJQ771hEpkE0bglrcHP5YRXQHQMQDBPxGFfao4eKtOR+38yAFDaa7X0hPfnR+OHAZm3
	wAHUJjnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2PK-0000000H4xk-3w7r;
	Thu, 21 Nov 2024 08:19:22 +0000
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2OM-0000000H4vK-3FJD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 08:18:25 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732177098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RYcHKE8tyoWtehGQXuSiAC0jZIaeRsKbtVQnj1j5LNs=;
	b=lzwuoQyRpN05WMzm7JMvpm7y2AWGlS/wciqfMOvDH+fc7A1H8VPaWmMeth1kpyz5NQFhJt
	phjKWq29bx1pXWD+AN2gD4qDyl02rm7i7aNKKDQBKkWfVYTvkwdS03B19sLJVrDMLOt9KF
	SVNfcqfwlep0FUnBoD4hUHNSQfUAT3c=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 0/4] KVM: arm64: vgic: Collection of fixes for 6.13
Date: Thu, 21 Nov 2024 00:18:03 -0800
Message-Id: <173217703275.53090.15374156507586889757.b4-ty@linux.dev>
In-Reply-To: <20241117165757.247686-1-maz@kernel.org>
References: <20241117165757.247686-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_001823_456122_195E17AD 
X-CRM114-Status: GOOD (  10.77  )
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

On Sun, 17 Nov 2024 16:57:53 +0000, Marc Zyngier wrote:
> This is a more or less random collection of vgic fixes, addressing
> issues ranging from "purely cosmetic" all the way to "pretty annoying"
> (of which patch #1 is an example).
> 
> The general theme is around the tightening of the internal API in
> order to make it a bit more difficult to get things wrong, something
> that I'm particularly good at. There is a bit more I'd like to do on
> the ITS, but I'm testing the waters here.
> 
> [...]

Applied to fixes, thanks!

[1/4] KVM: arm64: vgic-v3: Sanitise guest writes to GICR_INVLPIR
      https://git.kernel.org/kvmarm/kvmarm/c/d561491ba927
[2/4] KVM: arm64: vgic: Make vgic_get_irq() more robust
      https://git.kernel.org/kvmarm/kvmarm/c/add570b39f9f
[3/4] KVM: arm64: vgic: Kill VGIC_MAX_PRIVATE definition
      https://git.kernel.org/kvmarm/kvmarm/c/e7619f2a2f8f
[4/4] KVM: arm64: vgic-its: Add stronger type-checking to the ITS entry sizes
      https://git.kernel.org/kvmarm/kvmarm/c/3b2c81d5feb2

--
Best,
Oliver


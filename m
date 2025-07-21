Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFFFC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 22:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0Swdc+rgZd6RYXOhWJTdQCOj/YJAeib/YMEr/j+xKM=; b=XmuGxHSO93SOdcYjhZaahguPLO
	o9X0BiteztaAUaKCxxm+WJoCZ9KzKMJB+qwi5MJ+a6JCdIHJzS4Z+oSzpGOXzNvQbkLo7F9ds9CJI
	scgQc84OD0QgQptC7b3hSinS+AFpt+OgeaKlfood/tw1aRyXapM4/pCm6vSx2dRZ+LC4Vrnnl+DBT
	dShimClAyxlnhD/fQZcsAAG4xF88d6sVmtLailLrXNax+H8pTaQbeIVKUffZ+QfYW2PhkIWSHqDnJ
	9vMAfia47owtUio/5vNejrszNo6Z/RbOugA9AKpWf6/d+WdT6m/kkaxotD9UOpo1NvrpF+XMIjiZs
	VHE+AsgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udyyr-00000000oS5-473Q;
	Mon, 21 Jul 2025 22:27:33 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udywO-00000000oHX-37XZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 22:25:02 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753136698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E0Swdc+rgZd6RYXOhWJTdQCOj/YJAeib/YMEr/j+xKM=;
	b=HZptrzZrIHb7zDppmEpiXbGBgqebupTQ8pylKpzfG1WZ/EjdDd5SeiMXYBLDklKXGyITLi
	8X+IcIKCMWgDj89IagWjCFxQnHacJ7CT8bZBk2TkoyPreH7B9QssECZFafwEcr3k17Kf+d
	b0IyMm2aybdhaf6d8GJ8DTu8aeKfnxQ=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Brown <broonie@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Check for SYSREGS_ON_CPU before accessing the CPU state
Date: Mon, 21 Jul 2025 15:24:45 -0700
Message-Id: <175313657127.2592298.3949452294355380877.b4-ty@linux.dev>
In-Reply-To: <20250720102229.179114-1-maz@kernel.org>
References: <20250720102229.179114-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_152501_513226_B52EA230 
X-CRM114-Status: GOOD (  10.30  )
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

On Sun, 20 Jul 2025 11:22:29 +0100, Marc Zyngier wrote:
> Mark Brown reports that since we commit to making exceptions
> visible without the vcpu being loaded, the external abort selftest
> fails.
> 
> Upon investigation, it turns out that the code that makes registers
> affected by an exception visible to the guest is completely broken
> on VHE, as we don't check whether the system registers are loaded
> on the CPU at this point. We managed to get away with this so far,
> but that's obviously as bad as it gets,
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Check for SYSREGS_ON_CPU before accessing the CPU state
      https://git.kernel.org/kvmarm/kvmarm/c/c6e35dff58d3

--
Best,
Oliver


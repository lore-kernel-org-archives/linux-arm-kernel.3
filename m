Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E87C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 09:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g705Q9rVXM3rOoIbYrjQI9NFuyX//odgJS+EkdOhf2s=; b=cE5ySl7GPCya1k1IeB5qzbRCrz
	tydKAiN3TCdsmO1/x50UTer/lKO8KoZC3fe/NybfcyjTMgV5YxLJigFqidoO+H5spcNJnpZcuWvqS
	nrzAlZ2ubOf2lyBpkk47HUfvptK0aCSeBVNz2T3PNmknavWVS7qeEmkYTTtsLThHlnXL4MnELWlSU
	8nuETk5vikbCi+FHsO+PBILt/VbbjP27sBnYZotTS4KSA2VvnLwW3l8RhNoHchefqIkO9dyksks1/
	85nSiQrLeyRGhqUIlnImFr16qbC9KfI9qGBTai/EqRX2Q9i0Dvr/GnODZ4XihGcrLZEatp0UcyXsg
	3eWh8dmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKw9X-000000009gz-2rim;
	Fri, 30 May 2025 09:35:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKw1j-000000007Fm-26Fw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 09:27:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 802645C49EA;
	Fri, 30 May 2025 09:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A01C4CEEB;
	Fri, 30 May 2025 09:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748597266;
	bh=BfDBWaH+bJ58F06SMIRI1yZY1zg0J69UAxOI6infm10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q4J2GRQvouH7L9uxLceCUH8hLwPpUnG5Dtt5R+hu1nz/p0pZR27IMUgqNGuTdG01T
	 gDTg6e2qvHWs5ogY6yxbVq+VSPX6JFc1hr4s23yKa70OfQra5pmQwwIK/yfnWwCsXt
	 sWFFhBhMd8FqE94iJhglBUXim+By0Kk/dckl67b3e88vlxu908EEKhHvKp08An9/8x
	 OU67ExJ5ukAtHJDn84HhLLPBYSwImKog2MgknwnujBNUjlyO0eN7+1KUVAUmGxWQrL
	 rwQ6AXntEJQSWKI1Tp37v4nMuhAKSoeFc5MpNLMwj/RXJiomj9aSUL3l4pzQNJ9pOK
	 zldQyFXIkqfrg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uKw1f-001oIX-Ug;
	Fri, 30 May 2025 10:27:44 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Mask out non-VA bits from TLBI VA* on VNCR invalidation
Date: Fri, 30 May 2025 10:27:39 +0100
Message-Id: <174859721251.1152851.5430955827758174565.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250525175759.780891-1-maz@kernel.org>
References: <20250525175759.780891-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_022747_580827_4550F909 
X-CRM114-Status: UNSURE (   9.73  )
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

On Sun, 25 May 2025 18:57:59 +0100, Marc Zyngier wrote:
> When handling a TLBI VA* instruction that potentially targets a
> VNCR page mapping, we fail to mask out the top bits that contain
> the ASID and TTL fields, hence potentially failing the VA check
> in the TLB code.
> 
> An additional wrinkle is that we fail to sign extend the VA,
> again leading to failed VA checks.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Mask out non-VA bits from TLBI VA* on VNCR invalidation
      commit: 667304740537e546dac676be9eb81cee41d2ebdd

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




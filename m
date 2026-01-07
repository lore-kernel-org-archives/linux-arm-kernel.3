Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6131BCE9D48
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 12:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/k7aRIMSsRlFmo4uSbFPpMf5BgB8CzmDNkN1SVEfQc=; b=LfUs12469DTd+rvXrBtmuzyknD
	8PMQDSD5KK2Rp9OAYU0kPijIVceUVO77usHsbCUJtxd2t7XrBrwMy+1+T0McfllG829rd5XCUDcde
	6e2KXgnvExLaI4FuxSiSwAtosfyeVsm2bWd6ffwJF5e/OGOmX5aT2QK1Ngp4RE1G6CL37iIYPHeg2
	mwR+PcvQs9UDvaQuqreDTrofV1j93nefSj6kIJ/zShnhFy3mPCikLVAIvkRpH2aZcO0CU7Vvee1+Q
	+Y4ujKNC9eU+TypEnu/4hU1ePcs3057v0ihRhroYcrSc06tBKQkHcyJ3pvChy8+TkqZ4zpxNTsVZl
	NpV9Te/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSTC-0000000EsnE-3kJP;
	Wed, 07 Jan 2026 12:16:58 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdST5-0000000EsmS-0qGi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 12:16:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2/k7aRIMSsRlFmo4uSbFPpMf5BgB8CzmDNkN1SVEfQc=;
	b=fphM9sz76LXP1qBy6IXllFB6u1bhkKCguaF4iI1BUY5jX8pxr0FW6FtNb0STaafF/R6Gn6gMT
	1lEk6xHr3nhSZfUDWhrRco7JB8BBaKCQprCpVopAER8fQv0U5oOnVh3z1HutxdGIXy+utraf4O+
	+p6oqJp4hiZTGHiRBzAl+t0=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dmRm63xNTz1P7S0;
	Wed,  7 Jan 2026 20:14:14 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dmRpn6007zJ46Df;
	Wed,  7 Jan 2026 20:16:33 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 01D6A4056F;
	Wed,  7 Jan 2026 20:16:37 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 7 Jan
 2026 12:16:35 +0000
Date: Wed, 7 Jan 2026 12:16:34 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd
	<nd@arm.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, Timothy Hayes
	<Timothy.Hayes@arm.com>
Subject: Re: [PATCH v2 16/36] KVM: arm64: gic-v5: Implement direct injection
 of PPIs
Message-ID: <20260107121634.00000c13@huawei.com>
In-Reply-To: <20251219155222.1383109-17-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-17-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_041653_044781_2B2BC416 
X-CRM114-Status: GOOD (  16.88  )
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

On Fri, 19 Dec 2025 15:52:41 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> GICv5 is able to directly inject PPI pending state into a guest using
> a mechanism called DVI whereby the pending bit for a paticular PPI is
> driven directly by the physically-connected hardware. This mechanism
> itself doesn't allow for any ID translation, so the host interrupt is
> directly mapped into a guest with the same interrupt ID.
> 
> When mapping a virtual interrupt to a physical interrupt via
> kvm_vgic_map_irq for a GICv5 guest, check if the interrupt itself is a
> PPI or not. If it is, and the host's interrupt ID matches that used
> for the guest DVI is enabled, and the interrupt itself is marked as
> directly_injected.
> 
> When the interrupt is unmapped again, this process is reversed, and
> DVI is disabled for the interrupt again.
> 
> Note: the expectation is that a directly injected PPI is disabled on
> the host while the guest state is loaded. The reason is that although
> DVI is enabled to drive the guest's pending state directly, the host
> pending state also remains driven. In order to avoid the same PPI
> firing on both the host and the guest, the host's interrupt must be
> disabled (masked). This is left up to the code that owns the device
> generating the PPI as this needs to be handled on a per-VM basis. One
> VM might use DVI, while another might not, in which case the physical
> PPI should be enabled for the latter.
> 
> Co-authored-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>




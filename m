Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB09D6100E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PElI1rsyETN147jyZgm5oFt9PCn+f+EDSDG27bKeDKA=; b=T9nBJ651gV7ntmFkcsEkdOoY/p
	o9lIm342960XI6qCMqjKE7mMH7lOaEviKCmjw/4rXlsOBVHCn4bitJ+6T+n+kZWtruAn6YRzkX3EL
	I+VpVxGTZGb5MymA4KDW7xqkmiXhwKlsoHIa206/q8SvHJxj2CYkC4j8ypx9rWTJZBHL0Mxuvm1x6
	fufUbCGtHHjss3ONjzfQzPNpMQucnDLO8gcIXJ5UXJ+3q4n7R4bS6dqPtRYu2dE8HsPK/e1XLQIqY
	SQLfAL1RyC+0aN6R07TWYDZFh7Gbe29yX3X9utBZIZeF4sZJbYutooj9UaZGL+QfDJccam7rX1MS8
	Fi8g14Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlR1v-000000006RB-2FfH;
	Thu, 29 Jan 2026 12:21:47 +0000
Received: from sinmsgout02.his.huawei.com ([119.8.177.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlR1t-000000006Qe-1b53
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 12:21:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=PElI1rsyETN147jyZgm5oFt9PCn+f+EDSDG27bKeDKA=;
	b=usnYy/1IvNKv/ssW9vZHukk49Nj+gETALbUhNsfWuzLc1SdMz2fywO/yoD7DsLRhbu/QzB8VU
	13t+yZ0OrUBzShlCO5kYDnIIdYTbcZAo4Jheh3ngCYBFkfS79/6j/34rdzWklEIMoG3jpXcHV1E
	Qes7yuqlzEm/8+uUskuAC54=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4f1yqW2NdTz1vnKn;
	Thu, 29 Jan 2026 20:19:03 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f1ysf5V1JzJ46BK;
	Thu, 29 Jan 2026 20:20:54 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id E716F40585;
	Thu, 29 Jan 2026 20:21:33 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 29 Jan
 2026 12:21:33 +0000
Date: Thu, 29 Jan 2026 12:21:31 +0000
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
Subject: Re: [PATCH v4 21/36] KVM: arm64: gic-v5: Check for pending PPIs
Message-ID: <20260129122131.00006a5a@huawei.com>
In-Reply-To: <20260128175919.3828384-22-sascha.bischoff@arm.com>
References: <20260128175919.3828384-1-sascha.bischoff@arm.com>
	<20260128175919.3828384-22-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_042145_832083_E924AB16 
X-CRM114-Status: GOOD (  17.23  )
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

On Wed, 28 Jan 2026 18:04:43 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> This change allows KVM to check for pending PPI interrupts. This has
> two main components:
> 
> First of all, the effective priority mask is calculated.  This is a
> combination of the priority mask in the VPEs ICC_PCR_EL1.PRIORITY and
> the currently running priority as determined from the VPE's
> ICH_APR_EL1. If an interrupt's priority is greater than or equal to
> the effective priority mask, it can be signalled. Otherwise, it
> cannot.
> 
> Secondly, any Enabled and Pending PPIs must be checked against this
> compound priority mask. The reqires the PPI priorities to by synced
> back to the KVM shadow state on WFI entry - this is skipped in general
> operation as it isn't required and is rather expensive. If any Enabled
> and Pending PPIs are of sufficient priority to be signalled, then
> there are pending PPIs. Else, there are not. This ensures that a VPE
> is not woken when it cannot actually process the pending interrupts.
> 
> As the PPI priorities are not synced back to the KVM shadow state on
> every guest exit, they must by synced prior to checking if there are
> pending interrupts for the guest. The sync itself happens in
> vgic_v5_put() if, and only if, the vcpu is entering WFI as this is the
> only case where it is not planned to run the vcpu thread again. If the
> vcpu enters WFI, the vcpu thread will be descheduled and won't be
> rescheduled again until it has a pending interrupt, which is checked
> from kvm_arch_vcpu_runnable().
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>




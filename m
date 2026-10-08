Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DDACA600E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 20:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXqdN5NM/wlg2F8eFqzzica7nKQ60DQkM32wCrMgOZM=; b=TDOOAeeBTeHp5QAxGRLd2hkwV4
	2RskvTtTNHGLeNhr6qU9cqBl+eL9jBcJmne6PKV13WwV8rhvoiaiO1JMKdB1DdlWpgobTzCFzGGRD
	XaRqMUYmn4Oh96LsYXxib5QX4n3clihOwl+ELXk9mPk7Ucm74iMWOg0X6QEMuWH9F+sn8Dn+jQTSI
	c+X8jknvhi6yLzgO/+8W5nlUEQqO+9mKx8zZubN1pWJto0FjsF7J9/plVRhGN/AJ12EQXsjpaLEnS
	ZCyuQj1lVOB1aejktnXyi4xNmIhAehkgaNmBcRjrqA8jXQ119TdRCkpIDfzuCZ/zsEIEBKqtC8Dy4
	MDGhQRhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEujG-0000000513W-0Igl;
	Thu, 08 Oct 2026 20:28:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEujE-00000005130-20s4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 20:28:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB0BA4329B;
	Thu,  8 Oct 2026 20:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B8D1F000FF;
	Thu,  8 Oct 2026 20:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791491315;
	bh=AXqdN5NM/wlg2F8eFqzzica7nKQ60DQkM32wCrMgOZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P1WnOMAzhX0r0p+dRbQm5BeoFyfpcd3NetZ23g75J+5tUE1LIbd/YHCWDvGgCLu6N
	 aG9Aa9SVdpmPs6FlZ9wGBTsAb6Zn+ywHdgimkOcCc3CWfTitu7olMeRlHNptNgu3E4
	 EejlmpRyIMyaQBw8iKqJog0witsYLYjMjhvd0tQKHeEGdxOQO49izGp8nO6XqUNcPi
	 M/k+AuanHknCantAAJUaqzb0o7OJwMtl1sV8WzsEeljdv0Pz7N2Xw2CJCIouqpI2Pp
	 wWl2j2Ah6juGjj2KsaObFAt5EA2mBKpED6pwg4qx4tWX+cV/fF9VksSVXl9I+lOJ6M
	 UdzIbVXDQOZLw==
Date: Thu, 8 Oct 2026 13:28:30 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: Re: [PATCH v2 0/7] KVM: arm64: vgic-v3: Make LPI disabling robust
 (and more)
Message-ID: <asf87i2RDh-WksL-@kernel.org>
References: <20260929093548.3598547-1-maz@kernel.org>
 <CA+EHjTybnn2jgVKxCO0WXdGXWJ-=2p4k98CHfh3CrhJopvPDFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTybnn2jgVKxCO0WXdGXWJ-=2p4k98CHfh3CrhJopvPDFQ@mail.gmail.com>
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

Hi Fuad,

On Thu, Oct 08, 2026 at 07:15:46PM +0100, Fuad Tabba wrote:
> Hi Marc,
> 
> On Tue, 29 Sep 2026 10:35:41 +0100, Marc Zyngier <maz@kernel.org> wrote:
> [...]
> > Address the two issues in one go, by actively taking a refcount on all
> > IRQs referenced by last_lr_irq, and making sure that disabling LPIs
> > force all vcpus to be paused, making it safe.
> 
> I'm triaging Sashiko's pre-existing bug database, and I ran into
> something that I think this series doesn't cover.
> 
> vgic_its_inject_cached_translation() doesn't check vgic_lpis_enabled()
> (the slow path, vgic_its_resolve_lpi(), does), and pausing the vCPUs
> doesn't stop an MSI coming in through irqfd or KVM_SIGNAL_MSI. So an
> MSI that hits the translation cache between vgic_flush_pending_lpis()
> and vgic_its_invalidate_all_caches() can still end up on the ap_list
> of a vCPU whose LPIs are being disabled, after the flush.
> 
> Could the cached path check vgic_lpis_enabled() on the target vCPU, or
> am I missing something?

Hmm, since there's no parent lock between disabling LPIs and translation
cache fills I believe there's still a chance for this to race. We could
have vgic_target_oracle() return NULL if LPIs are disabled at the
redistributor, then the rest of the AP list machinery will "just work"
for injections that slip between the cracks.

If only Arm went a bit further than "strongly recommends" on migrating
LPIs _before_ flipping the bit...

Thanks,
Oliver


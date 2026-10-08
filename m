Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A99CA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 18:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJp6v2Ja1oAUDcBBY8lc+avUqbGTGsWO7LV2V6N9F2w=; b=WvZoGBhiA2BRxcJRbw0hW9MRbj
	JEaIoqZldVLGBW8wjcna8P10ZOnaJymNZx1U/62J1GOrnz+qUODJEYGEiTxxcrXx6RJbeK51BlkmM
	dQ2cQryDNtQ8k74MN0kR4e0cotxTfUoMTqAypBFSg9pqvP9jaT87G1aK3SwpzaS8gFpDmOqZBvUk9
	zfp8Xo1Q0EOr8OUoo7kq1kB3OsMTQj5aoU7ieOn4cZYappvcky+2lcwvZIITLkNAbIHbATH+ejWvG
	4O55zsF/iIfYmr4g3dpI3qn6L35jmkBeZsF5h/wg4V6JFFzq+HZNJdYxQfpA5hdX/ocVpPo43hKIe
	Bad39h/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsfR-00000004quc-1NXk;
	Thu, 08 Oct 2026 18:16:33 +0000
Received: from out-100.mta0.migadu.com ([2001:41d0:1004:224b::64] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsfN-00000004qtt-10HH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 18:16:31 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=dJp6v2Ja1oAUDcBBY8lc+avUqbGTGsWO7LV2V6N9F2w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791483386; v=1; x=1792088186;
 b=q6/ERxZumIUP8BEuhc3t9+7tGq2TD2YgCtEVPknfYQckKnqlfoTFCoK+WCUEYJkWQND0FxI/
 Q3YGovqQ7t42gasGi40eX6qICMmcSU1+SgI/HjhGGRFAusqy3+UoKOzeVlgiiQxho96/X2DZ802
 Cv4y+VID2X69+CS5OpTSZCbo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 30a4951e36c35918;
	Thu, 08 Oct 2026 18:16:26 +0000
X-Mizu-Trace-ID: 30a4951e36c35918
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bcc04c71f5so1057e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 11:16:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxfR8PuWALDrvbgeA+SVTrDo75hAgPcH3OO6ZZ9yP3tnvOK0O5uEHALUCUx9AzsJ/hY2mg8ihV/wAMZbLRcCV+D@lists.infradead.org
X-Gm-Message-State: AFq9FYJorO6YqvGl4GOGEX6aeqO7+RELcR2gc+adRrQM3qDAee0xJXPO
	0L19hIhnvuGqpfuWr5AXKCAdRpl11Uh+bO0+K12X9evhE86TGG2lv9T880YtAw0/JlXScBqajjn
	8V1pqspEfzJXiLU/E+COrV/eorJLY5uCCGLbrMZr+
X-Received: by 2002:a05:6512:ace:b0:5b8:f142:cf3 with SMTP id
 2adb3069b0e04-5bcd5890f4amr150542e87.11.1791483383492; Thu, 08 Oct 2026
 11:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260929093548.3598547-1-maz@kernel.org>
In-Reply-To: <20260929093548.3598547-1-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 8 Oct 2026 19:15:46 +0100
X-Gmail-Original-Message-ID: <CA+EHjTybnn2jgVKxCO0WXdGXWJ-=2p4k98CHfh3CrhJopvPDFQ@mail.gmail.com>
X-Gm-Features: AclHuK9F-CjG2RqTqPcpwRNH7SEKScgxMbDWuUjmfFIxGLGqlhC9PbSIglGCGAE
Message-ID: <CA+EHjTybnn2jgVKxCO0WXdGXWJ-=2p4k98CHfh3CrhJopvPDFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] KVM: arm64: vgic-v3: Make LPI disabling robust
 (and more)
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Yuchao Zhang <ndaugoing@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_111629_927431_F7A4F666 
X-CRM114-Status: GOOD (  10.59  )
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

Hi Marc,

On Tue, 29 Sep 2026 10:35:41 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Address the two issues in one go, by actively taking a refcount on all
> IRQs referenced by last_lr_irq, and making sure that disabling LPIs
> force all vcpus to be paused, making it safe.

I'm triaging Sashiko's pre-existing bug database, and I ran into
something that I think this series doesn't cover.

vgic_its_inject_cached_translation() doesn't check vgic_lpis_enabled()
(the slow path, vgic_its_resolve_lpi(), does), and pausing the vCPUs
doesn't stop an MSI coming in through irqfd or KVM_SIGNAL_MSI. So an
MSI that hits the translation cache between vgic_flush_pending_lpis()
and vgic_its_invalidate_all_caches() can still end up on the ap_list
of a vCPU whose LPIs are being disabled, after the flush.

Could the cached path check vgic_lpis_enabled() on the target vCPU, or
am I missing something?

Cheers,
/fuad


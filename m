Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14415C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 18:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0KEEUNR8mR+SFoRHY+bhTLUIfk8zA2xvwNVPzSAck4=; b=1ywg/OW/DscQbeLijvGkOeim8j
	2DCiZuEe/jiOnp2eTzaeM71d9I5JDC2RkYysW9rbopMttVyx0WY5iWNhCgSRoiWkD7xr4GMvsww0u
	Q6LdKEFNFfkfkbUyn4foG22M2z3hvA7cybLdye1tBfQDJT2lY2FqTeAXmvx6Vzz7HfZUNR3Nk2Aew
	0HnJVdEcPVj4KWE2A1VTI8F2Q6jxTKIYeQP99gFOkcMOr4v6EBIaA2bJpeKa6uOMvL+FkBC9MuewD
	46VYZgkE8JySUrkmeIuzszOMwqiFV4ZnVWQLfTeN1VUwQIBAcnOPBEQu9Pqw3W4iaQfck2ZXd6G1X
	sgWSOl8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsltZ-00000009aAw-3Gev;
	Sat, 08 Aug 2026 18:35:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsltY-00000009aAX-38DO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 18:35:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 13CEC43DD4;
	Sat,  8 Aug 2026 18:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF60A1F00ACF;
	Sat,  8 Aug 2026 18:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786214144;
	bh=o0KEEUNR8mR+SFoRHY+bhTLUIfk8zA2xvwNVPzSAck4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TfyaECD553j9NYJ1bRDUzz8pFF45SWvvy0rgnsK1WJ6BWiCMcbfj61VREhQ98tXFa
	 50OPRrqyfG999o+bkAQey13G633Wk+0M78YjKFB02mufDnkBRgY43hV6Eim+YjcM4+
	 YU5JEAE3rVBvMKJU2HGS7CPe7Z0zDaOAG+YVjYwKxJyeO4hFocVpyigyfK+X4V3TTz
	 +OOnBeT41eLZd3AH+aR6LVSbbOLZJKxtE0BqGs2J5d7aY82AIIlxtfSfzweNpP0c0X
	 MafptAdiiXA66NZAXPZiD2NcYF0mv0+jwsITByul0bz09BWpTA1OSvSp0jIAksp60E
	 kER5OlztGmITw==
From: Oliver Upton <oupton@kernel.org>
To: maz@kernel.org,
	Qihang <q.h.hack.winter@gmail.com>
Cc: Oliver Upton <oupton@kernel.org>,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: vgic-v3: take an LPI reference in vgic_v3_save_pending_tables
Date: Sat,  8 Aug 2026 11:35:40 -0700
Message-ID: <178621413201.380376.9463585617788229094.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260807025534.34125-1-q.h.hack.winter@gmail.com>
References: <20260807025534.34125-1-q.h.hack.winter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 07 Aug 2026 10:55:34 +0800, Qihang wrote:
> vgic_v3_save_pending_tables() iterates dist->lpi_xa using xa_for_each()
> and dereferences the returned struct vgic_irq in the loop body without
> holding a reference on the LPI.
> 
> The xarray iterator only provides temporary RCU coverage while looking up
> the current entry. That is not sufficient for this loop body, which reads
> fields from struct vgic_irq and performs guest memory accesses before the
> iteration completes.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: vgic-v3: take an LPI reference in vgic_v3_save_pending_tables
      https://git.kernel.org/kvmarm/kvmarm/c/f5b8f203bfc0

--
Best,
Oliver


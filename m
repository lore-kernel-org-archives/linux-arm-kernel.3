Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FF4C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbX5W39FWqeMlA+gIBZZdlhJ3hBcabaMBE9NTMEIYzg=; b=vLP4mxHokvoB1ZDLTuXL50iOJD
	S1q1MUCi2IZ76Sb/iuGfRSkge7dmeVgSmVizipkvV6VSjdmT5nZ7xnM218aYK1a2uIQHjWdwKuv4w
	JCwrDqHSCkKvNiD56yQCm+lso+7tZnPgP3amrOPLXzSZcvwQ+MhJhho/WZKMn9rliZbEyX/HdblWn
	kphvXx8O3eoUBpwi8XS2XtdmRo1UCVNxxn5iqM21aAodqHvJhsgZSWTl43ZkE3Fn33VSy6RbFPhxD
	GzuvXgeqB4798fTmFYsMZtOWNs9KPE/PqO3amF9iYwzXO3bYP1bbR33SWbzCJ4Five8UV1miAoV4f
	sf6hpYgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw18-0000000EgFR-0maf;
	Thu, 23 Jul 2026 16:11:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw12-0000000EgDp-21vn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 16:11:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB70940B95;
	Thu, 23 Jul 2026 16:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E204B1F000E9;
	Thu, 23 Jul 2026 16:11:19 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmw0m-00000008721-0s2F;
	Thu, 23 Jul 2026 16:11:04 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
Cc: oupton@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 0/2] KVM: arm64: vgic: Fix racy LPI release and re-registration handling
Date: Thu, 23 Jul 2026 17:11:01 +0100
Message-ID: <178482303771.3351010.3978266372982748047.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715105137.3973823-3-clopez@suse.de>
References: <20260715105137.3973823-3-clopez@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, clopez@suse.de, oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Wed, 15 Jul 2026 12:51:36 +0200, Carlos López wrote:
> Fix a couple of potential issues that could arise from racy LPI release
> and re-registration for the same INTID.
> 
> The issue fixed in patch 1 can manifest itself through either a
> leaked LPI structure, or a prematurely deleted LPI. The issue fixed
> in patch 2 could materialize as a spurious -ENOMEM failure when
> registering an LPI.
> 
> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: vgic: Fix race between LPI release and re-registration
      commit: cbfe2b24a1ea9de35032dbdd100fdc700f5be92d
[2/2] KVM: arm64: vgic: Mitigate potential LPI registration failure
      commit: 21f12496fdd357ad4e1fcdd07dc80ab7378f7d24

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




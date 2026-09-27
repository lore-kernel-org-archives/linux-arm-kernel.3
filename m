Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91835C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 16:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPKgJC8RbpP+9ibDNCnvvFbPTYvz5LnInWapqFpnif0=; b=J4dwvyuej4G6LyntB1aSzMUKnu
	0e05hYIdqEB4c7rWlgK5Tt4pqL6kWePLYdfWaaovv/EeOok6S/jQQzC2lZS9py+PIRZ9Ipis2fv26
	oqb4U8DGm996dHbjoyUAeAtQ/EFO0w2Yj9ZVyItImJprR8ENKsr2eXbqXfXw0Xz2hnalzUquZ9cWE
	oX01/8K5gfHX2YufubWra9UO/DhP6Lrw03HOEZWXQD4K4Z+10BZOaa5SZZxonpyhoGKPmmNVCrnv+
	EBLoZNMWFR5WV1zYrCp6/y9u1oD2Y30wkQ/OODXJDEG8HjRuXazNB7hA3KsMPF3y2xI8y7O9B0o0Q
	UGLNKNPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArqd-0000000GbIB-2Qm7;
	Sun, 27 Sep 2026 16:35:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArqL-0000000GbF6-2c61
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 16:35:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 602EB60AAE;
	Sun, 27 Sep 2026 16:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160FD1F0089A;
	Sun, 27 Sep 2026 16:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790526911;
	bh=iPKgJC8RbpP+9ibDNCnvvFbPTYvz5LnInWapqFpnif0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DJnh36nn6WxhyaCJbJGkTanQoKzCjItyolhMxnEc22pXRpCgSLUh9BRCw4+lEcamN
	 tIKd68LpYeUBraUKB2vRpJgNBIAXb0J7s6cYm3xfwsUsoL5SoXwHg0v81/rVOOIlUz
	 tzrgQwQ04P9WXmsMGOw0rNNiDhNHIRnxhp3YHtSMIlxjsulriBl3KBQ9cx9WB/XxQV
	 C+w7Gkmb7UsPZoAkXXCR0aOVWkghV7qt9E8nCip5ebUhL7xTeqa1Z9XrqJ23Kurrm/
	 JWWE/nD5R7pRguabfOazZd/5OrSaHSSx24R/egUC792zx9KO0P65cnc+B10CicfYr5
	 dZ8Khc/DmNzEg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xArqH-0000000E2Sj-1J3a;
	Sun, 27 Sep 2026 16:35:09 +0000
From: Marc Zyngier <maz@kernel.org>
To: oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Vincent Donnefort <vdonnefort@google.com>
Cc: joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	kernel-team@android.com,
	fuad.tabba@linux.dev
Subject: Re: [PATCH] KVM: arm64: Remove PAGE_SIZE alignment for hyp event ELF sections
Date: Sun, 27 Sep 2026 17:35:06 +0100
Message-ID: <179052685160.3528802.5901671854382290571.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924095154.807726-1-vdonnefort@google.com>
References: <20260924095154.807726-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, vdonnefort@google.com, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, fuad.tabba@linux.dev
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

On Thu, 24 Sep 2026 10:51:54 +0100, Vincent Donnefort wrote:
> .hyp.event_ids is mapped as part of .hyp.rodata. As a consequence this
> section does not need any page-alignment. Remove it to save a page worth
> of memory.

Applied to next, thanks!

[1/1] KVM: arm64: Remove PAGE_SIZE alignment for hyp event ELF sections
      commit: 8642afb74be6de014e49937c2c4de7576f45531c

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




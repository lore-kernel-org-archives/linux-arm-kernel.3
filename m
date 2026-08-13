Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A463AC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 06:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYDW+ngw5qRURlwX89PvvWJBIbVdW4n1IuPbDPKQw08=; b=oi+yW6DKm3B0FM/xLmgslyXhB8
	06RRmmHiRfKccLWe+Yma9TSNQ/WGKUePMTMGWfCPV4LRPUdO+Qb19aDmonMQKM1dP9A4ev0bO/aGr
	LfNCJ00dDrH36poX5bBQF2tBwEx1VjMYZUMDQzQPdPI6nUxeiQqilmvLrZ5eEbdiwHYy/RVYW29Y2
	If00OfELbUi+d1jaMGDI5Oc5bvA90jxULSmticHoFw/GWM4cSW9YjEbaz7Dro2qwIgy/TlGeOS6tV
	jU/GzUyx5T7df6R3ZVOhg8EObJ6xUwQQ8pfv7rNfNf7i61aDq7hXSY41e+YNjgcQEsSCWkzSj3oly
	yRot29ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPGO-0000000HWMf-3Bp8;
	Thu, 13 Aug 2026 06:50:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPGA-0000000HWG1-2dIo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 06:49:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE983600DA;
	Thu, 13 Aug 2026 06:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66AD71F00ACF;
	Thu, 13 Aug 2026 06:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786603789;
	bh=LYDW+ngw5qRURlwX89PvvWJBIbVdW4n1IuPbDPKQw08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X6LWYWU+mWJ/If0/MpTS3wczw7IetQ4Xv2cKzyEVUbexBH+NPMYJW0O1yBiBkP5+H
	 nPIIn1j9s0vvCg3JePdyx8+hER1RYRLUIL6JemlzVZyxjsgWYQU8yrZfBNizmNRQ/w
	 IaaJsGk4vejpA7Q8uXsVKPlVfcAAmbMBq3bwi8cx9f3qPVucqtfJ/dZE2w5dNTfHFC
	 NPdxNan+TgHT/LW0aelb6bHzquuR+XJJLN/59tmNflDvqIFIIUdWC+3wl+OOCPOpKm
	 JzDl03iGXahQNLHNECBPbW4pqq5aNF3k6SlN1kHBGOqsNMVVikMLBq02HgJkNzjuDq
	 O6Gag3y1wmUlg==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>
Cc: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: GICv2: Don't WARN on out-of-range GICV_DIR INTID
Date: Wed, 12 Aug 2026 23:49:43 -0700
Message-ID: <178660378177.666424.79190290228047804.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260726174803.5880-1-kmehltretter@gmail.com>
References: <20260726174803.5880-1-kmehltretter@gmail.com>
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

On Sun, 26 Jul 2026 19:48:03 +0200, Karl Mehltretter wrote:
> vgic_v2_deactivate() passes the INTID a guest wrote to GICV_DIR straight
> to vgic_get_vcpu_irq(), and treats a failed lookup as a "can't happen"
> condition with WARN_ON_ONCE().
> 
> The guest can make it happen at will, though: for any INTID outside of
> the implemented SGI, PPI and SPI ranges the lookup returns NULL, since
> GICv2 has no LPIs. A guest running with EOImode==1 writing such an INTID
> to GICV_DIR triggers the WARN, and panics hosts running with
> panic_on_warn.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: GICv2: Don't WARN on out-of-range GICV_DIR INTID
      https://git.kernel.org/kvmarm/kvmarm/c/c6d9c8ac6521

--
Best,
Oliver


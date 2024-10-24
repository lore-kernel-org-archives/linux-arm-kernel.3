Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46D4CE8E67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 12:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9SIV40LSXuSjqeVp67TdEw14GS8j5AqkwvhbCW3oUA=; b=O3GVm2UDVM1vSb4R4pl9mMf+ux
	+22FHSB2C0ffhkIsntVun6iEhIZdPBzdJ+xNXDoG9e3xL5fv7Dx439tIRqqdoxN9SlzaGJLUHNUq6
	N0AH+Zkn499s+vfwuRBp8J/HfcpvXIj1jOVy7FIqZ0UdLmVYzrO6GDmlzCJvFhBpTxB26RSfiEF6R
	3zofooVVBuZQHEnMEwHYfNVrHERpMWeKr/FYWnY6UJv2WlTY99GB3zP5sR+PohaNsUzGdw6FnBocT
	PpV8T+NLu19m8NCrU/BqhNuQ86fIheidTBhfUsqEH4Bc8q6ipf4D2O/690tQab6G3v6/kJ+yu71aL
	Ua8Q5BVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wvp-00000000Ksr-0DQk;
	Thu, 24 Oct 2024 12:27:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wuG-00000000Kha-18uE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 12:25:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 246C55C5CEF;
	Thu, 24 Oct 2024 12:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D4DC4CEC7;
	Thu, 24 Oct 2024 12:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729772735;
	bh=DWXGV4gKNnefe7Z37+0J9UM+EPFPvAVYED14D8cKqUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OrWAytgEI7HJjWnnYxWwrt3m4TrVNMkNxyGUX4BIGTWZw8r5TI5CiN2r2HM0CKSJy
	 a7mgEDhfVqo5FJHOybCtIaQ9Hvv2gUQIIkMpF6P6yFxO8vQsiUHga6rL7qLjoQkD1L
	 PkIEAvcXixFyys6lhS33GVgbZwO6JvaVBncavPZYFXrA5tTgVDZRHyCSWVgTLRfKVY
	 4DRo/Jm+l6biB7b/nW347vQC+PsEfIygYIXrysPLK5+BOvfpn00axr1+R+zRqygnD6
	 5Yv9tfdPpHLpxGybOz8u9yk5gQHXoJnBQ0zvMIcyVSEMa6ssO0tFTYkeyxfWKvizlh
	 cXOAScRrFWcuQ==
From: Will Deacon <will@kernel.org>
To: jonathan.cameron@huawei.com,
	mark.rutland@arm.com,
	Davidlohr Bueso <dave@stgolabs.net>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	dan.j.williams@intel.com,
	ira.weiny@intel.com,
	fan.ni@samsung.com,
	a.manzanares@samsung.com,
	linux-cxl@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v3] perf/cxlpmu: Support missing events in 3.1 spec
Date: Thu, 24 Oct 2024 13:25:27 +0100
Message-Id: <172976975631.3760779.1396610844480750567.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241010025208.180458-1-dave@stgolabs.net>
References: <20241010025208.180458-1-dave@stgolabs.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_052536_374006_F44EEE60 
X-CRM114-Status: UNSURE (   7.49  )
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

On Wed, 09 Oct 2024 19:52:08 -0700, Davidlohr Bueso wrote:
> Update the CXL PMU driver to support the new events introduced
> in the latest revision. These are:
> 
> - read/write accesses with TEE constraints.
> - S2M indicating Modified state.
> 
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf/cxlpmu: Support missing events in 3.1 spec
      https://git.kernel.org/will/c/48545b3eff6b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BE7E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 15:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sw7XA2U/N3uu2fW/FyWd8CDrTwYMoPwEo9nZ69J/7zo=; b=gnKx5ntf7tqQZpf8euKOKj/Q2t
	0mPDtr/cbnqYKZ1nihB7Og+ZfAvUE0ig0cNPNj+/1WLsfBwYlMt+BGAG3RsquZbtC3kuNvl4vsnQV
	UE9TuVjnp8b0knWi4ZlUhn3daM06SVsKoV13j5pITWaXSNSKQJ+YM8pddCQA88Pw9Iq2LYb6g2hDH
	lq2RxlvCPE6eWbkQedpv6yLTDkmAdT5DDm/65Z+yeF76uMz5tXPg8hDIk6uLe7DNRO6dVRzU/di/7
	2rz/XCYkRM0qJ5OWBn2ZHwKnqvip9C66K4P6an8rYHdMf+bFzBiCp+DFeFDH9So2pr3H+Lr8qpRjt
	5hhoobug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWd2p-00000000xk2-2c26;
	Sat, 11 Jan 2025 15:04:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWd0Z-00000000xVk-0akp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 15:02:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BDAC45C5480;
	Sat, 11 Jan 2025 15:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C313C4CED2;
	Sat, 11 Jan 2025 15:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736607758;
	bh=U6bro49caK6aBzW6XG6V8QOCPxjNZ0rPepiWlKEKqd0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pAxFbrlvT1HYG5aLIdA47ajh4hlbVAT+fWIMgcyLXsQM239da7+yQ0KjaOad78SDC
	 a1uYSdK7mXAdYP0jWelWC3fHZAWcYqshrtiMtqagMwb9vmLpSpGIWO3B5+7/SZ3rCf
	 E0xRN6O/0IcTbHN2XDkzU7yA+WTdqFfGqq5ZEzCLzrFCqIZyNxM9X8c/JHQRAoxfhn
	 +tSpngkIwXnPJwoseZQ7eb6AI1OFOLhNUwxqpHtJDyswqmJarqnrmIgrIn3EWpqmih
	 p/muBQthODZyn/ERV8zdLWr7vEJoTN7LIZxZUy4Fy0B8nPWRdtqhR523CMZtXSiWdg
	 Ee14JZGEMVMTA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tWd0W-00BBeb-3P;
	Sat, 11 Jan 2025 15:02:36 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Explicitly handle BRBE traps as UNDEFINED
Date: Sat, 11 Jan 2025 15:02:33 +0000
Message-Id: <173660773861.818546.3192188976167687860.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250109223836.419240-1-robh@kernel.org>
References: <20250109223836.419240-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, robh@kernel.org, mark.rutland@arm.com, anshuman.khandual@arm.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_070239_218831_BF833561 
X-CRM114-Status: GOOD (  10.91  )
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

On Thu, 09 Jan 2025 16:38:36 -0600, Rob Herring (Arm) wrote:
> The Branch Record Buffer Extension (BRBE) adds a number of system
> registers and instructions which we don't currently intend to expose to
> guests. Our existing logic handles this safely, but this could be
> improved with some explicit handling of BRBE.
> 
> KVM currently hides BRBE from guests: the cpufeature code's
> ftr_id_aa64dfr0[] table doesn't have an entry for the BRBE field, and so
> this will be zero in the sanitised value of ID_AA64DFR0 exposed to
> guests via read_sanitised_id_aa64dfr0_el1().
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Explicitly handle BRBE traps as UNDEFINED
      commit: a7f1fa5564be565bd4bc18875bb46ffd0c01d292

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




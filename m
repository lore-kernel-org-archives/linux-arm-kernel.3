Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF50CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 16:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scqFfPItdGINGCWBU061MbMp1aJ9X/xDHgUNHVisgCE=; b=QE3ak5jEf58RnrnLKTuGzm66Dc
	0iwe3N84XDd/UwEforlcEoG/hqhbsDTk7ERkRZswOt/h38t11lbG1NcNLh1oVlE1BneQrQk20DM/l
	TvkzTyQJ5D7yhJ0t3/srRjVDymPEUv5S35f6vNrNVj1OllE8erTlCAHWo0dVqbyR63VLXlnqZVH9q
	nLwoV7TgJxepa/zE1rq5jcNcnNuV5Vk6LmEWtbAhnrdR5/7z1GJx4ylvSYI8Ruehu5KozCwbaCwJe
	7Mfzw/MtaKm725OndGdAqMxaIRXATEKD/nZrWNiiVc/LuJZntZ4Vdi0e4WQQXjJ2Tqst1gTbbbUtM
	PTUuhW2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKetW-00000001T4V-3uO5;
	Wed, 06 May 2026 16:14:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKetS-00000001T2M-445o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 16:14:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B112F44224;
	Wed,  6 May 2026 16:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDFCC2BCB8;
	Wed,  6 May 2026 16:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778084078;
	bh=NWybhyhZOftJ9uYzJ6gBhCYWxRgsVrDsoYwiBx0JL+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d5fY96X9nEDw11sMbwI3KaWS9j+3p2jEuuARhK9OvDaBwQN9wAzJfEOtWtSDYHx4d
	 5u1Bj/VqUmri3eMVa6zUn5h8lZZ7o1UAJQ7w1+F8SSiwkYhvC8orc6RISZX0hzCycL
	 PWwrNOPQ3CstXUbeKGvYkn9Eg9wuOoLniZrCGOXZBWXzmgg5VpUNz9Z1440KnXV/0X
	 6xNWZTWAu9BWtF8/2gWoP8Ko9LcD7mjGd79E4jzFe0sb20whz6+UO6tsPVK3qJ0Gzt
	 wxCgbnXkbrZ0t5cnxBOjIAhS7WlD3hoKdbKXcnv/TJ86GNE8SvGM5Yfnz0gH42nFmT
	 b9Ps6XZ4W1bWw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wKetQ-00000000MI9-1pD4;
	Wed, 06 May 2026 16:14:36 +0000
From: Marc Zyngier <maz@kernel.org>
To: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v2] KVM: arm64: Work around C1-Pro erratum 4193714 for protected guests
Date: Wed,  6 May 2026 17:14:33 +0100
Message-ID: <177808404886.2712489.16077885657000139159.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505165205.2690919-1-catalin.marinas@arm.com>
References: <20260505165205.2690919-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: will@kernel.org, catalin.marinas@arm.com, james.morse@arm.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, mark.rutland@arm.com, oupton@kernel.org, vdonnefort@google.com, lpieralisi@kernel.org, sudeep.holla@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_091440_334496_76FAD012 
X-CRM114-Status: GOOD (  11.75  )
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

On Tue, 05 May 2026 17:52:03 +0100, Catalin Marinas wrote:
> C1-Pro cores with SME have an erratum where TLBI+DSB does not complete
> all outstanding SME accesses. Instead a DSB needs to be executed on the
> affected CPUs. The implication is that pages cannot be unmapped from the
> host Stage 2 and then provided to a protected guest or to the
> hypervisor. Host SME accesses may still complete after this point.
> 
> This erratum breaks pKVM's guarantees, and the workaround is hard to
> implement as EL2 and EL1 share a security state meaning EL1 can mask
> IPIs sent by EL2, leading to interrupt blackouts.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Work around C1-Pro erratum 4193714 for protected guests
      commit: 1f7305d87aa23db2579df222eba504a333c2c978

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




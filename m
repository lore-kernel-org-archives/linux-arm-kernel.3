Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2523C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EpGQIZmgalidAvNcbOBD4i6blqIBpOBvLb4n/Wdz8Q=; b=JWn3/GkP/3dSceACSa26TM5JDh
	S7h3yQFaWKrHK4aFjBTWgWlgMYvWJotfR6L9U6GX2Kq4hckiQSkG2LDVrDTilCc1qU3zf8ieDCPdd
	7GW8ezNtkcw1dN9yGF80dp9mvCVIwlEILPYupxlQrhOjBgJFoow/DaNiSFy7PtzwEoB7xP7KqpRfd
	uvzLJesTgPMMol/Sgi+KiqNLRrWJnUUyFqahW6QXsiYB02Jkdmfeqgx27WmkkOYjBCX/uB4e5BXsc
	YOns3nsPTa1v+fnmOaZYpnejVwNKS4HT2yjkAUfwWogqPXDfOxgP0e/MquOeqbnrjbFXpvg1ZSrva
	pPak4mgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3eG-00000001DPk-37Q8;
	Thu, 08 May 2025 15:59:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2m8-000000012AT-0IVH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 15:03:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 31AAF5C6344;
	Thu,  8 May 2025 15:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5722CC4CEEF;
	Thu,  8 May 2025 15:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746716583;
	bh=0wawN12thXI2vW9uDjQnG/0WsI4MydPLkJZH2Ut02m4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TSgQJ10b86BYBktYnpa9YxB0kz6aLWSgncYSZr5bfmF1/SqXH2Z8e7XEN4iQsJB5D
	 Ref79mlEqYfoFSrQ8nnU4g5tK5DlC6WDX6PQMWJQqShNBwg+KyyD+SgQRMGOEIRQNA
	 +Wqg3AhWnDwz5LgUGp1Uh03Y7QH1wwcgXLSCrlsKa7dXjRqXYoJWwkpcmqiAMRMKXx
	 NMz/MgHnIMMtWJIHM/LlSAL9Wdcrzowfjdt0mm6MHHJ6yFkXAEJcMAZqR2F4PYLvlO
	 iINAtruTSYkG5l8CONwsPLs57+Cu8CVqAgsKaoKF4FYj3ANM5abUYMu9cTL77Bx0Kg
	 aWF7351kL4QNA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	broonie@kernel.org,
	daniel.kiss@arm.com,
	david.spickett@arm.com,
	luis.machado@arm.com,
	maz@kernel.org,
	richard.sandiford@arm.com,
	sander.desmalen@arm.com,
	tabba@google.com,
	tamas.petz@arm.com,
	tkjos@google.com,
	yury.khrustalev@arm.com
Subject: Re: [PATCH v2 00/24] arm64: FPSIMD/SVE/SME fixes + re-enable SME
Date: Thu,  8 May 2025 16:02:56 +0100
Message-Id: <174671552562.263562.988816278275314915.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250508132644.1395904-1-mark.rutland@arm.com>
References: <20250508132644.1395904-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_080304_152930_A499D66A 
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

On Thu, 08 May 2025 14:26:20 +0100, Mark Rutland wrote:
> These patches fix a number of problems in the FPSIMD/SVE/SME code, and
> finally re-enable SME support.
> 
> There are a few (mostly minor) ABI changes detailed in the patches.
> Notably the clone() ABI is changed due to an incompatiblity with the
> AAPCS64 ZA lazy saving scheme and the way this has been deployed in
> userspace. The full details of that are in patch 13.
> 
> [...]

Applied selftest fixes to arm64 (for-next/selftests), thanks!

[21/24] kselftest/arm64: fp-ptrace: Fix expected FPMR value when PSTATE.SM is changed
        https://git.kernel.org/arm64/c/78b23877dbba
[22/24] kselftest/arm64: tpidr2: Adjust to new clone() behaviour
        https://git.kernel.org/arm64/c/be45e63f79ec
[23/24] kselftest/arm64: fp-ptrace: Adjust to new VL change behaviour
        https://git.kernel.org/arm64/c/031a2acaa1cd
[24/24] kselftest/arm64: fp-ptrace: Adjust to new inactive mode behaviour
        https://git.kernel.org/arm64/c/864f3ddcd715

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


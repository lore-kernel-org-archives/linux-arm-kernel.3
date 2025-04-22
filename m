Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2623CC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 13:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GmIqYf2Elv/I19i6l+2WxL75PzvxOlI4EaLSaSicV3Q=; b=4NdqXMEYQiAZ7RX03KeqY3Vo5l
	7PCaMhiVEgulh/E0DyjnzNzsYGEaeztLumN2F4NZmVO6hRKO10CSdPGPhDX05FEyBshmp2UY3HJQe
	iDaa1DnmZG0c/vK7nS/5a5BfUPQ5DVMtMEoYN2MYEjPGWSJ+WBo/P83u8K2/yZOXhvOo/cwbYjK4F
	dEajwVhB71vP+6/oDLP38LrKs+cL/u8MYNTZKCwn8YYMhT3ajkJtCo2GFnetWKoW2J4Z9krjh0lZn
	xliQBq2SAWpeM45VSnAZDwK+En7YFsLVcDqnmuwj9wliJxp6mTCp8pEqV/VnwqUYEzcCz3NpPBIIy
	/9NqMevg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DrY-00000007LJH-081P;
	Tue, 22 Apr 2025 13:40:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Chp-0000000765a-0gJB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 12:26:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C979C4531C;
	Tue, 22 Apr 2025 12:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2790CC4CEE9;
	Tue, 22 Apr 2025 12:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745324788;
	bh=pqH1yDInLKI3DmlVSaEG6piUtYhC27nXCsEvC9U0OYI=;
	h=From:To:Cc:Subject:Date:From;
	b=FJK1WV7ZEOCjLnItS+7ihH1OuKUXfnW9H8+QUS5fw44WHz6UyzeRt3ZYI+OldCndF
	 NNEsMCa3QRPV3kF3aBoA11QEQu2Bt2sP5Q3HUzRoIFAErqtN5sl19o0CQ5Lz3AUEvG
	 ESJERqFnpFV9yMyjxi015+IdoQRVhwNkBjxfUT8m7+aczRHYnh0xKOps+ulbgQfA7Q
	 ErXTSmB4QfT9ALGTHHbMKy3crEYjNczOkmj+0CL/nn29qyFr2wmXsYL80g3n6CWhge
	 /I9Botvdf+wUCFyZpIuFMeb2A7Mm8a9HrQVT/aK8AXDIj4OoGy7mP+l0zbNueOMyUB
	 4Pf8c0OCQdbqQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u7Chl-007c9q-JA;
	Tue, 22 Apr 2025 13:26:25 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	D Scott Phillips <scott@os.amperecomputing.com>
Subject: [PATCH 0/3] KVM: arm64: Address Translation fixes
Date: Tue, 22 Apr 2025 13:26:09 +0100
Message-Id: <20250422122612.2675672-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, scott@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_052629_226931_36DD8339 
X-CRM114-Status: GOOD (  10.21  )
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

Here's a small series of fixes for KVM's implementation of address
translation (aka the AT S1* instructions), addressing a number of
issues in increasing levels of severity:

- We misreport PAR_EL1.PTW in a number of occasions, including state
  that is not possible as per the architecture definition

- We don't handle access faults at all, and that doesn't play very
  well with the rest of the VNCR stuff

- AT S1E{0,1} from EL2 with HCR_EL2.{E2H,TGE}={1,1} will absolutely
  take the host down, no questions asked

Patches based on 6.15-rc3.

Marc Zyngier (3):
  KVM: arm64: Fix PAR_EL1.{PTW,S} reporting on AT S1E*
  KVM: arm64: Teach address translation about access faults
  KVM: arm64: Don't feed uninitialised data to HCR_EL2

 arch/arm64/kvm/at.c | 59 +++++++++++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 23 deletions(-)

-- 
2.39.2



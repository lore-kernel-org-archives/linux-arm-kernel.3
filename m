Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D68C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 10:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QunnTpAhRmWlCSYRxLEc59rOaOjRJL0kfcKpG32Yakg=; b=xswag2lGrjo+x6xEHjwtrHPp4A
	z3Rx4/Tmfp65pjmNoiBKwSwswjzHylsjJnvQgXLrhow6Y+XHjiep61V2MAPCbHxCJkEzyKVs5WTy1
	Y8h791ZN0o3QqEAiNHOhwlfh61eE+b4Zl3rqme2+iLwhP3ooEc4i0JBevIF9y/Cuy2MN+R8tWvhYl
	Mc7ppvbbs4s/ZJ8KGuPK8S8CnaiJfRZ9Q2myNuXeJfro/9Xyw+XQIdF8klsqvdTQY2MnTXNJcfqV2
	rev1UmMcTvVJGg/XSZo7fJd0YYYZNM7oNWk3FIgg5lRLrfI7JVAJSixGYcxp2/uvXhD8kwRd0K4cg
	oxvIFrMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCydI-00000000P8c-23be;
	Thu, 08 May 2025 10:37:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyYE-00000000O2A-49bn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 10:32:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8765940C02;
	Thu,  8 May 2025 10:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61736C4CEE7;
	Thu,  8 May 2025 10:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746700346;
	bh=fPyoI7GcCfxKWwChni9nUi+L2Wk2v6G0KwoooXekSVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TnYsoKeWnumJC7kHcV86iLinM+qGPnU5j8s0Dnzx8wx027ZTNi/PHAMDfoegmS8zb
	 tW1tRNHwZN6Y0A4QYcyYtatGe4DZemNncfzskryPkrhrtHDR3oic4acBp2zKpKjsxW
	 4VLK1jbG53CrXSMdzX7wy1KUNF+I4hXFL8Ao9o6g4S8Reat5T2sz13mMgX0WVsHoEX
	 N7sMGe9gOp+hzGZsfAk488f19lvbHRXNga5ER8WzWdfeKZxm3s6kPDlfWTkcedbaTs
	 GnUbvEiTWje7lcp3AwxbaULnIb/yBOIxbSKNI3ILUwaPz9LSxuWtYB/zUogPNP7Kb7
	 F8Q2yu+/em/ng==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCyYC-00Cy6h-34;
	Thu, 08 May 2025 11:32:24 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	Gavin Shan <gshan@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	qperret@google.com,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	shan.gavin@gmail.com
Subject: Re: [PATCH] KVM: arm64: Drop sort_memblock_regions()
Date: Thu,  8 May 2025 11:32:20 +0100
Message-Id: <174670033399.833075.10663406924785088950.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250311043718.91004-1-gshan@redhat.com>
References: <20250311043718.91004-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, gshan@redhat.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, qperret@google.com, oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, shan.gavin@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_033227_044944_2FCC8CB3 
X-CRM114-Status: UNSURE (   9.96  )
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

On Tue, 11 Mar 2025 14:37:18 +1000, Gavin Shan wrote:
> Drop sort_memblock_regions() and avoid sorting the copied memory
> regions to be ascending order on their base addresses, because the
> source memory regions should have been sorted correctly when they
> are added by memblock_add() or its variants.
> 
> This is generally reverting commit a14307f5310c ("KVM: arm64: Sort
> the hypervisor memblocks"). No functional changes intended.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Drop sort_memblock_regions()
      commit: 00b0300cf1e265b8f3fa57106b940eff6f388d57

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




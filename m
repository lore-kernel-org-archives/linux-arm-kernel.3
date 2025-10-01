Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C72CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 08:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nOQGSub2sQZ0Fsd2RM8Dnxw0hhrpl+PWgOlusrcxmw=; b=IWv0xSQqBsJDHcjitbXae2OCKf
	vMVIfQdTjn/ELpbjaJNORlYkcy22T9mGbrmQX5V2MwLXUVCGCjYb0e1cZMCNOYDCZ8xBEma+/98DU
	/BZYZJXYkoHXIKEcsJN50EiItnPPWKM2HNuRMyXkMb7IZXvyYa9W8tbGxHxi+URudyMHWd2Sf1V/p
	/zDXY/qLi6HOFLMtIfoYzt5URVBDDCWoDCC7S2ykbyOX08ANVzb9RyzBzBkA9iyMoPxOzoI28kp/4
	CbTfJ9NUClgZcHiVYltkcA2xeCYC6VdLEQX7e2Ka6MKVi8SLpSiRl3+XvDZmT3y6VeR/OM6RAFV+0
	9f1OFtmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3scc-000000075jg-2d24;
	Wed, 01 Oct 2025 08:55:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sca-000000075j7-1Vcl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 08:55:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60BA544D48;
	Wed,  1 Oct 2025 08:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D9AC4CEF4;
	Wed,  1 Oct 2025 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759308935;
	bh=wryoM0pYpUXsQEkqU0pa4KCIgDFGqs0LofSC+bJAj3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nHL+q6yMo6fQWn+9jmpefGfwfcwBuA3EavvDxqJRyGNmSUNrffT0gWw456PGlo8Rp
	 Hk9ZuAla77ahah1RwXA/UjSA/0lztF0IJSicT+PYj9QB+Gn/ROHAKFYdTKMIUoUZY3
	 cem++1rW7r8ZwzvwHfKq3Hy/6HKcL3NYdX8iCW0jHXtHYS/8D6fSbM1oVtqRuaHNBE
	 pO3i7uN0Qc1zXvXX7Dp2iNLjAOdo8v0bjzfoNUowwO9ukvPc24VUMToDnEu5qhRD7+
	 23mdQAunfcxyl3ijnBxoivqQx+2RQL1aMLEkbVz4J84z9fdtHsYIf8G2kHnswEvVu2
	 a/dLN+1+WfPLQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v3scX-0000000Akaz-0WpK;
	Wed, 01 Oct 2025 08:55:33 +0000
From: Marc Zyngier <maz@kernel.org>
To: oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Remove unreachable break after return
Date: Wed,  1 Oct 2025 09:55:27 +0100
Message-ID: <175930892727.3590435.8643027286411287206.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250930135621.162050-1-osama.abdelkader@gmail.com>
References: <20250930135621.162050-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, osama.abdelkader@gmail.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_015536_415396_C9F1223A 
X-CRM114-Status: UNSURE (   9.01  )
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

On Tue, 30 Sep 2025 16:56:21 +0300, Osama Abdelkader wrote:
> Remove an unnecessary 'break' statement that follows a 'return'
> in arch/arm64/kvm/at.c. The break is unreachable.
> 
> 

Applied to fixes, thanks!

[1/1] KVM: arm64: Remove unreachable break after return
      commit: 55eeaa24c9ac3a22f9c220500e23ee8b6ddff751

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




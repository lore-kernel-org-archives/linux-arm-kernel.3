Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A81EC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dbx3x28Q0e4KyF2br/2nUC4VDgGteIIY+UllyErJvlI=; b=2iLkZch2o6N6p5yNpkxiE9/91z
	JWCFXSIIyM7b2qB6bbdlh9ZgCZvjdHr9jQwUw/yN466m6ShxJn2/lMPuDqT5hFoRbdZF7Q9aQPORN
	5DWWKxCUNlyaRksh37nLaCBOVcQQkM5oYgEcarw98HR6R/zpdb2zSUn7Q02aD7oRrOPWnVe7pLsH6
	YrVckdorMBcs+JvlwH2lLcCz0hl+xzR9W5XXMLcEVeRIr9d2JsdsRvXrGfddnouDZJB7mB0aykwb2
	YAKdwZVWNOnT5KJmVpuk8zTUh6QXilt1o4MOgeit+i0Vf6knayTF7adUAHqMgVUWYqjs052fZoJ1I
	HimhoLlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHUW-0000000DWDd-3VFp;
	Thu, 19 Jun 2025 15:47:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEVQ-0000000D4f6-0vvg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:36:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E6F7444B53;
	Thu, 19 Jun 2025 12:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C2FC4CEEA;
	Thu, 19 Jun 2025 12:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750336595;
	bh=+P5g+5CJj1UdYWKc1Wje0xjLDaJqzX/jUZTSky6aLjQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rkQNS+WRrR5CjzTSUZC0ctjimPVyr9bwAvZAWedYzd1dNL9JCxRmzGVaMpA5tGfeS
	 Lx7P1eVk0KDuf8hXiIw96t3zbmxcrQN0tWwbmX/mjYB9cKnzrGptTV9pDONMe7Vu5U
	 dDAQ5PXqKQEGJddOtnR0h62aZOV+cI8D2eJqhUSZzDMRbrxBUf+wQpaiPwEFuqtPV8
	 Nw/Wf4YynIJ+ul2spXKUZYNTEDSZTKfZKzoWdwvIDh4PSjaGqSbuvyXYyRBI+3BpMY
	 e7XEXIt03L3zNAYlomvnq4x3IXENLpfPmFyvcuobtJkcWQObQKg2JyCAnsJA2d+bS7
	 5x/ErqPxT3wFg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uSEVN-008FeH-Eb;
	Thu, 19 Jun 2025 13:36:33 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Zenghui Yu <yuzenghui@huawei.com>
Cc: oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	wanghaibin.wang@huawei.com
Subject: Re: [PATCH] KVM: arm64: selftests: Close the GIC FD in arch_timer_edge_cases
Date: Thu, 19 Jun 2025 13:36:30 +0100
Message-Id: <175033657717.3069674.5241246284273591125.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250608095402.1131-1-yuzenghui@huawei.com>
References: <20250608095402.1131-1-yuzenghui@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, yuzenghui@huawei.com, oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, wanghaibin.wang@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_053636_277727_BF17F9F4 
X-CRM114-Status: UNSURE (   9.16  )
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

On Sun, 08 Jun 2025 17:54:02 +0800, Zenghui Yu wrote:
> Close the GIC FD to free the reference it holds to the VM so that we can
> correctly clean up the VM. This also gets rid of the
> 
> 	"KVM: debugfs: duplicate directory 395722-4"
> 
> warning when running arch_timer_edge_cases.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: selftests: Close the GIC FD in arch_timer_edge_cases
      commit: 56a14984505b11674df5e01407748236bc4bc8f8

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




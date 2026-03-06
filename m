Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3C6F01821
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnh7Ef170LtZpZa+CTe/pWhkMXwc4lPiwIU/vPvA+3c=; b=MTKrXtELM53e2vrgQug+ghvlxT
	xLGLkLC3MFf/PkZi4gnsYWFpfjJnmXWnDIw2IEnNJR5+5vc7AYQQ1QoQsJRP9M3PHD/dbThfinhta
	QTNKepmIOjOiRRut29FFQztHGBPKjUju4vMF3YGQ81vMj6rp60ygYvWNr+zYEeDmNOF7gig5Apr1D
	8rPMYz7LWotwqROhg0YfKxvJNwdNVAa3ZHz6yBxFbF41BV0D9TzLOjhj1RCM/5lcWMBLW4e1CNQYa
	kpZrpjmZx2LSkUi3WeQ7pl1KqDEDjaxKm9MBuEsb0N/eiWjZr+kHwztBygTrIQolPJNIpHZ/jn8lQ
	DEEP2y1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySjB-00000003V5j-2Rcv;
	Fri, 06 Mar 2026 10:48:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySj7-00000003V5J-3SaB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:48:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E2B14352A;
	Fri,  6 Mar 2026 10:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9380C4CEF7;
	Fri,  6 Mar 2026 10:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772794093;
	bh=ERAZRUQR3DiAvO4NrHYp9EIuWfTi8S/tNjbzNXo7NQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KorhbY71VkWRYlWHJ0bqBTP3k1Nc3XBr2JQMNk++RnNl9Wb/l80DJPngzMhEN0pW9
	 fvrlk4bnL36N/al5kz/ThRR8RZDfEApesCGHFutoVFUBsOAnkDI/hPN18ZLTf3fJ56
	 clxAcO6QXhVL/XB6rjQgV/Xn+FHubKcAqCyaQa0kbHN/RG4s7Xv68Uye3NyqOaQJCL
	 UPD/EwHRfnUOoLo1HOk6Lnq+BClF5BsBKx/G48TbAMRlwiihmKBomemGKSjYwKWHHW
	 joM1uAZBiOYy1eQJKp5ZAV38bAl/VSPE5MFJIqLTm+I3wzcSFESrgLNrhugZLAweCG
	 iDh/wdumyu/xw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vySj4-0000000Gnnf-2Nzq;
	Fri, 06 Mar 2026 10:48:10 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Cc: oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH 0/3] KVM: arm64: minor fixes about S2 page table walker
Date: Fri,  6 Mar 2026 10:48:07 +0000
Message-ID: <177279406008.3200749.11694453799460270287.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225173515.20490-1-zenghui.yu@linux.dev>
References: <20260225173515.20490-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, zenghui.yu@linux.dev, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_024814_400386_CE7BC4FF 
X-CRM114-Status: UNSURE (   8.06  )
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

On Thu, 26 Feb 2026 01:35:12 +0800, Zenghui Yu wrote:
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> 
> A small step towards fixing the issues discussed in
> https://lore.kernel.org/all/3f88cd49-68f1-4276-a067-b7c6beadb27c@linux.dev .
> 
> Zenghui Yu (Huawei) (3):
>   KVM: arm64: nv: Check S2 limits based on implemented PA size
>   KVM: arm64: nv: Report addrsz fault at level 0 with a bad VTTBR.BADDR
>   KVM: arm64: nv: Inject a SEA if failed to read the descriptor
> 
> [...]

Applied to fixes, thanks!

[1/3] KVM: arm64: nv: Check S2 limits based on implemented PA size
      commit: 4c2264ecdf39ddbdb62e37b156015aacf05d0dcb
[2/3] KVM: arm64: nv: Report addrsz fault at level 0 with a bad VTTBR.BADDR
      commit: 99a339377f3c1bdf6edd5614d36893ab1806f9e6
[3/3] KVM: arm64: nv: Inject a SEA if failed to read the descriptor
      commit: eb54fa1025f8b520f0e83a807d76e35e4587c5ff

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




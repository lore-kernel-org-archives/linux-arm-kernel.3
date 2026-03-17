Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C75EFD8775
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 13:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fK5oiyFZcXdpxmgNgKZiG0tbDimGnvzYaStVKW4n/c=; b=shOFcwqR3ZZKwJrGeo0VLhydkS
	JVMVb7Oa57ZvkLckFWEego6kUx3rsbG0jxS+6zSjF5iKPGvkhJmnCo2fKwOHMwfqosLkJIkq+5YPn
	lBCXP5qTKAvIU8ALcR6BG05Y7qnzA1p62KALUK0isaBX4KEf0Rg6Tpvgyn7OcjlR/HwbaoCBO4LHh
	Y3N/JFMizBWc+GqTWVg4vtKPKtYYZXWOfU8ACedo3O1t6ioXNAcKCmq6Acob1ofnvkjtOdQ37jY4u
	xGZk4GiR/QRvhbNGxyTQ4Rajm4ZlREbbTzakc4aR3Dvl1/pbzBtXxb/Pnfda8qdkmiMmTlwicO7WQ
	pjJquTbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Uio-00000006TGn-0yKV;
	Tue, 17 Mar 2026 13:44:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Uim-00000006TGW-3Cuu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 13:44:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA86660018;
	Tue, 17 Mar 2026 13:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86322C4CEF7;
	Tue, 17 Mar 2026 13:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773755071;
	bh=xDYlTj5oh0PNIz4gI3ATDUGTOj/ofdzKUm3Eoj3jiWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mNl9nDdHF+cPk2NZzCOwLbeBfSxKTlIZGn4PRwFOpGQVfpyQKL+Yu+q4vrpzwKRgE
	 kVghIMBF3ho71K4mtfHZCiOtYdODBZxDgfUhvZXdOOTd6wpbfwU6JzBPPqa8zlu+aV
	 lkJKS+9O3fTrc1FlAYLO15FcfPDaMfyvuEPjDjzXFiHQAhYXUzDW4XwJJ1vtll0yka
	 HFoSofEz+hLXqsELs0iL7fpBSYgUZUOQriBT9ct9hn1+In4Oxz6Eh0Y32qqY2iXfWC
	 kcGdObCRNLsqxYk6uP1K8bzPfkHCCkVas1yGeKLR/9PcgFZTRH9AHBzzT+eHvKtN5a
	 S++9KdjkTEXvw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w2Uij-00000002raI-1Bu6;
	Tue, 17 Mar 2026 13:44:29 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Cc: oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH] KVM: arm64: Fix the descriptor address in __kvm_at_swap_desc()
Date: Tue, 17 Mar 2026 13:44:25 +0000
Message-ID: <177375505490.1884461.5958230825865756810.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317115748.47332-1-zenghui.yu@linux.dev>
References: <20260317115748.47332-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, zenghui.yu@linux.dev, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Tue, 17 Mar 2026 19:57:48 +0800, Zenghui Yu wrote:
> Using "(u64 __user *)hva + offset" to get the virtual addresses of S1/S2
> descriptors looks really wrong, if offset is not zero. What we want to get
> for swapping is hva + offset, not hva + offset*8. ;-)
> 
> Fix it.
> 
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Fix the descriptor address in __kvm_at_swap_desc()
      commit: 0496acc42fb51eee040b5170cec05cec41385540

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




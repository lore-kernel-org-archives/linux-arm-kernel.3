Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556F5D3941D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 13:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ertrZ7cOW6bABT6XdeWCDyQWZusL7F0NUcV1adjjfo=; b=N314uZfnXBkTkxYYvALlmjKWTi
	8J5atsi4Y4Ym0RwZ3ZWoCeeuqJDh12fVPfS2AgVxHN3McNpurGDSZbgQvFBgQHx08DhPU6svZ0pFc
	ZemyiIqH/u4KeLPs9GN44qseAcFewnLBXoj+l4fOBZDv0cov07mau5NYgSSn3NPsuvd7gDucIz3Vx
	lbabkNBqHf/ew3djX+8kSZBWBLO84uctR4y5gJ92RC8g4gkbkE5fQIRAOLNYLbk92JIj3cGEqIn9e
	ZdOfw5UhV84JcGmFEEtk2Fi4MhnpWm4JW5EE6giFGXyqW+/oZPlslVciG7/+s1NDXYJK2cejpaoMS
	sa8RtpZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IF7-00000000CDX-17Z6;
	Thu, 02 Apr 2026 13:37:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IF5-00000000CCf-2KHo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 13:37:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0657C600C4;
	Thu,  2 Apr 2026 13:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE30FC116C6;
	Thu,  2 Apr 2026 13:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775137070;
	bh=Qzgk/iZjoZnwo81KZZUDeMH/+ALFpUHEWvzUVLjFXA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VhyH76e1jkbrbnWqDJDMSo9gyycWmrdVrQ3YUBzfe/Dcq8dyFSeIQrvyqo9i6eXeA
	 yk0IEZ7A9ARfXdiYWLiV2h6eShVtl9BRqrBRtAXuQIVYfODId/HSC95aoPUTYDhmxt
	 5ZiTsGsV7PotlJ+wg81q1LwLPnt9Jr3ffAEZJ1GQmhFd85xnBaFFRCgJ5mF4uMyDod
	 58hFjlwQR6OZgy5fTHN5cjAYMxxPGL8GNHwqwafecPg4/CdsqwpCF2oar5RyqSp+KT
	 26GpStoW70AGOJMdEsuxVOsw+Kki5dDpLLhh0RNDPao6wvzocJCM++yKi7ZUbJQQ8b
	 7T5ygAU7jMH9g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w8IF2-00000008H4M-2tGH;
	Thu, 02 Apr 2026 13:37:48 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] KVM: arm64: Advertise ID_AA64PFR2_EL1.GCIE
Date: Thu,  2 Apr 2026 14:37:45 +0100
Message-ID: <177513705965.454087.2424216826926153221.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401170017.369529-1-maz@kernel.org>
References: <20260401170017.369529-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, will@kernel.org, catalin.marinas@arm.com
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

On Wed, 01 Apr 2026 18:00:17 +0100, Marc Zyngier wrote:
> As we are missing ID_AA64PFR2_EL1.GCIE from the kernel feature set,
> userspace cannot write ID_AA64PFR2_EL1 with GCIE set, even if we are
> on a GICv5 host.
> 
> Add the required field description.
> 
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Advertise ID_AA64PFR2_EL1.GCIE
      commit: 899ff451fcee1289f3f37d061da66c3e38748a69

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9823C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 11:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdakBOwgLNxvtgS/tOXWq+SR3/ChyIlAZSqhqLttm0s=; b=lBs0d9NJ0hZofn5oXk7nh9Ww/Q
	bHNHHkGljdcLPlcW1gw+WXZMQUThU4UlPZGelqkdp08KduB46OZ1g41/2eLoS/ka1dJrmAQudx3HT
	W1j9QpUJu0V/2yYR1DHo83Pi5P7QoTKbczSvD8rxhN2v7rwW/g0kqPBdqtfgpBC4g2nCwaoqOQc1i
	Gv1x11SSgzDQDo2BaVgX1JdOcXnOr2UN7V2sDhPw48X37Z2WNIIlFi0cqrU3zletHRwHYuYHocBIK
	SwxPi62+yzlUzR7Ere/C86lxeAfTjkpTTpG733jPUarp/DLx0klmShyEouCu2hHLk6r8pDa5Zps8U
	pDD2rv1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiX4o-0000000Am7v-0Clb;
	Thu, 13 Feb 2025 11:08:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiX2q-0000000AliY-01XQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 11:06:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CDAEE5C54F5;
	Thu, 13 Feb 2025 11:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B965C4CED1;
	Thu, 13 Feb 2025 11:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739444771;
	bh=vzJhRKbm7doJ1xKI3GNgdwCsFtvU+/qRlVqY+hygGro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iglMK53LnkSTqT+T9DhbWoF5uTSfMXJn2hxzXp/YgtSTvr0LdqIwPizvDhy6HAKh9
	 kD4QhKGc7sg9RhDHCw2J90OO/0Gvfo5HeG1UamBIkMTco9LY5Hjw9AA+0qpk+viJ6N
	 kkxqQDXD9oOvoaEl4/YRQE6ybU84RCeMURXRd5zQHct/MPvDx+4ENyQxbLaDXmbOzG
	 vA3pfXJH69AR9nfnFjdsEXIt1GbQ7XFRGJ8q2ov9hTO9RezG8yVIGmONVh82qQSCX5
	 70RqrLiVz249B4lzJL+azphYwGKY0aad6RJQVnrZuTmOTZURde7m55fq4zyuC71vfx
	 GDHIz6L8J62Gg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tiX2m-003eD6-G0;
	Thu, 13 Feb 2025 11:06:08 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH] KVM: arm64: Convert timer offset VA when accessed in HYP code
Date: Thu, 13 Feb 2025 11:06:04 +0000
Message-Id: <173944474879.2872565.11761069838298587953.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250212173454.2864462-1-maz@kernel.org>
References: <20250212173454.2864462-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, lkft@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_030612_098899_B93DE7A8 
X-CRM114-Status: GOOD (  10.03  )
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

On Wed, 12 Feb 2025 17:34:54 +0000, Marc Zyngier wrote:
> Now that EL2 has gained some early timer emulation, it accesses
> the offsets pointed to by the timer structure, both of which
> live in the KVM structure.
> 
> Of course, these are *kernel* pointers, so the dereferencing
> of these pointers in non-kernel code must be itself be offset.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Convert timer offset VA when accessed in HYP code
      commit: 18ec0be672a4a27aa045cf692eeb1e180a202e0c

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




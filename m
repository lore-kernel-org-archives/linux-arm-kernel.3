Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAE3D4662F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 21:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzGz6BwOWx7DazoPXYC5YMyT9NKcxTFK0HMHwfRzbj4=; b=xftpRmJRqkYhZLwrmD4QgadKVf
	MkBQU308NV0TdJ12XWdJLX5d0J8HrUtZhUE+u9kmijwKJqX1IBFukL75X5KgC8x7tjYFZFHGCIS0I
	x4OAVSVcKbr261M48fXcga+BHj7Axbt/Z7bw2latIBx/DA9YRE+ASjtuuAU5pfWPilzt36JHN8NXv
	agusfoJ4HOgkmvBLXoki3qAohSj7VSo7/XZXKPWDy47xvM9D+F3pXgK/tI035oHOorELCtbwDsv1B
	wUkHKeWKLk1AIHOUsBlrwbiJL+aD92RqZ/ap9wtfe7opqV2QSBMaUCmAGNPPW/n9lioHISfIY0IUk
	lYYh3UEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgVJB-0000000DFCl-2Qzo;
	Thu, 15 Jan 2026 21:55:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgVJ8-0000000DFCB-1WCL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 21:55:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B519D401BF;
	Thu, 15 Jan 2026 21:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB0DC116D0;
	Thu, 15 Jan 2026 21:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768514109;
	bh=D5j/yqPjhph8B93YQzXdAs0lu1UQCpzf0y3U/X7Puxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Izp+lAFeDGzYiEIXcaJVMMZ2MANpVQ7niZwE348SvFy14TUsbCIcuavBwwnohgylw
	 E2UBXmR+52NuTOzxnvjtISkZNEQ8GP2J5lSAklL2ILgnV5lZvJb/W6iTA6OQro80+q
	 rRpWwlK87TgwYXTxtG1Y0yTfMKGzm0vuw78g2l0o7jQU/Ier8gqk8P/nK+xOS09H9Z
	 iPl2eK1iSP4KI4CziVSj3AeAlxzvE71vG4dxLoj5C/BH6eqWkgukVd7kbKCBldVZ4A
	 yzTlS2PJjTMPYeI4DFwetUIGgIwLmvBxpQIdlvIuIRncWJxDNbVE7JIdeUzdFilP1O
	 keTGesWNNOc8Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vgVJ5-00000002gXB-1FkR;
	Thu, 15 Jan 2026 21:55:07 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <tabba@google.com>
Cc: will@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	vladimir.murzin@arm.com,
	Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH v6 0/9] KVM: arm64: Fixes for guest CPU feature trapping and enabling
Date: Thu, 15 Jan 2026 21:55:04 +0000
Message-ID: <176851408508.3822586.5772710860545860120.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211104710.151771-1-tabba@google.com>
References: <20251211104710.151771-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, tabba@google.com, will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, vladimir.murzin@arm.com, oupton@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_135510_470870_94A45194 
X-CRM114-Status: GOOD (  13.55  )
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

On Thu, 11 Dec 2025 10:47:00 +0000, Fuad Tabba wrote:
> This series contains several fixes for guest feature trapping and
> enabling in pKVM, as well as a bit of tidying up.
> 
> Changes from v6 [1]:
> - Fixes to the patch that tracks KVM IOCTLs and their associated KVM
>   caps. Move static header data and function definitions to arm.c.
> - Introduce a capability KVM_CAP_ARM_BASIC instead of KVM_CAP_CORE,
>   since it is ARM-specific and that it only checks basic ARM ioctls.
> - Tidying up code and commit messages.
> - Based on Linux 6.18
> 
> [...]

Applied to next, thanks!

[1/9] KVM: arm64: Fix Trace Buffer trapping for protected VMs
      commit: 288eb55483c05bc37379a781d0d18b8e6c280f92
[2/9] KVM: arm64: Fix Trace Buffer trap polarity for protected VMs
      commit: e913c7ce9e6f62038a486218f43f699fc443e3e1
[3/9] KVM: arm64: Fix MTE flag initialization for protected VMs
      commit: ebbcaece84738f71b35f32339bdeb8776004e641
[4/9] KVM: arm64: Introduce helper to calculate fault IPA offset
      commit: c273feee70bd3d8c6c4d5efaf6b3ae945c839378
[5/9] KVM: arm64: Include VM type when checking VM capabilities in pKVM
      commit: 43a21a0f0c4ab7de755f2cee2ff4700f26fe0bba
[6/9] KVM: arm64: Do not allow KVM_CAP_ARM_MTE for any guest in pKVM
      commit: f4eee308c8f4013a52bd7d7735e64b5127c1b4a8
[7/9] KVM: arm64: Track KVM IOCTLs and their associated KVM caps
      commit: 8823485a697de5c280a7a2632620338722f16663
[8/9] KVM: arm64: Check whether a VM IOCTL is allowed in pKVM
      commit: b12b3b04f6ba072ca5a618a75e546c996be94bd1
[9/9] KVM: arm64: Prevent host from managing timer offsets for protected VMs
      commit: f7d05ee84a6a8d3775e0f0c3070d9380bed844a9

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




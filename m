Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68D0FE520D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 11:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egVT+QDdkQiiQNRrBYtGDqmfttNgZMRY5HnW/LjzH5A=; b=Usfn/yMfSbmhsbiYxrzRZE1qgr
	h5NdgEoLARj9LDNXn1KJkdDB+sW7JBo/sdKPaXeuxwhZ+A+pc2ULAuibA7ifSRfJIpk45m8ZFZvD0
	JWnY7gQ1Pf0cfxiXq4WXJ7FUvJSwjHM5sJACeEqonQw7Ft9ngXl9r8EmoaMRMPY44516s2tzGPQPS
	CXb/WU8/vJJqaMdkfux2cPJqnZYoV2j3HDukFfktIi/Zasy3P5EyHyNq3ROnAxik/kkIGDaXXaH1J
	wdps8U8SBswaYlp0JE0m50iP5mUKmehJ2yX7QOget2iEUKoV+sBZDG6cSoAbSbHC1wwrC6fByKsCH
	jjtcfNSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEOV-0000000D4Ot-1pFh;
	Fri, 24 Apr 2026 11:08:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEOM-0000000D4Jo-2f3N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 11:08:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CCDA6600CB;
	Fri, 24 Apr 2026 11:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2CFC19425;
	Fri, 24 Apr 2026 11:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777028893;
	bh=YaLluM6rUND3EobBeEa9RluHV3f7dAIkQabq9lunbyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C5fzRY4RUtalvaSmeursnsrscHga4MxnZpa8uz+NtpzessbAyqQiycUWPz6XUZ1yK
	 egZ9NMvUhMgEcerA9xUPPykYcodKrpX/tEB5COCmhCBEXWwLXFkBN8B9ZCaEn0LpvR
	 faeW/0SdiH0qUXSTqaAP68o62oSy+kO7816WsvWYZSzp0dkCKsv+x+CI0Ar4aWsMJZ
	 upiq/3D0kii0WWXKcAG0PrrSu5RZynggInKojVAmlAEyyzV7hJ4IRyDCD63E+vAXG2
	 g/TB5/0ZiG+pTQKgPw42/eIKtWq457rGhAB3jZfKbDZkB5Gg/JDEknfj6ikze2GgoS
	 UTwLKP/VklXEQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wGEOJ-0000000ELud-1lto;
	Fri, 24 Apr 2026 11:08:11 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	oupton@kernel.org,
	qperret@google.com,
	suzuki.poulose@arm.com,
	joey.gouly@arm.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH 0/6] KVM: arm64: pKVM init and feature detection fixes
Date: Fri, 24 Apr 2026 12:08:08 +0100
Message-ID: <177702878145.537738.9266420754166532663.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260424084908.370776-1-tabba@google.com>
References: <20260424084908.370776-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, tabba@google.com, catalin.marinas@arm.com, will@kernel.org, oupton@kernel.org, qperret@google.com, suzuki.poulose@arm.com, joey.gouly@arm.com, yuzenghui@huawei.com
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

On Fri, 24 Apr 2026 09:49:02 +0100, Fuad Tabba wrote:
> These six patches are standalone correctness fixes I'd like to land
> before posting a follow-up to Will's pKVM infrastructure series [1]
> that moves vCPU state management to EL2. Sending them separately keeps
> the bigger series focused, but they are all valid fixes to have
> regardless.
> 
> The first patch fixes feature detection for FEAT_Debugv8p9: it was
> checking the wrong field in ID_AA64DFR0_EL1, causing KVM to treat
> certain EL2 control bits as RES0 on hardware that implements the
> feature.
> 
> [...]

Applied to fixes, thanks!

[1/6] KVM: arm64: Fix FEAT_Debugv8p9 to check DebugVer, not PMUVer
      commit: 7fe2cd4e1a3ad230d8fcc00cc99c4bcce4412a75
[2/6] KVM: arm64: Fix typo in feature check comments
      commit: 2a623408112626d2625a6f00aed665861d59665c
[3/6] KVM: arm64: Fix FEAT_SPE_FnE to use PMSIDR_EL1.FnE, not PMSVer
      commit: 08d715338287a1affb4c7ad5733decef4558a5c8
[4/6] KVM: arm64: Fix kvm_vcpu_initialized() macro parameter
      commit: d89fdda7dd8a488f922e1175e6782f781ba8a23b
[5/6] KVM: arm64: Fix pin leak and publication ordering in __pkvm_init_vcpu()
      commit: 73b9c1e5da84cd69b1a86e374e450817cd051371
[6/6] KVM: arm64: Fix initialisation order in __pkvm_init_finalise()
      commit: 5bb0aed57ba944f8c201e4e82ec066e0187e0f85

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




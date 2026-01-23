Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FF0D7237B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 11:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Ov/gVI7ZoTdUgBGK+eQR5tqiIQxQuqjzrRsKWNDBeI=; b=Qc1BCWXwnzQ9W8iViMYJN9ofuc
	/ZSa+gGbCfpw/XDj3p9P0f2JqEqzLQAEBiiXwjNZWo4AVo2TQHK9ohtuHu55LlYmk8Mdz71k2Jm2T
	gsNdmZ/vByekCG4F1/Nb+Ha9Tz9gxgpQq0fvQA6MyX3LvQRz5wQTbdI0sQ+nkXCArj3oO2it9lHSi
	VoNTVU5xVeuVteoQHkncKE8mZIrUjHf38qDN6BcVhOVnQO/huBXNuTKAGB/H/FveNyePymIoKuWLR
	I04jxczet725trjE0BQ2vhWt7Jnnq3X7k4otacYYqk1UxX+kbeyWtmS42BtbiemQSCpqw9CdrdY4X
	Q4x9RUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFdd-00000008s8C-0By0;
	Fri, 23 Jan 2026 11:47:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFdb-00000008s83-01ix
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 11:47:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF4FC60010;
	Fri, 23 Jan 2026 11:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D688C4CEF1;
	Fri, 23 Jan 2026 11:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769168857;
	bh=eRuKxWOMlnjHgiZEV5213EEYlA17aFkixqemYW9Czf8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=up2JIwyVxC3fpUH9haWPzKn5c3nHzuEvg0aXouWmG5305K3PWCwUM1DbulLpicVy4
	 RC/OyEP0hvNthNs/jCasFbjn0QAORoSEagrQJe6Xj4y7PE8pkQlStcruO7DGuDKsU3
	 d8BhMFtX2CyFp0FkBPsduDVvgioCGgcmv/4rJxUAPKE81Hh8jD2VWcrNhjChP6Z+u+
	 tmq/qbSz3pFXKk0Np11A/MgqzlSNEXgqKoKwlEsSBj6o5U/m9CGwwYMUj9hWWoZzOI
	 TTEBfxM2T6aUkfeuummifXHb6a/hGNaSDLRdoEFwGd9xq4ongDsSOGDhXe/cNoBZAv
	 vAa/gmNJ9g5kQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vjFdX-000000052LF-0pOC;
	Fri, 23 Jan 2026 11:47:35 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <tabba@google.com>
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH v3 0/4] KVM: arm64: Enforce MTE disablement at EL2
Date: Fri, 23 Jan 2026 11:47:31 +0000
Message-ID: <176916883962.704159.2345456855633126333.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260122112218.531948-1-tabba@google.com>
References: <20260122112218.531948-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, tabba@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, oupton@kernel.org
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

On Thu, 22 Jan 2026 11:22:14 +0000, Fuad Tabba wrote:
> Changes since v2 [1]:
> - Trap accesses to GMID_EL1 by setting `HCR_EL2.TID5` when MTE is
>   disabled (Marc)
> - Dropped patch refactoring `enter_exception64()` in favor of open-coded
>   logic in `inject_undef64()` in patch 3/4 (Marc)
> - Based on Linux 6.19-rc6
> 
> [...]

Applied to next, thanks!

[1/4] KVM: arm64: Remove dead code resetting HCR_EL2 for pKVM
      commit: c103c2dfe4975da31b67a0fcb95761359f30992d
[2/4] KVM: arm64: Trap MTE access and discovery when MTE is disabled
      commit: f35abcbb8a084db4c24b66ccc8db0405c08e2f61
[3/4] KVM: arm64: Inject UNDEF when accessing MTE sysregs with MTE disabled
      commit: 5ee8ad69da07d0e2cffa0ce2f2339c9ad2d587f2
[4/4] KVM: arm64: Use kvm_has_mte() in pKVM trap initialization
      commit: 230b080623fec2e1302df2afe2cf2dcb34f9c89b

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




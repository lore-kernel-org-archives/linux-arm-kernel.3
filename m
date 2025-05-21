Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE9EC54E92
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 09:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGYWoiXLj7kVP6+nn/sldwQfSwMDUHep4uz4UhkXmfU=; b=eoOBHIlshopjQ1AEgGXFPwN6KU
	EXyO6F/PlxkjtE4oHNIWeh5oV+Y41/HuTX60EP3WTYi2/UWxcrT3M7tbAcHsii3mWM5l8QtJKZbGu
	9P++1Q6TiwPQQa3DCqtCfkbOExCv7FMpozVxNHq18zWugoTuT/YXh61ekdSP8gkdOtOAQ41NWKjrW
	+5bG22uSzXnAb2n8hw1CQiCHC12nRGBJ2zuV1SZa2EM8mK1fwngETwOLOkeTBE+Y6ftSWcjZJe4KD
	PsKcCR+1dO5mmJNcIuxjusDbo4AzWXyFxAwytzY0DNasDFDz2jUgwE8FOTxafdvN+3Bd4krRpYU+H
	xoNXTBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfaG-0000000FHQx-0Ve1;
	Wed, 21 May 2025 09:17:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfRS-0000000FGAh-0ZrZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 09:08:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 171AA449D2;
	Wed, 21 May 2025 09:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA87C4CEE4;
	Wed, 21 May 2025 09:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818529;
	bh=Q8ICU0HW7kHVJWjIv6+77XsYzfgUxCqB0oF7lY2UNWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vj/fm0Hu82tp28P2AwLohhiM6Cy6S2LVIJ3vloHt11uteg5LI6qt6mxud8ArjJzVy
	 gHTRele2W9LOj5Yf2AELLU7O3Oq3H4Sw6+/xcG0l8ckyzvnYlLRo5GLVakpv/GkqYy
	 +TizPivmuGtlPLEwc8VeMm9Y15WCzyylhlCVkSK600OVit+oAw191hS8ckg0VWJeWC
	 Cnq+ykSekqtfSt+XRGfkPWMzI5ekS4UAYhCWj9//P7R1FrxC+RtB4beTzrt2tLZ/gP
	 sKBQbyLU62zv7W8KmYsFYKj/QtRiMUHADq2EWVFnR2bwl/NRAfg3q0WDL+4EISWTPD
	 842g8YQLkwDJw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uHfRO-00Grjx-JP;
	Wed, 21 May 2025 10:08:46 +0100
From: Marc Zyngier <maz@kernel.org>
To: KVMARM <kvmarm@lists.linux.dev>,
	ARMLinux <linux-arm-kernel@lists.infradead.org>,
	Jing Zhang <jingzhangos@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v2] KVM: arm64: vgic-its: Add debugfs interface to expose ITS tables
Date: Wed, 21 May 2025 10:08:43 +0100
Message-Id: <174781851463.4059676.13869760892502643353.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250220224247.2017205-1-jingzhangos@google.com>
References: <20250220224247.2017205-1-jingzhangos@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, jingzhangos@google.com, oliver.upton@linux.dev, joey.gouly@arm.com, yuzenghui@huawei.com, suzuki.poulose@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_020850_202216_7FF6297C 
X-CRM114-Status: UNSURE (   9.73  )
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

On Thu, 20 Feb 2025 14:42:46 -0800, Jing Zhang wrote:
> This commit introduces a debugfs interface to display the contents of the
> VGIC Interrupt Translation Service (ITS) tables.
> 
> The ITS tables map Device/Event IDs to Interrupt IDs and target processors.
> Exposing this information through debugfs allows for easier inspection and
> debugging of the interrupt routing configuration.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: vgic-its: Add debugfs interface to expose ITS tables
      commit: 30deb51a677b96f0faf20373995fe0fb4a78b8b8

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




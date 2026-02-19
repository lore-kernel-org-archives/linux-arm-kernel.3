Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8CCC531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 19:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dkua8Jex2VD0ry1a86owwrle1uAB+dtqjYs6nOezSBE=; b=y+UAmBYYyUMN/wqHu2gXV6p+6P
	l48U6glZCwZfGcNQCsZclW/BoKVQu61FTOdoGnEcHPoov7NQOXlcOguYztXee9CDeIGNd20hKBZ5M
	p6neCF3ujBFQ6vxayA+pfm2zQNAQYRPqtfeQrdhdsEwdVTazwhUuvw60idM44CbFa6rghemDbPI8C
	x5VU0TvUX+fVfDJlEUFJa42vECBV7XPc32En0SVLRQ43fSF8UuaA4l6ARvueYAnNa5lvnLblT45lv
	Jr2J4nmLfXhylA8+k/LLGvZ1SjkzKFfNedPjCy10Rxv7JkCEhTsZSpZlntDk5ESZxfjoSOatKnf5K
	VIF7S9Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtA7r-0000000BtEh-0z0a;
	Thu, 19 Feb 2026 19:55:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtA7o-0000000BtBi-29xY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 19:55:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D943644474;
	Thu, 19 Feb 2026 19:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9D2C4CEF7;
	Thu, 19 Feb 2026 19:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771530947;
	bh=8YM89TR8ESlH9uXvQIG3bjZUMpzfvj2JghPjrLRps88=;
	h=From:To:Cc:Subject:Date:From;
	b=e6opB5RIIBRRUufZz+aXCx+Uv/ghybkibkMn9KTUq6OF9QaCypEs7PWpSM2MG73wC
	 T8qvl/cX8C40crQqzgI0TdnD2ZHsIfhvGw1cv5mQjpR+zxU80wuBJ2wh8qyPi2RpSb
	 kH7F/cCwZtOmmcoqioIk7cGxqMsxxRu0LBv7i3v+T7agq8K1HJSau2oCjWIC7CCASP
	 KiYDKB5SNGeWXuI49HVDLB3qoTU2ttdCZAA1vqpNoYV1/t1kRHkpL8ZaENuC79LMqm
	 jX/90eZgUNFuf1DC+bQc42GXhsQLBiuhes+vNBIijEmJSlPntlNV071x+FIT6N7Qb2
	 WiWds5c57Xfmw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vtA7l-0000000CGHL-12ja;
	Thu, 19 Feb 2026 19:55:45 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 0/9] arm64: Fully disable configured-out features
Date: Thu, 19 Feb 2026 19:55:23 +0000
Message-ID: <20260219195533.2455736-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_115548_598222_CA843F7B 
X-CRM114-Status: GOOD (  14.79  )
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

Fuad recently reported [1] that when support for FEAT_S1POE is
disabled, but that the HW supports it, the sanitised idreg still show
the value the HW expose, even if this is hidden from userspace. This
ended up advertising S1POE to guests, without the state being
correctly switched. Huhum.

We have a point-fix for this, but it would be good to address the
whole class of similar issues which affect PAuth, SVE, SME, GCS, MTE
and BTI, on top of S1POE. Not we currently leak state S1POE-style, but
we're just pretty lucky. Hence this.

This series tries to align the behaviour of a config option being not
selected with that of the corresponding runtime option (arm64.noFEAT),
with the exception of BTI (but I'm not married with that particular
aspect).

There is a lot more that could be done (Mark has a lot of ideas on
that front), but I wanted to get this out and get the discussion
going.

Another thing is that the proliferation of config options is getting
in the way of maintainability, and at some point, we'll have to pick
our battles. I appreciate that some embedded uses rely on "tinyfying"
the kernel, but maybe we should think of introducing something less
granular, and have KVM to select that (the argument being that if you
want the smallest possible kernel, you don't want anything virt).

Anyway, 'nuf ranting. Patches on top of 6.19.

[1] https://lore.kernel.org/all/20260213143815.1732675-2-tabba@google.com

Marc Zyngier (9):
  arm64: Add logic to fully remove features from sanitised id registers
  arm64: Convert CONFIG_ARM64_PTR_AUTH to FTR_CONFIG()
  arm64: Convert CONFIG_ARM64_SVE to FTR_CONFIG()
  arm64: Convert CONFIG_ARM64_SME to FTR_CONFIG()
  arm64: Convert CONFIG_ARM64_GCS to FTR_CONFIG()
  arm64: Convert CONFIG_ARM64_MTE to FTR_CONFIG()
  arm64: Convert CONFIG_ARM64_POE to FTR_CONFIG()
  arm64: Convert CONFIG_ARM64_BTI to FTR_CONFIG()
  arm64: Remove FTR_VISIBLE_IF_IS_ENABLED()

 arch/arm64/include/asm/cpufeature.h |  13 ++--
 arch/arm64/kernel/cpufeature.c      | 117 +++++++++++++++-------------
 2 files changed, 72 insertions(+), 58 deletions(-)

-- 
2.47.3



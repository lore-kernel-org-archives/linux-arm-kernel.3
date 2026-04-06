Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D16EF46C5A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 16:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hfKuixJ8pE1hcPIZ9H3UU1eYP61TJGKgmNCDwQTcXKI=; b=QUL19wipTIH5lYhA2C4r0kkEX2
	VbyE2787gjmkoIBaZxvycLhdlDFtfv8XJgUXqdtlwUAqKW1YX4cmCtjfYw2fED2WliIS/XdHw/CIJ
	5v9OvngIanNPahfBJn+67TYrW0BiIACxYkjjxuHAaz/tfwgQqkQxNVR3+5ph7CwDYfMSbzKrT128o
	0SRJerOgTmcpyBbTpou2gT0AkPCXb7GGVvbw1ib+EnFBmqeppX0aw2ay9gESqecwAdMW7119NX0Kz
	VzfWQW4nMTL388HzT3WDaAQ8FmQWzVRvhw1fvaZ8CHRi3gbga3lzpVq1vX6/H/jjRYtT0g60XHsZH
	IsuyaZIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9n6i-00000005Kfu-3I19;
	Mon, 06 Apr 2026 16:47:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9n6g-00000005KfT-18N5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 16:47:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A93516F3;
	Mon,  6 Apr 2026 09:47:13 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3732F3F7D8;
	Mon,  6 Apr 2026 09:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775494038; bh=ozT5c4q3To0rGt3iOF4BIad4dP2hdLkN0+ux1is1UlI=;
	h=From:To:Cc:Subject:Date:From;
	b=eHDD8BPx6jnFrGRUoEKXnmPzzp8oBJR9NFw+CMewBNOJYyy0Jnp7iXSo5Ghcxr205
	 QLWUfDgSfw4f60J8NH+vVU9uKcX6s5b5neakHoJcGxHFkVKLu+tcFfPg/3O2PYIbdz
	 HfFmOz25tou5tHulTS2Qb+pVpMrNksejuNbZXSO4=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH 0/2] KVM: arm64: Handle unsupported guest translation granules
Date: Mon,  6 Apr 2026 17:46:16 +0100
Message-ID: <20260406164618.3312473-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_094722_430647_FB932B67 
X-CRM114-Status: UNSURE (   8.77  )
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

Hi,

This small series fixes the granule size selection for software stage-1
and stage-2 walks. Previously we treat the guest's TCR/VTCR.TGx as-is
and use the encoded granule size for the walks. However this is
incorrect if the granule sizes are not advertised in the guest's
ID_AA64MMFR0_EL1.TGRAN*. The architecture specifies that when an
unsupported size is programed in TGx, it must be treated as an
implemented size. Fix this by choosing an available one while
prioritizing PAGE_SIZE.

The first patch is a refactor to prepare for the fix, and the fix is
implemented in the second patch. I lightly tested for regressions by
booting up nested guests of each page size.

Thanks!

Wei-Lin Chang (2):
  KVM: arm64: Factor out TG0/1 decoding of VTCR and TCR
  KVM: arm64: Fallback to a supported value for unsupported guest TGx

 arch/arm64/kvm/at.c     | 121 +++++++++++++++++++++++++--------
 arch/arm64/kvm/nested.c | 145 ++++++++++++++++++++++++++++------------
 2 files changed, 194 insertions(+), 72 deletions(-)

-- 
2.43.0



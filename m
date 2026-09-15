Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03592C982C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 22:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kecQaR0F7g0/H9mop9k/ZA1PCRux2SHgqjXnuf3tgU=; b=OzgvbTUED7fZ5d9YUBCebdd2dm
	VbQrNcpat8/8TceRjgxp+1jIgwGJk0fGn1hVsUvUhKNIfOImIHdHR0F80WPUk9n8vKKeW3/R1mdwF
	Z43JUuJRw4YM8m4j79o1IXZQx7XtATPL88M2g7+L0W1KLX6pexmGPDx3eDyrqkRsWjwivz5/r8URL
	JefH+iEiM5dQNVq8uiTorg1NZHzEkQhdBK7VaMAMjlZoFbjLbmTdkuLvIqW4gsmqVWl1zDI/Qj+Hm
	TB2/PALSyBoKVt/dgRh+o1xtFYFtJLK6B9Xds0Mrm9nHxYBMrHUXk181PnQOdUaPGpZxIKTNyTljH
	727vs48A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bb0-000000080J2-3GZ7;
	Tue, 15 Sep 2026 22:25:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bb0-000000080Iv-0Aie
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 22:25:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 76A3F406CC;
	Tue, 15 Sep 2026 22:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC881F000FF;
	Tue, 15 Sep 2026 22:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789511145;
	bh=2kecQaR0F7g0/H9mop9k/ZA1PCRux2SHgqjXnuf3tgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i5IXNL+fVFTtOFiiRyVTkNuytpziNyfhPeJrdEo9rSE5W+iLdKiE3IJQYf+PtFR2x
	 wTtpo6KRfyPuBDuWwyIB7v1BQAfmCl05JRLSWdlBCiZaDhMw3UucXQudZ3qG3tvEHW
	 rbPFfmhXJf2YcVEeeN/pggWtlHx9N64OBke0aa+ueA0xGpd5MP/L8Z8VME3U24tApq
	 TmPswHCzQD0LWELmWVs6W+hyy9+dKlpg08xPNt8/a4EorHlXr4r1aTMKNKrhKWVuPr
	 2+BB4KwfZNPp+HgbCIq/92kvRyWg/hMn3yeb7u0Ck3LVPGzLWjmyjUSggfDR4Eu3k2
	 z6n1C3Y21E0pQ==
From: Oliver Upton <oupton@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leonardo Bras <leo.bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v20 02/14] KVM: arm64: Fix FGT mapping for HFGITR_EL2.nGCSEPP
Date: Tue, 15 Sep 2026 15:25:32 -0700
Message-ID: <178951103683.10790.7238421458148276106.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901-arm64-gcs-v20-2-f31750bdfadb@kernel.org>
References: <20260901-arm64-gcs-v20-2-f31750bdfadb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 01 Sep 2026 22:47:00 +0100, Mark Brown wrote:
> The encoding to trap mapping currently maps a FGT on OP_GCSPOPX to
> HFGITR_EL2.nGCSEPP but as per DDI0601 2026-06 this FGT controls trapping
> of GCSPUSHX and GCSPOPCX, and not the separate GCSPOPX instruction.
> Update the mapping to reflect the architecture.
> 
> 

Applied to fixes, thanks!

[02/14] KVM: arm64: Fix FGT mapping for HFGITR_EL2.nGCSEPP
        https://git.kernel.org/kvmarm/kvmarm/c/089e4f3c4862

--
Best,
Oliver


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884CEC02185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 15:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEp8jki4j8wHtGA8HPSUEfjDaPRr4uGDISU4CCWP3sw=; b=uvv7pFLEHY7L4Hip3oufzvvjDt
	cUwioyDTn5fKlRFVSZ2K/kgg76y0rirVN5cMeq762r0SXiaIZMgZHNkkS5HOikaPv2R0/DDnc9l82
	GcXDvvDOjSupY84cRuXOOLNR2RH5yeWJZ0NP8br0eHLH2/vOFebdQlQlZF3lpPDXDYmEj6TdkOVtc
	j/viD/IRBzfVIgs7ZmMBBSgRE1QomxJs0fNbR3G+PXlaSxVaK+qClN1mZt4C9tvwjntZtjXPqORwQ
	XhyoqUDZYsYjOeqdkhasmz71lhbhnog72I1N6CkYufgVx/WtmU7OWNhuo2cQWfpSHfycouzX+5/T/
	l0Nx70dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXiYG-00000008o9M-2j86;
	Tue, 14 Jan 2025 15:09:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXiWB-00000008nfd-16XU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 15:07:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC4415C57DA;
	Tue, 14 Jan 2025 15:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA55C4CEDD;
	Tue, 14 Jan 2025 15:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736867266;
	bh=OJUsxyrxfC11aQT26TYfZHa68Gx/au1vC79F/kqbr4M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eXnV/r9WUSVIa5mpEYC0Ii8R3z9An4EuL+3t/H4jmYLyWT22LC5ojAMXfN78yI1Tu
	 x5UdwirEFdkPqZvVZ5lqPQZ1lI8PXoy8bPZ5naoykYIipP5dukhr7tgyd3Cmijq69h
	 Kpj+EkMfGf6KaoQQ3cPKsKH+jBrPpLNLxF2G+JmOVDoQJGFt2bBf567jKsYrYe0vc/
	 OoPsY/aP0peoscsY0qQYFLawglUFGOPRykmnbi1b41xOpUQ1SV1dQqGSfjU+3ghIYV
	 yUK12JaDPxn9FKYuhtiMngf0Vut3qPUFK9Udcn6gX2FiqfSI2hvHYvUKjasYe2Dzxr
	 Ahy2BIcFVMfiw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tXiW8-00CApI-4F;
	Tue, 14 Jan 2025 15:07:44 +0000
From: Marc Zyngier <maz@kernel.org>
To: catalin.marinas@arm.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH] KVM: arm64: Fix the upper limit of the walker range
Date: Tue, 14 Jan 2025 15:07:40 +0000
Message-Id: <173686725256.1564007.10057410083015197983.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250114145050.563658-2-sebastianene@google.com>
References: <20250114145050.563658-2-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com, will@kernel.org, yuzenghui@huawei.com, sebastianene@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_070747_343230_9A3B06C1 
X-CRM114-Status: UNSURE (   7.60  )
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

On Tue, 14 Jan 2025 14:50:51 +0000, Sebastian Ene wrote:
> Prevent the walker from running into weeds when walking an
> entire address range.
> 
> 

Applied to next, thanks!

[1/1] KVM: arm64: Fix the upper limit of the walker range
      commit: bc9e4ec6e98838314c07575a5fbc06755d21913c

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




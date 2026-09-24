Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB0DC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 20:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrQRBYeuaf7bM5VgfiKLi/L2mfGazHWpQ69tMlYoN8c=; b=dx12r3jr+lVK3utW6Hm82s95yw
	1lAzecGWrxfdUhyD92IgzXAh2XiwsZnZtI3/nUlukFdJgHa6l89knHX74ft9tW5l+1kIVtKLBNEXS
	oxZHZP6AEpjFeOfAUPvryLs9kOxuqNwWdAZD3Hdq/Q974c+Dgz5KgJMxl/PD0b6SfZvSrZqbje2UW
	6qc+KceVs/pK5Jf+V67DJhh1cpboE5xgef1OlQmd5D7mKOg1bcKudMRDwFgHH959dJe4gjTFjp14s
	nCvJQwbOZKjbdgW5S78Ozh8Ur1AGW9fNA7nZtU2EEm0vdw6AKaw6fPvK/kFHZ2K9fLUt8vb+OWLMl
	1/L1aZXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qGL-0000000C9fa-2llt;
	Thu, 24 Sep 2026 20:41:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qGH-0000000C9ef-2qZu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 20:41:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E69240723;
	Thu, 24 Sep 2026 20:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F249C1F000FF;
	Thu, 24 Sep 2026 20:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790282505;
	bh=LrQRBYeuaf7bM5VgfiKLi/L2mfGazHWpQ69tMlYoN8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XWp0aJkEH9tKAO+pH5S1/zfH7gUvwStJwvtV3eRAkj6wI5UsEohSwMiuEehdHIU7e
	 hza7memeIIMWugFEhpgTWbYc6Ycre+zXLAirP3GQlWMHTbhhpkNoF2qOBxO+Kc0UiN
	 Nluq96Ic0Gt6CNZJlTDd+MGPWZX3G1UWnaIXSZ+kTr2ruNRVZGBFODwBv4sPNrhrns
	 yMMxGm9X3CsdxgcNKt8c2Mu0OuAaQzCjE5/e5v1q5JbQXOEFDWqpGidSZjEfYbTsME
	 nh+4ktuWxdLzEmsFDHjde37kE9e9Abn21BXyEXlmGq7qlPVK9lt7ZiCYyETVsi8wsT
	 HuwaoSduxe0VQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x9qGF-0000000DDHY-0WZd;
	Thu, 24 Sep 2026 20:41:43 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wei-Lin Chang <weilin.chang@arm.com>
Cc: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>
Subject: Re: [PATCH v4 0/2] KVM: arm64: ptdump: Shadow ptdump fixes
Date: Thu, 24 Sep 2026 21:41:38 +0100
Message-ID: <179028246123.3395858.14855686686610426217.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924094951.727352-1-weilin.chang@arm.com>
References: <20260924094951.727352-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, weilin.chang@arm.com, oupton@kernel.org, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, sebastianene@google.com, vdonnefort@google.com, itaru.kitayama@fujitsu.com
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

On Thu, 24 Sep 2026 10:49:49 +0100, Wei-Lin Chang wrote:
> This is v4 of fixing the sleep-in-atomic problem of the shadow ptdump.
> This version relaxes a few write_lock to read_lock, and collected tags.
> Please see the details below.
> 
> * Changes from v3 [1]:
> 
>   - Take read_lock instead of write_lock when getting pgt metadata.
>     (Vincent)
> 
> [...]

Applied to next, thanks!

[1/2] KVM: arm64: ptdump: Check the page tables aren't freed when accessing
      commit: 7d7199bdf77a3a6ed74d0037133f435a7febe97c
[2/2] KVM: arm64: ptdump: Fix shadow ptdump sleep-in-atomic-context problem
      commit: b1cc219eb21ab5f31fe4caa32be8057159e42db5

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




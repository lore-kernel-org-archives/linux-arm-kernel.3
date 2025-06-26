Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931EFC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 12:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oj1ogpLI/Kow9sD+HJdPd/qVHGxvfQBRf3dlyqj8HPE=; b=JQwHxitWz8p4pBh1aGQpkLPEBq
	J37DNHQtj3nr6SA+aTpbicaGIluU5e8X7AWWc4stnjJKceg/KQNp2TNuR+e/xoZsrDbnDJSbk+Twn
	UOrXSSL29bVnJt64pYMDFNjOfTv0ZFihOvj9+z5i9mNVYbZBAEYFbaLEY7ZuRO6cU/wILxvOc3kep
	A4UKU40G53lWBxfwlN35gRRYdoiTBomq7Mop99XS3Y3OPtgXWKYx13wj3+tOjOtYi9SgDDdNNlBoV
	CkngGJJSllJJFt4py8Me5OkUOGOD9MY+6aAYCPpXq4JTKsLoEswsEgGH+y7HfBE6/jPIhIFCf1edT
	0T45nP2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUloD-0000000BYEE-1jB2;
	Thu, 26 Jun 2025 12:34:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUklH-0000000BQ3O-2sZp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 11:27:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 63F7D44929;
	Thu, 26 Jun 2025 11:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F16C4CEEB;
	Thu, 26 Jun 2025 11:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750937243;
	bh=JrCZb5QzxTxFZWoptOSoxzU+/er8vrbB5+3VYfpq9jE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eqqmHNTY6Kc6gv7fACQSPLTkpDgmsstq6TMOQ1t6N5Xp1upAeehfgvM1xXT0W5K/q
	 Uw3W+2FxOPUw5opFX0DwFvtFRXI0CdxjgVeEYayTlCQ6RNFjckTpt69FNHR59BIFst
	 bkoYRG6MbhqyQUYdgxks38saeDpcIYHx5k2n7SloKzYTvX8eJMjjoTqeua7ZdKc2JY
	 hkmTFqGDGXdlsHZYtd1Y8cjgLq2MPclYIbK/25gT74IDLKEo3jsI/BUyQKG9s3EBP4
	 PueHM1dXhMHP16yg/fwT2NX5WlWuddZi18SDEiR913mMeoeWlb3HkTFGdXGyW6gZNj
	 +SqjIEj1fX6zw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uUklF-00ACj9-9j;
	Thu, 26 Jun 2025 12:27:21 +0100
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Cc: Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Don't free hyp pages with pKVM on GICv2
Date: Thu, 26 Jun 2025 12:27:18 +0100
Message-Id: <175093722839.181610.1798670653973681500.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250626101014.1519345-1-qperret@google.com>
References: <20250626101014.1519345-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, qperret@google.com, smostafa@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_042723_752663_954F0127 
X-CRM114-Status: GOOD (  12.95  )
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

On Thu, 26 Jun 2025 10:10:14 +0000, Quentin Perret wrote:
> Marc reported that enabling protected mode on a device with GICv2
> doesn't fail gracefully as one would expect, and leads to a host
> kernel crash.
> 
> As it turns out, the first half of pKVM init happens before the vgic
> probe, and so by the time we find out we have a GICv2 we're already
> committed to keeping the pKVM vectors installed at EL2 -- pKVM rejects
> stub HVCs for obvious security reasons. However, the error path on KVM
> init leads to teardown_hyp_mode() which unconditionally frees hypervisor
> allocations (including the EL2 stacks and per-cpu pages) under the
> assumption that a previous cpu_hyp_uninit() execution has reset the
> vectors back to the stubs, which is false with pKVM.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Don't free hyp pages with pKVM on GICv2
      commit: 0e02219f9cf4f0c0aa3dbf3c820e6612bf3f0c8c

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




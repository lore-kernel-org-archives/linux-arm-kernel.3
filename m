Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0931CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 16:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIj4Ja/le7uxWgLNtxsZu/Pocr/mLGyFmmWZeF4QO6c=; b=ZIZx5Wn+UaQOhR83ltlmBlAEOO
	PF/mQom1EHX/lEiCHnbSZP8yBmAyKCcS4SgsiYwwocs2B7wTMybGTtUQ/O7T9YwwLDEk1IXU4Cfgi
	cGT/vVTm8BrNB+pgt13ICvfxkE0AX9xymVLkn/SWPDEYrEfnXaMVZQrbmfaVWg0oKIBXxSLNN+uyO
	OZVWrNfr4R5hNANtJtXIwlMpCNI12Cg8MYDg7rHteP9NO39fE4rCnrM+Oh4E1iwkIlmy0jEVq2Jxv
	cjqMvgp9EBRhLDf1VAFiokBzEbIp5h3d3E1ByGDkt8o3rjqYgNFF6ruI9rxumrlR+yxtx0T6gJN9d
	VMEp5avg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVRE-00000004S7e-04Jd;
	Thu, 30 Oct 2025 16:23:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVR3-00000004S3W-3pBM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 16:23:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9284443D2C;
	Thu, 30 Oct 2025 16:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE4BC4CEF8;
	Thu, 30 Oct 2025 16:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761841417;
	bh=alt5OGhl+CQnMwRUmeuBmHbbimh+37LwESCV4sQBqV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c6i53vHPU6YAiIfBIJHAbKGm5eV3IT31HgygOC07aK+xSLrjgGhopj/kxTUYGPKuW
	 w6kr6TJFuU5C0/y5EfFxbA4ad9tzCAVeh4M58wV+u6R51gd8ZC39XZVArf1ChqOJKL
	 W2/wp79V/fnWzm2XhltjAsYGiF1FomPDNufQbSXIvJmA7oU/rWg/gpKAnGxpIfGEKl
	 I38Sg3k/fJfUT00C16U+o0LgXscry/nkiV1CerDUWVe4MxHE8bBXl9XmEcLdoYDXIq
	 TlSYpOtnYCZaLCreYP2jt/1mR2cBroVVPJHjHdodgzBuxcC3e//3X6ByWZuipbjBpN
	 Uku1jD3HJBbSg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vEVR1-000000013AW-1ccB;
	Thu, 30 Oct 2025 16:23:35 +0000
From: Marc Zyngier <maz@kernel.org>
To: oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	Vincent Donnefort <vdonnefort@google.com>
Cc: qperret@google.com,
	sebastianene@google.com,
	keirf@google.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v3] KVM: arm64: Check range args for pKVM mem transitions
Date: Thu, 30 Oct 2025 16:23:32 +0000
Message-ID: <176184141215.2037781.15285129673531696378.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251016164541.3771235-1-vdonnefort@google.com>
References: <20251016164541.3771235-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, qperret@google.com, sebastianene@google.com, keirf@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_092337_978781_9DDD1502 
X-CRM114-Status: GOOD (  11.01  )
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

On Thu, 16 Oct 2025 17:45:41 +0100, Vincent Donnefort wrote:
> There's currently no verification for host issued ranges in most of the
> pKVM memory transitions. The end boundary might therefore be subject to
> overflow and later checks could be evaded.
> 
> Close this loophole with an additional pfn_range_is_valid() check on a
> per public function basis. Once this check has passed, it is safe to
> convert pfn and nr_pages into a phys_addr_t and a size.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Check range args for pKVM mem transitions
      commit: f71f7afd0a0cd3f044cd2f8aba71a1a7229df762

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.




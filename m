Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F60C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 17:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFlxPVKu8edhypl0s/KlN/O5P5oTuLNnhkhJh97nsK8=; b=1WvCXiJ8RMB11DAvtwSmRAGrU+
	crhcNdVWR8XVyXCQ/GKOnT8y2IJ2jGZEO3yEE8nKdRE0u1NuGMtPHrPRO0Makg8JWSAYMWl5gbY/j
	7OjmkFn8FusOyTxhMI1TEWR20cZiTQWSxa2xleA3pV6dWlbouTf3qr6uhBsQDinp2pbHPyAFLgJXo
	Sh9sxFza8F4k3kRdo5zcGwQJUAz3+QY36Jjw7VE8nTZXWggUm5nkScq5l8M3TaVLdP5tZs34g6IsY
	4cvWxjkm4PpzgZTHVFxnkZgCEZ8izinJRtH9yNfKqD3Dra+Hs+Up5xUyI2aUD/m8BzPWGbgFKHYLW
	UlygrV3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwk0Z-0000000AHAo-03TX;
	Wed, 19 Aug 2026 17:23:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwk0U-0000000AHAC-1DrT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 17:23:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3DC214BF;
	Wed, 19 Aug 2026 10:23:12 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D6B73F763;
	Wed, 19 Aug 2026 10:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787160196; bh=oaf5ktsrI6b7DKdGMDPNdLd7SsRg66KYC+01Ywlnnos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nBbiCvgujcMEfiB74c+ETm4tYN1UcQpl+DV/3s58aUlFmNnnHvioZ+4rjOtaiNuEV
	 eqEguOQk16IM0R0AhdplVdzif0tqYH+T5Qs1/Q7yTMpPZkfK7eec18dYok/keDguYx
	 QNPqBgne1B7ITaezBJ5STN0UVwamjKNii54Aqe/U=
From: Leonardo Bras <leo.bras@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 04/14] KVM: arm64: Ensure GCS memory effects are visible
Date: Wed, 19 Aug 2026 18:23:11 +0100
Message-ID: <aoXmfz5pPwRYRKTO@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812-arm64-gcs-v19-4-9105afd828ac@kernel.org>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org> <20260812-arm64-gcs-v19-4-9105afd828ac@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_102320_118801_5BFD5EE5 
X-CRM114-Status: GOOD (  12.42  )
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

On Wed, Aug 12, 2026 at 08:12:03PM +0100, Mark Brown wrote:
> In order to allow efficient implementation of GCS implementations are
> permitted to do GCS specific caching, with barriers implicit in stack
> switch operations

(GCSSS2)

> and GCSB DSYNC as an explicit barrier.  Since we do
> not use GCS in the hypervisor or host kernel the hypervisor cannot rely
> on any barriers being present in vCPU context switches other than those
> it explicitly inserts.  Add explicit barriers when loading and saving
> vCPU state.
> 

The same way we have a DSB, having a GCSB here seems required, as there may 
be pending GCS writes. Makes sense.

Question:
You state that we do _not_ use GCS in the hypervisor, nor in the host.
I understand that we GCSB() when we exit the vcpu context, but why would we 
need to GCSB() before getting back in?

If cpus will GCSB() on guest_exit, and host/hyp does not use GCS, there 
should be no GCS pending operation at the entry point.

Am I missing something?

Thanks!
Leo


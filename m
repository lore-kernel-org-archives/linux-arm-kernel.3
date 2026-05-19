Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187E2CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7aAmXBe2juvIv144FcT2fD+1TkvLcZB+vTCMLFQ6uc=; b=UMrhrE/YCucVZIyndmVMWtng9a
	83P2fqnQkpdR1ywDiUKPuAKRktD9gUifmyD7eG/99EZk0uXR3iECQ0oGkJBvqNDjNH8w3Rx7L1YBr
	g73hIKsmqZzKaxr1p2FG3S8CkRyaKMNfGKcGaWwctk+nQu34vOo0KrZtvHCwQ/MlHQtqMTH8hi3u9
	wfnn3vsat164yntyi46+fNQMGoSrSlIwhQ09igzt9jHeS869a/cAXcp5CQRfe0bqLSHbI5DtxSkmT
	JBfYTTZSFjcPehSQrVFz8nRCPnsekimYtFuq+y53ryTEQ1No7e6cKO+3Em4pQJ1Q9t4RZq9YHtpT0
	K83ffK3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMJX-000000021gZ-1bhF;
	Tue, 19 May 2026 15:24:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMJ9-000000021Lx-0nKv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:24:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB731403EA;
	Tue, 19 May 2026 15:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C400C2BCB8;
	Tue, 19 May 2026 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204274;
	bh=nd/SFqFEnjKhIh8jdIA2Y3hV+o5FYf2nfi5Ar2FriVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SZU/9Nk1isibwbe/goA8rb23RTRh+TDHdGVHiJweVgoFLIlaLyRzOrwS1BowvouWW
	 XenrcwvtqzcvxlAqhITZdQf9hYUeMs+gI2MdgR92uUqwQP2LBIU7SPyp6qGx6gbBOP
	 qxVOY1l0Hhwe8JHeBzuxD0evaj0x7W+y+oLW5c93HbazWiqi0GAG4wuiOMzW6R2yeg
	 XIaC4t8teRvWrIo4Xqyc3S70Nmw+ZV4CAGKYlxRrWTX3qixRRusoMKSBvtbM/0FjOK
	 HSgKDcNXau/2MnWzfrD69KOkQ2gsuE0586E8+C/3t8eS87g67RVVwLnhTwzTobrB2m
	 fWdtpV9EPdYoQ==
From: Will Deacon <will@kernel.org>
To: maz@kernel.org,
	oupton@kernel.org,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	pbonzini@redhat.com,
	Tian Zheng <zhengtian10@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	liuyonglong@huawei.com,
	yezhenyu2@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	suzuki.poulose@arm.com,
	leo.bras@arm.com,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 0/5] Support the FEAT_HDBSS introduced in Armv9.5
Date: Tue, 19 May 2026 16:23:12 +0100
Message-ID: <177918656142.736362.17906576792384645789.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225040421.2683931-1-zhengtian10@huawei.com>
References: <20260225040421.2683931-1-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_082435_262898_4B1B7C72 
X-CRM114-Status: UNSURE (   9.97  )
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

On Wed, 25 Feb 2026 12:04:16 +0800, Tian Zheng wrote:
> This series of patches add support to the Hardware Dirty state tracking
> Structure(HDBSS) feature, which is introduced by the ARM architecture
> in the DDI0601(ID121123) version.
> 
> The HDBSS feature is an extension to the architecture that enhances
> tracking translation table descriptors' dirty state, identified as
> FEAT_HDBSS. This feature utilizes hardware assistance to achieve dirty
> page tracking, aiming to significantly reduce the overhead of scanning
> for dirty pages.
> 
> [...]

Applied sysreg definitions to arm64 (for-next/sysregs), thanks!

[1/5] arm64/sysreg: Add HDBSS related register information
      https://git.kernel.org/arm64/c/72f7be0c2e30

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


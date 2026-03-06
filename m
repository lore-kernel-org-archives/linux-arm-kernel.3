Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34D3F01832
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7n5yY5pU3CPsnVouPtZWaX0fIz8PvgTxRiK/HIr3g24=; b=F8NhdOJWAeSHcLoQR8pqndnRGI
	gjvh16bifs3iKvPBzq8PZGkuVymIqAAE8DD5fQhXrncDnpQ7L1DZvmkm1O6OJG3mNHEk+YtA6IgEa
	tprw1Oux0QSCvV3xp9+fc/oVr9+BJi/cnp3kdZGwpdlrgfVSup5VA2B4TKZO4QzhBd06t5FlHH8ZS
	VgEMh5ccv0McpUEpxgTsBd1stZ9r+Q/uS+YyKo7bStlJb2abRjUNSPmdAgm+VbglDCG5JwlMif1Zl
	Zvkk2jjAskSJK/vwaK62fJhrRFAes04XkTQPFXrr7CcFNekP7iYidH7xKz12+qbt4/nl2JiOVEG6T
	uzfPUG0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUGq-00000003dyQ-413e;
	Fri, 06 Mar 2026 12:27:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUGo-00000003dxS-3knc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:27:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9883D437E2;
	Fri,  6 Mar 2026 12:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0800C4CEF7;
	Fri,  6 Mar 2026 12:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772800026;
	bh=gS1ab7LC2PFHxO9DKZFP0ByelNln6nGVZgZNHhOBINk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ftrxRDSTIbFHbdDTju4HkI8Ujof+Thf84cV60zyLlRsFrN2y6MwGrOFosNfxNND21
	 j0Qsq2ywG9IixB5RZIDRnDUd8SaVbmfc/HfS0pMSuEj8xL9Bfq4a6AT819dv7aBj0g
	 yzCT+Dd4GVdpjtYugsyK7cYrSs3Cw3hW5+c252wBMTAlr85SlZ8l4cAXx6Z8/Uf8vx
	 tTpzCEegy/Aq5qJ3fzisM2CoEUlcGaYafP1kD6b5zPPzk8iRbmzVh54qg9s4RWHIcR
	 R2nv4kh9jIKbZfchjSPeOvbzMeF+X3HE8szBVwINj4F9REGhWFHtoPGg0LFrdT0Y1q
	 nNxJ3jG1mVlZw==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	shuah@kernel.org,
	broonie@kernel.org,
	yeoreum.yun@arm.com,
	jonathan.cameron@huawei.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linuxarm@huawei.com,
	Yifan Wu <wuyifan50@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	xiaqinxin@huawei.com,
	prime.zeng@hisilicon.com,
	wangyushan12@huawei.com,
	xuwei5@huawei.com,
	fanghao11@huawei.com,
	wangzhou1@hisilicon.com
Subject: Re: [PATCH v2 0/2] selftests/arm64: Fix sve2p1_sigill() and add cmpbr_sigill() for hwcap test
Date: Fri,  6 Mar 2026 12:26:53 +0000
Message-ID: <177279809096.1376203.6124931515335372340.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305013638.992301-1-wuyifan50@huawei.com>
References: <20260305013638.992301-1-wuyifan50@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_042707_280376_7EAD3B27 
X-CRM114-Status: UNSURE (   9.67  )
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

On Thu, 05 Mar 2026 09:36:36 +0800, Yifan Wu wrote:
> This patch series fixes and adds two selftests in the arm64 hwcap
> test suite.
> 
> Patch 1/2 fixes the sve2p1_sigill() test to correctly detect the
> FEAT_SVE2p1 feature. Previously, the test incorrectly assumed that
> the presence of FEAT_SVE2.1 implied support for the BFADD
> instruction, which actually depends on the FEAT_SVE_B16B16 feature.
> The test is updated to use the LD1Q instruction, which is
> unambiguously implied by FEAT_SVE2p1.
> 
> [...]

Applied first patch to arm64 (for-next/fixes), thanks!

[1/2] selftest/arm64: Fix sve2p1_sigill() to hwcap test
      https://git.kernel.org/arm64/c/d87c828daa7e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


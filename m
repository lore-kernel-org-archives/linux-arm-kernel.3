Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A8A10ED674
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 12:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVUtDizmLpW3mFGd36vOa883uDiZOgcIlkjW0hLctVI=; b=lhHLWcL+oqULYEYd1B1WqEVSwt
	Y3Hneyf3OKnmrUEKAn9WDUKVmEaPvdmckTXCp7MKg1hV98rf/Uv5Chr95FXx9plhJ/UkZxg7VoYEh
	uFKwGW9mu/FpAAOlUcYVtErY7lTSBQ8tLJZS/b0Sx+CKUYIOeIeKjeEQzWpcgknXJY+KIBEu/VgjR
	UU74MtHLYt4Kw7ic3fRHp4ywl8TQw0yWVpF7Us7rgAqsV7SYCNTL5JXW9BO0RSfMyvdyL/KfzFEon
	PqrDq9vfluCSzI4mRg+T09TGSdRcUt908Nnby3yr6Hzv639oM8VGbMPqkBYM7G3/tVVYxtxg3n/sb
	lDA/7bQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66lZ-00000007NYw-1wkR;
	Fri, 27 Mar 2026 12:58:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66lV-00000007NYL-4BFS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 12:58:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8112435A1;
	Fri, 27 Mar 2026 05:58:10 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D8823F905;
	Fri, 27 Mar 2026 05:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774616296; bh=gPTmS0afsT8ENArRIOKhHMimqu3xPU+TxcEcMUHpONM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzNYBFzlck/W50fnQQFSuSq4CCG9YvlRkreuJcFYuY6iRPte2YEMwx8gFqAUfG1fY
	 DVIDs4rrRxRZVsS8mr0dSs5qz0FNyqelbZD3Vaokye9VJyvjP6OEH9Yuzq7TV2jgpB
	 kIRXyCrOqkjK+ZthOSSK66WmWCruCVBw8zauC/aM=
Date: Fri, 27 Mar 2026 12:58:11 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org, shuah@kernel.org, broonie@kernel.org,
	yeoreum.yun@arm.com, jonathan.cameron@huawei.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linuxarm@huawei.com,
	Yifan Wu <wuyifan50@huawei.com>
Cc: xiaqinxin@huawei.com, prime.zeng@hisilicon.com, wangyushan12@huawei.com,
	xuwei5@huawei.com, fanghao11@huawei.com, wangzhou1@hisilicon.com
Subject: Re: (subset) [PATCH v2 0/2] selftests/arm64: Fix sve2p1_sigill() and
 add cmpbr_sigill() for hwcap test
Message-ID: <177461612664.2271410.12022212735709481989.b4-ty@arm.com>
References: <20260305013638.992301-1-wuyifan50@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305013638.992301-1-wuyifan50@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_055818_074329_EBB08B3D 
X-CRM114-Status: UNSURE (   9.55  )
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

Applied to arm64 (for-kernelci), thanks!

[2/2] selftests/arm64: Implement cmpbr_sigill() to hwcap test
      https://git.kernel.org/arm64/c/74cd4e0e5399

-- 
Catalin


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6087CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 16:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r155r7pxLO++TFakuXHbu5v+nz70s0oZdwxcXTkxUs=; b=O04Ih994fJYUAESU1Wd7UBiNHh
	oC3zs7bD+4JdeDn+cm1SZ15MWBkzgccOWgSLb2FsYRr3fYoSmjKXUQJ7DVel14hr+uaYGWOPbvIWM
	TSvSaJjKDdY3xk6toM0aDyTzc5xlCziNO17GV86CsLMVXs/wUxpSA5l698sge+iaoYc2F7eUtGOB9
	+++OkpXeroL1pO0nPNjAKoRccYXOARlfeI0rnfWPIx174sLbHiBE9Ywdeqp6mpDFs2h8unFcqVMUc
	J+cyB7xhM03NtMp7qeZTTJeFX00I4xHLg6ZGYBCOVoI9QmHXmED9ObnUVPm0KLqjJ6/P0xegZqgpS
	k6zDLLWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHjZ-00000000fAg-0sey;
	Thu, 18 Sep 2025 16:43:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHjT-00000000f72-1J9r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 16:43:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F3BB143C80;
	Thu, 18 Sep 2025 16:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F8EC4CEF0;
	Thu, 18 Sep 2025 16:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758213822;
	bh=0DA7HXzxZcgn61bFa73WY69F/FEzR/TAP9lR2n9H/8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hWKPRj4IcraBg96sa97+zhAgpzbTKS8VeGFzoL+Kk4FeCEJEqFxnESBMOFMenMoNU
	 ilTAwjPitQAj4Ij2R15SeBhwKLvSeMF4CIYiLJv8X8gNRITcCCleH5ZqSswbMwRGp7
	 81qzRm9qIbwj6BTYjDN/eX+b+1GVKUKqbExKXDKufQ1KuakpOJ8fL32h3nAIxP+Jxo
	 LUnJctcsRlNydo5lKxtJW9kXJmrkr9SgGx/7XkL7l64fWLThKgE49GSDh0moK1Rsya
	 vfqwy3EG1mBbz26TcIaEwvcbwT8d+wPcBrCwDmnyqTOfrpR93SQCEpzJjkR1QDYoLL
	 RxpaMwCAiIafw==
From: Will Deacon <will@kernel.org>
To: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	sudeep.holla@arm.com,
	james.clark@linaro.org,
	robh@kernel.org,
	anshuman.khandual@arm.com,
	jonathan.cameron@huawei.com,
	hejunhao3@huawei.com,
	linuxarm@huawei.com,
	prime.zeng@hisilicon.com,
	xuwei5@huawei.com,
	wangyushan12@huawei.com,
	yangyicong@hisilicon.com
Subject: Re: [PATCH v2 0/2] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores
Date: Thu, 18 Sep 2025 17:43:11 +0100
Message-Id: <175820255676.3473406.16924296016129578924.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250820084534.28037-1-yangyicong@huawei.com>
References: <20250820084534.28037-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_094343_423751_B2A9FB76 
X-CRM114-Status: UNSURE (   9.47  )
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

On Wed, 20 Aug 2025 16:45:32 +0800, Yicong Yang wrote:
> This patchset fixed CPU_CYCLES counting on SMT system. CPU_CYCLES can use
> PMCCNTR_EL0 which will count the hardware processor clock rather than the
> PE clock (ARM DDI0487 L.b D13.1.3) on SMT cores which fails the users
> expectation as CPU_CYCLES (0x0011) is defined to count on each PE cycles.
> Fix this by avoid using PMCCNTR_EL0 on SMT cores when counting CPU_CYCLES.
> 
> Changes since v1:
> - remove redundant comment and add tags on Patch 1/2
> - detect the SMT implementation during PMU probe rather than runtime
> Link: https://lore.kernel.org/linux-arm-kernel/20250812080830.20796-1-yangyicong@huawei.com/
> 
> [...]

Applied first patch to will (for-next/perf), thanks!

[1/2] perf: arm_pmuv3: Factor out PMCCNTR_EL0 use conditions
      https://git.kernel.org/will/c/f8f89e8cf3d6

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


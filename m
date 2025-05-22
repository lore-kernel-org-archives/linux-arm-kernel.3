Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C537CC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 10:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHD9PoDPO8K3O3qUsYJCurrkEOxYBDGUcGW3+x7u9ps=; b=oq+x6UawfUmx3rELkfOH16UEz+
	mKsDbPZOtKJcMetus5doxbyNQrE4JO2BmVmuqJMIo2GVSObYCKfej1jBVmvRxX1L5IhTRH0jPWej9
	/zS7V/zSb8MUfqdDSzntkChBoCP2Z0aAH6BXsq+7f+MPfbjCZ9/0QD2EMS0NtBpFFI7vJBRVXZ6K8
	jUFbUAXqMowscxUt0BO2g5E5x0+LoRcUPisTH+AULOQeR54onhuYxuLlfVRmtspCv9gK0TZZsNRKo
	Uhl4Di1PkpOtSyN1oPYZYVudwDVWae/y+YRdITRWEiVKBctsZuSe0dyPT8BpPD3IBejyw7OE8F5zX
	exRZqurA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI3XB-00000000lVJ-0l1t;
	Thu, 22 May 2025 10:52:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI3V5-00000000lIE-41RC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 10:50:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1F596A4EC29;
	Thu, 22 May 2025 10:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0FD5C4CEE4;
	Thu, 22 May 2025 10:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747911010;
	bh=qhsSI+ekPMsr0DhO2nXOmwnTSG0GciE3JfpDPbW4qA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MyNheFDnDu635ErWGrvREjr2F29g+TmkXtpzSMSxFQuKEg9pdKY32QoPUD4Bptpzd
	 UZSYOL/0Gei8+ZPxFCK5wMTAmvtRI2NJAG7GUD0UQPvMgjaFO2No7az4WSj/0l27Qs
	 kLytIIa8RdL3VlVPNTT4aVzpE1WJqIwtryaJ6M0hwGtwJHQX525pH1rpMu7DZ36mBn
	 V94a8dMgs40bIgbEmGHV6Q4n+NEur8JdrCaPZY3rICCpfc9xBUj3X1O+084MTFOi3T
	 3ZvsT7GQ2WQJJXzhnH5eDgl12lrg53/o/TEKxAB91NP+op9N0ua+oibh4rebAUquSU
	 uL2r1H5PlGeQQ==
From: Will Deacon <will@kernel.org>
To: acme@kernel.org,
	namhyung@kernel.org,
	catalin.marinas@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	john.g.garry@oracle.com,
	james.clark@linaro.org,
	leo.yan@linux.dev,
	irogers@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	Yicong Yang <yangyicong@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	jonathan.cameron@huawei.com,
	hejunhao3@huawei.com,
	linuxarm@huawei.com,
	wangyushan12@huawei.com,
	caijingtao@huawei.com,
	xueshan2@huawei.com,
	prime.zeng@hisilicon.com,
	yangyicong@hisilicon.com
Subject: Re: [PATCH v2 0/3] Add support for SPE Data Source packet on HiSilicon HIP12
Date: Thu, 22 May 2025 11:50:03 +0100
Message-Id: <174790933967.1291842.14160046478134585349.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250425033845.57671-1-yangyicong@huawei.com>
References: <20250425033845.57671-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_035012_061426_1A7F120E 
X-CRM114-Status: UNSURE (   8.78  )
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

On Fri, 25 Apr 2025 11:38:42 +0800, Yicong Yang wrote:
> Add support for Data Source packet on HIP12. Support counting L2 HITM for c2c
> statistic since it was missing.
> 
> Change since v2:
> - split the kernel/userspace changes into different patch
> - revise some mem_snoop decoding according to the discussion
> - count missing L2 HITM for c2c statistic
> Link: https://lore.kernel.org/linux-perf-users/20250408122809.37884-1-yangyicong@huawei.com/
> 
> [...]

Applied cputype change to arm64 (for-next/cpufeature), thanks!

[1/3] arm64: cputype: Add cputype definition for HIP12
      https://git.kernel.org/arm64/c/226ff35039d0

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


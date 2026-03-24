Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9D2F54ACD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 15:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eHnG9jUmz4zni9/UDb9TqRIefgIwhOk5Xmd/9OQ0Do=; b=k6/D2x/KLPJyNB2CdMo19mJoOm
	j4ANHUwcX6coYNp+KHtnF6tAaX3pe4A8/hgyh3lOw82ngPABJSSf8Nn1YwrKusAIHX4sVyYSh64Sd
	kuyIyiVzHdaaZyt6XK0mgKDl9do3g31Lv2H8vErdIR+9mF0kjVaaIpS+XBMjuFNecSC0ZOSypg6k1
	nZWVpH0TiHEBQuphie9a6zelOPpX9xKMz+WD9qqAiHDD+bl4ye6RvB6Kbx4ZTPmij3Jb4zhXycfRN
	stMEWiGGqSTS19ARKoi+ElncicFw3EA7ivT3xorQcpweWR38AA5gvsqYCzRuViaRHGR1qGa2J+Ax6
	CV2c8H9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53My-00000001itX-2FIR;
	Tue, 24 Mar 2026 15:08:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53Mt-00000001irI-23C2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 15:08:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C328244355;
	Tue, 24 Mar 2026 15:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA03C19424;
	Tue, 24 Mar 2026 15:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774364910;
	bh=NsM9htBv/b5wj5VrQLrpw0yDzl6UHZ6CctXTV+kC78c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JAUYAIMTIDqGGSnxOdFCm3GDEW90G6epR7nztPIgl6NHkwKo30m+Kynm993izTL1g
	 ax342Pb3hXD7Y6S4T1WXGrquFksuWnMsEUtyJCQmy8/feMVkKVuJHx2cxZdfjV9Mb8
	 WBv6uowTDe4QCi19dHO5+mSYrwU/qsz5Kdih5fhIzhSa9nwfjWCxJj+8UBpScXfMCk
	 p24hogUOb7927no1C5RYLSz6drepQaf1+/04e6By9b/D7bxj7PowFvkFlF2tsPkmbE
	 jb2WBGXQVNM6b4pPVU7YbjxeDuSu5c1lDDecUG/j+g0OLRXfHBwHNMzDtbTBCa0HnQ
	 RHRruvTv5lymg==
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Colton Lewis <coltonlewis@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	James Clark <james.clark@linaro.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] KVM: arm64: Read PMUVer as unsigned
Date: Tue, 24 Mar 2026 15:08:11 +0000
Message-ID: <177435562978.1948488.12134750331688272062.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305-james-kvm-pmuver-sign-v2-0-ee80a125af9b@linaro.org>
References: <20260305-james-kvm-pmuver-sign-v2-0-ee80a125af9b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_080831_546081_9E31EF39 
X-CRM114-Status: UNSURE (   8.93  )
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

On Thu, 05 Mar 2026 16:28:16 +0000, James Clark wrote:
> Fix some issues with the signedness of PMUVer and PerfMon ID fields.
> 
> I ran into the first issue when testing "ARM64 PMU Partitioning" patches
> on the FVP. The second issue was only found by inspection.
> 
> 

Applied to will (for-next/perf), thanks!

[1/3] KVM: arm64: Read PMUVer as unsigned
      https://git.kernel.org/will/c/2e30447b233a
[2/3] arm64: cpufeature: Make PMUVer and PerfMon unsigned
      https://git.kernel.org/will/c/d1dcc20bcc40
[3/3] arm64: cpufeature: Use pmuv3_implemented() function
      https://git.kernel.org/will/c/15ed3fa23cbc

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


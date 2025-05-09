Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151DEC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heBDbfsOVEG4Fg4PItOY91AsjRrgYmJZs3YhXdURkP0=; b=CfC9C/1TDLotUBwCP8B27Rwag4
	s2G2O8NM9fRWEwSTwjDV/p8mKB5F/eZAoTCCe8LvFKhWywNBcpZBUEEqd2dS5ipPWEUu0ihYhkLsM
	MApWU+5PEmeHJ403fdedpm0NdDKG7gfVSX77Vyn+rntH06yI4rwDSfqV4rmeggNA7jJEITy1nSNQb
	psyToLGUGp4vvB1e/rF+i3GcYzUWN+29Da4Gowr/ZfiqeB9a6TEAWWrOLVeH7Qt38hiJ1g7n9nfh2
	eYVyK2ZK8sw3DP/CY9pEL6NamDdPlkUkhaVaObMYrwdwtI1jKSE4vgQBdm2jIo7LWaTOrY4K5IBUA
	oduX0Uwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUHt-00000004mkt-16tp;
	Fri, 09 May 2025 20:25:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQmu-00000004K9a-2yzL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 16:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 19CCC6111F;
	Fri,  9 May 2025 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB072C4CEE4;
	Fri,  9 May 2025 16:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746808887;
	bh=eOYZ8HHZiWDPdP190/usFx37iwbfCGFoTBs/bSy2wLU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EwZE2ZwSynUGOtUvRsPchp108F4Vs8LTNvIBgACK8SY+eyG+Ic/VSUtv4Uu794kND
	 i0kcaSqyeSsNLL/fCcvlJMI7KDZbWQhqUE1QvPVTSWgq+OVz2ussT6Mo6+PJjOeuX2
	 v8NmJ5JOve5h8bKzihJ9B1X9jPi/BoJNWr5zf8IY0Fx504v90gxxnHLCo7/sEqxv5h
	 nWnonHInPHuiYSH9O0QYJ97AUY9YVIEVN+0INUgyBKnWeLVOakOPuls9nw2fT+rvIW
	 50y7krVnaPVey4HOi6Yk8ibZ1R3IQfwSV9o3LbjO2aHEVCEfToCKNIJxY09AHw11OD
	 BUXkHM3KcdqqQ==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	broonie@kernel.org,
	joey.gouly@arm.com,
	maz@kernel.org,
	huangxiaojia2@huawei.com,
	james.morse@arm.com,
	linux-arm-kernel@lists.infradead.org,
	yebin10@huawei.com,
	Ye Bin <yebin@huaweicloud.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64/cpuinfo: only show one cpu's info in c_show()
Date: Fri,  9 May 2025 17:41:22 +0100
Message-Id: <174680102153.621213.521429816425726460.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250421062947.4072855-1-yebin@huaweicloud.com>
References: <20250421062947.4072855-1-yebin@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 21 Apr 2025 14:29:47 +0800, Ye Bin wrote:
> Currently, when ARM64 displays CPU information, every call to c_show()
> assembles all CPU information. However, as the number of CPUs increases,
> this can lead to insufficient buffer space due to excessive assembly in
> a single call, causing repeated expansion and multiple calls to c_show().
> 
> To prevent this invalid c_show() call, only one CPU's information is
> assembled each time c_show() is called.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/cpuinfo: only show one cpu's info in c_show()
      https://git.kernel.org/arm64/c/7bb797757bf5

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


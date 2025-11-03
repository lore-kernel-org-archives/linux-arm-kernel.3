Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244A4CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0E5IeMU4PS2em/ynC/hGv8hf9oi5/ddxQnRlB1T70/s=; b=PiDbrILx56qTAy9TBsZ7vFum/v
	IIQVgHb9+eE12ZZ3dy+xvNSGjn7D9kpu3iKjCXzxxg++zC53JiCNX3G9WqQqBF+Sq1NmtpuVmOacw
	6ZnNpl1Mdd0y+mYtM4Iy7rebZWHd1esRz7TMj8hkNcZ3pNkC/c1NpiD7n/x52ejRwIeC5vt8os7I+
	DVFtLafZx5gEyk5PEiPMUwjI38va4qIuzSTQPghgTB08j6U75xwIzoEm/tZf0MyyuxHT3glNRthfm
	XY9ZIW9ZLgwhHRvx5Uhs4RP3D/zSvab720wRu9pDOHHu1JG95EvsEzyZvgu75K3qOoOK5dbx9DUVg
	Wm802QMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFw0b-0000000A3xJ-0s5G;
	Mon, 03 Nov 2025 14:58:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFw0a-0000000A3wL-0hp8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:58:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CEB2601B5;
	Mon,  3 Nov 2025 14:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4DFC19421;
	Mon,  3 Nov 2025 14:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762181891;
	bh=FyNh0PxfcH5xW0MRq81VDMErnc8Oj7mYNOWP2GYRM+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hamcaUKvZ/j8vZJDaaWjVv098Xe/A2tMam9Dsi14BDt2l+8LmUgVV4F8h8Fprs0vh
	 eu8g2yedkGN7nSVOY3TbtGKlgUtkrXCPxtXTeebtD8vnpo1TJ6gKVWVC1QHFeUjFBx
	 Am34dcMPUhPJOVVHGzXGumM7mTp0M+C7ejyUgdv2fYmkszHBImRtt+cP6vfHXEZyW6
	 UQ6hx8JY4VFLLAmqqR5POYPYPIhH15/j9rlDHgLNu9yAVPkm0HyVvVi2hD1DMxF0n2
	 Y9wzk1kM1RERd9kfZP7n4VQQWNWJTausZd2V+Adxesm2rABj6EcF3CovBEt4hJYitu
	 aBR0Z63ojtnUw==
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
	yangyicong@hisilicon.com,
	yangyccccc@gmail.com
Subject: Re: [PATCH v3 1/1] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores
Date: Mon,  3 Nov 2025 14:57:50 +0000
Message-Id: <176217652888.2887047.18326627382472428067.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250922033010.4596-1-yangyicong@huawei.com>
References: <20250922033010.4596-1-yangyicong@huawei.com>
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

On Mon, 22 Sep 2025 11:30:10 +0800, Yicong Yang wrote:
> CPU_CYCLES is expected to count the logical CPU (PE) clock. Currently it's
> preferred to use PMCCNTR_EL0 for counting CPU_CYCLES, but it'll count
> processor clock rather than the PE clock (ARM DDI0487 L.b D13.1.3) if
> one of the SMT siblings is not idle on a multi-threaded implementation.
> So don't use it on SMT cores.
> 
> Introduce topology_core_has_smt() for knowing the SMT implementation and
> cached it in arm_pmu::has_smt during allocation.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores
      https://git.kernel.org/will/c/c3d78c34ad00

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


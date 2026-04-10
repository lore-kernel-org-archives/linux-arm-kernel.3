Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BB2F44846
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 11:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ma4HUJBAnPBZClot/CtVlWvTGij01gVzpgz2soK/V1o=; b=l3LcZTHlZegen4TJj+48wal1TT
	uR+1yh0YVK5LEfQsUTjHSKYch8h2BAKrt4r+K7VtpyAB685ddinLZoC1ctlHBG1//w3FFDf//4m4l
	I6f/YXUi2sp+U3ubCrp6CjDZ2tyD47k9hltufFuypY1lyGfOOtmsvnTTx/cSx30tyixfbe3FiUMU6
	Lky3fO2DZPs8KEuJn11Eqt6qYfU2OCN4aKLzu+edhad47bdX2aGubraBA9dHR8Fm4WRhKFNfzeykP
	ync8oNabxWz2e4wh4eRQbHaVFsvdQUrAz1rf16l1Hv/VBdQVEy8fa/A7GyW2vnLfz7NX56p/+0/sI
	mWpY57Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAV2-0000000C7CK-1ylg;
	Fri, 10 Apr 2026 11:58:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAV0-0000000C7BU-3jKB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 11:58:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFD6B1DB5;
	Fri, 10 Apr 2026 04:58:03 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58DAD3FAF5;
	Fri, 10 Apr 2026 04:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775822289; bh=ZuCZ8fzvYm+I7wDtCZSszyG3fLuuFDZT68CvAhnqhGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qWc7MciSvy45rva1L/y6VLcDvSmk+pi8S7dwxxNknvr3CAvGUpagEW15p9Eq60IA8
	 6gM9ykWRiNyUsSD8KcMPqu9LsY4vOsKqxfG0i+tNxJrAyEBc8XAmUbvSrayflKnNyf
	 rTXBriHm8GSs1tU+hWQWKGYsjz6hE1IaBR1VQWNQ=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] arm64: rsi: use linear-map alias for realm config buffer
Date: Fri, 10 Apr 2026 12:57:33 +0100
Message-ID: <177582225361.115239.6189357063443330488.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407152900.396431-1-aneesh.kumar@kernel.org>
References: <20260407152900.396431-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_045810_972975_6B189C91 
X-CRM114-Status: UNSURE (   8.43  )
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

On Tue, 07 Apr 2026 20:59:00 +0530, Aneesh Kumar K.V (Arm) wrote:
> rsi_get_realm_config() passes its argument to virt_to_phys(), but
> &config is a kernel image address and not a linear-map alias.
> On arm64 this triggers the below warning:
> 
>  virt_to_phys used for non-linear address: (____ptrval____) (config+0x0/0x1000)
>  WARNING: arch/arm64/mm/physaddr.c:15 at __virt_to_phys+0x50/0x70, CPU#0: swapper/0
>  Modules linked in:
>  .....
>  Hardware name: linux,dummy-virt (DT)
>  pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>  pc : __virt_to_phys+0x50/0x70
>  lr : __virt_to_phys+0x4c/0x70
>  .....
>  ......
>  Call trace:
>   __virt_to_phys+0x50/0x70 (P)
>   arm64_rsi_init+0xa0/0x1b8
>   setup_arch+0x13c/0x1a0
>   start_kernel+0x68/0x398
>   __primary_switched+0x88/0x90
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: rsi: use linear-map alias for realm config buffer
      https://git.kernel.org/arm64/c/34e563947c76

I did not add a Fixes tag, it's just a debug warning, otherwise it
functions correctly.

-- 
Catalin


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA78ACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBtgkB1QXUyi3mYTNFKpF7EItyFRQKEeQN2yXHx1XO4=; b=gjt6qIjl0QhDnml/kmpLL42Bi0
	xtvD2+2VML0lL5v59Mv6s2uxj9bSsZVAL/r/1Za/rDblUF8Dup0/FppPMBXd/iku1qSGMbD+pU4PG
	7e+HNLoMOEVwl6EyPEQuqB9iWdD/veLRAjdzOtPPOhjRO1Kuupc6gtnrvjeh5tUmzh23rS1yK823u
	Sk9M7oPvCnXRCdiS1n6yLkcx1zO0FciKNtY3gTYCC1hHlb4gzm+LDco+pfrXTkMTersENcjQb6+WU
	zogHAFsEqIN8xnMy2Zl8yuZDSD9Xuc2nO0j5cTt6uiBNt1ZYlKNTXHVNWAaDeDierwq840EfP51VA
	MaTdS1QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMUE-000000024sG-1fc5;
	Tue, 19 May 2026 15:36:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMUA-000000024r4-3cWJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:36:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46E243528;
	Tue, 19 May 2026 08:35:52 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06D2F3F632;
	Tue, 19 May 2026 08:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779204957; bh=ZkRz0E7rghIRIQ6Vas5WZriK1yQc+rUOKfruBiITXEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tr5Iy+eFwtAYt3ObIw+VJv4hqD8NnNXrVImS/KaM3B7UPx2teDebcJMl0o/sqAvrd
	 eVGCpt/7KscfUVWRWqRTlVXYKxM8aygDha8hQMG0DXl0eAjjoV6H0iM0KGW2GzQFrT
	 S5BU9CCBk23N6+39Bw8htB9d60IxSCooMRuRfvlI=
From: Leonardo Bras <leo.bras@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	maz@kernel.org,
	oupton@kernel.org,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	pbonzini@redhat.com,
	Tian Zheng <zhengtian10@huawei.com>,
	kernel-team@android.com,
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
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 0/5] Support the FEAT_HDBSS introduced in Armv9.5
Date: Tue, 19 May 2026 16:35:47 +0100
Message-ID: <agyDU3ujE-OJWTiC@devkitleo>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <177918656142.736362.17906576792384645789.b4-ty@kernel.org>
References: <20260225040421.2683931-1-zhengtian10@huawei.com> <177918656142.736362.17906576792384645789.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_083559_028366_5BB9DC8A 
X-CRM114-Status: GOOD (  13.67  )
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

On Tue, May 19, 2026 at 04:23:12PM +0100, Will Deacon wrote:
> On Wed, 25 Feb 2026 12:04:16 +0800, Tian Zheng wrote:
> > This series of patches add support to the Hardware Dirty state tracking
> > Structure(HDBSS) feature, which is introduced by the ARM architecture
> > in the DDI0601(ID121123) version.
> > 
> > The HDBSS feature is an extension to the architecture that enhances
> > tracking translation table descriptors' dirty state, identified as
> > FEAT_HDBSS. This feature utilizes hardware assistance to achieve dirty
> > page tracking, aiming to significantly reduce the overhead of scanning
> > for dirty pages.
> > 
> > [...]
> 
> Applied sysreg definitions to arm64 (for-next/sysregs), thanks!
> 
> [1/5] arm64/sysreg: Add HDBSS related register information
>       https://git.kernel.org/arm64/c/72f7be0c2e30
> 

Thanks!
Leo

> Cheers,
> -- 
> Will
> 
> https://fixes.arm64.dev
> https://next.arm64.dev
> https://will.arm64.dev


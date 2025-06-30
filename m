Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6886C83033
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 18:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tb/2DwVnwgzqJm4KoR8hQGLEntaZKFaowF6tIzGObHU=; b=NfrCriFQxsRGOSJHb3uBStJmMW
	8TfIz2kJuG280dR2B2EZTn/YHuAlbE+jEVgNrtks+lN+d4apibczfQ360jOp1S+bvnzAg+vxfLyZW
	otumSYv/MspobhemW98Br8v0VqDl0y/+wdM/D0rvl1o4mUHSEzvGFGo92jOAAO+5gntpdJygNme9D
	aBnPAhzaBYnP2XtZnq8jqjyUIB0/AqtIe5OezByqC/x65pN9BXBgxkKA7vmeJqaluZaMP8VQhCCke
	EVW7hiQb75zlPYbRH6UMQDx+b9/MGvaHgjTkxbhjfjdBAnQ9lqh1mdKSWWW0nv1JNvlz/6mTpNpqQ
	aVJu1rbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ1Y-000000039fT-201a;
	Mon, 30 Jun 2025 18:14:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWIAC-000000033Zg-1KZg
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Jun 2025 17:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=Tb/2DwVnwgzqJm4KoR8hQGLEntaZKFaowF6tIzGObHU=; b=YvopD3R+RiE30Tw2+yUE4RCxHC
	7BZh70yo3RSUUi5e15GPW6BXEKh3zek93MU7n5/v1dGBxnojwAeKp9nB+ujxFrFCHVX44Ffk7AVIt
	1mK6wOOFjx+7VWBOd2X8ArKrY9k5GGVBiNZ9cJi3TLbAokcDanXkvMc4v+iotgXFFkima2KpqUGzh
	lOtf3+jmsXUyOwO3toSSQSCQVZsXXsURnip1e9ezRatCk5xANvwYOdOU0vEf0PWSoFsuGYSs1obnM
	QQCgwTvJ5aFodlRn34serHxwLoyOszLYWuRUMS7yZNvi+E30e7gGYcwnWuHs3/JJjuPSE8uc7VbvE
	x9QDTYgw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWIA8-00000006pOK-2cVA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 17:19:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F6E05C6443;
	Mon, 30 Jun 2025 17:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08F4C4CEF1;
	Mon, 30 Jun 2025 17:19:16 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: ryan.roberts@arm.com,
	yang@os.amperecomputing.com,
	will@kernel.org,
	jean-philippe@linaro.org,
	robin.murphy@arm.com,
	joro@8bytes.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	james.morse@arm.com,
	broonie@kernel.org,
	ardb@kernel.org,
	baohua@kernel.org,
	suzuki.poulose@arm.com,
	david@redhat.com,
	jgg@ziepe.ca,
	nicolinc@nvidia.com,
	jsnitsel@redhat.com,
	mshavit@google.com,
	kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	=?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
Subject: Re: [PATCH v8 0/4] Initial BBML2 support for contpte_convert()
Date: Mon, 30 Jun 2025 18:19:14 +0100
Message-Id: <175130394786.1397341.8393706123668185892.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250625113435.26849-1-miko.lenczewski@arm.com>
References: <20250625113435.26849-1-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_181924_894203_534D049B 
X-CRM114-Status: GOOD (  11.11  )
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

On Wed, 25 Jun 2025 11:34:31 +0000, Mikołaj Lenczewski wrote:
> This patch series extends the cpufeature framework to add support for
> easily matching against all early cpus, and builds on this to add initial
> support for eliding Break-Before-Make requirements on systems that support
> BBML2 and additionally guarantee to never raise a conflict abort.
> 
> This support conceptually reorders and then elides both a TLB invalidation
> and a DSB in contpte_convert(), when BBML2 is supported. This leads to
> a 12% improvement when executing a microbenchmark designed to force the
> pathological path where contpte_convert() gets called. This represents
> an 80% reduction in the cost of calling contpte_convert().
> 
> [...]

Applied to arm64 (for-next/user-contig-bbml2), thanks!

[1/4] arm64: cpufeature: Introduce MATCH_ALL_EARLY_CPUS capability type
      https://git.kernel.org/arm64/c/3eb06f6ce3af
[2/4] arm64: Add BBM Level 2 cpu feature
      https://git.kernel.org/arm64/c/5aa4b625762e
[3/4] iommu/arm: Add BBM Level 2 smmu feature
      https://git.kernel.org/arm64/c/212c439bdd8f
[4/4] arm64/mm: Elide tlbi in contpte_convert() under BBML2
      https://git.kernel.org/arm64/c/83bbd6be7d17

-- 
Catalin



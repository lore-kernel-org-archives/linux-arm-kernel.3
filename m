Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EB0E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6u39HDBm2bYtjHJ/1shy0xJjLyk0P2LuaVaTi+R7LFM=; b=thaDqCzBMg6UuQSAN+GlLzmZ1W
	zJEKsDaqSZHOZT2kb0wEmzrOw7CqZtcnqdt4DUo5Oeffj1si06oZdkKxdFf5NUFA+YyuIAhi/hAnm
	ZfWRsSsJi8LPVYB9w/0eDO6VF9hp/c5IsaRNPKrHLBjxTf4wSexOHyfAZVJH4+EIffyc/+UBdUwi0
	SvKpr7S+FTrnHeAOcUDdrN6PNQgDW8K8qmfCXcQpifp2E6Ejz1FZHbxm5l/kblRoFKm1b4hlqrgko
	mnYOA0tiuLR/XlnYATFlrCsCxpViPyrJww7NE6kI7GZ3/dpllzxzeKsMw1UyDWwsbe46y4IyFiVRq
	gx+8rgig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGaq-0000000H79p-0tU9;
	Thu, 05 Dec 2024 18:28:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGWO-0000000H6go-01xy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 18:24:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4820FA43EAA;
	Thu,  5 Dec 2024 18:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D265C4CED1;
	Thu,  5 Dec 2024 18:24:12 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: guohanjun@huawei.com,
	lpieralisi@kernel.org,
	sudeep.holla@arm.com,
	will@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Qinxin Xia <xiaqinxin@huawei.com>
Cc: fanghao11@huawei.com,
	prime.zeng@hisilicon.com,
	yangyicong@huawei.com,
	linuxarm@huawei.com
Subject: Re: [PATCH v2] ACPI/IORT: Add PMCG platform information for HiSilicon HIP09A
Date: Thu,  5 Dec 2024 18:24:10 +0000
Message-Id: <173342292873.1735998.12216158136590332848.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241205013331.1484017-1-xiaqinxin@huawei.com>
References: <20241205013331.1484017-1-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_102416_107680_2A254D8B 
X-CRM114-Status: UNSURE (   7.49  )
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

On Thu, 05 Dec 2024 09:33:31 +0800, Qinxin Xia wrote:
> HiSilicon HIP09A platforms using the same SMMU PMCG with HIP09
> and thus suffers the same erratum. List them in the PMCG platform
> information list without introducing a new SMMU PMCG Model.
> 
> Update the silicon-errata.rst as well.
> 
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] ACPI/IORT: Add PMCG platform information for HiSilicon HIP09A
      https://git.kernel.org/arm64/c/c2b46ae02270

-- 
Catalin



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162F5E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 00:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=le3OLdPi+7GqsRwhpvl3VmgjOmVOxgI+O0m7XZZIEOI=; b=qffggZKsCKVgPq3R9Cdj9GCO9g
	ek3f36kGtSB/NsmLYli9xmQeSd955rttaTnmYHWnSpz8bnXPktSB8ghKw/A258j5J3sdm0kpJprak
	okFpYQaSSycnXDQ+/U+d1LQ/YwJVKBo789+VNwbSgZPLD4aSphnAhVHzMU3+YZA//QyMrC8lwpwz3
	rOqaAVP8+eC+O9k9vVOHsuX1JZEjLjwxLnyDYSgJNcargVJMOsQSx7Re9rMwb8m5EYkxepF3zTVAZ
	p51sHWCXQccPqSV78BKyonAnV4rH9ZoK1yOVGoeiT2k4Ao/5RtdAyZ0OBlOXsSz/w8PHgTxVQbbel
	d2Q2IVtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnzd-00000009goY-3aNm;
	Tue, 10 Dec 2024 00:20:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnwe-00000009g2d-3Jsa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 00:17:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 97833A41A77;
	Tue, 10 Dec 2024 00:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B4FC4CEE1;
	Tue, 10 Dec 2024 00:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733789863;
	bh=Ic7pQ6LFiHXt2WB/ccfFedVbtDdhbJCjtpNtWFW7Hv4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MsLnSa+kTuZstB4a0MCCjDVlb9Aw5v5GLa2QCZNUie4W5WfvA4TBDCS5iaEIooPPK
	 JIR1qOmLAgNI3XSoNqrcxCZuWTRSleD35V8mXgEKXNJXdeTpZuncFRSI6H2W8GVzJE
	 A1RCMrbJsamp3Xa+w2WMYiC/+5RpHKZhmbjuDR2D0XNFlTVzwboaPmu2DQLH+VypEi
	 xCvpkVEfbp0Z+EgQO387qr6Xebv45C9SeetLLFoourQcLqtIRsGPlKyFtjcU54RvGP
	 I856sozAvHe5F5BHRcod4RO7mmj6IHN8jn5nd3FYyCBvZY8LjhmCnVCQA8qZohz3/V
	 CbLqsN+5rsbbg==
From: Will Deacon <will@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2] iommu/tegra241-cmdqv: do not use smp_processor_id in preemptible context
Date: Tue, 10 Dec 2024 00:17:28 +0000
Message-Id: <173378751166.2164111.11293401851587446576.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <Z1L1mja3nXzsJ0Pk@uudg.org>
References: <Z1L1mja3nXzsJ0Pk@uudg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_161744_888103_555863E9 
X-CRM114-Status: UNSURE (   9.17  )
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

On Fri, 06 Dec 2024 10:01:14 -0300, Luis Claudio R. Goncalves wrote:
> During boot some of the calls to tegra241_cmdqv_get_cmdq() will happen
> in preemptible context. As this function calls smp_processor_id(), if
> CONFIG_DEBUG_PREEMPT is enabled, these calls will trigger a series of
> "BUG: using smp_processor_id() in preemptible" backtraces.
> 
> As tegra241_cmdqv_get_cmdq() only calls smp_processor_id() to use the
> CPU number as a factor to balance out traffic on cmdq usage, it is safe
> to use raw_smp_processor_id() here.
> 
> [...]

Applied to will (for-joerg/arm-smmu/fixes), thanks!

[1/1] iommu/tegra241-cmdqv: do not use smp_processor_id in preemptible context
      https://git.kernel.org/will/c/1f806218164d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769CDD3A678
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 17:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfMVNlp0kENxRJbzlMGSwvYAIhIfloyMVA9LxzVLN8U=; b=dYKzWMC9POXjT6sloUdbcNmnlX
	Q/lC03vW7L+1IRjckUd0q89pe+GJVXFmBpSp9RfdUfUGBYIZkBRk3jXsKPHnBCUbQ1sEA4qj2jDsw
	Xdcd0zlp8VTUZfFHQfa6b6r6QO7ThJCUZmLAQMNsly58CqujSY0Ut/MCRenGkqgLL83VVoGiGD1XP
	DaWJMLl3+OpgX0F2icIc3lySR4sn3Jl5lNmnrmiK7g4BsLdTKkBrDPCI+4MpWzTuU0u2g3QX6nD5/
	nA6/e6hfQOckbPW4/Wjrzzgkez0dt+BxOHCXpvVRMhUeZmjY3zbXmmFwyi5rHccgXIqPPEoDJBTWJ
	aM86Y4OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qCb-0000000FLKg-3SC3;
	Tue, 29 Oct 2024 17:40:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5osM-0000000F5AG-49TR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 16:15:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3D63FA42FDD;
	Tue, 29 Oct 2024 16:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E56C4CECD;
	Tue, 29 Oct 2024 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730218521;
	bh=YptWnvqJ0yTWJb6UsizDcng82GAKFuaTQk2qXPmbjwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bNJ97eIZ6jVRcS6EPWqL06OPQKQXmtE8ivR6KGn8z7ZalZCCPx/xgfJeBsEnAWV6k
	 8TuLm7pwqJ5W5TMlpvRDEaOy7xuBY8WsnPjTz8FGid6G7qgTqcxgKVBq+xbJM2VY45
	 KmMnkFTDOTz9qV3ausgCYLHr0X2yNiOQ6gG7YcydjO65dkVSUA1sH0G91wrca2MCMO
	 AaQN+Y0RHEOMA0dXv39AbisX6F96Kekg/EcmA/S18stM2ymqIGisMpJmj2Irkr77Ug
	 LrluKJmnyTSKVQxC+xKYLR3N/SKxqe/cJAXktYjW/+a+F4q/i9g7H9qs/0jhLQhX8z
	 wvu6vN0t71JeQ==
From: Will Deacon <will@kernel.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] perf/dwc_pcie: Enable DesignWare PCIe PMU on Ampere SoCs
Date: Tue, 29 Oct 2024 16:15:11 +0000
Message-Id: <173020687559.2330125.6919585782024497615.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241008231824.5102-1-ilkka@os.amperecomputing.com>
References: <20241008231824.5102-1-ilkka@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_091523_109992_CD30D7FC 
X-CRM114-Status: UNSURE (   9.46  )
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

On Tue, 08 Oct 2024 23:18:21 +0000, Ilkka Koskinen wrote:
> Enable DesignWare PCIe PMU driver on Ampere SoC. In addition, load the
> driver automatically, if the system has a PCI bridge by Ampere
> 
> Ilkka Koskinen (3):
>   perf/dwc_pcie: Add support for Ampere SoCs
>   perf/dwc_pcie: Load DesignWare PCIe PMU driver automatically on Ampere
>     SoCs
>   perf/dwc_pcie: Fix typos in event names
> 
> [...]

Applied 1 and 3 to will (for-next/perf), thanks!

[1/3] perf/dwc_pcie: Add support for Ampere SoCs
      https://git.kernel.org/will/c/83d511c3ca0c

[3/3] perf/dwc_pcie: Fix typos in event names
      https://git.kernel.org/will/c/94b3ad10c2e1

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


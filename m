Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B312D3A67C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 18:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/k8+XBONV+IQr5dF+yVdhqsIsdqIa1Oz23MYRQHQSE=; b=Le3ee5CHvWR2MzxNaVNd4Frn2H
	Be+QPxyHVp4n1VKD/CmElIwulJyXGKiDOuxiuRGkRmTkSL0KrZGhCoTfIW+YtZfSEFpYbCQRDcty6
	AORCFpEkPPOFlFqqAe3I2jcekRadh9pfmqpYuN80ANXp4Gu0VyKKgSFPAQu3fk0s10uCgEaCyCXFL
	H2yRJZOoJ/ERzYRYPytk2O7t+Ca4Q3KMRNf840fRQ6Uvq8g0ovShDkeOz7j3voVApeXf7iJ2pwwJS
	8N8bWE+dS4ejr/Mb3B2XDcY1XVcBlz6yT5JjHKFvR4jgqXUsLKLCYteozSF1TTZS+gBbg0lpXdju6
	54w9L4HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rDj-0000000FWhj-1j0F;
	Tue, 29 Oct 2024 18:45:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5osV-0000000F5D3-3TZB
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 16:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9/k8+XBONV+IQr5dF+yVdhqsIsdqIa1Oz23MYRQHQSE=; b=aZ5x3ibgqKe7d+EUQEgvf7rqtC
	Suxikpyfe2Aj+NGw2lKqv2hpYY9dvIJH6siznVVpZ3lqcOQef+hGxBZS5wwzG80/S1/Kx/sZ3pSGR
	vrdP06VXorEVDCUYwpKNkXVYSCnnVtm5RF0zdTXC3Xlmli0+PK+fIiazTPtwwLOiY8Ac1hxNGH5q5
	nIFbrungUJLgND7RzsFgZQWfSSenoWF0kiWjPYNMd+qrpXHE3ALvFsZZWMkByYbzSaVL1al8dHSoY
	C3hloAT2bZ0A3HxsqtFbiT0edw+g0KVdqpOtPnLMs2oMr/nw6lQrwuOI1IXGDlDXmjO1Qeb/fNjhi
	k4pE/33A==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5osS-00000009wtW-1xZp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 16:15:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2A0DBA42FF6;
	Tue, 29 Oct 2024 16:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4A0C4CEE5;
	Tue, 29 Oct 2024 16:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730218524;
	bh=zEPDtk5TnMn87cqOQA+7VFLwOc6B9MRUG+kIZzLuyKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GbmcWUgrknm0c514v50ZvjGrH4ut/pbtRj42Na6lROTN0QW662wkdQhF5yllsmfin
	 /PMvYnv3psjJVXDFey0547QZp3zU/YthaLkDvqeRTXopuYK9y2P9MN7/XXtgIhZ9SG
	 5NPUZix1hpVFUZKlfmvwj0QoQRysPGcngyKzojspn2/bOg8oZSJte/jyz+GNxHIJQD
	 56BOx0x/6uakdcUciMRBk+5ZzEwtXAAHXBlIrA7XdO9HTdr/XDkibH3OeHFyUO/FVn
	 jWSZnRvVUqJFPCO6sTSTDFKxwgVbPp4Zqdetv2PW+v4F/T6mpXGxVBVukEd6Wqz+/2
	 qsQ+VnuO7q8dA==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Markuss Broks <markuss.broks@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Maksym Holovach <nergzd@nergzd723.xyz>
Subject: Re: [PATCH 0/2] arm_pmuv3: Add support for Samsung Mongoose PMU
Date: Tue, 29 Oct 2024 16:15:12 +0000
Message-Id: <173020820622.2331895.8950833346976223210.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241026-mongoose-pmu-v1-0-f1a7448054be@gmail.com>
References: <20241026-mongoose-pmu-v1-0-f1a7448054be@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_161528_776385_E0D90DE9 
X-CRM114-Status: UNSURE (   9.97  )
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

On Sat, 26 Oct 2024 23:28:07 +0300, Markuss Broks wrote:
> This series adds support to performance monitoring unit of
> the Samsung Mongoose CPU cores. They were released between
> 2016 and 2020, and they were used in Samsung Exynos SoCs,
> such as Exynos 8890, 8895, 9810, 9820 and 990 (9830).
> They implement ARMv8.2-A ISA and they are used as a fast
> cluster (big in the big.little scheme).
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/2] dt-bindings: arm: pmu: Add Samsung Mongoose core compatible
      https://git.kernel.org/will/c/3930c88ad0a5
[2/2] perf: arm_pmuv3: Add support for Samsung Mongoose PMU
      https://git.kernel.org/will/c/9643aaa19473

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


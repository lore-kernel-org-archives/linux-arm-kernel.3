Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94809C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 07:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qeTBzuwncKNJ7O6NxAReTtJxY+4KwSi94lOSMV/+ros=; b=l/RQ/77F2dB1wD0zLR6qFhjzwj
	lAqUt73+atesAvA2E1LjXzfmmOoqbZyrinO3LjsjCXftbuqMdOTNI2O20gZl8+M+wnk48+oIS3bj/
	Rk2eb8lNxVXJyUqeOC3qEc5hPCNgzsiTM5SQoIEQkTWPMm1xZZlM3kllp63Qzg/BH4fwK8EXaHBb6
	fOewBXH6C8vCtCbk1T1/BoTP+UU0K2WSI8mDKmUsyNlP/tqf+QLJbNJXZz1yRrorh12poTi4qSUJK
	Wpgr1rkLkioA4mdJYC1M3RUUVdFhus3S9B4p6qtEeCSaLglF6RSKghDOeK2jY2MTj1DGY7F/TnvTl
	epqFwh8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teqzE-0000000EjCy-31Ai;
	Mon, 03 Feb 2025 07:35:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teqxu-0000000Ej30-1ZLB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 07:33:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3ECC0A4028B;
	Mon,  3 Feb 2025 07:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A02DC4CEE3;
	Mon,  3 Feb 2025 07:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738568033;
	bh=yOy3zcmE0HZGLG2DLjwjOiQ1ZDVv6x3eU+/3hLDWIUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UsRIoKni7Yk20ziOyb9DL2vZl2jzq/MwPWN+xK2gZTS83mbNFh8SGEex3IeSW9gFa
	 l0VJnjLmBFx+br2iCRIfeUV6p7vW7VA6QdmT0PQDTZndAIyERaQ9ctja43M8MhcudW
	 gpR66BkU8AP5Ulor5AvYroUKfA4hU765tB2RRHEzDuDS+KO7mVB3bVhTvoJ0bnBcUA
	 eJ4pqfAkqxVYXf7tTiwZ8jNG5hTCfNUOZ2aQhMfYQiYf09lqbOL509wEGM23ITnfqx
	 ezSyiq1//TPd5K1suv51fYYrClr5BCC4Sy6jWG3ntNdKYy3S+sJhgvLWY4hZNXAy39
	 GXdyUBoLlFczQ==
Date: Mon, 3 Feb 2025 08:33:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Add support for GPU SMMU on QCS8300
Message-ID: <20250203-lean-delightful-ermine-f5b902@krzk-bin>
References: <20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_233354_483428_23CB4094 
X-CRM114-Status: GOOD (  12.21  )
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

On Mon, Feb 03, 2025 at 11:17:00AM +0530, Pratyush Brahma wrote:
> Enable GPU SMMU function on QCS8300 platform. GPU SMMU is required
> for address translation in GPU device.
> 
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> --
> Changes since v3:
> - Modified the order of clock voting and properties as suggested by Konrad
> - Removed dependency on clocks in commit text as change is merged in
>   linux-next before current base commit
> 
> Link to v3:
> https://lore.kernel.org/all/20241227105818.28516-1-quic_pbrahma@quicinc.com/
> 

How are you sending these?

b4 diff 20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com
Grabbing thread from lore.kernel.org/all/20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com/t.mbox.gz
Checking for older revisions
Grabbing search results from lore.kernel.org
  Added from v3: 2 patches
---
Analyzing 7 messages in the thread
Preparing fake-am for v3: dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
ERROR: v3 series incomplete; unable to create a fake-am range
---
Could not create fake-am range for lower series v3

Best regards,
Krzysztof



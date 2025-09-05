Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28FBCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zl8Pb/XyiqVJpsO/1AaIIbwMAjQlKn36KNSOpeHGPR4=; b=ouvFA260cP4zr+frbQvsA9E0H5
	apq7QwkZjuRqgI/tnvgTm8LQGEyG3PFNkjFPlHStFolBbSCNDDDMF2J3Bvz+5/ac6O5JzhdN0Y+pD
	/2gk6gIyGpPdkU+UhrQsPtTfSK4n4hQQU7LcVWrIOlBUHQudyPgDXsYfy9i42ql9m6PyxqWucbS+O
	dVITDiwKGtm4KqDLmQIk9l/WqGsNRmjRvj3NPAistsKoqg366Pd2JGOBrdtjS6N39u5ur2UCsLfJZ
	Xd5blCcCxU9vqVmHtri4q8Mj0S6u4K+9AbyOUxY5daeqhK2OZsG/n9shXrT1NqZO9ixNs0sWu4cxG
	FV/tpsoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVC-00000005QvQ-09FW;
	Sat, 06 Sep 2025 00:09:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZ4Q-000000031eU-0a83
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 16:13:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D8BFE44CEC;
	Fri,  5 Sep 2025 16:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71ACC4CEF1;
	Fri,  5 Sep 2025 16:13:46 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Joerg Roedel <jroedel@suse.de>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Miaoqian Lin <linmq006@gmail.com>
Cc: Will Deacon <will@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH] ACPI/IORT: Fix memory leak in iort_rmr_alloc_sids()
Date: Fri,  5 Sep 2025 17:13:38 +0100
Message-ID: <175708881848.3546185.8093132917549688443.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250828112243.61460-1-linmq006@gmail.com>
References: <20250828112243.61460-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_091350_193470_221645F9 
X-CRM114-Status: UNSURE (   8.47  )
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

On Thu, 28 Aug 2025 19:22:43 +0800, Miaoqian Lin wrote:
> If krealloc_array() fails in iort_rmr_alloc_sids(), the function returns
> NULL but does not free the original 'sids' allocation. This results in a
> memory leak since the caller overwrites the original pointer with the
> NULL return value.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] ACPI/IORT: Fix memory leak in iort_rmr_alloc_sids()
      https://git.kernel.org/arm64/c/f3ef7110924b

-- 
Catalin



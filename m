Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F93FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ve315Lf5f26qmZRB9J04YWNRwxTZqT16jtAteB94H4c=; b=PWGOMSkPJ7CDCm7D4fxuRS7tgy
	pU3W6na5ZO6lO2816SgzUGNkryzsKGo6/upOpGh0XlaGzdfDMSKD7Hv2LjCIu0G5a1B7QwMRt5pZU
	yjyuWV6n3bJU0sQytCvbAJbKMvDICxTFqgm3L9+aXHk+Q+gkhbmMsPqWlbGExS0K07GdiOVPyfssJ
	HC+Ko4SHlLMNJg6BjcxP4kNg3q+C2OyVnzsSwkp0HBTEmgDumTZY8bNhciLK6IB1PxBBRf2xu1laB
	98H04iK/jKtIa/ixZrVFKKtNGAfg+U06sekyTHoN31BJ4iIudVMui56H2fdGIZLf6y/oBQavM2o2O
	pYtLqzqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeNd-000000010xV-2LgK;
	Tue, 28 Apr 2026 09:05:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeNb-000000010wg-1RM7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:05:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99A1844946;
	Tue, 28 Apr 2026 09:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F96AC2BCAF;
	Tue, 28 Apr 2026 09:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777367105;
	bh=avdBPaIwZk7NkKkTLLHF3tk7Md9yMqY+C26UoHu11cY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mY55H+LxwhQCzaL+eZPT2a+NHi3q+LDHzejJWRa2EyNn2Us5tC7lLg9skNg0BzBZZ
	 DdU4pfFsQSKIBW6WTfavxFUt+lOMnQ40qbpdtWASKwActV+QHreL7yOvR6N62rgUc2
	 hL9/qNiFvU5dnvKE4URCV1RIQ2sFV7ddkdov7dqhNFOr/jXSvgqXR7FKz35/zWJ/Xc
	 nHmopaRESLGWn4hWd6GzpFD9b8o8uqiMq0YG5q3tUoDwsw3d9BnGSN75WV7D/6CkSV
	 CgluCWbAK5Yx3p1JjrxwZNbzWsYguIT12/29tMlYKnnI/1UEdI/zvugqKuZ24ozjfN
	 WiMFWeElnBSyA==
Date: Tue, 28 Apr 2026 10:05:22 +0100
From: Jean-Philippe Brucker <jpb@kernel.org>
To: Joonwon Kang <joonwonkang@google.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	baolu.lu@linux.intel.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	stimim@google.com, cychu@google.com, hhchung@google.com
Subject: Re: [QUESTION] Is the ARM SMMU v3 implementation designed to always
 ignore SSID when SSID_VALID == 0?
Message-ID: <20260428090522.GA3048463@myrica>
References: <20260428073859.1502047-1-joonwonkang@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428073859.1502047-1-joonwonkang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_020519_427237_50DDE9C3 
X-CRM114-Status: GOOD (  18.27  )
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

Hi,

On Tue, Apr 28, 2026 at 07:38:59AM +0000, Joonwon Kang wrote:
> Hi team,
> 
> According to the ARM SMMU v3 spec, I believe that SSID should always be
> ignored when SSID_VALID == 0 and the current ARM SMMU v3 module
> implementation in the kernel seems to comply with this without exception.
> For example, when handling an event from SMMU, the implementation checks
> SSID_VALID(SSV) first and ignores SSID accordingly. If there is any
> exception to this rule, I believe it is a bug.

Indeed

> Is it true for all the current and future cases? In other words, is it
> **mandatory** that the ARM SMMU v3 implementation ignores SSID when
> SSID_VALID == 0? or there might be some cases where the implementation
> needs to refer to SSID even when SSID_VALID == 0?
> 
> Asking this question since our HW may not be able to clear SSID when
> SSID_VALID == 0 and so there might be some garbage value in SSID at some
> point of time(the HW will have a correct SSID when SSID_VALID == 1,
> though). If the ARM SMMU v3 implementation is to refer to that garbage
> value for any reason, the result would be devastating.

At least according to the architecture, SubstreamID is ignored when SSV=0.
The SMMU is allowed to propagate the garbage:

  7.3 Event record

  * SSV: The SubstreamID validity flag
    - 0: No SubstreamID was provided with the transaction and the SubstreamID field is UNKNOWN.

But the driver will ignore it.

Same for PRI queue but in that case the page request wouldn't have a PASID
TLP prefix.

Thanks,
Jean


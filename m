Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCCFCA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzf4zZ63/tGaHafryPPKYJGbQInWBHaZGO952W93MI0=; b=h4Oo3C7optZxiaqarDOEq7lqfo
	r93nNpJtVlNQkoxKKs7HbXMCPPX5hBUJqycxdTlf51srdHRMycRB2B31HVId2U7Va0/humUZQVhec
	Q6vFRo9zlvjMvWMNzUff3RBK7WQtCKmNiLv32sK+zunRuvKttBLLDlrv/ujESTiOuymNGwenJVZR4
	52N2teDG1RPQZXRbPjQZNP8N6fAR5Lvx0u7LazVtRfd2J3MccNGQtq2JeEsKdBhZZ80fjoB1e5zcw
	LjIFIK/Nd6GDcLp8YsXD+llgi5xgPSd3Z/eRR5E2wkXTcrfKwrsWNLznY4lkZTkHuQI4cL696xJbt
	LiYxp2ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsDQ-00000005pdE-17Ek;
	Wed, 30 Sep 2026 11:11:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsDM-00000005pcS-2zfs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:11:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D00E8497;
	Wed, 30 Sep 2026 04:11:01 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 758023F86F;
	Wed, 30 Sep 2026 04:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790766665; bh=09jEaArNS417em6ToBSG7qdKHqccds8/fy4zdxtvQ3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hMLeo9c82Gy/Wy2abm9knjbpZVruD+1wc6Ju/TC06SrUV3zQ98jhitLXZDTDvGcac
	 EE7y27oqCNqxVVzA+ROY4AN/V1t2c2Loi/j9tft1p/a1u1uN7sSenO1pHVWXx9svge
	 PndYOaEjhnAao/piuhts7nsxFTeV7QEAR4LEVfW0=
Date: Wed, 30 Sep 2026 12:10:51 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v20 3/9] firmware: arm_rmm: Configure the RMM with the
 host's page size
Message-ID: <arzuKMam8IJkjB7T@arm.com>
References: <20260929221623.1342076-1-suzuki.poulose@arm.com>
 <20260929221623.1342076-4-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929221623.1342076-4-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_041108_880297_4BB43926 
X-CRM114-Status: UNSURE (   8.44  )
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

On Tue, Sep 29, 2026 at 11:16:17PM +0100, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> RMM v2.0 brings the ability to set the RMM's granule size. Check the
> feature registers and configure the RMM so that it matches the host's
> page size. This means that operations can be done with a granularity
> equal to PAGE_SIZE.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>


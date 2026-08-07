Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F537C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWIbOMIabvh2FRV3LwVofPmulwegsTKvsyc2dTa2OuU=; b=PCA5DNV5kT5wxRJrvzZukXCR3K
	7oQ3mUcINIEPISqNBry+olEQRxMHZOh5sSpice/dEnyV+Wxz4VFQwX15aAPrgQuPH2F2qb/JqDI2g
	jRrgQlIhkjELo14TxYw0qD5lATEg3LXFTkzaXiLNEUOLtmRCqrDz1G2IaSz37o4CnoIAwNNsfejw5
	9126JgwLz2uAQmOcgkS0k/47Vd0bFnB2vWteE6yT2TIVNyXyBZGoIDYd69tNSPGUJG58pSbH1SODR
	kfjCh0TysfeIgiSJV87nOYVjvQaN3mbS5nuTXh29RCbjbEL07UYAe1ViFhtANjHZ2k8ssPNnR5R8S
	za7ZpQsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNr4-00000008U9r-11Rp;
	Fri, 07 Aug 2026 16:55:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNr2-00000008U9Y-01zL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:55:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 227AB1516;
	Fri,  7 Aug 2026 09:55:21 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 937A23F9A2;
	Fri,  7 Aug 2026 09:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786121725; bh=ocxdMUJvDaa1h9TOR1Asprph0tJoS9L74P7zEU+jrf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WCvUPegGsA6lD2HKnUy6cU1uE2kJ3giH6Qmh+KRLtT53CH+OMVUJx8c/uSF4nMFwR
	 PwgaTc96uHHQyUqNeJaHd79zLJQcqq9GNwvY0x99GAU27bCeMQWNfNRaymXyaqUoyD
	 alBv5bOrjdzld6pPlUxr3zSrinCgcPvqcO+VzMVQ=
Date: Fri, 7 Aug 2026 17:55:17 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Qinxin Xia <xiaqinxin@huawei.com>
Cc: will@kernel.org, anshuman.khandual@arm.com, BenNiu@meta.com,
	robin.murphy@arm.com, xiqi2@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxarm@huawei.com, wangzhou1@hisilicon.com, sunnanyong@huawei.com,
	prime.zeng@hisilicon.com
Subject: Re: [PATCH] arm64: uaccess: Optimize copy_to/from_user with LSUI
 extension
Message-ID: <anYN9ei0W6FyClcF@arm.com>
References: <20260805035251.2813306-1-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805035251.2813306-1-xiaqinxin@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_095532_142480_F5E433ED 
X-CRM114-Status: UNSURE (   7.86  )
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

On Wed, Aug 05, 2026 at 11:52:51AM +0800, Qinxin Xia wrote:
> Add support for the ARMv9.6/LSUI (Load/Store Unprivileged Immediate)
> extension to optimize copy_from_user operations. The implementation
> uses the alternative mechanism to select between the standard unprivileged
> load-pair sequence and the new ldtp/sttp instruction at runtime based on
> hardware capability.

That's all good but do you have any numbers to back the change up?

-- 
Catalin


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4A0CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 18:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PEqqMkQCCsIIK80US5++EkJbtoh1psej63veCBFsh0=; b=mIebumGSpcao1b1NJCmJ3WcIEy
	06s2CZkFEbEncUmtV0T0E+ZOUt1nZw1rweYeHbrXCPy2Gbs58uke8DGCs5AXqFIbV1A67RWd3Wt4q
	YFrrLcJ1TliP/LY/XdTxVXWdbR/4TSCGmDlfh9mj+XWw2UvDBYdW/302N7IWHkusMT+PcOWM5VEca
	RUwx+7a5+H3/QkuagxEDdEFT7nVcLtg34WSLPBjaOfXvuYIH2rx3/S1wRmJ6R8lhh2BR1S9qz25gl
	SJbhSRMdMlsXIcdatnupw0taPT7z7Kg1aXTXIV1VvW67V7A9rdviF6yQ4ZheNW1cHE5pjW5t7tweU
	g9IWNhiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwm1H-00000004jLf-0b3E;
	Thu, 11 Sep 2025 18:27:43 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwm1E-00000004jK4-2a9e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 18:27:42 +0000
Date: Thu, 11 Sep 2025 11:27:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757615256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1PEqqMkQCCsIIK80US5++EkJbtoh1psej63veCBFsh0=;
	b=m66MoVbHAakOQHxhknbRV0aEtrzLIl0zCY5MZnXw/n2GB/8mMD2z8KI6sr7j6Zg2VMz5fZ
	LrEYbqoS2fE1sJyLz+JwXmPOOsVm1xe52j/yNKp+vJUnkU92KRcLd/H0qB2d1zMQk7NV3/
	0LIJakGffNrD7vjzin8Tacb4DAiuocM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Jack Thomson <jackabt.amazon@gmail.com>
Cc: maz@kernel.org, pbonzini@redhat.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	isaku.yamahata@intel.com, roypat@amazon.co.uk,
	kalyazin@amazon.co.uk, jackabt@amazon.com
Subject: Re: [PATCH 1/6] KVM: arm64: Add __gmem_abort and __user_mem_abort
Message-ID: <aMMUiyPLd1-_-V5p@linux.dev>
References: <20250911134648.58945-1-jackabt.amazon@gmail.com>
 <20250911134648.58945-2-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911134648.58945-2-jackabt.amazon@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_112740_875951_ECD238BE 
X-CRM114-Status: UNSURE (   8.60  )
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

Hi Jack,

On Thu, Sep 11, 2025 at 02:46:43PM +0100, Jack Thomson wrote:
> From: Jack Thomson <jackabt@amazon.com>
> 
> Adding __gmem_abort and __user_mem_abort that preserve -EAGAIN results.
> These will be used by the pre-fault implementation which needs to retry
> on -EAGAIN.

-EAGAIN is a pretty clear signal that another vCPU has faulted on this
memory and is in the middle of installing a mapping. Why bother with
retrying?

If we conceptually treat this thing as a synthetic stage-2 abort then it
should use the same EAGAIN handling as a literal stage-2 abort.

Thanks,
Oliver


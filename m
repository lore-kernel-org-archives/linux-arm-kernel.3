Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1634CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 11:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBA5F2MX5PJ588HxwRUG/djST6rI9CtKAxrkr99crco=; b=AVc7xXFvTJT4tIxfB8vDF1BFnl
	QhXHZCEeAINmfweBFLPyxicXjTGtisZbk27nJQabrXwjwUMG28raJbiVTKNmgO2GBqwWhMUZrAP4G
	fmlca6KsHt4tgk5sfocuInLP6fYBqPx+PIXoY03WHBY1vsmfoqogreqWOyN9i5NpMv2NzvxPJrOKT
	AuSoPooQnyKRL4MT1nIBGsbBIDLEnU4F7saQgeQ3j1XvBFg3UUFL+3/F4XGcI5OExnz4UEk0IVxc6
	U0myqvffYPIx3VvHynXHx5Enuaa1AOyphsj30nT8eGBB8u0rvY0RUBnnkgenPNEZj2eH94xwD0sNJ
	Hr/iZQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsLc-00000009h4D-2sSs;
	Mon, 03 Nov 2025 11:03:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsLa-00000009h3b-2vre
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 11:03:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D43C31D13;
	Mon,  3 Nov 2025 03:03:27 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F63A3F63F;
	Mon,  3 Nov 2025 03:03:35 -0800 (PST)
Date: Mon, 3 Nov 2025 11:03:33 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 05/11] coresight: etm4x: Ensure context
 synchronization is not ignored
Message-ID: <20251103110333.GV281971@e132581.arm.com>
References: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
 <20251024-arm_coresight_power_management_fix-v4-5-690e69ae6977@arm.com>
 <503e673c-441b-46dc-89d0-fb54ac81ec60@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <503e673c-441b-46dc-89d0-fb54ac81ec60@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_030338_781085_22B87F0A 
X-CRM114-Status: GOOD (  13.69  )
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

On Mon, Oct 27, 2025 at 09:49:39AM +0000, Suzuki Kuruppassery Poulose wrote:
> On 24/10/2025 17:45, Leo Yan wrote:
> > As recommended in section 4.3.7 "Synchronization of register updates" of
> > ARM IHI0064H.b, a self-hosted trace analyzer should always executes an
> > ISB instruction after programming the trace unit registers.
> > 
> > An ISB works as a context synchronization event; a DSB is not required.
> > Removes the redundant barrier in the enabling flow.
> 
> It is required for MMIO based instances and must be retained.

Sorry I did not give details in commit log so caused confusion (and
thanks a lot for Levi's supplement info!)

I will amend in next spin.

> > The ISB was placed at the end of the enable and disable functions.
> > However, this does not guarantee a context synchronization event in the
> > calling code, which may speculatively execute across function
> > boundaries.
> 
> It is not allowed to commit though, right ? I don't think this change
> is required TBH.

Correct, I will drop this part.

Thanks,
Leo


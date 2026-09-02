Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72445C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 08:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnMfmcaiZJa+ELlCbq86o0tGJpfC/SXwsldk9tlQyWY=; b=kOkqCYuV1Th9fc8NpoQhqrVMfb
	cKF0n89exHIIOkBdXjvmwOdeLQRNNO1rVLfFyIgTOtZgQgKFapcc4L2ZN1RM2wDS5KkFWZmXrUNuz
	ApJ8EsLlM45uFrTCDkJN/q+kQhIS08kImrhVVsn+1BPFBfTWqAi9YlZrgG4NOBvp8Gm7iA2/SyJnP
	/VnZiGdiPfn5LtBgcuESq0Duo3hs2TQEEYcQpA5i+KvSUG7Md8gPEVbdBEwkYjmzVeswFk0o1ehJe
	ipWcXplijJH/Kxb01gcYLMiSNAH38q7ZomNRtOxNyervoz2QH/dgOUOQCxM41moulMKGuPaYrR3Cl
	SYi2qfNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gbJ-0000000E8gV-31xT;
	Wed, 02 Sep 2026 08:45:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gbG-0000000E8fE-2mYx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 08:45:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1F991596;
	Wed,  2 Sep 2026 01:45:36 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F83A3F882;
	Wed,  2 Sep 2026 01:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788338740; bh=XucUdvkzablK28p8Ekz0QJOW6saMEkHDPRLu4xhDzLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q2oP2/Oy5BkQaL0ueJtKDfAO1cuQovtrko/2IhZSgcbPqxMVkPhEL2CmuThOfRamz
	 OmlzENP30MnKlPSZHxQYsfT/xWxdKbfhoJJNSQizr9QKaL2Mf9hqR5KJUgAV09sS8M
	 PlNc5OaGF/e3NiPxdt/eaGg0XVEGfe0m0+iUbyZQ=
Date: Wed, 2 Sep 2026 09:45:38 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Richard Cheng <icheng@nvidia.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: fix trace ID search skipping pass-through NoC
 devices
Message-ID: <20260902084538.GU8904@e132581.arm.com>
References: <20260817-fix-trace-id-assign-issue-v1-1-b2164e33f9fa@oss.qualcomm.com>
 <20260902082209.GT8904@e132581.arm.com>
 <28d5c8bf-87b1-4172-94a8-0e1b7ba1f083@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28d5c8bf-87b1-4172-94a8-0e1b7ba1f083@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_014542_767170_F72CADB5 
X-CRM114-Status: GOOD (  14.43  )
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

On Wed, Sep 02, 2026 at 04:35:11PM +0800, Jie Gan wrote:

[...]

> Hi Leo,
> 
> Thanks for the suggestion.

You're welcome!

> I will fix this in the TNOC driver. I agree that there is no need to use
> additional error codes to report the failure.
> 
> I will post the new fix patch after below patch[1] to be applied to avoid
> conflict.

The patch in the link has no fix tag, but current patch is a simple fix.
I'd suggest to give priority this patch - this is friendly for porting
to stable kernels.

If there have dependency (based on your local test), you could explictly
mention the dependency in cover letter and resend the tnoc probe series.

Thanks,
Leo

> [1] https://lore.kernel.org/all/20260710-fix-tracenoc-probe-issue-v6-2-41eb36fef8d9@oss.qualcomm.com/


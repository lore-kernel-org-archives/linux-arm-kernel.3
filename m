Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0559CE81BA6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 11:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKJFxLZkHFz6xo4aR99OQYoBm+xYOoXZYwDZz+xwYUY=; b=bBhnA9zUXj5bxdl9cmrMZnzlTB
	hV+3djFGb3MXkujZcccRunwKPItphmAZM2aKCXABROJj062/5uLMF4DVYDEXaXbOraooVYdYMUts2
	bMNHJSzrFTuFjp2VNYyrP3mnouLoAyonvDBWfLEpnZ1X78p/uXJBBQnOUq+TH4cl8rWI5UQK2inwb
	OjjzhLkdGHlz8kzLUT61DTYGW/HD/4+H0oP0SXAHer7RQTN0mIPGtNVawIP6Nza6PUHARbiVD7DDt
	of/IgM+a06+5nBMF0fwLPuMnAzmPIYU7VqnKo6PXYvUuVhp6CbLi0rmPixCLvf7fIo3l3AoUslv3n
	tm94aR1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPvT-0000000FKy6-0oJ6;
	Mon, 09 Feb 2026 11:59:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPvR-0000000FKxk-0p1q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 11:59:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E344339;
	Mon,  9 Feb 2026 03:59:24 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB9D73F63F;
	Mon,  9 Feb 2026 03:59:29 -0800 (PST)
Date: Mon, 9 Feb 2026 11:59:27 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Subject: Re: [PATCH v3 8/8] coresight: Unify error handling in
 coresight_register()
Message-ID: <20260209115927.GM3529712@e132581.arm.com>
References: <20260202-arm_coresight_refactor_dev_register-v3-0-03292470c48c@arm.com>
 <20260202-arm_coresight_refactor_dev_register-v3-8-03292470c48c@arm.com>
 <e451547b-15a7-4296-a5da-379640c141c7@linaro.org>
 <20260209112819.GL3529712@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209112819.GL3529712@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_035933_315131_062B0021 
X-CRM114-Status: GOOD (  16.58  )
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

On Mon, Feb 09, 2026 at 11:28:19AM +0000, Coresight ML wrote:

[...]

> > Probably a better way to clean this up would be to pull out a function for
> > all the stuff that needs to be locked and use guard(). Then do the stuff
> > that doesn't need to be locked after that function. Either way it doesn't
> > look wrong.
> 
> If so, although locking is not a concern, the device_register() failures
> still need to release platform data particularly.  That means we still
> need extra flag (or returned error) to indicate if it is a
> device_register() failure.
> 
> I understand we don't want multiple places for mutex release.  It is
> not bad to keep the "registered" flag and drop this patch.

Think again, I found we still need the refactor for the failure
from etm_perf_add_symlink_sink().  This can be unified to call
coresight_unregister() for error handling.

I will send a new series for review.

Thanks,
Leo


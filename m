Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBFCCD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1MHBgc/HftMNnpo3aSTC/H7e4PTrJtd0zERmMQdpuE=; b=xgqVA5ivZQyO0oIZQ1VbxzRQ/s
	SBQMhOR2Fa4XD/M6udD8unxuVhzMT7Athf7PrAtdEnm/0LYW8/5cD+bFG5Lpyo/WbTRaJzO2cpIjq
	b5vI/KbzrZhcWBXNPvWuyZIAbVS7VrSbD0tdTyU2IHxBPn3pJxihQ+QpIWGjrOFKZyBc7d0mQOoIo
	QaUwQwthkyIBFBxP5FjiEuFVTLbfMqXV9vixOTTic+slvOj3jPENryw+2ERH9xkRrxfE40F+asTVS
	SXQxATFLWWLkuWO0SGx1aHQPd9aXwOAFpCKWUQmO6eJ59plAOoU4YBz/biDnG6vkFvTxNGrgfxU0C
	ETiMnY1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN7a-0000000CyBr-44JB;
	Mon, 11 May 2026 09:40:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN7X-0000000CyAI-3eJ1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:40:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06B211477;
	Mon, 11 May 2026 02:40:07 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C57DA3F85F;
	Mon, 11 May 2026 02:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778492412; bh=Ot2eN4Rwr0wT4qQBvc2wpwtb/0xmY45GYo+XcTU/Kv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KgAHDhmDzkrEYH0oU60KumIz3pBVMD04jJMgUhwTIt1NjUP1hS1/xWYR46Toxxtpm
	 nuTXzSF/UyzLA65hANMUiJ7TqcL/VfAeooDfIGLlfA6FMmwt6BbMjD5kImxHSkc/BP
	 tcn18giVR+s0uhwNCg2fP5N5MEpYpIqN/PKJ67CQ=
Date: Mon, 11 May 2026 10:40:09 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
Subject: Re: [PATCH] coresight: fix source not disabled on idr_alloc_u32
 failure
Message-ID: <20260511094009.GK3778514@e132581.arm.com>
References: <20260511-fix-coresight-sysfs-enable-issue-v1-1-1b3829748171@oss.qualcomm.com>
 <20260511092446.GJ3778514@e132581.arm.com>
 <eefdc953-a127-41b9-afba-a07cf5d5734a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eefdc953-a127-41b9-afba-a07cf5d5734a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_024015_982930_57E0CDFB 
X-CRM114-Status: GOOD (  21.86  )
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

On Mon, May 11, 2026 at 05:28:37PM +0800, Jie Gan wrote:
> Hi Leo,
> 
> On 5/11/2026 5:24 PM, Leo Yan wrote:
> > On Mon, May 11, 2026 at 05:04:44PM +0800, Jie Gan wrote:
> > > In coresight_enable_sysfs(), for non-CPU sources (SOFTWARE, TPDM,
> > > OTHERS), the source device is enabled via coresight_enable_source_sysfs()
> > > before idr_alloc_u32() maps the path. If idr_alloc_u32() fails, the
> > > original code jumped directly to err_source, which only calls
> > > coresight_disable_path() and coresight_release_path(). The source device
> > > was left enabled with an incremented refcnt but no path tracked for it,
> > > leaving the device in an inconsistent state.
> > > 
> > > Disable the source before jumping to err_source so the enable and path
> > > operations are fully unwound.
> > > 
> > > Fixes: 1f5149c7751c ("coresight: Move all sysfs code to sysfs file")
> > > Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> > 
> > Actually I have noticed this. Since my PM series will remove IDR things,
> > and I don't think anyone really hit idr alloc error, this is why I
> > didn't send fix for this.
> > 
> > Anyway, this is a reasonable fix. I will send out my PM series later
> > in today, I will pick this patch into my series and rebase on it, hope
> > this is easier for all of us.
> 
> Well noted. Please feel free to pick it into your series.

Thanks! Just note, I updated the Fixes tag as:

  Fixes: 5c0016d7b343 ("coresight: core: Use IDR for non-cpu bound sources' paths.")

Which is the original patch for the issue.

Thanks,
Leo


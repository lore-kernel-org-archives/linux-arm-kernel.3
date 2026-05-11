Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CD5CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biNqaO/cPB7B+3qAYoDd7eYxSyC9gQSIpPoa9RR1jak=; b=x7tg0MYt8VWnl291Gxhaj2nquU
	OGdDybp7MF7lQY+vKuKvGHMEna4lbkEBQHCWkdOP+YV4bUMHxbMyOQkF/zQ1KJVksPmC9NHX6dg94
	IWt/MX8Hqc3tdxH3BXGZvScTq8Eq+Zwgp/H2/8cBu3wb3M/NG0xT5U/gWNoBOAEECL6WCvQGNIreC
	7A8iHUPWz5fDvBYO2Yzw2MG+JLEab0bKccY2yveK2s8E0ND7ePz2detUYkmsEpWTeV4WBL+44Spyi
	YqTlrLeJXGuGS6W4zRIndfrtWeqMlcrxSzp6BIu/1fA1iyJzeRKkwhO5TfiWlJ4aDrLcgcs/AZ4PU
	o0BH4YGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMsp-0000000Cue8-3E4N;
	Mon, 11 May 2026 09:25:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMsp-0000000Cue1-1VzV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 09:25:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=biNqaO/cPB7B+3qAYoDd7eYxSyC9gQSIpPoa9RR1jak=; b=AsT+yAm3uDx+5L+oTWagIhlqI+
	diMrnm83NiWo98w732dBY7Wi8j6EhtvCW2mQ4gFlnpwA3NaDvmyjeDbzs8iHFwULevt9UpkcWt+hC
	xxbV1t7i0OORzroT1Peylqbv0pfqYSsECk9Jr5gK8urnftcwS4nroqTkMA4uTnBiAk4TQ6Q/Zu6i7
	foOJrxGWjcWV40gzr4pnTS5tXN7TTprwbKvjiGhAb/HJSPydtxf4UsLlKS9Y81CFi3tsOmZDt0Vtq
	+1gRVZzDhj95w/QlJrwWvf8LN6g6eZdWF9GG3hmJwzHiidPmSrVInW8RHlNlTUSKqvtPFymEfbNEK
	bDPXFzyA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMse-0000000BAjC-0dxe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:25:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D81A616F8;
	Mon, 11 May 2026 02:24:43 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B87A13F85F;
	Mon, 11 May 2026 02:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778491489; bh=R//K3qLvK1Hfgvo+iGgdU2zldTl+EG+2tAuWFGUz9WA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tGyuMtV4ZwcQjQc0zCS1sZcGEReqwT5fdoqx3fZ0jAWci4+05uIVpbuEf2Q2R19Tp
	 Eqct+KBIPh37kk1OnzuU4jTUk2SoeUq5XyXoiQj2hIU1ksZy5D4StBwsXYygS5v90C
	 LO2eJIQN33YNm7zHCHpBgkKuToK74I6DwzQhNwm8=
Date: Mon, 11 May 2026 10:24:46 +0100
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
Message-ID: <20260511092446.GJ3778514@e132581.arm.com>
References: <20260511-fix-coresight-sysfs-enable-issue-v1-1-1b3829748171@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-fix-coresight-sysfs-enable-issue-v1-1-1b3829748171@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_102458_446126_2033BA50 
X-CRM114-Status: GOOD (  13.01  )
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

On Mon, May 11, 2026 at 05:04:44PM +0800, Jie Gan wrote:
> In coresight_enable_sysfs(), for non-CPU sources (SOFTWARE, TPDM,
> OTHERS), the source device is enabled via coresight_enable_source_sysfs()
> before idr_alloc_u32() maps the path. If idr_alloc_u32() fails, the
> original code jumped directly to err_source, which only calls
> coresight_disable_path() and coresight_release_path(). The source device
> was left enabled with an incremented refcnt but no path tracked for it,
> leaving the device in an inconsistent state.
> 
> Disable the source before jumping to err_source so the enable and path
> operations are fully unwound.
> 
> Fixes: 1f5149c7751c ("coresight: Move all sysfs code to sysfs file")
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>

Actually I have noticed this. Since my PM series will remove IDR things,
and I don't think anyone really hit idr alloc error, this is why I
didn't send fix for this.

Anyway, this is a reasonable fix. I will send out my PM series later
in today, I will pick this patch into my series and rebase on it, hope
this is easier for all of us.

Thanks,
Leo


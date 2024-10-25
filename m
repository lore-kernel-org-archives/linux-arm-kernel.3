Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA5AD0C614
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdC4PJ5yd7wPvkDpySojQe+7tRyIWDMOHosdUSqidjw=; b=4PJbVgNPIwHdSykptiNUL8dAQF
	LSkbc0W1wP4boGzvIfntTGNAdtg1GiXgVRQSzJymaxXbqVwrkaKw906QJcv0z7OLH9ikYQkOTI9QK
	4sMZyTgrYzqvdhdhQkEO0oID5DJ0UpF+ARQ7ZU/nD2Hj5VWhtVQk5bYo0fbxnqmohPhdDvDSXwKO7
	Y5ezcN2aV2FpHkB3k5Q8rAlo1AWJJNW5rMXSr8xgOFH/sDz89nfJl/7cFcm9oEm4zYrtSz6MAgfUt
	8+t11XcmUPNYI8cHfF8wiZy7gFGuXUCcdLafZm1h1Lvki6mdykpkuAzsmA4/du9yhvAMJu0RzVZLd
	1tA1qAbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LG2-000000040Xd-1Quo;
	Fri, 25 Oct 2024 14:25:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4L2G-00000003wuq-33Zd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:11:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7295DA42FE4;
	Fri, 25 Oct 2024 14:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6715DC4CECD;
	Fri, 25 Oct 2024 14:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729865487;
	bh=tm/4vbtNtiaS+JdouNTCc5kuz8nO0+9LkJM0qC0F/Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffoGoGQxMqOHARMij0z0esj2E8EIeq3uVhHrdWRL2rYrbRBbAE9poea1iWcK1mVlP
	 zVDTpfCk16r8QwbjjgLFvHIgnameRLBgtyW2bJvFi6VSaX2UpLzl9X7mbNyW4Xhd0x
	 48VUlnWCz8z5qgENba1KwQBli/aAyvigMf+W6eQrEHl/M9kBdXRuPhOOucVBN2/W8W
	 0Lq65v9kkQA7U2Wd8Gm1K9Z9hnp2Ky31mCwwUEqzFvLJMws9AZcvh/kGJ7wWonM1JA
	 hWlg2dXPCOfppHzM31hZjNPADbff5oPzTRkqArvmei3BmOH8lTSM8aHbHL0Quo+Y3u
	 I6QG6IUgy+plA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t4L2X-000000006JC-32je;
	Fri, 25 Oct 2024 16:11:45 +0200
Date: Fri, 25 Oct 2024 16:11:45 +0200
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, ulf.hansson@linaro.org,
	jassisinghbrar@gmail.com, dmitry.baryshkov@linaro.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org, linux-pm@vger.kernel.org,
	tstrudel@google.com, rafael@kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH V4 3/4] pmdomain: core: Fix debugfs node creation failure
Message-ID: <ZxunIcSZDoO3ph64@hovoldconsulting.com>
References: <20241023102148.1698910-1-quic_sibis@quicinc.com>
 <20241023102148.1698910-4-quic_sibis@quicinc.com>
 <ZxuixxBzQZUdIW1c@hovoldconsulting.com>
 <72a0b7b5-4209-f969-0726-e411b5a74e01@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72a0b7b5-4209-f969-0726-e411b5a74e01@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_071129_192282_829F53D2 
X-CRM114-Status: GOOD (  10.54  )
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

On Fri, Oct 25, 2024 at 07:36:16PM +0530, Sibi Sankar wrote:
> On 10/25/24 19:23, Johan Hovold wrote:

> > Also seems to do the trick:
> > 
> > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > 
> > But perhaps you could consider starting enumerating the duplicate
> > domains from 2 (or 1) instead of 0?:
> > 
> > NCC_1                           on                              0
> > NCC_0                           on                              0
> > NCC                             on                              0
> 
> We are just trying to make sure node names are unique and
> can't ensure the pd-name correctness since ida starts its
> number generation from 0 and I didn't want to shape the
> fix just to cater to our specific case. The firmware fix
> will be in charge of ensuring pd-name correctness.

Ah, it's a global number space? I didn't really look at the
implementation...

Johan


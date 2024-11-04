Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2424BD132D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvuwqUXmkGB2i+vWsm6wuvusM4HsL1YuJMz+FW0hMnY=; b=sG2++RFb1T6pTZcKEi2N9o8OUA
	OxM6nMC5pNs9QC5hRInycfDNql3w9djhiwdQkLOJ85nbV4KyB4d7WCL8nmCwseHWrUwZNzT3qfchp
	S41cq3klQz9DIYAFjilugtNZhUVqxAbTVBdFrBbHsljhX1GjTgeMnJsSYVFBFALQzw+vUKo8AoFgN
	Ex7+S7H2cFimmaD6wynzmcUXKgTRNJ5S68pA+PNnr2yS/nypJPy5yDsOH8QIR2FyuI1xHQSMV/lAE
	QKjr9+2DlQwkEC+W8QWKbmQgqhpJXKKQQGJ0trSVQ1nqxCfDnyYHJ0DnXWOqtpgca5uxc89c4nHDt
	dVMqltBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yHB-0000000E5n6-1n4m;
	Mon, 04 Nov 2024 14:41:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xlb-0000000Dzr1-43mQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 14:09:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6460A5C4C90;
	Mon,  4 Nov 2024 14:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BC2C4CED1;
	Mon,  4 Nov 2024 14:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730729354;
	bh=65OFDvUsjvE7rt/DlU7JuIUhbpB5mDQ8n6OdH0qeDdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K6IxGyA5/Q/v4wvgVx/3Dw5iJbz7au6BOTy3Lu+rzx2ltxMP6fU65t2dyxmWM2z5l
	 GWd3spdQxqRpZ4D1FJgkdK4MqdY/Ev4CRNKhaegnblnbgZdrp2V8EdzDysSWNXbuwL
	 f/JIx0La64PUWPZgjHArkAm7GN3cBnOu81QIXNUJEF7BWzQs9a6Z4h4ZZTfzVQ6qk3
	 N/NhzyE6jPvs2rbK/cH618vIkEwWYDHnGJh66ZnnBK2yg9+mjEF8+Ymp7eDrXxz3O/
	 2D0R/QoX0e6PptFFVAIsj0sG4cENQlcg1O4irSGrfgr041SyD0v18GvTlEwznGeaFj
	 bpHX3ZeBYtUqg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t7xlY-000000007gd-0i2h;
	Mon, 04 Nov 2024 15:09:12 +0100
Date: Mon, 4 Nov 2024 15:09:12 +0100
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, ulf.hansson@linaro.org,
	jassisinghbrar@gmail.com, dmitry.baryshkov@linaro.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org, linux-pm@vger.kernel.org,
	tstrudel@google.com, rafael@kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH V5 3/6] firmware: arm_scmi: Report duplicate opps as
 firmware bugs
Message-ID: <ZyjViCVtPwe-tmMq@hovoldconsulting.com>
References: <20241030125512.2884761-1-quic_sibis@quicinc.com>
 <20241030125512.2884761-4-quic_sibis@quicinc.com>
 <ZyThAFbOHKaBIgLg@hovoldconsulting.com>
 <e173058b-57e7-7fd0-dab7-7398bf9d66ec@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e173058b-57e7-7fd0-dab7-7398bf9d66ec@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_060916_086052_6DB74D8F 
X-CRM114-Status: GOOD (  17.11  )
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

On Mon, Nov 04, 2024 at 07:20:01PM +0530, Sibi Sankar wrote:
> On 11/1/24 19:39, Johan Hovold wrote:
> > On Wed, Oct 30, 2024 at 06:25:09PM +0530, Sibi Sankar wrote:

> >> @@ -387,7 +387,7 @@ process_response_opp(struct device *dev, struct perf_dom_info *dom,
> >>   
> >>   	ret = xa_insert(&dom->opps_by_lvl, opp->perf, opp, GFP_KERNEL);
> >>   	if (ret) {
> >> -		dev_warn(dev, "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
> >> +		dev_info(dev, FW_BUG "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
> >>   			 opp->perf, dom->info.name, ret);
> > 
> > I was hoping you could make the error message a bit more informative as
> > well, for example, by saying that a duplicate opp level was ignored:
> > 
> > 	arm-scmi arm-scmi.0.auto: [Firmware Bug]: Ignoring duplicate OPP 3417600 for NCC
> 
> I did think about doing something similar but xa_insert can fail
> with both -EXIST (duplicate) and -ENOMEM, so the we can't really
> use term duplicate when insert fails. I can add the perf level
> though to the message though.

We generally don't log errors for memory allocation failures (e.g. as
that would already have been taken care of by the allocators, if that is
the source of the -ENOMEM).

But either way you should be able to check the errno to determine if
this is due to a duplicate entry or not.

Johan


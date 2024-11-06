Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C34BD29FAF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 07:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgX+jABpEDgVJ7y+ku8zSISZJzTyTpboJWYdMW1CPxA=; b=cyOySHKq84bqLMcGKMlgtKYLM/
	Vee6kGfRg8gMx1kyycUMvYUNgWvyc360ex4sm7Nc4STkk3fYN0ARz+bSIsqlzZr2vL//mPmgzhsze
	2sFBPHNKounTy/EDr7eMr1jHQm5EY28GVUhG2JLF7rkwP3TzwYLp+se3Dj/riYGACvJjrFuSnCKZA
	sZQPm3PrMggCjYIZAxpng8E07vBmTZZkFuy43gv1FbVHWcpah1msBAyeHy775fP4NmhTcF9JSav/+
	Ew+ipCIltPh8cI578aay9vuKYZgfj8u5FOTrNNr0gz2mgUJSDE7K80arUTz/qCVvbOloF66cOsHzP
	P9j3kCag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8aMm-0000000264Q-0Rrc;
	Wed, 06 Nov 2024 07:22:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8aL3-000000025qn-3VD4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 07:20:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70CE11063;
	Tue,  5 Nov 2024 23:20:54 -0800 (PST)
Received: from bogus (unknown [10.57.64.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9C3A3F66E;
	Tue,  5 Nov 2024 23:20:16 -0800 (PST)
Date: Wed, 6 Nov 2024 07:20:01 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, cristian.marussi@arm.com,
	ulf.hansson@linaro.org, jassisinghbrar@gmail.com,
	dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, konradybcio@kernel.org,
	linux-pm@vger.kernel.org, tstrudel@google.com, rafael@kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH V5 3/6] firmware: arm_scmi: Report duplicate opps as
 firmware bugs
Message-ID: <20241106072001.5jrbbctj7ud5uaxd@bogus>
References: <20241030125512.2884761-1-quic_sibis@quicinc.com>
 <20241030125512.2884761-4-quic_sibis@quicinc.com>
 <ZyThAFbOHKaBIgLg@hovoldconsulting.com>
 <e173058b-57e7-7fd0-dab7-7398bf9d66ec@quicinc.com>
 <ZyjViCVtPwe-tmMq@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyjViCVtPwe-tmMq@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_232025_969221_6031F366 
X-CRM114-Status: GOOD (  23.49  )
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

On Mon, Nov 04, 2024 at 03:09:12PM +0100, Johan Hovold wrote:
> On Mon, Nov 04, 2024 at 07:20:01PM +0530, Sibi Sankar wrote:
> > On 11/1/24 19:39, Johan Hovold wrote:
> > > On Wed, Oct 30, 2024 at 06:25:09PM +0530, Sibi Sankar wrote:
> 
> > >> @@ -387,7 +387,7 @@ process_response_opp(struct device *dev, struct perf_dom_info *dom,
> > >>   
> > >>   	ret = xa_insert(&dom->opps_by_lvl, opp->perf, opp, GFP_KERNEL);
> > >>   	if (ret) {
> > >> -		dev_warn(dev, "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
> > >> +		dev_info(dev, FW_BUG "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
> > >>   			 opp->perf, dom->info.name, ret);
> > > 
> > > I was hoping you could make the error message a bit more informative as
> > > well, for example, by saying that a duplicate opp level was ignored:
> > > 
> > > 	arm-scmi arm-scmi.0.auto: [Firmware Bug]: Ignoring duplicate OPP 3417600 for NCC
> > 
> > I did think about doing something similar but xa_insert can fail
> > with both -EXIST (duplicate) and -ENOMEM, so the we can't really
> > use term duplicate when insert fails. I can add the perf level
> > though to the message though.
> 
> We generally don't log errors for memory allocation failures (e.g. as
> that would already have been taken care of by the allocators, if that is
> the source of the -ENOMEM).
> 
> But either way you should be able to check the errno to determine if
> this is due to a duplicate entry or not.

Everyone has valid reasons for their argument here, so we need to find
a safe middle ground. Will stating it as [Possible Firmware Bug] be any
useful ? If there is -ENOMEM, other error messages will be seen before
this and user can ignore this error until that memory issue is fixed ?

-- 
Regards,
Sudeep


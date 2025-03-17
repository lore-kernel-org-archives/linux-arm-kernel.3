Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507E2C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 18:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wisE1E0m0Tt6AlZMGeAlpoHq0nK3KnMLSI9efK5urE=; b=tv4VGtVzk+nzRB0Z+sN18QAnG5
	ZjsvKqvKtAuCzI4mzyn+DE/fnCb0hGrN9FXgKUtRnPrwGW++0l0542p8QLV3oJs8L4eQc6Wzme/BX
	RFcZz1niTrAk3ULTWcS6cRrjQEss7t/lqKsFOX4TT1v2tD50ZD51wZQobg/9LNzKRbtTcqIAaL2Ua
	Jt3FpZ+WiZwkFPUs/gd9s9AWAdbXzMzbVtk7UkuSuN3Mw/VQ9Uyx5XH5PmaJfEO2EQ1PzXN9vCHco
	d+w4LTyM2WlI5wVorF+6v9gMAvfo9BDcbeH7KokuJOZqcKFTynoJ+oPfreThnvnlryvt0SEMOzEoA
	He36iQhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEyL-00000003egC-0PUN;
	Mon, 17 Mar 2025 18:13:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEua-00000003dyf-1ZYM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Mar 2025 18:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1wisE1E0m0Tt6AlZMGeAlpoHq0nK3KnMLSI9efK5urE=; b=ZaQzD8kgF3To9zvma6I2iXHmkr
	nOPMpqT47S69wojNrZNFA3nOA7OHUjlEvGk/kecNw4OaWZlueooSZpZylsG/7DQ1FhP8KY0JdqP40
	Z2vJJ2FIfWkuH5QyYQKxQN1NeKy958J0JUKyYVukHCNXyTN3K/fhkCCdJbR7zWgXEfT6YDi0+Q3x5
	ZGum/KwnUWED13b/aN6jKLBuvnocgA7Nt/UFYg4qlMvOUdp9TWB3zpghLZkKfjB9xz6Pi7K76uBuu
	IjVROOk1OLfwRTfN8SpCcjb3Lre7mxdQQz/fBp0yOqakHRaruPwS5giObOQSwK1DjNdRboqg7KsFi
	8pQiHgOQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEuV-00000003Y4p-2LDR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 18:10:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9974313D5;
	Mon, 17 Mar 2025 11:09:58 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60AA13F63F;
	Mon, 17 Mar 2025 11:09:49 -0700 (PDT)
Date: Mon, 17 Mar 2025 18:09:45 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: lcherian@marvell.com, coresight@lists.linaro.org,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 5/7] coresight: Clear self hosted claim tag on probe
Message-ID: <20250317180945.GK2487211@e132581.arm.com>
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-6-james.clark@linaro.org>
 <20250313160409.GS9682@e132581.arm.com>
 <6be400e2-a464-4714-acf4-328dade883a9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6be400e2-a464-4714-acf4-328dade883a9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_180959_871616_40322A23 
X-CRM114-Status: GOOD (  20.80  )
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

On Mon, Mar 17, 2025 at 03:05:41PM +0000, James Clark wrote:

[...]

> > >   /*
> > > - * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
> > > + * Clear the claim tag for the device.
> > > + * Returns an error if the device wasn't already claimed.
> > > + */
> > > +int coresight_reset_claim(struct csdev_access *csa)
> > > +{
> > > +       int ret;
> > > +
> > > +       CS_UNLOCK(csa->base);
> > > +       ret = coresight_reset_claim_unlocked(csa);
> > > +       CS_LOCK(csa->base);
> > > +       return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(coresight_reset_claim);
> > 
> > Maybe my question is overlapping with Mike's comment.
> > 
> > Callers never check the return values from coresight_reset_claim(). I am
> 
> I can remove the return value if it's confusing. The thought process was
> probably that it could be useful somewhere in the future, and
> coresight_reset_claim_unlocked() returns something anyway so might as well
> pass it up.
> 
> > wandering if coresight_reset_claim() can directly call
> > coresight_clear_self_claim_tag() for _trying_ to clear self-host tag in
> > probe phase. Any self claim tag issues will be deferred to detect until
> > enable the component.
> > 
> 
> Maybe, the spec does a read before setting which I assumed should be done
> for clearing as well.

If you mean PSCI doc, the flow for claiming tag is a handshake between
self-host software and external debugger, this is why a read is
required.

For a cleaning up, it is not about syncing with external debugger.  And
writing bit 0 to TRCCLAIMCLR will not impact external debugger.  So I
don't think a read prior to cleaning self claim tag is needed.

> As in to not touch anything if it's in use externally.
> It doesn't specifically describe any clearing sequence, but if we assume
> it's ok to blindly clear self hosted flag even when it's in use then yes we
> can directly call coresight_clear_self_claim_tag().

As a result, directly calling coresight_clear_self_claim_tag() works
for me.

Thanks,
Leo


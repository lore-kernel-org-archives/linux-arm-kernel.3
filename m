Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356EAD5B17D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 09:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PONhqlcIJpgiT/8yjEn8p+V/NNol1lphZRps67WnUO8=; b=kNvElmfW1qFNYr8CxymY825Vtd
	YEnnCwCZCtHcHTehlvnsdnqMbj7HyESXZJ8lG/fUqvpkGGJLGe4k2m7ceWsau1ZZG0w/H65O2LRJ8
	B+2BN8kskzF+Nfonx/NdiVDovg0b4sN/dYljgvLjcfpNqqEKr/mwiMSn/s1LkR8HgmFWjR4ky3eNS
	y9lK7gSom74+2IXbXyU2+LbfdeaQWUWPG09xPmTnQADWLBWpqdNB8n5EjknR5iFhC6nQLvReEvn8x
	IeZlltoiOlg4Owz9ei4k3pWVtxgRV9HgGYQoK8sEUZPTby8vead1s5xMzvRPCLaq9XbsqPDdi0WLP
	iV/8orQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t655d-0000000HP2C-0CYv;
	Wed, 30 Oct 2024 09:34:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t653y-0000000HOlv-42pu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 09:32:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A818113E;
	Wed, 30 Oct 2024 02:32:54 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFBDE3F66E;
	Wed, 30 Oct 2024 02:32:21 -0700 (PDT)
Date: Wed, 30 Oct 2024 09:32:14 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org,
	viresh.kumar@linaro.org, morten.rasmussen@arm.com,
	dietmar.eggemann@arm.com, lukasz.luba@arm.com,
	pierre.gondois@arm.com, vincent.guittot@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_mdtipton@quicinc.com,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V5 1/1] cpufreq: scmi: Register for limit change
 notifications
Message-ID: <ZyH9HvKmYjlJC8_x@pluto>
References: <20240603192654.2167620-1-quic_sibis@quicinc.com>
 <20240603192654.2167620-2-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603192654.2167620-2-quic_sibis@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_023227_065927_C656B803 
X-CRM114-Status: UNSURE (   8.10  )
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

On Tue, Jun 04, 2024 at 12:56:54AM +0530, Sibi Sankar wrote:
> Register for limit change notifications if supported and use the throttled
> frequency from the notification to apply HW pressure.
> 

This sort of got lost in mbox...apologies.

As discussed offlist, the issue with cpufreq and multiple SCMI instances
remains BUT it will be solved later on with a different approach, so
as of now this LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

P.S.: have you got any chance to try the hack/experimental patch I CCed
you to address the multi/instance cpufreq issues ? (just to understand
if it is a viable option...)


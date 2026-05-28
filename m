Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA4DCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 18:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hD2Z6wqk6w2a1UgnCrMYTDZU+8UOETAKV7OKas5np+Q=; b=X2PpJpzfIBvnjpc5NofCDrM5P2
	IaXgqDeQdBqnTSa8KafXzw2PnOjhFgGco3esRdxbFbv6Onf/fQg0g0JAV1QBRZY6hoAEnEgSdvTOl
	nt431g7PeDtJiNglZDR1GYrJFlDXD2bFrxTpJn9pk4rr+95yhi6SacRRh+mYLSXwMjQRxrOnTBJG6
	s0tBW68S/yti0BvbLeXVcvr8EMx9mZGqM2bjGu1QTPZwx+Mg+WK8OIJ4NrZTadlvDkhCyvQJ/6SQ/
	i/KMfwRrTety+Ltm5ghshfbvzvkbdBQZ+SKG+xRVGPWpuptl8Y4QkEB6bio0pWmEYCNq1rCCoUZN2
	/oJAhFJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSf32-000000069iO-0DgR;
	Thu, 28 May 2026 18:01:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSf2z-000000069i1-24XP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 18:01:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E07A22C8;
	Thu, 28 May 2026 11:01:27 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A61043F632;
	Thu, 28 May 2026 11:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779991292; bh=y36QqDCCRxFgAritP62khWPWor0UF35crmcLFibL7iQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iOg36/k7zSaeOW5PVb7Uxmwxz4ZiPGmRKjNNt0ewIbINCWRHrwEpoznt+aX2/9nks
	 v9F8zQdmm/3oEzcXO8LtkdiUwQi53Ap20DNGlI6o9/AsyqK7QDL3c4Ig1X8JCIxiQT
	 0TO12Yw/kzwLocebq0HrHUqCUT+VnZ29HtlzOeOY=
Date: Thu, 28 May 2026 19:01:29 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	jinlong.mao@oss.qualcomm.com, quic_yingdeng@quicinc.com,
	tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v9 1/4] coresight: cti: Convert trigger usage fields to
 dynamic
Message-ID: <20260528180129.GJ101133@e132581.arm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
 <20260521-extended_cti-v9-1-d21f4f92c51e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-extended_cti-v9-1-d21f4f92c51e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_110133_593780_30E07C15 
X-CRM114-Status: UNSURE (   9.46  )
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

On Thu, May 21, 2026 at 08:16:27PM +0800, Yingchao Deng wrote:

[...]

> @@ -231,6 +254,8 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
>  {
>  	struct cti_trig_con *tc = NULL;
>  	struct cti_trig_grp *in = NULL, *out = NULL;
> +	struct cti_drvdata *drvdata = dev_get_drvdata(dev);
> +	int n_trigs = drvdata->config.nr_trig_max;

I don't mind it allocates bitmask with nr_trig_max, but AI review
suggests that when in_sigs / out_sigs bigger than nr_trig_max, it might
access memory out-of-boundary (see cti_plat_read_trig_group()).

It is good to add a check:

    if (in_sigs > n_trigs || out_sigs > n_trigs) {
        dev_err(dev, "trigger signal is out of range: in=%d out=%d nr_max=%d\n",
                in_sigs, out_sigs, n_trigs\n");
        return NULL;
    }

With this:

Reviewed-by: Leo Yan <leo.yan@arm.com>

BTW, I have given my review tag on v8, please remember to update
patches with review / ack tags.


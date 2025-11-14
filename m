Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1C2CE8D47
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIjQ6yzjiIKAGcvTQD9DTtsDWDBV11sS08ozhBwl7oQ=; b=xT46xcPfAfXizbZuW/VP6qYFeP
	zhJ6uFpdfzPDK8N1hik7nASIsAG4j/4KQ1sOGaTp22xFL7GUKS7tlckPEbsNM+vgtjdbpSUglk9CY
	bpZWkqj0a2V7rwDitkD56MAdPNgymhM3loD4roVlAkdX+Fkk2sk14+NZk7sNxMFYVH9WiomQqIQwQ
	xhJCQo5ZKPzPyYxn/ERiivnESvaHFoz1146SQDgMSGXojILVdO93cHS/DG3n8LIMGCMj7TKrgYE+t
	Yc6vJg2HeWIfUXXj5Ben4bjaAx3K2j2GmQ3xh4R7gfdbYPghEyPXx4y0EARf1PDtc0SGTxmfpH5ml
	wyifZyew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvvW-0000000Cb1U-2eff;
	Fri, 14 Nov 2025 15:41:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvvU-0000000Cb0t-1b6y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:41:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 742701063;
	Fri, 14 Nov 2025 07:41:18 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE98F3F66E;
	Fri, 14 Nov 2025 07:41:25 -0800 (PST)
Date: Fri, 14 Nov 2025 15:41:23 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
Message-ID: <20251114154123.GI3568724@e132581.arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-8-165ba21401dc@linaro.org>
 <20251114153021.GH3568724@e132581.arm.com>
 <0d2d2660-7552-4cb1-b974-87f376f153d9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d2d2660-7552-4cb1-b974-87f376f153d9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_074128_458495_6667F26C 
X-CRM114-Status: GOOD (  13.93  )
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

On Fri, Nov 14, 2025 at 03:34:32PM +0000, James Clark wrote:

[...]

> > > @@ -80,12 +80,11 @@ static ssize_t format_attr_contextid_show(struct device *dev,
> > >   					  struct device_attribute *attr,
> > >   					  char *page)
> > >   {
> > > -	int pid_fmt = ETM_OPT_CTXTID;
> > > -
> > >   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
> > > -	pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
> > > +	if (is_kernel_in_hyp_mode())
> > > +		return contextid2_show(dev, attr, page);
> > >   #endif
> > 
> > As said, this function now is only used for ETM4, we can remove "#if
> > IS_ENABLED(...)".
> > 
> > Otherwise, LGTM:
> > 
> > Reviewed-by: Leo Yan <leo.yan@arm.com>
> 
> Unfortunately it's still needed to make the build work.
> is_kernel_in_hyp_mode() results in an undefined symbol when building for
> arm32 so it needs to be ifdef'd out. I can add a comment though.

Maybe "#ifdef CONFIG_ARM64" is more suitable?


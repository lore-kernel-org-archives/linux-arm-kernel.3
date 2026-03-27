Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA5C10ED64D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fqz9wHcLRvciBjsUbz6uzWlpd0LQn+8kIREzP+Xk4E=; b=A6JfH1X5U5PbUyHcNuJaSunM0o
	TN1Q7ekpVAFsP9m8DHiH4AaELcyw8XmQGljnCg3/G+aZ3NjPiRBGtoPNHw/VuZNvxFJnBEZFSLWsQ
	FqIDvVsC5jZr21sEkN5+WSTus8d8BbVoZmNV8AkR+IEop701sePRJj4G6u2T4XxEv3bT2pmXiZDio
	EJbOX4TbFkSTWbV28QToLlPSRyE+nzbLeaLWDuldBnuV/gDjoI8+9Nf5ZSuSzRqRiRZxjoJQ1SPJe
	6Ze1S8lXAfv2IzSfI/yOe3TkPH5dQUicXt85iGIKr511du54y3XyVkZd9avjSaFghdvvglPYKt0lq
	q+jsb8Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63vU-000000077OT-3gvr;
	Fri, 27 Mar 2026 09:56:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63vS-000000077O2-1IDe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:56:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D99451764;
	Fri, 27 Mar 2026 02:56:13 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6121B3F915;
	Fri, 27 Mar 2026 02:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774605379; bh=dlPj8lkdaAOtDjEZON3jMZ9wX1o6CwcZo+Yix425nAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WLAuJu+8Fy5CSKcVsuClKcjT9b1lXKDb/w41XoC445CkUM0JAS3rQgSmujM5f82zG
	 qsonYpFWcxUs0VzbZPQZ3o5r+6Q20dSxV+VLawvAfjFoW/jZH+DcjbE4GXDgCsIrrm
	 bZ+b5xn/3GY14YWs1aF9BfxTVy4LC1Tn4QS354Iw=
Date: Fri, 27 Mar 2026 09:56:17 +0000
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: cti: fix the check condition in
 inout_sel_store
Message-ID: <20260327095617.GC356832@e132581.arm.com>
References: <20260327-fix-cti-issue-v1-1-2c8921e21fc8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-fix-cti-issue-v1-1-2c8921e21fc8@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_025622_382938_E4072668 
X-CRM114-Status: UNSURE (   7.83  )
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

On Fri, Mar 27, 2026 at 02:24:14PM +0800, Jie Gan wrote:
> Correct the upper bound from CTIINOUTEN_MAX to config->nr_trig_max,
> since nr_trig_max varies across CTI devices. An out-of-bounds issue
> occurs when a value greater than config->nr_trig_max is provided,
> leading to unexpected errors.
> 
> Fixes: b5213376c240 ("coresight: cti: Add sysfs access to program function registers")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>


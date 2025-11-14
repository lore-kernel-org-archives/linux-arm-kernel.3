Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256F5CE7B00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 12:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yto7lE1aitIGtUdJZ7Auj3fx8ABAec+gZYaVQNVCJOI=; b=XZo4SQdG9O0Gb4OT4sBhLok0/N
	LciVORAew7Dq5qUJrrNxrc0W/iVMNW+8h4+Iz4mIQPIfoJ6g4u6v7uCyZUNog4GruZZAjjMo6CHGN
	X3LaKu7vPDdtbrJI1xbSout1of5xxcA3XeTIn+wINv8YaPsU209r11AYXzrYlmBxZMYZQbp0qth+J
	4zuSvCwGu6hYMKKoPuKDRH91r+o09JGwYuquNVumqd1o7xHAodAlgsDcZbe1jyy5GFYncPliAn7Ui
	sV6IogOY56+NosimzH2DheJdNAq+LhulE3+LhApFQ0lHvfdY5wLYijd6A1WBH5PyoY5+j1w3HuRfq
	H1p2a8AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsnH-0000000CBrM-2Y7g;
	Fri, 14 Nov 2025 12:20:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsnF-0000000CBqf-0BTR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 12:20:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8C081063;
	Fri, 14 Nov 2025 04:20:34 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8A213F5A1;
	Fri, 14 Nov 2025 04:20:41 -0800 (PST)
Date: Fri, 14 Nov 2025 12:20:40 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 01/13] coresight: Change syncfreq to be a u8
Message-ID: <20251114122040.GC3568724@e132581.arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-1-165ba21401dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-james-cs-syncfreq-v4-1-165ba21401dc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_042045_117798_84DEC490 
X-CRM114-Status: GOOD (  16.06  )
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

On Wed, Nov 12, 2025 at 03:22:07PM +0000, James Clark wrote:
> TRCSYNCPR.PERIOD is the only functional part of TRCSYNCPR and it only
> has 5 valid bits so it can be stored in a u8.
> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-etm4x.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 8d4a1f0f1e52..56a359184c6f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -826,7 +826,6 @@ struct etmv4_config {
>  	u32				eventctrl1;
>  	u32				stall_ctrl;
>  	u32				ts_ctrl;
> -	u32				syncfreq;
>  	u32				ccctlr;
>  	u32				bb_ctrl;
>  	u32				vinst_ctrl;
> @@ -834,6 +833,7 @@ struct etmv4_config {
>  	u32				vissctlr;
>  	u32				vipcssctlr;
>  	u8				seq_idx;
> +	u8				syncfreq;
>  	u32				seq_ctrl[ETM_MAX_SEQ_STATES];
>  	u32				seq_rst;
>  	u32				seq_state;
> 
> -- 
> 2.34.1
> 


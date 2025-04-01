Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD59C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 06:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYlVV8Q5lEJIgVokNo0O/6mivk/abAx99Clb8lZINfQ=; b=2xV6AhbYF7d6LwqhldHLjVyrP9
	9GLNj/NEQibhsJOcS+tEj3TWD8qSRsb1aPcQq6EYVK7Ul+dgY0Kx/jQMx0GOMY6PNIWUY/W8057Jf
	VCkpGjOCw6JMHoyftA37aDA643X9hTwY521QcC1hfShK04VU5SvCjmwSsrEgQ50oSbPf7EPlrQrYt
	CcW/QDIAtVDrCp4EYTM8u2GODPjyS6sb+aT/R+3kpQo1x41J42cuFUIOfCqC+4ywdOrUeWgpTAYHZ
	LizbJGrPrwDWGLx4r8lhZkSe/0P8YlwqtwH2sEd1yb9BILQxQtiLTwttYObxvF/206RhyMbq0lBRY
	RfaHGN8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzUrx-00000002437-0ron;
	Tue, 01 Apr 2025 06:13:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzUq9-000000023l1-02Ye
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 06:11:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 385DC150C;
	Mon, 31 Mar 2025 23:11:15 -0700 (PDT)
Received: from [10.162.16.153] (unknown [10.162.16.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07B893F63F;
	Mon, 31 Mar 2025 23:11:07 -0700 (PDT)
Message-ID: <470e4a90-41c3-4974-a4d7-3073a7fcc737@arm.com>
Date: Tue, 1 Apr 2025 11:41:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix the wrong type of the trace_id in
 coresight_path
To: Jie Gan <jie.gan@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
References: <20250401014210.2576993-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250401014210.2576993-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_231113_107106_DC1AB710 
X-CRM114-Status: GOOD (  15.81  )
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

On 4/1/25 07:12, Jie Gan wrote:
> The trace_id in coresight_path may contain an error number which means a
> negative integer, but the current type of the trace_id is u8. Change the
> type to int to fix it.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Fixes: 3c03c49b2fa5 ("Coresight: Introduce a new struct coresight_path")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  include/linux/coresight.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index d79a242b271d..c2bf10c43e7c 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -337,7 +337,7 @@ static struct coresight_dev_list (var) = {				\
>   */
>  struct coresight_path {
>  	struct list_head	path_list;
> -	u8			trace_id;
> +	int			trace_id;
>  };
>  
>  enum cs_mode {


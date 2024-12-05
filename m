Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B44E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 07:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSN8erpeN2GDGeA9Hv5gtA/lq0S3TmHXSQSI0exTd6I=; b=BF50Ja/ZEPztfcFlU0KUkcKvL1
	68kEfkesJeX9GB0CQAmFyj1q6LMMrxMZ1Fpir9kSQt0t26d5x/Chg5OgNxKMlvnuHaGMWa0YM8Uzh
	G7nyTp85pJM6Wv66rrZJJufIHg3vmVDZ2mAnLAJX8Kp0jEKvhpchc8GC2/g9p8A2pHWNa1ntfyAdI
	cYSi0Pi1/FD3mVb2T4ax/1npmvRe0Pk7iFH+139nKgKvjr/Ju8ZyjLQQAlDtLGAE+3A5FkLBaSEQd
	NbG5mLI30qxUwJ/DqVruoIHaHLMXAmQ7OHk/mlHYfWjKVAcrDkSjKGpya2OMR29idvBlsNb6yzKpd
	8DoQZ6yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Fh-0000000Ezil-2b5k;
	Thu, 05 Dec 2024 07:26:21 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Ef-0000000EzVG-4A49
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 07:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1733383515; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=OSN8erpeN2GDGeA9Hv5gtA/lq0S3TmHXSQSI0exTd6I=;
	b=gGA5Y35s1kXd72LpH1/zluJAsUwAbkV2yi0cVNf5u4lyFXbl0X436Ir2Ai51+RTSlYFP8Sxu4+xs2C5el4S4VBN45o1qOXS+pwJVhGH5Ep4bAQ8M9Gqxp752mHvi3QpaFDF0frdWfW9Lzij9MtFMTw1ThyZziRkCOg6jaN5GmBg=
Received: from 30.74.128.237(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WKsWQ5e_1733383511 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Dec 2024 15:25:12 +0800
Message-ID: <9fa8c4b3-1585-4f2c-84df-d61d8c5c8329@linux.alibaba.com>
Date: Thu, 5 Dec 2024 15:25:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] perf/dwc_pcie: Fix the event numbers
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>,
 Jing Zhang <renyu.zj@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20241205061914.5568-1-ilkka@os.amperecomputing.com>
 <20241205061914.5568-2-ilkka@os.amperecomputing.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20241205061914.5568-2-ilkka@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_232518_218580_343D8BCB 
X-CRM114-Status: GOOD (  11.80  )
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



在 2024/12/5 14:19, Ilkka Koskinen 写道:
> According to Databook, L1 aux is event number 0x08 and
> TX L0s and RX L0S is 0x09. Fix the event numbers for the
> two events.
> 
> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> ---
>   drivers/perf/dwc_pcie_pmu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> index 9cbea9675e21..890cf3bb43a2 100644
> --- a/drivers/perf/dwc_pcie_pmu.c
> +++ b/drivers/perf/dwc_pcie_pmu.c
> @@ -199,8 +199,8 @@ static struct attribute *dwc_pcie_pmu_time_event_attrs[] = {
>   	DWC_PCIE_PMU_TIME_BASE_EVENT_ATTR(L1_1, 0x05),
>   	DWC_PCIE_PMU_TIME_BASE_EVENT_ATTR(L1_2, 0x06),
>   	DWC_PCIE_PMU_TIME_BASE_EVENT_ATTR(CFG_RCVRY, 0x07),
> -	DWC_PCIE_PMU_TIME_BASE_EVENT_ATTR(TX_RX_L0S, 0x08),
> -	DWC_PCIE_PMU_TIME_BASE_EVENT_ATTR(L1_AUX, 0x09),
> +	DWC_PCIE_PMU_TIME_BASE_EVENT_ATTR(L1_AUX, 0x08),
> +	DWC_PCIE_PMU_TIME_BASE_EVENT_ATTR(TX_RX_L0S, 0x09),
>   
>   	/* Group #1 */
>   	DWC_PCIE_PMU_TIME_BASE_EVENT_ATTR(tx_pcie_tlp_data_payload, 0x20),

LGTM.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks.

Best Regards,
Shuai


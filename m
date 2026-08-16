Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7323AC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 01:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVBzPFe0whP78lsDOkJAtpx+rXVWYaUG5slZsC0Fb64=; b=knrmmTVQB1eA2dPTkXkahTianE
	ZPkB68KJOpIXvdp8eN7Mj/3B/g8HLOnVsGeDDT4VA11obIqfBsmZLUtFhKZdX72wqvLRA5XUulbQv
	XojKrofz3obDKjSF1qyKObmMC/sUN/BTvMAmHRhScAvC7Q+bRnEK72yGgVJOcE2S0oQtAIa11Kwl1
	zdN4rwHuVX9MLpAkmPFmOxOYhGp/tuIrPb7l16Qt//SqMTVhtdPV6LOsN7WQEygDOUi0rQC6sobvw
	fVEM/+Mx4/k7w+aGOwYK2EzHBlBsS6XUr+VobIiBIZLorxIX+rzA2bSmx4oYk4HIMHltutAUiwfD3
	MlcqMn/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvPts-00000004O8g-1heR;
	Sun, 16 Aug 2026 01:43:00 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvPtn-00000004O7l-37HJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 01:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1786844567; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=dVBzPFe0whP78lsDOkJAtpx+rXVWYaUG5slZsC0Fb64=;
	b=DgWl2RNZx6ty/p7bifOi6GHSQr53K97G142QSbwmSo+EX8O8n/xAPbCgDXCuU9cltYuVxbp3mWo4o6uuQRvHcZlyxK7pzyz5z7ov7tMeD+StBCnlVLudgm9WGkxSlVGC15ReIznQK1eVPWHtFIxRpcxO7cs/TdunOVRlfCGItwk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0X9-u0h6_1786844565;
Received: from 30.28.192.31(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0X9-u0h6_1786844565 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 16 Aug 2026 09:42:46 +0800
Message-ID: <7321c855-08b7-4270-9d98-297a872ad47d@linux.alibaba.com>
Date: Sun, 16 Aug 2026 09:42:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/dwc_pcie: Fix PCI device reference leak in probe
To: Ruoyu Wang <ruoyuw560@gmail.com>, Jing Zhang
 <renyu.zj@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Yunhui Cui <cuiyunhui@bytedance.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260814133925.1385687-1-ruoyuw560@gmail.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20260814133925.1385687-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_184256_504620_B241416A 
X-CRM114-Status: GOOD (  14.89  )
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



On 8/14/26 9:39 PM, Ruoyu Wang wrote:
> pci_get_domain_bus_and_slot() returns a referenced PCI device. When the
> subsequent RAS DES capability lookup fails, dwc_pcie_pmu_probe() returns
> -ENODEV without releasing that reference. Repeated failed probes can
> therefore keep the PCI device allocated after removal.
> 
> Move the existing pci_dev_put() immediately after capability discovery
> so the temporary lookup reference is released on both success and
> failure paths.
> 
> This issue was found by a static analysis checker and confirmed by
> manual source review.
> 
> Fixes: 7f35b429802a ("perf/dwc_pcie: fix duplicate pci_dev devices")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
>   drivers/perf/dwc_pcie_pmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> index 5385401fa9cf6..baa736fd9a6ef 100644
> --- a/drivers/perf/dwc_pcie_pmu.c
> +++ b/drivers/perf/dwc_pcie_pmu.c
> @@ -710,10 +710,10 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
>   	}
>   
>   	vsec = dwc_pcie_des_cap(pdev);
> +	pci_dev_put(pdev);
>   	if (!vsec)
>   		return -ENODEV;
>   
> -	pci_dev_put(pdev);
>   	name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%x", sbdf);
>   	if (!name)
>   		return -ENOMEM;


Good catch.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks.
Shuai



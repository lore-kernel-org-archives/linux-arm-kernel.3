Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5FBD7237B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 12:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Mi/A2zxHM7UK1cGEJcmJkgBYBMQko8rDoO2KtqZroc=; b=wxda1A8pYqpfKi3FHCwsylXmtC
	fKJQ2SMkjQGAk2mMKPvIUJMgqhjkJoKa+VrlQdY8Tzi7SJk6Pazqhojty0VCZFzmt/XpwoccWPkuf
	Di3QyCJyvRsrKlegoUTEtOA+cdSWbr5fqgkYPMafZBbwDvjIbD6fZgiTVTDTgStfzVzJ1uiMGgGZ9
	LPFrwQqQkUUwSrVJ1RZLL62RhyDxhwvQ4kIqPs4CNlEYkSnoRCispviGChzfPFneJ6fjFy55gI+9a
	g/Xdbj0rDeIRVrcXBJ6TNsFGjTs1x8rOwXvLh6kSBY2LkuU6iQON8MBG0xtLFhjKP3ikk0u593ykH
	xKmrBwMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFv3-00000008sjy-2N7L;
	Fri, 23 Jan 2026 12:05:41 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFv0-00000008sjB-0pBs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 12:05:40 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dyGnt0143zJ46gg;
	Fri, 23 Jan 2026 20:04:50 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 513AB40570;
	Fri, 23 Jan 2026 20:05:19 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 23 Jan
 2026 12:05:18 +0000
Date: Fri, 23 Jan 2026 12:05:17 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <linux-kernel@vger.kernel.org>, <linux-rt-devel@lists.linux.dev>, "Thomas
 Gleixner" <tglx@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, <linux-cxl@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 16/21] perf/cxlpmu: Replace IRQF_ONESHOT with
 IRQF_NO_THREAD
Message-ID: <20260123120517.00000d58@huawei.com>
In-Reply-To: <20260123113708.416727-17-bigeasy@linutronix.de>
References: <20260123113708.416727-1-bigeasy@linutronix.de>
	<20260123113708.416727-17-bigeasy@linutronix.de>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_040538_410097_3857CCC6 
X-CRM114-Status: GOOD (  17.78  )
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

On Fri, 23 Jan 2026 12:37:02 +0100
Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> Passing IRQF_ONESHOT ensures that the interrupt source is masked until
> the secondary (threaded) handler is done. If only a primary handler is
> used then the flag makes no sense because the interrupt can not fire
> (again) while its handler is running.
> The flag also disallows force-threading of the primary handler and the
> irq-core will warn about this.
> 
> The intention here was probably not allowing forced-threading.
> 
> Replace IRQF_ONESHOT with IRQF_NO_THREAD.
> 
I don't think we are that likely to see force-threading on CXL
systems (I could be wrong!), but still good to correct this.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-cxl@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/perf/cxl_pmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/cxl_pmu.c b/drivers/perf/cxl_pmu.c
> index d094030220bf2..68a54d97d2a8a 100644
> --- a/drivers/perf/cxl_pmu.c
> +++ b/drivers/perf/cxl_pmu.c
> @@ -877,7 +877,7 @@ static int cxl_pmu_probe(struct device *dev)
>  	if (!irq_name)
>  		return -ENOMEM;
>  
> -	rc = devm_request_irq(dev, irq, cxl_pmu_irq, IRQF_SHARED | IRQF_ONESHOT,
> +	rc = devm_request_irq(dev, irq, cxl_pmu_irq, IRQF_SHARED | IRQF_NO_THREAD,
>  			      irq_name, info);
>  	if (rc)
>  		return rc;



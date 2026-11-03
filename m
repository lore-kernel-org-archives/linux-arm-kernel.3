Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F072606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fWJH6MVB;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=VxCSHYV8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m69S8GAWIcolCD174TtHbNXT0/7WGT8M9Xze/Z33az0=; b=fWJH6MVBaGEG/G
	PkUZo+rGBV87wpXvnOA7oFLcFPQgUCRtPRFpTrng2jOfYfg2Mdf/sU7178tvCVNWU9LCJCX5Bzq5P
	wleZrfCJadIYdjy/qF9QVSQoCgNUt1NA8vdO952m7ZI5zzMdjjZtIvtSW0VMx7L5Q5Kv/Omj7LWd4
	Fg+HrrMgpcmcFPuQlFUZefObA/iCwi7RwKVy9v4pL5bn6NCiOazApkMb05cd0Rjpw/gZrFr1IpQGi
	1Phu+LPxYxDhjiHmCMx37EJGJ96nO2xUgwVL7AK6hOuhkxIYJAPsA555qxyjIfEylJ2n1qx0/9G85
	QL/fYl/SWy0vvFTg2sGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO8aY-00000001Idw-003g;
	Tue, 03 Nov 2026 07:05:47 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO8aU-00000001Ibw-3kYb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:05:44 +0000
Received: from [192.168.1.10] (unknown [52.172.102.187])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8270820B7166;
	Mon,  2 Nov 2026 23:05:23 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8270820B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793689527;
	bh=m69S8GAWIcolCD174TtHbNXT0/7WGT8M9Xze/Z33az0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VxCSHYV8nnK+RVLEmx1wYoQ0JQRZ7nt6eUUV/sT+JrBhNIu8xGoz49bXXGtOAzb1T
	 8Alkg+E/z33YXdffv+a7t2ZAZ4/bwL980Usv5j9mcAs4YZckkFdy/E9ohKhKbyBO13
	 XI7mI6i/ZfvTnsX5+ZknoCZeh7zU1n9qc5IVNKe4=
Message-ID: <561328cc-0c0f-43b7-ad7e-a362e183f295@linux.microsoft.com>
Date: Tue, 3 Nov 2026 12:35:35 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] iio: adc: versal-sysmon: fix race in interrupt
 teardown
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 amitrkcian2002@gmail.com
References: <20261102122112.1723130-1-amit.kumar-mahapatra@amd.com>
 <20261102122112.1723130-2-amit.kumar-mahapatra@amd.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20261102122112.1723130-2-amit.kumar-mahapatra@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_230542_965640_92F0F560 
X-CRM114-Status: GOOD (  20.91  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>

Hi Amit,

On 02-11-2026 17:51, Amit Kumar Mahapatra wrote:
> sysmon_disable_interrupts() masks all interrupts, clears masked_temp and
> cancels the unmask worker, but leaves the interrupt handler live. A
> worker that is already running can re-enable an alarm through IER after
> the mask write. If that alarm fires, the handler queues the worker again
> after cancel_delayed_work_sync() has returned. On unbind this action runs
> before devm releases the IRQ, so the queued work can run after the
> devm-allocated iio_dev that embeds it has been freed.
> 
> Disable the IRQ first so that no handler is running or can start, then
> clear masked_temp and cancel the worker, and mask all interrupts last,
> once nothing is left that can unmask them. Record the IRQ number for
> this.
> 
> Fixes: c7f7eb10638f ("iio: adc: versal-sysmon: add threshold event support")
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>   drivers/iio/adc/versal-sysmon-core.c | 5 ++++-
>   drivers/iio/adc/versal-sysmon.h      | 2 ++
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versal-sysmon-core.c
> index 1b55d343982e..6b9a58e19831 100644
> --- a/drivers/iio/adc/versal-sysmon-core.c
> +++ b/drivers/iio/adc/versal-sysmon-core.c
> @@ -781,12 +781,14 @@ static void sysmon_disable_interrupts(void *data)
>   {
>   	struct sysmon *sysmon = data;
>   
> -	regmap_write(sysmon->regmap, SYSMON_IDR, SYSMON_INTR_ALL_MASK);
> +	disable_irq(sysmon->irq);
>   
>   	scoped_guard(spinlock_irq, &sysmon->irq_lock)
>   		sysmon->masked_temp = 0;
>   
>   	cancel_delayed_work_sync(&sysmon->sysmon_unmask_work);
> +
> +	regmap_write(sysmon->regmap, SYSMON_IDR, SYSMON_INTR_ALL_MASK);
>   }
>   
>   static int sysmon_init_interrupt(struct sysmon *sysmon,
> @@ -807,6 +809,7 @@ static int sysmon_init_interrupt(struct sysmon *sysmon,
>   	if (ret)
>   		return ret;
>   	sysmon->temp_mask = imr & SYSMON_TEMP_INTR_MASK;
> +	sysmon->irq = irq;
>   
>   	ret = devm_request_irq(dev, irq, sysmon_iio_irq, 0, "sysmon-irq", indio_dev);
>   	if (ret)
> diff --git a/drivers/iio/adc/versal-sysmon.h b/drivers/iio/adc/versal-sysmon.h
> index bb9a75bf71c0..701ef9b56263 100644
> --- a/drivers/iio/adc/versal-sysmon.h
> +++ b/drivers/iio/adc/versal-sysmon.h
> @@ -85,6 +85,7 @@ struct regmap;
>    * @regmap: register map for hardware access
>    * @lock: protects read-modify-write sequences on threshold registers
>    *        and cached state that spans multiple regmap calls
> + * @irq: interrupt number, 0 when events are not supported
>    * @irq_lock: protects interrupt mask register updates (MMIO path only)
>    * @masked_temp: currently masked temperature alarm bits
>    * @temp_mask: temperature interrupt configuration mask
> @@ -101,6 +102,7 @@ struct sysmon {
>   	 * that spans multiple regmap calls.
>   	 */
>   	struct mutex lock;
> +	int irq;
>   	/*
>   	 * Protects interrupt mask register updates.  Only used on the
>   	 * MMIO path (fast_io regmap); I2C has no IRQ and never reaches

Change looks good to me.

Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>

Regards,
Prasanna Kumar


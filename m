Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03FACA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9iZ745V3O9TQK90r+cmJTPJh5uGbsz3PptJMxIgYsU=; b=X+i6QJo1+4AZyh0sOJGCiNR/sb
	/PnUglTUSl2wMrkcE0CntW/t2yT2gDM58n1Wvcd6QC+epIbDdBxI4y5t5sGjfi7kz0Tmid5/MLqmT
	8qVYrS5Nqt5jF90BV4nFxbpXK1Jp4zQ5NIkvV/zl7K6OmMBdwSjyXIK5BiPIBP6GBe6jCbp/eV+g8
	uRN118aUMAepwf43LAtIgyR0JLevn2it9t1i5/weecK1CLjxswMjJnea7r3JRR453SJaFfiIWcj//
	8XBM8tM58qgkq0QeqkyFaHP10COU1YnhWyBvIZM0brY5zGcr9s0VNVLyall5vM6k8nzau6AfUpKSJ
	ep6m4gcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE7M-000000010TJ-37Cb;
	Mon, 28 Sep 2026 16:22:16 +0000
Received: from mail-qk2-x0c.google.com ([2607:f8b0:4864:34::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE7K-000000010SU-099m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:22:15 +0000
Received: by mail-qk2-x0c.google.com with SMTP id d75a77b69052e-53324cfe178so19538221cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 09:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1790612532; x=1791217332; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9iZ745V3O9TQK90r+cmJTPJh5uGbsz3PptJMxIgYsU=;
        b=JLe9H98zqz4h5lu1R0p0SKu/mmI048sWkSQFkWdZIz0eYeCHWQqdNLIWvCbWKwF5HK
         ZI7aQ2vLXOviL69WWPqnEIdwoDtE39TNyU8ne28jjiw9+tEebHRg6JBdaxelW23/1Ujx
         nHcxJKcboSc9cm+5JYWG3Lsx7wg88GEsIaRi0Z58MB2adhTn04c4Mb44YRQSpL2Fx7JO
         MtOVn3Qy3EfZrrnpCXx2a7T8G03nimfr8W2yP1KGvo1Qlco+1E6eK1VfIsF+Axm4aPsS
         yDtCndT7kGiYS+Lqwhc3q+2ZFX/z7dk9N73+UZ6DKBrxaRsJt4YFXLTWqP6FZvCOf6N1
         2hjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612532; x=1791217332;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9iZ745V3O9TQK90r+cmJTPJh5uGbsz3PptJMxIgYsU=;
        b=qOMkQUgJHueibY/VfDo8F1V4a0SHVwez96qEtsKfFhwy3v0dGUb32TeXlP1GR2A3bm
         tuWhPHH2pOMKafoj9/EriIJi8F+vn+pUasYSzqNvS6ieKfuFh3JdNl0TinpUfCTu2CWJ
         M9E0a8moXJkYzaNRkK3uSS/Ks2vJbtEYl3WTB9HjtC/YHtOCYNkKt+l1ImTvybVTdlRq
         VaIJfa5NuqNgLsuhXZ4fxaP/jU5sS6Uv59IgQ32z1R+w2qTGPMpgOsUL6+CZwxVFPShr
         /xsEZCwrkTwpfPytcHC5pXtTZ/Dqu/7N7ZZg8p5wvD81EK+rwLt9vR62icvAQrhDMiqf
         uBUg==
X-Forwarded-Encrypted: i=1; AKwUvBz0Mg67TYyp8lxuiCxbfsMOM/HkrYlv4sfmOIMA9JUhNksnZQy3/M2CiUF34SuM7bir1zhaPxDOY8+tWzSGhj28@lists.infradead.org
X-Gm-Message-State: AFuF++mxr3koaDzV4zSck7eFfEfR5TvhoBd7QbuwNSRQcce/hF4qOYRi
	rmeJ4R6uk+l5AAFoZadfcDbB5Tr7TGVqoczoxFxEdU+RfgIziwdmqdjysSum935O9LEpSO4DHNc
	LXxwRAcCkVYqvfwDt9GO63/MwpV/X60tZ3gDygkuYRc/C0MnzUoocEpW8nIVghsHsnTIrZQ==
X-Gm-Gg: AYBFou0BTpLwY1Zze9L31zENR8VMfxSy4qz7E48QGcvyKTrvPtwZ0MvwtjSdabRBSHk
	FuKJRy9gSixq70tqfWoEO7GroCslJ5z5Y4GUOd6KAlHEIm7GBi6TLI9gEDu21rIhkRrS4qInPlg
	1SV1++cwEBPAz93yzaf4pB57eRqKKd8Zqa0g7RVUqW7PoIUmRPNkBeSbQUkJ5O8mYjLXpwjo4yG
	IoqfJ/dklClwVrf7UH5aYL4HihPdngKjIVqHj7AvkEsDkkOrCepy1UD6yRmpoMNU5bQFR20wNan
	y4/DLESXfjAoziiZicEeB2rcwLJo3NdZfX9vTe2OmpbcQZVeVlAz4e2GT+mpYGgp6XZ8pTtwZVt
	ijEACXA6YstKTsCr18IAR9BqqHQt4j08RWDON4gY2ndi5MkmDRfZi4+N60JIhyJjRkHfqILECER
	pR/rb6kJCQzRRvweR0W74vYuUh98qCibYHXDgoiDEMbkTg1fwpagU2Vc50mFdYSYEzIQ2v0U1zv
	7k=
X-Received: by 2002:ac8:5c8d:0:b0:533:33c6:e63c with SMTP id d75a77b69052e-53333c6fec4mr122429221cf.16.1790612531895;
        Mon, 28 Sep 2026 09:22:11 -0700 (PDT)
Received: from [10.200.233.210] ([66.193.28.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533223cad4esm65860381cf.24.2026.09.28.09.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:22:11 -0700 (PDT)
Message-ID: <e5a5dccc-46c4-497c-ab8b-b3f7fe5e316d@brivo.com>
Date: Mon, 28 Sep 2026 12:22:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: meson-gx: Convert host->lock to raw spinlock
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
References: <20260921191326.2146363-1-sanderson@brivo.com>
 <CAPx+jO8g-y+uc4YXUeZ3yOH6s44WFpytNu3-f6iLSjtHAVPd+A@mail.gmail.com>
Content-Language: en-US
From: Sean Anderson <sanderson@brivo.com>
In-Reply-To: <CAPx+jO8g-y+uc4YXUeZ3yOH6s44WFpytNu3-f6iLSjtHAVPd+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_092214_092175_6A706183 
X-CRM114-Status: GOOD (  18.98  )
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



On 9/28/26 12:17 PM, Ulf Hansson wrote:
> On Mon, Sep 21, 2026 at 9:14 PM Sean Anderson <sanderson@brivo.com> wrote:
>>
>> The primary handler for IRQF_ONESHOT interrupts is always run without
>> threading, even on PREEMPT_RT. Therefore, we must use a raw spinlock,
>> which will never sleep (even on PREEMPT_RT).
> 
> Sorry, but I don't quite understand the above. Are you saying that
> IRQF_ONESHOT only works with raw spinlocks?

The primary handler of an IRQF_ONESHOT handler must use raw spinlocks.

https://www.kernel.org/doc/html/latest/core-api/real-time/differences.html#interrupt-handling

> 
>>
>> Fixes: 066ecde6d826 ("mmc: meson-gx: add SDIO interrupt support")
>> Signed-off-by: Sean Anderson <sanderson@brivo.com>
>> ---
>>
>>   drivers/mmc/host/meson-gx-mmc.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
>> index 694bb443d5f3f..d5365c0404cb9 100644
>> --- a/drivers/mmc/host/meson-gx-mmc.c
>> +++ b/drivers/mmc/host/meson-gx-mmc.c
>> @@ -176,7 +176,7 @@ struct meson_host {
>>
>>          bool needs_pre_post_req;
>>
>> -       spinlock_t lock;
>> +       raw_spinlock_t lock;
>>   };
>>
>>   #define CMD_CFG_LENGTH_MASK GENMASK(8, 0)
>> @@ -953,10 +953,10 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>>          cmd = host->cmd;
>>
>>          if (status & IRQ_SDIO) {
>> -               spin_lock(&host->lock);
>> +               raw_spin_lock(&host->lock);
>>                  __meson_mmc_enable_sdio_irq(host->mmc, 0);
>>                  sdio_signal_irq(host->mmc);
>> -               spin_unlock(&host->lock);
>> +               raw_spin_unlock(&host->lock);
>>                  status &= ~IRQ_SDIO;
>>                  if (!status)
>>                          return IRQ_HANDLED;
>> @@ -1112,9 +1112,9 @@ static void meson_mmc_enable_sdio_irq(struct mmc_host *mmc, int enable)
>>          struct meson_host *host = mmc_priv(mmc);
>>          unsigned long flags;
>>
>> -       spin_lock_irqsave(&host->lock, flags);
>> +       raw_spin_lock_irqsave(&host->lock, flags);
>>          __meson_mmc_enable_sdio_irq(mmc, enable);
>> -       spin_unlock_irqrestore(&host->lock, flags);
>> +       raw_spin_unlock_irqrestore(&host->lock, flags);
>>   }
>>
>>   static void meson_mmc_ack_sdio_irq(struct mmc_host *mmc)
>> @@ -1225,7 +1225,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
>>          if (ret)
>>                  goto err_init_clk;
>>
>> -       spin_lock_init(&host->lock);
>> +       raw_spin_lock_init(&host->lock);
>>
>>          if (host->dram_access_quirk) {
>>                  /* Limit segments to 1 due to low available sram memory */
>> ---
>> base-commit: 587858367581b9c55c3690f4e63382ad622719d4
>> branch: meson_mmc_raw
>>
>> --
>> 2.53.0
>>



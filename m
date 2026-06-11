Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040F4CD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 06:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfTiP030EHEMb6gZGsFQEOAcZ8Q3OUbSiSaeDi7KE4g=; b=PycMNfKQ1rYrXLmfXMDgxkrjrm
	AwQ9illL9/I0s5S2dFsyJhjJVyZM62UKaFKBKb4LTcOuPcetAXMrlWVD3GASRvUjqE5+8ymht1nrU
	FDud43zLmp7ukS2Wo/0joQgu4LY1ANJ6JdcKBc3QVJgmilSZbzxdRmqgcMMK6YcX/rnp4E1wppZeU
	o7PdrpUgoqX7OVtALTF34C5iY0gr2NMZL/w5OpmzZVMcmUiGmo5soPyBdUfgezHDeGY2SyAABU4vb
	XxEj+2DU8qtCtmxvQFLYF8dVcP/jprvBK+XsslCiSq8dNzh0gi1qBh5oHXXK+MOmHJ9sdIf1q9gmB
	f92SknPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXY1f-00000008kM0-3oDe;
	Thu, 11 Jun 2026 05:32:23 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXY1c-00000008kK4-45oV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 05:32:22 +0000
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 11 Jun 2026 14:32:17 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id 672322068E61;
	Thu, 11 Jun 2026 14:32:17 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Thu, 11 Jun 2026 14:32:17 +0900
Received: from [10.212.247.31] (unknown [10.212.247.31])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 051C3107185;
	Thu, 11 Jun 2026 14:32:16 +0900 (JST)
Message-ID: <c1c09630-d01f-446d-8924-6057d7824191@socionext.com>
Date: Thu, 11 Jun 2026 14:32:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: spi: uniphier: KASAN wild-memory-access in complete() on early
 IRQ
To: Jaeyoung Chung <jjy600901@snu.ac.kr>,
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sangyun Kim <sangyun.kim@snu.ac.kr>, Kyungwook Boo <bookyungwook@gmail.com>
References: <20260610115622.773149-1-jjy600901@snu.ac.kr>
 <20260610225705.37b09a7f876e5ba07757377a@kernel.org>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20260610225705.37b09a7f876e5ba07757377a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_223221_174438_075B57F3 
X-CRM114-Status: GOOD (  17.34  )
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

Hi, Jaeyoung Masami-san

On 2026/06/10 22:57, Masami Hiramatsu wrote:
> On Wed, 10 Jun 2026 20:56:21 +0900
> Jaeyoung Chung <jjy600901@snu.ac.kr> wrote:
> 
>> Hi,
>>
>> uniphier_spi_probe() in drivers/spi/spi-uniphier.c registers the
>> interrupt handler uniphier_spi_handler() with devm_request_irq() before
>> it initializes priv->xfer_done with init_completion(). If an interrupt
>> arrives after devm_request_irq() and before init_completion(), the
>> handler calls complete() on an uninitialized completion, causing a
>> kernel panic.
>>
>> The probe path, in uniphier_spi_probe():
>>
>>      host = spi_alloc_host(&pdev->dev, sizeof(*priv)); /* priv
> kzalloc-zeroed */
>>      ...
>>      ret = devm_request_irq(&pdev->dev, irq, uniphier_spi_handler,
>>                             0, "uniphier-spi", priv);  /* register
> handler */
>>      ...
>>      init_completion(&priv->xfer_done);                /* initialize
> completion */
>>
>> The interrupt handler uniphier_spi_handler() calls complete() on its
>> done path:
>>
>>      done:
>>          complete(&priv->xfer_done);
>>
>> If the device raises an interrupt before init_completion() runs,
>> complete() acquires the uninitialized wait.lock and walks the zeroed
>> task_list in swake_up_locked(). The zeroed task_list makes list_empty()
>> return false, so swake_up_locked() dereferences a NULL list entry,
>> triggering a KASAN wild-memory-access.
>>
>> Suggested fix: move init_completion(&priv->xfer_done) above
>> devm_request_irq(), so the completion is valid before the handler can
> run.
>>
>> Reported-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
>> Reported-by: Kyungwook Boo <bookyungwook@gmail.com>

Thank you for your report.

Indeed, if an interrupt occurs before init_completion, an exception might
occur depending on the status.

And I also confirmed the detection of KASAN using pseudo interrupt call.

   BUG: KASAN: out-of-bounds in complete+0x74/0xf0
   Read of size 8 at addr fffffffffffffff8 by task swapper/0/1
   Pointer tag: [ff], memory tag: [fe]
   ...
   Memory state around the buggy address:
    fffffffffffffd00: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
    fffffffffffffe00: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
   >ffffffffffffff00: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
   Unable to handle kernel paging request at virtual address efff800000000000
   KASAN: null-ptr-deref in range [0x0000000000000000-0x000000000000000f]

> Good catch! All resources used by a callback, should be initialized before
> registering it.
> Kinihiko, can you fix it by reordering the initialization?

Yes, I'll prepare to fix it according to the report.

Thank you,

> 
> Thank you,
> 
>> Thanks,
>> Jaeyoung Chung

-- 
---
Best Regards
Kunihiko Hayashi


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C489CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 08:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPAR0uebm5Y5n5axv4Mg1C2Tj7xIAONi5Ye5tBhGPYI=; b=L5CnYIxFktWjq0xUnhjiKcV3Xj
	VzQGkgvKFemwI8wqgPe/ksb16bWyPEoJ5KwqFcUiz0TkRxtsJC1OgJN4/g+zRyACFBiBV2PIKKuZt
	DIzb8evwV9NL7wpSptUyACWyu7C4vimD2Jy1qYDoyAse0Kc42YMyEbIS+V/8/Z2lgpbuTbr81BNYS
	6MxvkrtZ3Ok3hTU0RzB2cT1BXw6lf5LrInU2ZHcPu/XJ/9nWQz43EMTF06C7nEXAYcwVkdQYtlZcI
	JpbTaxTrwflEKlClfvb1xTAgZiZrbIYzjqlwnxt7EVEYMn2l8l/t+O4ug34Kp12dEi3JKpCjVz+dj
	mYwMKB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXx5R-0000000AZQB-1KVc;
	Fri, 12 Jun 2026 08:17:57 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXx5N-0000000AZPS-2meD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 08:17:55 +0000
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 12 Jun 2026 17:17:50 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id BDD322091480;
	Fri, 12 Jun 2026 17:17:50 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Fri, 12 Jun 2026 17:17:50 +0900
Received: from [10.212.247.31] (unknown [10.212.247.31])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 0C716107185;
	Fri, 12 Jun 2026 17:17:50 +0900 (JST)
Message-ID: <cd454dac-868d-43b9-9b50-9ba9f3f370a9@socionext.com>
Date: Fri, 12 Jun 2026 17:17:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: uniphier: Fix completion initialization order before
 devm_request_irq()
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sangyun Kim <sangyun.kim@snu.ac.kr>,
 Kyungwook Boo <bookyungwook@gmail.com>, stable@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>
References: <20260611113137.139673-1-hayashi.kunihiko@socionext.com>
 <airBmzYhnxuK_xdh@sirena.co.uk>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <airBmzYhnxuK_xdh@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_011753_823010_E1B3387A 
X-CRM114-Status: GOOD (  10.32  )
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

Hi Mark,

On 2026/06/11 23:09, Mark Brown wrote:
> On Thu, Jun 11, 2026 at 08:31:37PM +0900, Kunihiko Hayashi wrote:
>> The driver calls devm_request_irq() before initializing the completion
>> used by the interrupt handler. Because the interrupt may occur immediately
>> after devm_request_irq(), the handler may execute before init_completion().
> 
> This doesn't apply against current code, please check and resend.

That seems a bit strange. I applied this patch to v7.0 and linux-next successfully.
Which tree did you apply to and fail?

Thank you,

---
Best Regards
Kunihiko Hayashi


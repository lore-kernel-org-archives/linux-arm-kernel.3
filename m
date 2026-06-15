Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E52DCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 02:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaeQ0c/BXRwuozWCWbMuUFv2jKtJSUUWUHvoMTbkFbw=; b=YEhdoBMLekvY1nqy0tpC5CeWQD
	bDN4NmHQiM3vDgDjhMMDfyQQMvd9m3hEG//O1eNp9w+KYd8dnA3T8Mi8wsS7zxslrsAVaLZj82U4W
	3RmlVvwcGoIwSVQFkZodI6fBRgTeYqdeYuZv31AHe7l3+ssNfjRHZt+NT/wfKKS7v7w1KqidhuJp1
	E2K+DHyveoMWkbqqE/5GL+wdPYER6SHU/lBxvhT4wZyJ4Uk70+cgpNpse5Z+X8FuCoNQZA3Lh4dSJ
	Etqss5Dj2AUYLnhnf7Xiru0Db3aKNuTaqjsh/lSi3JAqdMUVr9x9rbAVSneb620j7YbTzaVQyNIng
	kd2paiNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYx0V-0000000DSuo-0KGU;
	Mon, 15 Jun 2026 02:24:59 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYx0S-0000000DSu3-25pd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 02:24:58 +0000
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 15 Jun 2026 11:24:52 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id 93A452068E61;
	Mon, 15 Jun 2026 11:24:52 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Mon, 15 Jun 2026 11:24:52 +0900
Received: from [10.213.138.178] (unknown [10.213.138.178])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 091D8107185;
	Mon, 15 Jun 2026 11:24:52 +0900 (JST)
Message-ID: <c18914f2-3dba-48ad-abcd-04dc3251f4c9@socionext.com>
Date: Mon, 15 Jun 2026 11:24:53 +0900
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
 <cd454dac-868d-43b9-9b50-9ba9f3f370a9@socionext.com>
 <aiv9j5CInFE3twZX@sirena.co.uk>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <aiv9j5CInFE3twZX@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_192456_662789_B53B33A5 
X-CRM114-Status: GOOD (  11.38  )
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

On 2026/06/12 21:37, Mark Brown wrote:
> On Fri, Jun 12, 2026 at 05:17:49PM +0900, Kunihiko Hayashi wrote:
>> On 2026/06/11 23:09, Mark Brown wrote:
> 
>>> This doesn't apply against current code, please check and resend.
> 
>> That seems a bit strange. I applied this patch to v7.0 and linux-next successfully.
>> Which tree did you apply to and fail?
> 
> It applies to none of spi/for-7.1, spi/for-7.2 nor spi/for-next.

Sorry for my mistake.
I've checked the differences, so I'll resent it.

Thank you,

---
Best Regards
Kunihiko Hayashi


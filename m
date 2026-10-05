Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9C6CA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 06:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NuiB/b5/WbYYEyiXEGqACpXXyEMDlEux42pPiuE6qU=; b=tGV/DxbiVMmLAhNiBy5LkYW2ON
	4Cjxa4Y/M09Khk0ptVgnKhSp2OcERqHw2Hg8qYiByoascUEGCP0n5lEZ/LgtV4NGEWlaZdoqoIi1k
	sJDvQnO0FAPlhQ748etwEDjmA3pX99IzGU+9nvIOKNZQcBL18foc3Qty0VsST3smfugPLXRFdPXA0
	iGAKUerxIdVcEmJFnJJGM3WU06vBjOYg4wc/V1SNTf2UvJe4/X6ir0g1KS4XLogGpYYHvrfken+QT
	yy7r4QyCOKS0aR7za0a3cZiZYLx/5SOq0cv1WoWaBO6rzslIJhX+86ynPcrYruKOzQnMln4ZreY/3
	a+MolIOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcbU-0000000Fkop-3qwS;
	Mon, 05 Oct 2026 06:55:16 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcbR-0000000FkoN-47sc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 06:55:15 +0000
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 05 Oct 2026 15:55:10 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id BB12D2091574;
	Mon,  5 Oct 2026 15:55:10 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Mon, 5 Oct 2026 15:55:10 +0900
Received: from [10.213.138.49] (unknown [10.213.138.49])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 06E4810D843;
	Mon,  5 Oct 2026 15:55:10 +0900 (JST)
Message-ID: <632a5ff5-89e3-437d-b89e-dbcef35fbd49@socionext.com>
Date: Mon, 5 Oct 2026 15:55:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: 8250_uniphier: Use devm_clk_get_enabled()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Malathi A <malathi.a2000@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260917040511.103232-1-malathi.a2000@gmail.com>
 <97e4ab26-b147-4cf4-97f9-307903f14e61@socionext.com>
 <arUvJyvChXXcasSu@ashevche-desk.local>
 <3ea1f574-ddb5-46a6-9bc1-7a8ea84c54bd@socionext.com>
 <arZ5KxIp55qA6UA7@ashevche-desk.local>
 <faa1027c-7279-462a-9c6f-f03354b9cfd3@socionext.com>
 <arot4SH3vbDpKC8A@ashevche-desk.local>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <arot4SH3vbDpKC8A@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_235514_146434_8B700A61 
X-CRM114-Status: GOOD (  23.30  )
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

On 2026/09/28 18:05, Andy Shevchenko wrote:
> On Mon, Sep 28, 2026 at 03:51:09PM +0900, Kunihiko Hayashi wrote:
>> On 2026/09/25 22:37, Andy Shevchenko wrote:
>>> On Fri, Sep 25, 2026 at 08:32:20PM +0900, Kunihiko Hayashi wrote:
>>>> On 2026/09/24 23:09, Andy Shevchenko wrote:
>>>>> On Thu, Sep 24, 2026 at 06:07:37PM +0900, Kunihiko Hayashi wrote:
>>>>>> On 2026/09/17 13:05, Malathi A wrote:
> 
> ...
> 
>>> So, in such a case how do you see the scenario when system is resumed
>>> (Right?
>>> Otherwise we can't do anything, like detaching driver from the device.)
>>> and
>>> clock is disabled?
>>
>> Ah, I understand your point. I was assuming that the driver could later
>> be detached after uniphier_uart_resume() failed, leaving the clock disabled.
> 
> I'm not sure, I don't know if I was right. Can you confirm that this scenario
> is not possible? So, it might look like CPU is resumed, some of the devices
> were resumed, but this particular UART failed to resume, and now we want to
> detach it. If this case is possible, I believe tons of the device drivers as
> of today may be affected by the same issue (it doesn't mean that the issue
> is impossible to happen, one needs to investigate deeper)
Sorry for the delayed reply.

Unfortunately, I can't confirm whether this scenario is impossible.
I don't currently have an environment where I can reproduce this system
suspend/resume case either.

I agree that if a device can later be detached after its system resume callback
has failed, this may affect other drivers using the same pattern as well,
and determining that seems to require a deeper look into the PM core behavior.

>> If that sequence cannot happen after a failed system resume, then my concern
>> doesn't apply.
> 
> As pointed out I'm not sure. Last time I experimented with failed resume > long time ago.

So I don't have a definitive answer here either, and can only point out this
as a potential issue for now.

Thank you,

---
Best Regards
Kunihiko Hayashi


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEC7CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 00:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4AvUwJ5Z1g+DUZIOadfkIKI1mC1/d2mHeilwco4Ypn0=; b=LxCO/jqkpmhNTjUkl3YXJddwqe
	BR756GifAPbFR/4ZpkkNVFRbflHmC+WVTHL58XSwwteOqf9gUcHClOaQE6Ah7hu2mnfQ2C/VSzpuw
	pjVBn8Iy+Si+wf1SQiJloJKPJDPxlhl5OcypRQzTl0YB/h9UqwimHI/Yuba2mrS4/ZmasvsTCisMS
	lvWmFy88GeW/kYHwAPsxbC6FGk26sC3ADKeUb8D0NlcQlH96Lx7oWYCIKXrkrMzBjWde3pcgkxgEi
	fTQpvwtx46glqaVo4VlqIiUBc7oeVcMNBptGw4RerQ58IW3y7YJUu////O2My9AeLh+2q6rlFyj8o
	3X1yNmCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZI5Q-0000000F2MI-22nM;
	Tue, 16 Jun 2026 00:55:28 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZI5N-0000000F2Lt-0QHy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 00:55:26 +0000
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 16 Jun 2026 09:55:22 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id 1ADB52091480;
	Tue, 16 Jun 2026 09:55:22 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Tue, 16 Jun 2026 09:55:22 +0900
Received: from [10.212.247.31] (unknown [10.212.247.31])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id C2AE2107185;
	Tue, 16 Jun 2026 09:55:21 +0900 (JST)
Message-ID: <863fb28b-2608-479a-bc70-3407884975f3@socionext.com>
Date: Tue, 16 Jun 2026 09:55:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v1] spi: uniphier: Fix completion initialization
 order before devm_request_irq()
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sangyun Kim <sangyun.kim@snu.ac.kr>,
 Kyungwook Boo <bookyungwook@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>
References: <20260615023415.190655-1-hayashi.kunihiko@socionext.com>
 <dffb3303-6371-4415-ac0e-488c421e2555@sirena.org.uk>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <dffb3303-6371-4415-ac0e-488c421e2555@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_175525_254135_E9A32F63 
X-CRM114-Status: GOOD (  11.92  )
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

On 2026/06/15 20:45, Mark Brown wrote:
> On Mon, Jun 15, 2026 at 11:34:15AM +0900, Kunihiko Hayashi wrote:
>> The driver calls devm_request_irq() before initializing the completion
>> used by the interrupt handler. Because the interrupt may occur immediately
>> after devm_request_irq(), the handler may execute before init_completion().
>>
>> This may result in calling complete() on an uninitialized completion,
>> causing undefined behavior. This has been observed with KASAN.
>>
>> Fix this by initializing the completion before registering the IRQ.
> 
> I thought you were going to rebase this, why resend the same version?

Sorry for confusion.

The patch was rebased due to upstream changes.
I'll resend it as v2 with a change comment.

Thank you,

---
Best Regards
Kunihiko Hayashi


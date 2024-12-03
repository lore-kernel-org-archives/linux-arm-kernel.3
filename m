Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12270E64AA3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 13:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6I/jTxWjwgLTjkEk8olI2grbbedbDAW6cOesFET5tGQ=; b=43/lAL55CThOXnYhC0iO5ERNe8
	JMnct5/7Khn1/sQRTVtSZjfwjFWKm7e1oQ/4EOWNMAjOsV5nxLxEo+Dz9R7YUJ9wtTOzuTSgMl77z
	g1SCnVB95VJjJcn5nxDci9kijbjSNrLeL7F3D7q/lADyUrJwLi43oYlvpLuHY5Rgn7QftL5oE6SQV
	6MCu7KwXlNEbIZJNUzbc5prbnZrwYHDssviYJIxSztS56WaqZHXmx1CdBTH8j9fvfJJLN3v1AIR0a
	Uyd8EO/tBgsPYZQJATMOc7JlzwPRZGhHqvZWJ8/Wg8eE3x1te5fUusM+rw8tB5Zr+NiEzBZFm/bEJ
	f6sSTgZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIT6u-00000009dVT-48sV;
	Tue, 03 Dec 2024 13:38:40 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIT5t-00000009dHJ-3FxD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 13:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6I/jTxWjwgLTjkEk8olI2grbbedbDAW6cOesFET5tGQ=; b=u75sQhoNYd14D/9cDtkKOIMuhp
	1CnXgAILC58nVqEpN/UEsvNz5PlQ19wLgMBkC98SjBox7vw+xumHZ+ZHDp7bhmwC7N/cvFF2snqgB
	SR96+t7wUEpGyYot+Fvve6FezzWXAzWqC4XnsxvwXdjTFWfmE1OA6q36b0LvacycZB6bOl3tDxz/p
	0A1LAbDxYPyrZ8yyd+fxcutG/Y/fTwXYe00JZsc/YB0Eo+IduoOlB7uo//+WDFWlPYMbP7M4Y5r5c
	oWk/MlxsQfr+zOf4wa2yKvedcvC7dPcp664P7GW7YTj/KGSStXSW2mZfR/qkEQqeWwORhqSN2sgU1
	yEWLd8cA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tIT5p-0009sc-A6; Tue, 03 Dec 2024 14:37:33 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tIT5o-000OZv-34;
	Tue, 03 Dec 2024 14:37:32 +0100
From: Esben Haabendal <esben@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  Patrice Chotard
 <patrice.chotard@foss.st.com>
Subject: Re: [PATCH 4/6] rtc: st-lpc: Fix initial enable_irq/disable_irq
 balance
In-Reply-To: <202412031325408acbe302@mail.local> (Alexandre Belloni's message
	of "Tue, 3 Dec 2024 14:25:40 +0100")
References: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
	<20241203-rtc-uie-irq-fixes-v1-4-01286ecd9f3f@geanix.com>
	<202412031325408acbe302@mail.local>
Date: Tue, 03 Dec 2024 14:37:32 +0100
Message-ID: <87h67klwf7.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27476/Tue Dec  3 10:52:11 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_053738_095708_3D49DC10 
X-CRM114-Status: GOOD (  13.41  )
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

Alexandre Belloni <alexandre.belloni@bootlin.com> writes:

> On 03/12/2024 11:45:34+0100, Esben Haabendal wrote:
>> Interrupts are automatically enabled when requested, so we need to
>> initialize irq_enabled accordingly to avoid causing an unbalanced enable
>> warning.
>> 
>> To: Patrice Chotard <patrice.chotard@foss.st.com>
>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>> ---
>>  drivers/rtc/rtc-st-lpc.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/rtc/rtc-st-lpc.c b/drivers/rtc/rtc-st-lpc.c
>> index c6d4522411b312f94de2701ff4ff491e5323aa96..dbc2c23bca23f5de6de3fd4b39c9c67290bfd78d 100644
>> --- a/drivers/rtc/rtc-st-lpc.c
>> +++ b/drivers/rtc/rtc-st-lpc.c
>> @@ -218,6 +218,7 @@ static int st_rtc_probe(struct platform_device *pdev)
>>  		return -EINVAL;
>>  	}
>>  
>> +	rtc->irq_enabled = true;
>>  	ret = devm_request_irq(&pdev->dev, rtc->irq, st_rtc_handler,
>>  			       IRQF_NO_AUTOEN, pdev->name, rtc);
>
> Seeing the IRQF_NO_AUTOEN here, I guess the patch is not correct.

I guess you are right :)
Sorry about that. I only have HW available for testing the rtc-isl12022
driver here.

This patch should be dropped.

>
>>  	if (ret) {
>> 
>> -- 
>> 2.47.1
>> 


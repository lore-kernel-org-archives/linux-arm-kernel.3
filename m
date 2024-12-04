Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AFCE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wuxm3+PMYvcJmbMnGTjMWe0qoQyxuZwETVB6N9HZ3+8=; b=LpfeG4dpZUgVKk6UHTZ/GNpeT5
	XT82hsjcsKbW/x8qVWTvz9/R6iMMZSHotoYuOMK8OMUvkld/CGjWcxL3R+OybeifQ0AQToyTcr8cC
	NwHXF3Ng7EzW+iIlMAV4Zy6RpBeVIZZWbMS7ly8PKtOWeRdACxRTzJJPmfaAFyIeWYlbE6ApyB4R8
	9QFZnHwdRqxmAKeoYFUUSQRY/qQdG3tPk+3kQ0fhQZIEe8OZOqXifFYEIH/8XIRYNGXO4xX9AEpJs
	jIz6AggXnQ2IWIK9yK25/JWtpkND0oa/vPxI3mtBNoclv6UMpE4D/2MJhex3TYA4n754z3t7b/BOJ
	yHTw5Sxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIq8g-0000000CnEf-1QwU;
	Wed, 04 Dec 2024 14:14:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIp8L-0000000Ce6I-2RJB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Dec 2024 13:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=wuxm3+PMYvcJmbMnGTjMWe0qoQyxuZwETVB6N9HZ3+8=; b=QU80ntkpb2yZFcaXHfAaqmG3Us
	rFf4Jk8+m9H4h3KtoPxt7Gwqg6kH/jlYCwe6HNHaNsImg9KdB3Uv2nmaxGkjc7xFRZ6XpHZwDq/bq
	zbmBAQ7QcYMa1ePGjXfUGTI2w6x2PNcyyt2WFBRvhU99mWmj3Fgd3EKnPVPJrxJzTkK+w1FLjuKpQ
	cEJ29IkuTv52pxMrBW1LrQNgXwKzt4DFll+KA8Jm+TbWSIWjBLMejpXtlVqR1L2tugZPuphJbXOlt
	uqjDRWS81B2INeXSu5zXOtOx7sPYY9qjzMK8p/C9aydxgNgyDc0Y2+t+JlCSoDfIOYZmIKT4LhkVo
	fPrgv8yw==;
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIp8I-00000002bid-11ZK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 13:09:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 574DB1BF205
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Dec 2024 13:09:29 +0000 (UTC)
Message-ID: <3b79fb8a-d927-4261-abd7-b7918d927454@korsgaard.com>
Date: Wed, 4 Dec 2024 14:09:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: zynqmp: Fix optional clock name property
To: linux-arm-kernel@lists.infradead.org
References: <cd5f0c9d01ec1f5a240e37a7e0d85b8dacb3a869.1732723280.git.michal.simek@amd.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <cd5f0c9d01ec1f5a240e37a7e0d85b8dacb3a869.1732723280.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: peter@korsgaard.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_130934_450595_273F0371 
X-CRM114-Status: GOOD (  16.62  )
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

On 11/27/24 17:01, Michal Simek wrote:
> Clock description in DT binding introduced by commit f69060c14431
> ("dt-bindings: rtc: zynqmp: Add clock information") is talking about "rtc"
> clock name but driver is checking "rtc_clk" name instead.
> Because clock is optional property likely in was never handled properly by
> the driver.
> 
> Fixes: 07dcc6f9c762 ("rtc: zynqmp: Add calibration set and get support")
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> Cc: <stable@kernel.org>

Reviewed-by: Peter Korsgaard <peter@korsgaard.com>


>   drivers/rtc/rtc-zynqmp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> index 08ed171bdab4..b6f96c10196a 100644
> --- a/drivers/rtc/rtc-zynqmp.c
> +++ b/drivers/rtc/rtc-zynqmp.c
> @@ -318,8 +318,8 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	/* Getting the rtc_clk info */
> -	xrtcdev->rtc_clk = devm_clk_get_optional(&pdev->dev, "rtc_clk");
> +	/* Getting the rtc info */
> +	xrtcdev->rtc_clk = devm_clk_get_optional(&pdev->dev, "rtc");
>   	if (IS_ERR(xrtcdev->rtc_clk)) {
>   		if (PTR_ERR(xrtcdev->rtc_clk) != -EPROBE_DEFER)
>   			dev_warn(&pdev->dev, "Device clock not found.\n");

-- 
Bye, Peter Korsgaard



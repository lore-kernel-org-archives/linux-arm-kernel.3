Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE59CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 19:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIedPjNOry5bnWIXsnCcB1EKHyFMehxwaeui23AiixQ=; b=pOOEVvp6TkuU4k4YWQPXXsOUPd
	m9aqsyr28UcQc/3Q+/nAbT+/8e4RTLqFhQnxP+2aAH0jBB9m8mmNVvdx1HN7jO9N7r5LZH0Pr/qMz
	U7caX74sVuLseXi2kZB8XywO0mZaXVtGxGrEyBQwmyqq+9aWzhnv3W32G9j+KhlTKyFGMwzDWE9SC
	Wnb+cRGmoHudyVelW6ZjAQWbYL7y9j2YopdoKkeLQXN8EWe4xUQAa3GhmV/w5bf2Hbl3r5fbgfC1D
	tHx+uo1c2M5GbY75kM7Gn6fHfX1zqiXtMAhxC93je5UWkJXW+TWltzt9oAXJ/kL3Q4thJwJuQkVgU
	PDfUDJjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvKem-0000000CQOk-3GgH;
	Sun, 07 Sep 2025 19:02:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvKbx-0000000CPjX-1PYC;
	Sun, 07 Sep 2025 18:59:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B9CA43458;
	Sun,  7 Sep 2025 18:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF0EC4CEF0;
	Sun,  7 Sep 2025 18:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757271576;
	bh=oSyvOvb8j8bP0Da0GGBZQb4BblALsQU6B8rsXjZ9ZOk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fAwo5v06UzD/wkFaAA+sllvIyMHV8S3qNHNwdSeVpWHGfy2RpVm+6Kd9l6b6Q/dRS
	 SF8X3894mISPfqI2DBYAIMmAevspWYGQb4CtZQ02x9zEYFfhulS/iyC/x3SejmHAfb
	 v7SqEBug+4sD4BtzUZKV6uGEnb+CLZlqmT4LQfUKIg1KYv67YzUwasm51fE4fFTMJO
	 xI7UKG3ZKvrpX3qTVcwbat6AtWWAmXO0iw4IQY35ZPI+zmIbcdOPHVwEoNPKd5eK+8
	 iI0SUyyF8DiQs94voJ0N4XQi1wvtw1CAtv80NHi2d1UWkE/FVBtWYfUIwEJMmUjZVQ
	 zFrEZh+o0uJUA==
Message-ID: <e0659b64-eb6b-4990-b3c8-71195f143c85@kernel.org>
Date: Sun, 7 Sep 2025 20:59:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/22] usb: typec: tipd: Update partner identity when
 power status was updated
To: Sergey Shtylyov <sergei.shtylyov@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 Ran Wang <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 Hector Martin <marcan@marcan.st>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
 <20250906-atcphy-6-17-v2-12-52c348623ef6@kernel.org>
 <f09dedfc-1f1b-4416-b854-9c4059ba264a@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <f09dedfc-1f1b-4416-b854-9c4059ba264a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_115937_401844_221350A6 
X-CRM114-Status: GOOD (  13.64  )
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

On 07.09.25 10:54, Sergey Shtylyov wrote:
> On 9/6/25 6:43 PM, Sven Peter wrote:
> 
>> From: Hector Martin <marcan@marcan.st>
>>
>> Whenever the power status is changed make sure to also update the
>> partner identity to be able to detect changes once de-bouncing and mode
>> changes are added for CD321x.
>>
>> Signed-off-by: Hector Martin <marcan@marcan.st>
>> Signed-off-by: Sven Peter <sven@kernel.org>
>> ---
>>   drivers/usb/typec/tipd/core.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
>> index c7cf936e5a61a331271c05b68ff1b77b89c0f643..cd427eecd8a594b7e609a20de27a9722055307d8 100644
>> --- a/drivers/usb/typec/tipd/core.c
>> +++ b/drivers/usb/typec/tipd/core.c
>> @@ -635,9 +635,16 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
>>   	if (!tps6598x_read_status(tps, &status))
>>   		goto err_unlock;
>>   
>> -	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE)
>> +	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE) {
>>   		if (!tps6598x_read_power_status(tps))
>>   			goto err_unlock;
>> +		if (TPS_POWER_STATUS_PWROPMODE(tps->pwr_status) == TYPEC_PWR_MODE_PD) {
>> +			if (tps6598x_read_partner_identity(tps)) {
>> +				dev_err(tps->dev, "failed to partner identity\n");
> 
>      Perhaps "failed to read partner identity\n"?

Yup, good catch!


Thanks,

Sven



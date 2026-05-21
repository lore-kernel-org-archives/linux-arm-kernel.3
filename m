Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A854DCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 04:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHJdlp8AjEfGkrsw8lP8uUlj3bryiS0jrnB8jGYDOZ4=; b=h4OWN2MKmeMLivr+z6RgXXEfbM
	5W75wqVoMtOykOGJ0ffnHP0UD1VgrwYjgCkXAcZZAo1oxL6m7+G5nx8e4s7jV0uLgXlg8eQWM9E3v
	7R2g7Y4hmwLpqG4nWdzsev/e2KTNkE90MCDRlI3h+Ntm6SZTSm/Mmyox//VPkFwQouPr46IBtZqO+
	lvliboiNslN4BXIDBgV6f8/0bEfvEHqr1X9LkfcuPkLq5zxBePHPEG+tIcZr2Y6uJ/YKbwQX1BE1N
	BMT9eeeK7jANcCvHUjE73vRFtAkL52CHx7nzfwWoLfEr28GehpGIny4YMVGR6pDeMjxaWrRdIiBEF
	dkCeBjeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPupx-00000006dYv-3MGN;
	Thu, 21 May 2026 04:16:45 +0000
Received: from mta.al2klimov.de ([2a01:4f8:c0c:a5b1::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPupu-00000006dYC-3jhS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 04:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=FABcNe6oskbq
	qkAjfTtga0oHVgNz5XP1ZsDdWza/99c=; h=in-reply-to:from:references:cc:to:
	subject:date; d=al2klimov.de; b=olNmLvY85uUrfxAlkyYOI1lRGglL/a1DxB7a/e
	ep65VjsHLETXQiZ0mfh+EG4478+6inqXpAHvLWZd7B66Cq6zhXqxj8QnLEV0/u00d0paAp
	Lk1YcczQfhGb5LSKKgXwbBRFY+FLqDJifb6zdhO8OtplINti12mbuDOGIDZbObJLMMNSTp
	0nJRF1n3GAXct7azIxaBLK3fFkE75hnRpujeO+gaGrr3dG7ZuPbT5k7MxiSqIOV8t4sr77
	mCb9jflzMebHe7uDOSFAUhr0Goc6wNSQTd5B7L8w42wgUl078uIoJBh8xnL5t5eYwzFnCQ
	NAkhj7VTA++l7DbSnOoawBhg==
Received: from [IPV6:2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5] (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 81cc9bdb (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Thu, 21 May 2026 04:16:41 +0000 (UTC)
Message-ID: <cb81262a-5327-41bb-9ef6-9cd91f1be0f7@al2klimov.de>
Date: Thu, 21 May 2026 06:16:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: moxart: fix refcount leak
To: Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jonas Jensen <jonas.jensen@gmail.com>,
 Mike Turquette <mturquette@linaro.org>,
 "moderated list:ARM/MOXA ART SOC" <linux-arm-kernel@lists.infradead.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260520175552.537603-1-grandmaster@al2klimov.de>
 <ag41wJBhdK7-Zynb@redhat.com>
Content-Language: en-US
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
In-Reply-To: <ag41wJBhdK7-Zynb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_211643_231389_14FA7222 
X-CRM114-Status: GOOD (  15.33  )
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



On 5/21/26 00:29, Brian Masney wrote:
> Hi Alexander,
> 
> On Wed, May 20, 2026 at 07:55:50PM +0200, Alexander A. Klimov wrote:
>> Every value returned from of_clk_get() is supposed to be cleaned up
>> via clk_put() once not needed anymore.
>> The values here are used only for error checking,
>> but weren't cleaned up until now.
>>
>> Fixes: c7bb4fc16ead ("clk: add MOXA ART SoCs clock driver")
>> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
>> ---
>>   drivers/clk/clk-moxart.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/clk/clk-moxart.c b/drivers/clk/clk-moxart.c
>> index 3786a0153ad1..7e191b1481bb 100644
>> --- a/drivers/clk/clk-moxart.c
>> +++ b/drivers/clk/clk-moxart.c
>> @@ -39,6 +39,7 @@ static void __init moxart_of_pll_clk_init(struct device_node *node)
>>   		pr_err("%pOF: of_clk_get failed\n", node);
>>   		return;
>>   	}
>> +	clk_put(ref_clk);
>>   
>>   	hw = clk_hw_register_fixed_factor(NULL, name, parent_name, 0, mul, 1);
>>   	if (IS_ERR(hw)) {
>> @@ -83,6 +84,7 @@ static void __init moxart_of_apb_clk_init(struct device_node *node)
>>   		pr_err("%pOF: of_clk_get failed\n", node);
>>   		return;
>>   	}
>> +	clk_put(pll_clk);
> 
> So this immediately drops the reference to the clk after of_clk_get() is
> called. Can we just remove these two of_clk_get() calls since they don't
> appear to be used?
Not if their purpose is to... idk...
check whether device_node is a clock at all, maybe?


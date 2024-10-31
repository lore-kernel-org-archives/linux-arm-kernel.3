Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D77E68975
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 11:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PozbzDh8fynP/sDrQGC3kD4ausHypQY0l1L7spYdSv4=; b=QhD6y5JrDqXkPN/huqgOWoWhh4
	4ebZtllAIOp1W1237UD+2YkO7zkbKjcI4GTVkdxTy5wVW3JLlXVT/ULn9qvOboJi2m6x7L0fHsnkh
	ykpnbdxylw+aven8BOo2YE1HiZUNNBjMh6B8oRv+4VdpAPgsot9sM15zyPTEUnM5DplLBc8Z31mbO
	cSpz8bNzm15fq4/j535TKk/kUc9m8+xtjW1/eLciAncG6gKOJVp/z9Gji8EJ7FVBB071YKiWX5qvQ
	l7tbsax2DzowZ7vGtmbZdQZ+YwrEMyZ1xCBic3WtCYMbAe1N1JckU5X9jzRHB82G68y1BoqfkjnsA
	qMLEfH2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6TAH-00000003MrW-3EF9;
	Thu, 31 Oct 2024 11:16:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6T8d-00000003Mcb-03sA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 11:14:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4319399a411so6962875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 04:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730373289; x=1730978089; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PozbzDh8fynP/sDrQGC3kD4ausHypQY0l1L7spYdSv4=;
        b=dCQmxxwBYrbGJKmWEdWoCyZ7r/B5Nc2AFkO9yto8IwFTW3zlhUTuakaJb9FN9yj4ac
         hqIHjKeDRSkspo3YneKFggiHoxWrooe76U1v8qBtTshBMlrplVZF4pExIl4Z4AGZvPqU
         563F+9w3xeTo+TqghbDKr7xIHe4Z57T2a6binfgJuPIHrt1sOEFqkVqe+y8sDMyIT+bF
         +snz15R21KnDPvUUBrBgNf32c35Rj2z3/PUCUgqwfthidnouJ9NDagVt1hIQYn0ndazg
         VVyWJhMxIONPAokctOdOsiJJzRRtvU8PY3zqiQHo9AteWp+lhtHbn6J2ZizZgPP3Almw
         pf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730373289; x=1730978089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PozbzDh8fynP/sDrQGC3kD4ausHypQY0l1L7spYdSv4=;
        b=mN/nn8Q+Mi5u6iQTw28hzcN9LIoOg9YukVhjzhFPmIlQa8p8iMcN7WZiZVdsDvA/zI
         EJm8mLzN5pvD1bd3k5Px09KSeu19yKPzJyGYbprdbfj+3lwZ8j6XADNPiSDBoop9Rszl
         QL5jMCNm9yHqC4BZQRpfmxrvxujeDvppe29+dSShQsW6aa6Iga1tGQn0QCWbYRAN03Pn
         HlsqQwjKwroA8lwsidnM342lDEeWfKXVBl85nhoBiOEBUJPSnral3oM7P+/eCFisvg9e
         gspD7WTc6UljMbMvtzWV+qc/qEKzt7e7VTzBDqsijBCUZPVg9SvweYr5MBUCUuIV9N4r
         wu9Q==
X-Gm-Message-State: AOJu0YyyzhewkPTzZjoudNGW3RcaIVb6oea+ZgGUs196Bgblcni9a8mc
	iV+b6jb/0c+hE1rTih+sQjQ7cWLTipEyl4CQMBKkZ0tII9VWcXhu
X-Google-Smtp-Source: AGHT+IGfEhgylwo9HDbgpkO/tkKXN2QtV74TWAjukaY+u8rp50OfYjIiD1MnYUAdd0nzH218OKjcjg==
X-Received: by 2002:a05:600c:3b9c:b0:42c:bb10:7292 with SMTP id 5b1f17b1804b1-4319ac70754mr181762525e9.1.1730373288597;
        Thu, 31 Oct 2024 04:14:48 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:d7b9:afdb:c541:d023? (2a02-8389-41cf-e200-d7b9-afdb-c541-d023.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:d7b9:afdb:c541:d023])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca8eesm52772575e9.43.2024.10.31.04.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 04:14:48 -0700 (PDT)
Message-ID: <99b12dee-43c3-4007-9c55-e2a884fc662b@gmail.com>
Date: Thu, 31 Oct 2024 12:14:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drivers: soc: atmel: use automatic cleanup for
 device_node in atmel_soc_device_init()
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241030-soc-atmel-soc-cleanup-v1-0-32b9e0773b14@gmail.com>
 <20241030-soc-atmel-soc-cleanup-v1-2-32b9e0773b14@gmail.com>
 <dfa83464-4632-45cf-a257-b9d9739d37e2@kernel.org>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <dfa83464-4632-45cf-a257-b9d9739d37e2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_041451_089387_E4131183 
X-CRM114-Status: GOOD (  21.84  )
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

On 31/10/2024 12:07, Krzysztof Kozlowski wrote:
> On 30/10/2024 18:10, Javier Carrasco wrote:
>> Switch to a more robust approach to automatically release the node when
>> it goes out of scope, dropping the need for explicit calls to
>> of_node_put().
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> There is never a "drivers" prefix. Especially not first (because as
> middle appears for FEW subsystems, not for SoC though).
> 

Thanks, I added that by mistake. I will fix that for v2.

>>
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> ---
>>  drivers/soc/atmel/soc.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/soc/atmel/soc.c b/drivers/soc/atmel/soc.c
>> index 64b1ad063073..298b542dd1c0 100644
>> --- a/drivers/soc/atmel/soc.c
>> +++ b/drivers/soc/atmel/soc.c
>> @@ -399,15 +399,12 @@ static const struct of_device_id at91_soc_allowed_list[] __initconst = {
>>  
>>  static int __init atmel_soc_device_init(void)
>>  {
>> -	struct device_node *np = of_find_node_by_path("/");
>> +	struct device_node *np __free(device_node) = of_find_node_by_path("/");
>>  
>> -	if (!of_match_node(at91_soc_allowed_list, np)) {
>> -		of_node_put(np);
> 
> You just added this code. Don't add code which immediately you remove.
> Squash two patches.
> 
> Best regards,
> Krzysztof
> 


As I said in another thread, I split the solution into a first one to be
applied to stable kernels, and a second one that uses a more robust
approach that is not supported by all stable kernels.

Best regards,
Javier Carrasco


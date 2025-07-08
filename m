Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA658C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 10:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFaofTBqf3jJFFOESX3JkhI6vcB/g19rZziWAPYTo4g=; b=NMDWS3VvUo6YEq1uN94rMppISN
	ds/dlAv0J4ygzdaBQ5mXTUyNO62KtEC5s3TWFvia0t0RDuWRzB3S7Vldt8UlvG6xV/JOGczEm6htD
	VHK2McNLcrEZXc2ENcbKg6s7gCYZ33yhLou7dGHBNtxml3guYGeiceuho+3yzUxUf7gTj7FceU/HY
	8LUwNWN5pPfCEV0ZB6ph0JLHHtOOuzFhDfbbHg/wjMvAl+pZwYpVW/1EDuWLf8d4HA7fWlkN9zoS6
	LiAz4gubcDZsQ4xbjqEhPm06ZxxYYIccsZU56OcAYxIfGphYx5FXcZdpWb1/xxRU3LA8Ias1S0Yv0
	wh3fDfiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5Vh-000000053n5-2KWF;
	Tue, 08 Jul 2025 10:25:13 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5D5-000000050iv-1wLp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 10:06:00 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso5626958a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 03:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751969157; x=1752573957; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AFaofTBqf3jJFFOESX3JkhI6vcB/g19rZziWAPYTo4g=;
        b=LjF3sCqQ8RBXqNpGWbNp7XFNvqZlLrk5KSp+52EGzAEJ+w+3wxLi/DeGgp76AYNEGZ
         Zo8hY2kVlrTzFHjpbopCET7ywWRNdAH7LsdxuygzOpL4zwciHT5CzVInfMGvmXBKWkLn
         qU5oi43YETz3NJ8cT3pcTD4oUBeufaR4F7/O3b4Zwc/XaAEzRzr2PkzqYoINWIRFX9Zc
         OpeeMHvENdlkZ8YVIJBGLraPY8O+CoNct7+LNiUOTt1OoRvNExyi+/gSv5xaTmXwOXTl
         JhrXl9UrqfqpbiS5cC8OO9JkJHYra1Kkg568iX0Pp/A3p0SFQL5pZ9EEnkcElpc87F57
         Mk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969157; x=1752573957;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFaofTBqf3jJFFOESX3JkhI6vcB/g19rZziWAPYTo4g=;
        b=YSHfceWt9XEldAsLDxS/w8lzJN3WXMsSEiDmkbT8bO6FT5/n6wppY+Gc3R3nJ/OD17
         EkUYWu+a4sap+XYHze01zY7RV9LZLqBmLqqRGw7ltxslwggwXrqvo3wiDLqzBqU62Gom
         Jx0WT7zif2DDe9KzL04S/C9eX76tpYmFaB/LaRdx53d5Gj4XhFKcUhlucdVKViRh4PfO
         cBoDrOpVgeSCMcIoPx9UKbc2lsIThe+ehpv6b8CHKLHQgss5vTwbbwAdEEQ6uv7da+de
         b8YiBTMDFlPXOMvz8E808EZvUYxPcdG9IvrkU3BAwTs22HC04M33KsgamIyxW4IqEaON
         +ODA==
X-Forwarded-Encrypted: i=1; AJvYcCXsdC14m2Wu3FG7I4D7ORfudFAXeqVYCsGG22GBI3Us+6uRzbq7tsMArYGssR9MVfmdwhSHntcggwAQs0k6AbRa@lists.infradead.org
X-Gm-Message-State: AOJu0YysIruis9bMI331jRl5VN59q+znuAUPzd1HIySMtt9Ih+wG2K7r
	rjzTjtdWJv3L7KB1x1B6GkkihbQnyeKk7ugssJAGZg/Bnsfa7+q+x7WJJY6lY0iwsR49ytNk+1w
	WM7Tc
X-Gm-Gg: ASbGncuUW2/QkUZKqQMhxc4a9vY5NTZ6ifE8PSSHkbsRXMGPCJlsZOXYOsi486BxNkf
	UkXYhzA9CdQRbTb044IR17D0D9ioPBRGgNytEyxZ1meh06eVcT1WvNMusH07Yh589z4ThGgWMVl
	yJTjxjza6GUWYv3ErU+S5YVa4XYRIM97gtLK0dg5tHSvO1EmHihs8uAcMIFMSp2I+oJ3xw3QtxY
	uRj5j2xldjAvhuaWARktlEjehlQ/4LsJQzf2BwvsauHhPravtkdATwD5VpihRJqV4M297Gl5X4D
	g6KlEon1fI/x/nXRdSjBcG/EHzUD4GjBhOd+X3rRu68HIDtEUk4S9EPqM/forCEtPJvRmg==
X-Google-Smtp-Source: AGHT+IH1qd7qj95HCNmkjaef2cJo2Z48HEAQTcdtLEjCxkTcfgtf7esYUZor7+6jXUs9BBNtYqwt9Q==
X-Received: by 2002:a17:906:24da:b0:ad8:a935:b8ff with SMTP id a640c23a62f3a-ae3fe59934amr1264867466b.31.1751969157067;
        Tue, 08 Jul 2025 03:05:57 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1d4dsm881665066b.178.2025.07.08.03.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 03:05:56 -0700 (PDT)
Message-ID: <4f45e4d3-9b06-4669-ac1c-c277b9402831@tuxon.dev>
Date: Tue, 8 Jul 2025 13:05:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/32] clk: at91: clk-sam9x60-pll: use clk_parent_data
To: Ryan Wanner <ryan.wanner@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: robh@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 varshini.rajendran@microchip.com
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
 <cc085ca99d75fe59c13acd74782d8437bbc1d65d.1750182562.git.Ryan.Wanner@microchip.com>
 <486d447b-9984-4044-a620-1d73ffd54111@tuxon.dev>
 <784f30a8-e524-41fb-8b14-99483116e657@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <784f30a8-e524-41fb-8b14-99483116e657@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_030559_563790_AD869560 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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

Hi, Ryan,


On 07.07.2025 18:24, Ryan Wanner wrote:
>> Same for the rest of patches in this series following the "Remove SoC
>> specific driver changes" approach.
> Would the best approach be to make every patch atomic and change every
> SoC to match each clock function change 

Yes, this one.

Thank you,
Claudiu

> or put back in the sama7g54
> clock driver changes that where combined?



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7DAD79767
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 14:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=910J1UI5RUu55yEnGPJEmz7p8s1QIpf16qA4HfR2YUU=; b=pOF48ix+5+mhkBC+Nixn286eHc
	d4kgjiSDk9zHF6/b1fOBtXfxl8pxbE3tAZO13sax/Ng9erQytQZmp6CgBBfRkPEsPghkbRFPi/scz
	63zgeWH+fE1fq9yxbhZdoMGBSZZLphw01rtdAtCoCvFJfwakagUekSGK6+gOR83YgUPkmVPbChiLl
	DQKe5K3XDVI32D1ngCQ3x9LX0iQoN4sqh9It7mCa0RdyhfVYWljZYky+r1jycXhgBFDdXY/F//5FL
	1zTvNn0LyhKoqfMpotfSDEDWKtxeDheizuCRTgAet4iBkGONGJeh6fu8v8QttBTsEooy10g60btTg
	TUGXRhKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBaP-00000002foW-3n6n;
	Sat, 31 Jan 2026 14:04:29 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBaN-00000002foE-26Fy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 14:04:28 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4327555464cso2198142f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 06:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769868265; x=1770473065; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=910J1UI5RUu55yEnGPJEmz7p8s1QIpf16qA4HfR2YUU=;
        b=eipfScgS8bLami+G7HV2WN8uiSM6ruHqaao/F+DUmZrmtX41eD/QSsAwUySVZPGPTY
         8+VduRO92hos9FLK8A/ZoU/6GvKrZnca65u+bn9k2uC9SX4fBDuIB+5wewu0ocKXNw3a
         G4A8TLJzbFQX6zH8dwroE4Xw/7s9fNy/JM1+kmlgw+ges6KNnKj3wpY7x1RyjE7JUIM7
         ImdndP7wKxRsx6p/jqX5jqfrmhIrz1+GrnHeUXv67hg9bkD4/Hab6dMOO3ZQyglZC+aW
         QbtriYaoL3sF1VFxp5lFTHLlyflSrCQOVrC58Fw9eJXGrmIMeadtG5SYYpJtT9fTuG0d
         Jzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769868265; x=1770473065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=910J1UI5RUu55yEnGPJEmz7p8s1QIpf16qA4HfR2YUU=;
        b=rLDa0zN/Yq+ZpS/luae6B0kgWS3C1NJ87/twvFRRzN5l6CgIBCWLrnn8ec0XwERKqr
         hijHcvvw3O7aPTnP8NNVrWzYWCszGibnRsLeY7avPUWapjUh7fd+3snDgBSrUCiyHYBu
         Dxi5jKLtCGdNJxrtCroG5nZxbFHLxFd1FXcY2rjQALl6TZRItcw8J5rqF024JqPWTG5f
         yENSDH4D9q7zlND5Ka5XuPbCBdcFEC3R1vcaIVKzzP/rvVvTwxwg+figJaO52BexABxU
         k7nyaXHy3f8xcRleDgn27dC9BXzZ5ysCC7meMsnDy/XpDJliXYeO7zI+6QWkl3FI3FWt
         iobQ==
X-Forwarded-Encrypted: i=1; AJvYcCULi/r/gFMjjWEIG34DDgdIp57ie9UQeQoOVOlWU5BD8guxTuk9U+RA74M6rn0ORdKUJpDlaJuQxN10DO4vd8/N@lists.infradead.org
X-Gm-Message-State: AOJu0YzkRo7tGT4AStKFkzDACNt0JcWXAmvntuSLxP8l8v0f+vTlVNeL
	xyiuEUwKz2KabujJN8aZW0g7JAHqJSB8i1JcK/7ri02/8AN6IWWgZT3UiMkml5+a/MQ=
X-Gm-Gg: AZuq6aIcdXhwjrqKXvNs5H7cBxjSEGzuwGTrVUTyqICyCY/YH1F3KP/ETmqTxwyR/NR
	fTq468VVw75eVXIngW2QP2U8pxqge/6ZKTJIydGs9WKV27vYWGWQOybCYI8k5jFMvb7gjWT3pZB
	lCgFhdWjhmkh24n4VvdP4fZrmZSpAupRH0ma9q8v/iG4ZrygPBn/Alcd95pJJ+V5WI4mReoz7Nc
	7Uc3oAE1XfxQXqm3SwxegoVlbi3NbSp3d7dBneBQVn53pwqJyoCTcJxJdBGexoSoxKMbxs5p8b8
	TNwDEFKA9mZYB8MDg4x/nDK/4MwGG1wQZhIHdJjU1VQ1mzBHOAYZcwqL9iAj5Q39OTCnRRXnfIQ
	vMZMF2wkUGIDuVIIMsYJKA1VY94oJgMqHo+gKZJ/tMfN/rFvmfjbIzCzLXk0LkEkc5ot+qTsvNI
	W/yynmp9uQf9IjimmCcg==
X-Received: by 2002:a05:6000:18a8:b0:435:dba0:736c with SMTP id ffacd0b85a97d-435f3ab9ae7mr9545982f8f.56.1769868265119;
        Sat, 31 Jan 2026 06:04:25 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354205sm30073518f8f.41.2026.01.31.06.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 06:04:24 -0800 (PST)
Message-ID: <16cfbc63-ab19-40fb-a885-6726f829d7d3@tuxon.dev>
Date: Sat, 31 Jan 2026 16:04:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 26/31] clk: at91: at91sam9x5: switch to parent_data and
 parent_hw
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <ad3636006cb67acca4f7dd1a6c54c6f58f0bd873.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <ad3636006cb67acca4f7dd1a6c54c6f58f0bd873.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_060427_562730_A5D73BDA 
X-CRM114-Status: UNSURE (   7.32  )
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



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Switch AT91SAM9X5 clocks to use parent_data and parent_hw where possible.
> Having parent_data instead of parent names improves to clock registration
> speed and re-parenting. Update clock registration functions to use
> clk_hw.

Same here as in patch 24/31.

> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

With that addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


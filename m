Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41E8D79768
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 10:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7ibsvz4bEM1wIwnnEWOnDPfVWQDx0wQWoIiGXA6bYc=; b=at2OK5Azn4QjlmcUxEnm3YSxLt
	G+1CeOoDGLuWxs+pmMjKCU+Wi2JnIdx+6YPbwfQuyoBt2LUlPkgNREvaUX1iXXHKQsGi8j5uH3nhL
	GpKZ4Q4nSCE/FPQ2719ZhSZGHz86J2i0vJk2JJZih0FbbJ9tch06HHPSWKJiM4+wILmNgNlXYKGl8
	kJukoLjV6lZqtjh1Vq4oqrV6yVC3pAza7ZBKODHOdJXwVwzsEydWpAVkrbBtUucbRu9bKgSVZJBeK
	UZ81x8HCHcehY/4bbVztt4InXuIxmgppaYzt2PltHgPCvCm7Y0+JAkw34527Tm/S/72vbrdMe2n7K
	DeM/MNqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8a0-00000002VKK-3pXY;
	Sat, 31 Jan 2026 10:51:52 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8Zy-00000002VJy-1Bu1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 10:51:51 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so2480074f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 02:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769856707; x=1770461507; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N7ibsvz4bEM1wIwnnEWOnDPfVWQDx0wQWoIiGXA6bYc=;
        b=mp1f9jZa6jTqCKYotnvLSTrSh5NAHEylP7BDvE41ZqXipmOS9eVk/TDSjvV0vdmdBa
         IRIZwpnrkRhE2QxEC2ZgD73h2Y0SY+eqaWiD9pudS8th4U243HTlFYBEQFwY/Ig3BuAO
         /wyf9tjN2n1+yrcZtV7X39ImWE7pOsJPX7rTr0vlJ6bEXYp3I7e3dC9/0SnVVL6FrSnh
         E+De8jgXshq24MxkE9xWXXYp2Nlr6q/9oCpBeEWMLZ3sUohQ8FEF1MES/V4VA0/zRPmJ
         TdfK+DQ6DQ4Ao40laWpgKP+XE9650M27oGDU0w4BvT0oQ4OYn6gccnfqbb8NijXquVO7
         BLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769856707; x=1770461507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7ibsvz4bEM1wIwnnEWOnDPfVWQDx0wQWoIiGXA6bYc=;
        b=Yuhu9t3Oo7sRP4WcFRo2GJo4zhh+GfY6z5RUn/ojXeZXZIslm1iaELaGEE/+9GVOhN
         vugjF4TJItK5MD9cUojysGhDUvzfuIkiCbgvAqy6M35XzMQpNbZOfEAttq6JsqzMYWMx
         zkdGfsaWzT8kGciiMcypggDHbBdQGq7FEZ2TBzOYefVawbcb9yZBERwXnW4vG5s6ohk/
         w56ib8NrfBtUYlu5ZhvDBy4L2x1iRhsL6Ny8k3pTg9DGRKtHevX2VEH98W5+EtqoNFMh
         xMkgtIuaamnBkDq/IEqnOS/FsRuGdZstDXcGspJ1jUc4IIeN2BoPhdPXdB1r+UBLRsWB
         rcyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMcpaQEYaBm7ZBhC/xY1r0KlbzWI6LT8YBOm5En3kk2z3RP5xzSKJHnbvO4ogHtL0hy2H8V7iocFxCU6jv22Fk@lists.infradead.org
X-Gm-Message-State: AOJu0YyvMCsD3GyI1265EA9+CVJ9RLS3OtamCeF/IqMlvotC8DuhZi7W
	MUZRUjfFDA7CKwkzWETJgT1TGmWdqsC6gev6mTJAFqtS9gGDzfnAjmZIignFL/Y0Zrg=
X-Gm-Gg: AZuq6aJ+dfbU/6llOkeI9zayBBXTNfCY8HAID5buqc3oYLcbgSNZdtgRW3FRPjLzhHK
	4zRguxV+4HYIs4+yUnmVX2bpUegbKT8eaENaeSLGZvWZJmUIvWmXY+0+GzBt4DE3NKv5e0k1cqD
	sS7ld/LcrxjjgpKxMkSjWXSAidT+ulu03FM0sbKNGIaA6HwE7nCme4dEcfBz7/C9LrnBcLy0hI/
	IkXjRzSytRgrgTv3XN5+tjNJCOp512rtwREG4S9sEy9dweDYXtfdVPKp8VWpasdUk5n6gn47u6Y
	FLZRhtLZwRVCd5lPR1vZo2UntLIuQ9W60jfkjI5sCALCp6MYSI8EdO9AO1/JvrvWLAgwTXOVPuE
	L+U+nVy+4shFVwr6F0xND4iRmEtZjfaRSWZG5g0M8NxD68LeQONSWKOY7JbrrnVv2sPODclPBTw
	5/Y3Yi+CssBa7+mMSZm7XeyYA5PcUprPzbAXk=
X-Received: by 2002:a05:6000:2887:b0:435:9950:ee1 with SMTP id ffacd0b85a97d-435f3a62ee4mr7418313f8f.3.1769856706636;
        Sat, 31 Jan 2026 02:51:46 -0800 (PST)
Received: from [10.100.159.246] ([213.233.108.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edfccsm27625501f8f.17.2026.01.31.02.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 02:51:46 -0800 (PST)
Message-ID: <49022192-04b9-4ed8-baeb-706edb6e1322@tuxon.dev>
Date: Sat, 31 Jan 2026 12:51:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/31] clk: at91: clk-plldiv: add support for
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <ec232782a91db7a345deea48785bfe3ca35d60f0.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <ec232782a91db7a345deea48785bfe3ca35d60f0.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_025150_435034_1DA52C11 
X-CRM114-Status: GOOD (  12.85  )
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
> Add support for parent_data in plldiv clock driver.

I would replace the following:

> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.

with something like what you have used in patch 13/31:

"Having this allows the driver to conform to the new clk-system API."

As with parent_data you could describe the parent-child relationship with either 
struct clk_hw pointers, clk names, indexes...

Valid for the rest of the patches that uses the same description.

> 
> All the SoC based drivers that rely on clk-plldiv were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

With those addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


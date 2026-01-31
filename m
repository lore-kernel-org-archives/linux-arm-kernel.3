Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342CAD79779
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 14:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPASrS/+kB8QrypRStznqMhoP1hS5CZGPnaCbqEYo5w=; b=ldbGQM+puWSDu0YZrzlgzdixA8
	yZKIcbcB+OFM4B76pvV2CUtm6dyqr7ZGgeamFGNlrrp5GCHMefCW1GYT8BOE6GgHc2/zcuP790o+r
	smMP80CWHLyscLHcavgPHKw1C9prbIExF3P6j2vPCyEe6Q2qQ/yBW05grZUISEbrtLDttX6QeNWo7
	fAPPIbHYsj7TIhZ97qzfucRJM9Q8u+f8c7p01eOwcss6yg/Nf/QTcr3zTChrMemrrefJbB9hPga+h
	lFNDHYkc//TeClRr1VdJmWIfMIp8HXYJ+s4S0xDsYEyuXcPPdGWeFnOnjvJlhrbVlCLfanqEq//dv
	rQAbv7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBuq-00000002h9h-0za8;
	Sat, 31 Jan 2026 14:25:36 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBuo-00000002h8o-0V9O
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 14:25:35 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47ee0291921so27795925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 06:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769869532; x=1770474332; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QPASrS/+kB8QrypRStznqMhoP1hS5CZGPnaCbqEYo5w=;
        b=qi4VH41lREp2TxtpSogIV1oXo9fX6wjV9Xw5gEYp8Hccbu1ukrJglcYaGIE6VjQjwJ
         qVBV0jCWhjcyxWGgsEI6N1o8gy4bZhR6/dkp7w2eN5rkziGu8me3o1E7MfBNM+AoLDsM
         /CsJIHO7ydYUDgCiIXKgw/wCQ/TPRT8639wrICdJ8TveF67PyQQ2S/qsH73orc6/S7SY
         TuOHJ/dfv8aorj0zhYH9oJaYr2ZkG38TtYRHT6IzW3S6SjdX6cYNpjCs4+mSATzIEx4I
         M0ZKxHuuYD+9viUyuyUFUiArN5Js1aEdqEVf0vmuODy/02+jSaxA83a+jNOyyxZf+zEL
         NzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769869532; x=1770474332;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPASrS/+kB8QrypRStznqMhoP1hS5CZGPnaCbqEYo5w=;
        b=bFWM47aMMVxSFMcqCYDk7LqF7c7c8tHJhSb8ocCp3ei56oBuueFnDrqkibbj3AmySS
         ABo+M6BMxx32xGeLBeyvxN6ihipYK+Fw571plbsMAp95f9XxmmZvFJUlejmbEfeaZZHF
         U6gKOn8dewKPpbvyYq8mb5tbPtOzEfgjl6MIkMpqsr8shbyRoC8nWkjzr98nAjB29uxd
         4+5MSOXwmbxrvFHu7X7JkZxsSX+3jqhrsuPH8fnQL6h6u30+FzTGw2+QrOZEx03R9fdS
         tqySoAmXl+oLYRq0EMUy88VICtTXavBlplSpYUlfxyy+EsLa9o+jxK1txw7nGXd8/BvC
         XO9w==
X-Forwarded-Encrypted: i=1; AJvYcCXXNKdyrHwOkkqXlvCZ84zNFlguaeQsOoRBQTUBbVfCY9b6GH7tTRQZjWV0XfS56rEY2WdkOWtWXUTiUcT2gsLk@lists.infradead.org
X-Gm-Message-State: AOJu0YxTZ+ZVaa79NUOVYV6AecjiTwkbCjDozxBrJt6KR5wkM8R/f3SW
	o2++l1ecMM2Bh+X6H5wv4j6L4llyRNogY2s7HFxIQJ4nVaA/QvYEb8d9zMKochpi6z80uO9g4dC
	F3u7B
X-Gm-Gg: AZuq6aJ4alrk4pOjsd/qjUO8si9p9+DPwjz+8U5zWEyFrd6XQ6XdwX352o1ditmmh7x
	QpiOM+Qruvd8RC03UfoY2u75ieFIuSD0S/voHNYyJa3omwsIeSwSSk2jVjlpcOka8f0AV/fihc9
	/+l2l/OqycfaoSAc3lHuctPavRFE8B66TaAVM3a+YhccgZROML/rxY8wDKOreKfD++L7FC17wYp
	6uA2MmtltAVexPCzclqbaV7ld74vdcIZ1cKulPIJIlVeiFboWOMWhTY/kPvr1ZYtfRxK++lqOZq
	UWmGemHBK6SFfoyWQ4NZmNZpc6efKEbfqd+HHgTvPDkX5vkmrTaqop3hmETvDc+hsbQVpin3Pbc
	RrufoTPcsUJDAanaAza+g9yOcqs5AdyA6Ya9O7k2yxwb32wupKtQ4q/9lXARAdw5nL+F9nqMfiO
	WqtT1u0Vk743evgQCdB1Ed29OJABZW
X-Received: by 2002:a05:600c:c162:b0:480:1b65:b741 with SMTP id 5b1f17b1804b1-482db4ac5bamr71713115e9.15.1769869532253;
        Sat, 31 Jan 2026 06:25:32 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e474csm29359357f8f.2.2026.01.31.06.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 06:25:31 -0800 (PST)
Message-ID: <a8e4bb18-46d4-49e0-9787-d2511d6507f5@tuxon.dev>
Date: Sat, 31 Jan 2026 16:25:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/31] clk: at91: pmc: add macros for clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <e89c803000d18109357f27bd17a86885652088dc.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <e89c803000d18109357f27bd17a86885652088dc.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_062534_167481_D6613E51 
X-CRM114-Status: UNSURE (   6.09  )
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



On 1/16/26 22:06, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add helpers to set parent_data objects in platform specific drivers.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: enclose complex macro with parentheses.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>



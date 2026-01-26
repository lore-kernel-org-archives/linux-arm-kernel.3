Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52336C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 08:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1nOQZbLhaI1+7PGCQodbGGrYH7eReTZdiQYyp9qL1g=; b=1keFOkyaE5Czp9LcGzEtAtDrhv
	IbXuaRfosVraFJXF5RnDLkc9eNKev3zHbodw71hzqaVZv5obaciZCWYZjIZ94omkHbY94S7pMLiTf
	jVW2SYX7mMdMJ7clY5FqP1QJ4JJlkMG8oPaH4f7smEDnDM4OBLiR+tQjNaYJ64TxsF9I1zgnG52+t
	0vua9Htgl8oGN4bxTUdR50lU0cfEHG8MLseuGgfeddF4EW2Yu+0Uyrba5fX1Buiy1FbPKWtv8h7nK
	6BW1Ha4ClbI5vD89TQEOac0qq7z0Spo9t036B+SQMh9NU1THfy3oyfQdV0hoa3opK9TyCJQ9YZvdN
	3M/d3fEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIKi-0000000C83V-0Sry;
	Mon, 26 Jan 2026 08:52:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIKf-0000000C81M-2Hds
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 08:52:26 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so48248665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 00:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769417543; x=1770022343; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K1nOQZbLhaI1+7PGCQodbGGrYH7eReTZdiQYyp9qL1g=;
        b=mDwiQwGLJGjpS6In2oX85s0QhT4X0wZK6Eq9J/cfaKMHpuGT3GUkjboGxEyy49FcD2
         Vdhn0eXRFZnJrU0B1SZZzD832YF6BdtERXf/dx3twURE0ZOA/e6Gratq3JRCjCehLEmQ
         mHyZ6ZHuj2EDyoVzUQ3watt33Ws9/EUzdbux7YKRf35R6S2sSoRn+oBb9oEibDAT/mSa
         dG84ZYj9BjF6FTarv9J2fOI56UAf6R15uwWWkorUTCpLvAcl4Dp/Dl7hOPI015hqpM2T
         1vDb4uIgPp9tsT46ua39m5CFwVruTmKvGfvHBLhmg1NWsZHmV+kbEgxo7KCFkgi23KBT
         aIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769417543; x=1770022343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1nOQZbLhaI1+7PGCQodbGGrYH7eReTZdiQYyp9qL1g=;
        b=YY0r4D6OFCyxQ2srphyTMx0sZWt+koThB30feePOAw1c28eZc5HL3VLuTaGqbnyfot
         o7euZWIwGAaoK9tNWnJTEbGeAoT1WO1grqEuWIDKNnHVF82GNu2uFs+bMSi+/pUAQqOC
         YDeZe6otBHYavesFry+1KE1Ip3K6BjQZocWV+BABh53mpITQ5MSNz6GuKCk3PM94I0Zh
         rCpAzY+Hhaluim/2LKs580IarDvS4FP6GHFyZYz/h61az3vYobkV8v4J+RZatb9/bLaF
         CdFi6UYoLnjyajT5SBDTf0H7xmuep+CQrvOR81K9BUOWDbMbr8faFmhjcbTErGNmHOeE
         uyuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB8TtxVFg7Yh0KPKFA16bqxzeWRLEMC2RS/ZbJntz+qQKMlKMgMEjoUVz9aXjTrUFGEgB1yPVGkMPS6jDBcHp0@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy8HuhEukYjyekVFF+iZptMA2YE6y2hQHTUoQrKTHOproI9Yz0
	i10RE2zUSqKrh0PkNXpRTSBVLDbjz8VvmTHKNpcH8ZPVFjyWDPcf/0/HlZZxFHVFi9Q=
X-Gm-Gg: AZuq6aK7Eg7cA/UU8xWIp5klEAcXGzr2MFBiz9k6kTgpE24VOBJ116r14MiEndy9M2V
	Vj7ZJvl9EKFvQ/YTbQjeJ7UpG99bUaSl5d5iZnD49wQHH4vHHMgXpKkKs1CXhXsbHGtIq65gxcD
	NYkdIl+7Rpqkf5BbMeAxU7aLNIVKeXOv4aRTg/MWjjLialVkivlse1SHqneA6MTTzq53jGmF99+
	G1S7IKBJ4V3JUE3HzKXqv4GKvyHVpf8hnF2KRnJN2qhF1DsOw4OBd2J74LpTULmsDfaq2vQtm+J
	Nxbuy8OiZZVrh8aGqH32amPud1b4xOXbWPcTMyExw+6tCXqrSk1sfwPF2mMzNyivrG6WsYrRe/s
	+T92N51GKcJCoPJDRW+pRoNHrIpnhhsQ24rzBa7nE5jSl2ucGOR+w/RXi18reLsMAA2u58rgf9g
	LxF81bu92zwyVUhl6Dhg==
X-Received: by 2002:a05:600c:470d:b0:47e:e87b:af8 with SMTP id 5b1f17b1804b1-4805cf66923mr55070855e9.21.1769417543567;
        Mon, 26 Jan 2026 00:52:23 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbb6939sm99184245e9.5.2026.01.26.00.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 00:52:23 -0800 (PST)
Message-ID: <02eb0831-8fda-417b-840d-d7b5a87f0692@tuxon.dev>
Date: Mon, 26 Jan 2026 10:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/31] clk: at91: clk-main: switch to clk parent data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <1cb33a80d61ee10b77800b9a0535a6b289a84d25.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <1cb33a80d61ee10b77800b9a0535a6b289a84d25.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_005225_599912_1009D83B 
X-CRM114-Status: UNSURE (   9.12  )
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
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of parent_hw for the main clock.
> So there is less usage of __clk_get_hw() in SoC specific clock drivers and
> simpler conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures. This will lead in the end at removing
> __clk_get_hw() in SoC specific drivers
> (that will be solved by subsequent commits).
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip: Add SAMA7D65 and SAM9X75 SoCs to use parent_data.]
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0B6C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 07:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVar5g8zOX9FTPpiuRdJzd042YFwcWfhs7Wgs601zJE=; b=wT13djbxdVHDeFRoXzDHEqjx9e
	1U7N5hTjhgW6JkwxkKAYTdAxjmWKJkLItZAIAAdyUVOQ8/wNKNvPalEeXUmYTqm8OonxC26dYt/mF
	JEJ9tl7iqtGzK5OHb9ARxypYGhjV+i0llfz1Gc8RNj2fY8shvxI29onvqzFXM4NYYbvgaP9SvQVHS
	hUvdlckt00i3XYAVdKqmyoTbN5fDjvi6fCQgJw9JGXlKhTcPraVocqOQF29HGbGUtDBM59ZoHjPvv
	xV3DcQk63IsBrQ3ZApVCzqu/FPTW6T25htFU8Z/sTps/WmRfnbPepm48MppOHXvpT4xCi0Y1Qjd6w
	J0JJqYog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfCQ-0000000BqP0-2ORE;
	Fri, 18 Jul 2025 07:08:06 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uceqA-0000000Bnnl-1q4Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 06:45:07 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ae6fa02d8feso269178366b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 23:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1752821104; x=1753425904; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VVar5g8zOX9FTPpiuRdJzd042YFwcWfhs7Wgs601zJE=;
        b=MfFCQFvb2QBLdR/QZbHoHNxtai6Mm0Yd6CIsueRuErR4ebkvQzRg3/d7wwmHDO85d+
         iH1+34kiP7oLVTwgp36WgFrK67gjRS0QiCQVxQpuJjhzTCYTTTMAmCV4F3oeCT8v0lQb
         2qrjxqsVgNcnbsoL56scyAntUsgzRJXKoEJHrqU7oRHs4VG0DFW1crTFYBeJFIkSLM/7
         BJu7Zw/heanfDv9gWROh8hV8e6tv5pSFq1JFTyULjTb2ldvSt18ASAcOJyLRDV5oQkfe
         ylYgOQbOTftlDSK6bSqzsoSB2u3tUIi11Ii5vj/QZIqi/1brP6oe9cpDARCnqm82wvHu
         xg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752821104; x=1753425904;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VVar5g8zOX9FTPpiuRdJzd042YFwcWfhs7Wgs601zJE=;
        b=QKThsRfGG9UJZ5kU6BcaJKc5V6lhxf8dWrlp6fGRTtjlbjA018gzyMj3MCuKxZreX9
         SrXICpOA7CChQ88aouKhjBPkaHu2y925g5Z+l7dVEiRfpRXmjA7mX/DbRTqmvxs74Kzi
         sVrRy8ldZx2Q+TcaUtjHl+Ma3hw6nM+EmEZuomMnWB7rrFu9VSVa/4i0WyPk5g6ycC2u
         ZCYpuiJBEv5kY565lgBBP5uiAPSoNBg+51NxBE27wEv6RZhhkUY/ElpxeUQpkoqnSEeA
         lqvxSoQ5MmMbgyRV0VwAzbBw+C7fmwTbuLML1OqoG8vpCvEy9XM2pP64/UKzvUQlYF4+
         b9eQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuFLEKUU8TOPXLawkRbG5TOmpeToK95hybgsS4S7/5LB/T60FTLVQDU0B7feu56FHswtn+McYEscYWabUiKbuI@lists.infradead.org
X-Gm-Message-State: AOJu0YzJao9iEN8UDtGhhJS3b3Jxe+z83P9g2rPvgh0vnCsZuqz9lTZ+
	VXw2jLt9EQCLC6UkN45fN+Ol2INruU7u3MP+OA5WnJkYSdjHoYdXnbWbXplFCvsO/yg=
X-Gm-Gg: ASbGncuj7z/MpdNZv1j48JnAgVCCj8nuQVB1sqNi27ULAInCQ+Ja3PMSCmQD0vcmdL2
	Omw+5uAtJkth1auf0VJ9eVosyCRo7Zh3qHugUeEZ0Voyq/wAW1s34jh/m/XCz7vaHEf+ohRIucW
	j7SQY8XohIW7SrB4SnF0sIl9vkr83vGJ6cOo4Dgj7gohME6CQULcE3FsjQL6NrbUDjHNWJ5IBOO
	q+Sm4O58O2PP/1Y+hK4Ptljib984AYy5uHzQHch6Ri3E8fTzD5J0W78OIuWFhXdM5mH6btSQmi3
	5vgmbP88gp0xg/zMFH5bMM49/ghStOA7fOZZrJ9+rDklaqOwfGYbYLdBFMaRzDK2gF+UqcH2JDk
	SYEn2HwHPAZ/OCdto9R3/PbCy1+Nezg==
X-Google-Smtp-Source: AGHT+IHxkNxiwjD0/BPXsctCLjJokMhGtGvK5gTIY+yWmoyQySHcBMCNgSHU8nTNi4mvXEKWD1jTxQ==
X-Received: by 2002:a17:907:1747:b0:ade:316e:bfc with SMTP id a640c23a62f3a-ae9cde242camr688547966b.21.1752821104166;
        Thu, 17 Jul 2025 23:45:04 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6caf80e5sm63293766b.163.2025.07.17.23.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 23:45:03 -0700 (PDT)
Message-ID: <39b57899-4e8d-445f-a3b5-3b7f9ba3c3cb@tuxon.dev>
Date: Fri, 18 Jul 2025 09:45:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: at91: sam9x7: update pll clk ranges
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Patrice Vilchez <Patrice.Vilchez@microchip.com>
References: <20250714093512.29944-1-varshini.rajendran@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250714093512.29944-1-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_234506_548851_6A4E9BBF 
X-CRM114-Status: UNSURE (   7.68  )
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



On 14.07.2025 12:35, Varshini Rajendran wrote:
> Update the min, max ranges of the PLL clocks according to the latest
> datasheet to be coherent in the driver. This patch solves the issues in
> configuring the clocks related to peripherals with the desired frequency
> within the range.
> 
> Fixes: 33013b43e271 ("clk: at91: sam9x7: add sam9x7 pmc driver")
> Suggested-by: Patrice Vilchez <Patrice.Vilchez@microchip.com>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>

Applied to clk-microchip, thanks!


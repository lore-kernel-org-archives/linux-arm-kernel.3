Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CCBD7976C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 14:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnrYWC04zmXsWBUpFT18g/QgZC6dC+R5ETYNbj7MNao=; b=rmGr9zz/hqEonxfH6nMgA95+f6
	/NjlcYf2vhQO0eFNJrEejvtWTdxW1nPyMPSKmr7812Ir67x+DONfhUmBdIULRlZY38rW8HLCBblFZ
	bxXMgQivsX7J0d/8xCbDemuF1e9Ao9+VzAM+Mo8uR2RA5jeyGrCXQJLYIHKZnP8SIR+x56PSYjnHa
	P9c1JWkW6zg7KjfAfHVuwJq9cF1brZ50wE1pO3s66fopHpw1OpLrci3BEDpcu5SyB0hhTzEGZdrhd
	w+PtYvUpFp3mawJI1prtfpBu0Q8Xtc/coek/6kK5ZJPqHPvRJ6RN72EZ437O6dSkfQdRjGYr9DB4k
	NgQXyaqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBm9-00000002gNE-1krG;
	Sat, 31 Jan 2026 14:16:37 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBm6-00000002gMt-2nQA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 14:16:36 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-59b834e3d64so3317957e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 06:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769868992; x=1770473792; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FnrYWC04zmXsWBUpFT18g/QgZC6dC+R5ETYNbj7MNao=;
        b=UqqN/21mYdukW+pc9TPcnOgFfn9eND1UmsSHFB5M46J5LEBGSsDo21MIp39RZoPCeF
         WMYBcbSRFI0BI01bUf5BmA/gKZ6+Y9uqnUbIqPKeTvnCR72DEaThyBtxNskCHxJdaHWf
         5kwPax8Ws1oT2MIeMqst6pDZu5QO5yXE2MPV+9Kks1LcRPIFFoXGCIxCg5Aes93jMvYA
         ZRhC491j6QsxmbiiwaIZ4wjmRv9khI3ZrGtNG+kr4K6+0IlcCxkqZZXaGZhTljxhHjm4
         JsxlvVd9ZFZdAcN49K/VSZi6OYVAAP1CH3Ok8TUvq5Fjr44+Q09svLDbtx3q/WTX+6bd
         EgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769868992; x=1770473792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FnrYWC04zmXsWBUpFT18g/QgZC6dC+R5ETYNbj7MNao=;
        b=GnspMpRkXSJUHYmCSUpqGoImA89ezPh2cGrnqIqFPBoW+7aTsONkpkdLii/0FNGqcX
         NUFV6+Geal44QDT+OCOfUMC8BeYgE/vy731Pvvb2sCTkRDsgoD2S3w3XTZkwWdy+tDfd
         r+OqaIyEcDDMQ4PD5l8pnY33VLGuRxW5zpIa2zXDNLbIJpmj1t9WLo20TVXRykWVtNo4
         CK5pXIcyidM4Ks2QtTkebozNjYCljeBeyx8yhQ+Qe6lJJYivRQmyjuWSXnpEyUKf1sX2
         u+2+KdoA9gurO2Qc34h7jsHfkwpWNujab/90n7zwB0t47QV20VjK8EOjVdcE8DFpLJ2y
         Xf7g==
X-Forwarded-Encrypted: i=1; AJvYcCUKQfsBfrCKu0BBGKRsSMQsDzvbD8uvIL5GEiJbfHIIAGG/wdUqwgIOknqJCirxt1pfe4btqhYz2qLyXx6uKgU5@lists.infradead.org
X-Gm-Message-State: AOJu0YyYuV/73rJP9NqeQZz5weRohr89GokmNpyPJCRrBDP0kQg0UXtp
	FC1xZfc3osPTaQbpfnxH281yb8zCQip9bksVbomIIGnZ38M30VTfq9xWOhwpHHNTlak=
X-Gm-Gg: AZuq6aJrhvt9N8YBkHrPQHGHv0IU3mdC2lwO9zBjlFkRtigkdSXhkSAkm7Kn483tTEH
	LFXOw726hPDHjQGOOS2QAWorB8VlRGXNP4f9OCdbVwVXmFj4+rXJwYTTcvS48rMi05pIvNhnLSV
	cPtF8gxxJQKIXu5yiLFtiLWUhHQP7XI1iw9BjKPYbYgwuWj02Cx22CHyCAjqLN3f5F2zEiOiFdT
	jsO0unlLAHDG1DbHZ77EkvyV9yc3pDqiPIaUgfxq9ikFnPTzY9kod6zpfLj2KknlVux1I4yz8hC
	jI0ocMTDpzec+wWHjodAW/JUMMtddsrTc/wvXaVyrQHkISztjNFYzwTerYoyZBQEdqu7VxdgT8g
	Q2M+QkS1ZzQSAWiIMHGMgRNqun0w3AY6ndPTyLj6XMPcAzmXU3NQfc5HIExsnXUSer81KMhI1pJ
	IXOcBJb/hqZfPRRxd9UQ==
X-Received: by 2002:a05:6512:3d93:b0:59b:9f92:301f with SMTP id 2adb3069b0e04-59e163ff690mr2340319e87.7.1769868992221;
        Sat, 31 Jan 2026 06:16:32 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e091712f1sm2250805e87.39.2026.01.31.06.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 06:16:30 -0800 (PST)
Message-ID: <79673c9e-6611-407f-9fb6-bf30d4971e07@tuxon.dev>
Date: Sat, 31 Jan 2026 16:16:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 28/31] clk: at91: at91sam9260: switch to parent_hw and
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <76dfa9949ebe73621790f62752d6fc77954198b5.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <76dfa9949ebe73621790f62752d6fc77954198b5.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_061634_722397_4415B3C6 
X-CRM114-Status: UNSURE (   7.13  )
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

Same here for the title and description.

On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Switch AT91SAM92600 clocks to use parent_hw and parent_data where
> possible. Having parent_hw instead of parent names improves to clock
> registration speed and re-parenting. Update the clock
> registration functions to use clk_hw struct.

Same here for the last phrase.

> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

And with all the above addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CB9CEB2D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 14:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKvYUG6QyuYwze0pX76iQK1U7NhM2svZNXWBkQgxwp0=; b=zpQEIyGpWSwAK/pSEAR/NRAM49
	DxnokzJHrHjz0snOSVWihaK2JRIjW/wrbrnm3wJ5Sx1QgfDTSUZDTa8tKbxM8IEVPXNhS1yKTENoE
	1VlgdVdrHL1lNhPr9cv/CnrLRMG84IqxNrParU+nTJochZ96utKn8an80b/fuyuac8JRAd4YlIzij
	O2I0XKN7+7M/j8pq4Hi9JnPrFSP9Xx/dghb/OLAyi7HAD/KJNlBmQ5TdUbWzgfjP9rCV6jc3dzrPU
	xFWrHH59pvBhCex75YmD8QGSBLMA8ul+RB4R5pT2cM3pkw4PLw7nk375B1i82Y8b9Qi0w+2kBh4GJ
	tJ/uoOIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKGtA-0000000DpNB-1rHR;
	Sat, 15 Nov 2025 14:04:28 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKGt7-0000000DpM0-0o7Y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 14:04:26 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42b39d51dcfso1528654f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 06:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763215463; x=1763820263; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pKvYUG6QyuYwze0pX76iQK1U7NhM2svZNXWBkQgxwp0=;
        b=MEGXV4+LkJLbH68c5SW7CJrpcKl/iUy180mSfNZnOVi4ldFfInDeycMQJRHS1/Xwoq
         Y1Kcci4fAgksFRsxxJWC1fCmaFLKE9DRuxrC41i3AsSiypI+iwQTqPdX4Z+GNABhgWsf
         3thTK5iI+BAhVoitULNSH1U1GAsUS7u/raVcc+jfWai4xd3t+trJjc8or0frIAI3aX+6
         WrdjIym+I6Ijsqi1TzfmuGNyuNIYi8S2+QFXzmx3pyJf81NuK+SXbgqFxPYcGJIwfQr7
         ejen9Tb1rf6rZmSbgwhRPmYyHrM5/3OmppqvaNeItrGn4daH1gzMxIIJ6qqHl+rAbbP8
         n4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763215463; x=1763820263;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKvYUG6QyuYwze0pX76iQK1U7NhM2svZNXWBkQgxwp0=;
        b=OqWUHPyIPJYdstZmiZpqG7flQxZDcg8P8tRkCDsDYrqp7UmpbzmA6Gj9LkYi+Zn2zv
         5Bs4ZcmjY51qAcQ18tiHcuOHoLBo/I0kaR5qPFQ/0UUwMSb6AZfOipQ/aN7nLzNJ/lNr
         OtUHQkppsMX+m+6J17bLMxaqoDLi1bycJ6WuCuxezPtMeWah1Sh4MLppWbCFE800zRKi
         jsx/ktFHsnLpuqzfRz3CH9T65e94u/fzxhY5LEPICMuaBWaJbUlkVHGiXOfKpbpTltIk
         blA+0H11HG+CT4NwbRMaxlVNh3ps10C5XVkyVjtn6bpX/AGS9bazEiLtOQpa+yGUaaVh
         hPAg==
X-Gm-Message-State: AOJu0YwU610Ui+wfpFexbIAHLG8o9JOQ7Ec4Ya8mtVqd/LAzIuKAU1sm
	dPedYT4OyTfrpZ9oZJuVjfmRfQhNd0p966SqkQwfA1Y4snuYmaQpL6YCfWXbzmnuGTk=
X-Gm-Gg: ASbGnctf8LWKOd1Ij9MQGVo2wsziJCw4AtRWiI3AKEBhKIorvZWJ6XiVv49xK/7BoA2
	e/p/OHmTrL+c+9mYHMGe3OT76IDUbH9kr1jHrGNlTILciEQCIpedUhoFO0DIrBSh23RRf+e1E1j
	0iPAd15vTdkcJjpsq9oGSkcWoA1DZT/aJkf5CKesh961uWIVJqaxKc0gKNcRlAMHkxfEw9Eop2b
	5T8zlF03kHKWfgDcn/6d6cPZ8Z4Xv3A51WXhJjrqwmanYBJdpSQw4ZHsnNfUJpDni4ijaoLcTCb
	EQM8Qxhg6u9V3h2ValGrzn1rRw0jwhvT5+jl2XBytlXhEp0zmFtMcV1eFV+r610Muhio/8UQzYq
	cz20eJ/W/H8+ZwfRu9ODsXQEUEGsCyE4yftz7AhyOYXWFKw/zXKK+YKOoO5IaWwuZFyNl1APl8b
	7Es7LOtFhNw+Rwe2ZvRH0=
X-Google-Smtp-Source: AGHT+IFngBuo06OnXJJuUDkq4i3N5EO3BmBgXJQN+Zh3JAeA5AwDW+ND3ORBOMBIncLe0W3XOIS7Yg==
X-Received: by 2002:a05:600c:45c4:b0:477:8a2a:123e with SMTP id 5b1f17b1804b1-4778feaf9bdmr67343465e9.33.1763215462926;
        Sat, 15 Nov 2025 06:04:22 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477988060e8sm17748445e9.5.2025.11.15.06.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Nov 2025 06:04:22 -0800 (PST)
Message-ID: <446ed1ed-7541-4e49-b777-72e3c3de5a98@tuxon.dev>
Date: Sat, 15 Nov 2025 16:04:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: sama5d2: fix spi flexcom fifo size
 to 32
To: nicolas.ferre@microchip.com,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ryan Wanner <ryan.wanner@microchip.com>,
 Cristian Birsan <cristian.birsan@microchip.com>, stable@vger.kernel.org
References: <20251114140225.30372-1-nicolas.ferre@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251114140225.30372-1-nicolas.ferre@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_060425_418576_EAAD4202 
X-CRM114-Status: UNSURE (   6.91  )
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



On 11/14/25 16:02, nicolas.ferre@microchip.com wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Unlike standalone spi peripherals, on sama5d2, the flexcom spi have fifo
> size of 32 data. Fix flexcom/spi nodes where this property is wrong.
> 
> Fixes: 6b9a3584c7ed ("ARM: dts: at91: sama5d2: Add missing flexcom definitions")
> Cc: <stable@vger.kernel.org> # 5.8+
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Applied to at91-dt, thanks!


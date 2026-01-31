Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61141D7976C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 14:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6n6TAUBEzQrZ+trAO1OU9pk4/vV6fHBtYoVuEvZOQu4=; b=tnCZDWzj7d0qKPVvXp8yImQyrG
	rtTCPHlRGFxCE8d5420pnoy1fC2PQudX1y4ohcY8CwWWv2wONw7O0oDvuQ//ueSUaBJSZRvGCGnGq
	wq1zrSsHmG1vFKgg3a8FqM3gVNS2l/4Hm6MOfCUlx4ZQqVrT/ULcGo9AVYQd7laPuZkwBxpdy5yZB
	EQfRIJ1OMAbdlmIQsV6IeJA6PzaIvyBYq9sV5zL/0cxFsb/ZBDQt3UOKL1SdAK4bG5gmB4pvRt2Vi
	nNlv3vs5QcBJnR9qplZCDMr8F1giKwuXNx3WVjMQdU6g8aT0U/rf5huXYJEjkgzxkgalM0s1cqSEp
	ZUu2izTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBjB-00000002gBJ-1DLq;
	Sat, 31 Jan 2026 14:13:33 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBj6-00000002gB0-2X44
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 14:13:31 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso27085945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 06:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769868807; x=1770473607; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6n6TAUBEzQrZ+trAO1OU9pk4/vV6fHBtYoVuEvZOQu4=;
        b=mPtTeGzzZqUTd5X6KqFN4KRXFpf2My299ptfszYcxgQXrdjPcAN0Ejo1yUKeg+oP6J
         Spb535/u8w4NCW+KxXHJ3eHnzyJ0Ol2BqQPIB6kOZGsAxO7heR+YXKWTnudV9h0471HI
         UycVZHiPpM6Wb4vyEp+TYjkgedz/m3Pkxqp8BadR8eGriZlTlb5XG/vtRFiZ93jcy7FN
         ZD5o+pfkbuw4QGVJqQfYLFTgPdD2inOOqqv9TuFMal9GQ+udwaS7YKrIh12n/QwpiXyV
         6lePHrfim4pKB2cfyG7ynIAvIEv6GGpOVOHN86esR3em7+aFnZGJjjozfZfcutOIyCAg
         kc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769868807; x=1770473607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6n6TAUBEzQrZ+trAO1OU9pk4/vV6fHBtYoVuEvZOQu4=;
        b=RkSjbIhZQAKjqr8BABRXcxNa3o0hnDgWechzIoLkgSJFNu8ziiWH4GxFt4fJ9wnlIG
         dchRscJkYFtLY1tmtz62bAPSWc5Etoi6PbYogzt61aSOpo2CMcNuTUKQBQKY5nM0G5Zy
         0ttMb1WhvujPLZaxJo5fFRNhtq0eL+kqEiyeGHnC+P2d0KeCjEKFHy27qqI5PKhQIVsU
         B55EgVf84vcuOhJgDID3gUwfBQLsmC+p5xnBhC9wu0wut+eI2LnAyRABonE/eCMhlOsU
         K9An/Kp0teFnGRO3rGAk9w+9Okar/vIhz6RDnMAT44e/3cyeLRST4iVwVnAVotSN4uQJ
         j/rA==
X-Forwarded-Encrypted: i=1; AJvYcCW1+QTMLoFhtoaaaFy6sGlldfNCcGLtyCfvwISDyHj92ugEBtMgOsETw95Z0NlvxrsTByz3pBo1KZNNFsd2rbvG@lists.infradead.org
X-Gm-Message-State: AOJu0Yza8Ff1KOeOVLH9zCtBPqvDIdcJrli5w+gN1jt0CfO6SPMaVdbc
	N5SVUxVjmmo5E29VDO1oPQ00Ha1kyaitIt71wmRcm4jHIMfadIBNnSKsVcKBlsEK8itPQI/0bSG
	rFufw
X-Gm-Gg: AZuq6aL4GY4LczNt0yS+ZfraAg9p9SLtyo4Q2Aw81x0MEG/VvNc9P6jy6BUBOpHMuKq
	jccz7j3NUafpJFFz6YyMo0jYsGEexMum1vf0Rom6RHmHxdfQaQ6ktqRLl0fq65OGaxh77dPxttK
	fZhMaDwmQXf6f/+oiliitPB9emiDRc7gg+GvK4aAsioWaEG/6QEoicnZMA+AFpAgQFNjAeZlTSl
	Qw6lWQcLgFPIDbD+tj8ay/5+S3EAzw3vpReutXLnyaRiKqUDtqtkeeOhYISa5N6Y0k2C+m+1Wy3
	bWUAsLZOCYuKssD5B4XxwcupNJFNJxeXaqzckQXxUlDx5g5mlfWLgPPVJ8wMdcYJF/r/KwMKSjW
	TvNE8z76NXjRivos3orhoAuZM70lVj1k5Cy3EQigImkXrpcupxnHQRVGRtLAQb4FujCbQhSSYpY
	mOe2DVPag5OvRf4M2Saw==
X-Received: by 2002:a05:600c:348e:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-482db49ebcdmr81439595e9.17.1769868806551;
        Sat, 31 Jan 2026 06:13:26 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dbd0f043sm51622995e9.7.2026.01.31.06.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 06:13:25 -0800 (PST)
Message-ID: <daddf1b7-ef48-4dcb-8c69-301b883b5729@tuxon.dev>
Date: Sat, 31 Jan 2026 16:13:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 27/31] clk: at91: at91rm9200: switch to parent_hw and
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <806fd8452ad32be1d129fd541b5cbd1be7fbb9f1.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <806fd8452ad32be1d129fd541b5cbd1be7fbb9f1.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_061328_919732_DF6D1C20 
X-CRM114-Status: UNSURE (   8.60  )
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

The driver is using now only parent_data. This is valid for all the SoC specific 
driver patches in this series, no? So, better drop the parent_hw from the title 
and description. Valid for all the patches in the series with this symptom. E.g. 
have it like "clk: at91: at91rm9200: switch to parent_data"

On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Switch AT91RM9200 clocks to use parent_hw and parent_data where possible.
> Having parent_hw instead of parent names improves to clock registration
> speed and re-parenting. Update clock registration functions to use
> clk_hw struct.

Same here as in case of patch 24/31.

Also, for all the soc specific patches

> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

With all the above addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


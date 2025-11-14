Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82A2CDE022
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 12:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWbVdVcKmIgQNXcQML6O29oQ0R011ddFFEiHnoRKaJQ=; b=GjlH669zWQjL1xQKW4hKthUbQ7
	mmwpiN8nPRwyp4rZ28k1omZc0dF2QxuXzEXzEVmnaJfp8+Nl03UcAkfwj1aWNoZjVsdUSypFtNYFd
	TJ0KtNRgm/J/yM7cJR9QLJxDka/ZzcRPPKqbE0LpyqyBPxoUPHv4Pl4I80pgBsXiaW8m8O0vlxPJJ
	clyPRzWUSBGYCgCNHNS+wybH2O6gm0QrbJD0C2YKLBRpiavlIyRp2aKt8T0E3UOaVwGYB5/DzL3Nu
	fw1iOBjvu9A0clljLHSbv0tj9PsBVAcYkd9OUBDN9oS73hrltSFfyiaJK7CmFTT+0R1oAZbcFA1Hr
	v1McazAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsk7-0000000CBbB-2tAx;
	Fri, 14 Nov 2025 12:17:31 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsk4-0000000CBaL-48HF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 12:17:30 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42b3108f41fso1069049f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 04:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763122647; x=1763727447; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FWbVdVcKmIgQNXcQML6O29oQ0R011ddFFEiHnoRKaJQ=;
        b=dPgxV4qgobDz3QUejyvoZdWX2NLyD/06qQ9LeXJs+z8uUTJwcPAQktPefYMKeZpHb4
         tyFEI0fkTEKNNT4umNbs2PvRctN0wjL1ZJ9TbpTnSFpvPWPS3HxA89aSq1DPlJznowal
         LgsKA8xNlqjKSRTmxjCa8bYfjuR3tAlAmsNJqKWTlstYwRfx5a75uQYGm9+SAP3EZUqO
         F+pcWZuAg/aR7v4jbXIr5dlfptXvkdV/SBtXSJmDJOGLtvR4WcCisOxl59tHvzEBSkj8
         uUo4pQ/wqMAP5kijPmPfBUN+1fTjhEkN+UpjT7iodkulM4CXdmpvr0vXJqTYeiKi9ZfW
         evhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763122647; x=1763727447;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FWbVdVcKmIgQNXcQML6O29oQ0R011ddFFEiHnoRKaJQ=;
        b=nCVd5XDMcoWsJ80gw/P/BRhAhnIHPF/BXJ7bAaCMWq2YUmTMAl73PIBMd5OEpdZ3Sg
         CwvMjXtfdwn6WTV2oq7eKkwMZAmAIE50AhrRaI8JG86z5jSfIKAXNlObBJP0AzFMJnkU
         O5Y+ihOrfkbMRrPphbOdXgnIxAjeotklsmFIVeE2u3WSYKueccK542ROTx3HrIdX2DbW
         /r0/qqU2xovwRCqicfkRZqSU//KQOP4mOWtXrCyRLRDNe+7LbtAY2QhEUy8grr2qhQgs
         D2v6Xu7CU9LDviFcPsszbbW9HQ4pmftJsm/hVKRPVxpcFLagJ7pJx9G0f9IxPvnJjGz0
         li5A==
X-Gm-Message-State: AOJu0YyrxN6EDZyTBLDqDo2iOAxQJRp32cjeRb7cHUj9bBiBP1BaK5JN
	P5+0gFg8lg3pAQzPUA3vnIuLjsPrizX4STKnQRrze9BRqzJPDTLkyxvLufPcgNttboc=
X-Gm-Gg: ASbGncstgNWyhkBlAKBWrKrGZX3bd54wQvS6UKSRKElj4JN+rSwELbWPLtbRRKK1Glh
	N7okYZPJ3ik2p5BiaLNVVC0372gC9dLGiq07eGfPlfEajP5s3BpaSqfcMPJLlweA5V/nK1aMz68
	2JZSfGP2kWNCXW2ZB+5UJ7MpyJ7BeuPzTHIgt48wfzvL/Y509ZejbA6uuCHxXi0NA9/a0FCYzYq
	gzLJccZmMjOoU6vranDlCdmIhomFzEn9/cY/JNU+gEmOANzFg9uQD+J7WdHH1EsyQpRnrCTSeSU
	4QVPwVwUYk/rwrC3yfFNR6lCX6ndk/K5EDMDmab66XVj+Wv+jsErCAkx2MQWu3vywRGscqnxI1q
	VlFbAEptSPNwL6GtDaPFIUEdoVeVScsiFxBDg3mGJEQT5qXw6HOHVZmVhijUQKMCBENSgAZBCWE
	wlYlPMWVrQ
X-Google-Smtp-Source: AGHT+IHWDEjSqjebElJ40Y85LJmLRDwBFGhrOde2zVXNUcqPkVLjSRdizuSu3jurgeaQwyEgPyTdEg==
X-Received: by 2002:a05:6000:2008:b0:42b:31da:18b1 with SMTP id ffacd0b85a97d-42b59397865mr2717515f8f.56.1763122647208;
        Fri, 14 Nov 2025 04:17:27 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f174afsm9409253f8f.33.2025.11.14.04.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 04:17:25 -0800 (PST)
Message-ID: <ffcb6730-2e1b-452a-b44e-60c8432175e0@tuxon.dev>
Date: Fri, 14 Nov 2025 14:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: microchip: sama7g5: fix uart fifo size to
 32
To: nicolas.ferre@microchip.com,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ryan Wanner <ryan.wanner@microchip.com>,
 Cristian Birsan <cristian.birsan@microchip.com>, stable@vger.kernel.org
References: <20251114103313.20220-1-nicolas.ferre@microchip.com>
 <20251114103313.20220-2-nicolas.ferre@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251114103313.20220-2-nicolas.ferre@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_041729_033014_B770BE3B 
X-CRM114-Status: UNSURE (   7.33  )
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



On 11/14/25 12:33, nicolas.ferre@microchip.com wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> On some flexcom nodes related to uart, the fifo sizes were wrong: fix
> them to 32 data.
> 
> Fixes: 7540629e2fc7 ("ARM: dts: at91: add sama7g5 SoC DT and sama7g5-ek")
> Cc: <stable@vger.kernel.org> # 5.15+
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Applied to at91-dt, thanks!


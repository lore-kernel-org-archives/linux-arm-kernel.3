Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1A5C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 18:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByURWW4/51grEFFoJ5cNbGWq84mjT1dgOMDzzVdymTY=; b=coljVlkltylX1HntqgvHXNxgaX
	818dlXg1+sPhq2vr122uYBuGlf0RpB0kiODCaxMDSMs8t20T29d6FH+nCVGDDxcqkWDqAyg372TCB
	TY0+W+sy3qIIRULnsYdyf2/1mRQZsM62vTbI0bNX1IBCTMXzOaOem0dK5hK+M7Xd8JBrgeicxUGgN
	A6tgMedctYuMmoZJkSkZGEbB3Gr3ZXDBHl3s95Kxx7kCkKq44SMAR7HiyJIGlpvAenqZxOE1jPHa+
	ZAjjh5udwzQspMQVPfpxoTx1Ceupwg/Dcw1+5HnxzPZYTqyRvkZ8TtlpQDnUq0JKOwloAJvILcPle
	7USt307w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAzl-000000020Lq-1DGQ;
	Mon, 03 Mar 2025 18:58:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAyB-000000020CK-2fvl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 18:56:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43bbc8b7c65so16693995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 10:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1741028210; x=1741633010; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ByURWW4/51grEFFoJ5cNbGWq84mjT1dgOMDzzVdymTY=;
        b=BMZGAL0JsSVpu60waRK/WFDT6EDFzBiO/fvFdIPdPNh+xhJiMkLcweGj1kycf/dvqz
         jqeqgH8KAT4YdfYxzLSfvSneRU4ydcD03VcN3JNxp7md5K4cD+RYbFl/Pgiqcsm+WS3d
         RcoE70+P1HBPY0yejbjtzUzWrR1/zmSGzhDoejSDH2ynb87wAILhL5WthTzesO8bbzkg
         ZaCFPaSbJU6bzNE09BJJLdl4N56/JF9AvA/5x+pkGHQ6SfpwmBUhrf3JlhLB2BSFK0fK
         sYUumLLiwfWr4LhF+s6V1k2IczhNKrKfLya8RDyRSLLGx40nx38dY+wvbdrQjPgzuo57
         YkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741028210; x=1741633010;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ByURWW4/51grEFFoJ5cNbGWq84mjT1dgOMDzzVdymTY=;
        b=U9E6268Qb4wid3+D2HN2XEVYrlNKWu+AB4hfstSbwjfi2q+FwsRt/yfcAkgsXG03Fl
         Ox7p/p+OPLJpCesOzqNPtaAXLfgBhQc4zeMlPc+zRQT8WxnIkHGFekCDuM2/rJXnrqpa
         wt3EqpK5kf121XZtfnInWRZIcE8gwmzcm/080pT6VdPDvoAHiKGk8ocMHRHgd3Bn4XJE
         iwBwVZcrzajE3WyEYauR0rwa6AmZajOry71bKGpyBPXdORK+hblhEmOvSu0gQC+nkAq3
         O7y94zKnOsvEnAzGQd1JA+rzD6nyVWj9fO746QsZmEYZKWr00Gv8cmh3kJyXmfI5aBx6
         00Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUUx2gLmkaZzdYHN4FfTW3TEYz/B8aZ6vVxd/LLAT3SRZ10M+mu4FjBDEa4SgbDQScdb6/1mzCCSOcXx9NU7r43@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+eTvvFD7NgTC46xURjHzCkUD7UxOherKhhSASdiK8AJim62By
	0YICJWyzwCXOG+VOnkgxDiQaksovXUhcvIuYcvNRa2ckD2KwSLmQwlnz5DgZ9ks=
X-Gm-Gg: ASbGnct4SVNq6OUKvuPNEybBKEwvCfFJQ+lutiT2Pm2DNB9Ubu3VXIm2Vl+AHPLxfcV
	bV4HJ8bYuZrdDrdazvKCX7xfkJu2gHe2LTVzFp8i1oT1VIiv9mNo+LUc7hXQ658xWWNthWmDD1j
	IoAmLEi4aAJFak764BoDWVqQmA+VOPCnTRDSMuZgXqlKWZRGs/EzXWWjEHuCcK/crEpHHLMWQU8
	Us9x/+kU40iHZO+o4gWqwF9S5WTwXgCr+oPnS7QNKkUohuhd+ohXLt4CuPEZIZLf6yJRNRslgqu
	DCAPWA759eSoL4ZY3wEBR+2nriD8wymRjzAu9XA+8Z6cARtvSiep/w==
X-Google-Smtp-Source: AGHT+IGVUE0CQu4ReThqwR4ny9E8a1exZ2jLsRFt7w170BeB8vADyu6EQUUGy2xTMtQFYKiXpDs9Pg==
X-Received: by 2002:a05:600c:4fd3:b0:439:a255:b2ed with SMTP id 5b1f17b1804b1-43ba66e5f09mr144551665e9.9.1741028209871;
        Mon, 03 Mar 2025 10:56:49 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc9c0fb1esm12229025e9.20.2025.03.03.10.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 10:56:49 -0800 (PST)
Message-ID: <39213e99-3041-4602-9dd2-536e9b09ad11@tuxon.dev>
Date: Mon, 3 Mar 2025 20:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add System Components for Microchip SAMA7D65 SoC
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, wim@linux-watchdog.org, linux@roeck-us.net
Cc: vkoul@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <cover.1740675317.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cover.1740675317.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_105651_779708_1D9F420C 
X-CRM114-Status: UNSURE (   6.08  )
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



On 28.02.2025 17:24, Ryan.Wanner@microchip.com wrote:
> Ryan Wanner (2):
>   ARM: dts: microchip: sama7d65: Add watchdog for sama7d65

Applied to at91-dt, thanks!


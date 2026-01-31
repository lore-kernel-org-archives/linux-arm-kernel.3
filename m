Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FD1D79767
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 11:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQDkAIIhKgRDDvuz1aH4KGKZtIlloZoqb9YIYg64nMw=; b=G8O+VifC+6NDuELVVRxkVzKTzq
	Hbj8vCwlPEMvlmjs7b8RqkO5U4MaCMr6P1kugLWwC6XOt2PmQabD+NA05zrVqOWk/R3mRKZKrVSWl
	MJA1kO4wCL0Z4AoEiSmFwRbnu8DN6d70xjtVwJeMxYiSI0Rp7FoqrjgyadzO8PyragfyvOiu0+apL
	Vtv0HXzT4i/P2HETDphl4F34apdKJwh8ctWDdsqewv69EwzPb9OYZG23I+rHp2sd4Zk9s3RVfrDWy
	euYKiH1zZ0Mv7qMonCDszwnUUEbtjnuywQ56QM2D7Dhw3OMGruBDXUdtsbqj1lddbwDaHB8n91kzB
	ZYOyltfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8iJ-00000002W4Y-3pJf;
	Sat, 31 Jan 2026 11:00:27 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8iF-00000002W4C-2P3c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 11:00:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4807068eacbso24342545e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 03:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769857222; x=1770462022; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zQDkAIIhKgRDDvuz1aH4KGKZtIlloZoqb9YIYg64nMw=;
        b=Sp7yvhcp6fA91Cdqgpd4Bjwk+xdExACKfYqPzAIwerOFk4G4ipsetDbKH1nblZe5ed
         /u0jCRP1yAfZBz2Au812hPPiaJXTVVEzqH455WrZotP6O+bxySZMuQbpmje9BJvkruif
         QPYIQzftw8m5yesI6jLJvpB43hPWdIffFjQvCKxEIwP/OoR9pqkWNOxSfCiRPqabOtJk
         pHDrxrXI2Zl9E1Up1Oo8XLWbpd6sicSyFO3Nx40aPHFgrpAgt8R32oepHc438/y/bMEe
         I5G7MDVIbDYKimbOWI6f3pYXtbKSKO5lJZikR/1X8EbPjJbzWVKpgyKym38CzExd6zZX
         5v7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769857222; x=1770462022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQDkAIIhKgRDDvuz1aH4KGKZtIlloZoqb9YIYg64nMw=;
        b=qC19d7xbiESzljbdfWOLxKTT3kWtcyRkFDrwcxHXPvipto9RT/ZSLEecMiGrZ3QoYe
         IRDlAgzreZVqDc5ES+mD/WgCDB1vpVfiJcXXTSaDnuvTq7FaKH9cz5DivTAl1MPuRrfg
         FX8yaCdrTkEGepv+lHNxFqK1y4p2RqHmb1CyW28lpTaKXQva0V9rBqsnWE67pD1uFzpJ
         2eBiBoKXSWZpB52Puko0voF9sR58jKU/kkQgXRq3LSPyc4CLBLzBK6gyHSRI1cuOvDs2
         SuwCaAjckXCr50GdR+8gwC3I0Lrd1V7/IYGAXaq+SJWntgCoyEdbt7jZrWqfXAW87CQY
         J8Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUtE8/koRDLK86qkMdxxn/SlONnycx6k8bsgOHEuGImvkKiRFB3hLGoJxcZhInc6SBLQvmru2W0ePoDM6YdvjJ/@lists.infradead.org
X-Gm-Message-State: AOJu0YzxBI9r9QVifqWhUAkhqoJTCGHxRy3U+5b1iYVxdIeqLE8rfgzo
	nUuWnKRqx7NUvlgtdIg3Iuqk3PfEeZWsK0XxMdVEuSxmBTGAZ/wr4M6uwhsHTdzVdYE=
X-Gm-Gg: AZuq6aIehzPtfQKHJFFvZM0lsn0wybbSsXNcwrYDE/EWCyoJkSuEK1bsYbyioC55Qb2
	A49EG3hoNG2M7WE8SH9aQ/MN3aYHpOXAjt+rFAvnW0yBMEpKyTX2PTxty4P1yUOqBFILzG6Lhz+
	yRcrkWojVzoLRVl55TTCxVB2bojD/huf2E5XSG15sALozBb008K+CIGwxUhO04ytFbQofL0BJ2s
	KC3/yBfOpXEdiBlqU1PNx0FNExWfyuiUrVrGsAtCBlGRAoRQGXkw113tWVyHYzAVUqryyxpSorR
	kulGFhPdSu72mG0iWUvB+dOlfyXcTBB3dyY8hVOSmlJfp/U9DFiK6ikFSz3EE9fgFHJjpGuGZ4r
	2fzfhKkY8369Ewzh2IcYnogeZSv/QcS7bOuOGD2qyb84R8OdleDCfGS1kYOveh/8/cM7vLDDfiY
	oPGQvO976oA/5ZXmmpMf+lMND7
X-Received: by 2002:a05:600c:4e56:b0:480:1b1a:551d with SMTP id 5b1f17b1804b1-482db47cf43mr69137265e9.18.1769857221761;
        Sat, 31 Jan 2026 03:00:21 -0800 (PST)
Received: from [10.100.159.246] ([213.233.108.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e2e3beadsm35715875e9.20.2026.01.31.03.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 03:00:21 -0800 (PST)
Message-ID: <33c9d757-4f3f-417a-b7a7-314f27a96903@tuxon.dev>
Date: Sat, 31 Jan 2026 13:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 20/31] clk: at91: clk-slow: add support for parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <cd2dcd1bc60c88bde718245c60a2c409e467f30c.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <cd2dcd1bc60c88bde718245c60a2c409e467f30c.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_030023_647474_731977C4 
X-CRM114-Status: UNSURE (   9.73  )
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
> Add support for parent_data in slow clock drivers. With this parent-child
> relation is described with pointers rather than strings making
> registration a bit faster.
> 
> All the SoC based drivers that rely on clk-slow were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

With the patch description adjusted as mentioned previously:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


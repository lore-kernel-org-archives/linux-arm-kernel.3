Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF27C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 08:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLDylGBgP4+0IDkOEoHKFXTC/FLN28f1/8owaqv4294=; b=Zqi+IXo7w4oJt8d5uNA0eLmPfH
	Yb4sHfZz1oMPMHtw7yw2DCr+0pMOyh7fdM8mjhjONDTMoQpKy0EJAxxm2jxnqdvDBmWvDVUVuMq22
	ZdygYbWqMoaBi1sW/xfZnryLx9Fs+l6ZvZl4uzAmCYoCtT45/9vWts2nV2HMagl7OQjwcnv1rdLt2
	IA9Bj3s/85bmuXntJqC5RaJb2dzJzXHDW1lZBUj/kTeQ38TmTW+QTsBNm7LL7OBCPKO6RaAT+m5U3
	K/00PzVYaTnIFxzo89NgK84RGJpxHdhTO3yHMv+pQoyCRZozrUFlp7EsHPDtVQlsyEYkSp8Hv62IR
	72Ze6djQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIKQ-0000000C7ws-0ybG;
	Mon, 26 Jan 2026 08:52:10 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIKN-0000000C7vn-2ke4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 08:52:08 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42fb5810d39so2638366f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 00:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769417526; x=1770022326; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tLDylGBgP4+0IDkOEoHKFXTC/FLN28f1/8owaqv4294=;
        b=pxY/nff0/ppwhpeV5T1E21WJn9Rboi0wjkJPt28NUiOo3hOGy4ploh60QqCCw9q/g9
         u79XyKYLJqa0GgWS/r78ucw/aIPWyZD0wAlNA3V4skKk1jXu1B/8R15OMRfihllpQhQr
         yTjJsQRYZdk7q6692BIeH5yQXLQhusio1RfcNomCynpdXOGDiUAm+zf/uq2oxm0W77EF
         aC8GvHQ9v+/xsozE5u+9Vcsr/J618rZYN4c83bz156+F4WEOzdA2FiajJu44IDRO6Y/4
         tVxfaxpf7vmPkkWgCeFU3+6h2AiQyx+mKOcWUhI/w8l0Y2+2It5kFQ0HCGQi1AOmGFrF
         dqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769417526; x=1770022326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLDylGBgP4+0IDkOEoHKFXTC/FLN28f1/8owaqv4294=;
        b=W7sHROcLPc1xP6fPbjUhwYVF8LGgKAO0Dx+oJ6zaMIBM8IJ+l3tT16vHAcmF7BS+ZQ
         ekqO7qMQzw87gMPU3u9tR9AIxWVUbRSm5uvKlkzSci5Iw0k+z/y2cUNgLpmT06DdllQE
         QaQk7gX8/4/OSRrpL8spaDZ3SgyqGrS/30UXI4bXHn81ujuxMteJ4DruSXrKzywIQhe8
         t9KGzSQ6e/WTihz0rfH9Ru8F4G1/+4955liFLiXEC6CfNfNazO2H4qz3X4z7mRz9+Jlz
         8bLhGHCIeDz1uVyDe4UXNKN2fU32Hse7Hkr7UX1N4di3GV2Ym3mug+yEAATbKClAIaWw
         SENg==
X-Forwarded-Encrypted: i=1; AJvYcCUHDI10W6OQH8GcHdwxzt0X8KDJk2K4uIr2O8xf7OI5Z0f7bUcLzjOFhzoYl5cB9KVsNMWsKoiCVB78dljq3cvW@lists.infradead.org
X-Gm-Message-State: AOJu0YwcG281sA+BsrnVlGAJQ4bspEhcfJhtmNuRIfCJ6uTlhW7ejsOS
	b03qO8MEh2Ylr41PHe1JVeiA9qnZWwnb1Gnt+/B04JToUK6WrCqJOIZ9ZxIzhoVtBoY=
X-Gm-Gg: AZuq6aLapUx/b+KvOB/FMNguwiU47hGncVQg2UMIr6L7K6xmL+oFVJWXEUcG8fgaPt1
	WGI3qv4pfhmEVyoo1MMGEtmFXqkY+ektLMv6tI6ucXr7cbrXNDW+mffZogJ5a7Myt4zeMlJt5VG
	DybMahBxedfYJEAyL6AiAsqssct24x0/bLhPkNlXcuOR9SNWybP8PktNO7w/zeZyprt/qgmk75b
	hzuKoLSVJYuZEvtVQh6u9H6ww5xxdH0qLaDIsSsF05Ou3WwrerZ0Mi+Xg8rei3g/8CrFOS18wrM
	luNulGIcPwDP8Pt/rqDXsMScLuDqQvb9glKPGYSwyoRKnNKkXrTtaUNCTh+5BfeopnrXdPByP2i
	kVYo5m6n4hH88NI5ZW+KvIElouDsND269ZsGixFOXYg+CaelfASBoNBUOk3qOSGNVaVaIPFVJh3
	DEHcwoAagCB2MLrCaT2g==
X-Received: by 2002:a05:6000:26c1:b0:435:a0f5:c276 with SMTP id ffacd0b85a97d-435ca1acefemr5343349f8f.61.1769417525632;
        Mon, 26 Jan 2026 00:52:05 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02dd4sm28203098f8f.5.2026.01.26.00.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 00:52:05 -0800 (PST)
Message-ID: <61a9cabe-082f-4d43-b25e-5696831972c9@tuxon.dev>
Date: Mon, 26 Jan 2026 10:52:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/31] clk: at91: clk-peripheral: switch to
 clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <c3ecf1983df013da6e1c295f1fa6faf40b2919f9.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <c3ecf1983df013da6e1c295f1fa6faf40b2919f9.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_005207_737382_4E64A8AF 
X-CRM114-Status: UNSURE (   7.85  )
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
> Use struct clk_parent_data instead of parent_hw for peripheral clocks.
> The clk_parent_data is a more modern approach to the clock parent
> registration.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Add SAMA7D65 and SAM9X7 SoCs to the use the
> structs.]
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>



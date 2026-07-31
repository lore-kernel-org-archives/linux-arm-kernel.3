Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878B5C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 01:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFttCK6+IiI9LAnY0cBt5R9XII1QMStajnONswWnhUU=; b=uT7MqozKdMcQi6M3EE6micgJSh
	ryqwJgp+3PIGlBLKTWErv5vqWqsZkBrWUEUTIBhxI24HVhvqkY2GHLYwzdib8VasCftKNEQzkXoxe
	PCLAdpYhgbBu2dnC24hzpg1Qu2kDuZQ8mf6dMv8HtafwbwOy/JlftUcnSoQUz/w3qC5yTnfTFdi7s
	uNY3IoyNPKnMr70Fe3JI/zCeuFt8RE3XBfi+pu5A3R3wovryd1zU6rzZ4ME1COOclyRcAVxI4JGCT
	6sN6rNnU/Ql5e6dQ8ZgPDkUwQSBSplwqRDTbbf+rn6/FnJe5gkJsVl/LjhqyZLsUEvXMhniDGwrfc
	PTuA4rMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpbgQ-0000000BZTX-0EOX;
	Fri, 31 Jul 2026 01:05:06 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpbgN-0000000BZT6-0NPU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 01:05:04 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso208552a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 18:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785459901; x=1786064701; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFttCK6+IiI9LAnY0cBt5R9XII1QMStajnONswWnhUU=;
        b=Z80pBF8xnyRq4e5zflPGN3Gv4MWOdVdj3Ydy0PckJOMfIvWJQhIcWp9N9maPPEhXzP
         aBy7BqaoeqM8w5DqILsUexQ8C/Fb1Punu1X/o1XeGI21TocmO/S7f+i9ybhboMVhJUvR
         vu+NgBhNwy5soregl0uZ0dpVmjHEq76+gWK/kSA0ru1o6ooZfatdzNmlFLfTm8/MeZXS
         7kcOBxPf1nwVQu3uCQ+PwHRyApEYYLprNb9rhNr8ljAIRndPCR3PqNKPQ6sYBNtgz9Ut
         azRTA+Ip15eSU8CE471ifskoVszOjK60hpMRi+JuJx83LvGQF72PWIJke5FHV/veD7fG
         CXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785459901; x=1786064701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lFttCK6+IiI9LAnY0cBt5R9XII1QMStajnONswWnhUU=;
        b=RuvKiDpCfeKvEEdb1CD8hjJunShp2nlVjMoFJRhh9rKL+xnJVruyYeW7qxwdY5dq9y
         ObllUB8b/EwvO64nygBkkhSLtzSdJR9/uYXq07JmTT5ynrnTZxZRtLaGXU5CaDmXaObk
         jstZ9iCfNAXuxeu+xhE2Fdd9TifVdU3DqK3mQza/r/ekwjHb5gjSTgTRLTfuWnIon5+t
         urDYnOrd2C0vZzNqKorRC327IOFABSdKlliJ9EtB3uPl5veiTzdBzuOCw2D4BV/BtW51
         QnFWuhGi3b/fwlzglBorcy6pIOsM19MlM/Um90fyPyxVp/AS+0ybOCbaun8cS8SQ3zcG
         GWYQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWBCDqLWzKU3qRxbHLCUnz7y03K11xUFL0/PAR3GV/5anHx5RhpKN5f/StK0O3u75LKhgmZFBSPXs6aWL3bbSL@lists.infradead.org
X-Gm-Message-State: AOJu0YyBkrSyKUZ+jMaTj8AFJJJQZ9vB5paMnTC8z0+2GwF2pNZUNqha
	LxOEtNHj1jV6oPcBFcJgugAH/X55YIzU7TySsmXjGTkXGXW8FOfiQAcL
X-Gm-Gg: AR+sD10k45R+/Va02e5C9U6DdX9yLD4FM59Rnwq4qyyTPN3TrSDV0G/0+xY1q4lccZs
	wxgR+BayaNPtxy4e5/TRSuBFMVLJ/i4Reak51qHfwtb2vDI474VMWOCu+ihHyJFiCucR1RseqqS
	RXjKo+XiAKb0V25F6ThNnffc4ZicxHdl4hq9FkUTHcp9oyTYwaAQo9ziHPoM3x+oVeTf1BO3zgj
	dmrCkwiduSmHhhA6xEY0YDXl/5Aw6jwsOOpI9dZ+jzEHW5NCoDhrrSybBsD5JiflE7LCrbt0hmB
	IEESNgpGSDAVSC9zSahBRKSj6qFW0xN5ExTq87qvaXhi62HWfb4PkrKez5q2TCbGc/ObQNDd764
	bLzdlVMXot1u3O95tDYN39YRh4s261fJ65CappEHHlxbeMqXwmrd13hxTInZszgS9263g+TeBvK
	tkQ41lATiJSH0Rz6ss/FuCk7MqgxGUDY4UCygzGOmf4M4XzYHflPX6bblydXrak3CMR8qsyFMlL
	chNX7vPlHxSTlcBvCDkP3WWixwn4KeR6DmmLsuX
X-Received: by 2002:a05:6a00:12c7:b0:84c:5349:daa1 with SMTP id d2e1a72fcca58-84ebc425d21mr3954345b3a.76.1785459901336;
        Thu, 30 Jul 2026 18:05:01 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ed5e30a41sm17865b3a.58.2026.07.30.18.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 18:05:00 -0700 (PDT)
Message-ID: <6c5b44c6-f06d-4f4c-b014-5a06601454ab@gmail.com>
Date: Fri, 31 Jul 2026 09:04:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI
 controller support
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260727091833.750051-1-cwweng.linux@gmail.com>
 <20260727091833.750051-3-cwweng.linux@gmail.com>
 <f698ec65-1677-45fa-bb05-34aa8e092100@sirena.org.uk>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <f698ec65-1677-45fa-bb05-34aa8e092100@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_180503_132681_21371708 
X-CRM114-Status: GOOD (  12.56  )
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


Mark Brown 於 2026/7/30 下午 11:11 寫道:
> On Mon, Jul 27, 2026 at 05:18:33PM +0800, Chi-Wen Weng wrote:
>
>> Add SPI controller driver support for the Quad SPI controller found in
>> Nuvoton MA35D1 SoCs.
>> +static int nuvoton_qspi_mem_exec_op(struct spi_mem *mem,
>> +				    const struct spi_mem_op *op)
>> +{
>> +	if (op->dummy.nbytes) {
>> +		nuvoton_qspi_set_bus_width(qspi, op->dummy.buswidth,
>> +					   SPI_MEM_DATA_IN);
>> +		ret = nuvoton_qspi_txrx(qspi, NULL, NULL, op->dummy.nbytes);
>> +		if (ret)
>> +			goto out_deassert_cs;
>> +	}
> I would expect dummy data to be an output rather than an input, we don't
> want the lines left floating?  There's a similar thing below when
> setting up the dummy xfer.

Hi Mark,

Thanks for pointing this out.

You are right. The dummy phase should be driven as an output rather than 
leaving the data lines in input mode.

I will update the direct spi-mem path to use SPI_MEM_DATA_OUT for the 
dummy phase. I will also fix the generic transfer path so that spi-mem 
dummy transfers remain output transfers instead of switching the lines 
to input.

Best regards,
Chi-Wen




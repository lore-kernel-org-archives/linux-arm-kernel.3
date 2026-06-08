Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B67CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 11:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3RBJSxqfT0copcCoPASu9D+tQdpKRcrHjtldnEnz33U=; b=1YZzsqbjpZubVZuJ0NnVVi03vm
	SC+SLiC47WQ5EAljsDVQqsVhs0f7UH8mc94n2Ei8zcaW6V/aDjriyqqkwgJLEkBCUdgJ6zZ8xP3V4
	AD6fRowi/p/FYzHX5HIbcG2/c4/z74P3rTTYI+QYBRkRoRg55fzcOeShRzwv/Z1FFe5s/5TQXSl/P
	yOqkrfXFgBvtHyKMbbJ7zE1EfksUbzWZstsBcCkigUIakLhKy+ZOXvElLCcuOa3EveFW34Uko0hvV
	B+3EVoCD3+kb+pLSXs4el4J4sDUK9bhzi8+5iFDIWr6keq9rQVPHMjJF3nY9I/8Z9xFyLruXyOQCS
	t7WpfNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYPw-00000003SAD-3iuI;
	Mon, 08 Jun 2026 11:45:20 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYPv-00000003S9Q-1NrF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 11:45:20 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-842288702fbso1625904b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 04:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780919118; x=1781523918; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3RBJSxqfT0copcCoPASu9D+tQdpKRcrHjtldnEnz33U=;
        b=czkvyeS5MMr8KL3UGDqnIO9JfCteyurtfiEeSqKvdc4R0zlLrJmQQPXufR2qH+/YAm
         gtBAe+vXvlR/3HsfdIry82v5fjYCIlqQG0VeB7eQY3rfKGN034D5rxBKowcNH46oIwtM
         Q7M66chVwIy1dGXevgtQxqMaUdznLxzJ31bWhzgG3oK72eSC2KruPoL9Cx59UaLoz0GU
         VgGIjWv1vcRCLD/oniSs6kKmNipw4vU9Xw9TcUcGSPZKBFh+ZExS9kCp/dN79gSjEpYg
         IlzUcJckyFRi8Sht6qDZ4BYveJKK9O8nYvbInEf/ul2yNxil3Bdgi8ziMuu1i93Zy+LS
         t9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780919118; x=1781523918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3RBJSxqfT0copcCoPASu9D+tQdpKRcrHjtldnEnz33U=;
        b=JDfdd96UdDxlwYZV5S7k2ZQ7gNNx5e6PLQO51G10Sw08euQihFxibDCC4tWM06Svmv
         JyF2cRra8Cp8UuuWKhlSJerVXQupulwAxHIwO4cn9LHDrjQJjjukp0KYkPFc11Dbw0DM
         OultnnOLmFozHNAdSAaY/H3CctLBMKQRujVy2w1agaHMJsf8xUv7lATw2by0usM0P0zs
         hk0OIoQh+gRAV9ue1jLn6/+hmT5OUYx/5oSLuEi88j3uNggDZ0Xt1+0V+WQ2dRJyVgKk
         UNf3AJtHYzK3PQpsK33cuVIVlLn2htqBCfbysZYruD1aiWo6pwRq3P4smIxHP8tuSkXY
         JTuw==
X-Forwarded-Encrypted: i=1; AFNElJ/blCOgQZU0rsrl9fESQnAFBthLw5a5lEth8SdbFd8W7yU3V+EyfPq7wMWmIYMpBgLtO7Cb6ET6WRe97Ivs4+Uo@lists.infradead.org
X-Gm-Message-State: AOJu0YxVvbhzzTgmK/u86dMSInsjU135/j6LpJ1uCl+Pn3Zh1TDbxnTI
	MwvCNyxxoqZZ9ErDrHHE64BHKat9lnbLGQe/gv7fo5P30+HX/zfBM4Ys
X-Gm-Gg: Acq92OHtklkzmjmOFpTtWCJ13xD++wCytTSYbJdB4v+OEG4jzz/ju6EygG5+u4Qp12e
	fmlY16UCjyr3clB7WXi967nhSWoPVPcAavCXi8nu6y/aYmBbHtKpcg/Looiz4ULlbrsKO0joEyR
	gKWgQLE+ERlJc62tcKp/Gx0dnGoUfV0t01yOVp3tkj1ZYlRribAqdPwR3euzNzFHK3qKjGzZybm
	f67g3aj4tbmsw40yEmwMfOCUpWz6ii0KgjSElIyX8/VRUcrZ+LJUC+uCxoVzcqch34g7IQr5Ak9
	MZPw6MjtT3M/v96gexukdEYXRwkT1CjkXGJoaKRkcg4IGQGvaxUv+d1ncac1B6pwPtRabUJS0Jh
	oR4WLmmzEyHVdRLGNgt2Ug+o3h9K6xJ3ZkXznHfnJaamXJHZUg632DXsDW1kBVGaxhVXDG21oxk
	f0Hz7Oxh+ECML1BKsoQzvtqf4CfrLrgcuy/oHH+o4Dm58xBkfmGz+GKQXN1VI+CLnPBPJP9JpXz
	jj7+tyVtKGSlg==
X-Received: by 2002:a05:6a00:1996:b0:842:2f28:4e36 with SMTP id d2e1a72fcca58-842b0f90897mr15772480b3a.17.1780919118219;
        Mon, 08 Jun 2026 04:45:18 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828836efsm17689182b3a.38.2026.06.08.04.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 04:45:14 -0700 (PDT)
Message-ID: <79e704ef-bcaa-456c-9d0a-0680bd885563@gmail.com>
Date: Mon, 8 Jun 2026 19:45:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI
 controller support
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260608025009.1504971-1-cwweng@nuvoton.com>
 <20260608025009.1504971-3-cwweng@nuvoton.com>
 <8e751df3-6237-4c8e-9c87-34bb67e435f7@sirena.org.uk>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <8e751df3-6237-4c8e-9c87-34bb67e435f7@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_044519_373994_E45865A1 
X-CRM114-Status: GOOD (  11.05  )
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

Hi Mark,

Thanks for the review.

I will add mem_caps in v3 and set per_op_freq for the spi-mem path.

I will keep the direct CS polarity handling for now, and also add
SPI_CS_HIGH to mode_bits. I understand that moving this handling into
the core would be a separate issue.

Best regards,
Chi-Wen

Mark Brown 於 2026/6/8 下午 06:53 寫道:
> On Mon, Jun 08, 2026 at 10:50:09AM +0800, Chi-Wen Weng wrote:
>> Add SPI controller driver support for the Nuvoton MA35D1 Quad SPI
>> controller.
>> +static void nuvoton_qspi_mem_set_cs(struct spi_device *spi, bool enable)
>> +{
>> +	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
>> +	bool assert = enable;
>> +
>> +	if (spi->mode & SPI_CS_HIGH)
>> +		assert = !assert;
> Hrm, we should have the core deal with this.  Separate issue though.
>
>> +	ctlr->num_chipselect = NUVOTON_QSPI_DEFAULT_NUM_CS;
>> +	ctlr->mem_ops = &nuvoton_qspi_mem_ops;
> We don't specify mem_caps, I'm vaugely surprised nothing trips over that
> when testing.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B26CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 16:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QkHj6yxNHqV86xD9f9rRMp4RmegxtrG2NNsn/fkhknU=; b=MVLe6P4VOfMrZDSvu/Adh0D5yu
	j4QTrIo+6YPMyXxGIYtX6PhKC+W/pKfreHVqW1B5RYulXF+xxUZ2GRmiDHGNX4USi8bi22VLa6W96
	vYcO7Kppy8FprrtUlSydP/8GArKL3656Zxlrz/Wjun7AYRI+MP+qOacvcwghKWAzoqSuw21cwUi4c
	r4FU8xF3CBrdWZkCCbHhFsP1cJJ0Rppz/AvAFvV80KGOIzx9OUBEiG+euLLjIqroxh36i0fRGsuCu
	MdcCeslN81XDNh47/9GOn/JpD662ZuEmWtJycfpYGDcmmuukuF3C2J/++w48ISWybQEA3FkDhWFSw
	WR78Si2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzeCB-00000003ZCc-2GIO;
	Fri, 19 Sep 2025 16:42:51 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzeC8-00000003ZBQ-3EEn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 16:42:50 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3ee12a63af1so1119211f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 09:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758300167; x=1758904967; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QkHj6yxNHqV86xD9f9rRMp4RmegxtrG2NNsn/fkhknU=;
        b=bsj6vIXYuPIpV76cYSxJHLXGjMgbH+QQpHQ2qebw8xsgz0KnCJ5xtPJMGFP61442n0
         pwTHfqWkW38yo/KmSw3Lhurp+aVisWGBLd/pU66VkNcIKhANFg+EzRdjGIfW0hFUSl0h
         SJKmE8k/bKVVnzX0Fqm+1j8zbUGdDws6dd7vJaMA3aWJVOqWPOevlzhfXeB2pfWgYtEx
         u0pHCQVnkS/qj8yhOVljEA/vudRd+bkIDEfmPjKj01F0ERr595+YD+iHUjVYxeQo3qcR
         xH6QgY+gvW+ddbBVAuqTgGstVGxM+91TaKITcnss22UGveEQ7L/le4xYYouT5FMiF1ID
         YWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758300167; x=1758904967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QkHj6yxNHqV86xD9f9rRMp4RmegxtrG2NNsn/fkhknU=;
        b=cNhREr/rgVxKk5E4baqOaWSpE+s0FgH115CE9KM7iqlthkeebN4wuhvSq6UMq0divz
         2ttILtHzcOcQny3nHwDXgCKI4JYrkXVvj595Tr8ZC26cQ535wLI3RVfcYMJMq4bpbGeW
         Z41GK+SddIzQtwwo98MBs/nO1rgpqD9SQtE7/xMl76dd8Bif/YsQ5DDGwTlCWnvNun2c
         7I4RsA1pzsDOQGxlKYX1ZLwe9pgf0dAYyz9eoDXtXrcGUyNr+fEyVVGtqshNylGpAmd8
         2krLl8XsbtP4XSizk5Wq+M2Yd7jGKsddrro/5R94LbQagV4kd39VCJCZ8Eo2Dh633tFs
         bTzw==
X-Forwarded-Encrypted: i=1; AJvYcCWneIH2JIHdR72uVuRigcl2Qy7XjjZU9iIV8EfFRI+NvFGNQcnt98w0fdMJeQ56eFwZbuIbOKXbpb/GmtfLXPoY@lists.infradead.org
X-Gm-Message-State: AOJu0YxBh4qiEFLp3CpyyeVLaGa4F/c4PAh87mf7lhUp9t8FFet9Ehvw
	chY1Y/t+7Ot2+5t+1qPQ2LDqzS3hOE26kspdoGIKqQgban02nMW5mi/3gMgdoyCBlk8=
X-Gm-Gg: ASbGncthsD3fdMMYIC4JUN5Ogzp+HAtnWCtbV290PhSpY+LJ/RLDwEKdWJGgMAAmEiE
	LSry3fwo1gQvOqdGO4l1jnzOcGTsTIuc2IrqFkWuae2/0dnrG8T8fp0VBI51h3y889UQ6aEdwml
	xrLyhqY29aJxCM9YLQsvUKqtnTDWXf8CU/hasIlh+JiKaxGlSHVEUY9J8JOVdeChEwX3mMxZySi
	aXSeHJzDzwUvTh1WrO0iMAJKM1Gij9AbXUeQzeLfc4frD1NaZkf1CmdR25ure/tu8HbLdih5NPM
	QN0Sg5wBSsKGzomM2atyKW0DtiOFc+3CTzE8IKRXEJCax1CeeNYWizUXyupaJRAjpKx+cNU5uO3
	c2gZ3WYY+wh2q20jsOTJp2DZqKkAZ2e86ttxSnawVY0i+S+Ez1g8UQbXEzYSxL1uOUcAohtQX19
	Mn+ABOBm9nJ0Dj
X-Google-Smtp-Source: AGHT+IFhUncdh/63zODwAY6Eoa8z9GQAGmPnzhNb7b4Y3hgpiTCynPlk24Zvc+GNdq/F+x3+CVBVbA==
X-Received: by 2002:a05:6000:1aca:b0:3b9:148b:e78 with SMTP id ffacd0b85a97d-3ee855812a7mr3683227f8f.53.1758300166902;
        Fri, 19 Sep 2025 09:42:46 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8ffd:205a:6719:49c1? ([2a05:6e02:1041:c10:8ffd:205a:6719:49c1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3f1549285c9sm1799412f8f.52.2025.09.19.09.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 09:42:46 -0700 (PDT)
Message-ID: <ffa6fcdd-2b0d-4493-a8b1-961e51d41e6f@linaro.org>
Date: Fri, 19 Sep 2025 18:42:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] thermal: qoriq: add i.MX93 tmu support
To: Frank Li <Frank.li@nxp.com>
Cc: Jacky Bai <ping.bai@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Alice Guo <alice.guo@nxp.com>
References: <20250821-imx93_tmu-v4-0-6cf5688bf016@nxp.com>
 <20250821-imx93_tmu-v4-2-6cf5688bf016@nxp.com>
 <d9392dbc-806a-41df-8992-28c3d6132309@linaro.org>
 <aM2D+q/XCI38M9sp@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aM2D+q/XCI38M9sp@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_094248_844057_7F4C4A56 
X-CRM114-Status: GOOD (  23.64  )
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

On 19/09/2025 18:25, Frank Li wrote:
> On Fri, Sep 19, 2025 at 05:51:20PM +0200, Daniel Lezcano wrote:
>> On 21/08/2025 08:23, Jacky Bai wrote:
>>> For Thermal monitor unit(TMU) used on i.MX93, the HW revision info read
>>> from the ID register is the same the one used on some of the QorIQ
>>> platform, but the config has some slight differance. Add i.MX93 compatible
>>> string and corresponding code for it.
>>>
>>> Signed-off-by: Alice Guo <alice.guo@nxp.com>
>>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>>> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
>>> ---
>>>    - v4 changes:
>>>     - no
>>>
>>>    - v3 changes:
>>>     - use the drv data struct for match data and refine the code
>>>     - update the copyright
>>>
>>>    - v2 changes:
>>>     - use the compatible match data to identify the i.MX93 TMU variant
>>> ---
>>>    drivers/thermal/qoriq_thermal.c | 18 +++++++++++++++++-
>>>    1 file changed, 17 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/thermal/qoriq_thermal.c b/drivers/thermal/qoriq_thermal.c
>>> index 01b58be0dcc64d14ca5e4bba654eed8f15e827fc..b2e634547271dcf512c714907baa162921d2d527 100644
>>> --- a/drivers/thermal/qoriq_thermal.c
>>> +++ b/drivers/thermal/qoriq_thermal.c
>>> @@ -1,6 +1,7 @@
>>>    // SPDX-License-Identifier: GPL-2.0
>>>    //
>>>    // Copyright 2016 Freescale Semiconductor, Inc.
>>> +// Copyright 2025 NXP
>>>    #include <linux/clk.h>
>>>    #include <linux/err.h>
>>> @@ -24,6 +25,7 @@
>>>    #define TMTMIR_DEFAULT	0x0000000f
>>>    #define TIER_DISABLE	0x0
>>>    #define TEUMR0_V2		0x51009c00
>>> +#define TEUMR0_V21		0x55000c00
>>>    #define TMSARA_V2		0xe
>>>    #define TMU_VER1		0x1
>>>    #define TMU_VER2		0x2
>>> @@ -66,6 +68,8 @@
>>>    						   */
>>>    #define REGS_V2_TEUMR(n)	(0xf00 + 4 * (n))
>>> +#define GET_TEUMR0(drvdata)	(drvdata && drvdata->teumr0 ? drvdata->teumr0 : TEUMR0_V2)
>>
>> This is not adequate for code which will evolve. Please don't use this
>> macro.
>>
>>>    /*
>>>     * Thermal zone data
>>>     */
>>> @@ -73,12 +77,17 @@ struct qoriq_sensor {
>>>    	int				id;
>>>    };
>>> +struct tmu_drvdata {
>>> +	u32 teumr0;
>>> +};
>>> +
>>>    struct qoriq_tmu_data {
>>>    	int ver;
>>>    	u32 ttrcr[NUM_TTRCR_MAX];
>>>    	struct regmap *regmap;
>>>    	struct clk *clk;
>>>    	struct qoriq_sensor	sensor[SITES_MAX];
>>> +	const struct tmu_drvdata *drvdata;
>>
>> The drvdata pointer is not usually used.
>>
>> 	u32 model;
> 
> I think it is not true.  Copy model here is not extendable if need add
> new field in drvdata in future, especially need ops callback for differece
> variances.
> 
> Just list two examples:
> 
> https://elixir.bootlin.com/linux/v6.17-rc6/source/drivers/pci/controller/dwc/pci-imx6.c#L173
> https://elixir.bootlin.com/linux/v6.17-rc6/source/drivers/pci/controller/dwc/pcie-qcom.c#L286

Yeah may be I'm doing a confusion with a previous comment I had related 
to this approach




-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


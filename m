Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADEDC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 02:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJyX/sTI7ddUntBaZ2k7BLJc1KSOT8B7StpeDL2PyF0=; b=UVko7vKVK2TWD0X2DypWAZnQot
	S18IPkIu2O6pIKe92zWZ6aTMR+oZDa3WcBBc2DcrMxCDEM2nHgOBaMbA/0vEXPMktniRTKXdRO0Pr
	sOlRWk3ANm2Li87STwoHePW+dxEln0ouQZbQRlByc6gaICEwLn4Gh84Iq5LDGEIkX5K9S8+K5cDpI
	KiWS24jwL2D7whTZ7ouym8EmMGEWepZXWdiccVrIGFag96Aw2K6YJbkHnhSMqg/NRb714EQLRHWQw
	aPGY08ejBXw2CWr1NYHClOBN3jJAO2k7BgKGdygICQxMKVQ8qDgqERPtbeZlmnDKe4HYAVN31/8+c
	U5u7DGWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzme8-000000052Me-3or4;
	Fri, 28 Aug 2026 02:48:48 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzme6-000000052MJ-1G2V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 02:48:47 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-395cf2535acso549162a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 19:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787885325; x=1788490125; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJyX/sTI7ddUntBaZ2k7BLJc1KSOT8B7StpeDL2PyF0=;
        b=VrjFOhOzZ0bpepGBwEE8FMGkBY5vqoEAHQbth8wSKnMuN4zWPL5R1sAQUVbUfQWivU
         RNN/0LMwqL7pwYogfYza6oe1MUBHsMai/DNzY2LfafMT5KBljimILMcA2Bp5FYbmzmSG
         G+qZPHk4bB8gfTwTjCLB589mAFXH4Zy17p59z02NgfEmlsxEm/5oIvmeS6zYqG8bCu+I
         LAtnxLSdqj2JATR1V5cB+vigJ21eIo/4+mWpyrv7T9+C1T6Gdilple2MWU0kR1TyzAV9
         p4JvO1mkPEi1bgIHu11723NXFttEMaMAj4REoQaVGWsUpqYUzvgT8Ab2vImyTJcVGlk0
         BXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787885325; x=1788490125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJyX/sTI7ddUntBaZ2k7BLJc1KSOT8B7StpeDL2PyF0=;
        b=nFVWalbO+jNBEpkMT8Mxiu0wZBFNKwwI204b/+ONPmY2p0qrBtH4dMU4VhcYUDiICm
         /qkuBm1FampVBJ+XV8E68G0PPZtruM+Pm24UfcD5FFn9UpyIE2Ps/oALVgLANxoZ+OIU
         lhE2qZjKjPuor0X/IKnt4xrtT46FC6mwnIH4N9GU2ZHrOqsLlI6wxnq2FU+EnpKyfrHz
         LGp/U3Pe6+xGISzjggicYwwO3g4leWn4nWG2lUTlc0E6EkJCVNArDLxSiUl0kI9K3WR0
         Yis+RMmRCkyfveIpObY5Oe1prSvV3i01dM6OnKDeJZpzrHpL2MP2cJu9rStTICXaCXHO
         X1Rw==
X-Forwarded-Encrypted: i=1; AHgh+RoVKbTxea8Zvc7tAK0/1wnmuRmIfYhEA41pM4lc6rus9AdPkqqg7psQh6bbrtyagPQmSCrdVANTUyonAqI5gOjn@lists.infradead.org
X-Gm-Message-State: AFuF++nGKS8OBV8l8kYzCM1nf4NrRBFgbh8TS59/nO9LJ5iGUvk90W5z
	e6yWqOK6qLrFf2MN9s45s5wHgqp7ZRxZhhMKQosADrZzt1yiG1mhaGbW
X-Gm-Gg: AR+sD11KlzIVuxibpFZpOYUGM7aukY3t8Xyoh9+Fil7Fe9RDOz8bprpb0JPFYvLxQjz
	vUM79wKeMYK7n5st8PgjgQoaECilWueFRZ9Ka26LhKfm130tyk1K3fEXPrUtDgfaeo3LvvG6mSR
	IrbUMiwhuWdfMUKm96KWCOqPU+m6InwoWosfrkCpBdAj8JeL3OVeX8ImBo69V82fVlqmL6vgk2n
	vK9uIeGMLlTfCABgTNPH5jXZXld+Sz/DaT1kP+MyLedpuXDAiJO6aAdK2bWVY55Yc3esSE4LzAq
	BkMzS2PfFMC7mDWbjSXaM8tVKPa5no9AMSeytKkYfBV8xWtFP8DAvtvzeXhvlZTKa/O9qsXPYRC
	xV/98YmzLbHFe40ufG+8Q0ATtlDEJyspayPtcqkZYji8mkC8m7tjtVvQqDqk3yInJksv7fCx5lJ
	WDGeOAsCy29OPCzg/FOHzhKxVxLuCC8GTGEC+2JWYwVit3hzad1i4E+d7xB4bZ48/QaUBc63rio
	yMeOpg=
X-Received: by 2002:a17:90a:d44b:b0:37f:e5b1:ec4b with SMTP id 98e67ed59e1d1-3969ba8642dmr16032119a91.5.1787885325113;
        Thu, 27 Aug 2026 19:48:45 -0700 (PDT)
Received: from [10.25.165.77] ([128.77.72.133])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm2109869c88.4.2026.08.27.19.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 19:48:44 -0700 (PDT)
Message-ID: <8849ec9d-a7fd-47d7-a8a8-a31849637f6c@gmail.com>
Date: Fri, 28 Aug 2026 10:48:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mp-phyboard-pollux-peb-av-10: Fix SAI
 master assignment
To: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Yannic Moog <y.moog@phytec.de>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de
References: <20260827065556.2326079-1-primoz.fiser@norik.com>
 <0ee330e3-8c6b-4162-81fe-d769982df5de@gmail.com>
 <bc5c1564-963e-4995-90c1-8d78cd9df26a@norik.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <bc5c1564-963e-4995-90c1-8d78cd9df26a@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_194846_370645_1F86CA5F 
X-CRM114-Status: GOOD (  13.80  )
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

> Hi,
> 
> On 8/27/26 10:56, Chancel Liu wrote:
>>> The dailink_master label was incorrectly placed on the codec sub-node,
>>> causing simple-audio-card to configure TLV320AIC3007 as the I2S bitclock
>>> and frame master with SAI2 in consumer mode. This contradicts the SAI2
>>> node configuration (assigned-clock-parents, assigned-clock-rates,
>>> fsl,sai-mclk-direction-output) which requires provider/master mode.
>>
>> Just a small question about the commit message. As far as I understand,
>> these SAI2 node configurations only describe SAI2 providing MCLK to the
>> codec. A topology where the SAI provides MCLK while the codec is the
>> bclk/fs provider is common. So the original configuration seems
>> self-consistent, not contradictory.
>>
> 
> You are right. Such configuration are possible.
> 
> However, on this board's wiring, SAI has to be bus master for BCLK/FSYNC.
> 
> Shall I reword commit message or is this explanation enough?
> 
> BR,
> Primoz
>

I'd prefer rewording, as current message is a bit confusing.

Regards,
Chancel Liu


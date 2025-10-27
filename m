Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A3ECCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 15:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RhaaAECagc9DFp9XYeX6cR74fQi362tPJsuNQfwUA0=; b=lRBbhWqdauEJKW3EARP+LWA4tH
	Hsdh0j1X+IOjYjTjhdVjVPUMBPZjoXoCsx2iU+SPr5WoS1sYShA/CtvP5ehgIOD9CkFXY3BSMJ1CI
	h2L5KX43V4MgjQX3Ra55MApnVj59T8qOcdQV7++J0xhMkIvCUtkDo1qjj9c7p7OqmOxkMDo6k8e1w
	4P5cBqEUKoqEfclhfwpq/Q5JM7JdOAv/yB1EVn8Viho+cM4YN8F475MqR4YUPFmJTu3WfCuslFxWf
	/1cLPXW5IS6ihH8U62VKwZXBNJ460I/oMgTxNOnw0k7nj/YxoWVx+4gH82QkfcOOqRPz24SBXYzdi
	YiKhGTwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOyk-0000000ED63-36oq;
	Mon, 27 Oct 2025 15:17:50 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOyi-0000000ED5a-0Egi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 15:17:49 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b6d53684cfdso1073468966b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 08:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761578266; x=1762183066; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+RhaaAECagc9DFp9XYeX6cR74fQi362tPJsuNQfwUA0=;
        b=QY1tCpLWybvd0Y/xbde1UiVcB+cgejhlEz4ApZ4KRpWT6wVJrt1Y6FQbA7T0HxipdQ
         yC3wXhj3Xz1YxVhFkkvf1ji+chStKUN6+g+UM1uSlpmrpt4yIjB2WYYlUd+GUAOOBRKY
         sDaQbGS8LNfAWGJWk3qoMowfSLmU3qPwpV9T6iF40Y38GHaNJ5IqYI7x8rEGt8iLES6H
         JSRxNAT2iUnpZ/loNqjAON037IHoIdcvZHvbwgFgmCppjH5Q9wyoHDnGDFUToD3ux4Su
         uQwviqtTIHpMLQWTezEIEVkYCsQQ44PGxTb6Oh8W50X2sD+RWxxrUQJI5KfxRDfOohH3
         8JLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761578266; x=1762183066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+RhaaAECagc9DFp9XYeX6cR74fQi362tPJsuNQfwUA0=;
        b=FY8P7YhXqwaIMgugbQRfIf0v9zuzVZ8ItZg1yJ00kmeMQEZaNNwOjQSqJHfEXpAsQW
         QrVdMUoSPJHGR6v9ffOA/+ScNRyt/agTdSNWI7HzaFgMKOfjY6RThqu2YA8mW+hLT0cJ
         Rbt/3b02uQ3AiiEWHdce3j9uU4EF86sZgZKkw3SKOtF10aAfw727XgVfvO8jnk+pBCk/
         1LgsWh94cYl8+NNAqtWSduMY4ohSMZ4vcEUPZfqtujfwYYl6QfMzzdsGh6/zvhoMcdg0
         a7vs5U374ERYx1ibVGs4SuklSwc4pGwmGPo68olXy3OauNsxgDFOul1UF+H/dHszGSqF
         wb+g==
X-Forwarded-Encrypted: i=1; AJvYcCW9U0fjhT7126VoTWZetPorIYAb3X5ETfGZfwgEjKQEIQlRdSHmxoK1gY8YSwMjC2VXopcTwyxC07T0gweSbLVn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9Z9jsGNYk4MJcaWXSKeWA4o/qP9Vdhg+bCnBzZIsEqHpbrIEe
	as4Zer2pDFDMKSiBGKMte8wSXjxg7J4raU5LM8U9IUuaKnsUhnsOJzSGGwR1DnKmtcQ=
X-Gm-Gg: ASbGncvPfnqpLUWAC6C2NyyD0ypmg0iQJn9MGin/nfob9YMCaPjBcDJGV3Cvq89+4ax
	jU+hazXnw6IvniLdYv6gGiOnevRxSFBI50ZnvbaBN+0nyqRlOBem5NZytFGZASRhyI7iQfNIh1o
	e+I864M95YL+np9vkwKlFj/5fFRDogA5A8jvfKRwbXpa4Vpi5vX4IEwIPeEzltbjbpz+e09l4VV
	IRM/rh/By8uhtMVYIKdA5wGv0miupwh2zIZpr+pqSI8IqVQhrlNbwhluV0vOEnbserEPpqCvzER
	uPNmEaiEop9NPl7LKWoiOFbURa/ACltg46O3ZpdL5MBFk3ag5Pp+qCh4i1V8stbdXAFfQnh9K/t
	3YrDdVhF2LmoPhhSp6SUBnNxijoNWwzgCgeU2qOFrSgVh1NVj/zo1xnI3eSEUPRVonyOp6RZXkY
	gDTWF9QYIenX2OxWhLamPZBwT5cDq1xw==
X-Google-Smtp-Source: AGHT+IFwRk45A3Ur3DKKqB7hUJTu/XpniiqiGgHDiWfPN2WS4tjYIiwIglRdwwwXDeEdp9t66AD1SA==
X-Received: by 2002:a17:907:97d6:b0:b45:60ad:daff with SMTP id a640c23a62f3a-b6dba49c6d1mr31539266b.28.1761578265848;
        Mon, 27 Oct 2025 08:17:45 -0700 (PDT)
Received: from [10.25.208.2] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85308cb0sm809592766b.9.2025.10.27.08.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:17:45 -0700 (PDT)
Message-ID: <feba1845-5f2f-4716-950c-9abc7c4594a9@gmail.com>
Date: Mon, 27 Oct 2025 08:17:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: clock: document 8ULP's SIM LPAV
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-3-laurentiumihalcea111@gmail.com>
 <20251022140841.GB11174@nxa18884-linux.ap.freescale.net>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20251022140841.GB11174@nxa18884-linux.ap.freescale.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_081748_119929_9882678E 
X-CRM114-Status: GOOD (  16.64  )
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


On 10/22/2025 7:08 AM, Peng Fan wrote:
> Hi Laurentiu,
>
> On Fri, Oct 17, 2025 at 04:20:19AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add documentation for i.MX8ULP's SIM LPAV module.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>> +description:
>> +  The i.MX8ULP LPAV subsystem contains a block control module known as
>> +  SIM LPAV, which offers functionalities such as clock gating or reset
>> +  line assertion/de-assertion.
>> +
>> +properties:
>> +  compatible:
>> +    const: fsl,imx8ulp-sim-lpav
> This block also contains QoS registers, General purpose registers, HIFI
> general purpose registers, and others.
>
> I am not sure whether need to add a syscon fallback here. dt maintainer may
> help comment.


syscon programming model is NOT compatible with this programming model.


If you need access to other registers (not covered by reset/MUX/clock APIs), you're going to have to either go

through a subsystem API or manually create a device link between SIM LPAV and your consumer and then use

something like dev_get_regmap().


Either way, you need to make sure that you're using the same lock for register access.


as for the interconnect QoS-related stuff: can't really comment on this as I haven't worked

with it, nor do I have an use case for it ATM. However, the binding does need to be complete so

suggestions in this regard would be much appreciated.


>
> Regards,
> Peng


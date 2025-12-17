Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968C8D65522
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 09:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6U8RmIsmmCspUZaxmJtWvDEjx4lOFUFJmBZcq1fdU/U=; b=aS7N6duZq/bbRg3H2RHR9W6K8P
	Ovj+R+PSdz5iaJa0MbNPAlTVo0zILKClxnL/OR+3bdVXwTSAyxm+rs52YcZkPzbXdn+uOdKfhsVlR
	SFnSxiaHrHzlvf1ulBA9b2AUZb1l86Zpt/0ZxDxOm3pB0f4NaQHallAjHOwqxset4tilBEqHGCLgI
	pMbFOO6aCYw7QzduONPMVTcwOZpXc7y1UIAoHuTKtYNxhhO5hiaI6NMH0u5K9Q0rMJ0XO0yGHKpwg
	L9Dzo69IfCI3CpTCL3nH0wJU7JryIvpqh9LzEPpVR9pi8mn4pn6dEjxGc2Jjx7TGO69Tgl6LhOCcz
	M+3Maa7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnzo-00000006S4Q-1ofD;
	Wed, 17 Dec 2025 09:39:00 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnzl-00000006S3r-44aV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 09:38:59 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so1110538166b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 01:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765964336; x=1766569136; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6U8RmIsmmCspUZaxmJtWvDEjx4lOFUFJmBZcq1fdU/U=;
        b=cErEKNqjsY2fp3fuMPvVi/6nN6bHp3hGCanCsFTCcXGkJCtaUSeVU1hinmeK3JtwF2
         OA3lxd7IT9EG4WOTLpjIU5F5wLdMkJpYYr1+d3o4rUijU6/voM0gNoIp3yRLToXYUg9f
         N61d5d/9qUOYA3DJ4SeoAao10YmBc3iuQQusrQnKLNuMf5+Vo57GuEEPrSjTom7GoC7Y
         sVTwUgUyEyP1+sAi3q6ICPlxlTVf7QUVlIoGbzyfOlcQVSlXWJwyj1QphYtO/Zv5iLUK
         AWTgG4Q6gyz9xS+CVYLH9wTs+85EIAJGqCLrafkgLO6wBxFmxMEQ/rZ9gX+Jx9/z2mwe
         Pbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765964336; x=1766569136;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6U8RmIsmmCspUZaxmJtWvDEjx4lOFUFJmBZcq1fdU/U=;
        b=B4OgmVBVVMp4BlYZG2YPr3XBpxFX1AhM1VrOVH/FbsvZ/zj9vy087IVUc5V2VIBBr6
         mM/v4zmywdSF3duaUa5a9O5/sXE4SJZpcIFwEHj5TkD8er+u74sWMPh323BUreSVpeEN
         IO6rYrWeZlTxwCbxDGoYnMD0E0Bld6F+BgAQU2yH3Ay0yCJMwH2zNXmg/TigePrPea0Q
         T3JkMV0ytbqFeZ/ZreLcMOr1ALQzUMG16rIqD92w+oT398Ie0kQNNEH1mT6bMFXe4IWF
         4yMcDbeGZ2VTrb+iO3TSrUUCtYgaRv7G/PpPUhwHnM979UuMFxI4hyy4YEh9xj5LS5c0
         lIfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7urU7ULotJFbOKZXeShBgDwB9ymF+BVPm7YUTA5RX9qm8N6lwiZkzRdsI8UrB80OgduVHzRekIunFiNZEldVi@lists.infradead.org
X-Gm-Message-State: AOJu0Yy67TyyWYZ8ml5MacGW3SVELO5A5rKn3wxWDgXnpHn2PxjMfbqM
	k7mPsNkb5eDVXFxorzgQXECIlMdyCpdUdLRacXxv26JzkBTkAPxqVS6x
X-Gm-Gg: AY/fxX6umuaM7HUNLzO5OePx62hUiJoab3BVmx1WZN4iaAi/kcEoe1nM4m8dpQWPoa8
	yE02fuk785aHrl1TURmoR4KOVBBqrYZtSLhMqt6xx1akGQhKzzIxp8SWQHMDjTQK6nn94W/25nj
	JSv6B0FqWkhb9Q5JoizWSIircf264xHPc47VwmpdK85I2wpOsvgOT22ENHcDPxKbozqqYskATIh
	Koe5MjtFqbr5QOS4O2nn/9C94BRHXY/PjFlPQG0CUBhwgnJIAjNwwUKV6gwD/jjkWV0RGp9PVQk
	IvyutDbOWL7f5JieVJr1TGEwPNK5Ek+WMRnht0dTCQJYJ6ue+u91Vl7KGwI+K3DDVTobV+xtImb
	aeJ5BuTrg3S0GMk8S4b/5WVhO4T0kDCR05RJdHLM/g0PkWh1+er/3v7nUfjRZLUcX0JBNIFIPAh
	juKQNcK8LwViA38/8IA+LygsP0LJT7wfpg8k+gISA5mbY=
X-Google-Smtp-Source: AGHT+IFzAKXXuZny9gStK6VTzPjayW/7SjoVngvkKhxYreDaWZMWb0JOiqkX6kUUWkxYAZiqBvU7iQ==
X-Received: by 2002:a17:907:d92:b0:b76:7b85:f630 with SMTP id a640c23a62f3a-b7d238fa0abmr1684969466b.34.1765964335319;
        Wed, 17 Dec 2025 01:38:55 -0800 (PST)
Received: from [10.25.213.104] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7fbd7a55dfsm1070592566b.25.2025.12.17.01.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:38:54 -0800 (PST)
Message-ID: <23326a3a-fd1a-440c-acd6-28d2e7c0f186@gmail.com>
Date: Wed, 17 Dec 2025 01:38:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] Add support for i.MX8ULP's SIM LPAV
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
Content-Language: en-US
In-Reply-To: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_013858_023901_AAE16350 
X-CRM114-Status: GOOD (  10.86  )
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


On 11/26/2025 4:42 AM, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The LPAV System Integration Module (SIM) is an IP found inside i.MX8ULP's
> LPAV subsystem, which offers clock gating, reset line
> assertion/de-assertion, and various other misc. options.
>
> This series adds support for the IP by introducing a new clock HW provider
> driver and by modifying i.MX8MP's AUDIOMIX block control reset driver to
> allow it to be used for i.MX8ULP's SIM LPAV as well.
>
> This series is a spin-off from [1].
>
> [1]: https://lore.kernel.org/lkml/20240922174225.75948-1-laurentiumihalcea111@gmail.com/


Hi Shawn and Philipp,


Gentle ping on this.


Thanks,

Laurentiu



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA809C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 15:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35t1hJFOdpa+T0AaHCGkVAi9es9mhFSUPTxVJx4I/9w=; b=Sy4d5AxpSbvrYg4xm3cyt1KH93
	klnT/lGfrvOqdRkZVcvCcEExngHBCOwu32jleeKDjgKn2iJOD/IAqh/C5Gu1dvV3Zh3leDPgrhada
	U6l0Pgid264aAHKcVGpE6lBVMagVL1pxdgxxRL/M+GQaUSt4mNqxcj/7H3NsrRR764+4smX23DCaB
	Q0TOaQ7rtNUaDbmxDkv5QDOGD/LMm3uzgQIgmg0lyAxuyIH9MUPrtcIz6U1doheIBLgwsCxeEq5Ik
	xaGiXMgvsrcpM9J2vOFqER3Ut6cNG+DqZfRxyhJYdhF1bG9DhZsYzSKGu6Ep/AXqwx5tHaj5wgkRv
	kQt9TXCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tma0H-0000000EDAx-2jj4;
	Mon, 24 Feb 2025 15:04:17 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZWH-0000000E6pM-2vh4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 14:33:19 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso6115913a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 06:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740407596; x=1741012396; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=35t1hJFOdpa+T0AaHCGkVAi9es9mhFSUPTxVJx4I/9w=;
        b=Jtx0V0lOq2H8+SjBOsuq3cqhuCGYw68WN4THiGSZCpmTMRvI9jUAAWgEMSTXdVXG1P
         Z87GBO2EmHvxBgBUT+dPn1MvwaF1UMpr9D9CX0egHegYuMKS2goQYm3gjw45LA+6C2U5
         yB2OBVpysvZ+76Z0N7PU7RGhYS2vNdbYivfRY22kYc2UaFzWncuesYfCf5S7Tp7w17h4
         D6eJFKI3wnMQ1qorlVdbIpwmUzyNaEInHPW2HBhFLR4inWoTk14/vbWBR4JRmYIOpu+v
         l/sMKdVWjd+KfaNiIy19OjKJQ6Hbw7bHXcGzjgbVSmjNjkjCYGXcvE7BaVe0qCrrKY7h
         W57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740407596; x=1741012396;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=35t1hJFOdpa+T0AaHCGkVAi9es9mhFSUPTxVJx4I/9w=;
        b=lszIAZbg4o73Zf4gaLE2GBN3I+vv3+4kIiwNS4z8BwJJrWwtqAtUyp5NRdfmB04oj1
         9FiOzRkLXKU4pWRBE6KtIbUGK0eIoEOGO6ZK6xV+cjTxqmVJqhmQRhSlJUdrG2dxq4kL
         gui1uyFaRJfw1IH6wI8hUU1NVD37oyAROuhS3jZUkvzulq9XYrJf+IrtaYqFtcpDM663
         IPTPZu7QkTlT93kTyxkQbFPV0dnm9i36qnJ/36y5atbVu00OiuTX0UQAiEjp8L27jxiw
         XL39SHUcEXwM/tV86E9d79+0wv0I3KZ9zZro5PjaFSPLREjCg8lItmGuG1RJ3Rpv9KkS
         b9GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHy4N6otDyi6tw/enMlc+XCI1CDAgDhUOE7/syAeyVzrajBge5eZUACkBRrwsAtzjqq3IMfsgDLVmS9O/hC/da@lists.infradead.org
X-Gm-Message-State: AOJu0YydCa7RxCZ8oNwcutbPeFSN1WqeqdG2YLLVUdXmFeyauxk4iC+T
	bTVmva9EaAJm6jeEMVQOBVlFVGHY7yskH2y6RJK/CQH6k/93l5ME
X-Gm-Gg: ASbGncufOxgVhe1Zg+Fliy36d8m9dPTkgicSleRwa+2lUkOa3VVJIZoArjqjfFN3L9J
	cpMEmqMlQC9Kag3IPQsyHMB7VDtjqgTHWpHJ3itZGHl/aO1nUsKbHTJA6JY3j4bJh9jAW0iQWl4
	Om1FBmafKaD2+iSEgM81D5mD4GOIkglyqD3fVMXiqKWiRZZj1fJhCLjPNkH8uc6s/0f8ABvhznZ
	bwafk5pMHEyYJ7HXusPNDNjzoHv5IjNB9kQ/jHPzmUtn+Z4aV+3Lrtjudjf36UzsRbTiXR/c7OM
	eJHYiEpnxqvIOY+tvM2g9n/ixoaP7YoXP3pXtnxsZNlF242f3sc=
X-Google-Smtp-Source: AGHT+IEpuzX6lyN2J9M4/ZBYAmLlIpNrQmbES6PeBLBJOGfxNsj0XhIs5KAuBO9sPVp0JF08jFkowg==
X-Received: by 2002:a05:6402:13c8:b0:5de:d803:31f3 with SMTP id 4fb4d7f45d1cf-5e0b7222fa2mr10839330a12.21.1740407595653;
        Mon, 24 Feb 2025 06:33:15 -0800 (PST)
Received: from [192.168.5.199] ([92.120.5.6])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece2721d9sm18891253a12.56.2025.02.24.06.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 06:33:14 -0800 (PST)
Message-ID: <36451a88-bfc6-4402-8e16-890d524a9368@gmail.com>
Date: Mon, 24 Feb 2025 16:42:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT
 freq. to 800MHz
Content-Language: en-GB
To: Adam Ford <aford173@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>,
 Stephen Boyd <sboyd@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-clk@vger.kernel.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Lucas Stach <l.stach@pengutronix.de>
References: <20250221190929.31469-1-laurentiumihalcea111@gmail.com>
 <20250221190929.31469-5-laurentiumihalcea111@gmail.com>
 <CAHCN7xL=QZHs5sD7Ja7pBOcXM8cWVQYe270EizDFN--CH_5+zQ@mail.gmail.com>
From: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
In-Reply-To: <CAHCN7xL=QZHs5sD7Ja7pBOcXM8cWVQYe270EizDFN--CH_5+zQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_063317_743888_78393C39 
X-CRM114-Status: GOOD (  16.40  )
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


On 21.02.2025 21:37, Adam Ford wrote:
> On Fri, Feb 21, 2025 at 1:11 PM Laurentiu Mihalcea
> <laurentiumihalcea111@gmail.com> wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> AUDIO_AXI_CLK_ROOT can't run at currently requested 600MHz w/ its parent
>> SYS_PLL1 configured at 800MHz. Configure it to run at 800MHz as some
>> applications running on the DSP expect the core to run at this frequency
>> anyways. This change also affects the AUDIOMIX NoC.
> Unless I am missing something, the i.MX 8M Plus Applications Processor
> Datasheet (rev 2.1)  has a table of frequencies, and
> AUDIO_AXI_CLK_ROOT is shown to be 600MHz nominal and 800MHz for
> overdrive.  I agree that it's likely not running at 600MHz now, but
> 800MHz may be out of spec for people who are using the nominal voltage
> instead of the overdrive, since overdrive requires higher voltages
> than the nominal.
>
> adam


You're right, this would not work if someone was using

nominal voltage. Do you have an upstream board in mind/usecase which

works with nominal voltage instead of overdrive? As far as I understood from

Lucas's patch ([1]) there's no upstream board using nominal voltage?


CC-ing Lucas on this as his patch ([1]) is similar to this in that they're both

trying to use overdrive clock frequencies in the DTSI and I'd very much like

to have some sort of consistency in the DTSI if possible.



[1]: https://lore.kernel.org/imx/20250204182737.3361431-1-l.stach@pengutronix.de/



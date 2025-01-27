Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4577C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 08:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRfXnTYaKnD2X0VpUazFcpCM97K9hQFNjnJqcy3F5/Y=; b=OrIfzb+eyDzrXeKurnkAvYNhQS
	fcnjYnwCnHu8DC7zxQmPk0gCK37qcNKLBIJfa4mA5QP7hAv7jx4oLx/mfKDQYHPfhxB2YM4RrrBsj
	xByN1d/KqBefQmL18+j7UnPUMmAo3eto4nIJWuvHMUNC+CHOLmdeJ2sjBeBdp4G1p+QirOdMfbgUI
	EtEj4gCwjAov9e7Jhl3hv4mq+2J3Nc2MUrf6Tx+LkzxDI8PjWZsfgqZe2jGwDO3lvkkYZSTEHHoQQ
	rnrK9KKvXXeH0yTiaAzNKu3DOjD9Hi0W9AuLiEOutPv2FfGzxkNKYNW67TczEZRCoZKkXGx5BHj57
	EE7GgYpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcKYR-00000001tlQ-1zih;
	Mon, 27 Jan 2025 08:33:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcKWs-00000001tdt-38hn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 08:31:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E1662A40EEB;
	Mon, 27 Jan 2025 08:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3E4C4CED2;
	Mon, 27 Jan 2025 08:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737966693;
	bh=4kVQB3TwUde870obOhf97qAtIGbL0FwIw1k1hGzz9kw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=shoGLgjEZwY0pbm7opbk+KgUkEgoEAY5yjyaQx8pJhEzX9Mzmhn3fC8LfhJFqtN1v
	 GR5jrxNkWQUlNiGkbiOq7lQV7gl1vGkQkxgjh0nI2bUgqYrL06obzPUVY5kC5qoIgR
	 iKr6Qh983MjsD1m00AAtxY0ardTxOeWGaFVAOlvvOPpv1jhTLFk9Qxdt1ACxzIJa3b
	 cRvYXAiVUKq5HmlTgkXSzNBEh61bFbOzVq1tUwPj+fqb8C89jDsWtvyG3dJLyZbYf7
	 3PUBv26hZdzMXzPgjX0sY0FEs3TdMi9COiwuvP4xH8XkHv89qbJrPZGcG/aVlosmX8
	 Rg2Da7nrFED0A==
Message-ID: <5165cc5e-4ba3-45a8-8bc0-6ff6f379c4af@kernel.org>
Date: Mon, 27 Jan 2025 09:31:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] clk: Support spread spectrum and use it in clk-scmi
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 Peng Fan <peng.fan@nxp.com>
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
 <CABGWkvpj2bYyqiOp4D9Ss2aWOnoR7BxqDOGpXdRusq=aWu9BEA@mail.gmail.com>
 <74663d9d-364e-4db3-b18a-1068e2845215@kernel.org>
 <CABGWkvo+HXF4hu-TG314HSb2omSmTE57hbHQt5V2zoc2_SkxvQ@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CABGWkvo+HXF4hu-TG314HSb2omSmTE57hbHQt5V2zoc2_SkxvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_003134_917905_1A6F88D5 
X-CRM114-Status: GOOD (  22.87  )
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

On 27/01/2025 08:59, Dario Binacchi wrote:
> On Mon, Jan 27, 2025 at 8:42 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 25/01/2025 13:58, Dario Binacchi wrote:
>>> On Fri, Jan 24, 2025 at 2:19 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>>>>
>>>> - Introduce clk_set_spread_spectrum to set the parameters for enabling
>>>>   spread spectrum of a clock.
>>>> - Parse 'assigned-clock-sscs' and configure it by default before using the
>>>>   clock. The pull request for this property is at [1]
>>>>   This property is parsed before parsing clock rate.
>>>>
>>>> - Enable this feature for clk-scmi on i.MX95.
>>>>   This may not the best, since checking machine compatibles.
>>>>   I am thinking to provide an API scmi_get_vendor_info, then driver
>>>>   could use it for OEM stuff, such as
>>>>   if (scmi_get_vendor_info returns NXP_IMX)
>>>>       ops->set_spread_spectrum = scmi_clk_set_spread_spectrum_imx;
>>>>
>>>
>>> I wonder if your solution is truly generic or merely a generalization
>>> of your use case, which seems significantly simpler compared to what
>>
>> Please come with specific arguments why this is not generic enough, not
>> just FUD. Does it fit your case? If not, what would had to be changed?
>> These are the comments needed to actually work on generic solution.
>>
>>> happens on the i.MX8M platform, as discussed in thread
>>> https://lore.kernel.org/lkml/PAXPR04MB8459537D7D2A49221D0E890D88E32@PAXPR04MB8459.eurprd04.prod.outlook.com/,
>>> or on the STM32F platform, where parameters are not written directly
>>> to registers but are instead used in calculations involving the
>>> parent_rate and the PLL divider, for example.
>>>
>>> I am the author of the patches that introduced spread spectrum
>>> management for the AM33x and STM32Fx platforms, as well as the
>>> series, still pending acceptance, for the i.MX8M.
>>> From my perspective, this functionality varies significantly
>>> from platform to platform, with key differences that must be
>>> considered.
>>
>> So what exactly varies? Come with specifics.
> 
> In all the cases I implemented, I enabled spread spectrum within
> the set_rate of the clock/PLL in question, as information such as
> the parent rate or the divisor used was necessary to perform the
> calculations needed to extract the data for setting the SSCG
> register bitfields.
> 
> If I'm not mistaken, I think this is not the case implemented by this
> series.

It feels like you speak about driver, so I misunderstood the concerns. I
did not check the drivers at all, so here I do not claim patchsets are
compatible.

But the binding takes the same values - the main PLL/clock rate.

Best regards,
Krzysztof


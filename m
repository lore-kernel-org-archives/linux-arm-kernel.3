Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA78CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 21:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWenJQKHGvTj+n/qgZQIpg+9Ejswl9uucWP6T0h0hpI=; b=xnPUkfzCOCLt3FmAB1e5bLAsTZ
	39QRO/WY2UWviPBRUHFMKBKmVePwVHKQVfUxJlpouo6t0s79CeOynD/MYXk8OUcPEiRnTkYExTsvb
	zdqjru0EUipMT4CNe4kF4eGa8j4H4avqnDI+XvuyQ1pzwz9EncQP7UD1eZJYNkTSR+lFk3lpLU+7a
	keIYrNeSXy3byZGG7rXJdHAcyw6tVx/Clg0O7V/exh3hJaolWJtv+hI1qcFE0fgwbW07IAw43mUde
	zEfrsjODPakGW7o1jZdfLMmKkuq5SKOPg0FCy5dwgk7CPc9gLHZgvuADldExaNYA+tEk34OwarPZH
	rW1zbljA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8mJW-0000000HQYH-0yhr;
	Tue, 14 Oct 2025 21:12:10 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8mJT-0000000HQXQ-2qXU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 21:12:08 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmRjp4WXwz9v66;
	Tue, 14 Oct 2025 23:11:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760476318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GWenJQKHGvTj+n/qgZQIpg+9Ejswl9uucWP6T0h0hpI=;
	b=MLYI2/PHUQ4pCbm9fiLSTZAnUEOdKGjp6Au1B9J53t8M+wbCqm1xlFnvXkFREipJSNM4zV
	Xbbqek71cshVEyb/L9n1iv9eFIQMvPe4oYr4xtI1JeMHWefwaejwgfBp+fT9lAscZxwBn1
	F8Lv3JB9KqBqKSnzBiyx1RkceBK1RjarniMYy72tUZhbRDT0cspNP3imfmUcH5TklObIU0
	KhffzrGnLAbEnb3bhBbN0GzWCpxNljk3ZyMX2T/1EUzgz3xKqfGYe1IQiu5mRPJdfBKFK+
	DDFK9UGzdyTo+omE3G2FEdAAgmdbgwoG64vUo/5q/mZOZkiVX7vYRx3mHek/Cg==
Message-ID: <43e3e005-5d30-4450-8dbc-8c6b5a0fa951@mailbox.org>
Date: Tue, 14 Oct 2025 23:11:54 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 05/39] drm/imx: dc: Rework dc_subdev_get_id() to drop
 ARRAY_SIZE() use
To: Frank Li <Frank.li@nxp.com>, Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-6-marek.vasut@mailbox.org>
 <aO0vLbkpXejre2Ta@lizhi-Precision-Tower-5810>
 <c7fee270-f3ff-402f-8266-0ffbb5077a61@mailbox.org>
 <aO5oKe14GLp3diGH@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO5oKe14GLp3diGH@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 8ejmrw47in7jc7eotepxsc5w834h4ob9
X-MBO-RS-ID: 68e0347f68ce8adfa13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_141207_869399_DA5E839B 
X-CRM114-Status: GOOD (  13.98  )
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

On 10/14/25 5:11 PM, Frank Li wrote:
> On Tue, Oct 14, 2025 at 04:03:37PM +0200, Marek Vasut wrote:
>> On 10/13/25 6:56 PM, Frank Li wrote:
>>> On Sat, Oct 11, 2025 at 06:51:20PM +0200, Marek Vasut wrote:
>>>> Rework dc_subdev_get_id() to drop ARRAY_SIZE() use and use empty trailing
>>>> entry in each ID look up array instead. This allows passing of those arrays
>>>> around as OF match data, which will be useful when using this pipeline on
>>>> i.MX95, which has different address-to-ID mapping.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>>>
>>> This change is okay. but my questions is why need map register to id.
>>
>> This seems to be a recurring pattern in the driver, where some components
>> need to find other components to link with them. The mapping is fixed, and
>> since the DT does not encode link IDs, the resolution of the mapping has to
>> happen by mapping the component base addresses to the IDs first.
> 
> In graphic link, port@<n>, n should be id? why not use it?
I suspect you could model the relationships between the DC blocks using 
OF graph, yes. I also suspect that description would be very complex in 
DT, considering the amount of blocks and links this device contains. I 
suspect this is why there is no such DT description using OF graph.

I think it might also be good to talk to Liu directly about the original 
design decision and why this id mapping was done the way it was done, 
they should know better than me.


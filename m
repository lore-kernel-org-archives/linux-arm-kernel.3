Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3880CE77197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 02:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJ/N98GUomXDkft85DxAvNEuUOqGWE/KcZAgHDK0jeE=; b=fhOGmpOFfPu0SqIbJ22jUL/baC
	ySJZmDegkQiXwBoyDOcRyQLbsDGTV48JtZgWxp40yUU1VOej9XQM2mjz9bgOdj+XuWJSyxFU/NKbf
	LoXxm8oLmD2WerUDFhcq5rBfd3d4b743E9IyDpxv900sK/NvrvXorcK6DHWGayRf9qelwonPV5uVx
	VUcwm/ZznpzuXqw9C6+aq54qncmejKmpwEhMlI9m7O1YHGKhunrhKJsjs7A8IazAS3oXU7HXpd2xr
	lEMyEm2OgNGDswVfrxtXY9Ec/C/bthdHyCT4GUKvqv8KuovN1+lcF/lmAOeBPzJwQHMUPZAtQkL7S
	f48EAfUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdGk-0000000064t-0x2n;
	Mon, 06 Jan 2025 02:55:06 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdD1-000000005MT-1ujG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 02:51:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0559A101CAF7B;
	Mon,  6 Jan 2025 03:51:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736131872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OJ/N98GUomXDkft85DxAvNEuUOqGWE/KcZAgHDK0jeE=;
	b=T9ITUC6fQelTFwjAEEJ5m2WGy+lRIqB0Lu2y8bX9Yd30G5cxtC9Yh5P4HdPJhMz2myWR0J
	IecEuDfsrsVlO4h9QdnBwPonalU6JMm0YF0TiFz244f8sw+RtnREMZW4NLXVECPqS+OPGX
	tsnntiH/BG7jFX7wu4PdwjCc4ANTVQ2Ctvh2soprVwDJ9NnfJuudFoEGqEXNdi1n2rttfw
	vb0o6esPRuD/rf/jDhxv8kYXjY7Op2gHMFDyubWSVOBQFajmVgaGtNouiB7Nbgi5jiwZoA
	vIrXab+KvqVkaJl4eC6MQc7QzvfC0oEwsWirw67d0dYSGRnrnx+ojFZoEFhvHQ==
Message-ID: <a783fe47-89dc-479b-8e85-f956d95cf404@denx.de>
Date: Mon, 6 Jan 2025 03:48:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250105190659.99941-1-marex@denx.de>
 <20250105232219.GC21164@pendragon.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250105232219.GC21164@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_185115_658230_160D9148 
X-CRM114-Status: GOOD (  13.17  )
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

On 1/6/25 12:22 AM, Laurent Pinchart wrote:
> Hi Marek,

Hi,

> Thank you for the patch.
> 
> On Sun, Jan 05, 2025 at 08:06:03PM +0100, Marek Vasut wrote:
>> Add a flag meant purely to work around broken i.MX8MP DTs which enable
>> HDMI but do not contain the HDMI connector node. This flag allows such
>> DTs to work by creating the connector in the HDMI bridge driver. Do not
>> use this flag, do not proliferate this flag, please fix your DTs and add
>> the connector node this way:
>>
>> ```
>> / {
>>      hdmi-connector {
>>          compatible = "hdmi-connector";
>>          label = "FIXME-Board-Specific-Connector-Label"; // Modify this
>>          type = "a";
>>
>>          port {
>>              hdmi_connector_in: endpoint {
>>                  remote-endpoint = <&hdmi_tx_out>;
>>              };
>>          };
>>      };
>> };
>>
>> &hdmi_tx {
>>      ...
>>
>>      ports {
>>          port@1 {
>>              hdmi_tx_out: endpoint {
>>                  remote-endpoint = <&hdmi_connector_in>;
>>              };
>>          };
>>      };
>> };
>> ```
> 
> Are there any in-tree DT sources that use the old bindings ?

See 
https://lore.kernel.org/dri-devel/AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com/

The rest is fixed, thanks.


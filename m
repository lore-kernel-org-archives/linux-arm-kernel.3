Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DFACCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 14:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCyb2ibX28AxJ/J6U5+s4yIqyUkd+qFW22qoG96WL28=; b=4QJwHSppGhDjFzd2fa8HZsi1aE
	6er/8EVNqUT6UaJSaAyRCqk6TfBvBeWayLk7ZXIH/cadGKTRd4S0swuFnH7dQkaemVFjaeWg781UI
	aSDZFbCws7Y8ygVwvyCdwdQ5Okyy4YaoVkm8tbCSxpRX4eH2u2b6VDRUZOoNg+nwvpTvPbCL0keCn
	Py8lfPAzURcb0ilnwVydPI5+A+48QR5FJ7Pr9s+5NjG4o1MCR+2UAzbJ9+LipB28nYMuSE4oa+KsF
	fEx6afnk0j4xaGnBMUbG9EwmVizLtfURF9l+vuhkClKbfgGX2QI52pgz5iL/7BIgnPQUGSn6k7Mex
	hfhTkRbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8fd1-0000000GYAP-2V77;
	Tue, 14 Oct 2025 14:03:51 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8fcz-0000000GY9S-1a0K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 14:03:50 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cmGCf6pgSz9tSv;
	Tue, 14 Oct 2025 16:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760450623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yCyb2ibX28AxJ/J6U5+s4yIqyUkd+qFW22qoG96WL28=;
	b=N0KCt+9H1/tPccmwN4tQFcvZaZaUwKMvPrSwOqzEqQTRikWBpGXYOorSBJYLR404EtnYLM
	7K8Bqrte59xBIChslWPL4Yo4fbKTjrN2G2JwmZEpLHvdcwcgA2ESK1nV/vucswU9WsHy8Y
	fCRMBNsPqyA/wrTyyRel1EGx2Ya8u5lQ/7H5t+V0BXsTXQs570Kf+HHeaBEOOPkTXXefGC
	R91u0UhOcPXqWYRL3tC6K9WyKQpEFRFk2GbMqk8mKqSJmFnTIdNqjDonbDSyjaEHD02G2n
	zxLreKd0N783qBZEZmq0BzOr4ekY1OuuKlX6WWgu+O7VROvyrgd8u7PTu9NncQ==
Message-ID: <c7fee270-f3ff-402f-8266-0ffbb5077a61@mailbox.org>
Date: Tue, 14 Oct 2025 16:03:37 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 05/39] drm/imx: dc: Rework dc_subdev_get_id() to drop
 ARRAY_SIZE() use
To: Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-6-marek.vasut@mailbox.org>
 <aO0vLbkpXejre2Ta@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO0vLbkpXejre2Ta@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 593cda8ecce9591adfa
X-MBO-RS-META: rdmw869wa3nhjapcf1653gyr3tf5in1e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_070349_578384_BD271BC0 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

On 10/13/25 6:56 PM, Frank Li wrote:
> On Sat, Oct 11, 2025 at 06:51:20PM +0200, Marek Vasut wrote:
>> Rework dc_subdev_get_id() to drop ARRAY_SIZE() use and use empty trailing
>> entry in each ID look up array instead. This allows passing of those arrays
>> around as OF match data, which will be useful when using this pipeline on
>> i.MX95, which has different address-to-ID mapping.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> 
> This change is okay. but my questions is why need map register to id.

This seems to be a recurring pattern in the driver, where some 
components need to find other components to link with them. The mapping 
is fixed, and since the DT does not encode link IDs, the resolution of 
the mapping has to happen by mapping the component base addresses to the 
IDs first.


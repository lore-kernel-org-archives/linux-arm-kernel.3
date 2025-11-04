Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5878DCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iyw2a6XGrVsDBi+ogcdblT77R4F5a2qgkSqZJ6Q4CEk=; b=NB8zwt3bkcetOdWJ1AX++G8d63
	/ojgZBhmZCNdBCumYTZ8VI0RIM+sN0zLx+TBYok98OF2mQJK6i/6R1q/aqMHbw/7EWNYoz9kDh1Jr
	M5U7w+5RkIp+O4wc80UEY/NNTX1VJRP3Vjhhz6P03CFWVsV36RMD+/SGP7qSqQ8a+kDa8xwBFlhSS
	H0uvsrLSThQ5UCoQIpsPZzCUIk/EPpbo+RI+bxZFAifVLdsU9lFuEpKmtaO3t2yu9uVzFfw8Ok6R9
	q0MjO3/cyvgctiJnQQnc8bbC6HwjFEmBjTsKxvmt9hRTSqXuZevN5mn8VtRaJXGC//9JkCgQMzNqV
	qtC5Rk/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIqd-0000000C3oa-2kuQ;
	Tue, 04 Nov 2025 15:21:27 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIqb-0000000C3oB-0gJT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:21:26 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4d1BxY5y00z9tsS;
	Tue,  4 Nov 2025 16:21:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762269681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iyw2a6XGrVsDBi+ogcdblT77R4F5a2qgkSqZJ6Q4CEk=;
	b=AMQBiX6xFZmcOncbHcyQ7z5bWygUWTzLAQc9ScI5DoR8WB2yM7OVRybP4riyHquQeTzRrd
	mnNWOFAeyEOX1wrRHd0J9ZNlnghIuLmwFmQJNdNlftDV7nye3dGWJzAvqtrMy/igEDDSh8
	7awOjrvcYo5jGPEamJZq4VTs2p7qxIhk8VZyspINdyhWvhFDPzZsrxne9aQ52giWq26bP9
	aDkfm2DFbHBirF8aJq+rqeOm5eMzQYR42D+6DN4rvHFmb49lJMDPblJxCmiZUidac2pGQO
	yerbz7/AttZb+yUXo9KK70V6eSfeQ5iJpes4ltktGO0iSSIFN3xtzawuy1BJ1g==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=DNTl9Vzb;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <d37adc12-4ba8-4f0d-aa9a-9071e153917f@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762269679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iyw2a6XGrVsDBi+ogcdblT77R4F5a2qgkSqZJ6Q4CEk=;
	b=DNTl9VzbnMDKEG5USWEmX8/muXmK0aVd1LEOgDS+SbEUWHnql/Ft1diJV4ig6Z0VoDwoQ/
	D0HWfETWpmc6NcmUeWfhyHV56Ls2or9E35CX9vQFRMp4AV190d703EuO8BPHB3bApp4I4y
	77HD78UA849bddwVTApTilR5PJ6bNsFwZlhzhHVOfEqTMLiJpf7rXTgWTbta+bvAmyIrcH
	NivudVHkKiKDhbBVwkt9Ojh2sMk1RjobQU6HnyCtqfvuUe2UVSDmUXvyU/dwHpPydvnAx2
	jk8COqU7wpQd8fwJL7/oa7DVwGVfwh1yWXTP+PZuaVNmJcFLOHcKB8jyIchnXQ==
Date: Tue, 4 Nov 2025 15:23:08 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] dt-bindings: gpu: img,powervr-rogue: Document
 GE7800 GPU in Renesas R-Car M3-N
To: Matt Coster <Matt.Coster@imgtec.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
 <20251104135716.12497-2-marek.vasut+renesas@mailbox.org>
 <5e2ea623-1e41-4cf3-a81e-2ab7d288c013@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <5e2ea623-1e41-4cf3-a81e-2ab7d288c013@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: fy383rnxybucsoo939z786g6im7yf389
X-MBO-RS-ID: 3280eb3815e7cec32ef
X-Rspamd-Queue-Id: 4d1BxY5y00z9tsS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_072125_376012_96C31DB5 
X-CRM114-Status: UNSURE (   7.81  )
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

On 11/4/25 3:06 PM, Matt Coster wrote:
> On 04/11/2025 13:56, Marek Vasut wrote:
>> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
>> present in Renesas R-Car R8A77965 M3-N SoC.
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Reviewed-by: Matt Coster <matt.coster@imgtec.com>
> 
> I'll take this and P1 via drm-misc-next later today.
Thank you


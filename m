Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCAACCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDU4MHtIXNjqAS9JJD27/CnM+BvS39aAL00HB1wKmUs=; b=dbfLxZnEyv8S6bTFft2zKJhqKE
	Z11VD4NyunYH91U1s5WQ4yabv+7AU+PPshUekuddfhLx7EGvFvK9M+DOYPCOmrunH3o07tZ2/NJgA
	t9tWNDiYkJF9C37zi35VgqNsP5mLT79jXr9wvA9Z//vMZ/Hyb6odkRPp8M8nsnL7caYInh6H/eHs1
	L+jsuu3vx9eqkOpvGQTVruhd1PV59E4dCX0q3yi0a5lOPumIAirvjZLT7XYvMPN4c8zgBmu8sB8mH
	TWhCEr/gH0pefnPZeamXevLpWKCpJgMZKXPCdBAzcrW147Jtg+HEfmPDP5z345ISGr30j9DcQMhMh
	aZXokCMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Kai-00000004H0H-0vnt;
	Thu, 16 Oct 2025 09:48:12 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Kaf-00000004GyB-1dYW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 09:48:11 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cnNRk5kTGz9tjH;
	Thu, 16 Oct 2025 11:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760608082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dDU4MHtIXNjqAS9JJD27/CnM+BvS39aAL00HB1wKmUs=;
	b=LY6pxnquYPZzf/vnpVqvwnv42pmxyX6hS/LsDWtU2B5JF97gz28NKgw1jRUUjFmYd0WhY4
	DhTdpjEhwlwi09VKAedBaCkcFWVxDpPVQBRvnyexpFgvr6thnM+qsFM/SXawGC24Snlkop
	BAlxbv5sxRJcOfBbSTOPE3I5IkN2mwUjqU7cMUagSLRmPbwbsde288GtVU5kgwWl8HpOMt
	guOm0DFxFFkYnqDc5YhclS3FSNnqn2mBeSvrLomnHRcn4bpZcLw3l6XGd3EqNTvCt/hEb/
	4ZXRIj0BaM9G+H8AA7kE358iZM8WoKe7Dyz9W4zW7/b2OscjuPZVdG6sXIfCIA==
Message-ID: <51ff107d-126d-4481-b94a-f614f31c7bb8@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760608080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dDU4MHtIXNjqAS9JJD27/CnM+BvS39aAL00HB1wKmUs=;
	b=iRCKiYjVaNQjr7ciL/76PHWjl/5d+opl6I8j9fSY+qFPEtSc5dnwYavGolev5MM93Ngcdu
	jI9veoq6Z/SRRV+gM+fLHysHUfIk4n6YOTzptX/Y5KOBvYVIGf9NxaiUXHF/VBNUqF8gta
	JygcaVjXZOjfL9Bz15/lXRRO2RvvdX8l2LnnxfYIjgc3KZJ6PtM5oWJKIAY3RpwBrlVJB7
	hELhC2z0tVptxe9FamxUsaGGnVtlkgWapRFm9F1p5+5PQGGCk+676DDTZJ4TEJKOh/H97j
	UhVs3Q/nD4Joq2xP7oZKdzJqq6GnWFwTGSgJupUhHQ04ka4rG1+CeIQwMtmcXQ==
Date: Thu, 16 Oct 2025 11:47:56 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <20251015153952.185249-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 6f731996ea0c40a0a5a
X-MBO-RS-META: oz5jm67tb1wz1eczi1ucb737inbcuyn3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_024809_588274_28FD1608 
X-CRM114-Status: UNSURE (   9.21  )
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

On 10/16/25 10:22 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
>> @@ -2575,6 +2575,22 @@ gic: interrupt-controller@f1010000 {
>>                          resets = <&cpg 408>;
>>                  };
>>
>> +               gpu: gpu@fd000000 {
>> +                       compatible = "renesas,r8a7796-gpu",
>> +                                    "img,img-gx6250",
>> +                                    "img,img-rogue";
>> +                       reg = <0 0xfd000000 0 0x40000>;
>> +                       interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks = <&cpg CPG_CORE R8A7796_CLK_ZG>,
>> +                                <&cpg CPG_CORE R8A7796_CLK_S2D1>,
>> +                                <&cpg CPG_MOD 112>;
>> +                       clock-names = "core", "mem", "sys";
>> +                       power-domains = <&sysc R8A7796_PD_3DG_A>,
>> +                                       <&sysc R8A7796_PD_3DG_B>;
>> +                       power-domain-names = "a", "b";
>> +                       resets = <&cpg 112>;
> 
> status = "disabled"; ?

The GPU is always present in the SoC, similar to IPMMU/GIC/DMA/VSP/... 
which are also never disabled, do we want to disable the GPU by default 
and enable per-board ?

I would argue the GPU should be enabled by default, so the GPU driver 
can do a proper power management of the GPU. If firmware is missing, at 
least power it off on failed probe, if nothing else.

[...]


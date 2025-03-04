Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C61AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 20:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H948FRDwgMsgmADI+OEoZ51nO5/psSifQe84iLy+MzA=; b=wdgBCPjswyQ5mmUPA9BMJva2Gw
	HA5PyOp8i5Y1lRu2/u2j/sZN7qJo/iZvJnMM3jH0DGg7ovRsng0tadKdv04TiMlZjPWOCPecrBPKb
	Sk2v35qmYoGI3JYVchD8sDiWGqAo5QAm3E7HmTN2HP/AXAbm+vKvalYhVEe8ByH6waXXtsWK7fWEz
	ht4KwMp+40vL6gWoOZYgdxRo2XPHEkWeLHHge8TdLnh0Thy2WR1uiWJPjklJH7v1C3DAGJGVrAMFI
	dUHhXrC6wibHogMdQf0qQ3GeGl2n4uo0Z+mMicgehJhXIlpxZJgv3XVvIfJ+38R4MqqgnejZC0Ui3
	2qptErTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZ8C-00000006DQx-1K42;
	Tue, 04 Mar 2025 20:44:48 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXAB-00000005sbE-3a1U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 18:38:45 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43bc63876f1so19229465e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 10:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741113522; x=1741718322; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H948FRDwgMsgmADI+OEoZ51nO5/psSifQe84iLy+MzA=;
        b=WYNjiHZ2DXTMRfXP/0tPUjoymwaxZPKYmC+4rQL3tmHAU2Y2eCvy7Ux2u9LA5SOlzG
         HHewhZH86I56RzqQ5U8qBGcIPifzITMql1LH6hfXw8t6ViDxV12j0kM/kF2hcJRtRA33
         qipq5aETCes30B6kYwUcqbHS75Vc47CHmQg4YPaq1isgkUrcr9mD7hjTfmoramdkuBoP
         iMbGpgHR8eopd7W0LdoVNECoZRoWOQA2BfYpUYXq8nttrmb1g90NeEa/EiD+MzlI8ZRJ
         qiBC7UuEwmyUeBwirWzBsD/hRFJqs6FsJdcI+WZ4BCtxtvQ1hcwrZWHvMtUuoW/nz0ui
         KxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741113522; x=1741718322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H948FRDwgMsgmADI+OEoZ51nO5/psSifQe84iLy+MzA=;
        b=Gk8ahBay3NvzZITMNa6FpqAnzSqz8GBZHDzy4R+q88yPwZOqHv0ufcdIhARzbLy3+x
         W/wT18SSd+SjwMwCQNze7YYiEYlKm20DMBJUOdW6C0w9hVPcCbC4SdTlqAYLQ6vgInP+
         4iPGZ8a75zkPCJF4pq/g404NzWczgZE6v4MotiDj/N/366raF3Y3qe75Qm908U9igHEw
         1ozYBhzWhXEbtKPb0OVQNEtYVi+bvfnx05Smt+J0TEevZk0Z5b7K01Gf2pkqdvtpsYcg
         dLtiFBg7pgmrd8tznkgY9XjmYMB12y8QBH356qyv3lltR4FQ87BTIu3N2zw9BdGhHp6o
         UJyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuYC2a1N9C3pW5OubduQ0K6ctRmBLCzGzDGGClpsVT+Hxr7x/X6t+vknnD1gxQQl/flSnptGdB5sve56aAE4GL@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4YCrmiyRE3hecWJppJ2IJ+8tk67G8hJXNvv8VgAX02ed6p8jp
	bWKlrDSRZEO17WHQLgd7c6Y3SXr9pqr/0RNOJo60Z3C1R07fW3JP
X-Gm-Gg: ASbGncuX16Rd/Yn/anLPgDEBR5o7/wwI6YeqDXKCrPN2Lb1NMp1uBi2oXEiNk75OqRC
	PVvt7F2jl5Jyk0yl/iiPRnTy/lFuPxZ7S+NpR/ADuJvigK41qRi5pSXoKS+A2iz94OKK6tC3SpS
	o2NPJFq+5oa7WEdmvJ5Zlfe76eEUATolwIiYcwkL/eL3gA8AblAYd3oWAjiyp+yhzshmK41yF9e
	MHY4VI3xF3M4Iq0qib3ova/50LgLkZYwVA1PCorBFZCX3s+J9jKdwQFts7NpruzN35Gw0lxWqIl
	vIfAgqLwpOOiBampUJKPGVn0n+Na6zHBAU+LoPUTskvkeQ1KCeVIs8nFOo91y91Ga7b0gfj1ZA=
	=
X-Google-Smtp-Source: AGHT+IG1166SxCE4sFCdzuiE0V7QxZDudPu8M9dvEeKEFshASL6QcVMXEy639K5WegyKjMIjEPWGqA==
X-Received: by 2002:a05:600c:1384:b0:439:8bc3:a698 with SMTP id 5b1f17b1804b1-43ba66e5e9bmr153210385e9.6.1741113521738;
        Tue, 04 Mar 2025 10:38:41 -0800 (PST)
Received: from [192.168.1.132] ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bbe676b41sm93370475e9.11.2025.03.04.10.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 10:38:40 -0800 (PST)
Message-ID: <31451d28-d179-49b7-81fb-0f8914cc9c1a@gmail.com>
Date: Tue, 4 Mar 2025 20:38:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: imx: add imx95 dts for sof
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
 <20250211225808.3050-4-laurentiumihalcea111@gmail.com>
 <Z6vcBvs4xGQ+pGCJ@lizhi-Precision-Tower-5810>
 <36ca7549-aee7-4f14-9311-77978a42362a@gmail.com>
 <Z7zNymSs5qeHp9wL@lizhi-Precision-Tower-5810>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z7zNymSs5qeHp9wL@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_103843_905625_E4879DC0 
X-CRM114-Status: GOOD (  20.87  )
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



On 2/24/2025 9:51 PM, Frank Li wrote:
> On Mon, Feb 24, 2025 at 09:17:03PM +0200, Mihalcea Laurentiu wrote:
>> On 12.02.2025 01:23, Frank Li wrote:
>>> On Tue, Feb 11, 2025 at 05:58:08PM -0500, Laurentiu Mihalcea wrote:
>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>
>>>> Add imx95 DTS for SOF usage.
>>>>
>>>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>> ---
>>>>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>>>>  .../dts/freescale/imx95-19x19-evk-sof.dts     | 85 +++++++++++++++++++
>>>>  2 files changed, 86 insertions(+)
>>>>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
>>>>
>>>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>>>> index 839432153cc7..27f64e333e4b 100644
>>>> --- a/arch/arm64/boot/dts/freescale/Makefile
>>>> +++ b/arch/arm64/boot/dts/freescale/Makefile
>>>> @@ -282,6 +282,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
>>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
>>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
>>>>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
>>>> +dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>>> look like should use dt overlay ?
>>
>> can you pls explain why you'd see this as an overlay?
> It is addtional option, which base on imx95-19x19-evk.dtb. Default wm8962
> is used for built-in dai, this provide option to move it dsp.
>
> Ideally this option should work for all boards, which use wm8962.
>
> We try to move MxN problem to M + N. otherwise, there are huge numbers of
> dtb files.
>
> Frank

Yeah but these are not cameras/sensors (for which there's a lot of possible combinations)
we're dealing with. Unless your board has the same codec, same GPIO for headphone
detection, and uses the same SAI instance this overlay will not work. For instance,
this wouldn't work for the imx95 15x15 EVK board as that uses a different GPIO for
headphone detection. As such, you'll most likely end up with a different DT overlay for
each board instead of a DTB.

Also, from the experience with the IMX8 series, we really don't have many DTBs. Usually,
it's been 1 for the base board and 1 for the audio board if applicable (which can probably
be turned into DT overlays. It would certainly make more sense this way).


Given all this, I'm still not convinced that DT overlays are the way to go.


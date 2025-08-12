Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5250CA0EE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 20:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTRGSr/sFqz08xTFK9XBf9uPAWALzcXmf8DmSzCh0us=; b=ZdNUxPIbfoS9n4h4QZEnmxcWOw
	HNPu8KZfmKUn3dQj+lOnzHn3fEN14EGmlPYbti3SEmDSG6WtJlWGJccoKJmzJ6UF3790wpzmnifPQ
	f5AAlGk6tTNcoBPqxvLoMJCiwSNVaHhyJE3N7ZVksUvNXnVoMiX5sGmi/tnmWrwgD3RhtnT80ahx0
	jr/vTg8ivV53h054PnQDneGmrBZy/1fsuih02aJNqGrG/8TazhyPz15U+MEYiu9ApHshf44AO99La
	fxlfnVkQlmRr5QTqOeM/AnAM1VNfDQf4ytk44dKjFI8IkQIg5IMkSzzxAMh9CoUp58Mfk1vnNUeHU
	0xhg3K0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvgY-0000000BwxL-2tlL;
	Tue, 12 Aug 2025 20:33:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultSv-0000000Bgiq-2smm
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 Aug 2025 18:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DTRGSr/sFqz08xTFK9XBf9uPAWALzcXmf8DmSzCh0us=; b=R+f9jiBh37xLYbUy3+HQR3RCwp
	DumMZn7cBmh2r5R5itkQTEIK1WjwMju46Ny9XTP5UdcO9TO3qmh/pbQz2/0+5BpZ0ie3uSsDpJHd+
	yS7KOq7G+dPf1w8VvJ59giAtYxG3O+RzLBQ60bFkcpBHoIBKf5Rn3hTcIqkgXh5UPUiB7sIy7rCUZ
	++euHqzxZcY3YFHSlL0s2PA8Okf43AzbVJ7I07BHb4Wn+DXJuT1Fd0THyL73KYBsT8BPcSM39pmkn
	ga0lKv5eYtoujY+pw2V5KMPgHjLmiD6PgWm3cLVPa7iK5sQC0QibI9yiAfH+hLYeV8MYwxnTNB8Zm
	II0XjfXw==;
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultSr-0000000Ft9v-0ePn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 18:11:16 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57CIAhtT1896346;
	Tue, 12 Aug 2025 13:10:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755022243;
	bh=DTRGSr/sFqz08xTFK9XBf9uPAWALzcXmf8DmSzCh0us=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=EBtlOOjj5xK3wwwMUOSHbhUYClQTKWCZlZlNuSgsm74hVSgN+8Qh0tM1Wx+mcmiE2
	 Qr7esoVUrjGZ22kSvHng8LlxowAAtE6h06JA3wfMoxui/8e3CvvKwV9+QYGzMdxV/Q
	 CYvOR1aR78/xQBLTVbetN7CLtUYbRT6bzmCh7mtQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57CIAhPi3655268
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 12 Aug 2025 13:10:43 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 12
 Aug 2025 13:10:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 12 Aug 2025 13:10:42 -0500
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57CIAZNH1066109;
	Tue, 12 Aug 2025 13:10:36 -0500
Message-ID: <02920114-b86b-47ad-945d-1905b9117518@ti.com>
Date: Tue, 12 Aug 2025 23:40:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/tidss: Fix sampling edge configuration
From: Swamil Jain <s-jain1@ti.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, devarsh <devarsht@ti.com>,
        "Jyri Sarha" <jyri.sarha@iki.fi>,
        Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sam
 Ravnborg <sam@ravnborg.org>,
        Benoit Parrot <bparrot@ti.com>, Lee Jones
	<lee@kernel.org>,
        Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>
CC: <thomas.petazzoni@bootlin.com>, Jyri Sarha <jsarha@ti.com>,
        Tomi Valkeinen
	<tomi.valkeinen@ti.com>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <stable@vger.kernel.org>
References: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
 <20250730-fix-edge-handling-v1-4-1bdfb3fe7922@bootlin.com>
 <71ef3203-e11d-4244-8d2d-8e47e8ba6140@ti.com>
 <f15779ad-788a-4dc6-b5a6-4187b9a9c986@ti.com>
 <e9df67f0-8fce-4fbf-8fff-c499c4a2efaf@bootlin.com>
 <86cf7d99-1295-42ab-acda-88a8212ec4d4@ti.com>
Content-Language: en-US
In-Reply-To: <86cf7d99-1295-42ab-acda-88a8212ec4d4@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_191113_611279_9F6B4754 
X-CRM114-Status: GOOD (  24.50  )
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



On 8/12/25 23:32, Swamil Jain wrote:
> 
> 
> On 8/11/25 15:26, Louis Chauvet wrote:
>>
>>
>> Le 08/08/2025 à 18:26, Swamil Jain a écrit :
>>>
>>>
>>> On 8/8/25 19:16, devarsh wrote:
>>>> Hi Louis,
>>>>
>>>> Thanks for the patch.
>>>>
>>>> On 30/07/25 22:32, Louis Chauvet wrote:
>>>>> As stated in the AM62x Technical Reference Manual (SPRUIV7B), the data
>>>>> sampling edge needs to be configured in two distinct registers: one 
>>>>> in the
>>>>> TIDSS IP and another in the memory-mapped control register modules.
>>>>
>>>> I don't think AM62x is thee only one which requires this and on the
>>>> contrary not all SoCs require this extra setting. We had been 
>>>> waiting on
>>>> confirmations from hardware team and very recently they gave a list of
>>>> SoCs which require this, as per that I think we need to limit this to
>>>> AM62x and AM62A per current supported SoCs.
>>>>
>>>> Swamil,
>>>> Please confirm on this and share if any additional details required 
>>>> here.
>>>>
>>>
>>> Yeah Devarsh, as you mentioned, this is valid for AM62X, AM62A and
>>> AM62P. We would have upstreamed this feature, but there are some
>>> corrections in Technical Reference Manual for these SoCs regarding
>>> programming CTRL_MMR_DPI_CLK_CTRL register fields, we are in loop with
>>> H/W team, waiting for their official confirmation regarding this issue.
>>>
>>> Thanks Louis for working on this patch, but we should wait for H/W
>>> team's confirmation.
>>
>> Hello all,
>>
>> Thanks for the feedback. I was not aware of this current work.
>> Do you plan to send the fix yourself? Should I wait your HW team 
>> feedback and send a v2?
>>
> Hi Louis, H/W team confirmed that, CTRL_MMR_DPI0_CLK_CTRL.bit[8] should 
> be programmed same as DSS_VP1_POL_FREQ.bit[14](IPC) and 
> CTRL_MMR_DPI0_CLK_CTRL.bit[9] should be programmed same as 
> DSS_VP1_POL_FREQ.bit[16](RF). Please continue with you patches.
> 
Please go ahead and send v2.
We are working with the documentation team to get the Technical 
Reference Manual updated in parallel.

Regards,
Swamil.

>> I also have a very similar patch ready for u-boot (depending on the 
>> same DT modifications), do you plan to fix u-boot too?
>>
> Please fix u-boot also.
> 
> Thanks and regards,
> Swamil.
> 
>> Thanks,
>> Louis Chauvet
>>
>>
>>> Regards,
>>> Swamil.
>>>
>>>> Regards
>>>> Devarsh
>>>>
>>>>    Since
>>>>> the latter is not within the same address range, a phandle to a syscon
>>>>> device is used to access the regmap.
>>>>>
>>>>> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone 
>>>>> platform Display SubSystem")
>>>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>>>>
>>>>> ---
>>>>>
>>>>> Cc: stable@vger.kernel.org
>>>>> ---
>>>>>    drivers/gpu/drm/tidss/tidss_dispc.c | 14 ++++++++++++++
>>>>>    1 file changed, 14 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c 
>>>>> b/drivers/gpu/drm/tidss/tidss_dispc.c
>>>>> index 
>>>>> c0277fa36425ee1f966dccecf2b69a2d01794899..65ca7629a2e75437023bf58f8a1bddc24db5e3da 100644
>>>>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>>>>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>>>>> @@ -498,6 +498,7 @@ struct dispc_device {
>>>>>        const struct dispc_features *feat;
>>>>>        struct clk *fclk;
>>>>> +    struct regmap *clk_ctrl;
>>>>>        bool is_enabled;
>>>>> @@ -1267,6 +1268,11 @@ void dispc_vp_enable(struct dispc_device 
>>>>> *dispc, u32 hw_videoport,
>>>>>                   FLD_VAL(mode->vdisplay - 1, 27, 16));
>>>>>        VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1, 0, 0);
>>>>> +
>>>>> +    if (dispc->clk_ctrl) {
>>>>> +        regmap_update_bits(dispc->clk_ctrl, 0, 0x100, ipc ? 0x100 
>>>>> : 0x000);
>>>>> +        regmap_update_bits(dispc->clk_ctrl, 0, 0x200, rf ? 0x200 : 
>>>>> 0x000);
>>>>> +    }
>>>>>    }
>>>>>    void dispc_vp_disable(struct dispc_device *dispc, u32 hw_videoport)
>>>>> @@ -3012,6 +3018,14 @@ int dispc_init(struct tidss_device *tidss)
>>>>>        dispc_init_errata(dispc);
>>>>> +    dispc->clk_ctrl = 
>>>>> syscon_regmap_lookup_by_phandle_optional(tidss->dev->of_node,
>>>>> +                                   "ti,clk-ctrl");
>>>>> +    if (IS_ERR(dispc->clk_ctrl)) {
>>>>> +        r = dev_err_probe(dispc->dev, PTR_ERR(dispc->clk_ctrl),
>>>>> +                  "DISPC: syscon_regmap_lookup_by_phandle 
>>>>> failed.\n");
>>>>> +        return r;
>>>>> +    }
>>>>> +
>>>>>        dispc->fourccs = devm_kcalloc(dev, 
>>>>> ARRAY_SIZE(dispc_color_formats),
>>>>>                          sizeof(*dispc->fourccs), GFP_KERNEL);
>>>>>        if (!dispc->fourccs)
>>>>>
>>>>
>>
> 


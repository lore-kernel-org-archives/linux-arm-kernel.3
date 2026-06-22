Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1378CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 02:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipKRVPzkC3/bLO3loiWzGU9J/nN5jU3SnxMn7jqpCwk=; b=zkbtTmf2RQlq++Twqn0IJPuxSz
	pAS+7VDKUNO3meScySihldoaF9/SlG+61rFJ9MuUQ+uQl0H04Hck1+q1nAcMWPmHtN47yEkGnrGeS
	JvXY80HSpGOvmUWtdeXNkVBuwxqa/XucFLbkNZcwh/PIBYQCItMlJN+NIC9UwRmOQCbDJfst32duH
	Z7KSfMyomhiJFXYA8Fpm4D80InAoMpyoMx6/NwzpDP55Ln2hbRDqiI0Ou5xeDR6qbCYzA5KVZbKTc
	EVdJcBj/pNqDZcYE2YBAwDSKoaq3K2wWQ0nWqK12O0eKPRoMeolKcHkM/z8WolW03YNowHvWcZHmZ
	uX+h6MVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbUQy-00000004JSc-0HhW;
	Mon, 22 Jun 2026 02:30:48 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbUQu-00000004JRg-3Heo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 02:30:46 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c6be9cd7afso15846255ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 19:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782095444; x=1782700244; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ipKRVPzkC3/bLO3loiWzGU9J/nN5jU3SnxMn7jqpCwk=;
        b=eFeiF9sPj2IAOng1Fs2rSpxrZ1G8GCLLOpb+nt7PNsVvstNXaa+cNGiVAmGDh2PZT/
         hiK+UGGtlhPJIK6xYxPGZf3/Yq0jAiV5K8AOu8dTmAaBHiexYRJt/aBLrIXMJL0W7I4v
         swQB1R9/MHyR3KSCbYzmtrQ/l2lTdzy0D2XDddFe4sEHJBeBKwHaVgife/60qy2FWZeL
         uKz5Y3ucJmJns0MS94T0Hmig+mC4f3tODC12dzl6ph1MwF5+QPr6nsek92Db1FdXrWea
         1vesDaQBXu1WcEHttsbS6AaAvpsnyliMrrqRGHPX+jGKkVe+O8gR5qG8frtCCzVQanqt
         7VKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782095444; x=1782700244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipKRVPzkC3/bLO3loiWzGU9J/nN5jU3SnxMn7jqpCwk=;
        b=bqrptY6H18NcvgXZooOTBXaYpejpkNLQah8CE2qILhNwyIKT8EukOYoBm55gnnXvHW
         nRdRMmKfRa0mqu8EqctWauJcwBeLLBnJ5JW+fNe11ZAWHKzIGKKdiPIGalHM+2mY86Xp
         9NzuUso2pKYAi0lf4crewxIzeiDvhVteXclc2wF6ZG9+fzfix/jkioxmidexA3T4Lq0G
         Opyo7+8VWG4ua1r578mK2vMFBqmVDqgtxJB8oxjf8kwltrzvWJaW/9gyKOFn8ek2TrNV
         x2TjAFnk36uX9Szax5YWE4B2bqUc/az9LanWXXC8DLi5wn5qq7oMFA7jkRal8IIGzid+
         Vfdg==
X-Forwarded-Encrypted: i=1; AHgh+RobdMXCr8X5wiNkT33CYiWQppRdcgrSBZFP+GFN9+PACu6Trp60Xd0xu2C8lZG7YO7qGIPa1syVznaWp8Xx4E1K@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy5scbwEn9P3PP+DN5kdfzzX/wXRKBzkpc1by3T1Gu8IFvshmx
	VIbsbjUXcrg1t+XRilDmewAPpbFutGNLPrbnFL7G+J6wQTaDLONi5/Fo
X-Gm-Gg: AfdE7cmEoJu7Tuj3+6bajlR+VSe+LGd8qApTDfj7KKWSvadrrczSuHpQaDuD4YCYio6
	fvLIuqMw1b5tGtZ+sIbXgYBDh+htpNZdfYKB0AHAwPqOtMChBB/iT6VXiJ7TOvkonASHYE6I5I0
	xnVnVrAMpaKryPg3uLjyoio0iU15uLHO9YkCrlaBufHwYznxPFidV6cBDlmdVDbxnDgUYRYbqsz
	0zVXYZPJx9bOx58pifbLVjdsF8FxFOXZ3tukOp9zQFaXeuvJmLOo1JOfrYqCII1oGCowcSDxdsO
	WTRhxNdusKiLYPvvcES4kZGOGjm7qLHy55bhHTLp6sY9i/bC4W97V3iKywptRMREqdw52XsVaVD
	at6sb5q+WxG24wIjCwMitpZOMC+FSq6hUX9GXN2MPAikzR12UxJQwJZUshM79dGFu0aTChBiQ3X
	Q9h65LNTFu/jKn3YY2YphWGxV85VvDRBT/l0DXYQ1YeUwfu1SKf0BptLp0oTEyD2JyOw==
X-Received: by 2002:a17:903:b47:b0:2c6:a487:f431 with SMTP id d9443c01a7336-2c718fe2eb1mr137529215ad.23.1782095443621;
        Sun, 21 Jun 2026 19:30:43 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c742fdd411sm64398555ad.0.2026.06.21.19.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 19:30:43 -0700 (PDT)
Message-ID: <6d6dd8d0-292a-43f6-a94a-dedebe22c582@gmail.com>
Date: Mon, 22 Jun 2026 10:30:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] drm/verisilicon: add DC8000 (DCUltraLite) display
 controller support
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20260615065003.76661-1-a0987203069@gmail.com>
 <20260615065003.76661-5-a0987203069@gmail.com>
 <d5df0e9df3a9a68aae982f2fce830a4b10468476.camel@iscas.ac.cn>
 <df7363be-0e3f-4459-be4a-43ffb0a5366c@gmail.com>
 <0bb460aefb97e44cc0890a7841b8d217349143de.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <0bb460aefb97e44cc0890a7841b8d217349143de.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_193045_593897_A432689F 
X-CRM114-Status: GOOD (  22.73  )
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


On 6/18/2026 6:33 PM, Icenowy Zheng wrote:
> (CC'ed clk maintainers for weird clock gate bit)
>
> 在 2026-06-17三的 18:35 +0800，Joey Lu写道：
>> On 6/15/2026 4:51 PM, Icenowy Zheng wrote:
>>> 在 2026-06-15一的 14:50 +0800，Joey Lu写道：
>>>> The Nuvoton MA35D1 SoC integrates a Verisilicon DCUltraLite
>>>> display
>>>> controller whose register layout differs from the DC8200 in
>>>> several
>>>> important ways:
>>>>
>>>> 1. No CONFIG_EX commit path: framebuffer updates use the enable
>>>> (bit
>>>> 0)
>>>>      and reset (bit 4) bits in FB_CONFIG instead of the DC8200
>>>> staging
>>>>      registers (FB_CONFIG_EX, FB_TOP_LEFT, FB_BOTTOM_RIGHT,
>>>>      FB_BLEND_CONFIG, PANEL_CONFIG_EX).
>>>>
>>>> 2. No PANEL_START register: panel output starts when
>>>>      PANEL_CONFIG.RUNNING is set; there is no multi-display sync
>>>> start
>>>>      register.
>>>>
>>>> 3. Different IRQ registers: DCUltraLite uses DISP_IRQ_STA
>>>> (0x147C) /
>>>>      DISP_IRQ_EN (0x1480) versus DC8200's TOP_IRQ_ACK (0x0010) /
>>>>      TOP_IRQ_EN (0x0014).
>>>>
>>>> 4. Per-frame commit cycle: DCUltraLite requires the VALID bit in
>>>>      FB_CONFIG to be set at the start of each atomic commit
>>>> (crtc_begin)
>>>>      and cleared after (crtc_flush).
>>>>
>>>> 5. Simpler clock topology: only 'core' (bus gate) and 'pix0'
>>>> (pixel
>>>>      divider) clocks; no axi or ahb clocks required.  Make axi_clk
>>>> and
>>>>      ahb_clk optional (devm_clk_get_optional_enabled) so DC8000
>>>> nodes
>>>>      without those clocks are handled gracefully.
>>>>
>>>> Add vs_dc8000.c implementing the vs_dc_funcs vtable for the above
>>>> differences.  The probe now selects vs_dc8000_funcs when the
>>>> identified
>>>> generation is VSDC_GEN_DC8000 (DCUltraLite reads model 0x0,
>>>> revision 0x5560, customer_id 0x305).
>>>>
>>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/verisilicon/Makefile    |  2 +-
>>>>    drivers/gpu/drm/verisilicon/vs_dc.c     |  9 ++-
>>>>    drivers/gpu/drm/verisilicon/vs_dc.h     |  1 +
>>>>    drivers/gpu/drm/verisilicon/vs_dc8000.c | 78
>>>> +++++++++++++++++++++++++
>>>>    4 files changed, 86 insertions(+), 4 deletions(-)
>>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8000.c
>>>>
>>>> diff --git a/drivers/gpu/drm/verisilicon/Makefile
>>>> b/drivers/gpu/drm/verisilicon/Makefile
>>>> index 9d4cd16452fa..d2fd8e4dff24 100644
>>>> --- a/drivers/gpu/drm/verisilicon/Makefile
>>>> +++ b/drivers/gpu/drm/verisilicon/Makefile
>>>> @@ -1,6 +1,6 @@
>>>>    # SPDX-License-Identifier: GPL-2.0-only
>>>>    
>>>> -verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
>>>> vs_drm.o vs_hwdb.o \
>>>> +verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
>>>> vs_dc8000.o vs_drm.o vs_hwdb.o \
>>>>    	vs_plane.o vs_primary_plane.o vs_cursor_plane.o
>>>>    
>>>>    obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c
>>>> b/drivers/gpu/drm/verisilicon/vs_dc.c
>>>> index 9729b693d360..9499fffbca58 100644
>>>> --- a/drivers/gpu/drm/verisilicon/vs_dc.c
>>>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.c
>>>> @@ -90,13 +90,13 @@ static int vs_dc_probe(struct platform_device
>>>> *pdev)
>>>>    		return PTR_ERR(dc->core_clk);
>>>>    	}
>>>>    
>>>> -	dc->axi_clk = devm_clk_get_enabled(dev, "axi");
>>>> +	dc->axi_clk = devm_clk_get_optional_enabled(dev, "axi");
>>>>    	if (IS_ERR(dc->axi_clk)) {
>>>>    		dev_err(dev, "can't get axi clock\n");
>>>>    		return PTR_ERR(dc->axi_clk);
>>>>    	}
>>>>    
>>>> -	dc->ahb_clk = devm_clk_get_enabled(dev, "ahb");
>>>> +	dc->ahb_clk = devm_clk_get_optional_enabled(dev, "ahb");
>>> Please make the clock change a separated patch for atomicity.
>>>
>>> BTW the MA35D1 manual's clock tree shows that DCUltra appears on
>>> AXI2
>>> ACLK, AHB_HCLK2, behind a mux of SYS-PLL/EPLL-DIV2 (which seems to
>>> be
>>> the core clock), and behind a divider (which seems to be the pixel
>>> clock).
>>>
>>> However it's weird that only one DCUltra Clock Enable Bit exists
>>> despite both bus clocks have "ICG" (I think it means "Integrated
>>> Clock
>>> Gating"). In addition the linux clk-ma35d1 driver assigns
>>> "dcu_gate" as
>>> a downstream of "dcu_mux", although the Figure 6.5-2 in the TRM
>>> shows
>>> no ICG after the "Display core CLK" mux.
>>>
>>> Is the two bus clocks controlled by a single gate bit, and is the
>>> bit
>>> also gating DC core clock?
>>>
>>> Thanks,
>>> Icenowy
>> I will split the axi/ahb optional-clock change into its own patch in
>> v5
>> for atomicity.
>> Regarding the MA35D1 clock tree: from the TRM, the single "dcu_gate"
>> bit
>> gates both bus clocks (AXI ACLK and AHB HCLK) together with the
>> display
>> core clock through the same ICG cell. The clk-ma35d1 driver exposes
>> only
>> "dcu_gate" (downstream of "dcu_mux") and does not provide separate
> Then it's one of the case that the clock tree doesn't properly
> represent the hardware, which is bad. However, as three gates share the
> same bit, I am not sure how to represent such kind of thing in the
> common clk framework.
>
>> axi/ahb clock entries. Therefore the MA35D1 DT binding will use only
>> two
>> clocks ("core" and "pix0"); making axi and ahb optional in the driver
>> is the correct approach, and this will be stated clearly in the
>>   split-out patch.
> I agree to make them optional, although these two clocks do exist in
> the hardware of MA35D1.
>
> Thanks,
> Icenowy
As mentioned in the DT binding reply, the absence of separate AXI/AHB 
clock entries for DCU in clk driver is due to the hardware design 
constraint of a single shared enable bit, not a driver oversight. In v5, 
the axi and ahb clock fetches in `vs_dc_probe` will be split into their 
own patch and made optional via `devm_clk_get_optional_enabled`, with a 
comment explaining that on MA35D1 the AXI and AHB bus clocks share the 
single `dcu_gate` enable bit and are therefore not separately exposed by 
the clock driver.
>>>>    	if (IS_ERR(dc->ahb_clk)) {
>>>>    		dev_err(dev, "can't get ahb clock\n");
>>>>    		return PTR_ERR(dc->ahb_clk);


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7AAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 13:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJMYNx5xh9JOrzEUO5t5CueFCzDt0HEwgJdTTyYg3Z8=; b=xPpYDJOI/A7cnw8dOfqyaP38tV
	a05mxaiN5G9SPeMAm96xHSJVdAX9yiK/BFCaDtQCR3tfFBl7ntte1HdmvanFPU6iBDa85Um4gMVcF
	U4RvXOQRfHRpmCp3oV3OCCjT2SNT8DHpRKla6aGciFRa60zBEf1YdvuL14Fvm2w1rdnzBHICGsguy
	Lt/OnYwIyL3tmk8uctklLNQ2bCbCjzBOgxGGJXIYphcTNXr1gdfVg2Gxw9IHiUGACfnIN+QyPcArY
	f+563q06KlDaYtz9lo7uHzXOJq+j3kPDfl+aKOPnnkOJe54p2ZufIF/J5uCddqNwwIKOJmk0UuIOy
	iBVxZyzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjfAd-00000001tis-3ORP;
	Sun, 16 Feb 2025 13:58:55 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjf9A-00000001tY0-1Nyz;
	Sun, 16 Feb 2025 13:57:25 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43690d4605dso21728005e9.0;
        Sun, 16 Feb 2025 05:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739714242; x=1740319042; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJMYNx5xh9JOrzEUO5t5CueFCzDt0HEwgJdTTyYg3Z8=;
        b=Yq1O2aDAQJaYmxAQtXSqHsBPiovlp9y4zJxlYCWA/RmgScIQAOC3uRnZ/nOe/gk+XN
         +MjBxSxC3GkNfzIPHbFdwctLfj1daUMLxqVIBvcVV4R1lJzoj6Z4bgC/Lc14LYzLN5uE
         y3+A76eRcH9O5ph/ZStsWjK3pm33xyo7MoAfuRSHtFhy+q1i6T8C3FzVw+PW/S/eQ9Dv
         2CzaSuGlgTmiakk+fHjjprYH20/G8M/WiWFirQUkuXRoG+NFLw/mu2ZXGOUqHSuTyn74
         LXycbtF/8E15J6y5xsF18qTMjpwnZsBVqcbgV9I4H2BcmIfKn79IKDpe4czoCZjiTmep
         cl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739714242; x=1740319042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJMYNx5xh9JOrzEUO5t5CueFCzDt0HEwgJdTTyYg3Z8=;
        b=jxdnF2CyMwfjIauyVKjWRO5PTAMcbhSZyj/vxe7XYH9nw+cDXSnxqYFmGNba3f7DBp
         FyXSwFoFjZfKlxNJ12x0YlMlrh3mLD2rXKzl/umDRD+3L58WBotF61BhNayZRuWjHN6d
         4TMbfstWR0+4BiFrZ/rCkUus0MRUKVNWGmL7LAojtNqIrEkr+7toZu6hmkQnp+FXLiSp
         Oyy2YHtXffEan18PT091PD7wwoxhsnB/9T+J0BWp5uGAvC7Xm4vs2yvx+vEsXu8KzNsx
         Jzsrke9tgFKaRYQXUhf7n8DynPV7g4oTqiiQX5KeYXGmz1P+VNptvOdgwSm/rQC0CjHD
         /w5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJKaBk8QbbxyI1wef/0slrDOtpy53+GsRTrJ+B9BzxPA5vkBqlg6pUrd0CM/oognjAiHt2SaeNeWg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/oY1WIgfSw2ryV1UxOFAPJ8q0cApXuqv9Yj7rHgZcrxjunJi7
	ndYV1Vh0xPtnXkhgyY+xDhO+i25jS1pZEHts/VcKl8J2dllWIXI8
X-Gm-Gg: ASbGncs/1vz7uk6A9ecVG/TifNCwqTlDRWUtoKsLKXeWHYWmU+qAw9AbpyzW3mWtQJJ
	9X97vUgjX+wuU9vupV74jLWZwdx9mDWgU8WtEHJlut4HL2GD4PPRNvO0/onmroDX8EoBf4crUhB
	yebi3kx01wYx2i9QZ79m7/6LeuPrsX1zLB+1aBfukLFxhgx/4cn1dj/Y6H9fEkf1jbO5Rx25NQA
	cpqUj7+v8EyRB7WmtqM78CbOp4SGe5chiigOlvUKcgcNK/VWfgd7J97i0LzGlDgVIWe52FpSkyf
	tomypAK4x8xfyoqIoaJr/Jb/jYiskfG3QWxEF8b6ybX1uh/KYeJeESsw7f0gaWmyE+zSkA==
X-Google-Smtp-Source: AGHT+IFH9P92DQEv+xDDvDm9W5ccn+THKcRoWXfgct7p20f+QmQCJMvkd68mMzwjnpUEl/jDGCrMHg==
X-Received: by 2002:a05:600c:4450:b0:434:a525:7257 with SMTP id 5b1f17b1804b1-4396e750cd8mr46356975e9.21.1739714241511;
        Sun, 16 Feb 2025 05:57:21 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm9959504f8f.94.2025.02.16.05.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 05:57:21 -0800 (PST)
Message-ID: <cc6fc19e-cdcb-42bb-ba68-555cb8a9cbf5@gmail.com>
Date: Sun, 16 Feb 2025 15:57:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] phy: samsung: add Exynos2200 SNPS eUSB2 driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215122409.162810-4-ivo.ivanov.ivanov1@gmail.com>
 <a10f8a77-9440-477d-b6f6-9d651e3ab49a@kernel.org>
 <537698af-841f-48e7-bd7c-4077d0a240a1@gmail.com>
 <9b58a985-3d63-42bb-9a76-e5b04a4b6012@kernel.org>
 <f3d38b63-dc97-482e-aeac-b59e65f91424@gmail.com>
 <065ea296-480c-4ac4-bb4a-0fc2915b59f1@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <065ea296-480c-4ac4-bb4a-0fc2915b59f1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_055724_387014_2BC2DB1B 
X-CRM114-Status: GOOD (  24.70  )
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

On 2/16/25 15:19, Krzysztof Kozlowski wrote:
> On 16/02/2025 10:51, Ivaylo Ivanov wrote:
>>>>>  You need to
>>>>> integrate the changes, not create duplicated driver.
>>>> I can do that, but it would be come a bit cluttered, won't it? Depends on
>>>> if we want to follow the current oem-provided initialization sequence, or
>>>> try and fully reuse what we have in there.
>>> I think it duplicates a lot, so it won't be clutter. We have many
>>> drivers having common code and per-variant ops.
>> So the approach to take here is to make a common driver?
> For example: one common module and two modules per each soc, because I
> assume some per-soc stuff might be needed. But maybe even these two
> modules are not necessary and everything could be in one driver.

The issue here is that, while both QCOM and SAMSUNG use that IP, a lot of
the registers are not mapped for Exynoses.

For example with QCOM:
``
#define USB_PHY_UTMI_CTRL0 (0x3c)
#define PHY_UTMI_CTRL5 (0x50)
``

Exynoses:
``
/* nothing before this */
#define EXYNOS2200_EUSB2_RST_CTRL 0x0
``

Here EXYNOS2200_EUSB2_RST_CTRL seems to be the same register as
QCOM_PHY_UTMI_CTRL5. Another instance is:
``
#define UTMI_PHY_CMN_CTRL0 (0x98)
#define TESTBURNIN BIT(6)
``

Exynoses:
``
#define EXYNOS2200_EUSB2_TESTSE (0x20)
#define EXYNOS2200_TEST_IDDQ BIT(6)
``

But at the same time there are some.. inconsistencies between them.
Looking at the register layout for the exynos implementation for TX tuning
the following register offset and bits are described:
``
/*
 * Offset : 0x0014
 * Description: tune register of tx driver
 */
typedef union {
  u32 data;
  struct {
   // bit[0] :
   unsigned fsls_slew_rate : 1;
   // bit[2:1] :
   unsigned fsls_vref_tune : 2;
   // bit[3] :
   unsigned fsls_vreg_bypass : 1;
   // bit[6:4]
   unsigned hs_vref_tune : 3;
   // bit [8:7]
   unsigned hs_xv : 2;
   // bit [11:9]
   unsigned preemp : 3;
   // bit [13:12]
   unsigned res : 2;
   // bit [15:14]
   unsigned rise : 2;
   // bit[31:16]
   unsigned RSVD31_16 : 16;
  } b;
} EUSBCON_REG_TXTUNE_o, *EUSBPHY_REG_TXTUNE_p;
``

And for QCOM the latter functionality is split into two separate register
offsets:
``
#define USB_PHY_CFG_CTRL_8 (0x78)
#define PHY_CFG_TX_FSLS_VREF_TUNE_MASK GENMASK(1, 0)
#define PHY_CFG_TX_FSLS_VREG_BYPASS BIT(2)
#define PHY_CFG_TX_HS_VREF_TUNE_MASK GENMASK(5, 3)
#define PHY_CFG_TX_HS_XV_TUNE_MASK GENMASK(7, 6)

#define USB_PHY_CFG_CTRL_9 (0x7c)
#define PHY_CFG_TX_PREEMP_TUNE_MASK GENMASK(2, 0)
#define PHY_CFG_TX_RES_TUNE_MASK GENMASK(4, 3)
#define PHY_CFG_TX_RISE_TUNE_MASK GENMASK(6, 5)
#define PHY_CFG_RCAL_BYPASS BIT(7)
``

So, Exynos2200 has a much simpler eusb initialization sequence than what
is present in mainline for QCOMs. I still don't really think the drivers
should be merged, as we aren't really duplicating code per-say.

I've already started working on merging them, and my current idea is to
not redefine the registers once again for 2200, but rather make an enum
that defines if the SoC is a QCOM or EXYNOS, and select the register
offsets dynamically - similarly as how I did with USIv1. If a register
offset is not present, it'd just not do the write. My guess is that this
will make it work with the qualcomm init sequence as well, so it'd result
in even less redundant code (apart from the eUSB tuning, which can be
omitted for now).

>
>> What about the current modelling scheme, as-in taking the phandle to
>> the usbcon phy and handling it?
> What about it? 

As I said in the commit description, I'm passing the USBCON phy as a
phandle to the eusb2 node and enabling/disabling it when needed. I'm
not 100% sure it would be adequate to include that in a common snps EUSB
driver, as it seems to more of a quirk with the exynoses. But then how
can I model it so that it's correctly described according to how the
hardware works (as-in usbcon "muxing" between child phys, in this case
eUSB and snps USBDP combophy)

Regarding repeaters, I still don't have the TI repeater implemented.

Best regards,
Ivaylo

> Did you look at the bindings of qcom snps eusb2? Are you
> saying you do not have here repeater? If so, then this phy phandle might
> not be correct.
>
>
>
> Best regards,
> Krzysztof



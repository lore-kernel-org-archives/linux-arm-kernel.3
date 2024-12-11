Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9628E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 19:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIB7OgclvuXmXcCb+7ry5WHS9m+ub2PzlVh4AHBJ290=; b=ec/Wn5sE6b+4DlrcN4XPEK/DI1
	et3C4jsZnG8krjgh0gJ+mxUEEq4M/aH73aS+rMwXG1N/FoECShYwQV0lv7rFs2Lnocix8thqBIo4H
	o0K5YRC74pOlZcNmn2XigFOMYyk/3G1XR3hwpC4MqrKB69Jr33/DMkvNsOIY1PDEcDYb1nfW9sCjl
	djflJ3J95M5eUK9Oa5TpPrXfOyCrddpGuOMTZJJzaglOqG/6k057vqeFhI1ZmlQ4vKFV3RzJbr93Y
	/Kmebh2cEq4auL8D7jZI20iGkm4rWFpXGCyUFU1eJu5IEAlNZKgknhzOlXPS+vf1PjZRzVy+Em6V6
	EwwcXAeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLSZq-0000000Fwnb-0kzK;
	Wed, 11 Dec 2024 19:40:54 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLSYl-0000000FwUt-0V7X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 19:39:48 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4675118f591so10072411cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 11:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1733945985; x=1734550785; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iIB7OgclvuXmXcCb+7ry5WHS9m+ub2PzlVh4AHBJ290=;
        b=P2u+LcVAb4vENgx+hj2a/Ifza9l5Scq6s1kcjpw6REqn99sP8gKfLLgPGM6w2n1nkB
         /w2X4yGJLtTtTN4W+LgIvPqD8AumQVxqPIIgPZLXcELXLIURcwjUhThCXbIfFG0ihLMm
         MPICeSMG74ilTiFahmZF4Lqz2AZT3BqrckhQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733945985; x=1734550785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIB7OgclvuXmXcCb+7ry5WHS9m+ub2PzlVh4AHBJ290=;
        b=AOy7CCh0y2zyiJ7HMEvsKwMQN2OwkLf/zHNTePbYigqE/VGco/BUCbob5g1ySJ5qNA
         tZj+5TRYWpvRr/9dIAKj2EGbcwOtXRkTWtIbc0tWCaTulF5hIJCDbxw8livWaMGcXulY
         XEa8Lld9zUctttVbN6JB5zcISibprT6YP6/A6G9sq1rMLbPn2vsIISB6nof4zJIODhvt
         557Wf94qWH+WXtEDJTRNF3eH+K4ivObHboK4+G+T+KF3tSQPqy5O+4+d7E9J1YoEasCY
         rEg1jspnAzCiCOieIJQLNuOyfQDUdmP1fM61Aes14NQurMo5jkzMy+PPoOfBj6hGLEtq
         6gLA==
X-Forwarded-Encrypted: i=1; AJvYcCU/joEegTQ9FH8xPy2b9QjlnfURFkp6eUWzcCt116uUnjh947LNeIo3HMqvmUaecBO6lfB6smzhuHNQLbdiP4QO@lists.infradead.org
X-Gm-Message-State: AOJu0YxmwnLbrVqiLKYvDtqca6peKm07BxpCXsc+gUkXhaqB58oyCwSv
	Rzdxm0ImODIyJnB0ZfyhoyBh9+Idd4tQ4y2lWdFkdpUDLdimamsyY5SuW5f73Q==
X-Gm-Gg: ASbGnctGsfvEBIizcRv146JVY9sGS5FeTB0CPqkKtU1SRx/kXzRy7mTpga5luA+su1X
	rLQVKCTL6hCy08RVEO8B7o/pStfrc0yLifHIKmU+ybXOwP3Gc171IDrGfYx3qgeaogJAQtUH+Ve
	b0iKydQAbtiMdq/hoUHM8IV7YgsgnbFjlfA7gRHcjT8dRTgqDpTo5XnSVrEwOK+TnkqEdT4KdDN
	Y+vm+/yKYTZS4SY2I5WCDMCg3rOP/Vofo8tScZk6xX2ik5dZPAF1vFPm4e2eRAoC873vFF6y4+U
	BtZ7VCEpGcwrwU4=
X-Google-Smtp-Source: AGHT+IE7tWa/E0nByPLL7S0B6qviBPi3v4T4dJLWOaG0p2vZl2++JiBW87VesGV7kVDu4s3AD+/ezQ==
X-Received: by 2002:a05:622a:1102:b0:467:6703:d469 with SMTP id d75a77b69052e-46796810483mr6964701cf.2.1733945985176;
        Wed, 11 Dec 2024 11:39:45 -0800 (PST)
Received: from [10.28.17.173] ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4672978dd2asm75448881cf.60.2024.12.11.11.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 11:39:44 -0800 (PST)
Message-ID: <474e5e38-37a4-439b-b25a-fe60df03f25b@broadcom.com>
Date: Wed, 11 Dec 2024 14:39:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 08/10] PCI: brcmstb: Adjust PHY PLL setup to use a
 54MHz input refclk
To: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>
References: <20241025124515.14066-1-svarbanov@suse.de>
 <20241025124515.14066-9-svarbanov@suse.de>
 <4bbdf9ed-f429-411b-8f5f-e51857f0f9d0@broadcom.com>
 <f9f49030-0518-4e30-91a7-3c088c31180b@suse.de>
Content-Language: en-US
From: James Quinlan <james.quinlan@broadcom.com>
Autocrypt: addr=james.quinlan@broadcom.com; keydata=
 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
In-Reply-To: <f9f49030-0518-4e30-91a7-3c088c31180b@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_113947_259266_EC528D4C 
X-CRM114-Status: GOOD (  21.61  )
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

On 12/10/24 08:42, Stanimir Varbanov wrote:
> Hi Jim
>
> On 12/10/24 12:52 AM, James Quinlan wrote:
>> On 10/25/24 08:45, Stanimir Varbanov wrote:
>>> The default input reference clock for the PHY PLL is 100Mhz, except for
>>> some devices where it is 54Mhz like bcm2712C1 and bcm2712D0.
>>>
>>> To implement this adjustments introduce a new .post_setup op in
>>> pcie_cfg_data and call it at the end of brcm_pcie_setup function.
>>>
>>> The bcm2712 .post_setup callback implements the required MDIO writes that
>>> switch the PLL refclk and also change PHY PM clock period.
>>>
>>> Without this RPi5 PCIex1 is unable to enumerate endpoint devices on
>>> the expansion connector.
>>>
>>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
>>> ---
>>> v3 -> v4:
>>>    - Improved patch description (Florian)
>>>
>>>    drivers/pci/controller/pcie-brcmstb.c | 42 +++++++++++++++++++++++++++
>>>    1 file changed, 42 insertions(+)
>>>
>>> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/
>>> controller/pcie-brcmstb.c
>>> index d970a76aa9ef..2571dcc14560 100644
>>> --- a/drivers/pci/controller/pcie-brcmstb.c
>>> +++ b/drivers/pci/controller/pcie-brcmstb.c
>>> @@ -55,6 +55,10 @@
>>>    #define PCIE_RC_DL_MDIO_WR_DATA                0x1104
>>>    #define PCIE_RC_DL_MDIO_RD_DATA                0x1108
>>>    +#define PCIE_RC_PL_PHY_CTL_15                0x184c
>>> +#define  PCIE_RC_PL_PHY_CTL_15_DIS_PLL_PD_MASK        0x400000
>>> +#define  PCIE_RC_PL_PHY_CTL_15_PM_CLK_PERIOD_MASK    0xff
>>> +
>>>    #define PCIE_MISC_MISC_CTRL                0x4008
>>>    #define  PCIE_MISC_MISC_CTRL_PCIE_RCB_64B_MODE_MASK    0x80
>>>    #define  PCIE_MISC_MISC_CTRL_PCIE_RCB_MPS_MODE_MASK    0x400
>>> @@ -251,6 +255,7 @@ struct pcie_cfg_data {
>>>        u8 num_inbound_wins;
>>>        int (*perst_set)(struct brcm_pcie *pcie, u32 val);
>>>        int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
>>> +    int (*post_setup)(struct brcm_pcie *pcie);
>>>    };
>>>      struct subdev_regulators {
>>> @@ -826,6 +831,36 @@ static int brcm_pcie_perst_set_generic(struct
>>> brcm_pcie *pcie, u32 val)
>>>        return 0;
>>>    }
>>>    +static int brcm_pcie_post_setup_bcm2712(struct brcm_pcie *pcie)
>>> +{
>>> +    const u16 data[] = { 0x50b9, 0xbda1, 0x0094, 0x97b4, 0x5030,
>>> 0x5030, 0x0007 };
>>> +    const u8 regs[] = { 0x16, 0x17, 0x18, 0x19, 0x1b, 0x1c, 0x1e };
>>> +    int ret, i;
>>> +    u32 tmp;
>>> +
>>> +    /* Allow a 54MHz (xosc) refclk source */
>>> +    ret = brcm_pcie_mdio_write(pcie->base, MDIO_PORT0,
>>> SET_ADDR_OFFSET, 0x1600);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(regs); i++) {
>>> +        ret = brcm_pcie_mdio_write(pcie->base, MDIO_PORT0, regs[i],
>>> data[i]);
>>> +        if (ret < 0)
>>> +            return ret;
>>> +    }
>>> +
>>> +    usleep_range(100, 200);
>>> +
>>> +    /* Fix for L1SS errata */
>>> +    tmp = readl(pcie->base + PCIE_RC_PL_PHY_CTL_15);
>>> +    tmp &= ~PCIE_RC_PL_PHY_CTL_15_PM_CLK_PERIOD_MASK;
>>> +    /* PM clock period is 18.52ns (round down) */
>>> +    tmp |= 0x12;
>>> +    writel(tmp, pcie->base + PCIE_RC_PL_PHY_CTL_15);
>> Hi Stan,
>>
>> Can you please say more about where this errata came from?  I asked the
>> 7712 PCIe HW folks and they said that there best guess was that it was a
>> old workaround for a particular Broadcom Wifi endpoint.  Do you know its
>> origin?
> Unfortunately, I don't know the details. See the comments on previous
> series version [1]. My observation shows that MDIO writes are
> implemented in RPi platform firmware only for pcie2 (where RP1 south
> bridge is connected) but not for pcie1 expansion connector.

Well, I think my concern is more about the comment "Fix for L1SS errata" 
rather than the code.  If this is a bonafide errata it should have an 
identifier and some documentation somewhere. Declaring it to be an 
unknown errata provides little info.

Code-wise, you could use u32p_replace_bits(..., PM_CLK_PERIOD_MASK) to 
do the field value insertion.

All the above being said, I have no objection since this code is 
specific to the RPi platform.

Jim Quinlan  Broadcom STB/CM

>
> ~Stan
>
> [1] https://www.spinics.net/lists/linux-pci/msg160842.html
>



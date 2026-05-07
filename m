Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA4BCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 12:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhz8KoocXZc3ctaarL47fHWQ++aFEBdyNLqthbCRIEs=; b=wNICraJ6HYSJH7U/0TpHcEy/NV
	9MQj3Ppv5yANVIiw/JEGs/B3ERPWTDtb2tHdij5LIWCnOrktorIIzXjzAGCQSZvE0xkP4VmzQjcZ/
	r5xmirmW+kgkcaTUjKXpbkw5xcVqgBPJpA7BT0dTyWjQjoDR5wq8l8hsn0zUYxcQnbMj4EqSEugI1
	vjcP1a7yOEfkitpHdrTFuSAXro+s8D2QvL4jsFTqr6MFMpeTcBqkSFLfG5F9XdDOb6wpZzp3nk6tS
	TNwt/7Sn7AYT2nBXVyT5qXSNHdANbXN1KDIW0uN7jK+1xr5T01JRYJwM/Lu2T+NxBImO8YtxkCmXX
	FMPkXJEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxiy-00000003lTs-3XWP;
	Thu, 07 May 2026 12:21:04 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxiw-00000003lTP-2BUM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 12:21:04 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8dbbc6c16b2so103388385a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 05:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778156461; x=1778761261; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jhz8KoocXZc3ctaarL47fHWQ++aFEBdyNLqthbCRIEs=;
        b=h/V33+cYxwqRKPLP0Cigumqdp/qg48YQI+I3Z1bRDT4/JHuhg2H5oqTc4HGtXSatxf
         jKq1ZMKcXuIutJewYzQXSy/HLDVCL5tCzKP++HSqnLU1uH9pPUl2F3RN/BywghUYQ53Y
         h+MCRmlznNdu6UIg2pGtLptT/8oY6XYt6AQXlzg9YdIS+tnmE+iojQAKZCyefHGPz48/
         B54vDZTW/M3AOKsb67fOhuJPaupB+/ZhXTw0m/A647nBg9+E8hWIlQ5Wv9ypx2W5NQLK
         tho4UNumHH6M5rcLQFi6c6kmNfv/2LH+Ug+KxqF9JUfSd8KZoXHDbYwdx+mGpW6f04oP
         kj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778156461; x=1778761261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhz8KoocXZc3ctaarL47fHWQ++aFEBdyNLqthbCRIEs=;
        b=VRVcwMtY+lbxPWbL/cG5cy4JGNDS/eoyhSiyCJDzrRyvfxsxeBWLPJ1oJ7JzJHWzlj
         jC3hxk+xOkZuuZYsgmvMF+2dO5YAIc8GIdnI0adMlm8KPTRodc3Ow10bZ/Q7uVrG9QHr
         82RyyfYI7ow+dJAOQaRq59bKzjanv6jStlhGyBjy41EdfJO6u3aglj/fiinPbHTFfUcR
         aN+Fsz7qxIZ20AH3IWeE2Fx239y5VLOlsxg6/jSv3DifaPW9ABzjvNDnzHmkcqOoOX3+
         dYPQxw3wUMxt4reQkzutb+kO0bUSZfPCOnKYgMrnNFyURt1t4Yh/Sy9N7WSXFqaidCJ+
         E2HA==
X-Forwarded-Encrypted: i=1; AFNElJ/KhfK5GShwafso4CGdiMCEWaivLJKoH+7t8MNLRI0gzmQbFaAYZ8U3Kv6xYIeFlcqK+awE8GzcMtWKJ0WuMyA5@lists.infradead.org
X-Gm-Message-State: AOJu0YyLbIMGtnK8JzoKa0TSYL8jfPRvPRcieVOVGGKenpnUhh2K+CL8
	mnIs1BlE2vKMFh6SicOLJa3CrzNqrRClzMG0Wvnr4kUuaXqSkzYGXsl60GTGwaIhNxo=
X-Gm-Gg: AeBDiesrd+TCe0URPvuKlZ3SL865YjcFRkWRU0IJcC2u0l4mVNMBE19mOkEMZQGbQGQ
	EzYCV+h9/qcNClNzwh8wfWu45nRhKM5G6VlDfsVIIjzXN+2rKoUdqdswx5tuWqqLwhliul1oV1Z
	SoGRTrD3/D1TITvOEkwRWhBVndUqrGrtF5BLwY/mD9R3eud3YgcdPslcFV33ZFln12P/lmpOMLC
	V49qz4TPN2hnAkURqOVpFXF66uQWB36HJCSB6G2QPFjb3rgVRggvHfpZOtuRLrRbbpHPJLF/SDF
	n3oEHMtrDh7hVmlreRG/mSpWvM1yX1c8ALvavdJ7WHnTNZo5fFYymlINH//IFhPbbzxGF5ORisc
	8n2pMzVPAwCuf6MrhSS5LyGbcIA48j3UJAodqg0hcft0Kf3dOUM4MN000H8gHk9PH5nHebA4a8y
	PVw4Ac4pGXr2uy+BieHfRcpOwDUjeSojxVn+zGL269k9vXrx29gXEriTjZcAwiw1Gwo+hqcjp99
	A==
X-Received: by 2002:a05:620a:469f:b0:8cf:dd93:aca5 with SMTP id af79cd13be357-90652c64f39mr328497885a.34.1778156461028;
        Thu, 07 May 2026 05:21:01 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c1dc62csm226235066d6.23.2026.05.07.05.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:21:00 -0700 (PDT)
Message-ID: <cb788638-7cb0-469e-9c38-13452103f7c4@riscstar.com>
Date: Thu, 7 May 2026 07:20:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
To: Linus Walleij <linusw@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, brgl@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, daniel@riscstar.com, wens@kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <CAD++jLkm4qn9hxQ9HjjnTWjvAiS+A+x1ATy7wamnm_YSP_qPEg@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAD++jLkm4qn9hxQ9HjjnTWjvAiS+A+x1ATy7wamnm_YSP_qPEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_052102_682270_2087D650 
X-CRM114-Status: GOOD (  28.96  )
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

On 5/7/26 7:15 AM, Linus Walleij wrote:
> Hi Alex,
> 
> thanks for your patch!

Thank you for your excellent feedback.  I will plan to use
regmap-gpio (already suggested strongly by Andrew Lunn) and
that will be included in the next version of the series.
Once I've done this and tried your other patch I'll provide
a Tested-by for it.

					-Alex


> 
> On Fri, May 1, 2026 at 5:55 PM Alex Elder <elder@riscstar.com> wrote:
> 
>> Toshiba TC956x is an Ethernet-AVB/TSN bridge and is essentially
>> a small and highly-specialized SoC.  TC956x includes a GPIO block that
>> can be accessed, alongside several other peripherals, via two PCIe
>> endpoint functions.  The PCIe function driver creates an auxiliary
>> device for the GPIO block, and that device gets bound to this auxiliary
>> device driver.
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
> (...)
> 
>> +config GPIO_TC956X
>> +       tristate "Toshiba TC956X GPIO support"
>> +       depends on TOSHIBA_TC956X_PCI
>> +       default m if TOSHIBA_TC956X_PCI
> 
> I think this driver can
> 
> select GPIO_REGMAP
> 
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/dev_printk.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
> 
> #include <linux/gpio/regmap.h>
> 
>> +#define TC956X_GPIO_COUNT      37      /* Number of GPIOs (20-21 reserved) */
> 
> I would just do 64 and flag > 37 as invalid.
> 
>> +/*
>> + * struct tc956x_gpio - Information related to the embedded GPIO controller
>> + * @chip:              GPIO chip structure
>> + * @regmap:            MMIO register map for SFR GPIO region access
>> + * @input_only:                Bitmap indicating which GPIOs are input-only
>> + */
>> +struct tc956x_gpio {
>> +       struct gpio_chip chip;
>> +       struct regmap *regmap;
>> +       DECLARE_BITMAP(input_only, TC956X_GPIO_COUNT);
> 
>> +static int tc956x_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
>> +static int tc956x_gpio_direction_input(struct gpio_chip *gc,
>> +                                      unsigned int offset)
>> +static int tc956x_gpio_direction_output(struct gpio_chip *gc,
>> +                                       unsigned int offset, int value)
>> +static int tc956x_gpio_get(struct gpio_chip *gc, unsigned int offset)
>> +static int tc956x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
> 
> REGMAP_GPIO can handle all of this for you with the right
> parameterization, study the drivers using this already such as
> those that appear when you type
> git grep 'gpio\/regmap\.h'
> 
> 
>> +static int tc956x_gpio_init_valid_mask(struct gpio_chip *gc,
>> +                                      unsigned long *valid_mask,
>> +                                      unsigned int ngpios)
>> +{
>> +       /*
>> +        * GPIOs 2 and 3 are used by the PCI power control driver, and
>> +        * we don't allow them to be used.  GPIOs 20 and 21 are reserved
>> +        * (and not usable).
>> +        */
>> +       bitmap_fill(valid_mask, ngpios);
>> +       bitmap_clear(valid_mask, 2, 2);
>> +       bitmap_clear(valid_mask, 20, 2);
>> +
>> +       return 0;
>> +}
> 
> That's good use of this facility.
> 
> I would say the chip has 64 lines and just
> bitmap_clear(valid_mask, 37, 64 - 37);
> but that's your pick. This probably works too.
> 
>> +       /* Mark GPIOs 22, 23, 24, 27, 28, 31, and 34 as input only */
>> +       bitmap_set(gpio->input_only, 22, 3);
>> +       bitmap_set(gpio->input_only, 27, 2);
>> +       set_bit(31, gpio->input_only);
>> +       set_bit(34, gpio->input_only);
> 
> regmap-gpio can't currently handle selective input-only or
> output-only lines, but we can
> very easily make it.
> 
> So I sent a patch for that (now in your inbox).
> 
> Check if this fixed_direction_sparse bitmap will do the trick
> for you and provide Tested-by if it does, thanks!
> 
> Yours,
> Linus Walleij



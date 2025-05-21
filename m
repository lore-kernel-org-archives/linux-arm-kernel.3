Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A261C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHCrVLLAGlouvcMb1tlHih+m6bTWke9YqMBcp1oO9Vk=; b=ukEEVGgZZqROcbfnt+crMbanf5
	jBwHZW6ncSiQbwYyB3LTce8Ri9kIXywBpQTemqoW71lCWlN89r0ndmuVuGQEyAiNuQhjn/U1v6Ri1
	JPQZE/0OE+IoMEPS+ewQPIOiJXY5U5l3jKNK2FBKHUADY8941AuGS0DFY6hwBdtkL0RGoeA2VXziy
	+FlizxYJcIgT0oTHKNoKBDgnp0P7UJmEAKdcn7ynhdd/1hcqTfL9OxC5DQ4ZpPcKbw102hsex5LY2
	q/1keSRcpLu/vZkjEN8kdPOqnAkpvrsAEoxfWiQG7/EY0NHqHLpkn5i+3VGILpRbP+R4rMbqqa7Oy
	7BXXHzCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHghq-0000000FSrd-08vz;
	Wed, 21 May 2025 10:29:50 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHg83-0000000FNBw-0wJV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 09:52:52 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L8WjP4012800;
	Wed, 21 May 2025 11:52:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	OHCrVLLAGlouvcMb1tlHih+m6bTWke9YqMBcp1oO9Vk=; b=BkFXkMX3H7zyFr2c
	MHSey3reiprVN7T5LDv3bR145OYKa3jLTzqo6ZvVVG0MOCQfX9xz9Truk0PRXnIZ
	PVpBQFkKBA5SdRd1GRC0esDMHsHJaY+5divF1lcfn5u31ygADHmFlwQf9a7QljDt
	8PAWIi5OHHuMTewIp/LFRr8vsGKSu+f5gxeyY3WypE6sjvKRgC3d8t2fV24hz1Om
	h2rKVlpD81IjyL5pgJoTiQsK44nA2S9BBIN0Pxv1X7yljLUSerjndCAxcMPcD9F+
	e7+RDbpF++ZyEl8es1kMy9w6TFj7GsI7UKhT/Jv7pValL+DykGrCRuO++OGn27SE
	Dz5Igw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfabc0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 11:52:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EA0E74004B;
	Wed, 21 May 2025 11:51:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 486ECAA8652;
	Wed, 21 May 2025 11:49:49 +0200 (CEST)
Received: from [10.48.81.67] (10.48.81.67) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 11:49:48 +0200
Message-ID: <94795d0c-0c73-41eb-ada6-9a01b2ac5892@foss.st.com>
Date: Wed, 21 May 2025 11:49:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] pinctrl: stm32: Introduce HDP driver
To: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
 <20250520-hdp-upstream-v2-2-53f6b8b5ffc8@foss.st.com>
 <CACRpkdZp6D-duzyVRLv5+PURb3Nu69njJx_33D-2aYS4DjmsoQ@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CACRpkdZp6D-duzyVRLv5+PURb3Nu69njJx_33D-2aYS4DjmsoQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.81.67]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_03,2025-05-20_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_025251_548381_D1A2695F 
X-CRM114-Status: GOOD (  22.65  )
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

On 5/21/25 00:34, Linus Walleij wrote:
> Hi Clément,
> 
> thanks for your patch!
> 
> On Tue, May 20, 2025 at 5:04 PM Clément Le Goffic
> <clement.legoffic@foss.st.com> wrote:
> 
>> This patch introduce the driver for the Hardware Debug Port available on
>> STM32MP platforms. The HDP allows the observation of internal SoC
>> signals by using multiplexers. Each HDP port can provide up to 16
>> internal signals (one of them can be software controlled as a GPO).
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> 
> (...)
>> +static int stm32_hdp_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
>> +{
>> +       return GPIO_LINE_DIRECTION_OUT;
>> +}
> 
> That's reasonable.
> 
>> +static int stm32_hdp_gpio_get(struct gpio_chip *gc, unsigned int offset)
>> +{
>> +       struct stm32_hdp *hdp = gpiochip_get_data(gc);
>> +
>> +       if (((hdp->mux_conf & HDP_MUX_MASK(offset))) == HDP_MUX_GPOVAL(offset))
>> +               return !!(readl_relaxed(hdp->base + HDP_GPOVAL) & BIT(offset));
>> +       else
>> +               return !!(readl_relaxed(hdp->base + HDP_VAL) & BIT(offset));
>> +}
> 
> ...but you still make it possible to read the value of the line
> if it's not muxed as GPO?
> 
> Should it not stm32_hdp_gpio_get_direction() return
> GPIO_LINE_DIRECTION_IN if HDP_MUX_MASK(offset))) != HDP_MUX_GPOVAL(offset)?

Hi, oops, you're right !

> 
>> +static void stm32_hdp_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
>> +{
>> +       struct stm32_hdp *hdp = gpiochip_get_data(gc);
>> +
>> +       if (value)
>> +               writel_relaxed(BIT(offset), hdp->base + HDP_GPOSET);
>> +       else
>> +               writel_relaxed(BIT(offset), hdp->base + HDP_GPOCLR);
>> +}
> 
> Can't you just use GPIO_GENERIC for this?
> 
> bgpio_init(gc, dev, ARRAY_SIZE(stm32_hdp_pins), // == 8
>      hdp->base + HDP_VAL,
>      hdp->base + HDP_GPOSET,
>      hdp->base + HDP_GPOCLR,
>      NULL,
>      NULL,
>      0);
> 
> The default behaviour of GPIO MMIO is to read the output register
> for the value if the line is in output mode.
> 
> You may wanna override the .get_direction() callback after bgpio_init()
> and before registering the chip, either with what you have or what
> I described above.

I didn't know about it, I'll take a look and provide a V3.

Thank you,

Clément

> Yours,
> Linus Walleij



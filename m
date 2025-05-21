Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0ABC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzFSpe7hA7gsH1lLUxy+lsRSjB0E3F7awJ9YqjsAY4c=; b=0d9F3+iLLbLFjoMQ75FWkltmX0
	mes4sI6jhKTchnRVJ51Jd/+tTtqHvfvM2Fk6NntTw1BRfSC2Aly0+Fj7fWBFc3G0TGQGCKcg3x8yt
	Ag9KPTiL4suwaQF2Eof0040pLYofjDZXC5niV4JEObsYQkt52v3BWV2CiBWLI8nwpL38TKllK0myY
	xP6iCT5nsDzUqO8dxjUcyCJL3+m+IcG+kjDqvYrG/PwAkfxx1CDylC2VySSQ/da+KjP3zFHuqeic/
	TbOoVpAUDiv62Mfw0/chCqAStlWvTsy7Ic4z6e+nZEVBGHwhSYwxE2FPvsxRzj6mKV+Cnpr9AIrQr
	3AKx987Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgiD-0000000FTYP-40nt;
	Wed, 21 May 2025 10:30:13 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgUh-0000000FQYs-27t7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 10:16:16 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9l708029646;
	Wed, 21 May 2025 12:16:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	mzFSpe7hA7gsH1lLUxy+lsRSjB0E3F7awJ9YqjsAY4c=; b=L9Lrz04iPTNTANgU
	AKn3QsTq5dcgGz47H847d41uhxzoY61n5IoRI0nrz4Co/AAerPLM1nXJl+Gka6Mc
	xpuoprRQrzPLxjwWcHd9ywcv89aIa8MmPt+Uy52O5UtBbHAlI3XGZRunVv4vpF5T
	zoLxA2NfNvHX6g/Qp+eIgppFFmFngRtaNv7H2b5BG3ao/A0ir6Ne6QOhq1UU4MwP
	dMw0y5vMCCR+2d5Cce7ik92e1mbry3KRzGFu/EMaQIJG+1Tj1ohirKJRub5LVpxF
	K19jwKBV9gMhfIVdLueGckH8Dmzc9uU7fB4TW8smZAsFyOZNmin++aI5/zBp2a03
	Ni/JnA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwff3fgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 12:16:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B70F940045;
	Wed, 21 May 2025 12:14:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14265BAEB1E;
	Wed, 21 May 2025 12:14:10 +0200 (CEST)
Received: from [10.48.81.67] (10.48.81.67) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 12:14:09 +0200
Message-ID: <929f6f1f-d47f-4954-8c8b-91c932127975@foss.st.com>
Date: Wed, 21 May 2025 12:14:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] pinctrl: stm32: Introduce HDP driver
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
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
 <94795d0c-0c73-41eb-ada6-9a01b2ac5892@foss.st.com>
Content-Language: en-US
In-Reply-To: <94795d0c-0c73-41eb-ada6-9a01b2ac5892@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.81.67]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_03,2025-05-20_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_031615_833177_AE46D839 
X-CRM114-Status: GOOD (  20.63  )
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

On 5/21/25 11:49, Clement LE GOFFIC wrote:
> On 5/21/25 00:34, Linus Walleij wrote:
>> Hi Clément,
>>
>> thanks for your patch!
>>
>> On Tue, May 20, 2025 at 5:04 PM Clément Le Goffic
>> <clement.legoffic@foss.st.com> wrote:
>>
>>> This patch introduce the driver for the Hardware Debug Port available on
>>> STM32MP platforms. The HDP allows the observation of internal SoC
>>> signals by using multiplexers. Each HDP port can provide up to 16
>>> internal signals (one of them can be software controlled as a GPO).
>>>
>>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>>
>> (...)
>>> +static int stm32_hdp_gpio_get_direction(struct gpio_chip *gc, 
>>> unsigned int offset)
>>> +{
>>> +       return GPIO_LINE_DIRECTION_OUT;
>>> +}
>>
>> That's reasonable.
>>
>>> +static int stm32_hdp_gpio_get(struct gpio_chip *gc, unsigned int 
>>> offset)
>>> +{
>>> +       struct stm32_hdp *hdp = gpiochip_get_data(gc);
>>> +
>>> +       if (((hdp->mux_conf & HDP_MUX_MASK(offset))) == 
>>> HDP_MUX_GPOVAL(offset))
>>> +               return !!(readl_relaxed(hdp->base + HDP_GPOVAL) & 
>>> BIT(offset));
>>> +       else
>>> +               return !!(readl_relaxed(hdp->base + HDP_VAL) & 
>>> BIT(offset));
>>> +}
>>
>> ...but you still make it possible to read the value of the line
>> if it's not muxed as GPO?
>>
>> Should it not stm32_hdp_gpio_get_direction() return
>> GPIO_LINE_DIRECTION_IN if HDP_MUX_MASK(offset))) != 
>> HDP_MUX_GPOVAL(offset)?
> 
> Hi, oops, you're right !

I've answer too quickly. All the pins are "out" in fact.
The hardware is not able to read input signal.
I wanted to implement a way to read the register value in any case by 
leaving the line direction unchanged.

>>
>>> +static void stm32_hdp_gpio_set(struct gpio_chip *gc, unsigned int 
>>> offset, int value)
>>> +{
>>> +       struct stm32_hdp *hdp = gpiochip_get_data(gc);
>>> +
>>> +       if (value)
>>> +               writel_relaxed(BIT(offset), hdp->base + HDP_GPOSET);
>>> +       else
>>> +               writel_relaxed(BIT(offset), hdp->base + HDP_GPOCLR);
>>> +}
>>
>> Can't you just use GPIO_GENERIC for this?
>>
>> bgpio_init(gc, dev, ARRAY_SIZE(stm32_hdp_pins), // == 8
>>      hdp->base + HDP_VAL,
>>      hdp->base + HDP_GPOSET,
>>      hdp->base + HDP_GPOCLR,
>>      NULL,
>>      NULL,
>>      0);
>>
>> The default behaviour of GPIO MMIO is to read the output register
>> for the value if the line is in output mode.
>>
>> You may wanna override the .get_direction() callback after bgpio_init()
>> and before registering the chip, either with what you have or what
>> I described above.
> 
> I didn't know about it, I'll take a look and provide a V3.
> 
> Thank you,
> 
> Clément
> 
>> Yours,
>> Linus Walleij
> 



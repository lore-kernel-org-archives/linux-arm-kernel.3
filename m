Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AF7CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 19:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MADp8JCGJDJpbQCdc3g1O92CBRZChcx+mPxGU0zSLXM=; b=oyUFq+GFY5nnx/GSRlJUwgLFbq
	iVt4adKnE5CH2IxXaPgvRHawufWFIAljI2VwzYEYZYCXJ5b5X7SD+8npzeqa8zqDf1rmGyaZsG6Q8
	7n9d6XcZVy+o8O2hJB40GkiufH3R2MICLi6ZcXS9G6BZ8UpiwOVvBIiYz/AGB7C+SFBHLQT/owLkU
	fAOcYanpzbTpxc8Jy30rUsoDvDdTbFT2a+QhvG0WGJUszURgNAXYFethceMazEhOuYgTitaE4VyOd
	1LLs7kkK8wi+otWl8J41lXL9Gny3AXQoPtNJdsFW8lUEKompGbSP5mKrQwnF2HnKEbo8ECG7PrCis
	d+dKtWSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBTW-00000002VfS-3fe5;
	Wed, 29 Oct 2025 19:04:50 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBTT-00000002Ve9-3ZNC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 19:04:49 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59303607a3aso234934e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 12:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761764685; x=1762369485; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MADp8JCGJDJpbQCdc3g1O92CBRZChcx+mPxGU0zSLXM=;
        b=jCk5Z5b+ISfWnHbtGczQiQdov9yMzhtYeLtUjRnY8COuuKjriPWWmCbui5WqIE0x/8
         bnM7XNtMlY+syFTt9h0R1I/CnXqkM0lXc5vgSOcBSmlChG9u+MGm39Xx0T81YN1mqoXK
         Qxxg8qErFE07wSCzEhTZvyDzHINkMQ0edtVENiePwV/kDkgmtCob4qoUesgY0SWebpVS
         ninlIhkAtD3Dt9Yuns06Fpoprls9oM/lP8oggLTPaFfXvlBkCSo1gh5O0zILTPRq/YXw
         r0fYgoITTNzUu3mQHlABJHwy9JfPHQWeUipQCQKBlOLR3UXfbhqUcxnxRl/wAwg1VIiF
         WtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761764685; x=1762369485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MADp8JCGJDJpbQCdc3g1O92CBRZChcx+mPxGU0zSLXM=;
        b=DSEMH8vIgiUlA9Aa0/PRU5YLi4fm6nfiNWQJ7FU0BszExYeuIRvLMAQN81tWNqxvC2
         Alp0JPLZVOjDpC2kRU85rZiUzWKG/+hLzw1OR1TobY8DOgIfPZozhJMnC1LJTuaFqx1A
         3BLguGn6BAsXACPTugIMBmXkPmQ4k4FelGKyytR4cvKQ4B3YBjNBsbTdVGd1kiti33UO
         I7LUMYMO/39ryi7EIO4raIPEbfY4I/XnFG0xjeV3AwlniJyZ5oJi80icKY1g+aUbAtA4
         bAuQ1LHeYcbN4qmeTAo0SVBtLfNW5TAn+e/+Dxm7d590WcwxnodpKTsjEhGCXy4kqwnp
         0Jtw==
X-Forwarded-Encrypted: i=1; AJvYcCXgcTAJ5lzYb0RBJEG0DAqTM1nV4+UUvmtSRPTh7hRzebAPK107r303EUaSk3dLASiML1BZKnnQRfaqL67LbCdZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwmQarbRU4q+9UpkgFNneQLF+637l4rEsWjQnsBwGjSgzucSRqK
	HkJLkRODs1D0WvWxeLbJHG3h2A8sSZPiqkJIx/6Yks2OtQ1RIFSHy+q1
X-Gm-Gg: ASbGnct3I/7VUkPtqsTqzPkGpb2l28WMEi5khCZF0Ew1g6Rd6I4LGK0+kNQetLXc8+B
	CYwef1m/z6EXCAwr+B4xvsIgnZAPHeMOxnSsUxqY7bSceX8S6K06Fa6bUlEo/AACjtLrAY6SPHF
	aOk9u/X1Xlmu41Xale8zc6iEiHLGjwtm4InXhjqyXlt3nthqxnqZ4cNM/0TkDflbdx1LZel8e92
	u4/LjBexxPQ93KMZbmuBInRIHR6iUqsrhN4ux+ku1IPjbayaFHQYO/TB42M3Z8RBZjPgWjNFUtT
	uXDBhIiiTvx9cAj5zHTaYb21yfYjI5xQp5WasRl6GYEONJft4MAycV4Mfei/DraxK8s3iMEXGSi
	F2GvZ/nqgLOZG947ua4jf733QJnt2Qyi3e6njj4GCnTlnojIjyBKbXF/8QeG11ojJ8XOS9UO0rA
	NXcbyJIof/GBxqOOejU/GfqAH3Ne6dqYu8x3BWiOWny4eosJUO//2ySz19nA==
X-Google-Smtp-Source: AGHT+IE5BcxhvI597RfEprglxbVp/g/p8XgtmT0Jr/Tdtka5w1yu1s5vmXW5Ea/wqRujMOvi3aXxeQ==
X-Received: by 2002:a05:6512:33d4:b0:592:f31d:da18 with SMTP id 2adb3069b0e04-59416e9f0e9mr181566e87.14.1761764684935;
        Wed, 29 Oct 2025 12:04:44 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f55739sm4044356e87.49.2025.10.29.12.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 12:04:44 -0700 (PDT)
Message-ID: <b3d810f1-ebf7-4859-8f57-bfe3c094dcc0@gmail.com>
Date: Wed, 29 Oct 2025 21:04:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: freescale: add Ka-Ro Electronics
 tx8m-1610 COM
To: Maud Spierings <maudspierings@gocontroll.com>,
 =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com>
 <20251022-mini_iv-v2-3-20af8f9aac14@gocontroll.com>
 <a7012995-c2a8-48a3-abe1-5c227272f21c@gmail.com>
 <65202d1f-6c4f-4d4e-9fef-85cfb74ec768@gocontroll.com>
 <938f85b0-4c9b-463a-960a-f5f4e4092480@gocontroll.com>
 <20251029081138.2161a92a@karo-electronics.de>
 <4a47b9b5-f482-41b6-a441-7728572c5a0c@gmail.com>
 <20251029104838.44c5adcf@karo-electronics.de>
 <d05c62c9-7ed7-46e4-aa4d-27172741b5ee@gmail.com>
 <0667e026-99f3-4233-b3f6-e38273961d49@gocontroll.com>
 <7aaa736c-2390-44b6-913c-0ecb63393ee5@gocontroll.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <7aaa736c-2390-44b6-913c-0ecb63393ee5@gocontroll.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_120447_985278_8964854F 
X-CRM114-Status: GOOD (  40.40  )
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

On 29/10/2025 17:51, Maud Spierings wrote:
> 
> 
> On 10/29/25 16:35, Maud Spierings wrote:
>> Hi Matti,
>>
>> On 10/29/25 11:05, Matti Vaittinen wrote:
>>> On 29/10/2025 11:48, Lothar Waßmann wrote:
>>>> Hi,
>>>>
>>>> On Wed, 29 Oct 2025 10:42:17 +0200 Matti Vaittinen wrote:
>>>>> On 29/10/2025 09:11, Lothar Waßmann wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On Tue, 28 Oct 2025 14:10:04 +0100 Maud Spierings wrote:
>>>>>>> On 10/28/25 13:42, Maud Spierings wrote:
>>>>>>>> On 10/28/25 13:15, Matti Vaittinen wrote:
>>>>>> [...]
>>>>>>>>> Could/Should this be described using the:
>>>>>>>>> 'rohm,feedback-pull-up-r1-ohms' and
>>>>>>>>> 'rohm,feedback-pull-up-r2-ohms'? If I understand the comment
>>>>>>>>> correctly, that might allow the driver to be able to use correctly
>>>>>>>>> scaled voltages.
>>>>>>>>>
>>>>>>>>> https://elixir.bootlin.com/linux/v6.18-rc1/source/Documentation/
>>>>>>>>> devicetree/bindings/regulator/rohm,bd71837-regulator.yaml#L108
>>>>>>>>
>>>>>>>> Ah I didn't know those existed, should've checked the bindings 
>>>>>>>> in more
>>>>>>>> detail, thanks for the hint!
>>>>>>>>
>>>>>>>> I will have to investigate this carefully, since I don't have 
>>>>>>>> access to
>>>>>>>> the actual design of the COM, so I don't know exactly what is 
>>>>>>>> there.
>>>>>>>
>>>>>>> So I am not yet entirely sure if this works out, I used the 
>>>>>>> calculation
>>>>>>> in the driver:
>>>>>>>
>>>>>>> /*
>>>>>>>     * Setups where regulator (especially the buck8) output 
>>>>>>> voltage is scaled
>>>>>>>     * by adding external connection where some other regulator 
>>>>>>> output is
>>>>>>> connected
>>>>>>>     * to feedback-pin (over suitable resistors) is getting 
>>>>>>> popular amongst
>>>>>>> users
>>>>>>>     * of BD71837. (This allows for example scaling down the buck8 
>>>>>>> voltages
>>>>>>> to suit
>>>>>>>     * lover GPU voltages for projects where buck8 is (ab)used to 
>>>>>>> supply power
>>>>>>>     * for GPU. Additionally some setups do allow DVS for buck8 
>>>>>>> but as this do
>>>>>>>     * produce voltage spikes the HW must be evaluated to be able to
>>>>>>> survive this
>>>>>>>     * - hence I keep the DVS disabled for non DVS bucks by 
>>>>>>> default. I
>>>>>>> don't want
>>>>>>>     * to help you burn your proto board)
>>>>>>>     *
>>>>>>>     * So we allow describing this external connection from DT and 
>>>>>>> scale the
>>>>>>>     * voltages accordingly. This is what the connection should 
>>>>>>> look like:
>>>>>>>     *
>>>>>>>     * |------------|
>>>>>>>     * |    buck 8  |-------+----->Vout
>>>>>>>     * |        |    |
>>>>>>>     * |------------|    |
>>>>>>>     *    | FB pin    |
>>>>>>>     *    |        |
>>>>>>>     *    +-------+--R2---+
>>>>>>>     *        |
>>>>>>>     *        R1
>>>>>>>     *        |
>>>>>>>     *    V FB-pull-up
>>>>>>>     *
>>>>>>>     *    Here the buck output is sifted according to formula:
>>>>>>>     *
>>>>>>>     * Vout_o = Vo - (Vpu - Vo)*R2/R1
>>>>>>>     * Linear_step = step_orig*(R1+R2)/R1
>>>>>>>     *
>>>>>>>     * where:
>>>>>>>     * Vout_o is adjusted voltage output at vsel reg value 0
>>>>>>>     * Vo is original voltage output at vsel reg value 0
>>>>>>>     * Vpu is the pull-up voltage V FB-pull-up in the picture
>>>>>>>     * R1 and R2 are resistor values.
>>>>>>>     *
>>>>>>>     * As a real world example for buck8 and a specific GPU:
>>>>>>>     * VLDO = 1.6V (used as FB-pull-up)
>>>>>>>     * R1 = 1000ohms
>>>>>>>     * R2 = 150ohms
>>>>>>>     * VSEL 0x0 => 0.8V – (VLDO – 0.8) * R2 / R1 = 0.68V
>>>>>>>     * Linear Step = 10mV * (R1 + R2) / R1 = 11.5mV
>>>>>>>     */
>>>>>>>
>>>>>>> Because I do not know the pull up voltage, and I am not sure if 
>>>>>>> it is a
>>>>>>> pull up.
>>>>>>>
>>>>>>> So:
>>>>>>> Vout_o = 1.35V
>>>>>>> Vo = 1.1V
>>>>>>> Vpu = unknown
>>>>>>> R2 = 499 Ohm
>>>>>>> R1 = 2200 Ohm
>>>>>>> Gives:
>>>>>>> Vpu = ~0V
>>>>>>>
>>>>>>> And:
>>>>>>> Vout_o = 1.35V
>>>>>>> Vo = 1.1V
>>>>>>> Vpu = unknown
>>>>>>> R2 = 2200 Ohm
>>>>>>> R1 = 499 Ohm
>>>>>>> Gives:
>>>>>>> Vpu = ~1.04V
>>>>>>>
>>>>>>> I am not quite sure which resistor is R1 and which is R2 but having
>>>>>>> there be a pull down to 0V seems the most logical answer?
>>>>>>>
>>>>>>> I am adding Lothar from Ka-Ro to the CC maybe he can shed some 
>>>>>>> light on
>>>>>>> this setup.
>>>>>> R2 is connected to GND, so Vpu = 0.
>>>>>> With:
>>>>>>     regulator-min-microvolt = <1350000>;
>>>>>>     regulator-max-microvolt = <1350000>;
>>>>>>     rohm,fb-pull-up-microvolt = <0>;
>>>>>>     rohm,feedback-pull-up-r1-ohms = <2200>;
>>>>>>     rohm,feedback-pull-up-r2-ohms = <499>;
>>>>>> the correct voltage should be produced on the BUCK8 output, but a 
>>>>>> quick
>>>>>> test with these parameters led to:
>>>>>> |failed to get the current voltage: -EINVAL
>>>>>> |bd718xx-pmic bd71847-pmic.3.auto: error -EINVAL: failed to 
>>>>>> register buck6 regulator
>>>>>> |bd718xx-pmic: probe of bd71847-pmic.3.auto failed with error -22
>>>>>>
>>>>>> Apparently noone has ever tested this feature in real life.
>>>>>
>>>>> Thanks for trying it out Lothar. I am positive this was tested - but
>>>>> probably the use-case has been using a pull-up. I assume having the 
>>>>> zero
>>>>> pull-up voltage causes the driver to calculate some bogus values. I
>>>>> think fixing the computation in the driver might not be that big of a
>>>>> task(?) The benefit of doing it would be that the correct voltages 
>>>>> would
>>>>> be calculated by the driver.
>>>>>
>>>>> If real voltages aren't matching what is calculated by the driver, 
>>>>> then
>>>>> the voltages requested by regulator consumers will cause wrong 
>>>>> voltages
>>>>> to be applied. Debug interfaces will also show wrong voltages, and the
>>>>> safety limits set in the device-tree will not be really respected.
>>>>>
>>>>> I think this would be well worth fixing.
>>>>>
>>>> Before doing the real-life test I did the same calculation that's done
>>>> in the driver to be sure that it will generate the correct values:
>>>> bc 1.07.1
>>>> Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006, 2008, 2012-2017 
>>>> Free Software Foundation, Inc.
>>>> This is free software with ABSOLUTELY NO WARRANTY.
>>>> For details type `warranty'.
>>>> fb_uv=0
>>>> r1=2200
>>>> r2=499
>>>> min=800000
>>>> step=10000
>>>> # default voltage without divider
>>>> min+30*step
>>>> 1100000
>>>> min=min-(fb_uv-min)*r2/r1
>>>> step=step*(r1+r2)/r1
>>>> min
>>>> 981454
>>>> step
>>>> 12268
>>>> # default voltage with divider
>>>> min+30*step
>>>> 1349494
>>>>
>>>> Probably we need to use this value rather than the nominal 135000 as
>>>> the target voltage in the DTB.
>>>
>>> Yes. When the driver calculates the voltages which match the actual 
>>> voltages, then you should also use the actual voltages in the device- 
>>> tree.
>>>
>>
>> Think I've got it:
>>
>> diff --git a/drivers/regulator/bd718x7-regulator.c b/drivers/ 
>> regulator/ bd718x7-regulator.c
>> index 022d98f3c32a2..ea9c4058ee6a5 100644
>> --- a/drivers/regulator/bd718x7-regulator.c
>> +++ b/drivers/regulator/bd718x7-regulator.c
>> @@ -1613,6 +1613,8 @@ static int setup_feedback_loop(struct device 
>> *dev, struct device_node *np,
>>                                  step /= r1;
>>
>>                                  new[j].min = min;
>> +                               new[j].min_sel = desc- 
>>  >linear_ranges[j].min_sel;
>> +                               new[j].max_sel = desc- 
>>  >linear_ranges[j].max_sel;
>>                                  new[j].step = step;
>>
>>                                  dev_dbg(dev, "%s: old range min %d, 
>> step %d\n",
>>
>>
>> the min_sel and max_sel fields were uninitialized in the new 
>> linear_range, copying them over from the old one (they refer to the 
>> register range if I understand correctly so they should not change) 
>> initializes them.

Ah, indeed. Well spotted! Thanks for debugging it :)
>> Then setting 1349494 as the actual voltage makes it fully work. 
>> Otherwise it complains:
>> buck6: failed to apply 1350000-1350000uV constraint: -EINVAL
>>
>> Final debug output now:
>> [    0.327807] rohm-bd718x7 0-004b: buck6: old range min 800000, step 
>> 10000
>> [    0.327813] rohm-bd718x7 0-004b: new range min 981454, step 12268
>> [    0.327819] rohm-bd718x7 0-004b: regulator 'buck6' has FB pull-up 
>> configured
>>
>> I will add this fix to the next version of this patchset and include 
>> your requested change in the dts.
> 
> New idea, why don't we just change the values of the original 
> linear_range? Do away with the allocation there entirely.

I kind of like to keep the global structs const, and allocate new memory 
for anything we need to change. That should help us if we ever need to 
support more than 1 instance of the driver (Eg, on a system with 
multiple PMICs) - although that's not likely, and AFAIR, the driver is 
currently not written to work in such use-case.

Anyways, the selectors won't change when voltage gets scaled. Maybe just 
allocate with kmemdup, update the min and step, and be done with it(?)

Well, hard to say what's the best approach without seeing it :) I'd 
suggest you consider what you think is the best solution, write a patch 
and let's see how it looks like (and, at the end of the day, what Mark 
thinks of it).Yours,	-- Matti


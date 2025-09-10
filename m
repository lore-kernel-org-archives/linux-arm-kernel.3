Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F49CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 16:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwPPYJTQ/XXwyamtgAxlZ1NzteBcBgnI+IIDSuPw/fU=; b=IKvZNkYiBGxl8519Gnvlsiq5dN
	vhHqqBfLFXzzACNj59m3bWn4UVonuhHLYWZ468n9dGlbW5Dkn/v+HiUE57opDO32bF2ss1L8CgmSd
	zJvAenyaDu+9+SENB0ozKOdkrqkSSjrv8FAdz2FnXanCvc/j/V3NkAIfqIy0A2gxn3av8DUEmkrcL
	X4a02/CsbEeCoQvp5qfBCjeJF7zyTanbbHIVHLcdXMTI1ScLS/4Nxduqfjw5Hkod88hJ68ssn1COe
	txKIpOjCSjU07mXdkqQAi6JqOVrqyqtm7k0IoPiQ+tG06xVNoH1usJ0q5pWUJjkT9sbm2SdY3Ek/p
	hQRm2csQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNH4-0000000FK7q-3ygE;
	Wed, 10 Sep 2025 16:02:22 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNH1-0000000FK5H-3Rk5;
	Wed, 10 Sep 2025 16:02:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757520086; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R5DDqmabhsADtMQCa2PEdFT6F6wXS9UD/gGmpLywYcPrMKfhq88xNdBkGb8waBzjsKLkauIkTZ7z1RrkRmx77yxGkMbmt4pn6EQY273AbNRYhBkKrWQsQCCodV5fCFt+Cj1jRCQZhj/po422gXn04MM32CEJaiiCea5eXeOEiD0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757520086; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VwPPYJTQ/XXwyamtgAxlZ1NzteBcBgnI+IIDSuPw/fU=; 
	b=R1Oct9/K0pgrsE6ekil11c92iYphWLbg1NfznTSVdecOiUThXFJD1HAwSAGsj1jCTP4WnUmmCJzdJmNTcxwzCvtPBuwMVx9tq3arn6K65HuQ6uowbNLYIFAbsWPnMc5xk99S9/1Prfjkr5wM34P6crUTigUGLLtUVHH32uXx5Zw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757520085;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=VwPPYJTQ/XXwyamtgAxlZ1NzteBcBgnI+IIDSuPw/fU=;
	b=NNi7LZBVPN/l/xAW+MYrNHuVhd3P5biETVJMrjrMGhoO7Szh7a/eXWCGKVyejaWg
	AUU46rWM9rcHy4fqDfkLmO5jQ3oCB1ppq9L7YS+VbG/zh9hiHS+HkbgMig99r/4Z2TX
	wYz1HTF4q2uewOLrLqy2+D5+3paLJyIyf7EEXJJk=
Received: by mx.zohomail.com with SMTPS id 1757520082828908.8305273727573;
	Wed, 10 Sep 2025 09:01:22 -0700 (PDT)
Message-ID: <7523752e-eb7b-4211-84f2-33916c39ee2b@collabora.com>
Date: Wed, 10 Sep 2025 13:01:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS
 MIP4 Touchscreen to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 conor+dt@kernel.org, davem@davemloft.net, edumazet@google.com,
 flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
 jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
 kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 lgirdwood@gmail.com, louisalexis.eyraud@collabora.com,
 maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com,
 mchehab@kernel.org, minghsiu.tsai@mediatek.com, mripard@kernel.org,
 p.zabel@pengutronix.de, pabeni@redhat.com, robh@kernel.org,
 sean.wang@kernel.org, simona@ffwll.ch, support.opensource@diasemi.com,
 tiffany.lin@mediatek.com, tzimmermann@suse.de, yunfei.dong@mediatek.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-14-ariel.dalessandro@collabora.com>
 <CACRpkdbpKqKyebADj0xPFq3g0biPh-vm4d6C3sd8r0URyfyYRg@mail.gmail.com>
 <caguo7ud4dapb4yupeq2x4ocwoh4dt5nedwjsyuqsaratugcgz@ozajhsqwfzq6>
 <CACRpkdZRHQ6vuchN8x8d0uPCVMPPHOdBVWiUhzFJNs2paHGbYw@mail.gmail.com>
 <f199fc0b-20c0-4c22-b0ed-c508514b60c6@kernel.org>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <f199fc0b-20c0-4c22-b0ed-c508514b60c6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_090219_910862_0DE3815A 
X-CRM114-Status: GOOD (  17.46  )
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

Krzysztof, all,

On 9/9/25 3:56 AM, Krzysztof Kozlowski wrote:
> On 05/09/2025 13:33, Linus Walleij wrote:
>> On Fri, Sep 5, 2025 at 12:02 PM Dmitry Torokhov
>> <dmitry.torokhov@gmail.com> wrote:
>>> On Thu, Aug 21, 2025 at 01:56:24PM +0200, Linus Walleij wrote:
>>>> Hi Ariel,
>>>>
>>>> thanks for your patch!
>>>>
>>>> On Wed, Aug 20, 2025 at 7:17 PM Ariel D'Alessandro
>>>> <ariel.dalessandro@collabora.com> wrote:
>>>>
>>>>> +  ce-gpios:
>>>>> +    description: GPIO connected to the CE (chip enable) pin of the chip
>>>>> +    maxItems: 1
>>>>
>>>> Mention that this should always have the flag GPIO_ACTIVE_HIGH
>>>> as this is required by the hardware.
>>>>
>>>> Unfortunately we have no YAML syntax for enforcing flags :/
>>>
>>> Theoretically there can be an inverter on the line, so from the AP point
>>> of view the line is active low while from the peripheral POV the pin is
>>> active high...
>>
>> Yes, I think someone even proposed adding inverters to the
>> device tree and was nixed.
> 
> It's not about DT, it's about board design - you can (almost?) always
> invert the logical signal, so this should match what hardware requires
> plus any inverter on the board.
> 
> 
>>
>> It's a matter of phrasing I would say:
>>
>> "Mention that this should nominally have the flag GPIO_ACTIVE_HIGH
> 
> No, please do not, it is wrong. If hardware requires active high, then
> just say this is active high. But the actual GPIO flag depends on the
> board design if signal is inverted.

After the discussion from this thread, will mark it a "active high" in 
the property description for v2.

Thanks,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718



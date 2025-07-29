Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0373CC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 21:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6TTijnB+mf1Tx70AUpgzd27gcsp61CTxKy/bu5Mf0k=; b=boN/Rfyouee6UjwophyFzNCF8D
	UZ0NYfvWAhT/+2RN3TsINvMk+f1nm23SA05sdoSatQTTsJhwxl8dmXhCHqFRAGajeZfucuC/U+VpE
	Hrm9Rtyt6nUtjRWETsG05x6CapT3UX1/TPx+WhpcedFgGUg08y4KS6Ncfo8RWChSPRwqtTRnaGB1t
	x428KOv1Kyt2e+CjFMRrk/lS+xNVX7oLu+LrC6qNAXkGr72h28sUGkcmUO3JXhwwmlu09Dgg91/Dn
	qXyjmsE0ZasJRcSi1T/sEPZQHfVityo6BZCgWxDSpRVu9bd7PUFI91jSii3hW8JcACdbBgzSKisKM
	dUOa3a3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugs1q-0000000081j-28fJ;
	Tue, 29 Jul 2025 21:38:34 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrzM-000000007si-3pPc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 21:36:02 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3e3ef0024acso2027615ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 14:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753824959; x=1754429759; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T6TTijnB+mf1Tx70AUpgzd27gcsp61CTxKy/bu5Mf0k=;
        b=soWFIecqRn/xMoGgDAN5aCKLv1V012EHQ5Wmps3FDVPFcsPt7Yi3tMp1DF65y8Qaxi
         aR4bp25K4casc0VP7Xj4p7v8mxv55UEohjEmMSCELZ5E307rrqvN/Eu9Ohgld9tWINuq
         BptAbSBuIHowFOBsWfbJB5k3cl7qs0K75qmGuU7YakIh5e03vMQjbySR37RwRryoWy/x
         JURCT8CLAyYYkNXivXEkXBRUHhVQ1xH3HCMw5Ibk81uCDXz+gowlxKmmah42mBpcAAM3
         9RP+sXUlfCsyytBNJW1MICZUlFv+A+WlUjK6ggB+NAUVjuo5GvV7rp8FLzvwlaPp7ijG
         6uNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753824959; x=1754429759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T6TTijnB+mf1Tx70AUpgzd27gcsp61CTxKy/bu5Mf0k=;
        b=af3cmErg+vMnEACgzeH8Y7tlBpqRFyW9BSgsmyPHWlfvn2273rfzG44bi8eIuTVOZx
         ePYhKlcsvDxL1SLq3JHMQ1343EhAYL2aOaSMX+J06tVJF6Rx/Pdkb6y6GZ4Vm8+/3ks7
         FAzD8Uz07AQVJBrsb9Ia1fOhuG5xGW6Gg2kWOOmJgKa11Kh0blx6D3hZlF/y6w25FVg3
         +GTNx1P96EOGFo2yJJguT8WFGZ9kRAx1Y3ufr84CMl/5CRR/BPCwVgFOapctBXsiTo4+
         V/1elE+ajFLdCFCflVJEIkkRIx8fNB2OxOjHDjEXdw81OTOK8qEOtbEgCBftbNXpqmKR
         y2lg==
X-Forwarded-Encrypted: i=1; AJvYcCUj+x7iJfZeGt85FM4TBzJZrR6+56GtEroiWoSQ6MZVA3HfX/6o+NQpiIpU1DPyWi0YOCjhPWXfKhDlggxduodI@lists.infradead.org
X-Gm-Message-State: AOJu0YytWwYfVw6l2pROL61s4bm6yw1DVaV9WqVU8vlQZrJi4S4x+LwD
	jWXuezc+K0WSLVgHM3DBN9g4vv9EiZqzKPz8lae4wHutJ3iG6uFzKNOJh+wct/YJMNE=
X-Gm-Gg: ASbGnctknsCrAp66ZyRJ8BywnBN+Pvq4NikPK6m9WLSK3u0t6OgmdFV6qqmGGhNrPle
	8JWFGi2x9g/Kdewqir5zgBxMZt+sSJ0SGPYjOVisteo0Ol0sI71k9kaymOCEqRja+EsLHkhvTOY
	frQ1TG0G83KIiOlTXjs/SwDJJtGMrBfm+wfktjs0iVjy6bjiXonB1E55+DGAQppj6LHfHop2owO
	IOrRFF+gXGeIN6Zr1epBMy1pzXfGOBUeYaQn7fZrZjkNk0mr6djRA4gGn66/9TKR6rOp8UOvSr3
	SD1a7bFRgGMvpTLl6GbFcRWdtWHpqLuGCh4O/QeQHTn9xcoG6PsN7MCSOQ07dXlzraeRqUeTWvi
	J1Vs0htk00EZsdCsV4mb45AjPFWJGyAbvCiBwDLFhO5pBxfAgfsqy+0raVuOOkg==
X-Google-Smtp-Source: AGHT+IH9yMoT3SyI/T66ZtxcPnZNldk6FIOoyhUi5kHT3q4ZE7dn1hQwAMIQq+oM/1pZl9ARWn7tQA==
X-Received: by 2002:a92:db50:0:b0:3e3:b3d0:26cf with SMTP id e9e14a558f8ab-3e3e97254b5mr53179065ab.10.1753824959544;
        Tue, 29 Jul 2025 14:35:59 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-508c9343739sm2781465173.69.2025.07.29.14.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 14:35:59 -0700 (PDT)
Message-ID: <79fde2dc-2370-4ec8-94eb-57715cfc2806@riscstar.com>
Date: Tue, 29 Jul 2025 16:35:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: serial: 8250: allow "main" and "uart" as
 clock names
To: Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, lkundrak@v3.sk,
 devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 spacemit@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20250728220002.599554-1-elder@riscstar.com>
 <20250728225319-GYA900803@gentoo>
 <20250729-reshuffle-contented-e6def76b540b@spud>
 <5c3f9f10-6a9d-45b4-80c0-09402b35bf47@riscstar.com>
 <20250729-clench-hastily-b80f11f73336@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250729-clench-hastily-b80f11f73336@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_143600_962684_553EFCC2 
X-CRM114-Status: GOOD (  20.74  )
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

On 7/29/25 4:08 PM, Conor Dooley wrote:
> On Tue, Jul 29, 2025 at 04:04:05PM -0500, Alex Elder wrote:
>> On 7/29/25 12:54 PM, Conor Dooley wrote:
>>> On Tue, Jul 29, 2025 at 06:53:19AM +0800, Yixun Lan wrote:
>>>> Hi Alex,
>>>>
>>>> On 17:00 Mon 28 Jul     , Alex Elder wrote:
>>>>> There are two compatible strings defined in "8250.yaml" that require
>>>>> two clocks to be specified, along with their names:
>>>>>     - "spacemit,k1-uart", used in "spacemit/k1.dtsi"
>>>>>     - "nxp,lpc1850-uart", used in "lpc/lpc18xx.dtsi"
>>>>>
>>>>> When only one clock is used, the name is not required.  However there
>>>>> are two places that do specify a name:
>>>>>     - In "mediatek/mt7623.dtsi", the clock for the "mediatek,mtk-btif"
>>>>>       compatible serial device is named "main"
>>>>>     - In "qca/ar9132.dtsi", the clock for the "ns8250" compatible
>>>>>       serial device is named "uart"
>>>>>
>>>>> In commit d2db0d7815444 ("dt-bindings: serial: 8250: allow clock 'uartclk'
>>>>> and 'reg' for nxp,lpc1850-uart"), Frank Li added the restriction that two
>>>>> named clocks be used for the NXP platform mentioned above.  Extend that
>>>>> so that the two named clocks used by the SpacemiT platform are similarly
>>>>> restricted.
>>>>>
>>>>> Add "main" and "uart" as allowed names when a single clock is specified.
>>>>>
>>>>> Fixes: 2c0594f9f0629 ("dt-bindings: serial: 8250: support an optional second clock")
>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202507160314.wrC51lXX-lkp@intel.com/
>>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>>> ---
>>>>>    .../devicetree/bindings/serial/8250.yaml      | 19 ++++++++++++++-----
>>>>>    1 file changed, 14 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
>>>>> index e46bee8d25bf0..cef52ebd8f7da 100644
>>>>> --- a/Documentation/devicetree/bindings/serial/8250.yaml
>>>>> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
>>>>> @@ -61,11 +61,17 @@ allOf:
>>>>>                - const: uartclk
>>>>>                - const: reg
>>>> ..
>>>>>        else:
>>>> would it be better to drop this 'else', and moving following 'if' block
>>>> to the same level with "nxp,lpc1850-uart"?
>>>>
>>>> the reason here would avoid too many indentions if add more constraint in
>>>> the future if other SoC uart need different clock-names..
>>>
>>> I agree, it's more typical to do it that way I think to boot.
>>>
>>> Also, why is there a k1/lpc conditional bit that is not part of the
>>> allOf in addition to the bits in the allOf? Can that get merged with the
>>> allOf please?
>>
>> Are you talking about the blank line here?
> 
> No, I'm talking about what's down around line 270 in the binding.

Oh wow that's in a weird spot, and it might be redundant?

Anyway I'll work on getting that fixed too before I send
my next version.

					-Alex

>>
>>      then:
>>        oneOf:
>>          - required: [ clock-frequency ]
>>          - required: [ clocks ]
>>                             <------ this blank line
>>    - if:
>>        properties:
>>          compatible:
>>            contains:
>>              const: nxp,lpc1850-uart
>>      then:
>>
>> I didn't notice that before.  It got inserted with commit
>> d2db0d7815444 ("dt-bindings: serial: 8250: allow clock
>> 'uartclk' and 'reg' for nxp,lpc1850-uart").
>>
>> If so, yes I'll remove that as well when I update the patch to
>> get rid of the else as Yixun suggests.
>>
>> Greg won't take this for a couple weeks so I'll hold off sending
>> v2 for a while.
>>
>> 					-Alex
>>



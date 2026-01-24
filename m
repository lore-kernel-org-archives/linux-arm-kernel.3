Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1253D715C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 05:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uAVsETK21+kGnCxqlDEtp4ioX9WXTvhY2/OchwRYyU8=; b=hCcwvRRcI5EJyGLnMfETuftwpQ
	zyO4vLJZYhAaukW9NpWvCdw7pSVvcdnV/YysIoK+TeQednCrCcaygUZRe0MtOcX5/TlJZPjuH3Ax7
	eg1pFApUowIzgj4y2I0GhTJbsaekOSyQ2xJIDnrdrsfolN0tzHNVMsasMQ03r6o2bXGrXrsrdgb0O
	w7QwVCDUxCHbwVTzeLtaFLaUbBvJPpTBnGAlr/ccjINwkK6POm9OOfRkidfn/drFkT2ZMrgL4luKD
	c3Z9BP/iRfkkzOpHSAMtryZWugP+kzR98Uc9GX+iasz+S0BdXwS8ZZ7F0J7zqhF0G9Gg8f86H7cQ9
	Wr9U2XeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjVzT-0000000A0RE-2I1U;
	Sat, 24 Jan 2026 05:15:19 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjVzQ-0000000A0Qr-2XqX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 05:15:18 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-88a26ce6619so40619546d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 21:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769231715; x=1769836515; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uAVsETK21+kGnCxqlDEtp4ioX9WXTvhY2/OchwRYyU8=;
        b=MYEbOo6uJkHQ0k5CmYo9ECLkHI2R5MzCR4EwhxTUCDnZ0t9P8xqCN4jXcbuyp6nfrb
         2hkW+buLlAk0K8kAE04m0kTOBXEVfLvaScGDxlUlMb9KF1qmwT0yVQTbxXDHJGpv6dqz
         /rOtgJyd0jQ+xkaiZkcZMFC30067nnAcT2lM5xECt/BCbR94ORDC13oeZ+SluFGrZ/yS
         Q1dUsb7MrzumOuh52jPNm3Xhdj+KlWD7tSvAvSRdZdwUs3VxVE7jbzvlNMzh+sOLVYxj
         M+vQMF55p/Gm9p09fneLqEe5z/vbvhIcuZBcM30IKvhSxNUTn2Bjyos/cfrdh/D90dwP
         Pkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769231715; x=1769836515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAVsETK21+kGnCxqlDEtp4ioX9WXTvhY2/OchwRYyU8=;
        b=Y7s9/j/FMY9tIkdmsqheRNQ4z9Zo+Abvr+jGXMbWSfeVdRlIYs5Z3jJQOVSWCKsalv
         tPkguFPR9QgU/TIJ163oVumxj3/uc/N+RNzm93xcx7t1c7/eVwP04aUUpdwXqMZGih4b
         AV9TIO4t+2ZcxmQWj7BmU188tmXu6MmBon2HiySUTWy7pdnjs9p0qD/7eIDLYFZgaUF2
         5fT35z6FagQQqKBIxtcOIh09QqBjdAGTk9j5K+QxvO0iamoVHP2uvxp3MZbXggmsSwwx
         IAgFyYfgSfRID3/ej25G0DLzlGDTwQMFWcV2qv0AlH1Gs2BM6SSw9kbHOlXAXQqkzQ/9
         uK0A==
X-Forwarded-Encrypted: i=1; AJvYcCVQMOeXM+eUFZR/6Z6Q3pPSLFFfjafeDPr+qTyb2KlGee1kolC06rVbjt0REblUPWmsx/BK3RXDWM+SXKR4znCo@lists.infradead.org
X-Gm-Message-State: AOJu0YwleGOQ4qjtuWD3/dqmKWLY6Kr5PDmYGdoIVBEfDZ1Yg2ZJrP1h
	IP9nRM/hzZxT5DEHXMrReznPTWxf3fGKVKJUfvQv42tEbEHiVeyikLbD3SHmbw==
X-Gm-Gg: AZuq6aK3hsi26B/IT9dKZMfVOjg+zv9vMsQWOfzoQQQqkeL+/cDGyqtBr1Zn1CpBbnF
	FX3t0s13+Dp3MQow5oO3n3vI5mC4Q5QkNwgh2KBw2y52Dflnprd9njsUCNrU4o/kUEjVbJEyBIA
	VxeO3glZMYHluQBWsvwFYYg0mN7ONZBFh4kmkbWgVsd1sR6grzcP/kttYVRAPNbh1UZVTRbIMYQ
	Se3bmznUBN/tjgJYeeJAp14SaWOGtVwVH8u9dK8ZVtubd5VdtE1yEzO0VwCuAOCFWlOxV6Bt6ok
	B6lliXsPWy+NQ8qcuot5RevSNcREI+rl5/LUqf9H1ajozkFxCw8HYLZEx6zk1cKMyED3gHOVgod
	a/GlWIvW+pOt5Y1iNOSHGdFQcEdTXOo8qUZlP1R/ktntCyCbljSviSlth82+xPGPAcYzHk8ZRSF
	wZdSVflxWucpZbCPXEyRGge+ynvXRWAPtv1Dw=
X-Received: by 2002:a05:7301:1015:b0:2ae:5db9:f32c with SMTP id 5a478bee46e88-2b739b6d1bdmr2095282eec.26.1769230365229;
        Fri, 23 Jan 2026 20:52:45 -0800 (PST)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa22707sm5548789eec.29.2026.01.23.20.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 20:52:44 -0800 (PST)
Message-ID: <009aefc4-fbc9-4f91-9230-23d18c281bf3@gmail.com>
Date: Fri, 23 Jan 2026 20:57:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock sampling
 control
To: Andrew Lunn <andrew@lunn.ch>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?B?5p2O5b+X?=
 <lizhi2@eswincomputing.com>, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
 <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
 <4e2a55e7.3662.19be8cb9c3c.Coremail.lizhi2@eswincomputing.com>
 <c5c0bfdb-316d-4796-afa0-f6f018ceb414@lunn.ch>
 <abf12a3f-9cdd-472d-a02e-af4da594b84f@gmail.com>
 <e6f7da45-3dec-4af6-a5b1-a72210bf24f4@kernel.org>
 <43923bf9-6202-4147-8eac-5bd7bb653fd4@gmail.com>
 <bd202cfa-d6eb-4d0e-982d-b49795dd25f7@lunn.ch>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <bd202cfa-d6eb-4d0e-982d-b49795dd25f7@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_211516_685667_74C2C139 
X-CRM114-Status: GOOD (  19.74  )
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

Hi Andrew,

On 1/23/26 11:43, Andrew Lunn wrote:
> On Fri, Jan 23, 2026 at 02:47:18AM -0800, Bo Gan wrote:
>> Hi Krzysztof,
>>
>> On 1/23/26 02:07, Krzysztof Kozlowski wrote:
>>> On 23/01/2026 08:39, Bo Gan wrote:
>>>>> I assume the address of the interface is fixed. So you can just key
>>>>> off that to distinguish the two instances.
>>>>>
>>>>> Since this is an internal property, not a board property, it is not
>>>>> clear it actually belongs on DT.
>>>>>
>>>>>        Andrew
>>>>
>>>> IMO, they should be in DT to provide maximum flexibility. The SoC .dtsi
>>>
>>> This is not the purpose of DT. Please rather use arguments in terms of
>>> DT rules (see docs, presentations).
>>>
>> Any examples? links? Thank you for your patience.
>>
>> I'd say if the board .dts never overrides the eswin,rx-clk-invert, (E.g.,
>> the SoC .dtsi has rx-clk-invert, later the board /delete-property/'s it)
>> then yes, it can be treated as something inherent to the mac, and then
>> "use arguments in terms of DT rules". I was thinking about use cases like:
>> https://lore.kernel.org/all/20230714104521.18751-3-samin.guo@starfivetech.com/
> 
> Your device should be compliant with the RGMII standard by
> default. There should not be a DT property to ask it nicely to follow
> the standard.
> 
> Properties like
> 
> motorcomm,tx-clk-adj-enabled;
> motorcomm,tx-clk-100-inverted;
> motorcomm,tx-clk-1000-inverted;
> 
> are for broken boards which break the standard and require the MAC do
> also break the standard so that everything works. We should not start
> out with the assumption you need to support broken boards which ignore
> the standard.

My reading of
https://lore.kernel.org/all/308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com/
is that the eth1 MAC is already breaking the standard at SoC level, and
the boards can un-break it or break it even more. Hence, even for proper
designed board, SoC .dtsi still needs eswin,rx-clk-invert (for *eth1*).
For broken boards, they may require eswin,rx-clk-invert for *eth0*, even
though SoC doesn't mandate. For *eth1* broken boards might have to
/delete-property/ it and use eswin,tx-clk-invert or something else.
It's clearer to have all these parameters visible and explicit in DT.

ESWIN, please correct me if I'm wrong.

P.S. I'm not affiliated to ESWIN, but I do own eic7700/hifive-premier
board, and I can talk to someone who owns eic7700/megrez. I can help
validating ESWIN's patches independently.

> 
>         Andrew
> 
Bo


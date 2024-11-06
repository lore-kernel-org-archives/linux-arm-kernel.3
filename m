Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EBBD59F7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 22:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YB3xeY071IgcEnEiq3AVPEiyG5ZVXfdzV1Ck//Skg7M=; b=A1MNnNaYrdfClrkVoed6k6tQDq
	Zuww+AaPrjNEZ5QWFgHv2ifePzFcVjWDwgoKeMra/q2m8OjN1QENUWPB8mqyGpXhsiwABeAck3CJf
	pu8RqJspE95zE6D/6ro5OjK8Bv8speoe+uWAxK6fXbv0qqXDbI07NkYZjOvAyAADkKJ5Lg7L2Jrg8
	JgQBmvcEJHz1uedsYPtiOowkM7NRkCaJUOlbHPRJUTslutsnGdxz5AFyw3Krt1riszteg4CWBchb7
	9Ie0/i62Xf78ib2nDFy2mGzpAECDurCyQFRMV+cnqS2kCYoEvKQBcN3EXy2eBUQbTkZ3LgcoIMWdx
	xmT5caoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8oI8-00000004t1y-1RiL;
	Wed, 06 Nov 2024 22:14:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8oGO-00000004snH-16Iu;
	Wed, 06 Nov 2024 22:12:34 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso2973645e9.0;
        Wed, 06 Nov 2024 14:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730931150; x=1731535950; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YB3xeY071IgcEnEiq3AVPEiyG5ZVXfdzV1Ck//Skg7M=;
        b=OguKIDAbAzdxsUwNs1xdNTzxbmbyluMLQ8Q2F4WkH/7NxrFENWp7s/9TOqQkJxLGj/
         oHNFrs2zf3TC4gMLTjhqjoGDOcakgvLQXnZJRXBEpeW44swCO7JT4oLmAuexasaXmc5W
         Hx8r2+YTNGjObXIXMHcU0z+eeTNR1G8jKRbvou8vL2K0qsXCaAHJ2BoYv6o+iN6gRaEY
         mkiTGmaadWDcPCamafBLQS8ZAZ3xktonD2XAXGtXkLb3Lg1a2X5PzGVbN28DeO63L8DR
         DH2il+Y7mnn8pwdVS1ObuuzG+xRi3lzTrohUcpME8Hda0GT/9IZJ6jEUsRMhtQcvms/+
         jQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730931150; x=1731535950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YB3xeY071IgcEnEiq3AVPEiyG5ZVXfdzV1Ck//Skg7M=;
        b=jKbPZF45pXDnz0UwifhL2TJd0S0obERNsolQb9bkWyEMoKw+cWan6BFtg6iu2FkGGn
         asUwtS4rr6fjBvLehJpxBt79+N8YGkpUsKwaoVE3TZgZTSIbeVm2wlBqeVcuGqQuqrzv
         1SQPmMqP82J+9yEMQOm6dg3l1HIb/B4MPbVV/WdEHbZ+uRhOOigeD+/yQTU+sIy4YGAl
         fnUymaKcfbLrNTC3+vg1M0aJMkIlMTwPcQhz7mFDbzt+wXIbKOysQ+zqTQ9MlBze1qzV
         5OF5HNlZKte/8lnGU2Z67tZVlxFJzAjqDbzak6YTYTsNvSAURMrMPREJa22z2JYcA6a0
         bHZg==
X-Forwarded-Encrypted: i=1; AJvYcCUTPcBh8lMnYjdb21X3j+Ndw9pvX4FvjxFq7lohtVObRzL86oXafpbWznU6KasHu9S67Yt9X08GF3ur1aF7tek=@lists.infradead.org, AJvYcCXpLDIDYlT3OSGOGebitkSkBMgqKu7y9fia8yAH+DtRYTAfQ9yliOR3SzHqD9NFU1B7HrXPv37mOqbq/v1G6CEA@lists.infradead.org
X-Gm-Message-State: AOJu0YzVWfjQEG807xkEXP8o4o6nu9AeT904vuoBFDiXq7gLnx9Qn18/
	JvGBKoF7JidB75abBxL+DiFbKEUX233NSZqGECbI7P1UB1bjl8+8
X-Google-Smtp-Source: AGHT+IFfw5uAMtdU1Om11dpYAnWEuvswlrvP8MXiZx6I0NsIQwFcLiPX5mXS4Yxg1s/Iptb9rEr+Hw==
X-Received: by 2002:a05:6000:4009:b0:37d:4e80:516 with SMTP id ffacd0b85a97d-381c7a5f773mr18655654f8f.34.1730931150127;
        Wed, 06 Nov 2024 14:12:30 -0800 (PST)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e771sm20526409f8f.81.2024.11.06.14.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 14:12:28 -0800 (PST)
Message-ID: <3d17cd64-46c5-427f-b24f-9091546e2edf@gmail.com>
Date: Thu, 7 Nov 2024 00:12:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [net] net: wwan: t7xx: Change PM_AUTOSUSPEND_MS to 5000
To: =?UTF-8?B?5ZCz6YC86YC8?= <wojackbb@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com
References: <20241028073015.692794-1-wojackbb@gmail.com>
 <20241031185150.6ef22ce0@kernel.org>
 <CAAQ7Y6an8ZkxYpJehd8cBRPHjqyQofc6A4QdPzM_dhh1Sn0nng@mail.gmail.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <CAAQ7Y6an8ZkxYpJehd8cBRPHjqyQofc6A4QdPzM_dhh1Sn0nng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_141232_326954_C09ACF9C 
X-CRM114-Status: GOOD (  14.03  )
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

Hello Jack,

On 06.11.2024 13:10, 吳逼逼 wrote:
> If the PCIE connection remains in the D0 state, It will consume more power.

True. Keeping device active causes battery drainage and the idea to put 
inactive device into the power saving mode is clear. My question was not 
about power consumption. I am trying to understand what other 
consequences of keeping modem suspended. More specifically, how the 
suspend mode influences user data communication?

> Receiving or sending data will cause PCIE to change D3 Cold to D0 state.

Am I understand it correctly that even receiving IP packets on downlink 
will cause PCIe link re-activation?


I am concerned about a TCP connection that can be idle for a long period 
of time. For example, an established SSH connection can stay idle for 
minutes. If I connected to a server and execute something like this:

user@host$ sleep 20 && echo "Done"

Will I eventually see the "Done" message or will the autosuspended modem 
effectively block any incoming traffic? And how long does it take for 
the modem to wake up and deliver a downlink packet to the host? Have you 
measured StDev change?

> Jakub Kicinski <kuba@kernel.org> 於 2024年11月1日 週五 上午9:51寫道：
>>
>> On Mon, 28 Oct 2024 15:30:15 +0800 wojackbb@gmail.com wrote:
>>> Because optimizing the power consumption of t7XX,
>>> change auto suspend time to 5000.
>>>
>>> The Tests uses a script to loop through the power_state
>>> of t7XX.
>>> (for example: /sys/bus/pci/devices/0000\:72\:00.0/power_state)
>>>
>>> * If Auto suspend is 20 seconds,
>>>    test script show power_state have 0~5% of the time was in D3 state
>>>    when host don't have data packet transmission.
>>>
>>> * Changed auto suspend time to 5 seconds,
>>>    test script show power_state have 50%~80% of the time was in D3 state
>>>    when host don't have data packet transmission.
>>
>> I'm going to drop this from PW while we wait for your reply to Sergey
>> If the patch is still good after answering his questions please update
>> the commit message and resend with a [net-next] tag (we use [net] to
>> designate fixes for current release and stable)

--
Sergey


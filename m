Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C850ED44142
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 11:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3CEd+clgPFVRk8eaz+5YffYgqV7UVBEYHjaZLke59o=; b=QAYwfhq4KYMDrSmSzRTcWNNWB7
	pt4iD0w1wycwjtQOPPcLXtnaTfweQP/arCZObihe5plJXcqWJpizoHjjmpLXVdZ970qPkC9r0a50N
	6/8FdRUBiPlop6bAT2hGamo4xdPR3uMAczyd49FYB1uYydFJobVJ+BqmJag27pbxvGFhntaY3FOfk
	sIIekhFFIaoaETCPeSi+AK7G/20vsmIAyz0LkjAbXt01f+lJ3k3hFq1wuPugdACfItZ0WOMvePCFj
	ghpeoLMsa7WP8U0YO3U53RpmC2r3cai+N1svZhtoGeNztwHaydsM+nU0EM6eyPXE/7Bniuf3g6xd2
	beHDNT3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDM8o-0000000CB6B-2Bk0;
	Tue, 19 Nov 2024 11:11:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDM7s-0000000CAtw-0dOb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 11:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732014630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t3CEd+clgPFVRk8eaz+5YffYgqV7UVBEYHjaZLke59o=;
	b=bPFmVp4yW1PEg+oiLD0xS5tkGO/YtjcX4lLnrZYK0fBnAiMhMGLqICY6lffstJ/LwwqHYw
	1BITEHT+WKuCy+E5KEqz1v5WH3xSrFPj9GuBHZU4avyjBaT6mWvDumzcwYJStF9AfGh+iv
	iENLxBn/QVAtNJ/PlCQWmIJmzXwaPm0=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-6WlsIAU5OfOFMLifCwLl5Q-1; Tue, 19 Nov 2024 06:10:27 -0500
X-MC-Unique: 6WlsIAU5OfOFMLifCwLl5Q-1
X-Mimecast-MFC-AGG-ID: 6WlsIAU5OfOFMLifCwLl5Q
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-6ee7ccc0283so46528507b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 03:10:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732014626; x=1732619426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3CEd+clgPFVRk8eaz+5YffYgqV7UVBEYHjaZLke59o=;
        b=Hnr10SsuyjPQDkH+sTlD8yAPoGqxFhr3RKdSY4FFttqHo6jSCqZwoN3aUKglKl0NY+
         2sqwI6zzeQWrcjtSjadIKbnCQZIf37RDrOyWPMpiSXRbg9oRjj5VDJyh29b4qnXqmjnh
         ZTVDXe/uugDhk8QQeehhhXl88dbWwobgjzg0xEA+lZknv+pw3XLF9YhIOnk2cLqgp80U
         c5cRoznlK/xlnh5V7lUmckoeZyum7+UocZZSjz+ZlvWmkVz8NjjFfyeNt3cZSeghLSRU
         7fjrlMhVjqegDDMJCJj66CytU0iZbvsJ4Lk/1uobEZhzuJQTEWrK5XowjBjNRgOOhr/W
         i2hw==
X-Forwarded-Encrypted: i=1; AJvYcCU09rB4RMGH/TvE84tq/mahELn05nkuw6CbQFJ+HGH9zuOGPUpkMzWcY4mOGc1pcW6dgJY5/DckYmNneIRgekLF@lists.infradead.org
X-Gm-Message-State: AOJu0YzOy/fxC2x+yw3nYpiOemes0437Qb6T52MfJUTmNC74INyk187B
	ToBTx1grp1ejZ1CwftDLDbUMrG2hM6fWg4FmWDHKba4Wrrr9gIit06EYT6aod7aM+CDjBmLIIMG
	TwEjdF7MBzc3hjyTbTPLG5eJI8h7bwYsZ504NMeNn+7ykHRRbzoflajB62ZLJNErHwEPTd04y
X-Received: by 2002:a05:690c:610f:b0:6e7:e76e:5852 with SMTP id 00721157ae682-6ee55ca37dbmr168937307b3.32.1732014626636;
        Tue, 19 Nov 2024 03:10:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3hEKXZ8OIPdKHggBClCMhzsNt9PMcc+Km1iy5ohzxrmKycu0tAz1+EM1Xgg8AqAsOXJIVGQ==
X-Received: by 2002:a05:690c:610f:b0:6e7:e76e:5852 with SMTP id 00721157ae682-6ee55ca37dbmr168937077b3.32.1732014626354;
        Tue, 19 Nov 2024 03:10:26 -0800 (PST)
Received: from [192.168.1.14] (host-79-55-200-170.retail.telecomitalia.it. [79.55.200.170])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d40dd205ffsm47067066d6.84.2024.11.19.03.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 03:10:25 -0800 (PST)
Message-ID: <f8c50ee6-a3d7-45eb-9c11-8018cc4043cb@redhat.com>
Date: Tue, 19 Nov 2024 12:10:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH v7 0/4] net: dsa: Add Airoha AN8855 support
To: Christian Marangi <ansuelsmth@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@airoha.com
References: <20241117132811.67804-1-ansuelsmth@gmail.com>
 <20241118144859.4hwgpxtql5fplcyt@skbuf>
 <673b88ea.5d0a0220.17b04a.bc4b@mx.google.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <673b88ea.5d0a0220.17b04a.bc4b@mx.google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zssp4d3bHxdemLnfUbT_z4nkWbeix_r4sOVWYyPvb5M_1732014626
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_031032_259998_FB7E1491 
X-CRM114-Status: GOOD (  15.33  )
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

On 11/18/24 19:35, Christian Marangi wrote:
> On Mon, Nov 18, 2024 at 04:48:59PM +0200, Vladimir Oltean wrote:
>> On Sun, Nov 17, 2024 at 02:27:55PM +0100, Christian Marangi wrote:
>>> This small series add the initial support for the Airoha AN8855 Switch.
>>>
>>> It's a 5 port Gigabit Switch with SGMII/HSGMII upstream port.
>>>
>>> This is starting to get in the wild and there are already some router
>>> having this switch chip.
>>>
>>> It's conceptually similar to mediatek switch but register and bits
>>> are different. And there is that massive Hell that is the PCS
>>> configuration.
>>> Saddly for that part we have absolutely NO documentation currently.
>>>
>>> There is this special thing where PHY needs to be calibrated with values
>>> from the switch efuse. (the thing have a whole cpu timer and MCU)
>>
>> Have you run the scripts in tools/testing/selftests/drivers/net/dsa/?
>> Could you post the results?
> 
> Any test in particular? I'm working on adding correct support for them
> in OpenWrt. Should I expect some to fail?

Unfortunatelly this landed on netdev too close to the merge window. I'll
unable to apply it on time and process the net-next PR as expected even
if it would receive ack from the DSA crew right now.

@Christian, you will have to repost it after the merge window.

Thanks,

Paolo



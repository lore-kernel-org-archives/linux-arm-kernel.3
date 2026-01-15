Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D90D41149
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 09:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbyX5I3XmcBb65h/6RUQRH0oiD3GDHhpS2uLRUVlL/Y=; b=JVlVdQ8HjMdvQY7m9NG7uYMCku
	QxF+BKUrFrHfRvoTA8TTyFmbmbo5jXnNu1xes0lw29CZ1Wh5J/H0Yudm9laZz+bj/QA0ZLnEe5NgK
	pZUqtNp4SMNTVK5viT2dLQUQisoDGiwKxtQkSywuXy/K2QQUFgNPN5SPVFkCqeO73bMXgv9lgdtsB
	TijffoP1yInKdMV0Wj4FxLkUWNHHRFzepVqZZPyvk5Kg5Db1YMzogjtvHYy3QCw9knJHq1dYGhUKP
	Z0rmdFwFJeogDrDZxk8bjKZMTvX9bLzfkVq+Yy9slbqByEK3KkYo8Pp/bns2eMvsBvs3Px0ccji7A
	vOT+GZcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJnj-0000000C5FP-1liT;
	Thu, 15 Jan 2026 09:37:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJnR-0000000C5Cd-3G2O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 09:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768469860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HbyX5I3XmcBb65h/6RUQRH0oiD3GDHhpS2uLRUVlL/Y=;
	b=aYl//qPToN/cJ6yM1jx0vbmF57kCkD7l7Ib5Jow0HugKwdY9F6hMxgzwNnMaXvSX0TsNiW
	OoSWB01RMRa+H08M+DvQMCCtuk+w9yyuI3nnT86EF/njrxAod6odzVrBiRTAHE1R7+qI3e
	lF0DTEDrXCh4cMkm5ZuStfevxOvw5yI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-U62dCprUMIOsk3ahldlIsQ-1; Thu, 15 Jan 2026 04:37:37 -0500
X-MC-Unique: U62dCprUMIOsk3ahldlIsQ-1
X-Mimecast-MFC-AGG-ID: U62dCprUMIOsk3ahldlIsQ_1768469856
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4775f51ce36so5991085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 01:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469856; x=1769074656;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HbyX5I3XmcBb65h/6RUQRH0oiD3GDHhpS2uLRUVlL/Y=;
        b=CefPwdLBCE5+7k1KID3hiPtC5+pb/8wqR1gsZR1cRzN3om0FyoAS3zMra0Rmwk8vjH
         JbjtaSNYCPo+y6dpQsIgK4wHxCSL5EEZi7E4iIl5Z32NYmeHf7UlevhhxykcEquE2vRq
         4ryaSdg/v5dtDNGVG4lFVw17WSWQSMdrkOLz8BpLDXy9P+6g2NGWx2m3A9fR5UUycBbq
         Ea6cj3OyGpP4E2bFiiK5IaW5Yeg1HYFrPFkd18SWPr3YFzBLh1aBGSoTu/sndFAf3lrc
         /dxt8Z5ggMy0PuUpqKoVhSbfR3l7U+5+d4OhoXbOOh+c6uMI0vneRX6Bv1B+uqES8fjZ
         uynw==
X-Forwarded-Encrypted: i=1; AJvYcCX2IbcR8WjbLm8udVbee3ION+HeFOLSki7VHyKF+xJCo5UXdqMJPfvv6/XwUdvtUI5DNthYxP77zzkUR65GS347@lists.infradead.org
X-Gm-Message-State: AOJu0YyMFlSSgU05qOAwPpsYGSo4WXssTiMGoqmAb4sgh3YMuQJ7U+3K
	vaOhv/e8C+Hwp4Dk0LtmfbxgWUcIiHnGXYJ/335A6TU5X9pzqqxsDVjRrUk516fRjMQP/rDt1pw
	hi0/HcNJJYk22WNwuhY0n9zKl/M3Q6sJ3AIyAPdp5hCe9kynK7vsdlAGcLx5UPG/L7pipSOHssm
	FI
X-Gm-Gg: AY/fxX43C6KVC+r43ZBXv4uSyYNZ94KVRXtNUPIE+wMsSWXktloiRnHM0hpeGT9kPUc
	JJtNnViujr1AZQJ2NDToHaY9TG6LltJ2Oin/SkfS89/mnQr2E4Jl0X+savdJ0NRjF+yGybvaBBc
	+FQfJN2tN/pX/OPlUuxuUwgJ3SnsrxRCjH4dFhDyVzkdjCg8f+2VgdGKBeJv9Uc7prDfbqJ6Cx5
	+VTd/cMeqNWq3PkIt4vOn9kns5CWIkkNsxDM64EqB8QiY1hF31LJVnV8yzxJrHIZbMQUeNIgipn
	1e1G0HIDmtiaZP21MBtK0W136+T7UsC+amOnbBygaBPeRpgFoK993Xdgs7r3sima4pQofi9pze9
	DsrVPfy+XWELh5A==
X-Received: by 2002:a05:600c:34c3:b0:480:1a3a:5ce6 with SMTP id 5b1f17b1804b1-4801a3a5f92mr13914175e9.14.1768469855736;
        Thu, 15 Jan 2026 01:37:35 -0800 (PST)
X-Received: by 2002:a05:600c:34c3:b0:480:1a3a:5ce6 with SMTP id 5b1f17b1804b1-4801a3a5f92mr13913865e9.14.1768469855311;
        Thu, 15 Jan 2026 01:37:35 -0800 (PST)
Received: from [192.168.88.32] ([212.105.153.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428af0c7sm37233455e9.4.2026.01.15.01.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 01:37:34 -0800 (PST)
Message-ID: <173d1032-386c-4188-933c-ca91ce36468f@redhat.com>
Date: Thu, 15 Jan 2026 10:37:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 net-next 05/10] phy: add phy_get_rx_polarity() and
 phy_get_tx_polarity()
From: Paolo Abeni <pabeni@redhat.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eric Woudstra <ericwouds@gmail.com>, =?UTF-8?Q?Marek_Beh=C3=BAn?=
 <kabel@kernel.org>, Lee Jones <lee@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Vinod Koul <vkoul@kernel.org>
References: <20260111093940.975359-1-vladimir.oltean@nxp.com>
 <20260111093940.975359-6-vladimir.oltean@nxp.com>
 <87o6n04b84.fsf@miraculix.mork.no> <20260111141549.xtl5bpjtru6rv6ys@skbuf>
 <aWeV1CEaEMvImS-9@vaman> <33ff22b4-ead6-4703-8ded-1be5b5d0ead0@redhat.com>
In-Reply-To: <33ff22b4-ead6-4703-8ded-1be5b5d0ead0@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FT_bgnqXPdrH265qXPF4R2-uWa1rzMV2cw1_uT7CX2E_1768469856
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_013742_007334_3806FF37 
X-CRM114-Status: GOOD (  14.68  )
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

On 1/15/26 10:34 AM, Paolo Abeni wrote:
> On 1/14/26 2:10 PM, Vinod Koul wrote:
>> On 11-01-26, 16:15, Vladimir Oltean wrote:
>>> On Sun, Jan 11, 2026 at 12:53:15PM +0100, Bjørn Mork wrote:
>>>> Vladimir Oltean <vladimir.oltean@nxp.com> writes:
>>>>
>>>>> Add helpers in the generic PHY folder which can be used using 'select
>>>>> GENERIC_PHY_COMMON_PROPS' from Kconfig
>>>>
>>>> The code looks good to me now.
>>>>
>>>> But renaming stuff is hard. Leftover old config symbol in the commit
>>>> description here. Could be fixed up on merge, maybe?
>>>>
>>>>
>>>> Bjørn
>>>
>>> This is unfortunate. I'll let Vinot comment on the preferred approach,
>>> although I also wouldn't prefer resending to fix a minor commit message
>>> mistake. Thanks for spotting and for the review in general.
>>
>> Yes fixed that while applying
> 
> Could you please share a stable branch/tag, so that we can pull patches
> 1-5 into the net-next tree from there?

Vladimir, could you please re-post patches 1-5 after that Vinod shares
the above? So that we don't keep in PW the dangling (current) series.

Thanks,

Paolo



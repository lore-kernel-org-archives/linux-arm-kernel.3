Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFE0D41149
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 09:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CUscDU6UaJzLMrwM7wJMVQOj4YBDvGy2zrior6L6Cw=; b=lg4lpQ8GQjkScUPxP0zB9kfiWq
	tZIzGmzOiEn5DBzpnlDLn9eMnVj76NXqDh2zkXO/kppl2Bdff/9+XLDYJVU0riQsa3jKW2r7kVZp6
	MIZfWdYgaPyhrbAlETYeB8o8rDktX5o1GtZmAQv1AfSK5XmydbhUTdtYeuq69ASfi2jZFeeH5HXuY
	AXWWC1w7a2hboDvM/KhOchU09Ikod+Ix6YdBQLhZpBzqkXEkmStaoWM5+jexeatrbkWlSufdxQ+Sj
	In/XNuQGTsACN+ZravbS3P/7PacPKk1KD7Qh5O4YfMxrVCgMNsfel14Rk6bzOnmRwo2YK/zQQSc56
	QpLcZ7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJkj-0000000C4nS-0Spu;
	Thu, 15 Jan 2026 09:34:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJkf-0000000C4kl-2nOS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 09:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768469687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5CUscDU6UaJzLMrwM7wJMVQOj4YBDvGy2zrior6L6Cw=;
	b=KvNWvnRcWxqYiqCCLA1qbeXHb1InoOe2IZhf5dk3IkrEQtI/HtuuI/D7QypC+xHoNVqLHQ
	iRkFZ3lpdMS1fZnPuOH2EAokXqV5Kih5cIGEGWFhpGPvnGetoUKLE0lfMF9kEwPnsmT4QR
	EwNs3dzB21l7DM0DeK9191BTjSL0ST8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-D_H9Pu77OueoNTluH4Um2g-1; Thu, 15 Jan 2026 04:34:45 -0500
X-MC-Unique: D_H9Pu77OueoNTluH4Um2g-1
X-Mimecast-MFC-AGG-ID: D_H9Pu77OueoNTluH4Um2g_1768469685
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-477964c22e0so5202925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 01:34:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469684; x=1769074484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5CUscDU6UaJzLMrwM7wJMVQOj4YBDvGy2zrior6L6Cw=;
        b=fho/DzMS6qb2mwwWPTACHIxDnCIo/yBo1gHRcN4dMoow4eXpbrJReD1CuHqvEwwpby
         HPxsjMvZB2lh0i+cF3dNA23Kx++9xj7fL8UtI10ivm3L0IWNMFiieS1Gbi57I6AJ4XCv
         dt/4AOtFv+Kn2Ddy7+yCk30S4MJJH/Q3/MQR/EJSvDCGCn9C18w+vHCxeJ0QwzrOHFVP
         JkfVMG2FP1T8YtuWf5l0kgbxLLxBFUegr5h3D3OsrupHpgz8q0iwQR+lqZWNqvRpuQLB
         plM8GLadkeQXDO8olAlswZOgn3+DpIQtluPiH5Ni+DCGd3RY83CI0nFRJbDIB346/I4a
         2vjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVei2qQ4zZS+jGk8kdHpEqWqf3JGGdMb1r/gD9o+C+QjTLXJD29X6W7gnM1gHN17A87P4zbsZv0JNwq1Pf3DBdu@lists.infradead.org
X-Gm-Message-State: AOJu0YwfndulHWR+ncw/wBWDqdVHnaxpNz9AlzKICIFsZV02nTci0MeL
	3sBM/qABqWFRIVP8aIxauKvdPbjb/kTDFRbqRGZB7fumuE+7IGFXUdG+ET8C8j+RdTEjhUyYxXe
	m1pQkd45MDRKefQMqG03/ROX3Xvahuu78tfprJ37KLIMq7MYgm23guXsL81sm4SiYb2rUZJ9cTi
	Zq
X-Gm-Gg: AY/fxX6aKeXNVqQeCkfF/se3nWm09vBlVEQukbItH27w+gLPVhLv0c3Y1knHVVzqBNg
	DY//F2lJNkWNe4fU5y1EZZ8ZezJr9NwRIwBJhF7Xu2YVwOvy3EXY5JNyPVBLPlp9ACLgiITVeW0
	cY6Rj8055ojhWEXM7HHlQaw3q2me3V5L5eTaW3MnDmdjTaGKxlUJI4kxxbqrGVgT312xd+ZYSid
	6Du5DnLCgVYil5CUyn4i0sqcTC+3ehBCk4cy1BuPz8FQTHjq2+3MxSo8oHSDrDjwdMkfBDyQdWz
	I6lVLrtcr3JDEgkfNsoHaJUGcMFcBPeqYo8xmQPKhMfVDVHtq8lk2cHsI1mMqEoj/VfhE9DP/eo
	3R9K+9csb0OuBmg==
X-Received: by 2002:a05:600c:3b82:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-47f428f7447mr30633345e9.15.1768469684614;
        Thu, 15 Jan 2026 01:34:44 -0800 (PST)
X-Received: by 2002:a05:600c:3b82:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-47f428f7447mr30633005e9.15.1768469684215;
        Thu, 15 Jan 2026 01:34:44 -0800 (PST)
Received: from [192.168.88.32] ([212.105.153.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428afd9csm37134515e9.6.2026.01.15.01.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 01:34:43 -0800 (PST)
Message-ID: <33ff22b4-ead6-4703-8ded-1be5b5d0ead0@redhat.com>
Date: Thu, 15 Jan 2026 10:34:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 net-next 05/10] phy: add phy_get_rx_polarity() and
 phy_get_tx_polarity()
To: Vinod Koul <vkoul@kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>
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
 Patrice Chotard <patrice.chotard@foss.st.com>
References: <20260111093940.975359-1-vladimir.oltean@nxp.com>
 <20260111093940.975359-6-vladimir.oltean@nxp.com>
 <87o6n04b84.fsf@miraculix.mork.no> <20260111141549.xtl5bpjtru6rv6ys@skbuf>
 <aWeV1CEaEMvImS-9@vaman>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <aWeV1CEaEMvImS-9@vaman>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Kd71J0ArCbrLfQBJdL2QFBciTBq2VexlXtTT4IZZvOk_1768469685
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_013449_772057_AC91A839 
X-CRM114-Status: GOOD (  12.59  )
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

On 1/14/26 2:10 PM, Vinod Koul wrote:
> On 11-01-26, 16:15, Vladimir Oltean wrote:
>> On Sun, Jan 11, 2026 at 12:53:15PM +0100, Bjørn Mork wrote:
>>> Vladimir Oltean <vladimir.oltean@nxp.com> writes:
>>>
>>>> Add helpers in the generic PHY folder which can be used using 'select
>>>> GENERIC_PHY_COMMON_PROPS' from Kconfig
>>>
>>> The code looks good to me now.
>>>
>>> But renaming stuff is hard. Leftover old config symbol in the commit
>>> description here. Could be fixed up on merge, maybe?
>>>
>>>
>>> Bjørn
>>
>> This is unfortunate. I'll let Vinot comment on the preferred approach,
>> although I also wouldn't prefer resending to fix a minor commit message
>> mistake. Thanks for spotting and for the review in general.
> 
> Yes fixed that while applying

Could you please share a stable branch/tag, so that we can pull patches
1-5 into the net-next tree from there?

Thanks!

Paolo




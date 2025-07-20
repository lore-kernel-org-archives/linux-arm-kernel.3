Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E909C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 15:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZhSlIzB6MVuqbW9qSicrU8zQ+g68g+LUEKaipuQGk8g=; b=U777KSvtjlyP8Yx/sXs/AZFwj8
	l52Kvr7G3Am5UCdMRgTsVRiYUHD2yHlrQlQOmPzuuxOuO8uLhSdAX8AskBPRNLhyLnKNpCdaqzBrn
	7JrP5b1fnC+J4MUbgy1i6nBorunRTwOKNXjK8vJ7xvA3wKua0bIxp9P5SbyvUvPGo/vrOvnmoJENP
	5xPxgaTWVOn3sinUeY+xKl/8rxXqenins1FgdQFZoy/neVE1rNmAZgmK5gCIwDXkpTBxIko+hRLGc
	tHoesQKGupv3hBBgLUUD3yC15ynXm1F6DTn4k7oPB2qP2j1d7mSJryhOcGvgryVWLtbJ0rCSTqnyV
	9/DWN6cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udWMQ-0000000FTZ3-017j;
	Sun, 20 Jul 2025 15:53:58 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udWJy-0000000FTSs-1a0b;
	Sun, 20 Jul 2025 15:51:27 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4561514c7f0so37035675e9.0;
        Sun, 20 Jul 2025 08:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753026684; x=1753631484; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZhSlIzB6MVuqbW9qSicrU8zQ+g68g+LUEKaipuQGk8g=;
        b=PRQfJFcsfUGNXobt4efQzaOPUMEwIkjNmdlzdaCN11/DnmT7U8vgv/5bITdjVbjtmh
         dpjrBOo2GZ+UumUy1RozJE0MYSl58OLNr38nxAG0ntJDvWcV2I1PSQ7eIQ/ei3gO/h3I
         rISk66ZqGEIzYJK01RJHi7rVOP6kd7nSM3rLIRtCN4uUMuMJH5UyPRn3H7+zq0Lv7vkJ
         uhK53wmDYhKPr5sCErZ3kHn0AuuPm45Avcx7rcM6DLPPIv0CFECTOBSpv+7RJZ8V8dji
         prynNONfswSfDokGC3mbWPzOoBidt8o2XAL5Q2hs9+XMxdzMwz5TmjW0ums+uCvYg1ug
         PUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753026684; x=1753631484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhSlIzB6MVuqbW9qSicrU8zQ+g68g+LUEKaipuQGk8g=;
        b=IklnOJ+MC8JXkLvI7dYG+rGigzOlR8kVeA17CXozuJ4u4/Mjaq5KqUl1YOrJbiDD2f
         Y3RtLlnSKT28yNcDjkeD9hU2tT/vMEUFFtpsJ5yEdKZUPqzaR4noJxS4nJz4J8O+A9jU
         Z5hTsjRB9hNMdC5wo1ET/JAeYicxEbzLj0IOjncNAZxoXNWokxz9esfNFdHTIhPgdhGI
         daLj3I7miOv1bkUI8CYzyAXc42iZlKWLuHu6WZrC4SPPD8eD43jp73YeT8VN8YZIE3FV
         X0SIgVd04mxoF4g98gyfeImBbVeWJ3YEL+Y4qDCqzEQ+5qdNsb/a8MkdvHVook5thgwY
         vGJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKFtAgkoNvVO0t2tGmnT+I5KeKXif8VFgk8ZnAT44NyLd72ITmy/Pv5gXBpVorAp6S1q8SFhOtmabYefRi+heo@lists.infradead.org, AJvYcCV8iDjIQrMTiPQIj2JjejHF9tP4JJh3BgEOrCfwF340/1ZMp8c7kWGa2O1NZ/LYujNbqKeZYT+YAchGjxw53Yc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi5GqwErvKgLS0lOIqc0bT2HkmL5fREgkuPl9kcqxysQYdMWEr
	pHXCTG9mYkWiiLZhuepXc9MzdIuw1hW764Qxfj2TxUjMCpYvHTHjOrw=
X-Gm-Gg: ASbGncsdpeC+0jnMrI8vAyQIjlVp95rctRFZCUmtIEZpL/r4Fq5hiNb9L+HnyEE6tLr
	7HVKTpU3vrU2431X2ZkIpQLXLSnkCNh1wqxlyz/zr7CUFQIRNJSl9ikDLPLaBu5BfiE1LPzHcKZ
	AxA90TbXhLi4L51xGQgnTFRYasonzCpCBMEXDzlFXIGZccr8YRCEIL3OXTLuGmhUXyH8+bbhgBp
	13qVMVieh9z8jF0jvZJICsu7ALaBukp9NcQTTAAkJ4s3RjcNfyp7fIA2yxMsmbHzRZgK+JPvyUg
	yYUEE36e0zujbfYqOxerxKrIiJPd/NbEPwnY6yjGrMUTvBuxO1Y6SPuwq9eZVRmyB4+u7fMzn2g
	A0nYfcOqDiWovRKMIH5yZv8xzR5lIVpE4luAbNv8CBc9gb40u5IqqLP8egwZW0XPv5WTc
X-Google-Smtp-Source: AGHT+IG+5w27E9q1sMLm5Y1WlTy33FG/bBzJqXE6w27xvGt5x1K2hO4i0gkfmLaVrTrtj/ZKRMJ/bA==
X-Received: by 2002:adf:e195:0:b0:3a4:ed62:c7e1 with SMTP id ffacd0b85a97d-3b60e4bf986mr13518949f8f.12.1753026684061;
        Sun, 20 Jul 2025 08:51:24 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f13:8500:8b91:8a7e:bd07:2736? ([2a02:810b:f13:8500:8b91:8a7e:bd07:2736])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f2e8csm135189035e9.5.2025.07.20.08.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 08:51:23 -0700 (PDT)
Message-ID: <3c83e8cc-9ef0-4560-b6d7-127abab50541@gmail.com>
Date: Sun, 20 Jul 2025 17:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and
 NanoPi Zero2
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: devicetree@vger.kernel.org, heiko@sntech.de, jonas@kwiboo.se,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, ziyao@disroot.org
References: <86814bf6-5d1b-47f3-ad1d-962cae4a543f@gmail.com>
 <20250720134005.215346-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20250720134005.215346-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_085126_424689_3429314E 
X-CRM114-Status: GOOD (  14.08  )
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


Hi,
> Hi,
>
>> Just for the record: There actually is a non-A version of the
>> RK3528, which I actually own (but forgot about - perhaps my subconscious
>> made me reply to this thread). It's on the Mango Pi M28K board [0][1][2] -
>> which, to my knowledge, is one of the first RK3528-based SBCs.
> Thanks for sharing this. M28S is an engineering test board, and the official
> version was later renamed M28K. The MangoPi M28K board uses the RK3528A SoC.

I'm not sure where you are getting your information from, but as I told
before I actually *own* this board in the non-development version and it
has an RK3528 SoC/silkscreen - I just was too lazy to photograph it my own -
but I did now [0]

[0] https://imgur.com/a/6jwx4dC

> As for the M28S board, the silkscreen of SoC is indeed RK3528. [1]
> But then the interesting thing comes, uboot reports it is RK3528A:
>
> U-Boot 2025.07-rc1-OpenWrt-r30114-9b777547be (Jun 18 2025 - 18:35:23 +0000)
>
> Model: Generic RK3528
> SoC:   RK3528A
> DRAM:  2 GiB
> Core:  130 devices, 20 uclasses, devicetree: separate
> MMC:   mmc@ffbf0000: 0, mmc@ffc30000: 1
> Loading Environment from nowhere... OK
> In:    serial@ff9f0000
> Out:   serial@ff9f0000
> Err:   serial@ff9f0000
> Hit any key to stop autoboot:  0
>
> [1] https://imgur.com/a/ddLsnmt
>
> Thanks,
> Chukun
>
> --
> 2.25.1
>


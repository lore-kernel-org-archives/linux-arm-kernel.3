Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665A5CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 22:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0Ob/UE4RTVxiwS8RzGBBRyiZqvn0MV4NxGM4WOAL0E=; b=ZZp1hpKiblL4qDoTmGMhqEC0S/
	FjDqdU/LJwq15PdWJF4cro1H9crqBk1pSnjdr/rTT6yoy5HsiAtKpvc09dDC3oqWh/kUlC44EAo2C
	EmImIWeiw6hdVjEri6lnWUVquy/sFwymITeGgxf6GsLN8Y9p6mCZxkuwaDTDOJfLOFMFZE8WZ7i1p
	Q5JQSDNj4Mj7E7285bP81XOc50p7oFujZwtzG/onDuALHYDS0HuhGIjWDGHNAuaGwDmTOMnUKbcsV
	cgtNEzGoTQ/axuKONXrNT1bs3xGKJx9ck30mV4D0U3b/rtQHOIZMtXvkAQ3UeoZfawDO6Iy0rQ1Xo
	wELWEdGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uydmA-00000009KPM-2Ig0;
	Tue, 16 Sep 2025 22:03:50 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uydm7-00000009KOd-3k79
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 22:03:49 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b04ba58a84fso816295366b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 15:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758060225; x=1758665025; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o0Ob/UE4RTVxiwS8RzGBBRyiZqvn0MV4NxGM4WOAL0E=;
        b=EreE5Jm3LibfG8xwkEZ3ZiAQTzdWa0ueYmqrt/SNn+eKAXr7FpTPsBHHTXAECRJLco
         Swt+IkUTomzUTgCh7unWgA8cu3uKFeafR12Lfido9Wj9QKJ726NbGnMQTBptTh5+WEz9
         zTr7dXwOrNbhkmcFTkGt8JJP+VgsgY/WP+IK5dMCAiwiVyFHqxm1PA5llFthI9MLeAXE
         V4qfxUS+9N8OpPjZmuloSdO0Q3A325HeGBChgRXjLmKJzMuXpI0/RMh1VXHd5Bzz7dzv
         H2W3RSVZbBMJGToQUd3dhQpquWm2NU8ChBvGy18zVSPn4NVGKZubBP9QsHdm553dq0ew
         6dpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758060225; x=1758665025;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0Ob/UE4RTVxiwS8RzGBBRyiZqvn0MV4NxGM4WOAL0E=;
        b=s1DQW5EzRLUHFBY2DAb7w9y/Lpu31I1eIcnioGBxX9mj0Al6nxuRASt4bCOsKIDE8L
         /WzVrNzbt1XFRka+Y5CTRIi+ZazAOIjUjkJmQzGwyWNpwIBK2a48d3Lx0059zo13+m1k
         yNeQfcTMwteoutD3v/RlKZrSWHKFXhzkgyhkpMuCl2CGXDy5lq20zkCeY5aXHToRKb+L
         XtHn+TTMoGbsI0oY/VjDgVyNxH/M32weEVyyPfBduhpxOzJJIlPApB0Fg+YqycZ0vsmH
         Tz1ysLVaXX/BNmqpR7kp6veyHsQaov7ui2vuOJfUClu5pVtBgmPgFdDgVZzQrHzrQY3C
         a1wg==
X-Forwarded-Encrypted: i=1; AJvYcCUT5S+8a9NERTmuU6PscsJ1wz1U7iPe4UublfAUNfLtenNsKdfTLd9bJFvi9GK6XbF5gWoXOww0cyclrTi+HCz+@lists.infradead.org
X-Gm-Message-State: AOJu0YzcZJGcdx2dZINIE6rxoJtkxxS1/mSP5ipMeiEJR9/TgGoDGT6A
	y8It4QF3XfiYtXC0B7uO58vocYFSv85WOUmmdRi1gpLWLnswSUz2414y
X-Gm-Gg: ASbGncu/H4XkLFIz+Kj8j73louILTlavGTNUW5sBUz6yk3ksixAWINozUpfL80pMkHj
	JPF928Z/nRMOC7EFi3WU/kkK5WJR7knoXZPkepSc+dV8tzrfmp4lMgnNMzX1A4+DIOJaxqaV9mr
	DmAVvNWkaCedoX+YbnGQWWcG8yVVwmU4vrBc8nTe/ycKaxaEzN2xpxeeY+xPdy5xY2S5VKqGinQ
	GmYgfhuYIMgfC/BlNkrityMmBtxjWwGNzpQvi1ulGcBhtBGcjyrKU+mWaEP4qVXFQi0hzbc9WXg
	xQ4FQweNH6D7NUHg0V5al50rejiwbpAh39dt4TMg0aVBXoVmT+Qt3FB4mzBs93nCfyfWngWy4tj
	GtOqcW9WpcPqyyUgvLa3W5qbxIVjFYoRb9zWtjo5nZkhA/UnN+Xt27ciZX0Yln6RezCqP
X-Google-Smtp-Source: AGHT+IEQodNvL7Edth6QjxYHTIysPZRAz+uUM7UuZtp4kejKP8E79m/qDu+L/TqlV6RUd269kcVcYg==
X-Received: by 2002:a17:907:9713:b0:b04:8358:26fa with SMTP id a640c23a62f3a-b1bc02f66ecmr1410466b.33.1758060225245;
        Tue, 16 Sep 2025 15:03:45 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194? ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b30da43esm1237094866b.14.2025.09.16.15.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 15:03:44 -0700 (PDT)
Message-ID: <235312e0-b912-4e10-874a-e6364131aaee@gmail.com>
Date: Wed, 17 Sep 2025 00:03:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] STi device-tree display subsystem rework
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
Content-Language: en-US, fr
In-Reply-To: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_150347_949756_24658ECF 
X-CRM114-Status: GOOD (  16.41  )
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



Le 17/07/2025 à 21:15, Raphael Gallais-Pou a écrit :
> This serie aims to rework the display-subsystem node, which was
> previously included directly within the SoC node.  This was wrong
> because it is an abstraction and describes how IPs behave together, not
> what the hardware is.  Instead, extract display-subsystem outside of the
> SoC node, and let IPs describe their connections.  Doing so helps the
> readability, and eases the understanding of the hardware.
> 
> Several nodes have been renamed to stick to the generic names defined in
> the device-tree specification.
> 
> This series depends on another sent a few days ago.  It is not critical
> though, since not having it only triggers warnings when building
> deprecated device-trees.  Please see link below.
> 
> Link: https://lore.kernel.org/lkml/20250714-sti-rework-v2-0-f4274920858b@gmail.com
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
> Raphael Gallais-Pou (4):
>        drm/sti: check dma_set_coherent_mask return value
>        drm/sti: make use of drm_of_component_probe
>        ARM: dts: sti: extract display subsystem out of soc
>        ARM: dts: sti: remove useless cells fields
> 
Hi,

@Patrice
Would you agree to make the device-tree patches go through drm-misc 
instead of your tree ? So that the breaking change lands in -next in the 
same time as the driver changes.

I will send another series to convert display subsystem bindings to DT 
schema as soon as the series is merged.

@Alain
Do you prefer to merge it yourself or you rather let me do it ?

Best regards,
Raphaël>   arch/arm/boot/dts/st/stih410.dtsi | 316 
++++++++++++++++++++++----------------
>   drivers/gpu/drm/sti/sti_drv.c     |  18 +--
>   2 files changed, 192 insertions(+), 142 deletions(-)
> ---
> base-commit: b9a572f471993d3e8bf874fcb57f331d66650440
> change-id: 20250401-sti-rework-b009551a362c
> 
> Best regards,



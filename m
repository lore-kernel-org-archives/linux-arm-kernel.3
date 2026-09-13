Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212BFC88E63
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 17:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AE5k/kG8YJbF9+P0eXSyvzyutUhB0PHETgWhH6QKTKQ=; b=0FMlHsAKCR+y3RO3OkQ0qSyeT4
	lUG01J4el6qCsiN+TemCkx98OU8pJVmDMy7M2PDW4XqRKahjy8GejPL7Y5ZEnk4mOBVye3IxURGWo
	qYCGGNxtxwtAr22/8T32U6/7PLSc0EfOs3MIfbdV5EOola2+DlCEmPPHKQQ+juWl9GPa6m++w9+mZ
	h9alVjfeInzEjdx0Y7UGCK4Uuzfun8Ew/bPtPvk/aRoUvL0DkpNAn0ZB/yfKkmvXhRDd4H59gY3Et
	asMs3U1LZbhmWOiNfJuj9ZKbQWVVxD+2BB0HW7HzyJsIcAlsYaUZir9omzW8IPzvmoPZimvBq4C/H
	j4/vROEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5nvn-00000001rE0-0emN;
	Sun, 13 Sep 2026 17:23:55 +0000
Received: from mail-oo2-x03.google.com ([2607:f8b0:4864:31::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5nvk-00000001rDK-1N9P
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 17:23:53 +0000
Received: by mail-oo2-x03.google.com with SMTP id 46e09a7af769-7f4ebb7b327so744565a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789320230; x=1789925030; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AE5k/kG8YJbF9+P0eXSyvzyutUhB0PHETgWhH6QKTKQ=;
        b=lmw7ojvqkUGKLO7+le59GUrq1pqBv74lu7zo42JMv4xIykd7U6k2p+EAujPRdrjqkT
         FLRz5jCQDF+hYF9TQu3QWJT6NDvxNqLAZc0h1bNXnmfUOMfqmQcsLwfT8XkjO8y0W0i9
         q24DXIZwgCDA/A2M9ISRRE879LNOpM1JRo7XsD81RFYVcsKwN3gqUmSv+l4xkaLEPEtU
         9668qPeZfVSL3O4zJ8ebwxAitODYsyzDIRgd/wRzVjO46A6MitTmDl72xnVVwcjUB8lb
         Nz41S8Yd3Bql0j55Gq8KKvn10JXyPfyMlF1EzT+H71t85g9sR9+Hyt99Ha5Xuv+6fc9/
         5Ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789320230; x=1789925030;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AE5k/kG8YJbF9+P0eXSyvzyutUhB0PHETgWhH6QKTKQ=;
        b=FymTNXpKW+ysL8LVSkXw1x3VSLAYVJy8N/AA3etsF8HxHgLVCjVrlTX9TCJb9C0uk6
         qveUVLyOz4ucEnWYZInOQOSHsHuKy6fEyCgRr8l3pa3Ct9ELmLWEg0z6Xk9ryT1yK/tK
         7Yn9HO3bCPGdncWlLoZ9A1mmEGTeXJaKvViNpO3a+sdLsTnv/BzruhHyMFwxlOADkVR0
         JINp9ciOyb77Hlsnu0pK8eoUuGYNx/IWW0csDCDL2f3Q3N239pPihxQwq0B/LmrGrIh+
         W/F2TnXOHrAHcFy9bN9LxSJwaP8xNkVPQnMxtEUYWubUPwOEB4iUeS07FKgLxjQFExO6
         pOtg==
X-Forwarded-Encrypted: i=1; AKwUvBwHy7ZKHpLeYI8EyZmdAlbRNpNKPWyVsd1X6Xavk+r/MLCLajtysaz8kN9B+0/Vpt72jRLS3ricnq1VG6+T5hLd@lists.infradead.org
X-Gm-Message-State: AFuF++lVwjFtdEKbVQTA0s8VAcxXfMn/KZp5LNwO6uotG3jWcTUw0har
	s79Fy32FUNn/NU6OAwOIC3J8cO4Q1JrWQEAy/OSx6fmaQmr8KggPlGY4
X-Gm-Gg: AYBFou1EqxLN/qR17Pz9xqQwm0lfQt1PyokfRAL9vY+vBJfstydBvF5JdD4m0OBZSC/
	a4SpBtMG1YF1J4tMUys1t5tXGogSBa2U4oGEYLhOw1sYLcq/yDzR0PjXu5onOYVgQ4XxiwnECoX
	Lf9Qr1oSa2C/AvPDS+OW6qlyv7tNqJhrJsgZxDpAhuSXIS4ru60E/2LKQmym8xd9ey4MMG1+5bJ
	s6C8UaYE+MdbVhNhhGk5Xh3NCtZEJVFBk6MXhvJ7u/Lx04LhptLFBGXT1ygSlpezJL/kc2NcwOe
	PQBy3yxy/X9bjSdOnmIrhvyktMLyNgsiRFBNI4aPE5MQ4MN4NAygggM7JusXgWLpPvdtjLB9A0H
	RbYGOf/zUAhBC+l/BxpIcidxMF2J0oixo5qVyFbTJj6YZw9JMJWHIpQCR5X5P+42SQkTxQWaKNy
	UJDlQOE31OhQy01qtwtHiSIwhG+FpxpbHaOaRjQHvLeo0f+IzPy4LQdDyDmrasQ2BiwZ1omuabz
	+7zynaO6DWNQLO6
X-Received: by 2002:a05:6820:3411:10b0:6ba:5d2e:cdbc with SMTP id 006d021491bc7-6c0b9d4e352mr11117155eaf.7.1789320230280;
        Sun, 13 Sep 2026 10:23:50 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8bc8884sm6899818fac.10.2026.09.13.10.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 10:23:48 -0700 (PDT)
Message-ID: <2ac704f5-40e5-4212-8b16-6b23912ef4b8@gmail.com>
Date: Sun, 13 Sep 2026 12:23:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Novatek NT51021 DSI panel IC driver
To: Nickolay Goppen <setotau@mainlining.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_102352_379335_1955DDF4 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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

Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # Amazon Fire HD 10 
(2017), boe,tv101wum-nm0

On the CABC teardown for the nm0 variant that Sashiko found: the write 
is a single DSI generic command to the panel IC just before it is 
powered off, so there is nothing on I2C for it to collide with (the 
LP8557 backlight is a different device and is already off by then). On 
the Fire HD 10 the full disable/unprepare then prepare/enable path runs 
on every DPMS cycle and system suspend, and the panel comes back cleanly 
every time. Skipping the call for variants that never turn CABC on would 
be tidier, though, and I am fine either way; I'll let it be your call 
Nickolay. Thanks for pulling in my patches!


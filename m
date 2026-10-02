Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA8DCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WV95wAdEBW1v5k5upi/D6jheWF0Dkl/DxQsG1HnT/70=; b=eHku2mrRoq8ti2cBCcsltIQeNy
	z4okKPWD/r1/g8EiL5MZ6aslp9zYnsGecT4lYw0mUojHEkTxOsvTyjJuGkGeC4CYtHjSnmGd6mqKr
	Z3ZPKLGYmqu61u6RqlHwl3i6PLmdQmqrUwYJh1JWAEckIM0sUdZmjifGjvXWZ4UleT6tJOVk9ngyW
	EBMQZIOZpFljO0HMf1XVFdwR+Y4b7GPVAl1xLGZ9EjoG897QcdgUBblnWDO4n6yZjoBwDosBo+moF
	ZA7xsv4lK4VlxmbihvRyYLCT697aGztxcjKXrQj2eP4wEOCrb9OORAjRFSNXXsviZWI8T9dtq3JAr
	563JGREw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXq0-0000000ArHK-1Ve7;
	Fri, 02 Oct 2026 07:37:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXpw-0000000ArFv-3NhO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790926662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WV95wAdEBW1v5k5upi/D6jheWF0Dkl/DxQsG1HnT/70=;
	b=EWZxQ6cUE+CJ2uDDFjubjrlIYY3GLy1X3MSekZmdFl5YK8f/4AjYbqTi4QyihkvNhqF8sI
	dhhodhftzhl+TX36Gv3/kWKRlQgDqmYo0wLHC6ncbliWu0yr/wWoLTOkmp2rRYM4qY+M4Q
	SveOuTxdK2aI3nfi2aaXSjWMBZM0gao=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-CrAuNFr9OoOFwjS6YehPcA-1; Fri, 02 Oct 2026 03:37:40 -0400
X-MC-Unique: CrAuNFr9OoOFwjS6YehPcA-1
X-Mimecast-MFC-AGG-ID: CrAuNFr9OoOFwjS6YehPcA_1790926660
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a0761224e1so4343635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 00:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790926659; x=1791531459;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WV95wAdEBW1v5k5upi/D6jheWF0Dkl/DxQsG1HnT/70=;
        b=gUcQrrvlPTOHiahPF9gksBPeIM5xMFdiU16JOJ1dgKY7vAMLBOeBl8JSNb71RLWr++
         Pmw3tOieRcnM4OlCcvN7Us8Pt1xBA+cLKyahG1ZNCxnt0g3AxOQJpKBEzEuGpZdrGt4/
         iRje0xYiACzno5D83u50GYdu6fINX1wlikyWkWJBy6eokKPgT/jO6kpHnxCZkmmj07m7
         P15hrcE3D8MzFuqrSl3uyU6g5BIV+hCCRBJsytvPv41VwUmyAP7FdVwOQClQNYFyvuht
         zYKJbhsb5wtUZsBysu/dEeRD5289tRT13nY+nl3nnRF0m6DJ1//XLipOVZ2U6oelaWs1
         mocQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmt+fFyTnEHrL48wLX0C0L/ccE91B3bigsosQzMiHT2TTcqubdgZFuCsx0+GRVR8mmnfst3Cgu8s+rqYWmtmH0@lists.infradead.org
X-Gm-Message-State: AFuF++kfqmFfxLvEa4I0e4+5tBVeDbpcNIQvQScHYFP2iuluGnh9W9NW
	T0ZmlDdEcogBm315JbvPT9Dn30/ixs5oOX5UWVq0kJ6S/7alHkwGqGSWh0Z9/c8fFsmCAQXazgY
	QgUgSIeVcf5NPqzfmlJl9mdjlkHtqgiOLmmflV/YI+REwYBiGRrti5TKTUK3qIdjkZ5IeMOAW+3
	ig
X-Gm-Gg: AYBFou1hN2BdEvH8+7OqBhu//yTyogKoXoq7tsVqGOVydr9JRFpO+1z+UXiJcjdbyqq
	TWRao66zFAGDjjuKABKZpoMAbYjRUwxa2R2sdGslz0XGMjQ4PgWtgKR8viEZgzBlrcfs+8TjA8G
	JsT7TbZEncwBWKGbQgjYQmsoyJYwWAEQbmSHm7KEEI/tHwGjfEJAEZS1SyYCyMRzm+XmXe+72Ud
	LmAR0A3vOLlydU0nq6Z2JlFbH6q+mV+qeu45dm0jZv0LJTBlDtENE8tpXtjwfuE2fLbkfRPJL1h
	JK3rJIKeiGBCcKmGNf9KV5R8RHGi6+Xzo5GFc1TTLyoKuDJP/bm/AIERowmNfC+Rk2GDA7/Pcmw
	l4u7dE9jRN6c5GRCaSuP+U1EaYbhNxt4HQegoG59uZ24RyXYbfOG1Kfn3gL82d/HDOQ==
X-Received: by 2002:a05:600c:4e8e:b0:49f:fe79:62f9 with SMTP id 5b1f17b1804b1-4a0276afe79mr34251235e9.25.1790926659490;
        Fri, 02 Oct 2026 00:37:39 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8e:b0:49f:fe79:62f9 with SMTP id 5b1f17b1804b1-4a0276afe79mr34250535e9.25.1790926658971;
        Fri, 02 Oct 2026 00:37:38 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027da120bsm63581875e9.0.2026.10.02.00.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:37:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard
 <mripard@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jessica Zhang
 <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Albert Esteve <aesteve@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
In-Reply-To: <2bd17843-4a65-49b0-9e10-7b73afb206b6@linaro.org>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org>
 <arqhwHiVf00j94J7@beelink>
 <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org>
 <arrAqg5n87INTHE6@beelink>
 <674314b4-6b80-4b3a-ac15-eefd31cea607@linaro.org> <artpBMeM13Dd0lLy@houat>
 <xlv1wls4ebjq.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
 <828c9108-2db1-45a6-9301-19159a094301@linaro.org> <ar4CRTMQGs5_nGKY@houat>
 <2bd17843-4a65-49b0-9e10-7b73afb206b6@linaro.org>
Date: Fri, 02 Oct 2026 09:37:37 +0200
Message-ID: <xlv1cxtsft8e.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g4BXSBW9m4yDSTvcfiylzhVFUj3r4lpEjtNHXyr5HvA_1790926660
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_003744_918122_B4A3778B 
X-CRM114-Status: GOOD (  12.71  )
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

Neil Armstrong <neil.armstrong@linaro.org> writes:

Hello Neil,

> On 10/1/26 08:50, Maxime Ripard wrote:

[...]

>>>
>>> I don't want to add a supplementary maintenance burden for the sake of using a cool
>>> technology which has serious drawbacks and dependencies on user-space even if looks
>>> really cool.
>> 
>> Spoiler alert: v2 won't. I've got the in-kernel loader to work and thus
>> you can have a built-in panel driver that works without user-space
>> intervention. So this is not a topic of discussion anymore.
>
> It will still have users-space dependency, meaning the BPF files will need to
> exist in the fs when drivers probes.
>

It doesn't have to AFAIU. The BPF programs could be built into the kernel
image, just like firmware binaries could be built-in as well.

> Neil
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0D5CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAmOlflbJV02//t0PYsWYtP2AS3mBRNwN6t9PgpiJVo=; b=pbgNl4boD08eCEJrweKGuPOig8
	Sii9uBs3EojeRqqNx6LXpj1VKw0jR9/ahYOjlHiwRF+usPg/VjI80vSpYSOlJOaPLxCTlGAIMni1D
	D2/e0CUcpDmHs/JVrKi6iFcXDa0eJjgNtvTvJqTY8RkGomQdeqJ4JBcn0vhZTV91Lh3n7Y4fzydp9
	DUT/nqvaq9aqoO+nzCG+1Lr6XU0kdCpaAx7B3Zi2esTWNcjoUx8Kt0WaMk6y1uDydxB/BM3V/kiE5
	EvMrx2O0Sk4R0WxinrHS7KJErMCioQXJZsrBBGBix4iG+jCebQQePjqoi6BNadu3gJKsPHVLGAyqT
	3uZBr7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZC2-0000000B3tD-3Bp1;
	Fri, 02 Oct 2026 09:04:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZBz-0000000B3sR-0kcK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790931874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OAmOlflbJV02//t0PYsWYtP2AS3mBRNwN6t9PgpiJVo=;
	b=D2M3PPrvLpZ+TzeOKPDzqV7ZjLthvpmY4g6hvILX9XZP4D9tMfdazT7S6nkxRmcDnGIUId
	P4lu5WBywK0kI8LuUOrdfLjiM9j1w4fjbGnHD110YqWH//vbMGEzAwfwbbUDwm1ppxOIGd
	R2CLeZjIA3RcGAhpbqEcuKZLH2sKIUE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-NNvnCyIZNruWPVLcZKYIkA-1; Fri, 02 Oct 2026 05:04:32 -0400
X-MC-Unique: NNvnCyIZNruWPVLcZKYIkA-1
X-Mimecast-MFC-AGG-ID: NNvnCyIZNruWPVLcZKYIkA_1790931872
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a004b70f99so32641995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 02:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790931871; x=1791536671;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OAmOlflbJV02//t0PYsWYtP2AS3mBRNwN6t9PgpiJVo=;
        b=VIOIhqes8SYHr1KrQIlIgFwuLdV12nkBw1RQ3R2j/n7OBwbSBnhw89z4Lg3q0b1ytV
         d73vI6JQAwlvBlTYE6Zq6PguSGaxQP2plhveDdYYVUe2fSNMvb4lDS27TrUY8hUdek1Z
         SyFBJb6n7yaILfVhr7oH1Lp03Zv2+30R41sxOxmxBXbk2e9xbWnpMHnxpwY4zn1tn0CM
         J7wVih19VRJG/NF1etYD6iS9REuxNfMlEG1iIeofQfCBYRUL37Adrv8i5FJvSw1Pel1p
         dyenfE6YkkMK6pox4ibUXx6pr3cFZKg893eO4AQuzRlXgE26beZgQlfYdxaDNCrv9DFV
         W0Vw==
X-Forwarded-Encrypted: i=1; AKwUvBxwv8Y4+FvzMEsa8QwNEeKTxNn5ANt8oa5jq4xGxiHs5Q7cVwGVsErlEzE1amI4o9EqxD7U1cPpazPpekyH8OPO@lists.infradead.org
X-Gm-Message-State: AFuF++kRw+LaRMbT4PGKE2nxULHxrwiLBKJqr0WDrJ/jZKAj/OD7T922
	69qYblagAp2EqjyZv/NLbjhuhZcqguR/My1y8GuIUtjn1s1TWqLdbneWrMunGQF24lwWpolLzQs
	86ocpXtnofFXwX4mZKmoWTD2r8SdS92pzpcIhepmvPbY606Shk+xqXnQRhPfIoOwz+Q4TQBEy5+
	If
X-Gm-Gg: AYBFou0z56mC7Liy5voeP/l/VWW17to/N8o+wMSyVnVHxDl4JUIj63wAIdparMc9706
	JlvXHj8l+p26TUmBGMAbs7SOkLekOA4Y9JVxMxrrnDfdoOAhtXC5U6lXmfdN4caPHl3rcfj9V6A
	Cw+60yMsVHmUm+Gw2k+tn1T6a92erSCdipbPXixVKn3HFnMPrB8PjJhr1NuX3nmIn59y6iMLJig
	8H5VREqylxx7Hgr2JTXBlA/5ynFOHRkxmLG1l0o3iJWKstb7kEc4Eua/JAlYNl6YzqotghbM0EA
	X6QrIelEvQZVvJUrtHGNyUXmlqMVHIrV44uEyNpK84UbG5Fo4kh40XSj/qLIFOeM0nu2sc3r3It
	CAwXrdx7fCfYsllupLzR0lJHmz8SsMiPSQSO2sWbk4AnbcG6O08ckUTDdHfRCleb1xA==
X-Received: by 2002:a05:600c:4e42:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-4a027586525mr39355245e9.15.1790931871177;
        Fri, 02 Oct 2026 02:04:31 -0700 (PDT)
X-Received: by 2002:a05:600c:4e42:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-4a027586525mr39354405e9.15.1790931870651;
        Fri, 02 Oct 2026 02:04:30 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027f2a4c4sm67197175e9.2.2026.10.02.02.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:04:29 -0700 (PDT)
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
In-Reply-To: <a92aa0bb-d50f-4b67-a645-942090d4fe79@linaro.org>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org>
 <arqhwHiVf00j94J7@beelink>
 <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org>
 <arrAqg5n87INTHE6@beelink>
 <674314b4-6b80-4b3a-ac15-eefd31cea607@linaro.org> <artpBMeM13Dd0lLy@houat>
 <xlv1wls4ebjq.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
 <828c9108-2db1-45a6-9301-19159a094301@linaro.org> <ar4CRTMQGs5_nGKY@houat>
 <2bd17843-4a65-49b0-9e10-7b73afb206b6@linaro.org>
 <xlv1cxtsft8e.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
 <a92aa0bb-d50f-4b67-a645-942090d4fe79@linaro.org>
Date: Fri, 02 Oct 2026 11:04:28 +0200
Message-ID: <xlv1a4owfp7n.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4K8ZBhvtJfH-u2vXMoExTX1F6SYilcmQJkDM_t1g2SA_1790931872
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_020435_282723_E31FF045 
X-CRM114-Status: GOOD (  31.18  )
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


Hello Neil,

Neil Armstrong <neil.armstrong@linaro.org> writes:

> On 10/2/26 09:37, Javier Martinez Canillas wrote:
>> Neil Armstrong <neil.armstrong@linaro.org> writes:
>> 
>> Hello Neil,
>> 
>>> On 10/1/26 08:50, Maxime Ripard wrote:
>> 
>> [...]
>> 
>>>>>
>>>>> I don't want to add a supplementary maintenance burden for the sake of using a cool
>>>>> technology which has serious drawbacks and dependencies on user-space even if looks
>>>>> really cool.
>>>>
>>>> Spoiler alert: v2 won't. I've got the in-kernel loader to work and thus
>>>> you can have a built-in panel driver that works without user-space
>>>> intervention. So this is not a topic of discussion anymore.
>>>
>>> It will still have users-space dependency, meaning the BPF files will need to
>>> exist in the fs when drivers probes.
>>>
>> 
>> It doesn't have to AFAIU. The BPF programs could be built into the kernel
>> image, just like firmware binaries could be built-in as well.
>
> Right so my main question still is: what does it solve exactly ?
>
> All the descriptions I saw so far is that it simply moves
> the panel C code to a BPF code with no other additions.
>
> I still don't have a clear view of what is precisely solves.
>
> It adds some complexity to load those BPF driver, adds some
> maintenance complexities since with every API change we will
> need validate BPF still works in addition to C (and maybe one day Rust).
>

https://www.kernel.org/doc/Documentation/bpf/bpf_design_QA.rst doc makes
it clear that BPF programs can't expect the in-kernel API to be stable,
so you as mantainer don't have constraints due the panel API being used
by BPF programs.

In other words, this shouldn't cause additional burden to you (other than
the code in drm/panel/bpf/, but that is also true for any panel driver).

> As the maintainer of the panels, merging a bunch of new panels at each
> releases and helping migrating to newer and modern way to interact
> with panels, I think I have the right to express my interrogations.
>

Absolutely.

> I'm clearly not the oldest kernel contributor & maintainer around here,
> but the main interrogation I have when submitting, reviewing and
> merging is : does it really solve something efficiently.
>

It does. As mentioned, this could make it easier to have some panels
working with an existing kernel without any modifications (or out-of-tree
modules). I wouldn't say to prototype it, because as Maxime said, it could
even be a proper support. But you get the idea.

So just like sched_ext can be used to extend the scheduler (and some of
those extensions might even end in some of the scheduling classes once
are found to be generally useful), this driver could be used to quickly
add support for new panels.

> I don't want people to be frustrated by my review and question,
> but I feel I'm allowed to say I'm not convinced about this solution.
>

Yes, of course. From a bystander, I think making assumptions or taking
a decision prior to understanding the use case is what might had caused
frustration. But as Maxime said, it would be helpful to have these
discussions in person next week at LPC.

I'll also be there, I'm looking forward to meet you in person.

> Neil
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat



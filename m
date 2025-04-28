Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8708C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 10:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucZUAd/InboFfZClRnamk8ZirwH9aq8qtdNhcPq2zyw=; b=GFvi4yYd4iRHtEMY8lq4pxIdpN
	q6vUMoRAxURUMgvTpXOJ4CxTgw9/QzAO0evMmkB5CkYR0tkf+VRstcG4684lbNMuDtEpR9pWADJ+Z
	U7TI5BSN6cIx6zJU0MkpadH81maD9qwYrjCAvzeqgA4H1U6ZcZLydKAGZVERuICeH4lGX/i9xyYue
	3K8OmngM19oCGNCJ0+v01D69mBD6FteZr4yK2doWATsKhUknDhbzihM7VFjDscJ84sFev0Bn6lMTk
	khYsylyetwfMDJmKqDgcbVMW6w3vHjs/lTcA0Av1uOwTCu+X65OPRmqYle7vyw4qkNdOfKrQ2OYDj
	LllRjIdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9LPY-00000005lCD-0fNZ;
	Mon, 28 Apr 2025 10:08:28 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9LLV-00000005kLF-1lJU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 10:04:19 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-6feab7c5f96so41267817b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 03:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745834656; x=1746439456; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ucZUAd/InboFfZClRnamk8ZirwH9aq8qtdNhcPq2zyw=;
        b=CDkyqP8QHAUFatRo+gTb1C6u7xZJgSYB9jN1tz/MSu1swquLJQKDH2dbQbtJz0meuw
         P8+/AR8gkgu2U/ZIKbalhNz3pKwb9cRoTqc7lrNe6r1ufRtrOe3cIDADvuZrZ+qSn9+R
         g/C2i+HkhoLVVIymSIBOW6x1GrJq+NEgQzAf2uxza33xYuRtiZ/NqV97EnioZ08o7VGc
         Pla6qXAc47Rad7yFXfLwBNOkyoZYoxVci7MZQ3gMhAftq+RNxCvzJkK/UdauugeLr6aW
         Rk8ayatcvlzS2sdTLol2fdY0NkFspPXC5T2vsRhJ4MS6wnlLwwwlUlGjUZ7EVVSZzbFM
         C4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745834656; x=1746439456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucZUAd/InboFfZClRnamk8ZirwH9aq8qtdNhcPq2zyw=;
        b=QcnBpkHP+VwoZfyIR21eyPB3AISM+DPr6dV4z88IvR4at/PGJ2wKX/E949emskvj/A
         l1lubymgSymiv7hJkpQ8INnRTyvDoB0Xqt6IdibjYRNNsWB1BE9qpZ80DawsqSyLSvEn
         HhQnG2wxWjF9shRAysbfQGn9QDR77dUf7JKKvA4rAoBIW5QDrGhhYhSYnpvgwNgd4+a2
         CxFUsyUFA5+qWNI3E578IdmIpbv/8HqsEHWSRHhi/Kea5/2Kdfo08vsLzxpZur5csbeR
         UPzGs6orxj78VLPWB7jne95SQ+fK30SoPKRZDN0007yESLJHUp+nkow0Ut+zKNDt+CJg
         FhiA==
X-Forwarded-Encrypted: i=1; AJvYcCXeec/HnL+aNONQjfN2S7u/zjg412zIouiDopmFnqj5RK8E8ssKnToYKbAeuvr/lOvbusAXKMdltaOj9+tZYwbO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9XyVgEeMX0O3gEQWdrdQXktOu3QUQjtlBhn+aJRKVPAGyU7Er
	EUJsUCdXN1Pf0zFdXnpo04tCvRy5YfSxi312tJq+QRgMQkAnOzD/sGBAz8G/Sks5SFHs9rlJ0bG
	4A3qaqu4obSE8D/k+q8myHqGk6iQup61DMThpWw==
X-Gm-Gg: ASbGncujY9aRI2lzOMbVHjqBFX6ArecRmZN4ghOLyQ+VClnXY66UEVV8ntGKmtuCfr+
	50gR1r96LpgMUhMHgNAyC1qyEwoDmvVNQ2m2V5JZFJmcRo22OdKWNC7NJI45C9VyKSILPNIqBd8
	yng2HfPEtUqmXFWg0m0kyxGw==
X-Google-Smtp-Source: AGHT+IHLAwgs2jvyhndbI9eeTcAvfYwmKCKu2Wwt19IFmNuoMlsiM2VhTNy+bvMEOC6zz520PPUY1yZ92SlmTgkYlVM=
X-Received: by 2002:a05:690c:7084:b0:702:4eb0:6af with SMTP id
 00721157ae682-7085f252950mr116417097b3.31.1745834655665; Mon, 28 Apr 2025
 03:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
 <20250423-media-rpi-hevc-dec-v3-3-8fd3fad1d6fb@raspberrypi.com> <20250425-inescapable-beagle-of-bliss-8ae3ff@kuoka>
In-Reply-To: <20250425-inescapable-beagle-of-bliss-8ae3ff@kuoka>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Apr 2025 11:03:57 +0100
X-Gm-Features: ATxdqUGx5uUk2kPmuSg5gFgBWEs3E2SY1xjorpWkszYXuV-kigFS84yL46qfHpo
Message-ID: <CAPY8ntCWzp9cRKwLg44G20jG17q2KhavZa_8qpodhGUGS2Bc7Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, 
	Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_030417_617041_08FD62FB 
X-CRM114-Status: GOOD (  23.42  )
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

Hi Krzysztof

On Fri, 25 Apr 2025 at 08:53, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, Apr 23, 2025 at 06:20:20PM GMT, Dave Stevenson wrote:
> > Adds a binding for the HEVC decoder found on th +maintainers:
> > +  - John Cox <john.cox@raspberrypi.com>
> > +  - Dom Cobley <dom@raspberrypi.com>
> > +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> > +  - Raspberry Pi internal review list <kernel-list@raspberrypi.com>
>
> Drop, no mailing lists in bindings maintainers. These must be people.

Ack

> > +
> > +description:
> > +  The Raspberry Pi HEVC decoder is a hardware video decode accelerator block
> > +  found in the BCM2711 and BCM2712 processors used on Raspberry Pi 4 and 5
> > +  boards respectively.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - brcm,bcm2711-hevc-dec
> > +          - brcm,bcm2712-hevc-dec
> > +      - const: raspberrypi,hevc-dec
>
> Not what Rob asked. You should use specific SoC compatible as fallback.

In which case I don't understand what Rob was asking for.
I asked for clarification in [1], but got no reply. Sending a new
version has at least got an answer, but I'm none the wiser.

Staring at this trying to work out your meaning, you want the generic
first, and SoC specific second? ie
+  compatible:
+    items:
+      - const: raspberrypi,hevc-dec
+      - enum:
+          - brcm,bcm2711-hevc-dec
+          - brcm,bcm2712-hevc-dec

> You referred to file "raspberrypi,pisbe.yaml" before, but there is no
> such file in the next.

Typo.
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/media/raspberrypi%2Cpispbe.yaml
Reviewed by Rob only just over a year ago [2]

> Before you reply that there is a binding using different rules: well,
> there is always poor code. Above two comments are repeated, especially
> this about specific compatible - all the time, so these are not new
> rules. These are given in reviews since some years.

My Google-foo is totally failing with the only directly relevant
mention of "fallback compatible" I find is [3], which just says to use
them.

You're effectively saying I can't take anything in the kernel tree as
being a valid example as it could be poor code, and a layman such as
myself has no way of telling.
Could you please point me at documentation and examples I can rely on,
or educate me with what is wanted in this situation to avoid me having
to guess?

A further mailing list search has brought up [4] which is a thread
with yourself from 2 years ago which looks to be a very similar
situation. Other than missing the const on the SoC strings (although
that isn't in the merged version of cnm,wave521c.yaml), and two SoC
specific strings, I'm not seeing an obvious difference between there
and here either.

Many thanks
  Dave

> Best regards,
> Krzysztof

[1] https://lore.kernel.org/linux-media/CAPY8ntD3Frq5HzV06OrS1051QfjJFzvqs9H4mUkVnd4QKqiMhg@mail.gmail.com/
[2] https://www.spinics.net/lists/linux-media/msg250095.html
[3] https://www.kernel.org/doc/html/latest/devicetree/bindings/writing-bindings.html#properties
[4] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20230929-wave5_v13_media_master-v13-6-5ac60ccbf2ce@collabora.com/#25567148


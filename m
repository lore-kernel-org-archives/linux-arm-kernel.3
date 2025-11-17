Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567BBCE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 19:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0lS2cED24LXASEO8Kaw1E9xKUmdy8WEPj1E8PP+Wtk=; b=g0UHRoWCuCk05X2WMVAogugaO2
	f1fGaOK/bW3LtMhXV6KJQhCKx7EpXSZMOG5G6Tdyc6MUXyqS5BzQZ+Cy6fCljE52UfDE6av5X/YQ7
	i06fHW4OsTAvfmeOFLgDTAXq3OCunUE7TPWeyMTz5nwwnHJG7DYnhgzwmLpIOYEXtie9i3goUQ6JV
	x2h16/4daicJIWwzumkL1CCazsq93qe5Qz/VmBtho2css1oLTRz+/+uPbxgOWy+bLFzZsHb8wVinr
	QRH4lgT0n9URprmOFHFH8hk0eVLHUiJ5ywGLZUac2PW6KILAqsG/73k9uiiHVXf+h197RMSdcrNtB
	RJJRRVUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4T9-0000000Ggsv-1u6m;
	Mon, 17 Nov 2025 19:00:55 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4T6-0000000Ggsb-3f5g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 19:00:54 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-29844c68068so46185175ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 11:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763406052; x=1764010852; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0lS2cED24LXASEO8Kaw1E9xKUmdy8WEPj1E8PP+Wtk=;
        b=glIWtQTRJEKVgRrofU1WT4r45ZmtZ9Lt+bVM5H3Goebnco6pzl1DjMzQhwqPdjLaXU
         F4Hdeks7av+mLsdB2JYGnxclJbC1jC1TYF/XKD8B0Nw29O1HMJ0cXJMsrXP7Ux+QSUE4
         ZcQ9/mrZO08OYUkyOvh0xi33VEV4AkCs8B7CCBNC04H0SBIxv23rziR55kIN9/qrF63S
         EB/A1ITNijNhmGrt5UGlTu/G8Xa0hQLTYkxlPZCykBu+sHfr2VAy3Fx0Ghe1w2KRPt9Z
         Gf3L5jgeF+1Et9hwfEowB8m7GTsTzkRE1kracoYV/iKCo7h0z0sznvdSg792BuxsK38g
         r/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763406052; x=1764010852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H0lS2cED24LXASEO8Kaw1E9xKUmdy8WEPj1E8PP+Wtk=;
        b=gQinacwTA0U8tUhw66lzJhxoVBQV32Hs01qX2lkmYYUhK63zaDdUSzlu/ffOM6kWll
         mEx5fRj0riFLEbDcm4z9f30hyPnlFAzUXHfrAF08ODsYthB+QDv6uiD5ykA7pUWW6cXQ
         XOVaZusg6moF8yubADKJCM4o5vBqAa2cSx1996MSjsPUvYmm023Xkom1SAj9sndP7ttm
         TDT0AIPjxwd9buQ96ZMmbWTe44yNFr8N/m1Lij0gF+r5ZrIxX1wewsAlqFbIY7Vp3m9Y
         f4u8y6zJjtV4djjwk14mxDAUAzVVWkvu+Eqia+4SVlN9w3jdIC+xYjH2gQxDheVpRoy4
         W6aA==
X-Forwarded-Encrypted: i=1; AJvYcCXlPJpmpNvJF4uplQTBN4vWVRU9K+h+CILJwhN9pZ+QGJFrpAqSm3FLf0oftwBgspxyHtm6PVsXPf4jzm0WDjNj@lists.infradead.org
X-Gm-Message-State: AOJu0YxiJ0H7vtF95tgmLI9KMSt+qEIs1XPeImFn5ULkm5YTA/yxvGtk
	hYyoJdXxjvEJ30Qv9sJaKK32NtMdZN4qjP1/9LsrrXy7RXi2Muo4Bokc
X-Gm-Gg: ASbGncs3KAR1xkIBiL/VrJksqmv7YqCqBbrxOrpd4mDCK7U1FmW6RBjkNjPo5rHKKCx
	MHE82owpAg+ROKDx+TKgJWKci5wQ6Gi5r+Q3K0uNqEO9C3t/Cf/frFuUKJeJb6Cba5iwdcYd/ld
	03vZ9bUNmo3F657qqfiq7lkamvYEVHZwxHQekt03+FcIwAL/HgUmsISbMmUMpdV6dGbz90nLzIo
	kHWumskby9VqoEDiiVJNYCf1n2ZUwS/qNZ1PNDFKfMa8K4dF/0JgFlSbuyH0oSL33ORaSqAH40r
	atKfNWW4OulBH5oEy3o/Uj53tx6AGXwO6kXcUmXrO4SpFQInUDxOBs2ptwjHnExUglHpfdQXc3N
	FbjtyqWDEcztOo/wPvrtbM7o2bHMDQKU5yQVDFuWl6fbG55Sl5kNT4a5HJTnytlB9d6flbpnEuL
	vUQ0QKmMsV1ITJISEE0jMNADspEY/DJlSdXXnTIUSG9aPl
X-Google-Smtp-Source: AGHT+IGDVNZOalPoeGLRx0StV1WyF6OuSXplI/tFFH2YjaxRb6M+ZouwxCgXlyJ+r8uHMpC01NlQdg==
X-Received: by 2002:a17:903:198d:b0:298:2af7:8d26 with SMTP id d9443c01a7336-2986a76a26dmr169206325ad.54.1763406050080;
        Mon, 17 Nov 2025 11:00:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2376f6sm146281525ad.21.2025.11.17.11.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 11:00:49 -0800 (PST)
Date: Mon, 17 Nov 2025 11:00:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 06/11] hwmon: Add Apple Silicon SMC hwmon driver
Message-ID: <7a445358-ce9e-4180-99dd-1a771c8ffa98@roeck-us.net>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
 <20251112-macsmc-subdevs-v5-6-728e4b91fe81@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-macsmc-subdevs-v5-6-728e4b91fe81@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_110052_917190_BDD9D316 
X-CRM114-Status: GOOD (  16.77  )
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

On Wed, Nov 12, 2025 at 09:16:52PM +1000, James Calligeros wrote:
> The System Management Controller on Apple Silicon devices is responsible
> for integrating and exposing the data reported by the vast array of
> hardware monitoring sensors present on these devices. It is also
> responsible for fan control, and allows users to manually set fan
> speeds if they so desire. Add a hwmon driver to expose current,
> power, temperature, and voltage monitoring sensors, as well as
> fan speed monitoring and control via the SMC on Apple Silicon devices.
> 
> The SMC firmware has no consistency between devices, even when they
> share an SoC. The FourCC keys used to access sensors are almost
> random. An M1 Mac mini will have different FourCCs for its CPU core
> temperature sensors to an M1 MacBook Pro, for example. For this
> reason, the valid sensors for a given device are specified in a
> child of the SMC Devicetree node. The driver uses this information
> to determine which sensors to make available at runtime.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>

Applied to hwmon-next.

Note that I can not apply the devicetree patch (2/11), presumably since it depends
on the first patch of the series.

Guenter


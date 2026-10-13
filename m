Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D23CC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 07:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YC4l7vs6phBF/kwZPYqd6bhtkTN6nnOLPDyVW74IR1o=; b=E5N5lXnBex97D7anbspBXJGjNn
	FhkOg29OBsUrhsVSfUYjC8l79RMs00Uq76Df9/YWRa2VIf4mJAL4yQZYP7RPemJbRcOAYDKQlpfhL
	/QIi8pxj3+/BuQPTYIkJQes/NLfxqdekcRtAcECqs5RV49pYT3JJVdvAbjKeEYzmSZKiAOpotVkdy
	T0t1yW9RSxIEGNtekH1htmy6CFeLJk6u9U4Pruf+5gV526k3/HtsZFsG4KEgj+0X1jkLa8AYxYR2L
	YY28ymkz5XSCoT2YkT01I3tDukxsUURsM3+3/8BQMbX4oDkAnvrbhXqTis87LspQN3dqQT54N8Sg0
	Mgpj9+BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGWed-0000000CBto-2HXu;
	Tue, 13 Oct 2026 07:10:31 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGWeZ-0000000CBsp-11Nn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 07:10:30 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5bced78b3dfso1439306e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 00:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791875425; x=1792480225; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YC4l7vs6phBF/kwZPYqd6bhtkTN6nnOLPDyVW74IR1o=;
        b=qN950tolSGufCobCe3Mm035N3JKDcL8SUhwQFBhRLvf1M3Areh+5LZFwwfSeU9/K9i
         00pc+sZB3MWyG5j1Ql11nnSM1Owi5EJWAlb8L/REeuKy/yM/AAaLOB/HdAJLe/r0EfUq
         IsugUpUqiJ26ePjMRN+Dxsb38L/9HMY/8vrxPZARFhHvvgvkD0mtYMDul69iw2PfF02V
         xxvWY91Uk4eTeTwLPmiv27Agj9QkuLe0OWPGhpnn5Fj2Tl9hZKeyHFITKeb8sKjwsAEQ
         SwtxMY9prXO6t06GDDXBDXc4H/5fA/9uz2VVsAfdFSs4Nfv5lEmqxbWvCkFmwMyABwUl
         Wz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875425; x=1792480225;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YC4l7vs6phBF/kwZPYqd6bhtkTN6nnOLPDyVW74IR1o=;
        b=LCkt6P3+zGXAEeS9olyNZxtt5hPUmygNqElBaPVvs8G72uy7hu5CboDfuYhCDxA8D2
         5DMLTJx6uGHsbfz/hhfuoJzPNZ2ziUrt2o05W59ihFdvPv0tSB7cbPo6CQqLB0wGMSLy
         ziJE163e9TvEgutRdyAHIu+A8/I3EUmwhFafuu0YPIV3E/0kl2jS3J9E3ID8vPua7Esg
         r5ObtqHWtEQ4MBIYG7nvAStKOAHrUTgjOWwV6Jv27dffgr1L4gcwKE/hLxQuK4Q//DL3
         TUprJhLGcaHYIgFjAJhqLQa6nFD97f2dlsZiwkgojCzwHk5NmdLi2Hkxb9nlpgeqmJXj
         qKUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSzXaxcrVhyqNTVQeQFaU9wk324mY5XexE5IRtDa1pYTbh+5R/RKbHaBF7sieRDrixg+ZJEwFBxfp+P9sLzfLP@lists.infradead.org
X-Gm-Message-State: AFq9FYJVNCr87sBTrTab9QPy+jENEifB3VCqUmKndEYvtBUs33s/LTbj
	afjT21W7pvfxeyml8ZHYBHEsx1AY+tWhCpyOw8xhpiuFrNppcShHERJg
X-Gm-Gg: AYBFou1HFTwgYCJDPrQq+gqA57xZNisS8+1LocTV5LH3mJCvosFg9MVoiz7cogNtDkX
	bQIi4a08CY2yvyTfUHxcNvA1prQJlKROSjDbJGZGVq7F8BU2acIuU9orOnKCC3jrOkeL1Jnv7Kt
	iQzudcFEa381DTY1BoSyTHgGHFHksC9Vc2xVZPH8XwZzrF4D6RWo4FbpenC5HhWYTK+9MwO3ibM
	LQ6xd6Gz+WpN6od5b/UTEqpz+m/xLirHuhaDs8IZWPRf5d/+r5YipIFZaJ2p7HypQu1iXLTIgJq
	CSKWP60zoSn2u8wpFXs5O0C+C/QDrDXrXfrfrSEMYTDRHYS//FiL61t/2jOlqnMT7Ot1G8zQlDV
	7y7nLFeTTdZxhKTbn1JeANscOCKSyE8f3A9UZFDcwYDq3fvHiUzcB13l3XOyOXRUIZsPPrJmdJA
	fYYCDrZVIGgA252R3WCPXJbBkRVRNUxQBhpgBD4wWRQw8IiMLnBdhtux9lFEZmmdyOjxbzh7A6l
	36qXuq+ztjiFjP7+DaygKHAn55AOcG5yV0G0xI+JlrjDl/0cq45MIrF
X-Received: by 2002:a05:6512:3989:b0:5bc:b15d:beb9 with SMTP id 2adb3069b0e04-5bcde6c3067mr3863262e87.29.1791875424914;
        Tue, 13 Oct 2026 00:10:24 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde36114sm3388236e87.1.2026.10.13.00.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:10:24 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 00/11] Cortina Systems CS75xx: interrupt controller, GPIO,
 I2C and TWD watchdog
In-Reply-To: <20261012-dreamlike-hazily-19bb60326f0a@spud>
References: <20261012-b4-cs75xx-s2-v1-0-8a7641b7b79c@gmail.com>
 <20261012-dreamlike-hazily-19bb60326f0a@spud>
Date: Tue, 13 Oct 2026 10:10:22 +0300
Message-ID: <179187542217.3247897.4323160442877168450@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_001028_979414_E00A8903 
X-CRM114-Status: GOOD (  18.62  )
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

Hi Conor,

Sorry for the late reply, and for sending v2 and v3 without addressing
this - I missed your mail.

On Mon, Oct 12, 2026 at 07:48:00PM +0100, Conor Dooley wrote:
> I think what's here looks really suspect - regions of two registers
> wide, interlaced between devices etc.
> You mention syscons here, and really that's where I think that this
> should go. The region at 0xf007_0000 looks exactly like a syscon to me
> and should be modelled as one.

Understood. The block at 0xf007_0000 is the "peripheral" register block
of the vendor kernel: the interrupt status/enable pairs, the UARTs, GPIO
banks, the I2C (BIW), SPI, MDIO and timer registers are all packed into
it. Would you be fine with a "cortina,cs7542-peripheral", "syscon",
"simple-mfd" node covering it, with the interrupt controller as a child
node without its own reg that gets a regmap from the parent? The UART,
GPIO and I2C nodes would stay separate devices with their own reg, as
you suggest below.

> I think it's fine to make a GPIO controller at this point, and leave
> pinctrl to later, but I don't think that it is acceptable to pretend
> that the mux registers are part of the GPIO controller. The pinctrl-less
> GPIO controller would have to either rely on something else (e.g.
> firmware) setting the mux registers or be not entirely functional until
> the pinctrl arrives

Agreed. The next version drops the mux register from the GPIO binding
and driver and relies on the boot loader's pin mux. A line that the
boot loader leaves muxed to a peripheral then stays unusable as a GPIO
until the pin controller exists; I will check which of the Almond+
lines (reset button, touchscreen interrupt) that affects before
sending, and leave those out of the dts if needed.

I will not send it before the interrupt controller question is settled,
and not before 48 hours have passed in any case.

Thanks,
Fil



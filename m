Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11B7CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 09:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrzB9NAU8AL+JbGiYOShZmT1xWel7aF8cSCJNbT1IGQ=; b=LFi0fQlaNzzHKjBg9rSWtsfMVE
	NhamyGrx56V4uJTuAB6baYIk2PV6kk6v8i+r3Y6Mk3/vpj3l2ICweUYJM7Q15CaH6Q97FFetsKrQW
	SL/P/BSBS65cMO4C7+fXEWTUm4on2vJ3flLmNOhJ293Srauc3tbxLDBqHatKGFLNo3z2GpRLs24zd
	DOoIIcoxw0Qc511tBcXeKlKgAIqHMzIob8uHlpTVa2Ps1dBmsZBtSk9THmsigsQnRKvSiSepr7Ulw
	wEY7YvzZKKFeOfYEf8BKvKwaBwBoHUYOk6bx0mUFv0FaMQcHJZYaRn6InGctM9e6k/8zX00XR5/Bq
	zfMIieaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0Tj-0000000Bh0M-2gnd;
	Mon, 01 Sep 2025 09:05:31 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut06t-0000000BcP2-24OC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 08:41:56 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afcb732eee6so707468566b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 01:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756716114; x=1757320914; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WrzB9NAU8AL+JbGiYOShZmT1xWel7aF8cSCJNbT1IGQ=;
        b=ODrIAZ7oqPXsg8wm5M0mk5K8gZcgE7tlfULGmQoedOsLteKdI2UBUcP1Wc/G3zt8Ze
         T8ATZ/M9ccXyLV3j7DXqC7oYEW+ggxy8QpGOSbZFEfnSojZSu3TqqjWBxMOQLTxvikaj
         N8M23tNXf4HPDEdE6WO82h+eLb1KkROq/lYQ+tSSIO3ZlBuWWkzkFGW/71bSFcf4uyd5
         sFYpYEQXuyZYTZ6k8FJdKY+asioZm5HfB01ZP43hsmQEuRK0MAZy+zaWlWbRE+C7Xxcw
         /eDHF0VQCQq7JN7aRNP6XGltuMQAYMVlebUn9fqQcLRA0Yj4uBAtntxQX3sgPxM3ifwL
         TUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756716114; x=1757320914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrzB9NAU8AL+JbGiYOShZmT1xWel7aF8cSCJNbT1IGQ=;
        b=EdcwW/H4XoFrlChuQcXVQVCT4ZQjNVpiVgQ3ONxDhY5aLPTzO1m/ujsF52DP77Ng2Q
         xliQ/iBt7ygLbk6uAZmL9v9DxOpIC9AxRLHHcD+zgdKyr72UNe3GkJCasgE8bIVkNKxQ
         0zPh0SMD/y25lMITw06vjFeyeKIx2PhFfLLgPoWeSzy7wBHZ5n3Udf9OmNQ9TvymQe6V
         ++t55Aq9fTcS+uiWr/Kh5Pr5gjXo3dlxopX82ce/9lI7/NmWyVA52sSnBEpOGBZJQx/G
         AMjMsdCRWvsBVnDAuxprVMCEyrUuB3LvHFkcJliCNgaLhCnB8D+XtRiWfYu6GiyYxaVC
         Qqdg==
X-Forwarded-Encrypted: i=1; AJvYcCWDWI7xrbN7YIclnzZ1lBYzh3iN0LtYLa8kL0ugyjPafO5qqO6knpFpdIg14XMO0hLUaHRl5V1cNW5VAm1cHMDo@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh1YjWffG7jiyMf7Vm1IZIl/n9TgONk5i2DCd8glb7fpTke2dB
	gzWyVQh8AENTiMyD4VkmYpLTh17jzMAJGW1OC0TztHoo0LTfjXWXvaQVXy4xdst7As4=
X-Gm-Gg: ASbGnctC2Z1X6hKct8HYxws65vpQVyJmKPJ8IInu8q5/SyTdhoD/bVhPK+q3fKmix00
	xHGCZ7gEoC15J/YX7UVy96tpF2C3F/RFOaC5UX0XEdpiOS9Xp6JsRRq56725lYYU88haYdmMTC9
	93bvKblQcxwd0MhV2oEJJM3cYH2shU8gK0PNMvL1tSmz3oeIScTV8DB/O075NgiFsVRpKZr9oOC
	0Db1E1tMUYKBjiG3e3PsyQv0/rHiznFy9ciDMlibMQJO5zpXXBRcS+qKSzcfLNDOGXCi+2GRR8L
	r89urlWvh+Zw7n10xsz0pDxlxsJ7qqInF8BDQdjN4DjaVu47BZsh4dPQKmuyhWG+xtRbc4IkiiG
	dQOMzB0hsaq7/OkO+c1i+ccg42FlO40AjNa/+fz7wg1FAO6rCvrDj4+ShbPvh4z1BsH+1SM4VCO
	GpLJcU71IlGI+vfeFP
X-Google-Smtp-Source: AGHT+IH2zSDfBqSV/fMxZqWNDlUTgT9uEj4Uc7dil2+MCQuXaiyEKD87E68kEKAxnY0UHRKOEarrsA==
X-Received: by 2002:a17:907:e8f:b0:afe:8f28:fd5 with SMTP id a640c23a62f3a-b01d9719057mr758066166b.41.1756716113939;
        Mon, 01 Sep 2025 01:41:53 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0410138d0asm408801166b.53.2025.09.01.01.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 01:41:53 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 1 Sep 2025 10:43:49 +0200
To: Rob Herring <robh@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: Add support for Broadcom
 STB pin controller
Message-ID: <aLVcxYeMeQqHoH_U@apocalypse>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <7ed0f2779829f4e63b69d8cf5cedda9f849996bc.1756372805.git.andrea.porta@suse.com>
 <20250829175957.GA1073350-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829175957.GA1073350-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_014155_530543_BBB2D673 
X-CRM114-Status: GOOD (  17.48  )
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

Hi Rob,

On 12:59 Fri 29 Aug     , Rob Herring wrote:
> On Thu, Aug 28, 2025 at 02:47:38PM +0200, Andrea della Porta wrote:
> > From: "Ivan T. Ivanov" <iivanov@suse.de>
> > 
> > The STB pin controller represents a family whose silicon instances
> > are found e.g. on BCM2712 SoC.
> > 
> > In particular, on RaspberryPi 5, there are two separate instantiations
> > of the same IP block which differ in the number of pins that are
> > associated and the pinmux functions for each of those pins. The
> > -aon- variant stands for 'Always On'.
> > 
> > Depending on the revision of the BCM2712 (CO or D0), the pin
> > controller instance has slight differences in the register layout.
> > 
> > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---

[...]

> > +  - compatible
> > +  - reg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    brcm_pinctrl: pinctrl@7d504100 {
> 
> Drop unused label.

Ack.

> 
> > +        compatible = "brcm,bcm2712c0-pinctrl";
> > +        reg = <0x7d504100 0x30>;
> > +
> > +        bt-shutdown-default-state {
> > +           function = "gpio";
> > +           pins = "gpio29";
> 
> Wrong indentation. With those fixed,

Ack.

Many thanks,
Andrea

> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 
> > +        };
> > +
> > +        uarta-default-state {
> > +            rts-tx-pins {
> > +                function = "uart0";
> > +                pins = "gpio24", "gpio26";
> > +                bias-disable;
> > +            };
> > +
> > +            cts-rx-pins {
> > +                function = "uart0";
> > +                pins = "gpio25", "gpio27";
> > +                bias-pull-up;
> > +            };
> > +        };
> > +    };
> > -- 
> > 2.35.3
> > 


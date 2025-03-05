Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4EBC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5H2Dkfo/vt5zHKiZMetuzkN/iESwQof/o51gqGwt4o=; b=CvgB3ZwP/pSUC3ds5R0acxvI5p
	LhvOYHhEtLcHY51koh/paE4kuZtsXi56+6yiIYJwGCr/NB0nnG+Xjqfftw8fZXpwl8OiiF9qCPLqp
	g1AL6oF0JtWYfYpqJhu2bMcKnEL42nmlBdVxrG96V1J7+flmd8cZqvIUNdaSuVWCtUJwo2AkhzOWH
	N/zwXw5Mm8NP7d59n4G3WHyhZtb5DE7cwzW09YWjsAoCBhviDypFi1fIYhhKjtlOu767J3VUDvJWW
	y6HCwJqeMdFAWkQdxjVjW0RVqVztHTC4FbVq+4HTT8TH0Z8ufA7nv0x3MS3V4/jHx5k2SI0JSDJyE
	boEGgfyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuy1-000000099wb-1yJv;
	Wed, 05 Mar 2025 20:03:45 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptp9-00000008yDR-2PCb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 18:50:32 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43bcc04d4fcso15066685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 10:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741200630; x=1741805430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5H2Dkfo/vt5zHKiZMetuzkN/iESwQof/o51gqGwt4o=;
        b=HqRS1ogVyBmkYtTiOTol6wejWI+123jDQf1o3OYyP7nXIbJmNAn7hP65YMpwLfqAoi
         pkM/eCJ8eChB48fweO+x9xopvCmCp00fLMvh1Msv8mOjphssWj4+yIGmRNm0FAdOBe+S
         Opm9T3ppWZs5r97s8oYqno2VBQoGM4l52QiIw2NAw5WVxE3MQaI2Fw1xcwDaRWoihQHG
         cUQW1quqxfq944BJyX0rW+mJo6B7ocIi2h1r39B9ghtOVqD7lWuKQVg355v39DsXe+uM
         55FaxqiEvdsTtrIzS0VhwC52MdkhGqdYGUmaZanHoxf3H8owumm9wt5saANZoHJnoe1s
         rOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741200630; x=1741805430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5H2Dkfo/vt5zHKiZMetuzkN/iESwQof/o51gqGwt4o=;
        b=YpTs+RfGush7LB2pgiG8qF86QjRcmBHxq2rKN8YfAHQAoOVUf71GqhwGNlVfOWmsu0
         MJfkabiLL47Q3IWMZDaTUn+YhlRZA0542zZhzDScFs1JmTQbF47CmRyfVi1CpnknVabG
         id2ff9/ecVcIT94nUKrFEOyBTksCkcZUq1QrOhAikscjsiHSWqYdwUF9JqnT+Lr4SNan
         xF18yarTnVVHeXwYqLZDYMid6HaV3DpOs2r3//9YEPlN0vVcBrLYPt08ttp50e9Iqu6H
         exnG5WDOhW80CzXXioEOCFpYIy6OUz/KaXaHSawNXslZQfCGm3qkAZoMMQdiatDU6AKj
         VK6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHRTdgNyBPP4fcpUSWDrq1s4/dtEs0XDHAT5jrKpizzHynHi+R+9jfbQWd3tn/79bH7BQDNeBN2yEluaawJWGF@lists.infradead.org
X-Gm-Message-State: AOJu0YyZgJPLuT/St6lcaj+/+QItiAe/UisTWs/yM3CH+9XPCorgR44C
	tcvdYy3IU3uTXrIgJqrOIg5XegJeymkcDb5PVx833TniXT/ATcuS
X-Gm-Gg: ASbGncusAVIk0fY5htGLYp91YMtuhObuDTtiGbePej/0a5vq45lnaif3Lr5T+xG+44J
	MD2DBNXgYpK654GGFX1kbT1IHA/SSoU1qHLhuT80UG3Aus2fXAGhMGSk7K5bFEbMP/ckTzbEW3v
	7tK9uDtapI21C61pLJo0SSffkJMa4zKTrQoLwzN+X44egEDI3IiUrxszyGdyeLJDNGb17Ak7HFV
	j21A9y6yv/rUTXYYNOQ405W+9fS7BRa2Wu5kDB53JY/+7ZGSoGQzQgiXQyRq1eOV+hS9n5GZ+uK
	63klgAqP3fndCcn31WqS2t8S8Q/iD3GssaR/i0dtVKiaTXc0D5RQiGsyKPu3jO9fqA9CIu0fMwC
	TQOMoSVuKHVYteMon2qDt
X-Google-Smtp-Source: AGHT+IHnaRGavcvn0zG6fKQ1AhWlIi2RHdXvleFHrMhG9CHQJjG0/o2DM0tO1YMGeqqMtj5xnwthcA==
X-Received: by 2002:a05:600c:458a:b0:439:99d1:d4a4 with SMTP id 5b1f17b1804b1-43bd29c3ecdmr34059305e9.18.1741200629617;
        Wed, 05 Mar 2025 10:50:29 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd6530f26sm20378815e9.4.2025.03.05.10.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:50:29 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/15] arm64: dts: allwinner: a523: add X96Q-Pro+ support
Date: Wed, 05 Mar 2025 19:50:28 +0100
Message-ID: <3805591.MHq7AAxBmi@jernej-laptop>
In-Reply-To: <20250304222309.29385-13-andre.przywara@arm.com>
References: <20250304222309.29385-1-andre.przywara@arm.com>
 <20250304222309.29385-13-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_105031_613960_FD281481 
X-CRM114-Status: GOOD (  16.94  )
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

Dne torek, 4. marec 2025 ob 23:23:06 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> The X96QPro+ is a TV box using the Allwinner H728 SoC. That SoC seems to
> be a package variant of the A523 family, at least it uses the same SoC
> ID and is compatible as far as we can assess.
>=20
> It comes with the following specs:
>   - Allwinner H728 SoC: 8 Arm Cortex-A55 cores, Mali-G57 MC1 GPU
>   - 2 or 4GiB DDR3L DRAM
>   - 32, 64, or 128 GiB eMMC flash
>   - AXP717 + AXP323 PMICs
>   - Gigabit Ethernet (using MAXIO PHY)
>   - HDMI port
>   - 2 * USB 2.0 ports
>   - 1 * USB 3.0 port
>   - microSD card slot
>   - TOSLINK digital audio output
>   - 3.5mm A/V port
>   - infrared sensor
>   - 7-segment display
>   - 5V barrel plug power supply
>   - power button
>=20
> The PCB provides holes for soldering a UART header or cable, this is
> connected to the debug UART0. There is another set of UART pins
> available. The board also features a FEL button (accessible through the
> 3.5mm socket) and a reset button (only accessible when case is open).
>=20
> This .dts just describes the basic peripherals as far as we support them
> at the moment. The PMIC rail assignments are reverse engineered as far
> as possible, by dumping them from a running Android system, and correlati=
ng
> them to other boards using the same SoC.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej




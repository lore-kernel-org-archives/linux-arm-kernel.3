Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEE8CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FapHoBZSBBgkeAPgfh0/hnIRZ5RySUGbBwY1QHLC79Q=; b=pqjxHg8kHu8vePnb+iGmL4Jtbd
	Kp9aGvaWw0JUFo2rQxvGyBy10YkWwd232lPajoWK+Dptp7uAVwrXAanFGfHIwwlqr5luNDJwOJatJ
	mg1yVhSGbfvQnkeNRgMN5W3sBFkqIy902sGvJKWWfbFv5sPaYzZW7VhSGGQF7LQErXNCvIYGLx3tw
	7t8WR3Fg+AGw88XdsVUPJK7uiMdfaQ35/GuLGCWFSuVduU9NkEtHyuZwHpjh9RfUFrJBiox8I4/22
	abHQUzEPNpwsNuwzEfQEATYDyZp2lMxnRSlYV6+c3N+fc9852mrG3s+lJ6q3c9m2Khg4S5lg6KkSz
	Rnxpz0tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Smk-0000000EpSU-0fZz;
	Tue, 14 Oct 2025 00:21:02 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Smi-0000000EpS8-0pzq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 00:21:01 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b67684e2904so2616352a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 17:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760401259; x=1761006059; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FapHoBZSBBgkeAPgfh0/hnIRZ5RySUGbBwY1QHLC79Q=;
        b=hTOkyHORYv4deeaHLBoqn+9tH33//lUYW7twvydScZABXjBdBHkuPZrqvtOtRS7N1z
         G69Z/5zTO0l3HjG41kNKOvMXGSqwNwx7F2hgq0d83r/SKAs1n1T72wlYZG0DqC2KHJYe
         t60Aa9hDiq3UJt78+kSWxhfW8y8YQkjc8Ypue9B1nlUB0ak244hPWFkfat9fxmZbdyxl
         aY7uOlm9EuqINYhaijivPhzEf0jLRx1WHAosT+2ncOS3TKSL7Js2Kd0FPBjDwE6GyH5S
         8aoZi1bzDtS4JbxEaUFDWUZYth3G3NPzUeI7WTNuOPyi2Zl9bVb6vEI9URuc6dIyyApu
         bRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760401259; x=1761006059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FapHoBZSBBgkeAPgfh0/hnIRZ5RySUGbBwY1QHLC79Q=;
        b=c5NAm+BUCKNdM7VlZpFM5UROXLoYnzQFRtqbP7MVOVYs01Ke6qi5TvnKziAo737Zyy
         9JdXn8A/EZBcA5PtDmibFgVELaV0gkyEUou/x56ZBlL6M55/kwdJvLdOv91B5cpY/AgI
         EG0Vucf6pbr5qIxp3wWLUtIrpa1UruPvrXP4qfAOXRQAYKDQULmjiz6iAxKl+U4SKVg6
         mA4RcM28yUXYyoUft3SuuvQOPIX/pCkxEwtFW5vuaM4Y+0ByZpbOzXT3CeuksC0enVqb
         2SrQuvGbCs82ifO94OrA1n9me2kvXUqx2oQLejUjSCvVuN3ThKDMdlR2psl9G840W0pn
         eyIg==
X-Forwarded-Encrypted: i=1; AJvYcCWMN0ZPxQVXPFhf2oVZOoZnMKy9jYG9b3qIunbQ+82FbtqwehW5sdoV3eD0Oe03c2C9idbLto5k/FZxJdwvDH7E@lists.infradead.org
X-Gm-Message-State: AOJu0YyQZ+Y2AxDu6pBVWmh2hyDxxNubfGvjofRbNyezaE3LFu570Zgq
	ibuzVG4QrUAliuVtrVfyEvHaDfEi3B9wHyugg73RnLPNcb1eRBfPNvNh
X-Gm-Gg: ASbGncsECIbyjhLzwC1uU3yXYVqUkKNGOEXXOEDVqJkDO44ygEkOCGeMYxJQ5Q5xwZh
	mv5lY7d68qVd7MLq6AiVmyhV2nV1k38HwHYoIZp61GACatLeaX5/qkFwgZzAcOrQdIfCldQ5HR1
	yM7IHc1pxtGyFv+3LbhWasLVmdhyCQPfMf3yLQzcF3Rbe8hq2v7WYF6bKtMZncnBSwfDXnj798m
	EdCsoexkL8cQl7MqgnqC+y7hYva4jGd4wWLJGYdfKpXMHMCPzOdyuTyJElxvyIQ70V6DC/qA0jB
	pGuYe1XWZdnFrQdqWLdsKLNHewMfoWzVj3cTCVjWRo0T5aBaD+Jus/o+T5xRtji+ZL3O4xEWELm
	cVMvHCt/9/CCjym6EVNtLN3MR8BS64vVgxE/95oyiE5VVhT9sznL8hEVvlTSmJHSO
X-Google-Smtp-Source: AGHT+IF8IIF9dA+nUndexMgc/HlI7FOKBRCbLWHhmSyCq1fdJ7LM7JOtkUdL7gTzQp9WcaLBJmQIJw==
X-Received: by 2002:a17:903:8cc:b0:27d:69cc:990 with SMTP id d9443c01a7336-29027402f43mr305469345ad.49.1760401258830;
        Mon, 13 Oct 2025 17:20:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de6c7bsm145479255ad.3.2025.10.13.17.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 17:20:58 -0700 (PDT)
Date: Mon, 13 Oct 2025 17:20:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: rentao.bupt@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v4 11/13] ARM: dts: aspeed: facebook-fuji: Include
 facebook-fuji-data64.dts
Message-ID: <79ddc7b9-ef26-4959-9a16-aa4e006eb145@roeck-us.net>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
 <20250728055618.61616-12-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728055618.61616-12-rentao.bupt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_172100_282566_AE61B385 
X-CRM114-Status: GOOD (  14.72  )
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

On Sun, Jul 27, 2025 at 10:56:13PM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Include "facebook-fuji-data64.dts" in facebook-fuji dts to avoid
> duplicated code.
> 
> Fuji-data64 and Fuji are identical except the BMC flash layout.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

With this patch in the mainline kernel, the Ethernet interface I use for
testing does not come online when loading fuji-bmc in qemu.

Reverting this patch fixes the problem.

Looking into this patch,

> -
> -#include <dt-bindings/leds/common.h>
> -#include "ast2600-facebook-netbmc-common.dtsi"
> +#include "aspeed-bmc-facebook-fuji-data64.dts"
>  
...
> -&mac3 {
> -	status = "okay";
> -	phy-mode = "rgmii";
> -	phy-handle = <&ethphy3>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_rgmii4_default>;
> -};

I don't see this in aspeed-bmc-facebook-fuji-data64.dts, meaning that
interface is now disabled. Adding it back in fixes the problem.
Also, MAC3 is explicitly enabled for fuji-bmc in qemu.

Was the interface disabled on purpose ?

Thanks,
Guenter


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BE6C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 00:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2n9pQ7lqkOTFMiL/4NeGhhQeB/25Nn+RC/N+U/7ad+c=; b=aKOXyhP1MwXN5fLcGIqTew6TTx
	aEKQ3XSzEafbTJFeY37DPWpivX4wwenxG+v93KCW81rT1dpOOmeBNkR7V97+CEeEW/qdEbkwvYzPh
	L+TKbIsiU+hbbv8u57HrqIBCUfyEx0cZ7+khDSNqKwUbuxlI5ZprWf2/L4wQUickqFhTOKPWtTTRA
	hVx/sH34Q2hOqkBomOrq+5BOM/Q/PuWKFX45dhKWqLydj/k5udi8zE77k0+3EZfvJFHizEsMfAK41
	zCdtsRbdQyC06L4hXXeICWFKgQfvS2LfO91Nf7H5Bw7ddGXDRYXFXimDuQh9A4/Y6mGQo2vkOrNjZ
	KKjV9XTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32Nr-0000000C8sM-0qyV;
	Fri, 11 Apr 2025 00:36:39 +0000
Received: from mail-pf1-f177.google.com ([209.85.210.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32M2-0000000C8gJ-3JpE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 00:34:48 +0000
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736bfa487c3so1274427b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 17:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744331686; x=1744936486;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2n9pQ7lqkOTFMiL/4NeGhhQeB/25Nn+RC/N+U/7ad+c=;
        b=KVf+Da8ez4lUBUieYc06AGXzYcXvft7AFXsqK4LtaPM7Jf++Ub9VLWCQhFrBfyjmnW
         6XFRdU5adRauVCoHFlcUpEVGp5jy5c/fZJCl4T9WqugBBXuJRi12cwT3lzMu59YwlpNt
         WRu03j/pRjCF1TKHgyV0D9Xv3AqQYTSk3n3VqOQtbsUDKh5Lqzvuf0r38CIjnTSbYy5v
         GKJQ++yjSdARZjjPA93Gsqkosb9KiDc3dOrS1YnBGBaqnq8KErVjjx9xE8eDvvPPOlnR
         DW5FMDrqbGlXQIywjC6d8l9tY+2j38Az828iTXGFCkjswCojUD8w3EL3nYNrJ1e4ICDu
         uJLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYmQBTqnNpbJzEYddGbPxkaFIfayK0TkuN5izbXMniwuhNqXoZyCxD50EWsfxGdqkMlDOlHcuGZwq+hVNWoUiB@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc0KfsUf556D/0BMS6TJ5xGcCSL2ZPxbZMGBvK5qEavRI6sUt6
	6zkW8qbVbr/MaSuCXDn69YRLU/tgjIZ4Oy60FsWBqEZlKwumdsUfI0FmDm+6Y24=
X-Gm-Gg: ASbGncuyLhPwI9NaAvw67zFreWCtIWGi4FP1Whd/VFkAINaEVrsirJZPpoMNj4EL6+I
	r6lq74mAnccS6k0faILiWiSpi8I7Vbdagp5OVLZTm70lkNXcFPrq3WavWhEiKgmg3Z7LKdgCr/A
	XTp7kkoqR2n48YtFVnBRzZ36ZRlz4AfyDewVasECWZS+P7GUhld/T96H2a4QhyeaYIORlr9xsvK
	S93mYA82F3CdhA51pz8Ckku1t0JNeWd1KCxi9d30IWwH60n46zM4Q7NCUekBsnjPft2kxh8PjyF
	yyYGsmblQSADtKp44npcOo2cjO4LP+9XfXKY94Ny5XQFA21Ajg==
X-Google-Smtp-Source: AGHT+IGQAAV5woR4RVRjXO9TpIAsphvWKT0jMORsfI7xQgrPS++t8q5XWvn8GDPpegpqJNYEQ9nN9w==
X-Received: by 2002:a05:6a00:1481:b0:736:ab1e:b1ab with SMTP id d2e1a72fcca58-73bd0e97a1emr1046946b3a.0.1744331685906;
        Thu, 10 Apr 2025 17:34:45 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f0f28sm213644b3a.97.2025.04.10.17.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:34:45 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Tony Lindgren <tony@atomide.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/5] ARM: dts: ti: omap: use correct ohci/ehci node
 names
In-Reply-To: <20250330193833.21970-11-wsa+renesas@sang-engineering.com>
References: <20250330193833.21970-7-wsa+renesas@sang-engineering.com>
 <20250330193833.21970-11-wsa+renesas@sang-engineering.com>
Date: Thu, 10 Apr 2025 17:34:45 -0700
Message-ID: <7hzfgnwn6i.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_173446_846313_42A421E3 
X-CRM114-Status: UNSURE (   6.68  )
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

Wolfram Sang <wsa+renesas@sang-engineering.com> writes:

> They should be named "usb@".
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, queuing for OMAP.

Kevin


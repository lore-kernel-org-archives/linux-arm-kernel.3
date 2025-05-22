Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD2DC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 06:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uG8OshWifuyuMcwd12q2qjIreQ5QpE1JSphDjs4WrDE=; b=ocC8ShnuiJERIuy4vKqAE/DCNd
	mAKrI26T3Q0sXyJ+r6bVKQZlaj89w/hUd3BTN5/nkwchJFVyhRu0y9U/lYUz0Po9ArMvR8SnC8Oe8
	Wv+Ib+rS1hjNZvGiDPKIbhfZNWmRSQFUjy/ksqy6zp5m1GHq3XSjaH+1voYuGu9MKn81Da2QS62n5
	2bg76wZJdC3bEVSqt7gqBzZJYYpkIZxVTTXspDoy9vUYfamEwOwRRafGsdFgWXP5IXVP8+S5vKOWX
	iUj+bGA/BLj/WG8ZosDgvlv/fHqcvf6l99CVCkgMz2NVenyeQBWZNU39Hz+JOeMTu0rT7l2iYGF3d
	NWAjLm4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHzF3-0000000HZnc-0vms;
	Thu, 22 May 2025 06:17:21 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHzCy-0000000HZ1z-3hRm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 06:15:14 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cee550af2so4854715e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 23:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747894511; x=1748499311; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uG8OshWifuyuMcwd12q2qjIreQ5QpE1JSphDjs4WrDE=;
        b=ooldF/WmGZx2M7VExD7SUqPCEYzRvbCxWHkRkoBnbmjoH0KB+uoJy1NoDFgIxUOGhn
         FC057dk/s7Iaq2ib460NiXCke16Mcwdk1VrRyi/yVo6pd1LvF5gJ+KcgzypKO9/IOIbG
         lQsnI/JuhE3GC6Xo7fVZ4lM1tLGQqxN96YgBSt0jw3e8IgfK3i3kJxsryEUDtlEwGF0c
         ElNioF5OVWJpUCBMr+EttbS8FHvDuqg0u0fQ9N3B/vaJjiDJA7wxVEkmv/GvxcA75i6e
         triFcZkaey4c7q6sLsRdyWkho+z/MHLB/EfOP0DGme+4Meko31UYQXu2D4lP1JwWBWEv
         iipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747894511; x=1748499311;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uG8OshWifuyuMcwd12q2qjIreQ5QpE1JSphDjs4WrDE=;
        b=w7gE8ONA3SqqqXyh8bRV+6tvxPgLHfUKrl545qlZZ6HhGD2P5TE3kqzY0o9VzSe+Zm
         S5cB4dWAR3yW8oIGnSuDjh28+TJ/kCIX4lAfutgToHQN85yHmk0zALHD+kin3Ko0oyqD
         YaDiO3O0/82DWrgksQxLjBz448wSHqGFTKuFX76bFQIBW+1pe/1yUTHwa/rVTDc1B3jI
         LLHt8pKW3tM+gSCUwVLSVh7vbJ7xUIM1f7VgrvzoLvv6d+Ns80FhXy0wX8H5e0flmmBa
         E61FnbtcZL81NsxSn3SR484G9E/M+psY43nVN4ZNZMU4ESLbSVQIJ2XPWZI11Vf28wzL
         uB/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhn+lq30iHrdJ9EjeqN6UR0i26/evxJsK/YGVAMUFWLHcc/fR1GqAf4EUKbwiue71YJ/JRFGm7ZtJ62eZN0Xt/@lists.infradead.org
X-Gm-Message-State: AOJu0YwmtaG+RuIw4iJoRlwKCH9p9U6BSQUsfODDnpcRSIHiyAq9fryh
	W69I+Q6fguj/WvIvgAvSZOLT3YsCJuIjnv/+OFcaMPon1POAAzJW3Gv5+UbMNk491OE=
X-Gm-Gg: ASbGncv9UN7X6uIDzo09yPIQg7fZIb5Htzznq+afn+DlsB23nHDqfsJqpMRfR0cnOYB
	L9OUAtUMx4PM9XD3PqOKlBkd6i7qK3pKuLkhs/q82r89HGO4A5KdfY6rKgwy3//Rd2IvIwzS3zw
	Uo44011FqXS9LNYUbDkcN7KhpaRnKPA3zBrwFnu7ztO1bPFS24HiBVWSjSe3IXGI+CpBo8V+rZM
	kSdKYqbBkdqQWVjhUrhbOAp+GrQ5rv1+KUloyxEquANc06oHlle7RkQaF/okVz3yu/ml08Z9xu8
	Yvk9cbsXrI8OG3D3Fd+tQW6177CP7PAODBgTAZTfShj77u4PecMYl+LCkIdEhniYvS9agayI3FU
	hppu60g==
X-Google-Smtp-Source: AGHT+IEM9uv1fX2pmqD0YCviR3QYTH7GcWYcWn+mgg1vALiqzepMG4TqCT5yxiQPxW3h/H0yGin7Xg==
X-Received: by 2002:a05:600c:3545:b0:439:9ec5:dfa with SMTP id 5b1f17b1804b1-442fd67590amr76834135e9.7.1747894510664;
        Wed, 21 May 2025 23:15:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b29548sm98459055e9.4.2025.05.21.23.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 23:15:09 -0700 (PDT)
Message-ID: <455ef8b8-dec5-47e0-94db-611ac399903b@linaro.org>
Date: Thu, 22 May 2025 08:15:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the i2c-host tree with the arm-soc
 tree
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexey Charkov <alchark@gmail.com>, Andi Shyti <andi@smida.it>,
 ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20250522121726.0a4350fc@canb.auug.org.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250522121726.0a4350fc@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_231512_945137_13AEBBC2 
X-CRM114-Status: GOOD (  18.06  )
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

On 22/05/2025 04:17, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the i2c-host tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   47cbd5d8693d ("ARM: vt8500: MAINTAINERS: Include vt8500 soc driver in maintainers entry")
> 
> from the arm-soc tree and commit:
> 
>   3887d3f64260 ("dt-bindings: i2c: i2c-wmt: Convert to YAML")
> 
> from the i2c-host tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.


Arnd,

I forgot to mention that in pull request. There will be a conflict in
MAINTAINERS file in ARM/VT8500 ARM ARCHITECTURE entry:

 3425 ARM/VT8500 ARM ARCHITECTURE
 3426 M:      Alexey Charkov <alchark@gmail.com> 
 3427 M:      Krzysztof Kozlowski <krzk@kernel.org>

between multiple trees - arm-soc, i2c, devicetree and pwm, because
patches went through different trees. This conflict will go to Linus as
well.

Final resolution is like:

 -F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
 +F:	Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
 +F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
 +F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
+ F:	Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml



Best regards,
Krzysztof


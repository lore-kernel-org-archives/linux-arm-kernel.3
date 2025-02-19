Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C68C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 11:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWOktcaedUBDqKd4C1NzqImpFID0KSF/Je2o+kES7iI=; b=lbtg0ugg9F3a6pHyrPwlXW4ARW
	tVS79K3//nw3q889shUsEmwIJQ40SfvAiBwNIfoIPSI29qJs9Kc2vg5dYgmTYte2lRHl48mmCmvOm
	Ye25NRRh4Hps8Sw77JRldpYcGPb1C7cdcNKWiUddRXl58VNddhmTl/K7ynu1gmQREwv8hbXBGR8J2
	wPw3MPzSrlzbzk9io4/pj+eGBR3vqv7YgVl0/AebrJ/Ep8drX/7ILMFGtae3XA/QlBRCo022JkEso
	XVvR9qkxsBqj1EnxFec7G9tX5mx2htQwSTG2H+S15e7byRe0O0ZkzdTL5uflOTmKC/FM3lpDSI/IY
	IrM5qrnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tki90-0000000CN3d-42iZ;
	Wed, 19 Feb 2025 11:21:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tki4D-0000000CLj1-1Pk0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 11:16:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-439950a45daso10925305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 03:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739963795; x=1740568595; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWOktcaedUBDqKd4C1NzqImpFID0KSF/Je2o+kES7iI=;
        b=eilZl70xH0He8TYFZ7Om/cszUFGYZ1O7dIm50igwg3HGYzam2Rp0h9XfpLyTQgqVKB
         5LVFwbIjmEMi5lOAzLWWehaesRs19JpVirhF0YCjiFcTykjmEo+eZhaNMwSN44nEaYHz
         IG3iA9SAW2YmHEiS57yRT0Y5YzcyOgy0A/j1YjwhqSP6d7NKyh1AV/hI/tis2tUhannd
         IMkO8vGPEa+2wRgIheMo/Z36x4ZApffzU9SICDLF2x0dG+DC3sPFg7SLnGPk1tBvGxYh
         jv4t+YkXffkl9MlTi+MzgF88v+JyEX0xsgDOfCrR0P1FC+DfHS7U+kF4SkPH1rf/HNiV
         sIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739963795; x=1740568595;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWOktcaedUBDqKd4C1NzqImpFID0KSF/Je2o+kES7iI=;
        b=aY5ojZMeqFasfj4hoOJiZLpPXU1drnVK4vFocleegUPaMCTIiIMihOYNmoD4WHu7oc
         MnxjtDPshk/KcJ2oIvLj3nwJigIFe8FdaE+vekxKr1qblQRY1f3oVdWnb2uqEWTuKY8s
         wH3KiF/G8zyfkZwjdNE4M4QpVazGDETp5ruKRnLOxs4MbvNLAkZoa2F04oWMOP0rsieI
         2M7wpBgBUkndZks+uJXMQL5l+JInEZJTOaCQ/RigWxntY0kieBtIKLgLfbKUVNLPmpYZ
         TJe0RLtpY3Wf8sS0zhJSzXY7Vxb2tELrKcWPsFTX69dOyu7SszzPZd5lB9aBj1w8qp9B
         STjw==
X-Forwarded-Encrypted: i=1; AJvYcCWw5eXAwvllW6F5CWKbEMI1+tZA2Rnyn/Tf46ZAqRH1Y7kCCbhQvp99YQUVYoZzqiC7fElwP5CuL0b4vwlbgKOm@lists.infradead.org
X-Gm-Message-State: AOJu0YxCyYeh18dSIeBrH54YVcfmnc9jDY0VyfSdid5mMP1oq5Odv9Hs
	IySDXDW8hdcW8148MKbYK/hv1HZ3hTFFrKWgLXg5TLMrZGpf2f2SmVGTjRtWztw=
X-Gm-Gg: ASbGncve5RYCrp21dsS+cP3cuD7AGoWOXr/08Rtn+2swxxSMvcPJrCksNJ3y779/oNS
	dXZ8y/N8vKcpL3yhfHlOQuf9vwgGb8lCtKggsnMf3jvWcjqrLHNqrRz9ifDDvzRn2H/ZwMxeV7x
	GPNBAL5O4PUpS1qRNm9AHXR4qGv8hwguneHMvUZ3gZR0UxdFRNjGw9w/131Je0lPC2sB5WwhkT3
	l7YjGd5+ooi3WsNpsZeEOsHDkhgjwEbNOUvE4+a0D196eCJ2HpGOiAcbkqT6fzdSi20UHK8jJW0
	jkLGORoaTiWpOZf7atnh
X-Google-Smtp-Source: AGHT+IEmDDRkG1uSwNL1pvVknqup0gDz43+E3qOgrQNfjOcr23dfo95v/reLZTyiBdBUjlLYYhhYOQ==
X-Received: by 2002:adf:f205:0:b0:38f:2726:bc0e with SMTP id ffacd0b85a97d-38f3406cd88mr15712193f8f.44.1739963795144;
        Wed, 19 Feb 2025 03:16:35 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ccdabsm17536949f8f.28.2025.02.19.03.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 03:16:34 -0800 (PST)
Message-ID: <b60fe253fdf581399c11cb7e23db0e9883c81255.camel@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: exynos: gs101: Change labels to
 lower-case
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-fsd@tesla.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Wed, 19 Feb 2025 11:16:33 +0000
In-Reply-To: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
References: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_031637_378116_F24CE769 
X-CRM114-Status: UNSURE (   6.94  )
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

On Wed, 2025-02-19 at 09:57 +0100, Krzysztof Kozlowski wrote:
> DTS coding style expects labels to be lowercase.=C2=A0 No functional impa=
ct.
> Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>



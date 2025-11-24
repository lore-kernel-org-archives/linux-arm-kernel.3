Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CD6CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 17:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+dXzu+OtwVQATYT2SD8WXaq/eak4pH3LzFk0SdSmXo=; b=v2QtIAqTqclbstotRYKoFqvWMd
	JpuWOACnId/qb38GsEnHg+8kSD4F8fPjKm/E+80E4/8JHS2/4rVdN/+qJQwdTtPm1m5xtrwycP69M
	pBW5xrenJdNsK3Y3cHJBSDuVFSHedzWHyA6fvW2gwMVtycW8hfYLSyzjhGguTl6LD63oWrst8nNDN
	Sy4BhVAGpYjxLZ7BpY1Uyd04P3KgjzJ/j//KgC7iYYWIngwYVSykYoWFTP/j8X9RQxqxw4PyKbaeP
	htDKF+d8fTaoJUVD8teGpVHSWaitLX7powQaO9HkLnpFNUcT7RZVmQQtdYZDUAQpTRtoDZjVoNe+p
	fpQvz8zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaGZ-0000000C5zB-0s3x;
	Mon, 24 Nov 2025 17:22:19 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaGW-0000000C5yq-1VDJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 17:22:17 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-8823fa3bd95so48189446d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 09:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764004935; x=1764609735; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H+dXzu+OtwVQATYT2SD8WXaq/eak4pH3LzFk0SdSmXo=;
        b=O/w0JCs4FUJN7YjAiBsYqdT8AY8FGY7qhZ8nZWD3xh6qx1ZtiZK31UnIHsLe7NB2Bx
         +MepBW91gwefdUZ+yHQCDwFZev6x/yJ3yP8+vave5V/EuFjVmkGW1g6C4L2gZqozUi3W
         5BU2537GC1s/shrKg409e9NE3aoyrcnxn9FO+fXOakThnFJdtBBaVyMl4+i/ucVZl8Mt
         zEllpD5bhe2V9xcsrduN9JGJShPiLgBnQoYCMk/BG/lbK0mt/j3BITlHl/XLMv/hNhKK
         8Zp/sZiW98iZR3lsqTI9t2t/gO2dP0fZTWycqFJkV70bMK18t/xRBx670oj1Cggde8OV
         FrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764004935; x=1764609735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+dXzu+OtwVQATYT2SD8WXaq/eak4pH3LzFk0SdSmXo=;
        b=QWK7e633LU2qHXBZyIurpFPYyoCtcbslSm1+/nrjpSOWba/OHRWlMBwOb6e2STVsRx
         8VzTFtMKlVxf39bVTzQCxE/lYtPvN38R/5UptySsfq4SBY2XmseZAR1Jr1uThqUXeAuZ
         Jhgc7/vQ/dl/FGnlG3b2i6gkOsA0VnrFtE5stlJwD6ODRrd5FHIua6kUYxm0wLpsJ0lx
         aP7vtuPEWpl2BHrvv8Mr7ba8T9qvhF7bAvHBiyBMbGMom837eaOuEKQBGiKLNnw4HlU4
         yoBbGB5G2+8lUXDo8O18roE5tY2X66FJHxSpDpFefR/9Slwg2N4OfZypfpTd9orV6Mrs
         yY4w==
X-Forwarded-Encrypted: i=1; AJvYcCVXDoDrkXAxtfQu+hMWrwFUvuKO4TYmOVvwVV9zMowTYOiv5Rb8AN3y/L1I4CTNW50Yl0MA4MHGjKbH6H1PlYxS@lists.infradead.org
X-Gm-Message-State: AOJu0YxxbitUJceZaNLL028yZq+S9jMUs4txj6O3+CIxb9a6psq4b1VE
	wT6939rZTW1bgvXyYcCRciNwY4k55EqoJcER2ClII9QwkJCErnCF7AAo5/H2JXzCIYECWZXUquU
	rQ7o1BfHG17FzKdydnywz15vl+gJT5Jj5CWr4t9U4sQ==
X-Gm-Gg: ASbGnctNi8sEJn3AkYpMRkTvk9YWec+YRS6FnDSD2OgxeTh8bLPpioCw6KnFAfS+u4H
	vRuLzIRQGpK1tJE0RRl3DZN071kzhdvx0FrGOF9yNeR9x7xETtMRIVaeCqp8z03o7et8Rxd46IM
	pFxpOKlr74k4jIe+A/2RI8dP7w3W3AmGO5XHKGlPkMldBuTuGIqsWpTBjP7FEow8XEqEdz73Pei
	J310mJUyQ7lZlIiOJld1M25X2B558vPSh7Y74z/+SpBcSUdLDyfJW58DLVFKjOwEMRlkeo=
X-Google-Smtp-Source: AGHT+IGur7qIOhwydiDE1YdricdgFBJKpzAzcrVA0e8HEfbCvBR/llLvZ/uw2OutwktsYwyQUs0eBjA/3PkYC9zPCKk=
X-Received: by 2002:ad4:5e8e:0:b0:884:6f86:e09a with SMTP id
 6a1803df08f44-8847c440274mr206409366d6.6.1764004934295; Mon, 24 Nov 2025
 09:22:14 -0800 (PST)
MIME-Version: 1.0
References: <CGME20251117073604epcas2p3f35b42617fb26aa087409eb84c19724c@epcas2p3.samsung.com>
 <20251117074140.4090939-1-youngmin.nam@samsung.com> <20251117074140.4090939-5-youngmin.nam@samsung.com>
In-Reply-To: <20251117074140.4090939-5-youngmin.nam@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 24 Nov 2025 17:22:03 +0000
X-Gm-Features: AWmQ_bk4g88xYV4Wotp3KJG1hjaYXqURmaKu-TssPY9mMy-anug4aQBTum0eDz4
Message-ID: <CADrjBPoG_omRShNhwUJZ0yeRLAzQxmGHvO6OzsR2NOfLczoptg@mail.gmail.com>
Subject: Re: [RFT PATCH v2 4/5] pinctrl: samsung: fold GS101 pin-bank macros
 into EXYNOS9_*
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, semen.protsenko@linaro.org, ryu.real@samsung.com, 
	d7271.choe@samsung.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_092216_440087_7B1465C8 
X-CRM114-Status: GOOD (  10.45  )
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

Hi Youngmin,

Thanks for taking the time to do this cleanup!

On Mon, 17 Nov 2025 at 07:36, Youngmin Nam <youngmin.nam@samsung.com> wrote:
>
> GS101 had dedicated GS101_PIN_BANK_EINT{G,W} helpers, but they are
> redundant with EXYNOS9_PIN_BANK_EINT{G,W} (same semantics, including
> the per-bank .eint_fltcon_offset).
> This change removes the GS101_* macros and switches the GS101 pin-bank
> tables to the EXYNOS9_* helpers with exynos9_bank_type_{alive,off}.
> While here, update the struct comment to note FLTCON is Exynos9-specific
> (not 'GS101-specific').
>
> One macro family for all Exynos9-era SoCs (incl. GS101) reduces
> copy-paste drift and keeps the FLTCON handling consistent.
> There is no functional change.
>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by:  Peter Griffin <peter.griffin@linaro.org> (tested on Pixel 6 / gs101)

regards,

Peter

